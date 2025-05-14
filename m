Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B3BC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8jj6jRyHpEahWPL1bxwBIDklu0Ui7Dm+eEH5GeKLrc=; b=D/T8Cpm2eZxGmr9fEU3DCVOewm
	GqKwTbG8uggEMpH9K7+vrP9T//ZeouN+E1fIBiTh6BKr7A2kjoa28EGQREujNtLNpvL+P2vUwkQYh
	u8jjdqYvpxiYylX4KGR1xXkZZwp8mXPLLAcfMvCv+nFyei80RJ9iy0NLGxJNusZavj10QFCBbdjd9
	VGXeDu9s6bvE6mpVUqNTrZEIlJHnrhW1J8ofUA08LK1rEsGAjn8Jg1y65LauNgFYR8jnW/MyLtBIY
	0MgjPLsFoVl2yQG3jxMD+Q3cYGs7hzio6nrNVcIsh6qhf9R48t3khacxUdjS3EL9t+nzsdmmok5sT
	FASyZZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFENQ-0000000Fe63-195I;
	Wed, 14 May 2025 15:50:36 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDnN-0000000FXfg-3Flj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:13:22 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e73e9e18556so1038985276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747235600; x=1747840400; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J8jj6jRyHpEahWPL1bxwBIDklu0Ui7Dm+eEH5GeKLrc=;
        b=EBPKuSDE2dIn9wEsDTI0NBMcNQAtC3PLS4enmUi15dTuIrLS5lPBaKOfWNK2oegR2M
         pf9auUegpr/1JQnwrje7o5qN8ArjXMccKnpuRCrX0BYBUwrb+sYrAflkg0M4FYwoZDLp
         00KAUlag3HpC+yrfvjq7sqGeEeh1KTqhDF09GZ2xirQ1oTlv/TQ2a9TW5EVg44eTcDce
         bhZf8qeKdLyyQWSJqBS5fe33AdxVp6cOahRQVvMnJ9gpoU1JtLuEnE/l+1THZLWCXija
         0/TXYOLjRcRCYOrat6W2kCzhDgyMHvouukBjyqU4I0kVu4DhAgSXk4IBbmaXQpYaVm1R
         cP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235600; x=1747840400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8jj6jRyHpEahWPL1bxwBIDklu0Ui7Dm+eEH5GeKLrc=;
        b=wyao208eXOkCtlug7xrftvWwN1B6v23plqUai+slfs+VDXJw8AbUO9ju1vS0fX92UR
         G/G3VaoUXlOCUhM0u64ul4l8h0Wc7mW7aaYtKqOSUHVLN+0R8Nj4hfO1tWP/rFWU9kvi
         vlXYkEioL00tquBGm4HbDL2pJBhrwPjSqd2CcAW4FYZFslAnOdmzDumHmoOwsUbjNvaV
         76Bg2UybXl7dy+IxNC7YCPeIY6kk9x81ZmeXvr4mQ8P6Kjy/uYwsa7p08lV3YNICYRsj
         cUAw1hEtgGWpYD6h6BBJ4yVQ9ev/hR3MOc88NEJAsJKKYPjRzNJcrEiGshkGTX9nfg/N
         /7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWTx33iGJmr+htjRt1fpwtZyoOFCRJW6KKLZ81j5MP3lf3axScGgAqGY0GhvpFhxYnCn//D8vXhqO4KNoU4eQP@lists.infradead.org
X-Gm-Message-State: AOJu0YzQOjnMZExM28InUOuxvYYLor43mi/hyR4cA5nBrjbNsoHyPsQb
	JkxVa6+OjzV6UNIJZOlwfmCQhskLlFiTicZzZEfiMuWqJ1iqZDiA1yLTK2IH7GNwLaI4gFT2TH7
	S4R3QMqOCO06zKON3RK0z+IRx5JY0de6j9Upvzg==
