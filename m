Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD023E6F095
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBd99sFsDzr3RqRdPe5qJoyoWGaL7p/NWTHuLq0D7w8=; b=FqoEf8KWreNbeqt9NzyymYG3F8
	vaGV0ZsTIy6mr2dxiNxSwEf9+QuUlVvzL3wMWlBHVHJLw1suqz8UPuV29gA3sPJuTGX1moIeyT/V7
	j7A4xZJIQzaM72afe2XLn+PH9SxF6GVyLhiQv/Tkt90ayencZCxNMQAaad7Vr/oZO/BHOhB3Tk7Rc
	VbaRDtu5n0XIG3TqG2Rkhg3geYREo6TkSwayEGIrc2ismR9H3buJCAYqOzNf1Hq+VbH4zi4xhYSWj
	UxtZFnbjDLujCGrjF3WodijsLuTa0xcQqXGVKXn0DdXIkAJBuoBU+8usyp2QniFgXk2efHkUfPsoC
	A/pMeP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY42m-0000000FexH-1Stw;
	Tue, 23 Dec 2025 15:11:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY42l-0000000Fewt-1MQN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:11:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69EFA60141
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3273C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766502682;
	bh=hBd99sFsDzr3RqRdPe5qJoyoWGaL7p/NWTHuLq0D7w8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HscJwIiyIaDTcugZolmE0cmSpADXJGHFjUpBlkDaROd55L+oN8Csh27PiHW46YJHO
	 0Vg9/Lj+clrBlQsCwLVLYyC97RVVJ17XbEI4AckP4Ck83e5jhVDb1IG/brgY89Tz8n
	 fG56tzdzDuiklT7my4Un0bkCFuyKT2g30h+Vy+G57isKQMZ2JwOXYF2M9SCl0SoG92
	 7dbDu+BEAcsGO4oexsFk1B/WrYcvAxCujGHZUkAr4BVpfmYuAS+QIeIYcF6jlGL3dO
	 XMpW+GojzJyRODYogUXvvj3+4rFMQcc/kaEH58YhZnsh+UHzc1xOX+JbzLo2PDPuE5
	 4sizM2ROUZl1A==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37a2d9cf22aso8240361fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 07:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2Np7mBLP9aUQVY7cPdxg/UNICOs0ahI/oknyHcnUj5Bwafpud3bpf620a3kboAQuTABigljlmbjJkX4q98Zfk@lists.infradead.org
X-Gm-Message-State: AOJu0YwzNx1x6wxVisYtdcW4NrqQdxRZCNFbzlazkhoHNb01CEp+domw
	DqhG9Gndh9EOxx8NdKjeoVQHhOvK8bq9IrtmTLPsBXNBXo6QCcAruZYLfotzzduxZCEwrBgFXXz
	EpoDtTvqxK9LdU6tnI8BCoupsO8nDAUs6uUAlb2bl+w==
X-Google-Smtp-Source: AGHT+IFdufR6j9R1oFKNSbl+pKd9Z0pO11ahHM/zkyZYbJzkzxH5yHhlEwogbQjTtBxGrsqfRKfJTkaYfWLXkoOjLuo=
X-Received: by 2002:a2e:b88f:0:b0:37e:6b29:111b with SMTP id
 38308e7fff4ca-38113162f37mr64888811fa.2.1766502680316; Tue, 23 Dec 2025
 07:11:20 -0800 (PST)
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aUql_tZisfH8E1bq@hovoldconsulting.com>
In-Reply-To: <aUql_tZisfH8E1bq@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 23 Dec 2025 16:11:08 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
X-Gm-Features: AQt7F2oePEehO-JdLKixmyMZf7bMW4cvrFzOuWvK19hmXZhvMoz_mkpRCfNkPVc
Message-ID: <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Dec 23, 2025 at 3:24=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > It's been another year of discussing the object life-time problems at
> > conferences. I2C is one of the offenders and its problems are more
> > complex than those of some other subsystems. It seems the revocable[1]
> > API may make its way into the kernel this year but even with it in
> > place, I2C won't be able to use it as there's currently nothing to
> > *revoke*. The struct device is embedded within the i2c_adapter struct
> > whose lifetime is tied to the provider device being bound to its driver=
.
> >
> > Fixing this won't be fast and easy but nothing's going to happen if we
> > don't start chipping away at it. The ultimate goal in order to be able
> > to use an SRCU-based solution (revocable or otherwise) is to convert th=
e
> > embedded struct device in struct i2c_adapter into an __rcu pointer that
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> No, this is not the way to do it. You start with designing and showing
> what the end result will look like *before* you start rewriting world
> like you are doing here.
>

The paragraph you're commenting under explains exactly what I propose
to do: move struct device out of struct i2c_adapter and protect the
pointer storing its address with SRCU. This is a well-known design
that's being generalized to a common "revocable" API which will
possibly be available upstream by the time we're ready to use it.

You know I can't possibly *show* the end result in a single series
because - as the paragraph before explains - we need to first hide all
direct dereferences of struct device in struct i2c_adapter behind
dedicated interfaces so that we when do the conversion, it'll affect
only a limited number of places. It can't realistically be done at
once.

> We should not be making driver code less readable just to address some
> really niche corner cases like hot pluggable i2c controllers.
>
> But in any case, don't get ahead of things by posting changes that we
> most likely don't want in the end anyway.
>

The changes I sent are the result of another discussion with Wolfram
at LPC so I'll definitely wait for his take on it before dropping
anything.

Bartosz

