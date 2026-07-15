Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FC7C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=; b=luS31mLMMQQlJ2
	FtJ3yo8JJF5q/T6wUacu8UeAOtg2ZrTEZORkq3pZbOwGZbAs36XLy5d5rwQu7n5O21P59JMw+sx+L
	xCSPP4z/M4tj+RDWVE49GjxfQZaZxD+GMKG3VAd6qDeIPyCbHy1WCzDEBVaroxvc0rkdaDza2crQ6
	V20pjO+4DHgCU7MgheYKTMtAywgqvl4HxUPWthGpmrO7C9bZMx3a5fiJd8FR2hZSuKMOrdQNA/Jk5
	lrYfubwL1S8wCAlZkGj+mywYS0SoRM/gJxQcZC2MdAnv9jbM8dxTBEeBnm5EXmCzDm7u22ajsP1un
	gxqJgLm4bN2OfEGaFbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk19J-0000000FFGf-3U1Z;
	Wed, 15 Jul 2026 15:03:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk19I-0000000FFGQ-4C2d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 15:03:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7279E600AB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1D21F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 15:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127828;
	bh=Uc9ixU7mpRtpCs70jSp612g1hyAczHyKoacPjXdxzoE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WO77sP1LBjx1OQs6QMN2uAIJ+HzcNGdJSVtzETJbmBsmtUniPpRDGo9xfPqrgjwJr
	 Fv5KgSl9S333F1QdhHd8AuPtiQo2PGMPaIF0cHt0pe/DQyVYg9dbPzKqse+UfAzGor
	 QMF+Gah5ol5qHqgVV3V5EeTD+C9TsGo6n0kd7jzdHZDZYIjAdjnrigtF8t+ERznpsv
	 Tzw7tC2D1lc9EvlQEbYCZgYQu4VWvhZlwwrb+RUeDZ5EtA5Ycz+Hr1TVXrvqPW7vbH
	 sPCUAy+BCt1aF5WXajwAsE0do6iV1DdNaMsDA1Id56q7M8UbCAHcz8BM0m8hrpcPh4
	 nMUZGqZVcOLdA==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-497e6956acfso2138322b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 08:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBBHl1kMrz6M1KlFKWykCqdLpkDKRUITOHzG2tIZ9TLrpyiVuCCn4a2wztgefwyh70iPmszENYZx0noiX1LEif@lists.infradead.org
X-Gm-Message-State: AOJu0YxuIGeF1z12sKbMwPv0nrsLccf/VxjwOfb4vQ3ZV5DMMcRtqPJb
	w7uFF5wvCyRsUHRTao/NH74HcXq1UKJ8O88SpUpLwHInW0h6bt9CCC9yDh+JbTPniRDL4e/YymF
	2rGswZt6gwXnRrSwhB7wrxBOcjUQ+2kA=
X-Received: by 2002:a05:6808:4f67:b0:491:3c9a:c486 with SMTP id
 5614622812f47-4a40f01dd66mr14811091b6e.27.1784127827370; Wed, 15 Jul 2026
 08:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-4-phucduc.bui@gmail.com>
In-Reply-To: <20260715095525.40668-4-phucduc.bui@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 15 Jul 2026 23:03:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v65hizaQy=faLehwvdxRN3DDtfsTbtyhfs66-mfomaXMtg@mail.gmail.com>
X-Gm-Features: AUfX_mzJioDX5B6d_Vy4Xtr7WpYHUvgusTkTEi6eeq4XOqzYfJ6OMFJbCn3XcIA
Message-ID: <CAGb2v65hizaQy=faLehwvdxRN3DDtfsTbtyhfs66-mfomaXMtg@mail.gmail.com>
Subject: Re: [PATCH 3/6] ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe
 error handling
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
> Use dev_err_probe() for probe error handling to simplify the error paths
> and handle -EPROBE_DEFER correctly.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

