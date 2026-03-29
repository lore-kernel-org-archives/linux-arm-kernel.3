Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188F6F3D600
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU0+X+y3jioy6E9J30w+FzWYOuFdPtfTOpozKDtwEEc=; b=yK/SiNIxSxanVI
	0+zF+D/d58IZVhOVcMEx4Rsk2JyHaJh1fQR+LVRO09DpicIaOmYusDHh8aPDtjF1apiMKbC1vW2Au
	AIujPU2aXWSDBfcDFMCXVUfXbZoTN2Ylc7USkA5rKsBBAO0AJ/NnXl6ftNyLd+tRd6nzWbTalNNJa
	9AULraeLzQQ5fPlBrHQHRmj7psp9hNgaUCcID7vI6n1ShvxL5KHqI6mUam/VXij2c2iXkuPlNj0wD
	anmHyQlazwyEmSDTZk/LOuJrwz1tELQWtxTAXqrt65fxrZJVU2tXrBc2TMgRn1pCFEw4pu5AlsaJ2
	lMCRX8V17TBoAoCfFwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pVU-00000009vZA-2V03;
	Sun, 29 Mar 2026 12:44:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6pVS-00000009vYq-1Ys4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 12:44:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CCA060103
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 12:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F07C116C6
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774788280;
	bh=vU0+X+y3jioy6E9J30w+FzWYOuFdPtfTOpozKDtwEEc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gPBnh9guNQ9snFeepDIQvr351lrJto9pjyMlp7/17zFrWSLCbl+QlsylP6Bq5yFOW
	 6+5v7tyyGufXfZrdKCn9wAy2Z+dZIIEhAEEO/XYzmY4Sa4zOljywdTpooyL97/OtuX
	 tRuki3qxDweAo78WYYJhboULx0S6/amh7gUatrlpA5Fbpv1wm+TGHfi8m8zud2rC+Z
	 AwmNTfBPdDKq3pd4nesyIr4JAEjvQV0xfWOH10Iu4q9KIUzPfTfGX4Gh12YtaWPP7Y
	 /efMYNJSHvc+ztzKg3xHj1dj517in1ky1KU+Hd7GGraSiW+NQ91HuAG6Fi1I8wIfmo
	 mmqnj09jistSA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38b3ee785a5so30168831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 05:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZl2hqDtIPYzw5go4NiVHSgueiNuUyclEw1Oj1LKl0KDzmKtyUyXebRRCIu632kuVgN0Efodehw+uq31NcfNvB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7wBOhoeV0V2ZHqDV6K9Lw1jL1r98lf/kjnUxKA5xR2vKCbani
	spmCxFqo0CCwRDKKQyUJl81YlIcHJjEHDzDk9KZ8Ro6x/CBLzrJt0uCCcnNEv96apmX9kiZbtPC
	0NVblZf3lNGpYNPORpat5Bb5+Taj1E/Q=
X-Received: by 2002:a2e:a54f:0:b0:38a:2a56:9546 with SMTP id
 38308e7fff4ca-38c75c900demr24797411fa.13.1774788279369; Sun, 29 Mar 2026
 05:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn> <2823210.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <2823210.mvXUDI8C0e@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 29 Mar 2026 20:44:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
X-Gm-Features: AQROBzBu8cBmUz_qtapXabXSe1cUlYbMC4_Is2O7MBHQ-BNPxfI_Wv0OKcRIafM
Message-ID: <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>, paulk@sys-base.io, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, samuel@sholland.org, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Sun, Mar 29, 2026 at 5:21=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das je=
 Pengpeng Hou napisal(a):
> > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > stateless slice control and later uses their indices to look up
> > decode->dpb[] in _cedrus_write_ref_list().
> >
> > Rejecting such controls in cedrus_try_ctrl() would break existing
> > userspace, since stateless H.264 reference lists may legitimately carry
> > out-of-range indices for missing references. Instead, guard the actual
> > DPB lookup in Cedrus and skip entries whose indices do not fit the fixe=
d
> > V4L2_H264_NUM_DPB_ENTRIES array.
> >
> > This keeps the fix local to the driver use site and avoids out-of-bound=
s
> > reads from malformed or unsupported reference list entries.
> >
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Tested-by: Chen-Yu Tsai <wens@kernel.org>

This fixes a KASAN slab-use-after-free warning when running fluster H.264
tests.

