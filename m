Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539A5C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csNatOIdCf+dWFsC2Ec22WGLHQHGgHjGPGYvs0F1zgE=; b=YTkQwDQxlLRdiNfvFrQ73q+5FQ
	3d4IW7xP7el9qG1aUKSq3IO4K2YnX6bnVWg3RvMS2M8xtadxbBu7tXlD/8vnd9h7ZFXv52ybiTnfc
	2bjAZlLK1FqaHnXAke2Vp3HlBfD8fdlVqySQ0i36GUrA3hPdFU4MekLNx2wwzj3EXGZXZDfPgLE7a
	PhxgsbtLrXMdWL5tGYQUNpnPRoUZF4/NLrwBMUMgx0JmDuKx70PuQQfQz0B6Viz+x6ZBVgb79DxPJ
	aCMDjwu6Ls4Ds/Un+KaY4aS53LhavwlSeqFsFeFWMq04ifGJz+RazsWFYW4WhAyXDJI65MCi6Bhvm
	ox3XipYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFyQ-00000003Jwn-0LGW;
	Thu, 20 Feb 2025 23:28:54 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFvF-00000003J52-1jEW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:25:39 +0000
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KL98la029131;
	Thu, 20 Feb 2025 15:25:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=c
	sNatOIdCf+dWFsC2Ec22WGLHQHGgHjGPGYvs0F1zgE=; b=M8CY3mo5O0hVeDfZe
	siJq37ekYYYcdCMV2qTr6ngJcgzG5OZM3y6AUbD0a7e+45gJbjlAiMm5/LIcBGwf
	Ptd/qa7YWm+UafGbj+pp4VCWa8V+9hh22eRYv1D6qe/bEHjjKK3cY88CW4DfMpp9
	MCtjTUVVCPXXCZpZYY26n4fpAIp4nrtyMoENdRNXMoDtjf0pl1IaILdvDu3ZbyIF
	gAe91ihidVX4WIjUpQb8BzDxhidOOkWqvCT9qFNH/jjOCzT4gmYu6Z0kHRw3o/i2
	P3rLVyznZRvv6KT5wXgB1vPhX9Gpc347OZXpA2Ef/E7NXnxNk6m35j0YAciG4s2c
	b5YuQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44xc24r917-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 15:25:30 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 20 Feb 2025 15:25:30 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 20 Feb 2025 15:25:30 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id E289A5B6930;
	Thu, 20 Feb 2025 15:25:29 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH v2 2/4] dt-bindings: cp110: Document the reset controller
Date: Thu, 20 Feb 2025 15:25:25 -0800
Message-ID: <20250220232527.882888-3-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220232527.882888-1-dingwei@marvell.com>
References: <20250220232527.882888-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5Rj606Czmw0BFWfCNeTiYDmdWPKP-pKN
X-Proofpoint-ORIG-GUID: 5Rj606Czmw0BFWfCNeTiYDmdWPKP-pKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_152537_564753_BE2B9AA0 
X-CRM114-Status: GOOD (  10.90  )
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

Add reset-controller sub-node into the system controller node, and
document the supported reset lines.

Signed-off-by: Wilson Ding <dingwei@marvell.com>
---
 .../arm/marvell/cp110-system-controller.txt   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
index 9d5d70c98058..5e2c2f2b147c 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller.txt
@@ -164,6 +164,43 @@ Required properties:
 
 - offset: offset address inside the syscon block
 
+Reset Controller:
+-----------------
+
+For common binding part and usage, refer to
+Documentation/devicetree/bindings/reset/marvell,armada8k-reset.yaml.
+
+The Device Tree node representing this System Controller 0 provides a
+number of reset lines:
+
+The following reset lines are available:
+
+-  0: Audio Software RESETn
+-  1: TDM Software RESETn
+-  2: Interrupt controller unit Software RESETn
+-  3: Packet processor Software RESETn
+-  4: SDIO Software RESETn
+-  7: XOR-1 engine Software RESETn
+-  8: XOR-0 engine Software RESETn
+- 11: PCIe-0 Gen.3 x1 Software RESETn
+- 12: PCIe-1 Gen.3 x1 Software RESETn
+- 13: PCIe Gen.3 x4 Software RESETn
+- 15: SATA port 0 and port 1 Software RESETn
+- 22: USB3 Host 0 Software RESETn
+- 23: USB3 Host 1 Software RESETn
+- 24: USB3 Device Software RESETn
+- 25: EIP150F Software RESETn
+- 26: EIP197 Software RESETn
+- 29: MSS Software RESETn
+
+Required properties:
+
+ - compatible: "marvell,armada8k-reset"
+
+ - offset: offset address inside the syscon block
+
+ - #reset-cells: must be set to 1
+
 Example:
 
 CP110_LABEL(syscon0): system-controller@440000 {
@@ -188,6 +225,12 @@ CP110_LABEL(syscon0): system-controller@440000 {
 		gpio-ranges = <&CP110_LABEL(pinctrl) 0 0 32>;
 	};
 
+	CP11X_LABEL(unit_swrst): reset-controller@268 {
+		compatible = "marvell,armada8k-reset";
+		offset = <0x268>;
+		#reset-cells = <1>;
+	};
+
 };
 
 SYSTEM CONTROLLER 1
-- 
2.43.0