X-Gm-Gg: ASbGncu7vJ3+8SEYK0DHfEJ22mtgPY4Qtwvazg7yW8N9vvDD2WpBR0YUeSiDyqPVoS7
	tPGCeIiBW7gINAfDoZfIWqRuPDphz4rKZxMDYUgy7ROTlPlBLseHDm4ErnAz8EjozJnEz4iNPrg
	Sa9n/0WCumYLQsh0sonhgPOVDJfM8aJI0=
X-Google-Smtp-Source: AGHT+IHfG4IdFhrynlohLcjINUvWUYxudJNltoIen2Onw6R0djfVvCV0/FdSfcdQNubeHC89QVS5keitmH669vIpZ7M=
X-Received: by 2002:a05:6902:2389:b0:e78:f538:1c54 with SMTP id
 3f1490d57ef6-e7b2bde5e59mr11105285276.4.1747235600229; Wed, 14 May 2025
 08:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-rk3576-emmc-fix-v3-1-0bf80e29967f@collabora.com>
 <CAPDyKFp5N23KCZwOTba6vGyk9eaS1-SjSqY52FfPDng-bahn6g@mail.gmail.com> <6154950.lOV4Wx5bFT@workhorse>
In-Reply-To: <6154950.lOV4Wx5bFT@workhorse>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 May 2025 17:12:44 +0200
X-Gm-Features: AX0GCFtDU_yTZnx-ehoHmNHeQ7h0DL35V2e2RHKt0pgXDptXnpjYmnfRRnWBnck
Message-ID: <CAPDyKFpohUibXp_ReVquAxYHY7vZ28P1XmOCTU5GPQdLKYEaNg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-of-dwcmshc: add PD workaround on RK3576
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081321_824501_C7E538ED 
X-CRM114-Status: GOOD (  33.70  )
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

On Tue, 13 May 2025 at 16:27, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Tuesday, 29 April 2025 12:06:16 Central European Summer Time Ulf Hansson wrote:
> > On Wed, 23 Apr 2025 at 09:54, Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > RK3576's power domains have a peculiar design where the PD_NVM power
> > > domain, of which the sdhci controller is a part, seemingly does not have
> > > idempotent runtime disable/enable. The end effect is that if PD_NVM gets
> > > turned off by the generic power domain logic because all the devices
> > > depending on it are suspended, then the next time the sdhci device is
> > > unsuspended, it'll hang the SoC as soon as it tries accessing the CQHCI
> > > registers.
> > >
> > > RK3576's UFS support needed a new dev_pm_genpd_rpm_always_on function
> > > added to the generic power domains API to handle what appears to be a
> > > similar hardware design.
> > >
> > > Use this new function to ask for the same treatment in the sdhci
> > > controller by giving rk3576 its own platform data with its own postinit
> > > function. The benefit of doing this instead of marking the power domains
> > > always on in the power domain core is that we only do this if we know
> > > the platform we're running on actually uses the sdhci controller. For
> > > others, keeping PD_NVM always on would be a waste, as they won't run
> > > into this specific issue. The only other IP in PD_NVM that could be
> > > affected is FSPI0. If it gets a mainline driver, it will probably want
> > > to do the same thing.
> > >
> > > Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >
> > Applied for next, thanks!
> >
> > Kind regards
> > Uffe
> >
>
> Hi Uffe,
>
> I was wondering whether we can get this into 6.15 as a fix as well, as 6.15
> should already have the genpd API additions this requires AFAIU.

Sure, it makes perfect sense!

>
> Fixes tag could be something like:
>
>   Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
>
> but may need some more flavorings to keep the stable robot overlords from
> trying to apply it to 6.14 and earlier and then starting the robot uprising
> in your inbox when they notice the API is missing.
>
> I originally left out the Fixes tag on the rewrite of this using the new
> API because I wanted to avoid those awkward backport scenarios for a fairly
> freshly supported SoC, but it'd be great to have this in 6.15 because that
> will be with us for a full release cycle to come.

I added the fixes tag and a stable tag to point out that it should be
applied only for v6.15+.

>
> Kind regards,
> Nicolas Frattaroli
>
>
>

Kind regards
Uffe

