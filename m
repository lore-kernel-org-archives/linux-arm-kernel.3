Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811A9CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1mgh5byxeBktHfow5RMbguuKAqxaOFPNueVkaVl7yg=; b=SEFwDYAMZtBWTm
	eUoNP3AI3I4YC//2i6tVWLzS/gXfYMmCK2icaWhF1/qMUGj7ld4L9IuUGXjJ80y+Hc0m9EGVuKUfq
	VotGFN/fn1bvq/w6GlVngjITPYuDWRwMeNJPLL5BzR2xWDcqn2/NH4FYD2eHhUojQm1dCnyPL/4II
	+hzgqwMrDsEVcVGKdbSPhjn1EcT7BWwiaDO1I9ys0MQbYMN8mTQrZXvSRjkRX8ZLZcmWGQXj6O/a1
	4vlrv4Lk5ELge+4V5K7dEMmHjxEzaaZIpJgCZsMo8uGpXkPZVUwgQq9lxTJ8v6G+FmqOnRWaMSqMH
	VBqSxsWZDlV7QzgYcv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3SY-0000000EdNs-2y5q;
	Sun, 24 May 2026 07:41:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3SX-0000000EdNj-2PlT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 07:41:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DB32601F4
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 07:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5D71F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779608476;
	bh=o1mgh5byxeBktHfow5RMbguuKAqxaOFPNueVkaVl7yg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=S2o4My5qrAsrq/M4O9F8WsxkPAUsd90A+GELJX/NtTw8nHicTFfjptpm6/luY/DUh
	 5zMbVizlPjt+CwTwcmec6d+i+52s6odAa/wI20SwzB8pZCy6xtfUM5CwpdP6WPkkIG
	 Aq74sGB033QRAyKt7t+BXcdGX21eR45nfkHBsQag6jzIAF0G/yfHhK9V2N+sy4Rh+S
	 6ws63SuynDPibTniRhftXEwJ79+4KlBgQw9VheonekdIgEZ4boBsM4v0wk1qOnqivh
	 MJcAMVv02fbqh7SnIF69GzrxtgUBmDmIZVDOn+mIgbHcRHrlLWluzjiljtficwrr+i
	 jlHuOt7CE4sqA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3922b35e69cso72387391fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 00:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9VkBpKYSrmxv8RyUKYQxWEOd5j2AcNFj/94L+ORl+9l4rtq3Abt1ihcr1EN5x60/ucT8gZaNn7YlJpHvvVAGjD@lists.infradead.org
X-Gm-Message-State: AOJu0YyKnocHn8FEL/cO5yODUzu1ItXhLLpIz8uzIyChphTAcdjHhh8g
	99BzHIs6IxXvxJ2m0MeCLdxYDEo5TKxv2AtifneceBFOzpPFWjSlF6qM0tSvbrgEHxfzPDf1F4N
	gjJMRxZ85euRQacoxGp4h++9xBsBFjoc=
X-Received: by 2002:a2e:bc09:0:b0:38f:ec8f:8d53 with SMTP id
 38308e7fff4ca-395d8d7833fmr30102921fa.21.1779608474700; Sun, 24 May 2026
 00:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com> <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
In-Reply-To: <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 10:41:01 +0300
X-Gmail-Original-Message-ID: <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
X-Gm-Features: AVHnY4I_qF0YId4u6NuVsYJHQDK9GEC3lFnFgzQna0lbyP_3FUtJ1aNKvqsjn0A
Message-ID: <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
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

On Sat, May 23, 2026 at 3:11=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Hi Chen-yu,
>
> Thanks for your feedback
>
> On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> > > Enable the APB bus clock before the SPDIF module clock
> > > during runtime resume, as register accesses depend on the
> > > bus clock being enabled first.
> >
> > That does not even matter here. Access will only happen once the runtim=
e
> > PM callbacks return.
> >
>
> I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't immedi=
ately access
> registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so th=
e order might
> not trigger a failure right now.
>
> However, if we look at the peer driver for the same Sunxi SoC family,
> =E2=81=A0sun4i-i2s.c=E2=81=A0:
> Links:
> https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-i2=
s.c#L1296
> In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strictly=
 enforced as:
>
> 1. Enable bus clock
> 2. Access and restore/sync I2S registers
> 3. Enable module clock
>
> Since both IP blocks belong to the same Sunxi platform and share similar
> bus/module clock relationships, shouldn't we maintain architectural
> consistency across these drivers?
>
> Enforcing the "bus clock before module clock" order keeps the dependency
> ordering aligned with the actual hardware roles, where the bus clock is
> required for register access while the module clock drives the functional
> audio path.
>
> Wouldn't keeping this order also make the runtime PM behavior more
> consistent and easier to follow across the Sunxi audio drivers?

This should be your primary motivation for the patch, i.e. what you
put in the commit message as the reason for this patch. What you
currently have doesn't make sense, as I already mentioned.

Some background though, sunxi is done mostly by volunteers, so we're
not overly concerned with rigidness or aligning different drivers,
unless they share a common library, such as all the clk or pinctrl
drivers.


ChenYu

