Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F922FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKQRvM+woDu6KBLreGPcHmP1j9kbXpV/WZYBI8HqOII=; b=q1qQ0hfeoaIaLw8686tJvIeFkF
	I6TCXXWnNspkqUrYMdYzEeTI1IGESJ/UF1FIue95sE6nL7fh1T0S3anCkA5iW/YPr9//i4a07Ug0o
	KKsPw0hdzvTqP1x1+EROpx6aKdn+hmxWFDJfiMjnrnc5UDVPpZivW/ATRFB9BHnwQQcriCNb1h1Ar
	KQofwKYfWXjqYhjZoL6c+6pCWyurTLBCE12v1J27x8KB7w4oRFropgHUQJ+xGp9py+ir0GTjhiUVf
	2hgPzkAKL7/V3cUyHMHbC13aS0JlJF7TPHiuWxn2xbDc6Qqnp7YhxVj2b1Ku4PFCWiTXHJIeIuc9T
	2b7fSTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoiS-00000002CQd-2iL5;
	Tue, 28 Apr 2026 20:07:32 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoiP-00000002CLL-3K2Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:07:32 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12c45281a06so16320402c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406848; x=1778011648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKQRvM+woDu6KBLreGPcHmP1j9kbXpV/WZYBI8HqOII=;
        b=O9tYjILjux12o0ACRbUNDl17rG8nalo0mWRoIdkJzcQvnQZ8W0uJDJaoz5ZXtSgKOi
         KFJuFNOI0fOCU1iBEvBI6yrYqnw1zgUdxY8W5JSTdoXk5eoPTtJSWEhs4NWe0jukszEP
         ge+l34Kxf8Oh6wa/qxPFNCsgJsYuAxQdGllkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406848; x=1778011648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKQRvM+woDu6KBLreGPcHmP1j9kbXpV/WZYBI8HqOII=;
        b=bgW+M1cVKfeiufwbCcEE80R0nP3oRK7V+A7YZbGt3CqZeGrPzRdDFkQFWGckdE/6QJ
         OpprpJ3ZuYBgBk97TxeBHRPBLPoK2R1yZc5T0iD9e90aZCn/rWfMxI0Ae2y4MGSwtNcz
         gVMpE3SKxwmCwR4FQpMrOcWsyY3otW8TIlb6uc9eoHNwkqiTid9A9lW6Il3UmX+rc84r
         MMHUw7NBZP6gJXYGjtwMNgqhknQ9/GvDN7aIIRtfEXTrSChKTQ15tgkwDCOkng0F3K7n
         vzDV7Srr0rwWml/0k4+o/G88O3LRjYkLvBV98c2duuACGcPE9nCF3y6htag5o6Dl9wY1
         FB+g==
X-Forwarded-Encrypted: i=1; AFNElJ/WKLmRe4wQCopv3ZSAvXssEL7mK62mfxWk38lIwVNho1pJT4Ml+PW4uw6+zQoiUUBjuA2FNQo3/Gfz4KxsRbY9@lists.infradead.org
X-Gm-Message-State: AOJu0YylWX2TczA2ZIdonRI/jMaruhe9hippZNivSMbYfq907fB0fRJa
	z0mbaLWqfXoDu/4Q38zZ3j7ovA/mDvKjro31V/mVBGksFCxYQXyYDIzzOCpP1RwrLQ==
