Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8B5D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 11:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=; b=fbvpb/PGMa3c/UHN3g7mbD68Sc
	iGoIoaJIxDpzAbr+76lyFduKniN6gOB5C2NSSCz2fUHNc9OpadT+eBVbJUeqmIYnCel/L638TdDTv
	znnG6YUw+JhPFSNm8WtLAuBbc10BZ6uO/ZsWivEIKwoFiLN7mfvMsjiptLHe7Ws338Kyjz3XALLQI
	twDk3iwSKcU0xpgqXsGfAnlQ0dh3I+V8BniwKXlKSCVeDMuDrqU1y2dRqQHt9TI+XmKf6NYvgzbKc
	2wyEAEb2cZjiNiiuAd1Q2sSeZ+FQu+csj+ZnhWsAeD7Pb6BeVG4c0uoONCyd5b4kPHYAp6bLU8bJC
	LPTqcUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ne6-0000000AWqI-1g2V;
	Mon, 28 Oct 2024 11:10:50 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5NcJ-0000000AWM0-3iPd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:09:01 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-50d3d2d0775so1283449e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730113737; x=1730718537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=;
        b=P79Hmkkg2oBvB+sLpeDJjiU+eib2dCm+DVze/G7ANAd96TE6OBt7b4Bd+n9F7LdD8m
         qYNA3EUNd16/m3wyd44SnF3LonGUQl81bbqDC/j+FptESst3irDwtQlkX7GcIrHC6azp
         T9U2ewAgbM5cp8EW+Wx1Pz6rFjS4WbPzOjkO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113737; x=1730718537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=;
        b=WJUsglA38npAT3RwM+87bcP4UHeTvdErk7Q8E7UDE/JUDu9Lx/c6kalTaQguUBPnsy
         2/VNp1m1DL43KSGTI1NRLTIaHTqfKZXe90kUU2lVtcIh0LIhif9JS8oxs6lS8XTXYt/p
         5S5CD/KNpt7vHjop4DUZwotqnJqYVgvN2WQwQahZXzA3mdSOYU/jmegomBgunRygk5wb
         04QpKX2KqGFN0xomkatINFaQ3KMQ/VGH09/9CrGBctRL9CCeFRpZmQoHoU+KYJ1Ps1We
         gKCJOtlbfmI0usLKUOoHfoPOP5Sx4F47NGAbvPTGJLJala38Wl9WL+72XmGb0u8omOQC
         JWdw==
X-Forwarded-Encrypted: i=1; AJvYcCW35taPJAxBXW4Hlm9GNz3iFTTa8yDgMLxVp+7qgJ84iM4TSqEPI+L8maVVkab/BwCmQ/TIAxtY8//wEuAfv7I7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh0Tpph8UoucKZacGJQxEN0pEAJHLABJ4h4IQcpS9CpdTeMDDG
	C80KT9Rxb70uQA9n6sBRW1mGZ8CMYmOm8BDRn/hdbSoKKVv4xtB1NZnaGq8mUeTzvMPwYIUxJ9E
	=
X-Google-Smtp-Source: AGHT+IHQ/BFz0LZl6auhRliJLRjzKXT9/O6yAiguW0aT0w2rfucm3AuT4n/Uxwb7B6mVHjXIDRXmSw==
X-Received: by 2002:a05:6102:38cb:b0:4a4:7ddc:6972 with SMTP id ada2fe7eead31-4a8cfd6d225mr5697465137.26.1730113737211;
        Mon, 28 Oct 2024 04:08:57 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a8c52096e1sm1085018137.1.2024.10.28.04.08.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:08:55 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50d525be53eso1071126e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:08:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXReit+syESmC3LsLWKFAUPzoo/8udG12OtSGCpneaS+aXANAIXc39uOdkH4usY3nd3afH6SxS37p0EYjWpwIgk@lists.infradead.org
X-Received: by 2002:a05:6122:2a41:b0:50d:5f75:f7d9 with SMTP id
 71dfb90a1353d-51015109f5dmr4172633e0c.9.1730113723870; Mon, 28 Oct 2024
 04:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241025104310.1210946-1-fshao@chromium.org> <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
In-Reply-To: <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:08:05 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng7zRR-Ek1AQ7W6DhhB82=yVpMZq6JfzPEbWWb67knCVg@mail.gmail.com>
Message-ID: <CAC=S1ng7zRR-Ek1AQ7W6DhhB82=yVpMZq6JfzPEbWWb67knCVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_040859_966611_BDBE4285 
X-CRM114-Status: GOOD (  20.44  )
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

On Mon, Oct 28, 2024 at 4:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:42:45PM +0800, Fei Shao wrote:
> > The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
> > property is required to describe DAI links and audio routing.
> >
> > Add "#sound-dai-cells" property to the binding and filter out non-DP
> > compatibles, as MediaTek eDP doesn't support audio.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.=
yaml
> > index 2aef1eb32e11..c05c2b409780 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> > @@ -42,6 +42,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> > @@ -87,6 +90,19 @@ required:
> >
>
> You need to reference dai-common instead, since this is DAI.

I'll add that. And if I understand your feedback in another patch
correctly, I assume I need to reference dai-common and also keep the
original #sound-dai-cells lines for the number of DAIs, so I'll keep
that. Please correct me if I'm wrong.

>
> >  additionalProperties: false
>
> and this becomes unevaluatedProperties: false

Acknowledged.

Regards,
Fei

>
> Best regards,
> Krzysztof
>

