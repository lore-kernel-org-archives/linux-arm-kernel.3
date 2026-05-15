Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C0CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 04:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=; b=K1Jg/6bD+4mOSui2cmxo2qkN9c
	ojbi6CGHDuLi7R3kgspWA9o6KYMq1voeIptU6CEMOJtFCT24RziBdN1ADcNkapVt+mU3NW/j1+bsC
	V9EtCQN0OTGzWM6DoFZ9TDmtzhdbTvSMStGN4W9nQo5SUJxyGZxopePwzf4Cz+xBzjR2MXr6FgTXp
	rs9EeZ+BvoJ/GWw04EP0iIMmGIyCsSPeZReoVB+aZlK8FtrFW/IhEvKTWuYtD+fkVeLa99RnZRJDL
	avHcY8OFo9edhR4Xzaa+mmlUkeOnlU+VOTm4crON/ll0TR9/eD0nJiMXjfyOnGuv0WDtMnYMnP04D
	I+SjRqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNkU2-00000007LEQ-3Xwt;
	Fri, 15 May 2026 04:49:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNkTz-00000007LDp-3S4H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 04:49:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-366375c4076so4236911a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 21:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778820546; cv=none;
        d=google.com; s=arc-20240605;
        b=C/NOYa+uygh0D+UQ9cyjzxAlA8I+H2bc0AZbf03z4o6HOC2AXvr2Sy2YccpmSpbY0y
         8yl/a4cHmApiV26CmwA2GWizmlXWAxGYGo4e8gSpr2xS+A3Ad3sb5u3tzh19vj1/JXrL
         wbDTjVbEBG+KDOt2PEzVWyDdFRZbAGCvHfet9cxZnjgp4BxtVj113ubXX4HxawY/IhBa
         3LZh/PiE1jL/er3DAyUG4nvtf3G9KQyaqH9K857hA0xUQyFKiPzK3eZAteic7DZt1RwN
         CFObrdmZDhrlzdvSjjjgkOF5HT4SJDDy48hoaQ0RDW9QouuvYvriLfas3QK25l60ojPw
         DniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
        fh=xkyLmLO+wKO6tiXX/lYGcH+nFtEQ1l/USNroK140xN0=;
        b=ELi0cAMxIHE3qXC0SYQe8rIYmpX/IdcDvOBYaD3ZnCMyeQJlhn89gFp1c3CFHv7gBU
         4ROuQ4Tv5avtzAuaK68mMhzmbBEmP5CsRGtUBQ11lrL4PGeyKp80jEijPJ7ixSZUH1JM
         C8EQGGKQBnX0Gf49DIPxHdz2tani1/by+yz2CPGGgCrL/LRDo1hfEEBxDO/vLxDBhQsG
         Ffa7F/lDZeHKgNqNX83Tqrig938xbJpv3fN3TskOq6I+DncQTzFc1Vr8rZBC0mc6WZIi
         Mhx8H0cnFjqL0reZJUbADbCCD6CdpC1IwdHqQOr/KxSeoOKXSIwUeQg/K+xJh2rNtgPY
         v58w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778820546; x=1779425346; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
        b=et3RRDYseuoRhZUwhKE0EFgu1jy+Yo/hc40Zd4y/iGrnqCRXpcBAOA2/mvRpaXV5DI
         1pljXGhoZ+baQR7xL9BVXGMrILteVUAVW4KOkb6xuVSQzWY3jLQfX96JWF3CoKNg9Bw8
         kl+QwZjLznQKAK1tUANG61/V4kQU+XIhscOiEDiWpUUUOCCQtmfsjBDLpkpjM8szjIyy
         vqbSMl8KtwfGwIM211/vShlQTZf3SLiyOCa/iwyVouIUGDATUopKh0jALUxxrzQ0oQfA
         JzHdQibpmYItK+RC/M85ReDSGYTEpexfbAryECQU9br/MAu/8C1Zcp2ak/T9Bxod0WoZ
         /sTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778820546; x=1779425346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ze77vbekY63STpWUt0uP8LUCQHGr3bsiE2SLku80DU=;
        b=svcIYUVN2xV1RI9GbEnqbZHX7EF7lBEAyRmUuXztXjrG7p2BiMMv0rfrw2mOhRudYg
         yfY9cqByYpV8GIS3HxbD32sx1PVbwooUYBVFmll84x8WHZv5Hy5L+Zm+ZPLwmMflMIOb
         AANZOarwbp15KI2dsuogyg5/NrVBAGI0uz7Cxg+U2CwuMojmbO57KWAeuQ1e5WhXKNS2
         486+Lp8hDLWes4ysWiAEKFXxCo5hgQ+bDYR0mM+0JlG7WFOOV15VyUqMAXMyv14/1Zit
         hdcaCYBrqajeb59X3G5GPNIgE63Drsjxic5s7YoB0BJaxMEdkjO19Tv30HdiF6xeM8zo
         ioag==
