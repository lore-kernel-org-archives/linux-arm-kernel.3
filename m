Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA945C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4YKMjo8OpNeO5r5Qun2FcCWMfPcqDOXTd2oX2IE1cY=; b=XXghe80ByKd1RKJMR12u5L5H3H
	Gj/c/ocA3sU5gOJrTEkETeuiwruor+WXZUANh2GqJor22LJqgrImXXO3/yMSFA0YFyHEzXL7r0KVF
	i++9Hjf3ebzJiuZn23lB+K/vC7UOpbJX7RRZ04B5gYxqngiz3cYEyeKdB9bamfw8SSHONSQB4shfx
	nfoGP2rVwe7KmKGsDss75pnk5igm5eltVE1FyTajXy02d3Dc8owbsi23F2PQlnA3NaD7DaDVmnE5i
	h3hGtdVinDHtwxMoa8A6dQp42MkVOOL9D6P/A1N/te8YepyO2OkNZjnJ8X8134Bp/6/nHrIlS/tsN
	yA5zs6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDQN-000000078nH-2EW3;
	Tue, 24 Jun 2025 23:51:35 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUDM9-000000078QK-0zA9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:47:14 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso6467137a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 16:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750808832; x=1751413632; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4YKMjo8OpNeO5r5Qun2FcCWMfPcqDOXTd2oX2IE1cY=;
        b=Vd+Hn56pwF7kXJHrel/c7XKstkotUq0gGkbkH4HtX2vfrZjNTiO/fl07mzEnJ94+zI
         LW6+2e8YBJceQzi5WeVpgo6DCcyGd+dUgrg/j0HJwXQTeIWjaomahCCY+oI3MpQIPc7u
         wp7XbjlwEl1nuu23DMxI0xT9kti+O4CgtpARtz1JM3SinIOQCCcG9W/ZPpsvbjsdU8jp
         GsfWQAAT3A3xsxQM8viKLiIstWTiZuSzVfhiH62F481P2dcsPBBbURI+kRc81F3L2Lws
         Fx7+2915PN26nUO1/KpKiPfdwOhY/2Wt0fSmSB9kE9LAD+w5crsbFbWQxAIgE2NWQa6C
         hS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750808832; x=1751413632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4YKMjo8OpNeO5r5Qun2FcCWMfPcqDOXTd2oX2IE1cY=;
        b=u+09fGCByZFO5B8JictVkdKG2f6UqGj4fzGWiNYLHkOQBA0RtCtXppFHmDejRfP5xN
         bTY3O9xkS0AsqUyFliCGUzf914tP/Z7K29DbC9/3WPCRscjYuLexoE87YKzxxppGuXUp
         H2ZsqBf/jgao2WnEIIvZtg3PUbZb2X2GzB2N+xYG9/VLYM5WjqbD3WZU1DjZkd5L9C35
         8gaoEizCXRX84vsMzyu5pVLzNWoEq+WrEHpqrizznqbLQ5turzqPNnT6Rzyy4C1af9tH
         KbBMlBWLDTWNWCfB2e5l78L2GGwJZG/sGDP0CAmUGbgnrvTYfY39e/iVjfY93Ra/RUsF
         F1uA==
X-Forwarded-Encrypted: i=1; AJvYcCXYjsm7VgVGiQ4rxSLNbCRGrYfsgENeBEaRDLisONpnQhU2I2M74bg64QmaAskYHcRq8McHWKQ9o6+kCRVFNA0f@lists.infradead.org
X-Gm-Message-State: AOJu0YzDBKTuz1IQLJCHT7ggudxm9CQ6UmaSj136RFpGCB9HuyzLpLiC
	rjdkRbjFFdNjzhJj2JtoZLhh/1Id34gkNfOWQ1XBEj5RsgbWoj7LHDCz3R+A6StIjQ==
X-Gm-Gg: ASbGncsmH/d2geGK4+EcaQ2ZzJVkvshjWH+3FfMOJyeZJUkIUF6MjJ+CS1WoaleQTv3
	GHoRKK5HZFB+jLXgkX65hOlLRF5SUv3C1OamBdP606gzrYRSRd0EeFKM+GjHnaQY4+N/FrdN6zZ
	mwptcUM4HnwAkeQFTANTExA0Y+2RXoLkW8XM1PC2CFx5dSvT6ZKeL6d9Rz0VldOeZxMWP/jgae+
	Yj6BfXQVOmXvNyWV6ylojW0K7YU+PXZTeIySBWB8IBL1XNozAEteI3iNXSG3P40kaQ/s7G+nETP
	bns3bd662GzT+nyTxezayT01qvsEV7MS4YLn0EPrc+eFSKpv0UHh/ThsN+LqUWu+Kf/ro5oLwJp
	G0soVRl1LqkOtoy1atjWgMmH1z2Y=
X-Google-Smtp-Source: AGHT+IG/sOl/kqpMXtibwdZ96A5j8WE1NPsYc5QH8w6AlxiSCpqY0NhSwOKYQiXX05vdAY6hDJ1wIw==
X-Received: by 2002:a17:90b:3a05:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-315f2623c5amr1363566a91.12.1750808831471;
        Tue, 24 Jun 2025 16:47:11 -0700 (PDT)
Received: from google.com (96.41.145.34.bc.googleusercontent.com. [34.145.41.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a1bcbsm221025a91.19.2025.06.24.16.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 16:47:11 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:47:07 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aFs4--JdpE1W3Lh8@google.com>
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
 <aFqsqr7i7cdR5-I0@mai.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFqsqr7i7cdR5-I0@mai.linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_164713_276150_29DBD451 
X-CRM114-Status: GOOD (  24.23  )
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

On 06/24/2025, Daniel Lezcano wrote:
> On Fri, Jun 20, 2025 at 11:17:08AM -0700, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> > 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> > Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> 
> ...
> 
> > -static int __init mct_init_spi(struct device_node *np)
> 
> __init_or_module

Thanks, I'll update in v5.

> 
> > +static int mct_init_spi(struct device_node *np)
> >  {
> >  	return mct_init_dt(np, MCT_INT_SPI);
> >  }
> >  
> > -static int __init mct_init_ppi(struct device_node *np)
> > +static int mct_init_ppi(struct device_node *np)
> >  {
> >  	return mct_init_dt(np, MCT_INT_PPI);
> >  }
> > -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> > -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> 
> Are you sure this is not going to hurt the ARM platforms ? Here the
> timer is enabled very early in the boot process while with this change
> the timer will be available later.

I took a second look at the TIMER_OF_DECLARE() macro and FWICT the timer will
only be enabled "very early" via timer_probe() if "MODULE" is not defined which
is only defined when this specific driver is compiled as a module. Note, this
"MODULE" define is not the same as the Kconfig option "CONFIG_MODULES".
That is why in my v1 and v2 patch [1] I had:

 #ifdef MODULE
   ...
   module_platform_driver(exynos4_mct_driver);
 #else
   TIMER_OF_DECLARE(...)
   TIMER_OF_DECLARE(...)
 #endif

However, I dropped that since Saravana mentioned that we should not be using
TIMER_OF_DECLARE() for drivers that can be modules. I don't have an ARM Exynos
device to verify dropping TIMER_OF_DECLARE() is safe. So if you and Saravana
agree, I can work on creating a patch to define TIMER_OF_DECLARE_MODULE() like
you proposed in [2] to handle this for all the drivers that are used for both ARM and
ARM64 SoCs.

Thanks,
Will

[1] https://lore.kernel.org/all/6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org/
[2] https://lore.kernel.org/all/f2f914aa-c554-4135-afaa-f075537ed929@linaro.org/

<snip>

