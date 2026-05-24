Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4115BCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 08:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twvAWBRVO/ZJDAg0wUTAKAtiP6Qk//RmMjnsT8rN9kg=; b=Ivaj1LwTjJHZpZ
	HxYEbFhqnZErpAorau5N55/R22RzBHK8xZw43ds1QB7XjMkUzDvEUYs6II0x3wzm7VuCRUHBxIsKQ
	8FMy6ip5MlBLzy/USNCzdNuZr9Ze56j6xrnawlDzjBkMtp3LKvkjvdAMW4ft6lR06zP3lRF+27shx
	zNtoqAUDxxqHxqXTP85zTQ1zFZbtnfy7vRa+82rS7urf2wxRXkNABCYju0wIbsYB85RRG+mijD/Zj
	sfhCJFK4872ULBuAxp7QDyAu74e1YKGHeRKol/XG/+6rxA8jegdm5PVq5W08ORgidU/MK2OXYuZ8b
	0wazIuIMOPJMB1shFInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3OB-0000000Ed4p-1CN7;
	Sun, 24 May 2026 07:36:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR3OA-0000000Ed4a-0VlV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 07:36:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE5F060125
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 07:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6E01F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779608203;
	bh=twvAWBRVO/ZJDAg0wUTAKAtiP6Qk//RmMjnsT8rN9kg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=H9gXRvfF3mxHZdTsJm+unrFd1m69BLLtil4NOpconGGR5ICzieoSxGgTwpLExqHT+
	 pwahR7Col9y1qPdtkZmicrNMg5k6FOkzOTZs8PvWB5W5Nha0mcoIUIsUh99uEQU6Vv
	 gSpzYGXOmLOmhOXA71F6WFxi4Iiqc25wFaJQJwZqjp/WGXcZYhOvhpbZer3R5rVhex
	 2D/pf9cWaV7Dc/qwOTi/Edeab9Cb/Jo8QNxLBFYPJfm9Kk7wMueemQ8pFUd80HlMqi
	 S00cTVJY4HF6+AtsAgn9mfQBVDo1cmc7fsQVw/xviOJldjo3sFSbc4pJ9F+FcNzrQ5
	 KQAjCcCu4x5gw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso10306017e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 00:36:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9nsXIUrDWq+Nh8b0lRcLGtWK/vOvhawvGbp0DpMsUGu9fAJEPNIpKrs3VjqyElP9tVwaV7/hFE9r3AHlTK0tq1@lists.infradead.org
X-Gm-Message-State: AOJu0YwBJ2RV3qPXjNkKPMRvbaxjdYZCIiB+0TQdyB4VhGrsfIqxNylc
	N8XwtkqVNQuUlYi0rWh9/ZhvwK0inxHHsXZEgy5ZbzveEQEim/JC6B7SHiWDWYJ8gkgWz27heMs
	CSjptrXAB3q+WcIuVZ3BjKd3TxN8ZVOo=
X-Received: by 2002:a05:651c:1601:b0:38e:2fcc:78fe with SMTP id
 38308e7fff4ca-395d8bbc2famr38101571fa.3.1779608201708; Sun, 24 May 2026
 00:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com> <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
In-Reply-To: <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 10:36:29 +0300
X-Gmail-Original-Message-ID: <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
X-Gm-Features: AVHnY4KVGfaT4jHK_tEOETRqcTR3jPqtFPaTGTB9dpESZ_u5nKVSnneDOYxlkpk
Message-ID: <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
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

On Sat, May 23, 2026 at 4:55=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Hi Chen-Yu,
>
> On Sat, May 23, 2026 at 2:19=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
> > And when you do add patches due to Sashiko raising an issue, please
> > do mention it in the commit message.
> >
>
> As mentioned in the v1 discussion , this issue was originally reported
> by Sashiko.
> I'll add the Reported-by tag in the next revision.
> v1 links:
> https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/
>
> > Did you actually reproduce the issue, or did you add the patch simply
> > because Sashiko mentioned it?
> >
> Since I lack Sunxi hardware, I couldn't reproduce it or perform runtime t=
esting.
> But I did compile-test the patch.
> The patch aims to fix unsafe register accesses that occur before ensuring=
 the
> device is runtime-resumed.

When you submit a patch, it is expected that you already tested it.
If you only compile tested it, please remember to say so in the
footer (or mark the patch as RFT) so that others can test for you
and the maintainer knows the status.

And if possible, provide a scheme to test it.

> > On sunxi, either it will hang the system because the bus transaction
> > got ignored, or it won't as something else enabled the clock.
> >
>
> If Sunxi's PM design already guarantees safe access here,
> feel free to reject the patch.

I can't say that it does. But since the only control that SPDIF gives
is the IEC958 status, and that doesn't appear in the standard mixer apps,
it's unlikely that a _user_ will trigger it. Plus the control was added
after the basic structure of the driver was done, so there is definitely
some possibility of a crash.

But what you wrote in the commit message doesn't match the actual hardware
behavior, like I wrote.


ChenYu

