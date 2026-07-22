Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F42C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XKEJ4GerXAvXM3BRhvBsN82I52BHRWShGxcVmHc+dzI=; b=cxBZ0qHwvyo+JG+R6ioODAPNje
	ndsQNOJZvVgD1zjjfbySLdp0tntDxyY1tFbQbVcZ0/VsJIBL94YaCv006Z9a38B4CBXtZL5tTW6y3
	oyfZZ7zxObJRf2ue1i7NF6VKcVFIcIVGZG9Uzd7KhGSWPYo4/28191FNfmRw5PlzEWO+qrWwcegZH
	ekfwxdH85FkJIzljNkCCJgaa1czgKAeMZuO+a49ddDxG3JROF9vq08ETt61kYKMR6X4BQiAQmBDeF
	GcZaOrWXPqfoo9J9qGaOaXwogtVaWlGlzCdbqD05OYmDvE4V21nz8Ns+s8wHzC8CzRoU+Torvoo1S
	18uymx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWGV-0000000Bmr4-47Lw;
	Wed, 22 Jul 2026 12:41:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWGS-0000000BmqW-3Ioa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:41:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49553515a8bso46841695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784724091; x=1785328891; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XKEJ4GerXAvXM3BRhvBsN82I52BHRWShGxcVmHc+dzI=;
        b=cztYQUMdgfn+HZuDLaKEzrxPO1iGNJlaLy2tssrIKHGsf3ZsqRlkyzBFuZDwHSlym5
         zhnLRXUoZ+Cr/S0F6BW3s5+r3JLqgZXHUa1YjfVgvoKQhkiQCSn8GRLh7GYJKqnnJ5JX
         ToLCMF39eTwrhnnqqTbu2tpXIBGue2LxIbQpqJQRMjt58fmoEGS2x5KzvfQ8mQ+eyVky
         Lackj8iP3RI+jzsaKowhfKyo8wWkiGDZANR7Xv01ROjwdrZbk/yd24Bl9goVSaLPNhpa
         YSD/XQcqb4AwK3iZYOxH3bvjjsVstnkhkic9xYxQZOnwaWyZfKNeiRnOVdRLyora5RYs
         wYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724091; x=1785328891;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XKEJ4GerXAvXM3BRhvBsN82I52BHRWShGxcVmHc+dzI=;
        b=MM3LLoTAkkZbsmRtdFJEgOQs7okCeasjcHagSH98FAsz46rdNpX2x/fON9EGRGTap6
         7EFun2cjMoL0irqZX/yRAYe+91a6BuiBDsfpBVMVDKstnLL/NiLAQtQ4xIQRszWBD4NX
         ZOvcC3TbdfTSmeAhxROlN4l6Ab3ehaA0d93a0RtqyW1p+k0jJxF/KaAxPeHRo0aaNTJP
         Cw+h+Y0vEQI4fQqBXlql0onrRjCXjq+IZL4od6aw+UcGaoU48Sq5S6L0r+ofmay1zUKd
         kOXe54EVwZZkGJqz46OONzrCU4c+j1sj21xqFTcXigq6j3d7xGvFiSkKMQ1gHca61Ql4
         0Jpw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+F91lTn5al+MdSddVXIqiJiA/xFkTr2IJOh/YdJMe6V18saqlNY0Xji/U/QR5aBqLkZPsgTAXTj1vXMf6DHlH@lists.infradead.org
X-Gm-Message-State: AOJu0YwpCQn21SbDbTjolzpYpqy3OGtcn4Okk2tJDzMejW31Gwm/hrtK
	+dbrx6krsvTAyUwLv2nHoh+7DH9i4Qts3pqtJdeeydwaFt4PHtC+V7jZOairWH6BtrA=
X-Gm-Gg: AR+sD122S8m2yxBIbnxYMGtqrECghrqvr+p7PvmYaMS+QyMCf1zC5iO21dcUM5J24wi
	nLdqX7AmOQbO3RwJeLrNr3sYgpsUSoLjEGPqmzeB/KtfjjchNC3hHZPdnSBM5Sg3HsHCy6zkLdD
	CCbS13t/CY3qvSXCGw1qtRcCZjvYxYw7jJ1cBYH65SV8Vu224h9VrKGQFmdeQEL3Osc9h/owoCZ
	NoFF6P67Vs8kHD+bsnhATaGO1DO8JIdlxFu3gKGl8xpS37s3KqeNozupj8kj+yKI3ASaif1HZyf
	1mABDsAlLh7MCdzD7cgKm+jyAOUFps/L7oytgIZjomE1pofdnfTSjN8krE8JIu2Tk+CclGvughl
	twsOnr60VEVb3lD7g8e2pT69Pt5JxSL448Ve+XQadEK+o1yRjliRlFNGrIlxATGpFklksFoB8Fu
	a/Y79oU5V/cUE=
