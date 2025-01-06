Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A942E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrz0lFCuK82Hp07LVC+cIDO78ZFHfxHGrWZYexDodT4=; b=xg1qzjOr8+0KHWqRr/oz78Talg
	7CCy3Zgrji3X85z37anEt9QaAllVU6nl0aMSXLxwI0hIxcmEfrhsCv+En8vjootKOSiMbdMkFXYxq
	1p/5fWvGC5MgKF6nygZtzrc2muuhbeounsABw2MPnFlQkxTN9MRrU3lSIOGvxv6u198uECc53rema
	099YV0gofcOZSQyF43YrUI0UXT4gPBq++7OV2btgB9sa/gYEZRblauvActCHnCld70BRgu+MDBRiB
	+p2dCgP0aAsMe+j5hJIhxmDGjTKdqc5EFn9cINGYizZ4tWnfmYTFdSI92Ze4wSRTaSKCRGhF97OSj
	YSbONHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUk74-00000000phr-0xiP;
	Mon, 06 Jan 2025 10:13:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUk5s-00000000pTP-10uq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 10:12:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e27c75f4so10222351f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 02:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736158338; x=1736763138; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrz0lFCuK82Hp07LVC+cIDO78ZFHfxHGrWZYexDodT4=;
        b=Fd3R0EQaEKWcOoMd6d5PGq8jr+lfJV0EYIHh2uCImdqOawdymuZfqKswvZCW03K63I
         gbxJGAg5Cxocyl3kXdGOE+1hz8K9NWXY5nYo+rHTKR3wjGwSiqUZlUzDZqO8XTHZ6sBE
         w1/MTW2fpwpoCW2SsKWI0JqeUCjKqQUlCiPKOfU2yRay7gzXaqYEbnh20AsMqc67xxbL
         84r6rvHhE7VIj+wlzWEjKe6e6kkJiWWsK0wvK2g8p4GHRoB/HkrFRc/AVmfS7SZXK6C0
         psg5WjA0iFtyRvHsaN7wyQLHsXSl80FYXjrH6Q7zaVgW55PFPFBUYXqURi8Wd+dt1m2f
         uQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158338; x=1736763138;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrz0lFCuK82Hp07LVC+cIDO78ZFHfxHGrWZYexDodT4=;
        b=Ai64AqbZkf+m5Z7ux2HzKNOgpF1aDzfKbhgSTtIj9cNJBe3xTUnXQIjOK91mO3i9Ip
         7tk2TvTJk3W59W3cmxK9HzslPDT7u3svZXWJ1ftLHWlV3h0saB99MCiwCj5IJpWdxJ62
         aY5yHAGTWkstnggOWyeJ01DQBi1HS1JTLuVGru8i2XEFQivER0v0Ej3yQuDwUgM36/DW
         XfEb9SE6nz/V0gI9AjyRXC/SAit6WHhxIjthuzivu1M9kxz2moirjWMlntDSAmesvNxk
         t0qAOhMhVF49VHUavP4dIrIorFuMKHmbceQrHSTVgnAf4ebvJoHl7zzyy0HUIN+wjFri
         Yb3w==
X-Forwarded-Encrypted: i=1; AJvYcCXJvERPu8An8eb2ElPZJWV5tqievOiDOItrhzt5WET9zpJgijQMJSqg5/4tv+EcUW9AMNyk8fkKF/VkN9TPgGT2@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIXwJ7jclhiV2aG6qyQtsnJZ0OfSJP7FXqQ2iANkCe5S9xwFp
	AA/t3bWzB/aVZqk2qX/oYOe9scs7vDRDu74/FElbslK1w80h3YCjDWIumaPNtN4=
X-Gm-Gg: ASbGncviXmmEh44fVeE6s8qbllI68iSQXPjTOxouCHwOihx1+uO7cQxdKZ7GMS/AENm
	e6QP4Z0pkOc4E2Bujh/VFxa0peyxuP+EnR0z8ttTpsv+NXTPO/bbo/+FRWUBgfYtTnWVy9I9d7f
	OEm/tMa99hQ9kO7Cbs3QSKVccfshgOOScgq71cimsnCc703tPlKAiVY3JIzCmeb/Nz5Gy2YbI9i
	kfD2iKGoEe/xYPoRq+WTwR79v/K3BWg79QAMtrw1NDpWNfsTSRtDXIH
X-Google-Smtp-Source: AGHT+IFaxGixHUun2XH8nipy7jJnc/zpryL28gv0v5yxv4oK1sYJlkwuVGxq58OL8DC4FuqLVbEAMg==
X-Received: by 2002:a05:6000:1f81:b0:386:1cd3:8a07 with SMTP id ffacd0b85a97d-38a221e2d29mr54182442f8f.7.1736158337707;
        Mon, 06 Jan 2025 02:12:17 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e375sm48306220f8f.73.2025.01.06.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 30 Dec 2024 17:08:26 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 11:12:16 +0100
Message-ID: <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_021220_434212_B465A6F8 
X-CRM114-Status: GOOD (  53.03  )
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

