Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0CFC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wEjY10yWPqOIxCzS+748nVAC7CIJtj2SuZkNNhW59Ds=; b=HkM+AF0QfOdZ4kM/fXCsIrBfd+
	UwcSnGlF0JZqxOkkrvZjCkOYWtb33bx2e4Ega8YsVSRYArsVod8mn2H1O8x83MYU5X8h3CQgjpZkm
	mR9UJywRPa4V7ZnTZe/zrHrhXxl7ApZXmjI2iRRM4BtREEuPuDZjlAhG7K+GWRLCHfX5Fe3QiX2lj
	mlOgF51t+KAJmvLLP4GfZLkxusoXexTGXfIVkTvo7A17L29NoLmZvBOMnrGMHgq7j/Ljx/X1P6Mga
	1pJUkJTXa5EdXLV+AemaTOQALO5MRSAV6zMu8Dt64Gr8AfzTkj9USjuGCf6SlipP/fO4ZmkM5GtNh
	O9S+sFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tOc-00000004Hqm-2s1q;
	Tue, 22 Sep 2026 05:50:26 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tOa-00000004Hq8-42LS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:50:26 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so3311424a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056224; x=1790661024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEjY10yWPqOIxCzS+748nVAC7CIJtj2SuZkNNhW59Ds=;
        b=VV/8MDTITi3NOwLIQef5V4l7y76+DI6cJnER/sPEQQRtEudOFd8eCp/zK06aA4D+Lv
         aGi1Zxil6UYR+ycNVkGmwNKDfu5SzwatfysR21H1i4ZnWXktemgSZDMIwTMXr7A9YMwF
         J7rfXFpHXgxMjUsXxkJxFXlCwdpIiUPYaNYPljor49N31yNcaTspr4pNHywnJ247C4Jb
         OHUHKenBpqz0ZmNRF6H/hTa6SsUbzKhm9X8nsOok6a5mr+xGRO1OLaXLRbjxWYotCXTx
         8w89YIR4A09oBX7FKQZvBCwBlJz0dB/Grp8uW8npAk3AOI/VEsYfhwO6xh4ZH3QFWJYQ
         sRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056224; x=1790661024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEjY10yWPqOIxCzS+748nVAC7CIJtj2SuZkNNhW59Ds=;
        b=p/S0cRGz6KaA8vONAsirIaODG0ytfA3ZhEPOijAVySgZ2u2dmGpVBtLhkbUE4bIq8g
         6mT4a6Em/XyDsY2rcKAys91DcN0KeO7qW4C53vBKQGioXgE4ey5VDgjIHz2P+vGsHgUs
         Q9LhaLP2t0/yQFGtNDZ8i9gsKqlrMqFkkGbZbF01Wtq8fbq2uLVPr5eA3Il/9I1XrquT
         w9zMXm8NMvEL2G4g8E0Y4BjI0V6SalavXWgQKDmoh+rw2U84Efs06wXoYF+beh22iS9w
         YPmF7JrXHKNizejRvn9ClI/84FWLiDjJ4RoqvOZWO9Tq0+NarBPEGZQf+cRfguOfvKp8
         /SOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuAswDho4B3Kb+Iskq87DR3KAWBqrPvOvRnfnXPc5eXzZWNNH0RxVsVxQJOEhv89oEIACtbNSHfRNVFGeMNc+1@lists.infradead.org
X-Gm-Message-State: AFuF++mJdErwTXmle8OXIVsY49DH82e8sGr0qWL2EMNJogQRLoGbtWBX
	EDEZ3DHoOWKTl6SqXYCNRBe4CCYTsbv/9lZCLSdyX2RsZXdDk9bonG30VZTGc46djyY=
X-Gm-Gg: AYBFou3PgcZv6C2WdOoZwulltfXkSQLwBv0QVa+X9+be61aUjbDOnJXflX+8UhyfKar
	sNXSx54U9VY9qJHo9/ICfEuw4aEl76YVpjmpHwVa7OjJypUUGz9SMzfezxxmht0OyEiNpYtBPac
	wY4xkIrPvV/48x4gGqjieWgHj508I840E0nsEx4vkpIMvgZaKEiAaIaW3F0OjwJujEqjqtn7bmL
	WMUweU63s6s9uV603PE8eAksLQZRF6yeta+pPg0hh1UeWOqrvINedmGL8OGiTJiEYMuKnZYUMJQ
	iqjMCZxfROaBsXTgikHIb1/isjTe1ZPtBK+4VuEM4G9uhuvhkdCcXAiJ6uPwoavticQvkglOaJK
	59872CHD3zAQTofj+8H9LhAssERf1mZadOvIScNBybctSM1zjkk++hNaQCHM3lWHkOucI770kcG
	uFki3+bK6nE3LMyO8XL3g3Mv4VcamVGevYmFWli1tvuTw33/CYknn3mYB/aZT0D+dWPRKLFnXB3
	XD1D986dbQ=
