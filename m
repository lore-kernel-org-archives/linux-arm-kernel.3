Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52EDF483E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQ9lqP+vkDULVlRvK/58TCM1sxKvcX3Ka0Jatp81IKo=; b=FY+gDdfqAKuvHikadhFP0A3AQp
	bk83w8ybgbpeazg0vA3tiE8dTmhxHpSN+jcFIyrHbPt7JSPc3LosAhxese1notbgrNf+RRfVJO89F
	QMJiOSBu4rlW0Cl1x0MZ3oBag45rc90J+fsM2fFZWkYjMiNneeCS5IxXSRkXhMlTF61TI9iZl6OFQ
	mULuvN5IxrgUD6ZmPaZ4cu4x4m4BNdyDhxb3SxxL466eL+fTwVWE08p1Me+Z3kLhHx0kS02yzJh9b
	Qh+TdqZgkP/wovnWY9qVD3pyDJgPE02fDDDTUrLKRy8IdidrQsZLF6CmwR/rkjGlRIrUk4IeAesTS
	JKTEzStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAk-0000000HTl3-0wFQ;
	Mon, 23 Mar 2026 19:42:46 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAh-0000000HTiE-04V0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:42:45 +0000
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NH9mwq2487441;
	Mon, 23 Mar 2026 19:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=AQ9lqP+vkDULV
	lRvK/58TCM1sxKvcX3Ka0Jatp81IKo=; b=cWDTceiqiEBtUZiyfguJSPDoN0NP6
	qdYSy1vzkrc0qguOX0pWS2VYKeQlsF/7h1OOfo0n7rkki8rxfz5a5q/SIcEpDI2+
	sGzSsUu3jaiducm2iV5xbIAHU+EbMGC95RHSjxMAyrX9EqVl+oEEIdu6LJoqBHWr
	n6MXU7fA37+cOKTPYDDU1fbhi9Rg7MJ9szn04u5v/SMYsEwQNJxFTrid/wdjMNGA
	CXBsrlHsX7XokIHeDa6IeF4zj4jaryqVbZoOuStYcEJNoWRNxiNjXxGJ3TMB8n+8
	g+nS6dlmzCifws11eWjGFil+3DSHo6wEGk/vD9TpGoT8TEGJ8dQtdIjdQ==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d37ntkcxd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 19:42:30 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id A68141479A;
	Mon, 23 Mar 2026 19:42:29 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 43DD880CCFA;
	Mon, 23 Mar 2026 19:42:29 +0000 (UTC)
From: nick.hawkins@hpe.com
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean-Marie Verdun <verdun@hpe.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
Date: Mon, 23 Mar 2026 14:42:21 -0500
Message-Id: <20260323194223.683487-2-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323194223.683487-1-nick.hawkins@hpe.com>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uipwRscGisrxFkNlkED999sDUPW1OoU3
X-Proofpoint-ORIG-GUID: uipwRscGisrxFkNlkED999sDUPW1OoU3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0NSBTYWx0ZWRfXxG6a7SXsZ2Gt
 PoMVmjnsEK27z1zmBZhLWgZ8Q8jnKRe/jasXBZfwGHsAyhzxiyfjKD65rCv1IEfbTijqXhaux7R
 hKYrIRviNzpjMvJKUZV/pvbY2eoGpxdXNcbEXfPpA77dZXH7thO2Tw6gjVPW0Os+i8wCwKB/BlG
 /X1niMWuZ7ifsnXlDKMm79jA/VJyFs5jnNQPC5R/JUmBnepPi6qPJQro+YV+UR8jyz8eXH0uwqQ
 0duOzVDPnPEqc8HwuEB1OaNQX8HzGfEILqyeEVf2a4svtqHqC5pBjTlH+8tvDDeGPgBLSUoDzPu
 Yvl15d3PIQtuVdxCnPjmObsBEjY1+qdLWWpZWPCxiJF8VO+q17UGIDMHV++VRHhIMQsuhu/zuCz
 6NDCS4Q1sVbbvewTustmS8dKn0Agce6eBRVOotONLHRE5Me6Fd+VFffYu4ZKRmtwtqS+0xRE9qr
 hX12sQ64/CStGuiznzg==
X-Authority-Analysis: v=2.4 cv=ddKNHHXe c=1 sm=1 tr=0 ts=69c197a6 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=3haJ9R1Aw3gUfsUHDaCR:22 a=gEfo2CItAAAA:8 a=MvuuwTCpAAAA:8 a=VwQbUJbxAAAA:8
 a=vDgjwTgtJ-WAWVt5iMsA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124243_175917_CBF069FE 
X-CRM114-Status: GOOD (  13.72  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nick Hawkins <nick.hawkins@hpe.com>

Add the HPE GSC ARM64 BMC SoC compatibles to the existing
hpe,gxp.yaml binding.

The initial board compatible is hpe,gsc-dl340gen12 for the DL340 Gen12
server platform.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 Documentation/devicetree/bindings/arm/hpe,gxp.yaml | 7 ++++++-
 MAINTAINERS                                        | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
index 224bbcb93f95..6f057cd58571 100644
--- a/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
+++ b/Documentation/devicetree/bindings/arm/hpe,gxp.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/arm/hpe,gxp.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: HPE BMC GXP platforms
+title: HPE BMC GXP and GSC platforms
 
 maintainers:
   - Nick Hawkins <nick.hawkins@hpe.com>
@@ -18,6 +18,11 @@ properties:
           - enum:
               - hpe,gxp-dl360gen10
           - const: hpe,gxp
+      - description: GSC Based Boards
+        items:
+          - enum:
+              - hpe,gsc-dl340gen12
+          - const: hpe,gsc
 
 required:
   - compatible
diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..33e4357f9011 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2859,6 +2859,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kristoffer/linux-hpc.git
 F:	arch/arm/mach-sa1100/include/mach/jornada720.h
 F:	arch/arm/mach-sa1100/jornada720.c
 
+ARM64/HPE GSC ARCHITECTURE
+M:	Nick Hawkins <nick.hawkins@hpe.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/hpe,gxp.yaml
+F:	arch/arm64/Kconfig.platforms
+F:	arch/arm64/boot/dts/hpe/
+
 ARM/HPE GXP ARCHITECTURE
 M:	Jean-Marie Verdun <verdun@hpe.com>
 M:	Nick Hawkins <nick.hawkins@hpe.com>
-- 
2.34.1


