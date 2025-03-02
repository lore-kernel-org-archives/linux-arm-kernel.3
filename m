Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4889CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3nSz0Tm/9ALfIco44Ttp6VO9zHRPvQciCEJvIO+PRY=; b=K+/zH5eGjrBGi1KCbRF9lZL3o3
	tt1YHlqRjUK+AlLHcWYGBkfRurFL3GgDPt9ck+JD7KQnamAo3llIiJ3jZJ91MqfJsQfy5Dmf38/Sn
	dRrKrKNvdN2Z7lXXXrU0qwR3XkKdpSL4TtWKGiJL6JIWClpTIg2PXxK7YlQ1KaZF7fTIe1fRZ3u8s
	qcTROjhpdDlsQbfQDjFh2IwKEeP+qj2GGSKHzKb05EwABQOv6W/tYD7t6yTmq/+pwaQYrXQH1QBUS
	guwN8MSLxvc1CZuHf22BorJYxEAew9LgPx9sRycbNcEExDqcBtanepTRcqQtOcJrMxITKKmAf0eMo
	QI+jOZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tos4F-0000000Gm7T-2Vbi;
	Sun, 02 Mar 2025 22:45:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tos2g-0000000Gm4M-1Gqq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 22:44:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-390eebcc371so1190731f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 14:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740955452; x=1741560252; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3nSz0Tm/9ALfIco44Ttp6VO9zHRPvQciCEJvIO+PRY=;
        b=J1+7HDGaRCW6owAn7DAEqjrrhn3IavAZ1pGOF26joN3mgkiyJLawq9388exoNdmhGR
         6P50cU7TMbLvLN7S9UrIs/sPDeX4+n1MaKgBYG3RQEwbq+uw53RitrzuRqlOta1YU5Gf
         SSTPF1KQni37AMGK4Iz99KSL/5ZlO2n8KW9sYEWolCbTlarWi2mQ6TDfjPjks3tBsbLZ
         jzV2sSJNAv7CL9xr+/+JUuCBzyDUIIUYZkLm5nL+4DuNfVnFseEp1s/w4eV8Iv/Avnya
         Gzy1K0xJUvkcHxHdp53qb9WMcQs+qwDpxfVeQzr+mdKL/nXl+1mytKOfepbjq14UDoX1
         fV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740955452; x=1741560252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3nSz0Tm/9ALfIco44Ttp6VO9zHRPvQciCEJvIO+PRY=;
        b=wvmrDtIBEXX0U8v8VOGcgHBOYJhrjfDywWVhSXRwzJ5B8m/+79NWJPhbc+ER4xQyqC
         C/9eQdc+XOw4TZUdT3/gYXk/3sMCBp3fS2/apobN0p0wTvY4mpWo1581qYPxbxAeinTn
         s2PfqONHIWq4K+HE3q4xnTMC4fc2HWEyLDJkrfmH8ma2kQM6KlrXn28TON3Z99DEHRrP
         Lw/JJKSqBGr/F5sbTt8KvmU/dLJ1PSAkFqQec36QUFwT2tr3OVEnrwd2d4rZYBaTHKfA
         WChPCprRk5BOfv6vEtNO/TvyXSMs7tfcTUp0CVxeUc3jLaIo1BTKQ+wetNGH3frMOkSN
         JIPg==
X-Forwarded-Encrypted: i=1; AJvYcCUv+IA/yD97UDvtJpc1v3iwWM9jjce2bvGKtqqO+Do1rsI6Se/w1u1Ih4VFolank6BBVf5Ye0zxj8CuCSUJLzNn@lists.infradead.org
X-Gm-Message-State: AOJu0YweJCIM7rz3TcPAqqhag5oRuIIh2XFkw+4F6ocn5HF4FMMv8nBm
	3b1L2/HkyUg45vdZfjEdnp/wQ4xvQhHgo7Qpka6zaH6rHCcjN3aG
X-Gm-Gg: ASbGncsT5VHQp3lCu/SEu7lWZqIzFfY3tBRbNLahdpLMeXsV6beafNoO2ZYdIRAigAA
	KvzLf6yXvwzHUdcToudOGnSR0g1UJfCM0QIeXV4VY0FoJbTA9pOii9+0J//+1ZItuLcKJYimN3j
	7mlJpZPs178JWRTi+CFzK9DwMq+8qRqtEKlpOyrg5m+YXSWyvBk/Zqa9A0mjr4reJu6D00aVGRw
	p6rQXk8NXN+ByNfI72lXolbZ1BtArMRCFS+CsCsx5r7FcoMrvbnoYfMVqoC7eXF+JShwLK3GqSq
	FgQ77Y0iUOwvyXAHEmiM3lxwilZFX3Z9oGiCn3ijyg9vWToC4S9uXn0LYhuvzMzGQ8u8LSfVDmz
	CsErcYMFWeRL72h9Pzn8=
