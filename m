Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C036C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0NFoS9+2y7iZqveSZFJoD0OGDeXA5Y10KsvqOJUqwo=; b=u5125hbFQ8fcPKzSHJQvA1iPqE
	ZaR6/YgGOZds0WEGP/ZRsKx+mm5XvZACNEP/8546fzHlKEyeyLqYC+n6oedzFaNrqErD6p2pM5zOB
	FsU358YvigbAP0PoReitKoBqY5ke2cG0OmlFcLDq65hn3py0Jg+g1Os02SUUdFt1K9CBTzUI0OVCi
	u9jHp0BmGspVyoRDs4TQydoXdqES1UoL1O3l+tAGIpgU0n55kjXM43Eb01XIa2faRxAtqTPPEVPkM
	mLbpKxnckFCWo1fogz+b3o83HnoVivJGIQS0yX1uoNmladxyNXLMMSAvU9SDNqytm9dFRXHlNPZw9
	i5KscwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5omG-00000001u0K-3xtA;
	Sun, 13 Sep 2026 18:18:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5omF-00000001u0E-3VkV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 18:18:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4229A44999
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 18:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3491F008A1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 18:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789323487;
	bh=H0NFoS9+2y7iZqveSZFJoD0OGDeXA5Y10KsvqOJUqwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WAMpZ/FMenYD847yBag3A5G0SlUwxT22NKSUd6o4iVEe6MY7oTxufILfllw6VdUP1
	 T4o7ACM03eZxz8niSdPhsrlSzZ5dpCM7WrGGwx79uBd3vAfnYydpbzqg14WOe3/DQ8
	 OJPLDz0+NDRsis56sUTfowj1KyCpP3q2IrSTB3ee6qtvo40MgOPcqYYufpamcSHyX/
	 49uv4/1IALQjbFeBjApGQc0GGOU08Z9SuSxXkUiXPXtm20XiYfiIFhgV/SrLuldzGa
	 kFR53Y1gnR39taZ0N+DREjR1Q7ZZlMO6WUbVOMDfttS6KfMjC2MkSCvYMQUCMiiOJp
	 qeYY8aq8q4WRA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so1429167e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 11:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjRbeF6rbxSHcOGbND1bIVZ2BAqOUoZMSuYuvqsXUmyvOhjzr0HKQmCTIsbg7oNdYfJye2GVqajJTlIu41QcRy@lists.infradead.org
X-Gm-Message-State: AFuF++nueEZYP1buOcWAdIbEV4rhvp1X+untWymJZs6tHHrIMQPKqyvw
	NSAu0Ghy6ItnfTMRnEW4AxBQaeEg6uzpvw7nRJfnXHUp/PKIKWCkwEGLGL7i0QgFhlOc9ydPfu3
	nd1ezmsFPQmHkfQ3i0jgCPr2n0igH2uE=
X-Received: by 2002:a05:6512:3b13:b0:5b6:1a7c:25 with SMTP id
 2adb3069b0e04-5b8a8ebf0d0mr1454068e87.40.1789323485809; Sun, 13 Sep 2026
 11:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info> <20260912123827.3aa54e58@kemnade.info>
In-Reply-To: <20260912123827.3aa54e58@kemnade.info>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 13 Sep 2026 20:17:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
X-Gm-Features: AcwNN1UhT3IBhd9sabdzVfWZkJmtNd6FtdEL70-jgYFlsMV8Amx-h15txYxKTIY
Message-ID: <CAD++jLmdX=p7Th3omP8dMQuUPyTziMDwMeGPyT9PEGw-wnT5DA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
	David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, j.neuschaefer@gmx.net, f.fainelli@gmail.com, 
	Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org, 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Andreas,

On Sat, Sep 12, 2026 at 12:38=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
> On Fri, 28 Aug 2026 22:32:18 +0200

> Andreas Kemnade <andreas@kemnade.info> wrote:
>
> > Add ZSTD compression to still have a quite high compression but with
> > not too much boot delay penality.
> >
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>
> Anything left for me to do here?

I think the patches look good.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put them into Russell's patch tracker:
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij

