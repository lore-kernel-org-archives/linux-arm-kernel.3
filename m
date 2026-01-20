Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E845D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=upZyTdYXHRuOjxM2BwCRC4m8vkbpnnQvQrullGYrig8=; b=Rh3MT2VJktr3/24TIJv5DLKYkE
	YDzx7jlm92mSsmK95rkZlgc+FS8ER71MaEN1LZ9Cs9hekAsu1m6YSJzXeG1tCdJ5HsTpBeF0xS8u4
	Si7F+icHBh4TCdkYKkZbKjlQ5SDars2meQm0uFKet//xYe6tqG43IRnJQU4j9Ob+DG3YEvXKoDxTu
	jiaUBh7TKCYfeLrymxQ9Y+JfA7c2V3n7EuFZI6uot1FXpMJlAhCWjeYBEN4/b3Wb/IU1gRj4NbVOP
	x4YBXHFPIl8IQKMi4xY8k0lwThFeGBslHx1SkbjJWUuzsXhBYdBxjjzGq6SHLF1FO33s78bUOieKv
	rA562g5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBFE-00000003s7H-1UqC;
	Tue, 20 Jan 2026 12:54:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBFC-00000003s6H-0J73
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:54:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3677994f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 04:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913640; x=1769518440; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upZyTdYXHRuOjxM2BwCRC4m8vkbpnnQvQrullGYrig8=;
        b=LXYe0iziOjcZZkGz9SG7RacyULfrrpTduLsRSBMHY6sCNgfdMGthD/Qz6grVVUd2w+
         O5II6dpMfO/fcP436wyNyHCoKy5nzUiHjkVvL+cS2XSlWn91R7d1le8drvCOO/B+QnJx
         bsM2PJQJMzcQ3GEWXs0mqsFadvVABRMOVMy3VAlWDrVx6UnGD0sfWlbogvtjpdMa+3HN
         ipulQxddBn56qOpA+lKy6/R8ZbIPqen0PB8Jgb1RKix+oPlUg9L/EcDsasWnykV/3aVe
         CxcOqFFUreCpHQ3mnczvXBucyF3tPXfSZN8AMEpaAY5nupAv8uHAh840NddITtFJV8gh
         V1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913640; x=1769518440;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upZyTdYXHRuOjxM2BwCRC4m8vkbpnnQvQrullGYrig8=;
        b=CWC2GDIimo0+GQ3m5lawoonXQWUvPnT5DcEP+WVkb4dFUEVxv8NtSnRK65NLVZTtCU
         rt17N6K7eGxp+CkcX8+KqFkmoy7kzJJusL1yxIE27O/HrvNII4Z3qC4G9ZJ0dPa2k7YL
         gmNjmqMhGuq6oxg/YG9uh0BOegvMX3SzCOh/aPuzQwc4SpejUpDc46P9Hyugpmd5cqJD
         f0u01r/KHdowhp0dyLjTTZtLwZjhCSGsDCx+xvHhagjboB+OD2Bq71xptbufGBSEk0U1
         j/NxILw6dotpZv2o1huXRWttzUYuqn3H/iecCkLi1XxqaYDFjFTBzd+e7wELbUtEiOZm
         Geig==
X-Forwarded-Encrypted: i=1; AJvYcCWJnYYI7kau1EJ+Zxou5FVZRpdFfqc3UDwwVkEZHJEuAhYY2uKMs6RXr6XTYiaBFYAU0EwyBXP9wFdVCIim+7CV@lists.infradead.org
X-Gm-Message-State: AOJu0YxxayK+Aar6B1rR0gxgJNq1lS3Mb6qsd5pOZLK3H4MqVxm4827N
	AYIcii6TGYc4lWOP7HsaZrWRJBZlZ8S9g6/4/6mOViAhKX8E2lodNfiv
X-Gm-Gg: AZuq6aJFsOu1s662GNd+Kqard8evAPKybx7B+mS8EKRxNhq9O9TFpGcn/bAjsxkf9wv
	VzJl7OoP3SNFjjlfQ3cKif8jxiJVsowJ8pw1fTC/33bVrwA1bwk/Prv/AR0chutNXiTghkaA0ty
	pG9cQJCQtn1IhU1ckgbW4uxoPAf68/LyLH2rZcy3cHzLGu0S2Ll+3soXR4dSXscNd/VZMh2fv+h
	RzVpJ4pVVqIWdIS3SZ4m4u7bxzJ3jhZrzJ75EedF18+qpRYr/24Y+EPeAe8OeFGG5HENgbySt6B
	cG1DUjoq/1GbeWPZO9m6CtokVFy8O0ViL0TsiwTozyX/hWcIne0CjpTBZV9Ku7RrXJBlUVo4diG
	/tWsq5fr6EuqwcRE9Gu+jh0HC/vIaIyTf0UPhfc/7NSYoPPtDlGwByIylzNm5MK+J84kTE1cUOY
	ArpNTdO+5P4QsiP1qZkkP0dwpn6Agz3rZC3Yj01K4eSwATbc3nuc3H3jeJ8AQOIIs=
