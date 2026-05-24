Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65CDCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYCSAGUVAND5q4EW5d8RK9mDufKJduBk3n//pVkW2M0=; b=UxeNqOhfNYUxau
	HTbipJX85sjPv+Kd89UIABcsIeuGEFoaNgvmPJjw/b30+OxdSqCYuJAklVmKBtOLm88V9k8+38BOh
	yH1gpXfjl7UsxwlbSrWbGDlzp1PV/b6gRZ84U2RuEK2gHSqI4Y4C5NpSNbYMLaZqYMGkC1NzqhxhU
	sPHTl8XoiTCscat6QgWzuNw18Mc3wG3YjilhEMTv+7qmpkKRDwSb45CSwSAUUn9heeNd2PUAU9Inu
	7FKaTywx3yxYVKmnOtNsoXVftXttvRzY/tNaPKqKZpP5UNXntFVd6TVvD9wZw58jXNkDUaDepIHFe
	aDozs+zxY90JsJ3HSmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRCUN-0000000FKuN-156Z;
	Sun, 24 May 2026 17:19:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRCUL-0000000FKtr-1ToA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 17:19:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DEBC445B0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 17:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF1E1F0155C
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 17:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779643184;
	bh=lYCSAGUVAND5q4EW5d8RK9mDufKJduBk3n//pVkW2M0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=KAew3OSBk9HlQAR8yqug08zrq8XdHNANQP0KGjkSMQ/Vmxc6iTp3uSHVujyRw08De
	 teaUqN4Lvu829+1gWsFDAGMW9kPcgsMCz0iI+RbVAZup+E0HxG0vA0gCnd1kddPTJM
	 qeUTDw59CjhRrDLhn2+w8srq7oh2O7hLmn40notzrROLB+UNheQf4/niUX7S/NlJ0J
	 MGZliOzAWnHGjEUp19XXcVSHlugpcVY3koT5arTPRQfyEu9/DQp4b/r4wNa34A4coV
	 gKXqYnC3EWsfIgH7TlQ8fspObREFRVS0PUC2UWlYO6Ui/vFONYYMqTukPfrAWQ7+ly
	 2AtDsuuDx7Dmw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3939d2bd739so69618201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 10:19:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8DGZw6qOoXKJFvfw4mAexQk0hsttrg81xOw7YIxPppmJRVoITV1++IV3w2CFL3zjj0+4K+iy2iqqxqSD1Yprkw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr7ixSqd2G0BPkYiwNH6W3YHkMbsMJSWdpM9fqB7qJ0C6QgNYK
	+Wf1rxRtRBTQ3vWYuNqppK+n522gHaQwofsaEbTsbsHIPRVPOp8Zu1PtOpxLoHJjpOssS+WHdg2
	iOYGxFqrg4D3lMTthoS0jj0xaKIiUkgI=
X-Received: by 2002:a2e:87ca:0:b0:38e:2aa7:3984 with SMTP id
 38308e7fff4ca-395d8c2f009mr26627641fa.11.1779643182406; Sun, 24 May 2026
 10:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-4-phucduc.bui@gmail.com>
 <CAGb2v67aXgg8BmrtVVBi+_n32OBcQnQgEUe3XdRp6Jj=aEr8fg@mail.gmail.com>
 <CAABR9nEFGOX5GnQ9qpJY-T-92dA_kDcVS+qBz1ior590G_x6gw@mail.gmail.com> <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
In-Reply-To: <CAGb2v66accoNhStHGhnoUM0cw3fyCxfuvS1a-brL9C-ZO07ChQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 May 2026 20:19:28 +0300
X-Gmail-Original-Message-ID: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
X-Gm-Features: AVHnY4JQEqR1NRvaAlulfLfl6JFdwlybp-Zu9dQL9cGHE5MXYGpl6ZK4AUWGpHI
Message-ID: <CAGb2v644whCr6pRSfGMuQ=5afUMbfC2Y3W_kjdMdp9+5+kJhJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_101945_443428_F57A1654 
X-CRM114-Status: GOOD (  24.83  )
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

On Sun, May 24, 2026 at 9:41=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Sat, May 23, 2026 at 3:11=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.c=
om> wrote:
> >
> > Hi Chen-yu,
> >
> > Thanks for your feedback
> >
> > On Sat, May 23, 2026 at 2:20=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > > > Enable the APB bus clock before the SPDIF module clock
> > > > during runtime resume, as register accesses depend on the
> > > > bus clock being enabled first.
> > >
> > > That does not even matter here. Access will only happen once the runt=
ime
> > > PM callbacks return.
> > >
> >
> > I understand your point that =E2=81=A0sun4i-spdif=E2=81=A0 doesn't imme=
diately access
> > registers within the current =E2=81=A0runtime_resume=E2=81=A0 path, so =
the order might
> > not trigger a failure right now.
> >
> > However, if we look at the peer driver for the same Sunxi SoC family,
> > =E2=81=A0sun4i-i2s.c=E2=81=A0:
> > Links:
> > https://elixir.bootlin.com/linux/v7.0-rc5/source/sound/soc/sunxi/sun4i-=
i2s.c#L1296
> > In =E2=81=A0sun4i_i2s_runtime_resume()=E2=81=A0, the sequence is strict=
ly enforced as:
> >
> > 1. Enable bus clock
> > 2. Access and restore/sync I2S registers
> > 3. Enable module clock
> >
> > Since both IP blocks belong to the same Sunxi platform and share simila=
r
> > bus/module clock relationships, shouldn't we maintain architectural
> > consistency across these drivers?
> >
> > Enforcing the "bus clock before module clock" order keeps the dependenc=
y
> > ordering aligned with the actual hardware roles, where the bus clock is
> > required for register access while the module clock drives the function=
al
> > audio path.
> >
> > Wouldn't keeping this order also make the runtime PM behavior more
> > consistent and easier to follow across the Sunxi audio drivers?
>
> This should be your primary motivation for the patch, i.e. what you
> put in the commit message as the reason for this patch. What you
> currently have doesn't make sense, as I already mentioned.
>
> Some background though, sunxi is done mostly by volunteers, so we're
> not overly concerned with rigidness or aligning different drivers,
> unless they share a common library, such as all the clk or pinctrl
> drivers.

Oh, and you could also add that the resume order should (normally) be
the reverse of the suspend order.

ChenYu

