Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD361D262B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 07:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cCPUZnGLoUlQBF/9NTsmnTAUK8WV5r6Blkl4XMyMuE=; b=uGz7JzFzysE0sJQus+OPgCMeeD
	1DZDl1oy4Y7p6WRT7Hk2L79pvX0JQecjCR2F/Eh60SbW06TIvZ1r6+Hj8tMR+rjy4JpJOjSlhwehe
	cqY0rfAjaccdi7cof+v3IcwhAqnrrPOVuO9gJeXk/kAEjcZyWm59IyYewoy8opCjDlotycekHJol/
	1urcUGzTPk2rnBMdxsvyxKYUtJtGLE8wDcG9vrCb1UJ/p/Kstm9MwxaWvRGCtrxvKDiUC0b/tsEaa
	wLGyqjMsJiwlmdUHsMHfLjLPL3T8+eB1Kcg2cCcTuoX3KenmhDeVp6fg0gCkbyJc8cWIAXteqzVIu
	/bF3mAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSrA-000000051wb-0bBw;
	Wed, 21 Jan 2026 07:42:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSr7-000000051vh-0rJV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 07:42:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso59211875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 23:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768981339; x=1769586139; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cCPUZnGLoUlQBF/9NTsmnTAUK8WV5r6Blkl4XMyMuE=;
        b=UKZx+1LvJqcmVtCOFf+XhSOGoaBZSEEOinKIkiyD8QeLuAjcTx9yYz2WLvqmRTpBni
         mv6Ybx7+SdC6jWCtw39DJFgpvUEOgKB4Z2jCrC8/Brhi6KNpe0VP/+PcSyDoa1Mwlbq1
         ZVr5RI+rqruFxreF6lJPyGFsEKVt/SKS2+uBR8q4K8crOEDlrxj5k++WURr1eXtrJb1z
         UVlxHKmjw23+g0lz6eM021tcO7xtR+pM6nrHw67esVGbZtCi+aa8tb1zRO2z0TJfm8Dw
         lq7Ymmy4z9KL0oW5qUr6gYDsXqUMZzkjZcc5akVowbxIP4gGnyhua8Wl1H+MO1SOl8ki
         GCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768981339; x=1769586139;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cCPUZnGLoUlQBF/9NTsmnTAUK8WV5r6Blkl4XMyMuE=;
        b=fX4zDJr1DCY3vuvvhjJXf+BcRS1ZdiWTUySe7c/dETmiYUwrJNTX6MdEJnmpbNvog2
         pL6MfJvTQEBXeI7GUqU8Cc78YdjoBX3qgoAly6SwNG+McOn6865223KIweClDZMJvRY/
         whJDyNLWvFpGtCGwjBAsaH+mOiCORJ7XUNiqUgm8W6xYbGNiR61fx7DhlwooM9KkCZHk
         iiy2dje54XvecfKrSnznqvlpe+nf25BLjWKvub8Oz05XoTHkGqlOstyCgwIpcyZog6QM
         9XThbO0g3lfjSX2Sja7Ttm17jqJa3ocR6HeJrhrGcd8axWtLILsuQuLCPCHpOlbiQOVT
         XkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMo3gPhdx8utiYfJ3f1dkV7EZUCuTagPxSky/WGnH6icI15lU5PBS+eBMIQrrzjiaXl8RqUtIAghtV43LFjtzX@lists.infradead.org
X-Gm-Message-State: AOJu0YxUeTZrOew6bXG/9WNUYcfVaTMXFoor7wHxZHreFe060CT95sCx
	gmmVBA4f/Hh8eRxJpKzsWqX4V20YzF7bWZghA/uqKr0PqeYXHP/p5gcx
X-Gm-Gg: AZuq6aL59RNEpOWYMUqcqTzItw2NXuJqgUJrNxnJvJgrBVb2pRhxArS/wegeaH6dmih
	8V5d8pN0hpCxzYc70aqkS2o7lllisVEWrGMDnzKZ/2tLaVg79I+Qvzd3f5HJNcVWZe16mpR2PfX
	vY1MCgIj5lnvjiGAkNQEjS1GEgUU3GUrz4BZY7dg0GA5xdCW1FulF+ElD8hCgyV4FSdrFrkrjnF
	wj6rbXdZO/0Gh9g2ANe3UdifEXlCO/nYUR5Lo4gn7xgiwXtz/PDxEFqqsZdwmEkhRCK/NHl1abz
	BRvgoi4U3SAMqSG5nVZVsuw1uqZnOgSbN2tH/sd6FTKPxjcVQCX9tPwUomcjA/mOfcJe8SUlOVs
	cZ5vFQ3AODb+KLF1jQRcLlF2Hhp25WndmJxV+PtjFYtYryQILG51b8s3fHvzH4bTC9iEoZgeRHJ
	8BS14jjR6TYnyTdFV+x2kK768ERxOyTIcy/ZbFXlIdRNmzWiiEkTVI7OgE5YE84YM=
