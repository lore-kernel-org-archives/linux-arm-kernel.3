Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5334CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=; b=iGwNOpKX5Kub+O
	SLqqEOFmMCrp4+i/h9M0BEwRXXL5jRTUA3kfn3GHCQbYQnZW24NJML1PCaxoRQSRO9zfC5LiTdRVF
	2BSVAFAHvU+eDoMj+fqeRQ8fReur3q+I++PawlV36IBNPo6vpnTafMojNOTZM64VOufDz0L9k7QNP
	PkdJhdEtj90cO0EtPjESTUhcowcJsSunYhVUYi2ssXdqTg/w1xU0wIy7ETzuqZWsA4zgdNWBaAkBC
	h41cPuyG4A8Un7TilM9CU9wZEaA46uhzlc54IENoltnGxTUhoIn/C/hihxKxIAHbBnYGLP8ZdePr7
	lOLZK/l8LAMreFKwOXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1AK-0000000FFUz-0RH8;
	Wed, 15 Jul 2026 15:04:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1AI-0000000FFUZ-2TxA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:04:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A16716001D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5848E1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127889;
	bh=1i7b3l9rJpq4HTYvS3RcBvBfTdofsIZ1RrmCSl+AOlc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=ChP5ArcPoyxAheJKZwTqCP9/h3JqTIJqA/OU/wRQw4NdxXhX9JDhVSSJ71YT+2orz
	 GElVYG1wyTwKrzodbclVbvhlZVZOQQ1ssp3AMtWphJlxYqIbMmFiej1eD97kodNDxj
	 tqf/l0KH0c93RLcwKe2hUwnWyox9DSOU0XZkb+vQPckNl+RRiMDHsarz+bbQgbYfDZ
	 gfw0ZIzySpIoUVIgUWchzSZaAHijZxtpBNW0K7NVVVkLd6pe4pV1hvCL9NW+4vpgeZ
	 AO+j/BgzmuYS8Xgue9nVzNqr3GzmKe0sm1AhSnOHD58HwEg6UeTT1FawjP/0hYDJQo
	 F/KLII+HIbxvA==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-447a81776e9so1964879fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:04:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RooUYQ5rrkHZzs7xhNNq9rXqi/g7gSWoeEAFhtqkIz2csyKeoLDq9fM1LfgIVay2/G2NlEUvXPJc1R32RjyLME1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw24g1SOvxf7MSVpAGaIxzFZfcz2hcRTjLqH/OSOJU9AsHpA93g
	9kuxIrYBhHcBxbiDCKRtWT9Wtt8tDjeobmXHzve4Kp+RXgVYdRiVEMq8PH7uSP9V74/0wTViOxl
	XceDvs5UaLDV21PNtN8WR9a7Pj0foykU=
X-Received: by 2002:a05:6808:4446:b0:49f:39c9:82bd with SMTP id
 5614622812f47-4a47a7cebedmr4190612b6e.41.1784127888495; Wed, 15 Jul 2026
 08:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-6-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-6-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:04:32 +0800
X-Gmail-Original-Message-ID: <CAGb2v64CEH5qEgMJsPL9fdT9M6_2vVjgsnv3Ot3f-Y_iHPNpiw@mail.gmail.com>
X-Gm-Features: AUfX_myUc_a5M0pk-6lAb-cYFOcmcs2R1m0ZhqM4rRtcSdSlCczjuxeu7vx0bfI
Message-ID: <CAGb2v64CEH5qEgMJsPL9fdT9M6_2vVjgsnv3Ot3f-Y_iHPNpiw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
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

On Wed, Jul 15, 2026 at 5:56=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Drop the redundant error message after devm_platform_ioremap_resource(),
> which already reports failures, and use dev_err_probe() for regmap
> initialization errors.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

