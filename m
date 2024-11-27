Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2CCD66BAE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 03:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=; b=o3x+5F8QOP4GUGicxM1rnBeGYE
	LWtviQZO1ND/0gqBDJ0tt4UibrhsXeBmDEvZ/54rbCgLN1Bl9qNJSlCQ0SOqZ7ysbYIhx4Rjpmluo
	LaSc/Cb65sTRjDMLG+khgKktJOr6TP68pIQD8xo6mLOc0wgKRj7B4QhCLn84lbUosk6D8iPwp97Zo
	r+phxhfUdTbYJzjRH2PFhrArrSkl3iS/dAkld3h8xWQIaFWgz8QRuCDI4/7m5/i1o9kyNDUVRnQFd
	uvSILMNOjAW0Q6RSYuHzY4iON8rFY3ziEcHGZqBx+EO+SoDiqwip2C4iGwn4tspYDNNwrYzowWSfs
	g7thUQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8J4-0000000C7nF-0Vl5;
	Wed, 27 Nov 2024 03:01:34 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG8I5-0000000C7fR-0UIp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 03:00:34 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-515415386c0so550624e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 19:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732676432; x=1733281232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=;
        b=KlEwZIMSDsSVG4UaMQe3CqDdcY/ghcpqfuUmpl6ejmtui58n55Os0af84ZQWAQGeax
         iiL3iTDcA99z+HkxtqSn02krqbvR61IvPyyheIxrpnfTuDschcUyVyHFL9p1gyj1t/ab
         fkkKkJUM4JwUhMJYwDzlbj/sGgIj2lyqdMKlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732676432; x=1733281232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwexJOM8Lt6eGEeXs/wFnXLrXF44Ff0XiaeHC8NyObQ=;
        b=QNeCnivNcv0CnufUZHld4gOeygTj7lS+JZwRpvDOs9JHiZbnj+7u5vJ/FvjtEjWE+5
         d0KXk6pP7IU/V43hNaZ4pYagy2DOx1jnx0TQ77mayjiFV0e/vrv7uO4qTpciS5ZQvMPB
         DC3YdNJm3o2C7uEz4MkZ9TbxxESrjSTNQZmkJ8igRzDvKgXwIttgpfnzrISm9kjeRftw
         EvmcgAlVO6fAqEPGeAAKxPkA/gGz/xebws7xJM022cDyVOdIOTLcwZdyxclcAJ1Ihq9B
         S6IIO2Stlj+gjP4fFRghknsKEJ2bv5AI40wVYjXGNYYz1Juq6IQR64rG3rh0RE0jYegI
         i/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWlgUvTetkBOYKXpJ1SKIFpE1Mrt8WoY5VhfRVih3QcfW68QOeFsHbRhXe//E2ECJkUsA08LELJcqfzVvH0rTdq@lists.infradead.org
X-Gm-Message-State: AOJu0YxPtio4RSxwBUgBom8KMfZ+nY5gYLcLNj5W2RPAFOG2U/UvQdvm
	Zi+3xIWosPf9b+kXU8CUnaBi7gARox9yfWyljFvJZ2YxYqVcN/A3LAtMYYNVlIAQBma/hkeYpcQ
	=
X-Gm-Gg: ASbGncvJwzs4NHdBW48IXGTqAZzlrqEkToF+9gTZs8sh4igfowVhUBpLLl/G/ZMJJH5
	qAMfthkuNHAulEDOxhqJzNX1PnmlEvUP7OrbcPUYtez3+n2hjf87ai6nijr8YnRQFt+7eSJzVIl
	Nj8f9dI3pzXLy7GlcPvrZdTkyTOO1/4T2wsg/XJal5HkgUIJTIfZh/WUlVn3pbqmtKUvApQLiE2
	AyMf0ciWPMXHG4oLlVtVeU+hrc462Kl4sikaOimWlVM4H6jnso3sT7uBm+kMcfD3JUOMbauydjR
	oANthKDbgg==
X-Google-Smtp-Source: AGHT+IHKX0qZvuR5WaQD9J+v1qctNyE0L9DfheoXBi0seo6VMNd+O1A9zML9EVGj6aUUv/84sLsyHw==
X-Received: by 2002:a05:6122:251b:b0:50d:5095:f02b with SMTP id 71dfb90a1353d-5155681726amr2479072e0c.0.1732676431631;
        Tue, 26 Nov 2024 19:00:31 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51544484404sm343656e0c.14.2024.11.26.19.00.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 19:00:29 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4af02dca8fbso1049214137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 19:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEXDMhRQd0x/gWvrEwz3NSgTGIlzfux4QSZbFGbH+ojdI1LgksyTCO8MqJlPdkMT6dWmeluqSJEAJqJNbKIS9g@lists.infradead.org
X-Received: by 2002:a05:6102:c03:b0:4af:4b03:4b8 with SMTP id
 ada2fe7eead31-4af4b0306b9mr275735137.7.1732676429255; Tue, 26 Nov 2024
 19:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
In-Reply-To: <20241126-asoc-mtk-dummy-panic-v1-1-42d53e168d2e@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 27 Nov 2024 10:59:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh6nE1+whLEUcAVG7LyoJ=o7oakR_k6=rjoYYoMSnfS2Q@mail.gmail.com>
Message-ID: <CAC=S1nh6nE1+whLEUcAVG7LyoJ=o7oakR_k6=rjoYYoMSnfS2Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Check num_codecs is not zero to avoid
 panic during probe
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_190033_148310_B4CFBDD9 
X-CRM114-Status: GOOD (  22.32  )
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

On Wed, Nov 27, 2024 at 4:10=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
> Component via COMP_DUMMY()"), COMP_DUMMY() became an array with zero
> length, and only gets populated with the dummy struct after the card is
> registered. Since the sound card driver's probe happens before the card
> registration, accessing any of the members of a dummy component during
> probe will result in undefined behavior.
>
> This can be observed in the mt8188 and mt8195 machine sound drivers. By
> omitting a dai link subnode in the sound card's node in the Devicetree,
> the default uninitialized dummy codec is used, and when its dai_name
> pointer gets passed to strcmp() it results in a null pointer dereference
> and a kernel panic.
>
> In addition to that, set_card_codec_info() in the generic helpers file,
> mtk-soundcard-driver.c, will populate a dai link with a dummy codec when
> a dai link node is present in DT but with no codec property.
>
> The result is that at probe time, a dummy codec can either be
> uninitialized with num_codecs =3D 0, or be an initialized dummy codec,
> with num_codecs =3D 1 and dai_name =3D "snd-soc-dummy-dai". In order to
> accommodate for both situations, check that num_codecs is not zero
> before accessing the codecs' fields but still check for the codec's dai
> name against "snd-soc-dummy-dai" as needed.
>
> While at it, also drop the check that dai_name is not null in the mt8192
> driver, introduced in commit 4d4e1b6319e5 ("ASoC: mediatek: mt8192:
> Check existence of dai_name before dereferencing"), as it is actually
> redundant given the preceding num_codecs !=3D 0 check.
>
> Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_=
DUMMY()")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

I noticed the same issue on MT8188, so it's really nice to see this
fix. Many thanks!

Regards,
Fei

