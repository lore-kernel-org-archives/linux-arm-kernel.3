Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7B0C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiWJCg+K70PNnHYQYuop9vFbcWQnQg/pw4mdJOG9ZdI=; b=KK17xYILK9ynJD
	O1nWAtrJoqmvNrRw2a2D1m8jt60aS3VnYcO3cRA5rodi+FR7RMg/AoHpNfhiW3SHJ1I6x7iwigneE
	yXcQBvKcVghIya1eVXF6LI1NkK/cC820CTi78VD7YoBCvRW2BN+q6kWqn0a4hLkhB7JrGBI7aw2X6
	0V+1r0PHZKt9R5LiW55SemW9wU2iQRUxwOf1tCXR0gQTkZob+Kz3oy0tw/Iq2lMEaRtApa007gLpC
	vcPggbizUOMxre0Ag/yImo003e/2xOIfArA7Pw/lw0EGJ2NNlFbA8X5wbHsCuT+JICmHP2m236py7
	pSLqvvA1cseautCTX5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlP92-00000004vTs-3gFU;
	Sun, 19 Jul 2026 10:53:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlP92-00000004vTm-0oMG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 10:53:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E23F060A62
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 10:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC3A1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784458394;
	bh=xiWJCg+K70PNnHYQYuop9vFbcWQnQg/pw4mdJOG9ZdI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ZyTJgIkf1FoSvkAQx9ZMwsuHcg4db2Ntmm6SsBGxLQeVWueg+ib7i3xjE9+4kRM9x
	 CHUJ3maizZsg4LjP8kh3ujq9uO8PI+0WAESkcMswfHvOt8nI8rjoNPQbfA56eIHE36
	 1fRboNAK1KhN0aJ1Qmz2q9CrveQHTAGKvHTkpYIlA32H81lD/PqlmfbtMuEuu0PDfA
	 GNQUvXSdYgdxw83nMt0N69UDsAvWG7Lvhu4QaKK9IcUQl53tQ3bZRQoduheKBKjFQ7
	 NTQx9IzH2va9jzoz3dtv0LFFguXoqA9V9M0lNviMzFvzT0rGOPPtBHN8hRl1l3mfGv
	 F7dHQikmWYKwg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c94d4fdb9so44712371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 03:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEHPLFEaLIS0ayMdo7UnhGtu9Uu9HxB7dA2+Hzmbh8n2L2Yu6BD8KZcViM4s9tUztgDVQW09nLiwTNdRLCFmRp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsqzf3HYYMn2GG2kNzMMBQx7PO9V8e9ZBfdjDnsoXsMeozgHLP
	8NFf0u42RiJcZHeRk9ALMLgHRfkRRaIzRw7bt4kdw4ibtB1jRmQhlN0QjGHHyOTjv8Lx5ZYisAG
	0Wujc1STOHMt5+/cASzX9AWyepd9pgAc=
X-Received: by 2002:a2e:a286:0:b0:39c:6a3c:953a with SMTP id
 38308e7fff4ca-39ea015858fmr15722871fa.11.1784458392988; Sun, 19 Jul 2026
 03:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com> <20260717-a733-rtc-v5-1-3874cc26abf7@baylibre.com>
In-Reply-To: <20260717-a733-rtc-v5-1-3874cc26abf7@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 19 Jul 2026 18:53:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v657_62Ky=oNyx-WK1=UuSBvOeMxyEZ+ifxp-Gp0LmVCag@mail.gmail.com>
X-Gm-Features: AUfX_my_i9ygLUgOUcSlS_CiEH1KIWUcMgqwo_sNf9Y9u0foqvVGbsR0em4SCF0
Message-ID: <CAGb2v657_62Ky=oNyx-WK1=UuSBvOeMxyEZ+ifxp-Gp0LmVCag@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: sunxi-ng: mux: fix determine helper rate propagation
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2026 at 11:25=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> Applying the pre divider on the parent rate is wrong because, while
> handling rate propagation through determine_rate(), the framework will
> likely round the parent rate again while cycling through the possibilitie=
s,
> throwing away the prediv applied. This means, the parent rate will then
> be wrong when the prediv is unapplied from a parent rate on which it
> was never applied to begin with.
>
> The right way to do it is to unapply the prediv from the requested rate,
> which is the wanted rate at the input on the clock element, and pass this
> to framework to do its thing.
>
> Change the determine rate mux helper in this way.
>
> Fixes: 1c8d7af61b37 ("clk: sunxi-ng: convert from divider_round_rate_pare=
nt() to divider_determine_rate()")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Will wait a few more days before merging the series in case anyone
else spots anything.