X-Received: by 2002:a17:90b:586f:b0:3a0:519e:dac4 with SMTP id 98e67ed59e1d1-3a07321fb38mr69642a91.45.1790056223883;
        Mon, 21 Sep 2026 22:50:23 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e612708d6sm2078247eec.7.2026.09.21.22.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:50:23 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Yaozhong Li <yaozhonguwl@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Tue, 22 Sep 2026 13:50:10 +0800
Message-ID: <20260922055011.14972-1-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_225025_027986_0812E435 
X-CRM114-Status: GOOD (  18.63  )
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

The SD slot on this board stays at 50 MHz with 3.3V signalling. The
sdmmc node lacks both a UHS capability and its vqmmc-supply, so the
kernel never attempts the CMD11 signal voltage switch. The vendor
shipping firmware device tree declares sd-uhs-sdr104 here and points
vqmmc-supply at RK808 LDO4 (vcc_sdio), which can switch between 1.8V
and 3.0V.

Declaring those two properties alone is not enough. vcc_sdio is also
listed as the vmmc-supply of the WiFi SDIO node, and that consumer keeps
the rail from being taken down:

  vcc_sdio: Restricting voltage, 3000000-1950000uV
  mmc1: error -110 whilst initialising SD card

Using the same regulator for the WiFi card's power and for the SD card's
IO voltage is inconsistent with UHS-I operation on this board. The
vendor device tree reads it the second way: there vcc_sdio is referenced
only by the SD slot's vqmmc-supply and by the io-domains sdmmc-supply,
while the WiFi SDIO node declares no vmmc-supply at all. The WiFi module
also remained operational with the rail at 1.8V. Its own IO rail is
described separately and is left alone:

  vqmmc-supply = <&vcc1v8_s3>;	/* IO line */

That property had no effect for several years: it was added without the
brackets that make it a phandle, so it was an inert string until that
was corrected.

Drop it and declare the two properties the SD slot needs.

Tested on a Firefly-RK3399 running an Armbian 6.18.45 kernel with the
board-local device tree blob. With sd-uhs-sdr104 and the sdmmc
vqmmc-supply in place, toggling only the sdio0 vmmc-supply property, in
both directions:

  with it:    mmc1: error -110 whilst initialising SD card, then
              sd high-speed, signal voltage 3.30 V, 50 MHz
  without it: sd uhs SDR104, signal voltage 1.80 V, 148.5 MHz

Sequential read goes from 22 MB/s to 60 MB/s with a 64GB SDXC card. WiFi
remained associated at 5 GHz, -50 dBm, with no kernel errors.

Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
Notes on testing, which does not belong in the permanent log:

The DTB built from the unmodified mainline DTS was not runtime-tested
with a matching mainline kernel. Built from mainline DTS and booted with
the Armbian kernel available on this board, it hangs in early boot,
before MMC initialisation, so nothing could be measured from it and no
claim is made that the patched artifact itself was boot-tested. That
baseline failure happens without this change applied and is independent
of it. The DTS was compiled and the resulting DTB inspected.

I have no schematic for this board. The claim about what LDO4 feeds
rests on the vendor firmware device tree plus the measurements above.

The analysis and the commit message were drafted with the help of an
LLM-based assistant (Claude Code), cross-reviewed with a second one
(OpenAI Codex). The device tree change, the measurements and the final
wording are mine.

 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..7cabbc1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -777,7 +777,6 @@ &sdio0 {
 
 	/* Power supply */
 	vqmmc-supply = <&vcc1v8_s3>;	/* IO line */
-	vmmc-supply = <&vcc_sdio>;	/* card's power */
 
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -804,6 +803,8 @@ &sdmmc {
 	max-frequency = <150000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
+	sd-uhs-sdr104;
+	vqmmc-supply = <&vcc_sdio>;
 	status = "okay";
 };
 

base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.55.0.windows.3


