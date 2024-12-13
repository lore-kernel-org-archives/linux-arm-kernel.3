Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFD7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=; b=mPy/hMlv2B4XRrqWGdBgXqnZPE
	YqhvFpiZBHRRz6SAMOy0aH5lJoL5Ba1Rm6jLcRJoevZkuxT9IxSMcYfJfUevrHu8z9bb6sjp3md1u
	AYzbi7ytQjKnLLNMMCOqyJrFEu+Ii5VO0txmJ5+Tq11w7W8CZuSNBcaneFsn2spTiDwC+aSjD0CCq
	iLaw7MVc79H3kwKcLo4utR5VuKkb5u2ZvMCQZyZzvIX04A4XdVAVY+3eptJrDr+MxE3Yzak38sfki
	k/zAHsi4KgAIXPLmfShVv1P/Iade8vkt+/Y791873gzkpzGlwEHFsq6/JdSRAYK+c4zkhfdqG0HSS
	yMBghnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2ue-00000003Q9P-26ON;
	Fri, 13 Dec 2024 10:28:48 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2tX-00000003PvU-1Dsa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 10:27:41 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3eb880e5ac2so788896b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734085658; x=1734690458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=;
        b=PmaR0jZjsrSbOw0zLITqAKkFTTA/G8MGa1bjrFyAApJyBWSmRQ4mzkh8TbA7OVVBoc
         Qwtp7cG9g+1QRY1tpi/NgfpdLrZnUa0a4EFsXXGUG3H+hMW1ldYRzsXje04wl300vBhS
         TSlF8GjL8U8CghGg2JSUG/SvIQKDNT/Z3ND84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085658; x=1734690458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=;
        b=tJnnbBPHAgmPG3udPPJzvVt2QhBuifOZeXWS77K2UrXt6O/aXpdxJkZ0XMmeAYZs+n
         sSDJTL7XYg3JsrUyJ1NWv+LcS3/7qMrAOnyUj+aJCTC4EyFSO2fvFXcGytRPsC0OForF
         TLwIZPBVC7eb4k00FwHl67xO42Kffs8srk4NDSboN2co8J+1bTAsmqdZxqgOokzgw7rv
         YFbLnloTJ0yrcpV4pN/hNDQd0RGlbL2aOt6G6O4FJb3slQv0TDkcQ4pPKkkJp763WXdp
         qpzCjpPdjF6PKhcHyRY7PYFw2hlS3CJ/1bcNABPNHnU+g3HZJYlEIIT9q211W3ukr9vY
         FBIw==
X-Forwarded-Encrypted: i=1; AJvYcCUH4GjZzvvkCMf4Q2XiEUFzJhF6LqdIuvJhbDL7oVxu3plEZI8uCEjkaIz0X0Ky84FMOXqwDO9Q2As3OzScCPMr@lists.infradead.org
X-Gm-Message-State: AOJu0YxhEEcY6cEpgsFWQdzILZdLFfJ4EbzdyuO1i0TyMA38Q/cY9s/8
	JpSy/FWEgBFgTlj3x6pyf1whr7MibP2Ppa0LjMjjbGb4v3XRiuc0mmpzIF7L4gArO12RgBMsO/z
	jYwRkmN9slseed/KrUWQHkaaD3deyS8PTXNd6
X-Gm-Gg: ASbGncu+BbYWg9sWT1ej9p9m9dv8Ypn8As1VBNqB8kD6flpDoRLm6XKBrWjIJfZrUff
	K0sTuhNP1BFvbpWy2uDu0Wodxx72MiZVzWKaxQxcXd+HvsUSqj/XNqU+UFZC04DTP
X-Google-Smtp-Source: AGHT+IESbjIDYq8Dv7WLZv3lnv+V/UUSCvVg2kJFhXxDh3T+YFv70IgQ6Vlt7dxY7YDS3GWUp1Xn0M9xXxcOalecsrs=
X-Received: by 2002:a05:6808:3447:b0:3ea:5be6:a68a with SMTP id
 5614622812f47-3eba68640b4mr591582b6e.15.1734085658025; Fri, 13 Dec 2024
 02:27:38 -0800 (PST)
MIME-Version: 1.0
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com> <20241213095044.23757-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20241213095044.23757-4-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 18:27:27 +0800
Message-ID: <CAEXTbpfOv876s3NLTO3oMTtVi_BwBtgb-816Gt5ZjKMjTZZKQg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dts: arm64: mediatek: mt8195: Remove MT8183
 compatible for OVL
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_022739_353832_B0DAD83F 
X-CRM114-Status: GOOD (  16.49  )
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

Hi Jason,

On Fri, Dec 13, 2024 at 5:50=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to remove the MT8183 compatible for OVL.

Similar to patch 2/3, we need a:

Fixes: b852ee68fd72 ("arm64: dts: mt8195: Add display node for vdosys0")

>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index ade685ed2190..137ee8929e01 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3138,7 +3138,7 @@ larb20: larb@1b010000 {
>                 };
>
>                 ovl0: ovl@1c000000 {
> -                       compatible =3D "mediatek,mt8195-disp-ovl", "media=
tek,mt8183-disp-ovl";
> +                       compatible =3D "mediatek,mt8195-disp-ovl";
>                         reg =3D <0 0x1c000000 0 0x1000>;
>                         interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSY=
S0>;
> --
> 2.43.0
>

Regards,
Pin-yen

