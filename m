Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B3DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPRSrDHPMQkspBW9wFDUJ/iKaqBFin7bc0Krcp9BIfo=; b=YFOQqNZIwwf+28FkhdAx7YwW/o
	jPdrPDdgWNop5Jau4qRzSx9mdz0DLGmanxE0fQ7zSd0V/ONCJwIhiwDhLi8VQbabCFOJ8Yu6Ifgh9
	Y6TGdJP/0WqkHFbRGaE80WKyvlcn7x82bYctdILhMxnPQiDCRRC6z8bd9Ixodwm94usFTLGqhhfh4
	aUPTaHr4+BfZhmSlfN/MfEuCy5M53oN6HWtrce7A6MTHOVXs61G5fLouVK+D7o0X5OsP0vJZofS5R
	1e1JjkIfgrKym63G556tO7NqbX6UYIaaDhHVzcM42pq9iuQsHlwO/8YSYzmbJqi11l40Qmp5WnOC2
	CbJRYxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOZF-00000009goY-17nt;
	Fri, 07 Feb 2025 13:38:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgOXq-00000009gPm-0ihv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 13:37:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43618283dedso20374895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 05:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738935440; x=1739540240; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPRSrDHPMQkspBW9wFDUJ/iKaqBFin7bc0Krcp9BIfo=;
        b=NhChMETUxlRPMu6mxiQX7jeMQOzAmlf8tPoy7wghHvOyrckY7g9/UQUeLE8DFg3By0
         c7sDGJGoWdq5m9hyDYKv4bToFqN90NZ15FEOr7nbn352tAYcoacYH4a715Y/QI8feWq3
         z5KJ4KlzQXLvF60GP0SiJ8nFVhd2M53KTqGysYJEPpwMxf9kVccrXi/GhGlmaQ3E0RI2
         rUxuDLPgKjWe017zrlmppK6eNXXWAL9r5sYFM4UKjm5/PzfkdAj77JyHr0uwG/+9C31v
         RzJiLZRrkh3rB0ZRDM+devNZkCS9gEOv4AKLsqtORg4I+5hNhcqtrOefq5aaB+IYUvIH
         Oxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738935440; x=1739540240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPRSrDHPMQkspBW9wFDUJ/iKaqBFin7bc0Krcp9BIfo=;
        b=BLdYXtFElad8yfXaQEcMXgPm1vDPVz8epIuudE8yuoKX5LxSnyNemiq3jRan/05BgD
         l6uNvY3peCHB9oh2m1a+DvttTWeOLXp5ZBb7T+Hxu5Alqqbd6q2YaCHvlx6f4Izh2nxH
         VX5t0bFLT/siYqZdRxU1yMmS8de/grWg0vYnMw6ggSA0Ia+40lPIBQS2QEV/EgNqstQg
         LFyr7n0xt9M7t76CBAOcRNSEqkO5N6CkKRUVeCt8XY2G9mSHFnXDSeBVVzm/UASHAvGE
         Srg9cgairvrpYp49KIsX/mmjEVN205RHKccD6B+Hy6yu+Ymw4j2VWqDuLNbwMWAqunjR
         XPIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPNcWJe+9ukf2TIc2CXSXSDbRfiH6hHT+j3pQZeEMhaJkln0t5zH9IJYxXwaOuYlKtoMw8drRz1wFwgBxCwL0d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/mxUpXmmRoTY9knl78BZHEuNYEhyRn22ic72nw6yGscQWp6US
	VFUWQBCsJk1d5Upe4xugVIftrbHiVtGdcuXFqwJZZ7pCJ/rKrmq47wCOqA5b/Mc=
X-Gm-Gg: ASbGncsMr2Kmi9Fyige9OYuN22vtb0R5RSrCfjRaE1pFRIFBXBhAv3XvKcaUTWVjpYD
	ymajGDYsXhTny8OGQw/c6Cz7PYssMz50bzsQbKI3ynjwCJBq+ybf0GG3dwmB68gSlTz/UXPH+cV
	fu0HUvrcCyTvbkshPYaV8Z+JC2Q9wWdonx4Dii2rT624XswfsE9WzR7rvYPdYFtPmPBJveOz8aT
	NatTpcIAqHPBuynVsXwAVhitdROrwNxuzVfssS2ddDwp8Gnb+kwGanpvkdsSIOquQY08ArWrX2p
	djybCOc9xmeEweVK+CORJKmu7nKMw9sJHXun/IWdh3MxKG3wymGHH10QJc70sBo=
X-Google-Smtp-Source: AGHT+IH3fH05sr0RzEENOHx7i7cRr0rsu4948lpsFnWwYRkB7HQdSGQ6B8ZBEJuZdUoLFPuxdIY6Mg==
X-Received: by 2002:a5d:64ad:0:b0:38d:c5c7:4f07 with SMTP id ffacd0b85a97d-38dc8dd07bemr2770452f8f.16.1738935440380;
        Fri, 07 Feb 2025 05:37:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc933ff9fsm2213064f8f.96.2025.02.07.05.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 05:37:19 -0800 (PST)
