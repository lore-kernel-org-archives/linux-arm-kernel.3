Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DBCCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpOqTr/H8i5iWZL4dLpviHUqjl+PiTBlvfyP9LcDKi4=; b=a246SgcJPkx9YFia7RM4IhCZTe
	M/qoptkeO07X6hE98mbbhbRV0i6azHW4586wUvirgllYm36ezQA216I9f2UxVyXcZ1Ws0ehjxW5Ly
	+lLe+g8z0ZF+04DqLqHZL4gTmiqkgC4iPAWLidRrzQxJHUXt1/KT3s5GGEfB3TUbEbHr9Iz30nEBr
	6o7OY0AiLn1aIyUUVxlHbyOQD1Bk5H5oNQzPlqMnmVTfaK9gDMUbkUrxKMAPRgbHQkvQmtkKvp584
	Ph90Oof3kEgTJy5vA48kzDmAwpp+9VHUQoedtnNXgpRo4xabZh/xRPJVsTOQ6kaX6f+LNFU1V8ees
	netsqZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8lV-0000000DO5B-0rmF;
	Wed, 13 Aug 2025 10:31:29 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8KT-0000000DJZv-0lCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 10:03:34 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5392ba07940so4329456e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755079412; x=1755684212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpOqTr/H8i5iWZL4dLpviHUqjl+PiTBlvfyP9LcDKi4=;
        b=A3O+RC7J3SUmd4ICXVsao1+Q7jVVZVllD0EFuDkd1+wWGOAJ9ryGelIqTaP/3D7bIK
         wE27Hn1TTTIsDlZR+C1XPNCKyV62gZfmkrvMcO04z3P/hlr7n8CobWRWdbnsWnyW6cYD
         As9SahWTN4Zp6a7hRr8DnKO1yV2Q2rtGzbE+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079412; x=1755684212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpOqTr/H8i5iWZL4dLpviHUqjl+PiTBlvfyP9LcDKi4=;
        b=S8iLcVhFjbldgxLQzINF7e/c6O05jAFNU9M/u1aoT8g12IN8tF1zxc/TjWfHXOz5Yl
         HdBB5YfjjmvuLlE8VxmsiZAjHqXO0yVPI+40UO/G9Hy0/N5nCd6EvfoLi7cfbXHOMHM0
         QulrfaiXSgVQqJS8wxDg+zgMpOANWN+pz3iHCSGSRRZQ27TGFIrbZQkv2OQgLaeCtkLg
         9hb69DhWLaPdhhaoUMKtXG0Uy6imcTHQvOHe694Ye80PKc5XTFi/UZ/wkLaEBjJ2tOWw
         oNMiLSzxAPQWcJ824SM5clCoqwizhJJy/KiVLwfeKmNurXAy7kyyrm0243QzjPCN67oA
         3IYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ45FKlS3stCNvy3B/HMFhfyCm1lHHA4zV0B7i9txVHsqvHkvEesEGPKm4Df9ofMpBlI3anC1uYSKUct16UD+9@lists.infradead.org
X-Gm-Message-State: AOJu0YyzMGyA1Hxy0LHI7LdpWW8JXiO0StBmtiBLVbohtbnO0qTv2URq
	4A/QZeyzXoGfK4aOXU3VcdWsaAfuNovK4CS92HkmbQOAknktsit8VcASP1X4H85/JnNECIMDWc+
	Ra00=
