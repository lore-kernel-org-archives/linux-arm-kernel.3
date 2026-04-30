Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3FFCD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=; b=DirJFLZBbUztcUiLuNs/c1MZ9A
	gMu+rK+BKxdAebO0Vr7o8t9Ih5VFWHUTKGBL0X4bpt5gPRyLvrze1efMKWEluDMJGYrR7F+PU9+rw
	XPpX5kmI7vUlyIKc469+g5Umy/Tn5qH17XLgHDAHm1uCLYjhXZNI9IAXFnYtRydfhzZK+PDyxiNlX
	SfPlsJjerv+lf4AuACAnrJzJ6o+YK/21o6Njfej5Y2UNzcqku4LeTQCPtCWFynkHqJiWrFnO3FIa1
	1WDUJQVaadRspucDkXLrDJ4Aa32zENehx93JGpxfib69ba2XfohoVXQHwprcsvguGT7BAmzUM8hBU
	PVxlCNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDo-000000068qA-0cCW;
	Thu, 30 Apr 2026 23:55:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIbDj-000000068ne-0cd1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 23:55:05 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b9d9971d059so198906166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593300; x=1778198100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=WP+2knSW/avyn+txtsU5ww+cvMy3zP31u1aaXHB4P1grfTXilS1bad8BB0uuouuvEp
         NKbpcOQGpMoTSsmAmHsPEn2iMsG1/xU3hezl4MAIOvlD9x7vmLOeNK4JFyvgjUIUmnQZ
         QhPKEAe1iuywZps/nt4J9j8KbQGbNSZJtzBPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593300; x=1778198100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=KA+LNjLXMImjl9tLOBAFo8HgRklFhdfLf0MZPpH3kqnGFAswNsBhFEF2yHcd/DGqZJ
         potsRhUTcNobo/pR3dMkiKp+tKh6Me/bjdFkQOEXIV3scJMkMb0ujlZEytG/2B72OAhT
         YnzR3ti8JLeu86hEOn6AoHDA464dejd+0fcLnA1dJYtlWN1wOa19dhk29SFdEsLTIZpH
         ymfoEKIrspssRXFofnsJ65lytLbDL+RFePi2qANQFlHLacPErclEsYo0tkxRdcd1dWXy
         4kpkK3zaP2eWssODwvqCSN5TPH0Y/HyfFXDEZqk/QnNAQpIMP6GYPtWsip50hzuXmTgQ
         Vtwg==
X-Forwarded-Encrypted: i=1; AFNElJ9mnGnfbui5gQzPuh8zf/T1WfchfTowb705uBqk+ZpdB8UCcvYm40U81awCteHKeWbSx/Q9kLoughvpzuk5N3UT@lists.infradead.org
X-Gm-Message-State: AOJu0YzHHl9cety3fPppykRGrAfsnx3ImeEpyn3nw55nVQ2q7a6HDmdX
	hWPwcHO6r44lhlcBKkZFJroZEP7gwFx5V7UZ1dlfucoQ4FPQMjwb2T2IV7Gxk7X9+SWKJsrdMF3
	ygzp3zQ==
X-Gm-Gg: AeBDievnAPtLNCqW4ag1m0tPmYtXwpyID/gxYoPDGkWUy7XJNRuOr3Ao/WN/F9AmXz0
	DSoq7Rxsae0CGb6jhZ1+Z40rWalKertrhv1lL+0zBsacqjhR82QID7ntMnZjEXiRmIiGf8ljZv1
	GRP96Z3nFAaTx1XDXj6JHvGFqe7VHemWkP0zN7z9nVyZn1j4MDxQkkPWTyhSLo/t/1j1Y20J6FL
	bqhN1njJx7bO0JvBI38U/8ZtWKKwkV6wbVJO5nt7UReAowEzih/O3NZWiok2UT06DBs7NtMZzhn
	d7eLvW+hwOMviBXEXiO94F0AON/r29P845uHTDA2ZvK0KZbNqz/WOsN0ZTrQl7jUWKKcnVhG8Rs
	Skol5z+Ffd4KGTkEvjjAZxHj3SXJ5gcbcnW760OhXiHNqJuyVFKrhwotBiMRfNOHg100/JpvcsX
	z5/HHqSt2xBdRj5mYZP/lCvKHxG8fyiDvTMRZE0+JiyuEUcDytfCTFBuFq25FFdeeyVZIvi74h
X-Received: by 2002:a17:906:f58e:b0:bab:7f2b:c5d1 with SMTP id a640c23a62f3a-bbac5abecaamr332854066b.9.1777593300199;
        Thu, 30 Apr 2026 16:55:00 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6db702ddsm48201966b.58.2026.04.30.16.54.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:54 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d77f60944so985273f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:54:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9QA3PuBOykcXk3m2rDH9+PKHsovgXtZSBBMR8E+IOipAWrKb64OoWBS+Le0uNqqmjkuESBWuqEW03Lgx5eg7zN@lists.infradead.org
X-Received: by 2002:a05:6000:26cb:b0:43d:6fb7:fedb with SMTP id
 ffacd0b85a97d-4493ec61e55mr8612204f8f.36.1777593293572; Thu, 30 Apr 2026
 16:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
X-Gm-Features: AVHnY4KLFGb62k1dRvCKyy7EF6W0tPNO3zKHC2HCyssJ_nJGpMzpFc_-TEUNEXc
Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
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
X-CRM114-CacheID: sfid-20260430_165504_607603_AF9983A5 
X-CRM114-Status: GOOD (  18.80  )
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
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
>  6 files changed, 30 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

