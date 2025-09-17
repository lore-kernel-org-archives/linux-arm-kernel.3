Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55E8CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bY/asBqVOnDWFE5LcHmnDOT5AoWMNTr7WSHO+9CO+k=; b=kyWWy0SBEhI7LNLvCAHrILoh2J
	OcB17nU2VRIf32xt7oHN11du4APXVAJ76+JXpGRiOiLVtDrkg75taL8bymRvvtZcNUu9Bt8PRu6Mp
	vbEnCJUq3PYS37HhXeEp8/Rt5GU+ifikrfkyOi1zgCIn/0G9WcRD6+dIypwi2RHyZEZk24n1HV67U
	ghL8IPAXbhgpZCjtovjRpQDtRPI2jy33PrpQSTX+1zPrxhcItbVcU7S+ueiEmV2w1NXApGzDi1w7v
	uNrYL2NbeSAxRg9Jhpmq5SXp1c8mm0rqc1uPYT66xVe6UgvTZaTPQGMLPDEvG7PatMcsj1zHqVjTp
	a3pgJvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu1c-0000000CgEK-3UXK;
	Wed, 17 Sep 2025 15:24:52 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu1a-0000000CgCC-2Kt8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:24:52 +0000
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-772301f8ae2so6402294b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758122689; x=1758727489;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bY/asBqVOnDWFE5LcHmnDOT5AoWMNTr7WSHO+9CO+k=;
        b=HVP1zsNl4uJPmaYdwmieJrKzFwjgo7g/ILRqC/3zag4F/wyoV76cic0UcU5w5Og2Vg
         qC9YoDGOEeJOvRSkSxQFog+nPSjCZZiiXMNrZShSlkzj4k/w15jGeUz4/fc5sWWO2Wje
         1vz4jFXZx/EI00cLwcZVjBL5AWu1uRmdGfA9JkTdvskv7qpEvpWxVKtGqkjenLVBG5t6
         kdGwOFntv+eoIvogDmEWUcWSPjqTHK4CZgLOhwE2E4Np1PD5nOh+e7jaHUteBzYcmzOc
         7EdrC7PW4qCFsUcvTNqE8txtOXkVJzlFTx+NWCtSkIH6e28O5tihd5wxNm49fEq1B7JP
         eVWg==
X-Forwarded-Encrypted: i=1; AJvYcCW9u+iwkvCeNP+FEHHK4C3YX7AvuUXVKpcKVJDacYz1Hm2pI9fZmiwSNqUeKLegLBCXDjaobLtuwK5EHLnINGkK@lists.infradead.org
X-Gm-Message-State: AOJu0YwwbxpyQv8LuVFvVFARaBGH3hrmYlsGPIcmLyXgJjt8IsWIsM5m
	DnEjQObrC7utLuFq6IehO1fGSdpp0E+gJElxEjLrQtTKFY1FaEhs8lu9xbvYJ/b4rAw=
X-Gm-Gg: ASbGnctkBpd6d7bKvT9y+oEcrMOw8QeTpxyB2EKq5reLx4Vr+4X05RIjVqqc4QXQPkZ
	WCTASaVJdlHDCbxzPV5dMFHLHxQx9FExa1hxwlHokkfk9DXVrqb8+jklfa7jV9dOp+KSyafiVtQ
	ov4icmJk8M45t9Txnkt6RvfIrXJoI3shDwLpud8mWIrYY6ahoqBoqePeB/TucLfceslIIOjM7rn
	jdk7oBTDUiJql/p5G6+kJC7O/BB2Xvb4vYpwTsbpZpgX054TtHVSgdzzC/BLQU1quO/eS5FoGRS
	xuumvxLhLgiGYssSoQ5dSCME9yTYIV6OU0A/yci1vKM6sKs7nEFxS3Ji+f4j9TnevjonOptAwU9
	6BWqIKtKLTwfgBBtJLs08
X-Google-Smtp-Source: AGHT+IHJBEGVlWAkDnL7p8aPBmpzPuwLI6TVt47t7wf2wpFW3MFRt1QIyIXPCIevSu5aQ3ieTqwwuA==
X-Received: by 2002:a05:6a20:2449:b0:24b:1a6d:298b with SMTP id adf61e73a8af0-27aa3cf5b6fmr3447692637.34.1758122689322;
        Wed, 17 Sep 2025 08:24:49 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b65dsm18800938b3a.9.2025.09.17.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:24:48 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Michael Walle <mwalle@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Andrew Davis <afd@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Michael
 Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
In-Reply-To: <20250915143440.2362812-3-mwalle@kernel.org>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
Date: Wed, 17 Sep 2025 08:24:47 -0700
Message-ID: <7hv7lhp0e8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_082450_599646_2033DC9F 
X-CRM114-Status: GOOD (  32.34  )
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

Michael Walle <mwalle@kernel.org> writes:

> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong.

Hmm, it also seems wrong to me that the clock framework would cache a
clock rate when it's disabled.  On platforms with clocks that may have
shared management (eg. TISCI or other platforms using SCMI) it's
entirely possible that when Linux has disabled a clock, some other
entity may have changed it.

Could another solution here be to have the clk framework only cache when
clocks are enabled?

> Thus, disable the cache altogether.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
> I guess to make it work correctly with the caching of the linux
> subsystem a new flag to query the real clock rate is needed. That
> way, one could also query the default value without having to turn
> the clock and consumer on first. That can be retrofitted later and
> the driver could query the firmware capabilities.
>
> Regarding a Fixes: tag. I didn't include one because it might have a
> slight performance impact because the firmware has to be queried
> every time now and it doesn't have been a problem for now. OTOH I've
> enabled tracing during boot and there were just a handful
> clock_{get/set}_rate() calls.

The performance hit is not just about boot time, it's for *every*
[get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
mailbox, etc. to remote core), this may have a performance impact
elsewhere too.  That being said, I'm hoping it's unlikely that
[get|set]_rate calls are in the fast path.

All of that being said, I think the impacts of this patch are pretty
minimal, so I don't have any real objections.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/clk/keystone/sci-clk.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index c5894fc9395e..d73858b5ca7a 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *provider,
>  
>  	init.ops = &sci_clk_ops;
>  	init.num_parents = sci_clk->num_parents;
> +
> +	/*
> +	 * A clock rate query to the SCI firmware will return 0 if either the
> +	 * clock itself is disabled or the attached device/consumer is disabled.
> +	 * This makes it inherently unsuitable for the caching of the clk
> +	 * framework.
> +	 */
> +	init.flags = CLK_GET_RATE_NOCACHE;
>  	sci_clk->hw.init = &init;
>  
>  	ret = devm_clk_hw_register(provider->dev, &sci_clk->hw);
> -- 
> 2.39.5

