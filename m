Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06F810F2861
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9B5i30/KDHH7GOTnT0LmcZyBmyOnXeONI9jSuqZmRQ=; b=obqNaa4gNMs96RdEkYl+zqkeyw
	xPX89YE+rdrA4a+cqyF/POi2zPWXKuvygADyGRY8XHyz+C8iSJ3iiCOXYq/Zdtm95a1sCKGDaQd0H
	jtSIBdK1mE/G0gACybU/qmfLnKyehyIQbC3hFD0BNmqHbOwy2Y2uXX9C5URxp2fjrXIO1BegEEE+v
	Ibj9yZ/sWhIv7XAtpMZxJzkIMCIc/DVNxvkKk1icWZ7DM8eXURjCxjpoz3ZS/krEOboL9bK9A2p6U
	eCp4aIGMx93cLEo5u4GttiiYq36G8oMLLBNfBW4Dhf9D9KKWLh8xxqfBziNrl7hdmE4cuQxao/eZd
	YhcXazUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BF9-00000007sGL-11ib;
	Fri, 27 Mar 2026 17:45:11 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BF4-00000007sEi-1zsd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:45:10 +0000
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCdot91069498;
	Fri, 27 Mar 2026 17:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pps0720; bh=b9B5i30/KDHH7
	GOTnT0LmcZyBmyOnXeONI9jSuqZmRQ=; b=Ool4RBTPBCkzFE/nFbNl+mTC5nsAn
	uefKsdnU0+LjwwHLYy7281I1gG679SU2rVoIqrclBSy8iJy9Qot2l5Z/5Asr+zQJ
	hekg6ipT/ytZFQJ4YkNYLZeqYrKsrS00IwGIGKSXFIsr5TYelGFPNPCZniVpOUeW
	IOwCOYU6Yqk3gMKUv9+QS9zoMrbWpWWK3LT2P46joSu9OdfwKuFND4J71/+EtW07
	eDZCPDTk2CN9pmyo0t66gStogMgYGcO1uw3Xd7yRHqxRkyo4g2X+4KaBFnZNhNr1
	PGMOfYm1JIJKlM97y6I3vUlNpk0NW8VrVEJbCdnriOOdAAzWqGq0fO57A==
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d5t39kh9u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 17:44:51 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id A619EA9F11;
	Fri, 27 Mar 2026 17:44:50 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.36])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 3A429810AF3;
	Fri, 27 Mar 2026 17:44:50 +0000 (UTC)
From: nick.hawkins@hpe.com
To: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nick.hawkins@hpe.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
Date: Fri, 27 Mar 2026 12:44:43 -0500
Message-Id: <20260327174445.3275835-2-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327174445.3275835-1-nick.hawkins@hpe.com>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEyMyBTYWx0ZWRfX6dDJiwm9GfTq
 LwU5IZtVcobTaN4IUIpJg+hbseOIG4+fG4dyVjespzct27ZACDCvXiThDqcYU98FDa+spQOXys2
 xAT9Lw0jF4muIoB1aEMF6Xhl7Ft2sM1xAyBWvMkX+KHgiAhm6jfMtcUJrVqOwhnzb4I4jdwd41N
 VE1hFYqwhgodZ2hTf8XFFPAgd0q0RP2+bATQZ3v/EzxmTXsTh3p+ZljxdryiI5sfn6wr9tOLF72
 aO4Ea/NzRGPDJIE8/M8htLYVTgkUznRPqfYgNCh/6maAXODNzde9vS+k9+0zW/8yJTnZBYb/qCB
 TdQMe9bPqkvd3l4Q+DhioLpCw0BYRg9lptK/vkZyYIf1TZASDZjS7r7arGeK7DJ4hKakba8Qw/z
 GUOl7Eti6yuwZg6WNbZD53ARdgNAjiqDqO2olMpFZkfh85BRL15ju09+ZlMAesMkfdJsj69XGuZ
 6XU3hiyhPvDK863fwTw==
X-Authority-Analysis: v=2.4 cv=Kf7fcAYD c=1 sm=1 tr=0 ts=69c6c213 cx=c_pps
 a=UObrlqRbTUrrdMEdGJ+KZA==:117 a=UObrlqRbTUrrdMEdGJ+KZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=6XKncaru_qjgLvANlS_8:22 a=gEfo2CItAAAA:8 a=MvuuwTCpAAAA:8 a=VwQbUJbxAAAA:8
 a=HR7gm4R6eJ7T60OizSAA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: U3VF8hWytEHK1Fwsqd2P3bHZcPsxzRI9
X-Proofpoint-ORIG-GUID: U3VF8hWytEHK1Fwsqd2P3bHZcPsxzRI9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_104508_635466_E82D6CC4 
X-CRM114-Status: GOOD (  13.00  )
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

Add the arm64 DTS path to the existing ARM/HPE GXP MAINTAINERS entry,
renamed to ARM/HPE GXP/GSC ARCHITECTURE.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
---
 Documentation/devicetree/bindings/arm/hpe,gxp.yaml | 7 ++++++-
 MAINTAINERS                                        | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index 2265e2c9bfbe..80c66de5e342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2859,7 +2859,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kristoffer/linux-hpc.git
 F:	arch/arm/mach-sa1100/include/mach/jornada720.h
 F:	arch/arm/mach-sa1100/jornada720.c
 
-ARM/HPE GXP ARCHITECTURE
+ARM/HPE GXP/GSC ARCHITECTURE
 M:	Jean-Marie Verdun <verdun@hpe.com>
 M:	Nick Hawkins <nick.hawkins@hpe.com>
 S:	Maintained
@@ -2870,6 +2870,7 @@ F:	Documentation/devicetree/bindings/spi/hpe,gxp-spifi.yaml
 F:	Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
 F:	Documentation/hwmon/gxp-fan-ctrl.rst
 F:	arch/arm/boot/dts/hpe/
+F:	arch/arm64/boot/dts/hpe/
 F:	drivers/clocksource/timer-gxp.c
 F:	drivers/hwmon/gxp-fan-ctrl.c
 F:	drivers/i2c/busses/i2c-gxp.c
-- 
2.34.1