X-Gm-Gg: ASbGncs9GYnephmiqnT5MUgHXUNm0ahrTr7XS8KEgNR+enIVo74gD+de9Qjp0TNCsH0
	sKGSbiknrIQxtadw5J6o7e2L/oEv1EObRODLSfrWqRk0xRE3sHccrWuQF7HCp91wE+xDwyrxUlL
	iXZvpOsijJGbzqSg3GFfN1oS1SINKS5A4z+GPdlFFVWfXM9zvDBQejjb7+rsAOzuAn3hOA0FTYB
	JLra78kgoNmoWd37LwEQHkSGtvP6ob/pDNc9Xj1IX5gyJIb3/uClVeJiFo4h7FUqhm9kSGaiI4g
	I6stgUHqW1kdbcZAmmbLJyAukpV4sFuzLjEpexIn8WnJQbxV41HLFzmZ6eGtLG7o+0K8dEQBsH/
	YYpl0NMsg/eX/Y5dZF66L/UGKvM3Og5773swaG/kgMnFq2A+EVIGqmAe4EQ==
X-Google-Smtp-Source: AGHT+IEtdM5jQrfLLNzlYpFU8H8GTxdcEFX0prRnAXfC9QMjii0ufJEukcZYNE0g3zXyHvrdCC/7wg==
X-Received: by 2002:a05:6122:1d0e:b0:538:dbaf:e3c4 with SMTP id 71dfb90a1353d-53b0b27495fmr747910e0c.0.1755079411704;
        Wed, 13 Aug 2025 03:03:31 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b02a3473sm3757839e0c.26.2025.08.13.03.03.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:03:31 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-50307b67169so5134692137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 03:03:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXER8T+Lfeg5vj+TyqcanEo2C2FVEErqTSQ3baAfulri8g04Weeqgkvbl7GAs+EvVQ4t/rJhp2oUykSgt6OLb6N@lists.infradead.org
X-Received: by 2002:a05:6102:580f:b0:4e5:c51b:ace4 with SMTP id
 ada2fe7eead31-50e5069ec3dmr831455137.20.1755079409916; Wed, 13 Aug 2025
 03:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250812085902.3309160-1-wenst@chromium.org>
In-Reply-To: <20250812085902.3309160-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 13 Aug 2025 18:02:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhG_ExACJRpJoqmO7nn+P24uiaha21SFEyR3aoKL-Pjgw@mail.gmail.com>
X-Gm-Features: Ac12FXxcH53--yUF4XiZyOJVA9MjGchb9U9zLHe6JnSsrI_-dNHmZMaj3Vdi_pE
Message-ID: <CAC=S1nhG_ExACJRpJoqmO7nn+P24uiaha21SFEyR3aoKL-Pjgw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_030333_219145_007B6021 
X-CRM114-Status: GOOD (  16.74  )
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

On Tue, Aug 12, 2025 at 8:39=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The first SCP core is used to drive the video decoder and encoders.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index c5254ae0bb99..10764786bc21 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
>                 #size-cells =3D <2>;
>                 ranges;
>
> +               scp_mem_reserved: memory@50000000 {
> +                       compatible =3D "shared-dma-pool";
> +                       reg =3D <0 0x50000000 0 0x800000>;
> +                       no-map;
> +               };
> +
>                 apu_mem: memory@55000000 {
>                         compatible =3D "shared-dma-pool";
>                         reg =3D <0 0x55000000 0 0x1400000>;
> @@ -1146,6 +1152,16 @@ &postmask0_out {
>         remote-endpoint =3D <&dither0_in>;
>  };
>
> +&scp_cluster {
> +       status =3D "okay";
> +};
> +
> +&scp_c0 {
> +       firmware-name =3D "mediatek/mt8188/scp.img";
> +       memory-region =3D <&scp_mem_reserved>;

It looks like a pinctrl for SCP_VREQ_VAO (GPIO 98) is missing?
Datasheet says it's for "SCP to PMIC normal voltage request", and
MT8195 and MT8192 also have that configured.

Regards,
Fei

> +       status =3D "okay";
> +};
> +
>  &sound {
>         pinctrl-names =3D "aud_etdm_hp_on", "aud_etdm_hp_off",
>                         "aud_etdm_spk_on", "aud_etdm_spk_off",
> --
> 2.51.0.rc0.215.g125493bb4a-goog
>
>