X-Google-Smtp-Source: AGHT+IFSwDgCyqBHbrq2Yl2rg5agQteOsniIG4r4DpFhXYFaxZR5xy7+52k8VXpQGVa6zUoKmIRgVw==
X-Received: by 2002:a05:6000:1789:b0:391:ba6:c066 with SMTP id ffacd0b85a97d-3910ba6c216mr967773f8f.35.1740955451848;
        Sun, 02 Mar 2025 14:44:11 -0800 (PST)
Received: from [10.13.13.3] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844ac6sm12407954f8f.71.2025.03.02.14.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 14:44:11 -0800 (PST)
Message-ID: <01775d74-d72e-4a93-8a02-c13f7365d385@gmail.com>
Date: Sun, 2 Mar 2025 23:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: sunxi: h616: Enable Mali GPU
To: Andre Przywara <andre.przywara@arm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
References: <20250221005802.11001-1-andre.przywara@arm.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250221005802.11001-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_144414_354613_18363056 
X-CRM114-Status: GOOD (  32.72  )
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

Tested this on a RG35XX-H (H700),

launching glmark2-es2-drm completely hangs the board.

No kernel oops or error messages.

Philippe

On 21/02/2025 01:57, Andre Przywara wrote:
> The Allwinner H616/H618/H313/H700 SoCs contain a Mali G32 MP2 GPU. This
> IP is from the Bifrost family and is already supported by the panfrost
> driver, so enabling support for 3D graphics on this SoC is rather
> straight-forward.
> However Allwinner added some bits in the PRCM block, that control the
> power domain for the GPU - on top of its power *supply*.
>
> This series enables the Mali GPU on those SoCs, by first introducing a
> power domain driver for that SoC (patch 1/5: DT binding, patch 2/5:
> the actual driver). For the Mali GPU to work we literally need to flip a
> single bit (the BSP does this in the bootloader), and this full featured
> power domain driver is admittedly a bit over the top for that purpose.
> However it seems to be the right thing to do architecturally, and while
> at it I added the other power domains (for analogue, PLLs, and the
> management core), even though we won't use them in Linux and they would
> be always on. I have a simpler version of the driver which just covers
> this single bit controlling the GPU, please let me know if you prefer
> that.
> Please also note that this supersedes an RFC patch I sent a year ago,
> which included this power domain in the R-CCU driver:
> https://lore.kernel.org/linux-sunxi/20240225160616.15001-1-andre.przywara@arm.com/T/#u
>
> The rest of the patches enable the Mali GPU on the DT side: patch 3/5
> adds the compatible string to the Mali DT binding, while patch 4/5 adds
> the purely SoC specific DT nodes, for both the power domain and the Mali
> GPU. The final patch 5/5 then enables the GPU on all existing H616-family
> boards.
>
> There seems to be an existing problem with powering up the GPU, after it
> has been turned off by the kernel. Chances are this is a problem with the
> proper power-up (or power-down) sequence, where clock gates, reset lines
> and the power domain must be asserted in a specific order.
> A workaround used so far downstream is to keep the power domain enabled,
> by ignoring the power-off request. Observing any assumed "proper" sequence
> is a bit more tricky, since there is no Allwinner specific glue driver
> or anything, so things would need be changed in the generic panfrost
> code, where they have the potential of breaking other Mali users.
> I would be interested in hearing opinions about this.
>
> Cheers,
> Andre
>
> Andre Przywara (5):
>    dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
>    pmdomain: sunxi: add H6 PRCM PPU driver
>    dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible
>    arm64: dts: allwinner: h616: Add Mali GPU node
>    arm64: dts: allwinner: h616: enable Mali GPU for all boards
>
>   .../bindings/gpu/arm,mali-bifrost.yaml        |   1 +
>   .../power/allwinner,sun50i-h6-prcm-ppu.yaml   |  42 ++++
>   .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
>   .../sun50i-h616-bigtreetech-cb1.dtsi          |   5 +
>   .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   4 +
>   .../allwinner/sun50i-h616-orangepi-zero2.dts  |   4 +
>   .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
>   .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  21 ++
>   .../sun50i-h618-longan-module-3h.dtsi         |   5 +
>   .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
>   .../allwinner/sun50i-h618-orangepi-zero3.dts  |   4 +
>   .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
>   .../sun50i-h618-yuzukihd-chameleon.dts        |   5 +
>   .../sun50i-h700-anbernic-rg35xx-2024.dts      |   5 +
>   drivers/pmdomain/sunxi/Kconfig                |  10 +
>   drivers/pmdomain/sunxi/Makefile               |   1 +
>   drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c   | 191 ++++++++++++++++++
>   17 files changed, 318 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
>   create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
>

