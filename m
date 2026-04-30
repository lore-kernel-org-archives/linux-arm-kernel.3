Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8518DFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=; b=tLbuCjc5Ye5XHbJaEvJ1zJAuO+
	KQ9t8I7/oFX6yrJY91TCor3kz2IYdjHiA8V/0f0h1qybK8xvbneYmjSSYrHcPCtpdx3NsE96kBPaV
	b+aXgKdHiE1PsrF2tYJniradKeqrRNkqktS5FSksKn8E23w+Pf7nr2k6nlniF2EcK9Dq6pailJloD
	MIWikCnS9/C9OcFnnbi5vFC9Paf7hPM3PWGiLMrwLSD0LAChWI0Yo+djf9c1D9hC0IgpMpxjOMchE
	dMBRFKBjr6LV5iL0qHYlRTbbFt17ToYeAJhRC3zz2joGs4wiLVh0SX8zzfMf6MpW1foR/It2Kdh5o
	UnzW/dOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDS-000000068gc-3TAi;
	Thu, 30 Apr 2026 23:54:46 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDQ-000000068f8-131Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 23:54:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ba60d78aff3so226127666b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593278; x=1778198078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=lmXTc7TGaRjEUuBAirRGZMIIkt4fCSM15TSRR+deKH1mVa4jN+XR4ABzULGLdzkgeR
         RRkJFFlWhgODfQw/agUmnbWtv/LgJEJn6ME+IYrzcgg/lJ5KqegHNdLBVlfkFBRo9r8t
         AM0IUKqyC09gMBE7gSi5bUZBwVtW+56zlSpcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593278; x=1778198078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=GgrV7G5MXGoo2TlUt0WThd+PvYJupJmCU3LzwRUafM7t+dRPsp4xar1Kjj5I+wrg4I
         pG5koo+h1kyIjrOdZJMixwsiwA9wo5G4a0X3gajfvsLlVAdW5A+yvUoanHI/ivNzs42G
         p/osj/Hs9UJG4dCel46SLSx+ZAdVdIqhNostxUZYtuDffJGSkhoVt3Rnxxt/Y+hTiOOv
         DlratgtX8VIWfbBybnXnkv0WulDQ0rtk3YX6Nzkk7FV4gzYmhxhhD+pWbYgvR86kc3f1
         I5Aw7Av3nYW0SRmVyQA3br9SsqMrQxCasq2CQK8ineNPTe/2qB2CCXUTS+T31t/LFwvM
         2rBQ==
X-Forwarded-Encrypted: i=1; AFNElJ88TiXle7LKjvVPMnDAtQB98ygFgUcDwnhQuj5siVc6pQCDRBS4cWCW41O14Mh+XtACUNiEf2wFHnmHFF47nVXR@lists.infradead.org
X-Gm-Message-State: AOJu0YzDpYb4cZpzOfmAT3adw5rdBEvcxq/jNyTqIQW/7NABPI8yxfwC
	Df7zamNV8+9MEPjomI3IRiJmrWLnfIYojHF9og6blE2GnBMJZgxbxthRC1Y56J+kR5KZ0EbRDji
	WcWCn/Q==
X-Gm-Gg: AeBDieumffwUbR7KmnDGSLAEAi2Igc7lbKqfalheIG8cfZkJ5Q1QtnVujd39slnN/o/
	6NFoQMiwry5OWJcb74V/Cl7+1/y7tqbhT9GBMaymIai6ah0sZpraYpzHpeNJb2X/9X2CRgEKwdx
	dhruibOJHKAVBzo3u4DVmtu7cGNFQ72HIRziymuECV/TptwkHd7WZg6U8QrGtyCR64arqDksetj
	S/cSPL0zhSFmKYfjiFVhfh1eocRR6SCqC0tnEfoQIJ2zObXb+ucx7+aIFKfflXqrepmjOgxmsPY
	3BVw7xs9EVqGIFm9yeOj9XeHZBcHEC5X/9mRyaa90bijdzdR14/uRhBfd5p9AA+KN1tbieR2PQv
	gLS5VpoiHfGNhMXDcNistP8xkuxAPdcwnPbi5RNPjsFHF+P0EnGi1ldr/km+0RVudaGraCfjw7c
	ouyVu3U05SBxuWEpzNBbfHCyzeSETukTib7gJbRtKSVB5p8STmvWIx35xHrAs9X/LbQ4/t0dNO
X-Received: by 2002:a17:907:a0a:b0:bad:a86:33c9 with SMTP id a640c23a62f3a-bbac8279d56mr355462566b.41.1777593278206;
        Thu, 30 Apr 2026 16:54:38 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6db6f181sm49969466b.56.2026.04.30.16.54.36
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:37 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-444826c16ffso1289606f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+No9cRcjf0UoXqwlPM+tn6n9K7tOkF8fPSWTs5KkZdLNgVyBw9LPkzfB2t18hc+1h5CAvzVerZoiFt1YwtbmAq@lists.infradead.org
X-Received: by 2002:a5d:584a:0:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-4493dcd3c71mr8939823f8f.11.1777593275557; Thu, 30 Apr 2026
 16:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-3-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-3-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
X-Gm-Features: AVHnY4Kl-1ca-wbSwPcS9uBBAU6zbdhWLbd9Fj0fAjnpUI5H2rQOrfd8cK8P088
Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_165444_299347_DB67F7A2 
X-CRM114-Status: GOOD (  19.56  )
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

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

