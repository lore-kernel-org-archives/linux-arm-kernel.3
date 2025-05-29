Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E16EC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6Ke6TQMJrIPkLJIi5JmxYTaZtcYoSq6WZNd77NEz9U=; b=bnClo9eNLrSk7GVUe+ZoTvnQ2L
	xdL5skxrJ94KR+YizW/0jFW1fqxtvngvjIA9BWlDvEuNQF0+Ak4HYSOHUXwNJyEaLoFXFRY95WZOE
	lWEzK6XzhmGzNnaXFd1W0vD429sVRokJzDPhP9RKvvM0fD00tWmSllg7A0gFJJ9gMlceZ3PB0vKWt
	GhcaRBf86qWbnN0hYF8MjybIM85jMT4QEQIYwStyjNCNQBlde8MR1PPxCL5+/fxv1/Lzdem+WqV1F
	u0hpKebBgUtUCKS3Hb1IS7MIgrZ448Z8ZdcRgJzvRhpFpgvup9lrpCktLaZqlImQIkQI5xrFyclq9
	sQ5mfVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdZO-0000000FtkS-0u2w;
	Thu, 29 May 2025 13:45:18 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdPR-0000000Frnj-1Srs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 13:35:02 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54TDYw9x2407053;
	Thu, 29 May 2025 08:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748525698;
	bh=R6Ke6TQMJrIPkLJIi5JmxYTaZtcYoSq6WZNd77NEz9U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EUpmVPhPAWYJhpXsg9fRTKgU66ellwSPr/TNmyxzj4LlmWS4BqiEj3UXhhYm896li
	 AmDLE3Kp9mdev2XqANDz5MrioaXTNQAK11HiIXzhJAHZqFsWPUPLoXB1FxsTyz7a+d
	 Nbbltq5ZIlVMGYPA48PtsxUOgVzM7z/+ZnyajPGM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54TDYwAm063975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 29 May 2025 08:34:58 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 May 2025 08:34:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 May 2025 08:34:58 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54TDYi8j1650971;
	Thu, 29 May 2025 08:34:55 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 03/13] arm64: dts: ti: k3-am625-sk: Enable "cpsw3g" in the board file
Date: Thu, 29 May 2025 19:04:33 +0530
Message-ID: <20250529133443.1252293-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529133443.1252293-1-s-vadapalli@ti.com>
References: <20250529133443.1252293-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_063501_473614_D7AAFEBC 
X-CRM114-Status: GOOD (  11.10  )
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

In preparation for disabling "cpsw3g" device-tree node in the SoC file,
namely "k3-am62-main.dtsi", enable it in the board file. The motivation
for this change is that of following the existing convention of disabling
nodes in the SoC file and only enabling the required ones in the board
file.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk.dts b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
index 2fbfa3719345..9c2258dfd08d 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk.dts
@@ -201,6 +201,7 @@ &sdhci1 {
 };
 
 &cpsw3g {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>, <&main_rgmii2_pins_default>;
 };
-- 
2.34.1


