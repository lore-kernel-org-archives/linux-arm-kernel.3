Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861F6C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYTLXJD40V2QUBA5lQJUGgPgBRx7eVqymsySQ7bcibY=; b=p4iAAC11jlbwh0Hu8aNXPzdWjH
	fINlYqTkV3AMjqMt0y4IZrt82wqnhUvw7jlqYc5fD2H+/iqtgqiK9vRKZl7oeafSZptCQ/iGWRm3G
	w56w67jgH/v5mALL4TRg/mP/uztqTRSr6XQp8OqdfsmyYrX67Wp79N85X/eCx+LZz/wZrBG/jycaa
	gQOAjlla+CgOggeb9mvROeHj4g1zTXnonn+AI6Mv6xVrr2dR0oaWZ9ULJF1SvM8ghTEb1pNGiU8x6
	rkDWhZydV7I4kbqDLFoEmRHhO1uSZFBE9KqlUvMGFd84yHKhPnWjg8ozZvNRg4h/qwZl7HIp7GNSS
	tY8tF2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjnR-00000008fJZ-2m1J;
	Thu, 27 Feb 2025 19:43:49 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjW3-00000008S0H-4AZn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 19:25:53 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RFjKPv005358;
	Thu, 27 Feb 2025 11:25:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfpt0220; bh=b
	YTLXJD40V2QUBA5lQJUGgPgBRx7eVqymsySQ7bcibY=; b=iqKZCRayiWsTCOtm6
	MC4DlAwa5vb6bboPXL205jex4Ctny5Bm2umMCnF1La8FITfNL3OEIKb6hrfB+Arm
	AIrRf/Jb1YIlrsVlt4KKA4sramAhrxZOA0iOgwtHJyJRQQJeRGzwc53wvUu6e55e
	Rqu6ANnYijHb+vhPIo0ppugjXdwgj801+pih0i0NIxmvq4es+tKmWY0/1CCFq+eB
	yLvCVuO/QXQwNIF+8ltgz8nplgCPUfXoIqhQskujZDdouN4qv0+DYU9Xqudek5uQ
	9Nhy5mAFKbxRtgiStr3sTwowNbKKE6ftGxesOL+lXPpE6DO5WWbSmkjCcOZX+89m
	vM4xw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 452tyjrhbm-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 11:25:40 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 27 Feb 2025 11:25:38 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 27 Feb 2025 11:25:38 -0800
Received: from wd-ubuntu-24-04.marvell.com (wd-ubuntu-24-04.marvell.com [10.111.132.113])
	by maili.marvell.com (Postfix) with ESMTP id 786455B6927;
	Thu, 27 Feb 2025 11:25:38 -0800 (PST)
From: Wilson Ding <dingwei@marvell.com>
To: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <andrew@lunn.ch>, <gregory.clement@bootlin.com>,
        <sebastian.hesselbarth@gmail.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <salee@marvell.com>, <gakula@marvell.com>,
        Wilson Ding <dingwei@marvell.com>
Subject: [PATCH v3 3/3] arm64: dts: marvell: cp11x: Add reset controller node
Date: Thu, 27 Feb 2025 11:25:36 -0800
Message-ID: <20250227192536.2426490-4-dingwei@marvell.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227192536.2426490-1-dingwei@marvell.com>
References: <20250227192536.2426490-1-dingwei@marvell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: F9GJO5NrJ5WTW0ERHCE9qRfpK7xQkZIZ
X-Authority-Analysis: v=2.4 cv=UIYnHDfy c=1 sm=1 tr=0 ts=67c0bc34 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=T2h4t0Lz3GQA:10 a=M5GUcnROAAAA:8 a=DYY7cqjbEommNVqY-hUA:9 a=cX4pScRg4-JUD0_czzmr:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: F9GJO5NrJ5WTW0ERHCE9qRfpK7xQkZIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_112552_034211_5DED7292 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Add the reset controller node as a sub-node to the system controller
node.

Signed-off-by: Wilson Ding <dingwei@marvell.com>
---
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 161beec0b6b0..c27058d1534e 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -226,6 +226,8 @@ CP11X_LABEL(rtc): rtc@284000 {
 		CP11X_LABEL(syscon0): system-controller@440000 {
 			compatible = "syscon", "simple-mfd";
 			reg = <0x440000 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 
 			CP11X_LABEL(clk): clock {
 				compatible = "marvell,cp110-clock";
@@ -273,6 +275,12 @@ CP11X_LABEL(gpio2): gpio@140 {
 					 <&CP11X_LABEL(clk) 1 17>;
 				status = "disabled";
 			};
+
+			CP11X_LABEL(swrst): reset-controller@268 {
+				compatible = "marvell,armada8k-reset";
+				reg = <0x268 0x4>;
+				#reset-cells = <1>;
+			};
 		};
 
 		CP11X_LABEL(syscon1): system-controller@400000 {
-- 
2.43.0


