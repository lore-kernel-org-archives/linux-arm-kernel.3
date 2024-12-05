Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D4FE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5SX3vvLoPm9Eik2OYGQGpzcsjOKwp5Zg+ZD1GAa2Zw=; b=Tr7O08d4rxdEYW
	SdkJiNfklFESTEzSNvHj5PtkAKrAqwD6noTc8T8Lmylfo0NegICDDksqrpmlP2Nk8O+RZFiUK5L1Q
	fD3kkmYgPtjFqIf7CeS7PWgdBXKKtmHo63om4zVw3TFLSLDWKGSrEYK1JAOOzzlOtDUvcz3Qts3iQ
	3ScoZcjOyyhZxIKgfAyOZrTnZiXrzyHrQUiXVQWIAGRuWxKzPjK57+/hL/HR8769wDKQ/VZ/i/JUO
	NmNGCp35xQbqX2nezXlAcjfSGDZV8vP/mdBzpDKpKLgjb7HamEtr/DyceDWH83ipysKJJ8D81CIYQ
	ho1GiTLlEGCqzLjF3v/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2Th-0000000EeB1-1RzQ;
	Thu, 05 Dec 2024 03:24:33 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2SI-0000000EdwA-3cEJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 03:23:08 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so3564791fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 19:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733368983; x=1733973783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5SX3vvLoPm9Eik2OYGQGpzcsjOKwp5Zg+ZD1GAa2Zw=;
        b=nNpT/o/BSrfRxYy8wAs8OuQ/L0XJnZEkUHKxsD58OcSh32D/wfkyOHyfFrIkoCJDvM
         KuMTaEI/21C0Qxj/2DIL7+BFoFbYus1ELt7qOvPi/gt6xxpg2Ph/qVr7TDFwPEckMpvm
         KzYtqhWqk+U2RotMbuBI97As5kiECDaRANbgMB6WuNKl79EGtwnhSXkO6RISWi85yrLt
         Kd7Q/wbxqHanUVvC86msL3DXL9G9Y2Rm4O6N4V6nZtkyKybhF0IUkqBSiQdXysTvm76D
         Ua3XIJ6GKEY1yYE4bwW4E5hjyMocLdJy4bwj7NJ9sZeiCxDt+ML9cZWoWAu8y2ef5smN
         zpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmW4d/krVVZECkk3ZZGIzWnznFtQSUQ1JqpLzILEZmNtkAk9KJ3aUQUvzokt7j1Q8LuQfQOVsEWUCOX1yYTpN5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvm3QHUi2mlq1+0zVM9J34BJ1f1DqmfAnEj/wE9POva8CZOB9g
	WB7SZVnvVJCCBDieXGy7RNeYg2hUXSEbYi4A1CP5m0k6ocIB9+6Ep5qxuGst
X-Gm-Gg: ASbGncutLMVTqJmeR73GpjldfsKOdtZTFAvTX0XovSCreyWKd73YEsZ89C8Ugt51P13
	8StzjwwIORi3jDJ03R80bYd1elArGxNVK4i+0aBMlS4lhgnhBfC0yx/8gHdWXdaGBomcJLj0RHb
	RzBdkyPH9ppy4LmYbdzgx7ULK0cs0piLagppPUcJPIzVUB5bwwwYou37G2kmTIUoklugj/UfkgR
	WHuMeyesfAm0EvtjtdCpRH6dJLe0CcPsaYp7agx/BFHLiOMyxRbphXb1/1km2+Dk4U7nYrTt1zx
	M4Cu1b0=
X-Google-Smtp-Source: AGHT+IFo9/GaB6LKb7w7PqhpqpZCbQ7nPyHIpn6V/HugbRsWGuzk5SgjYz7a/NmATzEew43bjQAOxw==
X-Received: by 2002:a05:651c:98f:b0:2ff:d412:30da with SMTP id 38308e7fff4ca-30009ce0fe2mr91911011fa.29.1733368982451;
        Wed, 04 Dec 2024 19:23:02 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3477sm783211fa.48.2024.12.04.19.23.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 19:23:01 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffc76368c6so3564471fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 19:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeClLjZ5wzK1CP7p26INpr28G/v/dlWIVp+ZKCvvckHhxk6KSi+jue3haX1i6PehwfmENl1UzgI5v8VL9dw5bk@lists.infradead.org
X-Received: by 2002:a2e:3507:0:b0:300:17a3:7ad9 with SMTP id
 38308e7fff4ca-30017a37d6emr21436331fa.12.1733368980758; Wed, 04 Dec 2024
 19:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
 <173331833897.673424.223627111827356616.b4-ty@kernel.org> <932d4f7a-c9cf-4e48-afd3-476b6c0fbc86@prolan.hu>
In-Reply-To: <932d4f7a-c9cf-4e48-afd3-476b6c0fbc86@prolan.hu>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 11:22:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v65M9g-3nLAe=7Q3sbJ2wtpvQXXVhb+h08m=2pWY6g7HzA@mail.gmail.com>
Message-ID: <CAGb2v65M9g-3nLAe=7Q3sbJ2wtpvQXXVhb+h08m=2pWY6g7HzA@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 0/5] Add support for DMA of F1C100s
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Amit Singh Tomar <amitsinght@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_192306_899558_39629D32 
X-CRM114-Status: GOOD (  15.54  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 5, 2024 at 7:55=E2=80=AFAM Cs=C3=B3k=C3=A1s Bence <csokas.bence=
@prolan.hu> wrote:
>
> Hi,
>
> On 2024. 12. 04. 14:18, Vinod Koul wrote:
> >
> > On Fri, 22 Nov 2024 17:11:23 +0100, Cs=C3=B3k=C3=A1s, Bence wrote:
> >> Support for Allwinner F1C100s/200s series audio was
> >> submitted in 2018 as an RFC series, but was not merged,
> >> despite having only minor errors. However, this is
> >> essential for having audio on these SoCs.
> >> This series was forward-ported/rebased to the best of
> >> my abilities, on top of Linus' tree as of now:
> >> commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitla=
b.freedesktop.org/drm/kernel")
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/5] dma-engine: sun4i: Add a quirk to support different chips
> >        commit: eeca1b60138189ef1b9636709e578d0c9e0de517
> > [2/5] dma-engine: sun4i: Add has_reset option to quirk
> >        commit: 1f738d0c2f67ae3551e4543e8dddbfb44cdd9f53
> > [3/5] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
> >        commit: 1ad2ebf3be836e62792788f4cd105b30ca9178b6
> > [4/5] dma-engine: sun4i: Add support for Allwinner suniv F1C100s
> >        commit: 61785259d1eb4e4c4acef8551a2524441683dbf3
>
> Thanks! Though unfortunately, b4 has once again mangled my sign-off,
> leaving it empty :/

There's one or more issues filed for b4 regarding this. See
- https://github.com/mricon/b4/issues/50
- https://github.com/mricon/b4/issues/52  (filed by me)

ChenYu

