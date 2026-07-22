Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B65BC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHv4LfvJs81HAHXg2ZdfeEfs6S8C8zkyh5yXF3nOHKw=; b=owP0l2EYElItd2Kn+BDlAsnmHi
	gddbnrbo3/Q+DahLl2cHc2vnQrawIjQsImn+V5QYE2AcJpcG3JMdrugWgB6HrX2MEirDD5jKw94J+
	AWW7Kmcy7cnDpSEGWPY/ascxnTiOStb4rTK7b7HD0g5R95X+Qm+WBSs864PtD5vY6WHMHc3A3oJoH
	npQXY9+yRZvz6BqW9M6ZcnjC4TKMvMFY8xCcYAHNxzV4ZDXY6CO6bhKaqppii21JVNxZ2XT1vZo9R
	PqbLUzlosyF/ACV0GLKQrRcUlmQlBh3jW2TBU1nro9DIRd/ojUA1zt9L7oOOLhfJyfzaDp+tAkpjo
	gAN6aK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW8H-0000000Blvp-11gp;
	Wed, 22 Jul 2026 12:33:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmW8E-0000000BlvV-3OTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784723581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHv4LfvJs81HAHXg2ZdfeEfs6S8C8zkyh5yXF3nOHKw=;
	b=Hlo/3uQVQrRc1NbCmfn65+cQkcJCjcxcGXXCHZJaqqJqq4YXNP/hs5JrY7jfbOjE5iHqIx
	YRKya+9SEueoHEViD0KV5qLeyi5pRKJeQiM89ZkEhZNm0mmhcjO8/lCbJfbMkn3djdMxaX
	vkaPIdNPEV+Gd/JLHLofHg4loFB9h7Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-ulv5jJYcNrWhifJMmklcQg-1; Wed, 22 Jul 2026 08:32:59 -0400
X-MC-Unique: ulv5jJYcNrWhifJMmklcQg-1
X-Mimecast-MFC-AGG-ID: ulv5jJYcNrWhifJMmklcQg_1784723579
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so2244363185a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 05:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723579; x=1785328379;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHv4LfvJs81HAHXg2ZdfeEfs6S8C8zkyh5yXF3nOHKw=;
        b=fkKyq3GSkE9j0a3Vo2PsLvwFXfMEg36n7iJ0VrICY0Z/SfFE1vfciaiJx7qn+gY3vJ
         mDOXTZdI5fAyuk4UPmoZwsRP0C4rU75RbWO+/sWbx1ysnj1bN908D3M9Laj7zcKUZccp
         yrnIYgILDIaRxR/aL8L+/XSNSY1RvhCrZ1n1Vmouo1c3KcBPKEQAee7p6i+r4qvWGSGC
         QSLSBUALvexqrHKKBfYXJrBR1hRf6XXHzyQ+ah12fgQhccAMzYQD3qMGAnL2VtwGdvPJ
         VwOLAj750gsnB4du04D3cIxadJKdhTvMuMaNziCiGFoepnaRkYT4Tb87XuSaOivXtrJB
         qYaA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1bviGHtPCJfFWfWPlevgGACkwAl3wz9UE/hEwJq0YCuxd5W32KfIyPa5vhNDF/pBfALcnIFo+9QRp04y/15hM@lists.infradead.org
X-Gm-Message-State: AOJu0YxcP5DX9NldaK/Cw4X7ZFpTytJyiXr1jX3vZDgkJ4DHh2n6/ppb
	nPaoKdR5NYDyY8LrmJeNJScy83yqqEOgo593mYnOuEbE9xmBMlenXDqcL3eNMojmBcjlMQJbJqn
	Ua236Qp1/VwtX7bg6DnnJZ3QgSetorIffecC0U5FeVbT1VrktwyHokIvjuTXjah9OSKagh80rVU
	yx
X-Gm-Gg: AR+sD12w8FdhtztyJB9+n4AqSrHcKpqTCJdQOeBmCzzJe6kKx8hAMnFONt7A5sOq81s
	sgmc/ohfOcxC+hprVvOKyGo6MFN2nOiUoYZ7QRzX8ZdzZGs1PVhYaOZVLZSgtuQewrW4i2XY/Zp
	S9o60WB0vf+bV/iA94NvkPuW/VJzFWtHoalcjw/dWHLbIQbiBGZNzpoRsQMD/9wu4BqcxadSROw
	rfJGHmB0i+IVgkUPzlt7LUf6cMKFK5QSmctoMVTQTWaIxlQbsPHcJPMSd3X69mvfJsab4JijIGe
	SrLllAQA1H4Laq0yj6nWLDuTdgwOpxcJ0ZAfeyjTuY1hSMbNjvbRHFPTCXikinIhIyg6y8ACBYj
	HWbwzch12Igc7IiXYQqMz1/pve8kTQ5d8F/Q=