X-Gm-Gg: AeBDieuAU4o0HuCITOnApQ9B3qZCwahZ/zfp5/mjqv8yc9GNEh0KQQdyio5bW5bEuio
	7bpa86D972NuUCsMWMAXn/+zQ4SCx2RsPzsxPPGiTOShcQ+i0reFgKCOtokF4GSAEYlZMOWNj3b
	CnhxcbviMNeTI/5CZfHLd6tOf8NDIxbUekmPJe1KXgH7/CnNH3bCVtzSw1JC8TI3u/w9YnBwE8K
	Btm7OPErYtTWDY9V50Ze7dlz8Q+NYXa+aEbE/MQkXJZhN5TMD9gunJJDiLw1QC/k7nPq5+r5Bey
	jlszWopwnig0SAA954pHV/+xFq7Xcz1jAaGkTwuxx2JhArh4ci4glsvUy4QKWeKsK0XaMmvRNuK
	7FFOZi1nprxDnwX+jPGgtgp0ZKsWVi7emj4aNbJVacTPdiWZs++QDgrnHqWRfzDUtdXJlYpXB4E
	3zBKq45UGYsiho9XEP+VT0yasoTBPgY8pxJQKFsYlCkfy3M9358Qr3GifzEXzLwCov1LUFIokd
X-Received: by 2002:a05:7022:fe06:b0:12d:de3f:d84d with SMTP id a92af1059eb24-12dde3fdd97mr1431757c88.38.1777406848179;
        Tue, 28 Apr 2026 13:07:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd93abadsm2784062c88.6.2026.04.28.13.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:27 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs
Date: Tue, 28 Apr 2026 13:06:52 -0700
Message-ID: <20260428200712.2660635-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_130729_925253_D76577D6 
X-CRM114-Status: GOOD (  17.32  )
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

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

  ## From a RK3399 Gru/Kevin Chromebook:
  # find /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware
  /sys/firmware/devicetree/base/firmware/coreboot
  /sys/firmware/devicetree/base/firmware/coreboot/ram-code
  /sys/firmware/devicetree/base/firmware/coreboot/compatible
  /sys/firmware/devicetree/base/firmware/coreboot/board-id
  /sys/firmware/devicetree/base/firmware/coreboot/reg
  /sys/firmware/devicetree/base/firmware/coreboot/name
  /sys/firmware/devicetree/base/firmware/chromeos
  /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-storage
  /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-size
  /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-offset
  /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
  /sys/firmware/devicetree/base/firmware/chromeos/compatible
  /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
  /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
  /sys/firmware/devicetree/base/firmware/chromeos/name
  /sys/firmware/devicetree/base/firmware/ranges
  /sys/firmware/devicetree/base/firmware/name

The /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

This series adds appropriate #{address,size}-cells to the device trees
used on Arm Chromebooks to work around the problem.

Note that Google provides bootloader updates for some devices that add
{address,size}-cells [1], but these are only delivered via Google OS
updates. Not all users receive Google software updates, and even if they
do, not all devices still receive bootloader updates from Google.

This problem was first noticed in OpenWrt, where some Chromium-based
routers ran into the same issue:

https://github.com/openwrt/openwrt/issues/21243

Relevant OpenWrt fixes: https://github.com/openwrt/openwrt/pull/22951

There is also discussion at [2].

I've currently only tested:
1) the aforementioned OpenWrt routers (with non-upstream DTS/DTB)
2) RK3399 Gru/Kevin Chromebook (patch 1)
3) Qualcomm SC7280 Herobrine (patch 7)

I assume the others should follow the same pattern. I don't know if I've
covered every relevant Depthcharge-using device, but I've made a good
attempt to identify them all.

I reviewed Depthcharge code history and found that this problematic
bootloader behavior dates back to at least 2014, with the Tegra/Nyan
device. Older devices may have similar DTB structures, but I'm not sure
if they have the same address-cells problems. In any case, these changes
shouldn't hurt even if a device was not affected.

Brian

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

[2] [regression] of: mis-parsing Depthcharge's /firmware
    https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/


Brian Norris (7):
  arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based
    /firmware
  ARM: dts: samsung: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based
    /firmware
  arm64: dts: qcom: Add #{address,size}-cells to Chromium-based
    /firmware

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi           | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts         | 5 +++++
 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi         | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
 arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi          | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi      | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi       | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi      | 5 +++++
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi       | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts        | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts         | 5 +++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi        | 5 +++++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi          | 5 +++++
 18 files changed, 90 insertions(+)

-- 
2.54.0.545.g6539524ca2-goog


