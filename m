Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F4DD6C2B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2j04wfyNLJcVoKN/l5SnXRdpkVm51gSQMxYoXXRHkk=; b=4ByTCo419Pw+d90HgFtRgz8eN1
	FH1bbtZAtGCPMf8i16Ns6x4A4FzwIPUbTJEBjxl6I2pgHuSBnOe2+DBFd3bsGMx7u1gRvn1WkMmMX
	lPQ7bb//GVQfgNjEbNKqsVdpgWyW0QFKsIur2pUGuEfpUy0MmTWx9fxZ0mrfeMJUw51rxbh595wvw
	Wm2zri2CUda2QX0XmHNOWKhRz0iEtTDsAo9X6+MVSBPfY7jAz7/dVAVXp07khw4GUv0R2xD+1s75o
	5ffd5H131kFoZH48GhiWqomlXTYYjcgbegyUnc2a1Gt9hc3UENmiZsFSyldBas7ZoO0mWnQTy43D4
	yYAdvW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDWKR-0000000DrVS-41ZR;
	Tue, 19 Nov 2024 22:04:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDWJV-0000000DrPZ-3pXz;
	Tue, 19 Nov 2024 22:03:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0933A42E9C;
	Tue, 19 Nov 2024 22:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFC6C4CECF;
	Tue, 19 Nov 2024 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732053792;
	bh=L0a/47726Uw6wdP1PChVy9Z1jtwej3YwRGgIMSLwsRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pL9S6sNGyvbz8TsF2TZIk+jSS2SIGB+ymVZ0vm/tqhn2yczH+X7G0C/j3GR06nViW
	 ubOqAqSIYPMEbbQSLF0yAHtm8STuNAdnIV8uEsgRgc/Rsu0Tr0ZY7cMFaOv1E1N6ma
	 h8+LMdk678XwSnWKlbqT56AI7NQ1HXKP5/rED/isMW9EapdotfGSkq2d1Jhc9dnQMn
	 lFNoLGN1Ge+uDGDZ/XkEagex3OGgBn9Ok8g7SBPgI2SG1/PtZdpLoYxeeiXfHQrznB
	 lTx8HHKGQNtYCtJEQPG4KPLaAuRFEhNpEKaocGsIH0XyYyluT/GgZDJROnrCkqpXeO
	 GgzttFmWXXI2w==
Date: Tue, 19 Nov 2024 23:03:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, 
	max.schwarz@online.de, david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, 
	wsa@kernel.org, manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
Message-ID: <y4xv4lduinhjbhzt64erjw3er5w3s2tcwzjxxdknoudaefupxq@fbqf4esensnk>
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com>
 <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
 <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_140314_014926_0CF8F697 
X-CRM114-Status: GOOD (  17.68  )
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

Hi Jiasheng,

> > >  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> > > @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
> > >       }
> > >
> > >       clk_rate = clk_get_rate(i2c->clk);
> > > -     rk3x_i2c_adapt_div(i2c, clk_rate);
> > > +     ret = rk3x_i2c_adapt_div(i2c, clk_rate);
> > >       clk_disable(i2c->clk);
> >
> > you can't disable a clock that has failed to enable, right?
> >
> > BTW, although I like this patch (or at least I don't dislike), I
> > still want to check whether it's wanted or not.
> >
> > Andi
> >
> 
> Thank you for your advice. I have carefully reviewed the patch.
> There are two clocks: "i2c->clk" and "i2c->pclk".
> The "i2c->clk" is enabled and disabled in rk3x_i2c_probe(),
> while the "i2c->pclk" is managed within rk3x_i2c_adapt_div().
> Thus, the "i2c->clk" has already been enabled at this point.

yes, that's correct, that's a fast review and anyway your patch
doesn't have anything to do with this.

BTW, did you have real failure experience here or is it just
speculation?

Thanks,
Andi

