Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC89AF483EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pFb1z8ApkWo0l8jCpuiU3l/hLFv+9oERF7ouMdatP8E=; b=K8LQV4M77CKkHapB7QkV9apfId
	7GlipmJMQY3imitIRhk3hajPSpphhbT340IiW9iAfo+9WQ6ta0e4/+6QsWv0vOOnjOTblpjwzwcDE
	vnH9Z2ap0fOhD76dflXahxx7EzfPgPAQ4KFosM5a6YY8aCworAWWREB1BUdPOlmL4BHCSc8oaDb+o
	un1ie/6ZbXcBmdebKEp+7l6moSGaqtBviFe7atjrqSsVzC3bWU51yG1Iu1G370O9GipUVEQlFc1zT
	7BXl1Q/XzRrWLY9omjX9x/dZImDlKRpeRqEKpyL+BVUw04t6mC67IcORM0kGwlmzk7uWzFD8pN/1G
	CFdfua3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAl-0000000HTmA-0jLu;
	Mon, 23 Mar 2026 19:42:47 +0000
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lAf-0000000HThD-41bq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:42:45 +0000
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NH9it82143527;
	Mon, 23 Mar 2026 19:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pps0720; bh=pFb1z8ApkWo0l8jCpuiU3l/hLFv+9oERF7ouM
	datP8E=; b=TcnHzo93bkf6XZUAl2BzboPpKaEagWRHtDoL+fnxAsOVs/6Fjqaj3
	O2b/jB4yujL9dwAMclMYc/LDOD++Tpov6sepNJQNNEFycdnR6ROsedZw02Nnx3BM
	cQIlOBcNSrNnVK7O95O1swSskUa2jhlZggKR4iPEPhV4t8h/QOQ+hNSvomWa/LDK
	0OfqMKTeg8rIhUTw/6b9k62kXz9tnDcUajOC0sisCtcTGLJB2Oy/1iKyTC56Txd8
	qCK+PmQgB52v8Na2tP9Oq1g5kvlTn904Lsl9tsQIAv4jDyVpDtr5gUYyn5xXzvZP
	cwzPe0Ie4tCgyMij6HUIhhrjGl252UtKg==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4d33x2xbqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 19:42:29 +0000 (GMT)
Received: from p1lg14886.dc01.its.hpecorp.net (unknown [10.119.18.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 4C71280163D;
	Mon, 23 Mar 2026 19:42:29 +0000 (UTC)
Received: from hpe.com (unknown [16.231.227.39])
	by p1lg14886.dc01.its.hpecorp.net (Postfix) with ESMTP id 6900C806B5F;
	Mon, 23 Mar 2026 19:42:28 +0000 (UTC)
From: nick.hawkins@hpe.com
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jean-Marie Verdun <verdun@hpe.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nick Hawkins <nick.hawkins@hpe.com>
Subject: [PATCH v2 0/3] arm64: Add HPE GSC platform support
Date: Mon, 23 Mar 2026 14:42:20 -0500
Message-Id: <20260323194223.683487-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0NSBTYWx0ZWRfX7A3Xk6GEaj8a
 L93ySiphLkKEAc5xxK33ZMJnbEXwxlnyuQQWEGeJ4M4Kc/yLE1W3hgFvcRTFc48YPDjI19srs1v
 +vKnMIbtKY78eDBlzmorzycHK9bnPP42CVPZ69fb/aEXYjW+HQYatfqpVTGkVlt3g7qPiaEktjD
 V3M0xFGhbzdGQcp1az2sQBCor/mY83a/y9lwU0xxRoGix3sXWn5G3diYATeTs8NcnKSzdzmCXM1
 FxX34IUFq5wf4KUwFA6XeuExDSOUHujJZXrhm+N6bRmb3QqNW2Q61WH0yPdgx3aIV2ObREbJiSN
 4/nlNWWZDWzmnDDWH8GSDK60/ul9nkHW08SudPUiysm8qXsE+oUbxpnYn2b8CtKudr9iakbOfSX
 BsmgMfpxuUhqOJU3NcvGgqa1+Tej0mXCvYgi/u/deyteouFkt7geKZ7kPsYTMdP3UDQ6KPj/VDR
 YYyDSwBk9sbLi+CqfKg==
X-Proofpoint-GUID: sJUsmpsXHie4aD27ZLUFcu8ylPAVmqsi
X-Proofpoint-ORIG-GUID: sJUsmpsXHie4aD27ZLUFcu8ylPAVmqsi
X-Authority-Analysis: v=2.4 cv=X/Vf6WTe c=1 sm=1 tr=0 ts=69c197a5 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22
 a=g3u0LPWLDYfGfufhFw6-:22 a=MvuuwTCpAAAA:8 a=MGLm-9nv1a_vww38N8wA:9
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124242_974513_A70A0C9B 
X-CRM114-Status: GOOD (  14.25  )
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

This series adds base platform support for the HPE GSC ARM64
BMC SoC used on HPE servers.

Patch 1 extends the existing hpe,gxp.yaml DT binding to cover GSC-based
boards (per DT maintainer guidance: one binding file per vendor).

Patch 2 adds the ARCH_HPE_GSC Kconfig entry to arm64/Kconfig.platforms.

Patch 3 adds the minimal SoC DTSI and DL340 Gen12 board DTS.  The
full peripheral set (i3c, ethernet, etc.) will follow in a later
series after the relevant subsystem drivers are accepted upstream.

v1 was submitted as a single patch containing only the DT binding.
Based on review feedback from Krzysztof Kozlowski, this v2 expands to
a proper series covering the full base platform introduction.

Changes in v2:
  - Drop hpe,gsc.yaml; extend existing hpe,gxp.yaml instead
    (per Krzysztof Kozlowski review: one binding per vendor)
  - Split into three patches: binding, Kconfig, and DTS
  - Add gsc.dtsi + gsc-dl340gen12.dts
  - Add ARCH_HPE_GSC to arm64/Kconfig.platforms

Nick Hawkins (3):
  dt-bindings: arm: hpe,gxp: Add HPE GSC platform compatible
  arm64: Kconfig: Add ARCH_HPE_GSC platform
  arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12 board DTS

 .../devicetree/bindings/arm/hpe,gxp.yaml      | 11 ++-
 MAINTAINERS                                   |  5 ++
 arch/arm64/Kconfig.platforms                  | 18 +++++
 arch/arm64/boot/dts/hpe/Makefile              |  2 +
 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts    | 18 +++++
 arch/arm64/boot/dts/hpe/gsc.dtsi              | 73 +++++++++++++++++++
 6 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/hpe/Makefile
 create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
 create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi


base-commit: 3f4a08e64442340f4807de63e30aef22cc308830
-- 
2.34.1