X-Forwarded-Encrypted: i=1; AFNElJ9w6QfQsS1P9nb0bU1A2Ti4BP3AkYAd2DJsEiLiPlUw7CQnNqIFGo4KWKRxz7tX9qm1inYQPIH80dlVMt5gkX7C@lists.infradead.org
X-Gm-Message-State: AOJu0YxC6bNKy2srjE6qV6BxCKaKpi4zcIRNSRwXy5UETVh9rKsy3CNz
	3EMUDlZOuJkYmXQ6Q430nuUkiaOKkVFfgAXbJdxAJ8JaOEv+Z1a2qHnf2M1FPyDZGeDLB2YrBoZ
	RkfeO2dgvyby+Pspvp8ahWwyFYWyKzi0=
X-Gm-Gg: Acq92OFk9zMQjMOn2uC6cWX+u+A7xNei4FbkOrUjHgvzejxrV3JOXyrzqM9Zu42pVN2
	xSELeb8CivFiW0DP9cW8YMnOQrFbw6foghrlmPml0AG1w9/26uaOajQTBC/ypaBigg3KQFbOgdT
	zBxDtKPyuWimBs7l4SpszWdp/pLFB+pXysED4u3rRugZ//7qu0xKjionpy4t4hi8FXEa+aKWrey
	MIvFDAOod7VgY3FEJtlyLX+g8qxGX19DNp9vprPWp6qWTC5YCOQtnXtn9XIyeWh2RhQnNBZL2kO
	kBoJaA1KHlKpOwUDkx25tj3tM2MsvWL7U4aFoXjmqw/K9RLh
X-Received: by 2002:a17:90b:57c7:b0:369:2e00:1ff0 with SMTP id
 98e67ed59e1d1-369519c6663mr2379277a91.6.1778820546309; Thu, 14 May 2026
 21:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260513104329.81592-1-phucduc.bui@gmail.com> <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk> <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
 <agZ92TVjcYpEv_eH@sirena.co.uk>
In-Reply-To: <agZ92TVjcYpEv_eH@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 15 May 2026 11:48:55 +0700
X-Gm-Features: AVHnY4LSRW3rAmjavn6_eDy_Qm1nhNiehY-HxiVuY8qyBRTItYTFMQaIPdHoTM4
Message-ID: <CAABR9nHR13e3d46_Z7Q8ZkjQzKbkcPs2Er4sAvq6G1EEj-xoXw@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
To: Mark Brown <broonie@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_214907_868703_EF384784 
X-CRM114-Status: GOOD (  11.60  )
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

Hi,


> > I'll send a v2 of the whole series with this fix.
> > Would that work for you?
>
> Yes.

Thank you for the confirmation.
By the way, I have an architectural question that came up during my cleanup...

I noticed that the STM drivers currently manage clk_prepare_enable()/
clk_disable_unprepare() directly from the dai_startup()/shutdown() paths.

After looking through various vendor audio drivers, I noticed that
PM/clock handling styles still vary quite a lot between implementations.

For example:

some Intel drivers enable clocks during dai_link init.

Samsung separates bus/interface clocks and operational clocks,
enabling them in different paths such as probe() and set_sysclk()

UX500 and STM enable clocks during DAI startup()/shutdown()

Tegra, Sunxi, and Rockchip often manage clocks through runtime
PM callbacks

From a maintainer perspective, is there generally interest in gradually
converging these drivers toward more modern/common PM patterns,
or is preserving existing hardware-specific sequencing usually preferred
unless there is a concrete issue to solve?

Best regard,
Phuc