X-Received: by 2002:a05:620a:17aa:b0:92a:e2a7:d55b with SMTP id af79cd13be357-930b41e281fmr2236194585a.47.1784723578965;
        Wed, 22 Jul 2026 05:32:58 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:92a:e2a7:d55b with SMTP id af79cd13be357-930b41e281fmr2236189685a.47.1784723578363;
        Wed, 22 Jul 2026 05:32:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a6a157sm151967185a.37.2026.07.22.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:32:57 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:32:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
Message-ID: <amC4d_RMA5oRR-ap@redhat.com>
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
 <al_3V8N9z25ho8g2@redhat.com>
 <1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g_BMVQ3nTNQQd66v1buOKxoxTnUWVPL4gfuciWLSJhE_1784723579
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_053302_942096_099B8F21 
X-CRM114-Status: GOOD (  37.98  )
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

On Wed, Jul 22, 2026 at 09:49:33AM +0200, Jerome Brunet wrote:
> On mar. 21 juil. 2026 at 18:48, Brian Masney <bmasney@redhat.com> wrote:
> > On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
> >> clk_hw_get_clk() lets a provider get a struct clk for one of its own
> >> struct clk_hw.
> >> 
> >> When a struct clk is created, the module usage count of the provider
> >> is unconditionally increased. For a self-consuming provider, this means
> >> it pins itself and the module can never be unloaded.
> >> 
> >> Increasing the module usage count should only be done when the consumer
> >> lives in a different module from the provider. Use THIS_MODULE to
> >> capture caller's module and increase the module usage count accordingly.
> >> 
> >> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
> >> pass a NULL owner. As a result, any provider module will get pinned,
> >> same as before.
> >> 
> >> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >> This issue has been present for a while. Virtually all users of
> >> clk_hw_get_clk() are affected. The majority are compiled as builtins
> >> according to the defconfigs. It is not problem in this case but it is
> >> if the configuration is changed to module.
> >> 
> >> The following modules are using clk_hw_get_clk() and are compiled as
> >> module with some shipped defconfigs:
> >> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
> >> * drivers/phy/cadence/phy-cadence-sierra.c
> >> * drivers/pwm/pwm-meson.c
> >> * sound/soc/codecs/lpass-va-macro.c
> >> 
> >> Currently those module cannot be unloaded once they have been loaded.
> >> 
> >> """
> >> rmmod: ERROR: Module blabla-module is in use
> >> """
> >> 
> >> I initially thought about using the dev parameter and compare it
> >> against the clock own device but this proved unreliable. A clock
> >> does not always have a backing device and some paths, such as
> >> clk_get_sys(), do not provide a device either.
> >> 
> >> With this applied, we can get back to removing the direct usage
> >> of the struct clk in struct clk_hw and eventually remove this
> >> struct member entirely.
> >
> > __clk_register() has this comment:
> >
> >         /*
> >          * Don't call clk_hw_create_clk() here because that would pin the
> >          * provider module to itself and prevent it from ever being removed.
> >          */
> >         hw->clk = alloc_clk(core, NULL, NULL);
> >
> > With your change, can this code path be updated to use clk_hw_create_clk() ?
> >
> 
> Indeed the comment no longer applies but I think keeping alloc
> here is best. It avoids "linking a consumer" here where there should not
> be one. All clocks would appear to have consumer in the clk summary, it
> would weird. 
> 
> The end goal is remove the hw->clk. I've restarted the work to rid the
> kernel of using this. Some rework don't need clk_hw_create_clk() and are
> not blocked by this patch but most will.
> 
> Once this is done, we could probably merge clk_hw_create_clk() and
> alloc(), the split won't have purpose anymore.

That all sounds good.

I know that Stephen likes to see any changes that are made to clk.c have
associated kunit tests to avoid any breakage in the clk core. There's
already a bunch of tests in clk_test.c.

Brian


