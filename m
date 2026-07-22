Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041EAC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxEitlPnYg2kH9kyoModuHYbzqhDL9bDDTtUAFaKepw=; b=SeyZUg7e2IeNVTHl4WM8onLGsB
	f3YRK5STnriJ6nnhEtml1WZfACmoQ9tx7ZMiAfP3oFmrERcpdAdT5LayEXx9WdfKliPMWdWDDmF6p
	aHy73tq+kIVu5sghtvsdp484T2t5tyWXpeuO01zqXE7pQkq75KXdOolI8RwRSBgKu4LvWbLsR5biX
	6FjN6jleQCcN3n5O9iMD+0PaljBEZSFBopq+5SzGRl+at/PmSRODYmx6/HBEb2ZznsKK9krbElX36
	qGKI/VVwlFeA3xMDhiycqhMDTR9DC03VO/HE/1FZb3lX4BEwKrxh47/IZtjqfOuDT4R/QKBr/tGet
	kPDKBeOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRhz-0000000B9VC-1Xv4;
	Wed, 22 Jul 2026 07:49:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRhx-0000000B9UC-0wvC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:49:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-472326ca506so9352468f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 00:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784706575; x=1785311375; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sxEitlPnYg2kH9kyoModuHYbzqhDL9bDDTtUAFaKepw=;
        b=fSKl6ExB5kDhFw+WRGAhbcfAciCxQM8iGtCw2naqtNwith9G28tC24PM6dI7RWfmJk
         VCw7Arzm/tFyxdwHxjWuK82P1Nd8qn5ord58k5mUBp1x0WLUeZ8x2mu/HMalEUlHLQKd
         d8W7t8BxP/ctY1aPkU4lrF6+o4jp3I4EWd9MUqhb1zfKsyEHH9I9xe2FzcrN8JxJ3OiE
         5WqfEUvWJW+O0V8fh97twR0MkPjSiTvMmLTr05GkRRdaba5TxKIcxZb5poNdBE/k9Uy5
         vjwrE6ZnG4GepNq08BCfkS5LytTgYS6I+Qf8JnlidcjaKolGXAo4jf0842lg31elcgSe
         qoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706575; x=1785311375;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sxEitlPnYg2kH9kyoModuHYbzqhDL9bDDTtUAFaKepw=;
        b=C0OT1bRMAr47Wlo1bClqBsQOR/LcPRo+ezljyz5cTLiFvGIYp+qL4+vZwjXzqHrauV
         9NBtJaVSifCfAu0Xr2zg66xfETaRsGsCVPGjNgE/w4EamMHrrP6jQmmbhNdCDh4MIYQm
         Qz3CcUz+lu5TupCIyGEw3oqM3KpdWWpdhxIC0YmnGFqn/6lKObPlCnBb7MUOPQLbPNkW
         MxKnjimQx208O/DzAQYVqP/hX0YN1k/OdZx3mhs3u/ZJ++NS20cvyDdbCNyHR2TxRv1v
         +GKUk72bQV1tiKgz/+WToAgXmOXElGUt/2Rs8wmXJLyMKyKvtt2J95tqZ/Cc0CH0l6xR
         lcqg==
X-Forwarded-Encrypted: i=1; AHgh+Rrnv9TiJ9CzI4kEojaSIdXWcj+PPAWBevH6reoMchrhhzyVUWkWYEdyWxXf0d1elVS5UvweOIsqkMM+XpFjmg5d@lists.infradead.org
X-Gm-Message-State: AOJu0YzafobKzypKj81SaxFyGHML19dfFJerkj5/mhxgRgInxT+jRTzR
	dygsaedL5wgHPBg06t8GLgZKqssZavYvBJ3F7NvUIAHgfSaUwuBwYxlmi23URVagrPI=
