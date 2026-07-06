Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16F7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 22:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC+XXyXD/yQ5FRMJcO/PAU3VyED8Rl70beuaZTa3v3g=; b=Lp+i+zwUj+IYjMYKtwAgVQTibZ
	rNvng0ByHkNfgahAWaEgs+dKa6hNSC8EUN1Zs/CPY3b+Q8c++MOu2z6zU+lHBWsm0Ha0ARRdlzffW
	YF4i0bDC4ip1GbOoHRoeVCUgUhI5iNV2ElhjFS2qjKLX3cLerMei1iHYi/p1MG2aBEJbzmtA2U1Zc
	8UNuSikecCQyFR00hSEXMujPXE4rpTppqzSq1R2yKY/s8mzd8HlPToc8JI5165knCmFcaHtA1eQNL
	GyUyAzEt5YQtE6LiU1Oq7FDklJJMCo8e1bYevYYI2mtrlpHl1ODN6VrBW4uOe9aKn7eLOVNGEvKC3
	i8mr+Nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrUk-0000000Dh6n-3p1Q;
	Mon, 06 Jul 2026 22:08:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrUh-0000000Dh6T-46ew
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 22:08:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-381ed661712so3109570a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783375730; x=1783980530; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dC+XXyXD/yQ5FRMJcO/PAU3VyED8Rl70beuaZTa3v3g=;
        b=H0oPQH3T4bM+DLBM3gIRL8Hxr2rqhdSGcIUjK+WtFdHRrW+v+RbwtgGNtKupCSVthB
         YJxSbdOrhrF7uKPeystkSdco5VNcJqU33rZ9w96dZoJEo5d3i3d6YukwexQasSw80G64
         ZL6X/ke9NyU9/SNk54BVhO7AmwwrAve8HjBQBmVFBKegqN5HkoXjfEv5L6DExS8Y5HhG
         oUIBrKkhP34B5wnOA8TrNLCyXNzCppMbXnSRkf+1Hx4aAbRpj5ba6tYVOMvmgITOcMnL
         GKOteMKjxcZHTTe8tYSC59qn/sRJFi7Y9EzWlOx/wSN8v4k6o+H0L0eNz1gKAIyBpOsg
         Kfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783375730; x=1783980530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC+XXyXD/yQ5FRMJcO/PAU3VyED8Rl70beuaZTa3v3g=;
        b=bRQNT3w9WdUKDy7ja+5aIUiv9Rl8OanNTQR75/yTyiI87aplRzirYT+wXLbdsefFxG
         sdD4zeEbSH5HcgQIic9JcQuHwfwcx8rM+7DGlNJEQf1pD7jLQ5Pv17KQHhkFBZNNKfmv
         lk6eMxRdr9zI3xgpzDp4moF6BpKM2Qs7AHyazJjcMhpU0h/Jl78z4UMPycUUt4TUzje1
         U759acVOwoALrtZS1tIwlW4ASa+GXP1vT5SBfmTk7D0WguKGqpnnCETTLk1AaSkN8R+P
         sJdSjvKUrwQPiEGz63RqCVCXsCJ9nLVp9bXcO+4miysZ3GLCsfEF8tMiWvg4nX8nn1XJ
         qOCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTGVupcIAqSIU+A0l4/L+u8UNvjd0wTnAr2NC6vsHQgFPeDcY64pHyr0Drt0gZmbou52kHsypebNCdDJY8BeYH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi0CMFp9E9NkgO6V8jsfNUCkCr6OTqVSvjGMZy73k3oQW5Nc16
	aSr+yw4lJ8ZENsOmBhXPKPRAV01laQXy6l/RlaAICdwPYpq7gCVNND8b
X-Gm-Gg: AfdE7clnQ+L5uPF6dvfD4YaB5Zpmafywx0WL979trVVtFu2MR2LGOLAcHKJZm1qWf14
	j0b/LTYBJ6AcUUoVlWVbrYu2pjhrH8YbqC2ILyYcg3psisVLvmbzjcgrJmvSqViNIeLvWIHejuF
	QaXRJT9otwklDqfDHfvUHLL0YTuUBWu9yhtcOyTbrSMtxDvnHV9K57J2fEF8z0KCLz3LckQ8px6
	bCrgjARsJ3nNjuGRsMHmohqLc9lSkl/GttTaTFl1g2Hwpdzv2ozk5QQIX04T06frMLf5j62vpyp
	VAuHIGKdzbVEYAr2osvLd7PkBNixevG4mU6hzrrwhOLuaM7BAz5Dh8LMA/32hbphSUNBcgrztUT
	v9nykCYAByyUeytnYdh8zHh5QO7rPxUtHNQxphwxQMRlLIVej3GtOoK9QtSyhmPf0q5u3vVjpcU
	GEMb1hflufdgt5MCgXI1xYyv2KBDCtWQ4SZnJffSvc8XGC5vOg+YVUY8NmbuAEx+9b
X-Received: by 2002:a17:90b:58cb:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-387578948e6mr2517184a91.27.1783375730122;
        Mon, 06 Jul 2026 15:08:50 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56723sm757465eec.18.2026.07.06.15.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:08:48 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:08:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, 
	Russell King <linux@armlinux.org.uk>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: orion: convert legacy gpio-keys to software
 nodes
Message-ID: <akwm0xsquU3tu_Rk@google.com>
References: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
 <fc4f8eb9-7da0-4e65-b93f-e54f101de351@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc4f8eb9-7da0-4e65-b93f-e54f101de351@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_150852_023550_10A9B9DD 
X-CRM114-Status: GOOD (  27.96  )
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

On Mon, Jul 06, 2026 at 08:50:36AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 6, 2026, at 03:29, Dmitry Torokhov wrote:
> > This patch series converts Marvell Orion and MV78xx0 board setup files
> > from legacy platform data to software nodes with the eventual goal of
> > dropping support for legacy gpio API and platform data from gpio-keys
> > driver.
> >
> > The series registers static software nodes for Orion GPIO controllers
> > during gpiochip registration in orion_gpio_init(), allowing board setups
> > to reference GPIO controllers via PROPERTY_ENTRY_GPIO(). It then converts
> > gpio-keys setups to software nodes across MV78xx0 and Orion5x boards
> > (Buffalo WXL, DNS-323, MV2120, Net2Big, QNAP TS-209, and TS-409).
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Hi Dmitry,
> 
> These all look good to me. Unless there is an objection from the
> platform maintainers, I'd suggest you can send them directly to
> soc@lists.linux.dev for inclusion in 7.3, or alternatively
> keep them together with any other gpio-keys patches you have in
> the input tree if that lets you finish off the platform_data
> support in the driver more quickly.

Maybe I should create an immutable branch(es) for both myself and soc
tree to pull from?

I also have a few more converted drivers.

> 
> As you probably saw, I have sent the patches to mark all these
> board files as deprecated in 7.3, with the plan to finally
> remove them in 7.4. I don't think there are any users left,
> so it probably doesn't matter either way. 
> 
> Are you planning to also resend
> https://lore.kernel.org/all/20240819045813.2154642-14-dmitry.torokhov@gmail.com/ ?

Yes, I need to rebase/refresh it.

> 
> I think that is the only Arm board file we'll have left
> in 7.4 using gpio_keys.

Thanks.

-- 
Dmitry