X-Received: by 2002:a05:600c:3b8c:b0:495:5039:391c with SMTP id 5b1f17b1804b1-495503939b1mr240105375e9.26.1784724090821;
        Wed, 22 Jul 2026 05:41:30 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956b5c2108sm92979995e9.2.2026.07.22.05.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:41:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Russell King <linux@armlinux.org.uk>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
In-Reply-To: <amC4d_RMA5oRR-ap@redhat.com> (Brian Masney's message of "Wed, 22
	Jul 2026 08:32:55 -0400")
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
	<al_3V8N9z25ho8g2@redhat.com>
	<1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
	<amC4d_RMA5oRR-ap@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 14:41:28 +0200
Message-ID: <1jy0f3ci2v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_054132_854242_48334B22 
X-CRM114-Status: GOOD (  31.38  )
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

On mer. 22 juil. 2026 at 08:32, Brian Masney <bmasney@redhat.com> wrote:

> Hi Jerome,
>
> On Wed, Jul 22, 2026 at 09:49:33AM +0200, Jerome Brunet wrote:
>> On mar. 21 juil. 2026 at 18:48, Brian Masney <bmasney@redhat.com> wrote:
>> > On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
>> >> clk_hw_get_clk() lets a provider get a struct clk for one of its own
>> >> struct clk_hw.
>> >> 
>> >> When a struct clk is created, the module usage count of the provider
>> >> is unconditionally increased. For a self-consuming provider, this means
>> >> it pins itself and the module can never be unloaded.
>> >> 
>> >> Increasing the module usage count should only be done when the consumer
>> >> lives in a different module from the provider. Use THIS_MODULE to
>> >> capture caller's module and increase the module usage count accordingly.
>> >> 
>> >> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
>> >> pass a NULL owner. As a result, any provider module will get pinned,
>> >> same as before.
>> >> 
>> >> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >> ---
>> >> This issue has been present for a while. Virtually all users of
>> >> clk_hw_get_clk() are affected. The majority are compiled as builtins
>> >> according to the defconfigs. It is not problem in this case but it is
>> >> if the configuration is changed to module.
>> >> 
>> >> The following modules are using clk_hw_get_clk() and are compiled as
>> >> module with some shipped defconfigs:
>> >> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
>> >> * drivers/phy/cadence/phy-cadence-sierra.c
>> >> * drivers/pwm/pwm-meson.c
>> >> * sound/soc/codecs/lpass-va-macro.c
>> >> 
>> >> Currently those module cannot be unloaded once they have been loaded.
>> >> 
>> >> """
>> >> rmmod: ERROR: Module blabla-module is in use
>> >> """
>> >> 
>> >> I initially thought about using the dev parameter and compare it
>> >> against the clock own device but this proved unreliable. A clock
>> >> does not always have a backing device and some paths, such as
>> >> clk_get_sys(), do not provide a device either.
>> >> 
>> >> With this applied, we can get back to removing the direct usage
>> >> of the struct clk in struct clk_hw and eventually remove this
>> >> struct member entirely.
>> >
>> > __clk_register() has this comment:
>> >
>> >         /*
>> >          * Don't call clk_hw_create_clk() here because that would pin the
>> >          * provider module to itself and prevent it from ever being removed.
>> >          */
>> >         hw->clk = alloc_clk(core, NULL, NULL);
>> >
>> > With your change, can this code path be updated to use clk_hw_create_clk() ?
>> >
>> 
>> Indeed the comment no longer applies but I think keeping alloc
>> here is best. It avoids "linking a consumer" here where there should not
>> be one. All clocks would appear to have consumer in the clk summary, it
>> would weird. 
>> 
>> The end goal is remove the hw->clk. I've restarted the work to rid the
>> kernel of using this. Some rework don't need clk_hw_create_clk() and are
>> not blocked by this patch but most will.
>> 
>> Once this is done, we could probably merge clk_hw_create_clk() and
>> alloc(), the split won't have purpose anymore.
>
> That all sounds good.
>
> I know that Stephen likes to see any changes that are made to clk.c have
> associated kunit tests to avoid any breakage in the clk core. There's
> already a bunch of tests in clk_test.c.

I know. What I'm fixing here is a bit odd to test though.

The way I did it was to make a dummy module that registered a clock and
requested the consumer pointer from it. Test pass if you can rmmod it.

Not sure how that would translate to kunit to be honest

>
> Brian

-- 
Jerome

