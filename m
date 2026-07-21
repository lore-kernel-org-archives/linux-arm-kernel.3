Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2946C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 22:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnBRPHoNiq0pTqq6Jfy7fD9vUPKHe4GhNLqfr8ijK2s=; b=oZU2wYHtr9YSuPvfWOMVXi99I+
	Qip3smacac96fPuvHJdjTSwK9q0ugLTCepAkae4V9XrtDVvWLxv+xxEd8ep1YNJXDY6SAhIQzfWFn
	NPg1Dptef0xF3/zCTBJbhLFr3xnT99Ui5JvB22CJo+F9oIU04DHzx8xZtEkS4MxP15EaYyigZ6ByY
	TKUiBHxjQpu92RcMguqKvHxheJBrdV5vDz6EDTmUnuMhZhvHzuj41aPrIGna58xOHobjGMGLed74P
	BeU5fUOzlm7F/XKVYb3Y1VrN0HciYRx7QzMLmUJsdu25aggMKqO/CdssarD5mZ+tnqlNLRjkSMqWB
	fYKVb8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJGs-0000000AX2a-03ak;
	Tue, 21 Jul 2026 22:49:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJGo-0000000AX2F-3NLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 22:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784674141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rnBRPHoNiq0pTqq6Jfy7fD9vUPKHe4GhNLqfr8ijK2s=;
	b=ATayY0zkzgNPpr/kajCiKZUS6vsMceaF9vb2hpF6wE8l5oc4Y5mJyGpAXoDEeDRKsiafjo
	NsjfGjszAGBi+92/QsDcw1dUT5e66j+2xwgkL22I4d0vB1YYcfWFwz48be+PYu4lQbEXdD
	OcxNQcKZP4LmMI0TrHN1we4Wjt0Psrw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-Vr3k9mypM7WY8sC4TqCICg-1; Tue, 21 Jul 2026 18:48:59 -0400
X-MC-Unique: Vr3k9mypM7WY8sC4TqCICg-1
X-Mimecast-MFC-AGG-ID: Vr3k9mypM7WY8sC4TqCICg_1784674139
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9309af14fd7so1011483785a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674139; x=1785278939;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnBRPHoNiq0pTqq6Jfy7fD9vUPKHe4GhNLqfr8ijK2s=;
        b=cU6ofb6ZomNKmEwUVE9bOCzwWp+WE98A5riz7azDl6Tr1gKjgRnSEl+m8jq99hmAMK
         KJ3nMfe+wjQdLy0Qp4nSU7+eC34Yq4eBB4BnQ6CDeew77ZoABuYUJ3G8vk4pzbQyjs86
         TPA0ta2DXSyArH4xMORQ9ebt9Yp7yHt3Y8t3d+ntqV6qmAAQEqpRcKzj6fhZJYOcJJlK
         nEtX9IsqD9OQKqhbVIr7d47xYDslsz/jE+wsV1BYlWqG5DvWT2sVslthrazty1c/wdgy
         RHKH8sFdD2HpeP8BOhWOYVsio9xkS1dNKG8eS1F3sxAP+l0vu7I4WAwISkWxkpJtPeFQ
         Ln5A==
X-Forwarded-Encrypted: i=1; AHgh+Ro7wfC3N9vsDS6hOBJDgFPyIO6S4pnofNOZo//YmeT9grBCewD3H47Ja+3O4HJEISh2FU4PxHtxGRW/8utnTM25@lists.infradead.org
X-Gm-Message-State: AOJu0YxS9HbFTxHuAuW4XNvwHsZRoO/V/CDjFJPX0v/lzKD5pzyAR0Fk
	FDv7x2o/HPBQQwpt1e18Q7vi4qkGf7aU3O+YDBeqaUxZEd3AVMGQYTQ8QoK+xkElWQLerd6iX0q
	2f+3X1Mz1XnlYSSnhCezgD9lkV5Nf7e6bcs98cAeAYaM4CVsiCqytOIG1c8dCOn0K/ZbJ+WxzTJ
	ig
X-Gm-Gg: AR+sD12iFupIebkyNLt7oT6FGQeZYikIGeoRuIWbYmiE5z+wJ5hr271cJsHS6Krbuxf
	ObhVnKG4q70XNydid6oxpQbOXDZzn4qne1KjvL6MrC88rEjihUWRRh3vmpqgpHkeUy3eCrddUoy
	+teKJQFkD9o/LYb7Ab9d/SX9Vg5g8BVnaj9Ub7s4GCybAuWMx6idda8WVhPz/tVQg19mG6CUjWl
	oXGzH/sUgRXPiQoPEkYcTBqeTwBvDvHvHuqHNR+36qa5iG3zT+lsCV1pMmLZtwIqsQfOLdxVutC
	xCLy75oPIv9qKsqlcO18JiCIXeG9uyJTf9MV9MDl9ULOliN4fSbGDVHTYdhaAdM+cJ9iJPqsD34
	JHfV/mA3VhH2wag4N1OPuByM/vOcw95pp8KA=
X-Received: by 2002:a05:620a:2b98:b0:92e:6637:d98 with SMTP id af79cd13be357-930b3ed9d5cmr1967182585a.18.1784674139028;
        Tue, 21 Jul 2026 15:48:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2b98:b0:92e:6637:d98 with SMTP id af79cd13be357-930b3ed9d5cmr1967178985a.18.1784674138334;
        Tue, 21 Jul 2026 15:48:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a9ffafsm7374685a.45.2026.07.21.15.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:48:57 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:48:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
Message-ID: <al_3V8N9z25ho8g2@redhat.com>
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eZPgQuWkQUsE1fbFg18sSRieIj5FYgMMAldki-W_lDg_1784674139
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_154902_921049_ACA3435B 
X-CRM114-Status: GOOD (  26.68  )
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

Hi Jerome,

On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> struct clk_hw.
> 
> When a struct clk is created, the module usage count of the provider
> is unconditionally increased. For a self-consuming provider, this means
> it pins itself and the module can never be unloaded.
> 
> Increasing the module usage count should only be done when the consumer
> lives in a different module from the provider. Use THIS_MODULE to
> capture caller's module and increase the module usage count accordingly.
> 
> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> pass a NULL owner. As a result, any provider module will get pinned,
> same as before.
> 
> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> This issue has been present for a while. Virtually all users of
> clk_hw_get_clk() are affected. The majority are compiled as builtins
> according to the defconfigs. It is not problem in this case but it is
> if the configuration is changed to module.
> 
> The following modules are using clk_hw_get_clk() and are compiled as
> module with some shipped defconfigs:
> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> * drivers/phy/cadence/phy-cadence-sierra.c
> * drivers/pwm/pwm-meson.c
> * sound/soc/codecs/lpass-va-macro.c
> 
> Currently those module cannot be unloaded once they have been loaded.
> 
> """
> rmmod: ERROR: Module blabla-module is in use
> """
> 
> I initially thought about using the dev parameter and compare it
> against the clock own device but this proved unreliable. A clock
> does not always have a backing device and some paths, such as
> clk_get_sys(), do not provide a device either.
> 
> With this applied, we can get back to removing the direct usage
> of the struct clk in struct clk_hw and eventually remove this
> struct member entirely.

__clk_register() has this comment:

        /*
         * Don't call clk_hw_create_clk() here because that would pin the
         * provider module to itself and prevent it from ever being removed.
         */
        hw->clk = alloc_clk(core, NULL, NULL);

With your change, can this code path be updated to use clk_hw_create_clk() ?

Brian


