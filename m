Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B670FD46C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 21:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=; b=jGBcuw8sV93pqzZgn8qlxxZC7N
	mLH4eUfTcplxRWmJ+Hg9bgFP/s4NKIpGbTOv3/W+GGQRq9UAlG+JmrOpCuIlJbO7IwxYbx0CUo+Yi
	fe5bR+ykW/d34BMjoIjq8x35jCqwdaceOyJ5i/g1Nob6HAhkDkOMK1k8s/qxQCLhwVO62A6xtPlks
	U17M0BAH+q0bGYz0wJtujoqIuCgcOAzQNyNM34SANmWcXY6h/dTRJ68Vo+/O2RKxSoEE1D+twGqJ2
	o4qJsztPC/OWIco8dukI08jkVlhx7I1K5jKY0LyJ/PCKvj6aRmN40PknGxo0/huDailfMy2U+q0ig
	3mXCVL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlD07-0000000GqE8-0Q2G;
	Wed, 28 Jan 2026 21:22:59 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlD04-0000000GqDU-3KPv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 21:22:57 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2b73112ab62so391650eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 13:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769635375; cv=none;
        d=google.com; s=arc-20240605;
        b=hEJlvMCT/eW7LXZ4vqXHx+E5mIJRvFi41wW4RK1R1bwjvxG2pLIymxaDl0h9aCJ81n
         Ux7ORw10j6Qgkkw3OOGD8EtDLJmBUJ6BjPsBP3ypnjCRev10/2G18w7iR18HQhAHCpcm
         min35RfYq8R2uKROMGECcklvaHv39JfhWqhcz3nl8RGlA4pes8cnhzfBNl9Z/isxD+RN
         OVk9PMWgzJhVPLVKyPNcSs4qe+LV8LDMfUlP2ZJaF2vdPpu/7GrES2m2CZ5CjcUFZkeC
         15sBVCSfcqm2/i0yyvDa0vKnx4UocK75iD511Mw8YOKh3LGhN9jjyFggnpNwxAzeKabg
         WB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=;
        fh=Roe21sJk89Y0XdE6OzBXqMB4D+elN0bClPKoxSsnqM4=;
        b=IWpItVir6Bjuy2ta80nYxbzn1hCligMQ1zF+ts3ujEfc4pCxp7d7NjyRI2DhOMnCcM
         mytc8CCRCwEF4dLKLB0Uy92LFiZfIeM7BVmiv61B5mzFMeaxt40sZ+gkzA9RnZmnnp7S
         VKuxqPtn/tlhvy2hswDvm4fX7kKAvkFYeWM/Cfj7tsfEk8b4oe+Z7GL9kFrEDO/Qa2/e
         uXFMvulh0NnKFiSox7auUQQkijpuKFUPG/MDf1nPbP3QXzNyCMJzV108A86bVHMBd0Z0
         ddyjyJZryX23RbwPsYn2jl4BNOk9tGVSH4twErEFBCdMEZD7xwHaseAxjNqkOUkv1coD
         2Mhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769635375; x=1770240175; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=;
        b=NVIn8t2pNk6V7mimxtRa11WBriWykAmPvxd7aXpHInvsbef72rs06zbZZMiZWiKu7g
         8LK+lqYy1cQoYbVSfDH2SQ0AoBLlg2jA7NbxIOtspSGLh2alTVgGNi81s3Jz17XG30iA
         zoNlfvLMiGHKoKOqmKDsD4XWRdmArFyn/ul7fuj53W9HsQZSpUvXRgeIQ/owgj85Vvmd
         MdggmLslH4LVGNy4x5vUb0h5hh8+67/cjC2nWB03redHEkdJDgjPeeP/Ms0L19EoGEoo
         oj8hD25ssst/B6STZKqzFncoxloqRiUqBa8qAFYU1RYZ3aImFhDPaWlwoB2Y+riXKg9S
         me9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769635375; x=1770240175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kV7JU90MnAIuGPfKO63hZKuasHHohm0DIZQyxaq14ig=;
        b=dzif3OhUy3OCvfsJjm2rzRc5u9LnJXEazJz33+x7PUKk4S2GEnwedmw3mlcZsw1DX/
         vY3fjyyWDD7VABkUgi+AVfO16wAgJ3lFmO3YvJwGGTviZ+Fcp5arApMHXliARE2/49/6
         yh43p3caQiPllazM8mFvzB84ftYmoc7qAt25oLni2fB0+NIn8SlqYdUWaCir0EjFlfcz
         8rmSDw+mDU3g1vwtc0xaM90qpLzzzXeuKfsWRqSOTFEwdCA3Fck/zR8kRKQyUOXX3iQa
         XL49NXuoo13tJD2SHh5EzcYD5mgvDy4gsGaMVHGi97QXUKh8wLzZXKNU+jqCIAA8ycpI
         Nflw==
