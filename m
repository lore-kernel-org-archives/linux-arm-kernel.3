Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BEF1061B15
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 16:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDdS45lavJOKhvVvf7Im6p8b+Plxzdq4VLLt3nmyGa4=; b=vj2aFtmg2dqFuU
	M8h4ELl4oxOC2hsVFjPKhHDxBErJFfkuHzT9Gj9MQ6E4BFmWXCNWzAhWFEDrani8d9bWtK9iyRpg0
	wZqDcpzbeRULyqu/TD6NWy/fzZoqbLBIDNQ9TNw85X79EYi9jig3nownbJGy6Sdw9dhPwSDBlC1l9
	PKbjeX19eRCnEjyQ0fiSkUgZ3IGAwDhs741tl5gLHo4ViJ7vdrhfTfOpb+XKbXD4rxHiMVqAiCrvF
	j86ThqqHPO2wyO8CGrvAY2/zfbaz7KtForyvJwQ8Mqj1DYnGK5AdBS2CMEIKCF+cjh7X6WvGu2Xs1
	aIQSdyQrHfF2TApB8rfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Fjt-0000000Bf4Y-1GRC;
	Mon, 30 Mar 2026 16:45:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Fjs-0000000Bf4O-11Dl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 16:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4331860128
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 16:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0D1C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774889118;
	bh=cDdS45lavJOKhvVvf7Im6p8b+Plxzdq4VLLt3nmyGa4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=BawTVvW8MfthtSM7EjuuTexhu+g6v03GXeZmrU5PJ68JA/fGMBCWNIN2w0UAoGeVQ
	 3LBMLnsEeFzryjqocEIOr2JWRmS3Ys4N4jINcIoqlz6qlHK/OAHGJr8j3/A68i0WOr
	 Uc7oE3e1hmKKXP5aMtAs8FaptvXbhYRuUbsMZZClZqzkjrS27q0beJ6Qj7+CsJu7B0
	 kWzSWCqs94JnKjVyiofE9D3IJG1SPaXiCbPY4ZiBx324rwgbJ0pcghUVj093YlbB91
	 Fn95Wou9t4owNwX/4xfYYODNI6fPLDEWWqcgEpJnhdBWn1ZAJghXCFwZGzRKSvrdwg
	 EOqV8zObOAmCg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a3066b68bso30698511fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 09:45:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeFzbRF/5thn1lB37zREdgduxWpc2V/1KaFfeHvfpeq4HFFcKP3o6MfOX2eCLPk6PXCV3VKns9MoGqpV6Vk03K@lists.infradead.org
X-Gm-Message-State: AOJu0YxC/yhvbF475Fe8HtxKRSnP8Ourla/TO+Ws21M8FTxpGwpmI70s
	YcC6b9GBvG4kN2Unb9pj5rZcmvHmfjWIV2By3GMQlCeDCsndAMVrYySBEd71/zSDiir0EaEbDdq
	pMNqo2PCk5LlGe7CSALaYaIprxS4FIBA=
X-Received: by 2002:a05:651c:3041:b0:38b:dd7a:52aa with SMTP id
 38308e7fff4ca-38c731eb805mr36701791fa.7.1774889117273; Mon, 30 Mar 2026
 09:45:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn> <2823210.mvXUDI8C0e@jernej-laptop>
 <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com> <603785eb48d69bc50c0296fc696eb0985c2a3ac5.camel@collabora.com>
In-Reply-To: <603785eb48d69bc50c0296fc696eb0985c2a3ac5.camel@collabora.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 31 Mar 2026 00:45:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EM1rZwePR2B8Y-ipz4iEJPLnd4jsfu140N9vq4GYL2Q@mail.gmail.com>
X-Gm-Features: AQROBzCCf-gBGZiQsgZ0PWLzupAc_iXzFsXr0d6GTNbJZ5GFha2Q7zktumWSWEw
Message-ID: <CAGb2v65EM1rZwePR2B8Y-ipz4iEJPLnd4jsfu140N9vq4GYL2Q@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>, paulk@sys-base.io, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, samuel@sholland.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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

On Mon, Mar 30, 2026 at 11:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le dimanche 29 mars 2026 =C3=A0 20:44 +0800, Chen-Yu Tsai a =C3=A9crit :
> > On Sun, Mar 29, 2026 at 5:21=E2=80=AFPM Jernej =C5=A0krabec <jernej.skr=
abec@gmail.com> wrote:
> > >
> > > Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Da=
s je Pengpeng Hou napisal(a):
> > > > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > > > stateless slice control and later uses their indices to look up
> > > > decode->dpb[] in _cedrus_write_ref_list().
> > > >
> > > > Rejecting such controls in cedrus_try_ctrl() would break existing
> > > > userspace, since stateless H.264 reference lists may legitimately c=
arry
> > > > out-of-range indices for missing references. Instead, guard the act=
ual
> > > > DPB lookup in Cedrus and skip entries whose indices do not fit the =
fixed
> > > > V4L2_H264_NUM_DPB_ENTRIES array.
> > > >
> > > > This keeps the fix local to the driver use site and avoids out-of-b=
ounds
> > > > reads from malformed or unsupported reference list entries.
> > > >
> > > > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> > >
> > > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Tested-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > This fixes a KASAN slab-use-after-free warning when running fluster H.2=
64
> > tests.
>
> Ah, very good, can you cite which test caused that ? I didn't expect flus=
ter to
> cover cases with missing references. I think it will be handy for future
> testing.

Looks like it is FM1_BT_B. And it only happens on the first run after reboo=
t,
or KASAN just only reports it once.

BTW, this would be a lot easier to figure out if we could get fluster to
output a system timestamp for each decode run (at least in single job mode)=
.

I had to hack in delays between each decode rune, and then look at `dmesg -=
w`
and switching back to the window that has fluster running once the warning
triggers.


ChenYu

