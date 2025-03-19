Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D5CC36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NZqp26Qj81Nqbq92k7akAKLf/V9QkO/7fzhIx9Zdp44=; b=rUOzCONDz4JU+hjuxVYH1obbxI
	3Zn8c3BJ8vphaUbEYwW3uHskd3kEc5HSdqT07kUcGBhPDKGYgZgw1+9WX4/AYPVr5qL5fuAkJSjFJ
	Zo2UoxeBo253udw6VVcuSyWbZ/kAii0Sf6cI9uP12g4Lvbm1HDjvmeVUE/TiWBX0Lk8w4QOpDNY7t
	f50jIytknSs3c6Jtcjl6b9qMiiACbY/czUWqFkOkBZWBYtzE83W/OHcILRFE5E3XFtlSYU9X9tv9l
	GNJZht9pyVD3+YKrLZUYJBvJdgqB+UI4y2j6va1/dlzX74XQ/k77RfkO1WnTCf9KD86MVjbYOjYkI
	rMferziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turfx-00000008qAa-1iay;
	Wed, 19 Mar 2025 11:33:33 +0000
Received: from algol.kleine-koenig.org ([162.55.41.232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tureF-00000008pqz-3UXK;
	Wed, 19 Mar 2025 11:31:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kleine-koenig.org;
	s=2022; t=1742383905;
	bh=NgXaeGxC+7uR4MnVpvvGzey4eIPptRADjwnVsguAexg=;
	h=From:To:Cc:Subject:Date:From;
	b=a2fVprjV7HZl/rdZBRYqMEklnoDMRuuospdq03wo8rIcGcKryCvCKfSauGTqsmQac
	 OZJaXS/sV+aiqyNaDyx0PHX83ONqIK2bBL1ZXpUyI/kfPNFEHCBV9uLorl6Qx6p0yE
	 txcgf7LR4V5o2k7of/EjlNinSRzdxGfFY0iXxYvQ4V2imXAvrh/IDN3Iv/KCoW9+8s
	 haVmVVRpfA0HypuhDI7r6AviIIYIH73aojSRWmCCnjxNcwyV/Utm62ntvVKsdS74iI
	 NuZjsNAT3FiVCiV7nMUYzEVjyRH7erpsR1SlRp9dJReSqY7wH6S6YNy6h1CWCRrqsq
	 Hxa1zcLYgeZCg==
Received: by algol.kleine-koenig.org (Postfix, from userid 1000)
	id BBA5EFC6421; Wed, 19 Mar 2025 12:31:45 +0100 (CET)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: ts433: Add pinmuxing for eMMC
Date: Wed, 19 Mar 2025 12:31:38 +0100
Message-ID: <20250319113138.125192-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=uwe@kleine-koenig.org; h=from:subject; bh=NgXaeGxC+7uR4MnVpvvGzey4eIPptRADjwnVsguAexg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn2qsbJHYdXM0d0aQbA1FFZuw1eiLFwFe3Y+sBO daSrDnrgMOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ9qrGwAKCRCPgPtYfRL+ TuF6CACOXo7X4VMq5bPJ8hv6L9zADnu8GRCVAFmCIxijRN4ZEK6QfrTwWje3UQ/xWQvvHYAnXOO BU/NtN2e2CuF3G8gN6hOywwCQRzDuSoEbUUH5dAocJjSXQa/LXlfG0G7JAvr+rsldwrCf/TmGmn Xmf4XfPtZz9svXybEFlGK0nz47QbmZg32eFyVe9S6JljfNs00iPRs1nVS04C9uKFnAxK/eg/cm6 CU84nfDG+3P2x5wMQaHw/nGF/r4xBQecGY8xvRyon3ZJa7955n8feRWHCUYHOtA0eBd39PgI8ak lVljq39W3SOuFoewfzepk+R+IRAxJe0qH96OJ9Ay4LMNQ4Vh
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_043148_013436_A6F37F40 
X-CRM114-Status: GOOD (  10.93  )
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

With this added barebox is able to access the eMMC even when booted via
USB.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
Hello,

I tested that on top of v6.14-rc1 +
https://lore.kernel.org/linux-arm-kernel/cover.1742331667.git.ukleinek@kernel.org/
but I guess git can apply it just fine on a different tree.

Best regards
Uwe

 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 411f8ac7994b..6ae4316761c4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -630,6 +630,8 @@ &sdhci {
 	bus-width = <8>;
 	max-frequency = <200000000>;
 	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;
 	status = "okay";
 };
 

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: 827ca0888cffe7cc82a938969cbe145d33967157
prerequisite-patch-id: 7d29172f7269dcddc26b0c6f08c4f1361a1fe0b3
-- 
2.47.1