Message-ID: <5dc5c251-4f66-4468-b253-6c8f58f5fd81@baylibre.com>
Date: Fri, 7 Feb 2025 14:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] Add display support for the MT8365-EVK board
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_053722_241344_23C6B5E0 
X-CRM114-Status: GOOD (  26.21  )
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

Gentle ping for patch 1,2,3 and 4.

On 10/01/2025 14:31, amergnat@baylibre.com wrote:
> The purpose of this series is to add the display support for the mt8365-evk.
> 
> This is the list of HWs / IPs support added:
> - Connectors (HW):
>    - HDMI
>    - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
> - HDMI bridge (it66121)
> - DSI pannel (startek,kd070fhfid015)
> - SoC display blocks (IP):
>    - OVL0 (Overlay)
>    - RDMA0 (Data Path Read DMA)
>    - Color0
>    - CCorr0 (Color Correction)
>    - AAL0 (Adaptive Ambient Light)
>    - GAMMA0
>    - Dither0
>    - DSI0 (Display Serial Interface)
>    - RDMA1 (Data Path Read DMA)
>    - DPI0 (Display Parallel Interface)
> 
> The Mediatek DSI, DPI and DRM drivers are also improved.
> 
> The series is rebased on top of Angelo's series [1] to
> use the OF graphs support.
> 
> Regards,
> Alex
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Changes in v7:
> - Improve defconfig commit description
> - Add comment in the DTS about pins clash with ethernet and HDMI (DPI0)
> - Link to v6: https://lore.kernel.org/r/20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com
> 
> Changes in v6:
> - Fix DPI binding: remove the duplicated property (power-domains).
> - Squash defconfig commit.
> - Fix the property order in the DTS.
> - Link to v5: https://lore.kernel.org/r/20231023-display-support-v5-0-3905f1e4b835@baylibre.com
> 
> Changes in v5:
> - Patch merged, then removed from the series:
>    - dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: dpi: add compatible for MT8365
>    - dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
>    - dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
> - Enable STARTEK KD070FHFID015 panel in the defconfig.
> - Rebase on top of 6.13-rc6.
> - Link to v4: https://lore.kernel.org/all/20231023-display-support-v4-0-ed82eb168fb1@baylibre.com
> 
> Changes in v4:
> - Patch merged, then removed from the series:
>    - dt-bindings: display: mediatek: dpi: add power-domains property
>    - dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC
>    - clk: mediatek: mt8365-mm: fix DPI0 parent
> - Remove mediatek,mt8365-dpi compatible from mtk_drm_drv.c because it
>    use the mt8192's data. It's a miss.
> - Add MT8365 OF graphs support, remove the hardcoded display path and
>    rebase on top of Angelo's series [1].
> - Link to v3: https://lore.kernel.org/r/20231023-display-support-v3-0-53388f3ed34b@baylibre.com
> 
> Changes in v3:
> - Drop "drm/mediatek: add mt8365 dpi support" because it's the same
>    config as mt8192 SoC
> - Drop "dt-bindings: pwm: mediatek,pwm-disp: add power-domains property"
>    because an equivalent patch has been merge already.
> - Add DPI clock fix in a separate commit.
> - Improve DTS(I) readability.
> - Link to v2: https://lore.kernel.org/r/20231023-display-support-v2-0-33ce8864b227@baylibre.com
> 
> Changes in v2:
> - s/binding/compatible/ in commit messages/titles.
> - Improve commit messages as Conor suggest.
> - pwm-disp: Set power domain property for MT8365. This one is optionnal
>    and can be used for other SoC.
> - Fix mediatek,dsi.yaml issue.
> - Remove the extra clock in the DPI node/driver and fix the dpi clock
>    parenting to be consistent with the DPI clock assignement.
> - Link to v1: https://lore.kernel.org/r/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com
> 
> [1] https://lore.kernel.org/lkml/20240516081104.83458-1-angelogioacchino.delregno@collabora.com/
> 
> ---
> Alexandre Mergnat (4):
>        drm/mediatek: dsi: Improves the DSI lane setup robustness
>        arm64: defconfig: enable display support for mt8365-evk
>        arm64: dts: mediatek: add display blocks support for the MT8365 SoC
>        arm64: dts: mediatek: add display support for mt8365-evk
> 
> Fabien Parent (2):
>        dt-bindings: display: mediatek: dpi: add power-domains example
>        drm/mediatek: add MT8365 SoC support
> 
>   .../bindings/display/mediatek/mediatek,dpi.yaml    |   2 +
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts        | 245 ++++++++++++++-
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi           | 336 +++++++++++++++++++++
>   arch/arm64/configs/defconfig                       |   2 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   8 +
>   drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +
>   6 files changed, 594 insertions(+), 1 deletion(-)
> ---
> base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
> change-id: 20231023-display-support-c6418b30e419
> 
> Best regards,

-- 
Regards,
Alexandre