X-Received: by 2002:a05:6000:2504:b0:430:f58d:40cf with SMTP id ffacd0b85a97d-4356a02c4c3mr18942565f8f.16.1768913639446;
        Tue, 20 Jan 2026 04:53:59 -0800 (PST)
Received: from alchark-surface.localdomain (bba-83-110-134-52.alshamil.net.ae. [83.110.134.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4359314bbc6sm2404931f8f.12.2026.01.20.04.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:53:58 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 20 Jan 2026 16:53:54 +0400
Subject: [PATCH v2] arm64: dts: rockchip: Explicitly request UFS reset pin
 on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-ufs-rst-v2-1-b5735f1996f6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOJ6b2kC/2XMQQ6CMBCF4auQWTumrQRbV97DsMA6hUmEkg4SD
 endrWxd/i8v3wZCiUngUm2QaGXhOJUwhwr80E09IT9Kg1GmUVo7fAXBJAuGcPeKvLWkzlDec6L
 A7126taUHliWmzw6v+rf+G6tGjd6Sa2p3crX1137s+Hn0cYQ25/wFnfrYUZ4AAAA=
X-Change-ID: 20260119-ufs-rst-ffbc0ec88e07
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3949; i=alchark@gmail.com;
 h=from:subject:message-id; bh=rfOiA6dgd2q0nYUa0afVp2YzXs7KfO8y6Iz2Tj9FhBc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTmVz3XL1lyvd75GNP0eb61RZziFU95Xl/9JufO+euHZ
 1/TbTO5joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKZ6kgYjw5mWgCsLt615obBhzdf1sW2hq2tunGW/kRGw+7/1kR2F63QY/ns83rl
 iguGy5HC/X5uftM4tUF5Y53WUyeLuSZFLLwNOczAAAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_045402_132553_F52845CF 
X-CRM114-Status: GOOD (  19.12  )
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

Rockchip RK3576 UFS controller uses a dedicated pin to reset the connected
UFS device, which can operate either in a hardware controlled mode or as a
GPIO pin.

Power-on default is GPIO mode, but the boot ROM reconfigures it to a
hardware controlled mode if it uses UFS to load the next boot stage.

Given that existing bindings (and rk3576.dtsi) expect a GPIO-controlled
device reset, request the required pin config explicitly.

This doesn't appear to affect Linux, but it does affect U-boot:

Before:
=> md.l 0x2604b398
2604b398: 00000011 00000000 00000000 00000000  ................
< ... snip ... >
=> ufs init
ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=[3, 3], lane[2, 2], pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate = 2
=> md.l 0x2604b398
2604b398: 00000011 00000000 00000000 00000000  ................

After:
=> md.l 0x2604b398
2604b398: 00000011 00000000 00000000 00000000  ................
< ... snip ...>
=> ufs init
ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=[3, 3], lane[2, 2], pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate = 2
=> md.l 0x2604b398
2604b398: 00000010 00000000 00000000 00000000  ................

(0x2604b398 is the respective pin mux register, with its BIT0 driving the
mode of UFS_RST: unset = GPIO, set = hardware controlled UFS_RST)

This helps ensure that GPIO-driven device reset actually fires when the
system requests it, not when whatever black box magic inside the UFSHC
decides to reset the flash chip.

Cc: stable@vger.kernel.org
Fixes: c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support for RK3576 SoC")
Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
This has originally surfaced during the review of UFS patches for U-boot
at [1], where it was found that the UFS reset line is not requested to be
configured as GPIO but used as such. This leads in some cases to the UFS
driver appearing to control device resets, while in fact it is the
internal controller logic that drives the reset line (perhaps in
unexpected ways).

Thanks Quentin Schulz for spotting this issue.

[1] https://lore.kernel.org/u-boot/259fc358-f72b-4a24-9a71-ad90f2081335@cherry.de/
---
Changes in v2:
- Change default pin pull to pull-down in line with the SoC power-on default
- Link to v1: https://lore.kernel.org/r/20260119-ufs-rst-v1-1-c8e96493948c@gmail.com
---
 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 7 +++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi         | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
index 0b0851a7e4ea..7bcfa393416f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
@@ -5228,6 +5228,13 @@ ufs_rst: ufs-rst {
 				/* ufs_rstn */
 				<4 RK_PD0 1 &pcfg_pull_none>;
 		};
+
+		/omit-if-no-ref/
+		ufs_rst_gpio: ufs-rst-gpio {
+			rockchip,pins =
+				/* ufs_rstn */
+				<4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
 	};
 
 	ufs_testdata0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 3a29c627bf6d..db610f57c845 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1865,7 +1865,7 @@ ufshc: ufshc@2a2d0000 {
 			assigned-clock-parents = <&cru CLK_REF_MPHY_26M>;
 			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&power RK3576_PD_USB>;
-			pinctrl-0 = <&ufs_refclk>;
+			pinctrl-0 = <&ufs_refclk &ufs_rst_gpio>;
 			pinctrl-names = "default";
 			resets = <&cru SRST_A_UFS_BIU>, <&cru SRST_A_UFS_SYS>,
 				 <&cru SRST_A_UFS>, <&cru SRST_P_UFS_GRF>;

---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260119-ufs-rst-ffbc0ec88e07

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


