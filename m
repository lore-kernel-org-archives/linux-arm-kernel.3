Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F162ACF5398
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kO9dsRxEi7Z6623tuZtbmq5loPcm88aFPb1NoxIjYoM=; b=A+7jw1lWSzb5LwQkhu3AJdRKzs
	0AsXq7D9+F06HFDULgXmZuvHgJ6OGqT5X5ovLplbA+3dOsV/rSF+kHbP8IudJ0hzqj4/WfjCMTbnK
	GKXEtPF9TiRkQF5hCmePTOSBy5DXKawUZbvRCA8MMBXDzC1A+5iGOazcFcbVKmLF1yCzBMyyHcHER
	1jv4zn6s7bfHK0SwvwgykKx0w02kSy1pcI+B4jgRbpKVFza8BFAevM63qPnG+LCPCB2onKy7P94w4
	qkqFz7qEXkdSJWxOUwIyemJJKoJQJkzhCpoT/vAutNb/g4TJ7ws8JuREN5tSqJeMIdL9iaNyU1ELe
	X9l08Fnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cYh-0000000Elvd-2zkm;
	Wed, 23 Oct 2024 14:41:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cVW-0000000El3C-3Wcu;
	Wed, 23 Oct 2024 14:38:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9E08A44F66;
	Wed, 23 Oct 2024 14:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCAEC4CEE4;
	Wed, 23 Oct 2024 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729694321;
	bh=0JqvrPoAl0IeTaLk4IwiVcZMi7aNs5KY80Y/mwm0Ihs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y7jGJCf5XPlg6FhMcZZxHnU43XGMqCWy0zgJZiTZw3LmL9uIaoEggURVp2ODsOpdo
	 +300kakIpAx0/GKN3TnxZyh5oEhjHgtwTuMtIqsGukcF6Zndd49LtkNXg1gbGYx0vj
	 5DGX4Dh1AZTC26GNlCEWSzsgFWMxRuV8kJFELNuCzSUcnWlNL2t+ac8d7WNbUeknf6
	 gRz6eUNoXkcuOIN6xMWt4etfHrdyk/bG4MaA6a0DtuyUQ6tseUKopwP3cPdIzako4Y
	 CN/903JmCJLvpQokdP3vjoykoEMq9kWDubY2Kpn9uW1DKHPuc++54KNYjkTH1GY53F
	 +2S2JKwAzjB/g==
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e467c3996so4610886b3a.2;
        Wed, 23 Oct 2024 07:38:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjU6H6ct9Ihe1sTOPIqNTZc/cnkMl7Vr5xaPI3PeSOt9aeaAqyW8WrWtQPJDeFMzr04sj8sYnf5ZlmGNDY5S6v@lists.infradead.org, AJvYcCWjqdF0brm6d7kNpeU5U7pJlq49QMMg9GsFBxj0vkqikV5jSfUAOyTYpCNB5i/WMPtM6DFnU9aVhV0LoL3Lub8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLeFp69M+qKMtXj36bw3tdzj2eeOhkJl3yMDu1r19jmI92/t3q
	57eX3UntHrqhcAVi7vF5F77QMuZaOsjJzcRHaSJ69kjtWlCpbwBE9qF1n0v9v5McCSDIdzmIoz6
	jUe19/93BSkY0eLA05bV/PL5ssQ==
X-Google-Smtp-Source: AGHT+IG/RdVxY7RG85NyF0P3I6XAtxRrRLMBLPXslpGReJZYhGUeFy1bxVKhKy/eGSVOAqET/hE7xY0gvgcONdeUlT4=
X-Received: by 2002:a05:6a00:ccf:b0:71e:795f:92e4 with SMTP id
 d2e1a72fcca58-72030a61bccmr4130356b3a.2.1729694321137; Wed, 23 Oct 2024
 07:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241019052935.553886-1-fshao@chromium.org>
In-Reply-To: <20241019052935.553886-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Oct 2024 22:39:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9qjcZoQS3KqEqbhKNw9nza+1ggXN44snwThzjLLJ2KNw@mail.gmail.com>
Message-ID: <CAAOTY_9qjcZoQS3KqEqbhKNw9nza+1ggXN44snwThzjLLJ2KNw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Update device list
 with power-domains
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_073843_050359_46FE58D4 
X-CRM114-Status: GOOD (  18.29  )
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

Hi, Fei:

Fei Shao <fshao@chromium.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8819=E6=97=A5=
 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> There are two kinds of MediaTek DPI devices in the tree: the ones with a
> power domain and those without (or missing). The former are the majority
> and are more common in newer DTs. Only three older DTs fall into the
> latter category: MT2701, MT7623 and MT8192.
>
> However, the current binding only allows particular DPI devices to have
> power domains, which results in spurious binding check errors against
> existing and new DTs.
>
> Instead of diligently maintaining the allowed list, let's do it the
> other way around - create an exception list for devices that are fine
> not specifying a power domain. This list is expected to be fixed, and it
> encourages new MTK DPI devices to describe their power domain whenever
> possible; if not, those should be listed with proper rationale.

I've applied patch [1]. I think that patch fix the same problem with this p=
atch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
commit/?h=3Dmediatek-drm-fixes&id=3Daf6ab107ce2c338790c6629fe0edc0333e708be=
8

Regards,
Chun-Kuang.

>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
>  .../bindings/display/mediatek/mediatek,dpi.yaml   | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.=
yaml
> index 3a82aec9021c..c464642bbfb6 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam=
l
> @@ -81,14 +81,13 @@ required:
>
>  allOf:
>    - if:
> -      not:
> -        properties:
> -          compatible:
> -            contains:
> -              enum:
> -                - mediatek,mt6795-dpi
> -                - mediatek,mt8173-dpi
> -                - mediatek,mt8186-dpi
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt2701-dpi
> +              - mediatek,mt7623-dpi
> +              - mediatek,mt8192-dpi
>      then:
>        properties:
>          power-domains: false
> --
> 2.47.0.rc1.288.g06298d1525-goog
>