X-Received: by 2002:a05:600c:198e:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-4801eaadc94mr208656345e9.6.1768981338757;
        Tue, 20 Jan 2026 23:42:18 -0800 (PST)
Received: from alchark-surface.localdomain (bba-83-110-134-52.alshamil.net.ae. [83.110.134.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356999824csm34368915f8f.39.2026.01.20.23.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:42:18 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 Jan 2026 11:42:13 +0400
Subject: [PATCH v3] arm64: dts: rockchip: Explicitly request UFS reset pin
 on RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-ufs-rst-v3-1-35839bcb4ca7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFSDcGkC/2WMyw6CMBBFf4XM2pq2QGld+R/GBdQpTCKPtNhoC
 P9uYSOJy3Nzz1kgoCcMcMkW8Bgp0DgkyE8Z2K4eWmT0SAySS8WFMOzlAvNhZs41lqPVGnkF6T1
 5dPTeS7d74o7CPPrPHo5iW/8bUTDBrEajCpObQttr29f0PNuxh60R5cGT/OfJ5DVllZdOGKOcO
 nrrun4BqGEyK9YAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4576; i=alchark@gmail.com;
 h=from:subject:message-id; bh=H/Le12Y1Ya9Ys/AHE2MLwlPKgu80NfZB2AyT4Dbqvfw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQWNEd1/vFnKX7XOtVy1p1lmvIvev2rTpd0fmpM/nNXQ
 vLCtTVnOyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 Q0MdYx0jBi5OAZhq3h8M/1PUlrT1cjzd+LP2hPPHiVdrjqyKMv++LfWp+MFDKeIlvxoYGc5LHbw
 W1GfhP9fil9RNhbevDEyO6D33TZoS4bdp5St7fX4A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_234221_282541_0974A112 
X-CRM114-Status: GOOD (  20.56  )
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

The pin is requested with pull-down enabled, which is in line with the
SoC power-on default and helps ensure that the attached UFS chip stays
in reset until the driver takes over the control of the respective
GPIO line.

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
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
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
Changes in v3:
- Rename the pin to "ufs-rstgpio" to avoid incorrectly matching against
  the GPIO schema with the *-gpio pattern (thanks Rob's bot)
- Amend the commit description to reflect the rationale for the pull-down
  configuration (thanks Quentin)
- Link to v2: https://lore.kernel.org/r/20260120-ufs-rst-v2-1-b5735f1996f6@gmail.com

Changes in v2:
- Change default pin pull to pull-down in line with the SoC power-on default
- Link to v1: https://lore.kernel.org/r/20260119-ufs-rst-v1-1-c8e96493948c@gmail.com
---
 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi | 7 +++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi         | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
index 0b0851a7e4ea..98c9f8013158 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
@@ -5228,6 +5228,13 @@ ufs_rst: ufs-rst {
 				/* ufs_rstn */
 				<4 RK_PD0 1 &pcfg_pull_none>;
 		};
+
+		/omit-if-no-ref/
+		ufs_rstgpio: ufs-rstgpio {
+			rockchip,pins =
+				/* ufs_rstn */
+				<4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
 	};
 
 	ufs_testdata0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 3a29c627bf6d..49ccdf12ef7e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1865,7 +1865,7 @@ ufshc: ufshc@2a2d0000 {
 			assigned-clock-parents = <&cru CLK_REF_MPHY_26M>;
 			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&power RK3576_PD_USB>;
-			pinctrl-0 = <&ufs_refclk>;
+			pinctrl-0 = <&ufs_refclk &ufs_rstgpio>;
 			pinctrl-names = "default";
 			resets = <&cru SRST_A_UFS_BIU>, <&cru SRST_A_UFS_SYS>,
 				 <&cru SRST_A_UFS>, <&cru SRST_P_UFS_GRF>;

---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260119-ufs-rst-ffbc0ec88e07

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


