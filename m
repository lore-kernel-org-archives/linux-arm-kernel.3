Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C13C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=; b=lxDomBtSVQv8VkkE38UPFkdD+n
	TN3c62Huk6I4Ww992fkqrnVguTlmRaGvbbKgcbWPhesiDSugrY3NSfJ08yXoSiieMHcC9cFkNMYbm
	qIijtLLWgX657kgYxC1KLJFgsznmWTzxNCp7zoE2l44JdA661SMvFti7iIJQ9yfKuoRnU2LGEnls2
	LNASRgO2YvVMiTLIuZV6IGz6hyzFDoK5j9t7LRJDMOy7ph0v5L7SGFQHCofssk7O8BmI1vDFKFuuU
	ROFBZKe5gEwgR80K2oPo1+uy1F3l6jMCUktgiBLpPqXd5mf2yNTsZanK/Y5NFKS3Us8O3s5o4oSv3
	PLMeg+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmgd-0000000Bg6V-2aqt;
	Thu, 26 Jun 2025 13:30:43 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUmbQ-0000000Bf5A-1gsb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 13:25:21 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1150505e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750944318; x=1751549118; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=C401Z5zWFUczgdu+RBNEQAgm2MZb9fNACXR6guaFNGY8Kr51SdBIPlt0dFN/D5PEyG
         dyoW8AFPTFbPc15NLO36ZbtW0HUcnMYMEu8hvfxB9sj87e5YQun3slMw40ygE7NLGKla
         rZ20sHsVpJ6c72yIO1WoRTWazyz/yu+9kxtvuvU60S1BP3s9QW5MZ2491jvt/bEuYHD9
         GIrEiR/6H3xe35GGuYlVgB5dS2pfBTvkrjSJMDuR45nojtMzIBsBTfB5I0zCBaWx2iKS
         iF0nS13VfGJ2oQUuruhHErfe1BfBeU1eAH7VGxK+MCjRsVBGJWxoPGgcSYkIP3CSMXqr
         ivBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944318; x=1751549118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=ScZ6OrfR/9znpNVFBVm9lyomxt3LgiMZqmQtPLLNOJ1jS8458jsvc3kX9ZqDnzBHmT
         T/jtOTUxlAMskPLoqFsBwd2GQbL1ZLY9eCF192w/9ZZnNcjqtCSL4JQz394fDmb5pkHc
         dP9P28uTZtNLOHQg36eXISvXR8Y/9S14tyBTtXjFi05SkodZ9nHr0wctWUJu+/Qt6jes
         +HSVbzU6+Vh6kz7BKLUCelv5GTJiRIFHhZlH9jx/E9gb3FqTtWS0JvdHQlxCXWKwgTHW
         nEagR+uh3Lq4m85ukXjkmpp/djfAzz27jsk2zmHiClNUNR2UveX/trhcktcppb5NFdl/
         Mq/g==
X-Forwarded-Encrypted: i=1; AJvYcCWhFD3+G+J4pq7FE8bkReHMK01Pl+uyflRDyPFWgSi3NN/tW08Sp8co2l69IbhP/zs67lAX769087ynAtriYcm/@lists.infradead.org
X-Gm-Message-State: AOJu0YzYMBydZM4J76LPiDpFRSu7msoh9fPohPMypI25rVyY7QWj77Ie
	iSUce/PgdNSu6p5k1yOYY9hkL6TjOby1PKli/ZTPfIgOFwMnOlCyRc3GbymaRPwJ2duaDba+PEH
	gWBqmbnAbhpPfUcI8OAkCTfq9Zt21nBCFiBjH/649Xw==
X-Gm-Gg: ASbGncsgmUge7se61H2yEwijMPV5FzNf0HVWc7bKk70VN7ehOQ4o2sPwsmpW5KJi0si
	pttEHY/9r+HT9OqXmM9GjtRTOrbCrv4Ge4PlscbpjpTB3Edm/xxs+CUg042tFi9A5neCCGa+CJh
	kN7QOISiezPV4+DTSxG4tv7MQY7S0X0wsi22BywZNeKv+1p0FJbEbMCUv5feMF4FAoyW2ppIf1s
	w==
X-Google-Smtp-Source: AGHT+IFZCHpg6dN8jQOP4LGMeE8N6TdaxL+CR37n8aEWMLkZ46xkrupRdz8U89iquKgLZ75BaGxTbVJfXxSWy4Rbayg=
X-Received: by 2002:a05:6512:691:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-554fdcc531fmr2571744e87.9.1750944317960; Thu, 26 Jun 2025
 06:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org> <20250626132257.GE10134@google.com>
In-Reply-To: <20250626132257.GE10134@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 26 Jun 2025 15:25:06 +0200
X-Gm-Features: Ac12FXw9b1Ua2nskF_gKsApdHRnQVgOC-Rscq226tK5vt_NGX_5zRRRras-l-hs
Message-ID: <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_062520_549999_28CF4B20 
X-CRM114-Status: GOOD (  15.01  )
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

On Thu, Jun 26, 2025 at 3:23=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Replace struct bgpio_pdata - that we plan to remove - with software
> > nodes containing properties encoding the same values thatr can now be
>
> Spelling.
>
> > parsed by gpio-mmio.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++---------=
--------
> >  1 file changed, 28 insertions(+), 18 deletions(-)
>
> Can this go in on its own, or does it have depend{encies,ants}?

It will break the MFD GPIO sub-driver without patch 1/6 from this
series. It would be best if you could Ack it and I can set up an
immutable branch for v6.17 if you need it.

Bartosz