X-Gm-Gg: AR+sD12pCK87I2kpfO4GmO17i2mnHdfoBdn5IOtdH9JIBcGHTrdyVfO26Sy1IB2ORS4
	KYhCeCUdQssL/5ogSc4zZx8uzgSSxn40i0jzG6b8xkNxqyUTtLLu0AXNWs7wvJYNYOD3P8pL6a6
	P4ttUdT8o1x0gtDuef9k0RA1JOtR5fOusSt5TIRJ7J8Nw3xvh5BukmhtjFHmEIa8yV7upt/8MU3
	XhzytwV8WMjm4qn5OScBPhXNLMtvSsJ+ZMVtfFUgb1KdzDxqU6/ySb4njXuvvHna/th9ucLCt/X
	zjdwU3fSF+HRJzcKgdjx8k1plD7o7ywcqGG5VNovRrmh7D/QgsDZTz5uEafoJVCmhkSjGDQL1P5
	7lJ6dC2eRIX7FXdO0jF2kqDjOvihcpa2g+jTlx+qxOxkikEbuqruwQi78oDwXCLzrM7d09eOvos
	UL
X-Received: by 2002:a05:600c:1554:b0:493:c10c:22f0 with SMTP id 5b1f17b1804b1-4954a50d963mr288452635e9.20.1784706575219;
        Wed, 22 Jul 2026 00:49:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a589:14b5:ba97:3626])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4956ab22e74sm40387815e9.1.2026.07.22.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:49:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Russell King <linux@armlinux.org.uk>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: fix self-consuming provider module pinning
In-Reply-To: <al_3V8N9z25ho8g2@redhat.com> (Brian Masney's message of "Tue, 21
	Jul 2026 18:48:55 -0400")
References: <20260721-clk-provider-pinning-v1-1-63db2e667993@baylibre.com>
	<al_3V8N9z25ho8g2@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Jul 2026 09:49:33 +0200
Message-ID: <1j4ihrea5u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_004937_281796_779E834E 
X-CRM114-Status: GOOD (  24.83  )
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

On mar. 21 juil. 2026 at 18:48, Brian Masney <bmasney@redhat.com> wrote:

> Hi Jerome,
>
> On Tue, Jul 21, 2026 at 12:08:17PM +0200, Jerome Brunet wrote:
>> clk_hw_get_clk() lets a provider get a struct clk for one of its own
>> struct clk_hw.
>> 
>> When a struct clk is created, the module usage count of the provider
>> is unconditionally increased. For a self-consuming provider, this means
>> it pins itself and the module can never be unloaded.
>> 
>> Increasing the module usage count should only be done when the consumer
>> lives in a different module from the provider. Use THIS_MODULE to
>> capture caller's module and increase the module usage count accordingly.
>> 
>> It is OK for consumer-only APIs such as clk_get() or of_clk_get() to
>> pass a NULL owner. As a result, any provider module will get pinned,
>> same as before.
>> 
>> Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> This issue has been present for a while. Virtually all users of
>> clk_hw_get_clk() are affected. The majority are compiled as builtins
>> according to the defconfigs. It is not problem in this case but it is
>> if the configuration is changed to module.
>> 
>> The following modules are using clk_hw_get_clk() and are compiled as
>> module with some shipped defconfigs:
>> * drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
>> * drivers/phy/cadence/phy-cadence-sierra.c
>> * drivers/pwm/pwm-meson.c
>> * sound/soc/codecs/lpass-va-macro.c
>> 
>> Currently those module cannot be unloaded once they have been loaded.
>> 
>> """
>> rmmod: ERROR: Module blabla-module is in use
>> """
>> 
>> I initially thought about using the dev parameter and compare it
>> against the clock own device but this proved unreliable. A clock
>> does not always have a backing device and some paths, such as
>> clk_get_sys(), do not provide a device either.
>> 
>> With this applied, we can get back to removing the direct usage
>> of the struct clk in struct clk_hw and eventually remove this
>> struct member entirely.
>
> __clk_register() has this comment:
>
>         /*
>          * Don't call clk_hw_create_clk() here because that would pin the
>          * provider module to itself and prevent it from ever being removed.
>          */
>         hw->clk = alloc_clk(core, NULL, NULL);
>
> With your change, can this code path be updated to use clk_hw_create_clk() ?
>

Indeed the comment no longer applies but I think keeping alloc
here is best. It avoids "linking a consumer" here where there should not
be one. All clocks would appear to have consumer in the clk summary, it
would weird. 

The end goal is remove the hw->clk. I've restarted the work to rid the
kernel of using this. Some rework don't need clk_hw_create_clk() and are
not blocked by this patch but most will.

Once this is done, we could probably merge clk_hw_create_clk() and
alloc(), the split won't have purpose anymore.

> Brian

-- 
Jerome