On Mon 30 Dec 2024 at 17:08, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-12-21 03:09:28)
>> On Fri 20 Dec 2024 at 16:12, Stephen Boyd <sboyd@kernel.org> wrote:
>> 
>> > Quoting Jerome Brunet (2024-12-20 09:17:43)
>> >> Remove the big clk_regmap tables that are used to populate the regmap
>> >> field of clk_regmap clocks at runtime. Instead of using tables, use devres
>> >> to allow the clocks to get the necessary regmap.
>> >> 
>> >> A simpler solution would have been to use dev_get_regmap() but this would
>> >> not work with syscon based controllers.
>> >
>> > Why not have two init functions, one that uses the syscon approach from
>> > the parent device?
>> 
>> That would duplicate all the ops and would not scale if anything else
>> comes along. It would also tie the controller quirks with
>> clock ops. I would like to keep to clock ops and controllers decoupled as
>> much as possible
>
> Hmm... Maybe the init function should be moved out of the clk_ops and
> into the clk_init_data structure. It isn't used beyond registration time
> anyway, so it may make sense to do that and decouple the clk_ops from
> the controllers completely. Or we can have two init routines, one for
> the software side and one for the hardware side, but that's probably
> confusing. If anything, a clk hardware init function can be exported and
> called from the clk software init function if needed.

The .init() is really for the clock itself, so it makes sense for it to
in the ops. Removing the init from the ops would just be another layer of
controller init, something we can deal with in the probe() function.

What I'm trying to do here is properly decouple what belongs in each.

>
>> 
>> > Is the typical path to not use a syscon anyway?
>> >
>> 
>> I sure hope there will be no new syscon based controller but, ATM, around
>> 50% are syscon based in drivers/clk/meson. Those are here to stay and I
>> doubt we can do anything about it.
>
> Ok.
>
>> 
>> >> 
>> >> This rework save a bit memory and the result is less of a maintenance
>> >> burden.
>> >> 
>> >> Unfortunately meson8b is left out for now since it is an early clock
>> >> driver that does not have proper device support for now.
>> >
>> > We should add a clk_hw_get_of_node() function that returns
>> > hw->core->of_node. Then there can be a similar function that looks at
>> > the of_node of a clk registered with of_clk_hw_register() and tries to
>> > find the regmap either with
>> > syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
>> > node for the clk.
>> 
>> That's the thing. It means encoding the controller quirk of how to get
>> regmap in the clock ops. I would be prefer to avoid that.
>
> So if we moved the init function out of struct clk_ops it would work?

That's already what I'm doing actually. I have the controller part which
position regmap so the clock part may get it regardless of where it
comes from (syscon, io or something else)

> We could have helpers for the common paths, i.e. the device has the
> regmap, or the syscon has the regmap, etc.

I think this is what I'm doing actually.

>
>> 
>> With what you are suggesting I could make an ops that
>> * Try dev_get_regmap() first
>> * Try the syscon/of_node way next
>> 
>> I can make this "trial an error" approach work but I think it is pretty
>> nasty and encode controller stuff inside the clock driver.
>
> I get it. The difference in driver design while sharing the same clk
> hardware and clk_ops causes this tension.
>
>> 
>> >
>> > TL;DR: Don't use devres.
>> 
>> Using it makes thing nice and tidy. clk_regmap does not care were regmap
>> comes from. It just picks it up where it has been prepared
>
> It doesn't work for early clocks that don't have a device.

This is why I left the possibility for regmap to be "pre-populated" so it
continues to work the way it previously did.

I admit early clocks is a low priority for me since I only have one
controller like this and I do not expect more.

If cleaning up this particular case is important, then I could add
another level of init:
* A callback passed along the init data of the clock to get the regmap.
  That callback would be called by the .init() ops, if set.
  That can encode any quirks without polluting the ops.
* It will grow the init data so the change won't save memory anymore.
  This was more a bonus so I don't really mind. Maintainability is more
  important.
* If the callback is not set, then it goes through the default, as
  proposed here. This would avoid patching all the clk_regmap clock of
  every controller.

>
>> 
>> That approach could be extended to support controller with multiple
>> regmaps, with a name that does not depend on regmap_config and is local
>> to the clock controller. This will be useful when the name if defined
>> somewhere else (syscon, auxiliary device, etc ...)
>> 
>
> I think you're saying that clk_ops can be common things that aren't
> device/clk controller specific, while the regmap config is usually
> device/clk controller specific.

Agreed

> Furthermore, the name of the regmap is
> also usually device/clk controller specific.

The name registered in regmap_config itself is device specific, not
controller specific, since it can come from something else in the
platform (syscon or even aux devs), that why I think an independent
namespace is desirable -- Same goes the generic solution Conor is
working on I think.

> The regmap assignment
> doesn't really fit with the clk_ops because it's not operating on the
> clk hardware like the other clk_ops all do.

I see what you mean and I agree. It does not operate on the hardware but
it does collect the resources it needs to operate the HW, and ideally
it should do just that - without controller quirks popping up there.

Anyway a callback passed in init data takes care of 'io vs syscon'
controller too, same as devres. I can go that route if this is what you
prefer. I thought devres was a more elegant solution but it is indeed
restricted to 'device enabled' controllers. 

The change will be a bit ugly in the syscon ones but I don't mind.
Is that fine for v2 ?

-- 
Jerome