X-Forwarded-Encrypted: i=1; AJvYcCWXHpv6Rsiwu8OsM87cGmdioo2e2wNJZEOyhUHLcYvmnDvOybpflnr4w2Y//T8sW5XLe7xkVQb5oipoxHr8Hiy2@lists.infradead.org
X-Gm-Message-State: AOJu0YwKflzt3ta9Lc+Q6YdKJDLE56QczESEFppMR5bMQzJmZ3qDkSA3
	NwCBKQ1e/AsFdtuU/TxjYn2ELPfmgIa1XQBhodFS1mgVAbR3MyOn7dQ6L+Dr/pp1exEkKPD+INJ
	j5tqZrLnLYb7bczPidy5FtYuCH/tlZ30RsXzNbFhP
X-Gm-Gg: AZuq6aJXRWuvvF2B8dwjWKRIOI3pWz8y23nHfgCv6WLzHs8Dk1T0au/8Z/5haAWy5Mb
	8dAHYS4206n1ZIOwAq8Mg7kXxvGD/AbuKYmomyszW5nlV3fPZM+T9WrP5a308mJbxPxATy+gwZ/
	2RNQAEEHpN8eJoLsbbcUtYQPZX9f2zyLgOUR9x6xAZWZentReyYLyyMOMJn4t/agkbw4YBZKRUj
	M7XEHN7WM8E6lppxs89EAUhSHtTTCSz5NqWExiQ5O9y5Z8+TxXajekQ/ROFQ6AhzautqH9rAc+J
	Xv2uSeR52ka85qAxIJH+NYKd
X-Received: by 2002:a05:7301:7018:b0:2b7:857:db6a with SMTP id
 5a478bee46e88-2b78d9f1c0bmr4508715eec.21.1769635374810; Wed, 28 Jan 2026
 13:22:54 -0800 (PST)
MIME-Version: 1.0
References: <20260121-next-v1-1-c18068b091b9@google.com> <7c78f9da40022e7bbf850ae8989c617bdc30cc95.camel@linaro.org>
 <CA+zupgw5H5rumo+DxaTfA_=bcvjbBOivm6R+Pw31jgE-sMyEtw@mail.gmail.com>
 <f956ccd3f5f694de7a634819da3f790a8dce132b.camel@linaro.org>
 <CA+zupgwEWM4c9yK1f-Y_Cv5gk=0zYNuUb3kZyZ6O3FDRbPPvKw@mail.gmail.com>
 <eebefae5273bccce2d0fcd97afe3ea28bedf27cd.camel@linaro.org>
 <CA+zupgztBHTJwNPEOfXjdw9TpcpiVGO=hdFBYk3PUo-0Vf95mg@mail.gmail.com> <f13cf27da2d1d7d8a54448391c16a8eae349e8a5.camel@linaro.org>
In-Reply-To: <f13cf27da2d1d7d8a54448391c16a8eae349e8a5.camel@linaro.org>
From: Roy Luo <royluo@google.com>
Date: Wed, 28 Jan 2026 13:22:18 -0800
X-Gm-Features: AZwV_QjQO0e1CUwWeMWnyIH6YTKBepQmAq6Hj7xEJz2yP_wXTgaH8YOFAHXb_6o
Message-ID: <CA+zupgzMzwt0Uah_a+frFf=Ek5nG_zFTsupbZ-ZHoAUi0wVxZQ@mail.gmail.com>
Subject: Re: [PATCH next] phy: google: fix build dependency for Google Tensor
 USB PHY
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_132256_863246_1A435159 
X-CRM114-Status: GOOD (  16.61  )
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

On Wed, Jan 28, 2026 at 11:57=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> Hi Roy,
>
> On Mon, 2026-01-26 at 18:34 -0800, Roy Luo wrote:
> > the wrong example. Let's look at this build error scenario with
> > "depends on TYPEC || COMPILE_TEST":
> > Given COMPILE_TEST=3Dy and CONFIG_TYPEC=3Dm, the
> > "depends on" would be evaluated as max(y,m) =3D y.
> > Hence, CONFIG_PHY_GOOGLE_USB is allowed to be
> > set to y, m or n. When it's set to y, the exact build error
> > would be introduced. I also tested this locally and saw
> > the build error.
>
> Thanks for trying Roy. In that case, it should be written as
>
> depends on TYPEC || (TYPEC=3Dn && COMPILE_TEST)
>
>
> Cheers,
> Andre'

Hi Andre',

Thank you for the clarification. I noticed similar expressions
like "(CONFIG_X=3Dn && COMPILE_TEST)" in other drivers,
though it seems less common, which is why I was initially hesitant.

I will send out v2 now with this change included.

Thanks,
Roy

