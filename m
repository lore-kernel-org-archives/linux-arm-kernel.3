Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F14C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxyu4837xaBsPKdh19s14kC1VMDWEUK2aQpdlRhN9bY=; b=I2GaH0ygqiqf3oWVKRGBob8ERY
	afsHdclIQsMSmsYMpbJa9C0Yv90B+3aPe9HQpDhJQZHDzbgtfcJ5c5Jt9gWffgIe0m1ZaKsKFASE7
	Ntkpv/R8r1NAuiFRnooKyM2Y+NSiy8/XPaaR07xBbuW9FIfmIap4EZV0yN6SShnhN//4Fll+ASZp8
	vhA/jT/hrG7ry2gYzA+el4bhVcnvd90xVQQuR5n+iOz+cdNjGfqFfLEQ0HpxxSFJ4J+SDyvgc5/HC
	zaVGNQ9Xmw5udulDfeHZTHu+S2DheUo83ZCF9hlCvQox7YV1cwGxQXMQJKx5ecA/sLssLfZGcgR54
	EIYc+Rnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvebH-0000000FLh1-272T;
	Fri, 21 Mar 2025 15:47:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tveZa-0000000FLKU-0hGl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 15:46:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cf257158fso15183215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742571972; x=1743176772; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxyu4837xaBsPKdh19s14kC1VMDWEUK2aQpdlRhN9bY=;
        b=0D08T0anpurf6B/C3svR5RL/i4U7ltLQiVDvbMBikh8sbWtKdi5YTG7KlpLveN1Wve
         qC8Wbte3bEd5Q8RWDkXg/V5Z3KWnsq9FiFO7+8nCW79zZo6dS+so4jY1IethNaUQwT5a
         PCTAf+d1nhpARKIVinGtDxqV3pE7Br4MQnOBCz8UjzvIBX3odY7TNuJtRJCSuN/hl/SL
         qOD+lITTHBuev5VSZtCaiTWTGtOpwaHi5tjbwe0a79XXdbLPfbhxM1Nf6sd17/48hzDg
         +AcoyNPQyq6RN/ATV+GZnTrLzn6AvCfyaLZfUiReGZpQ6KzMRGEIzsT/sAA6gRVUlNjt
         NVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742571972; x=1743176772;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxyu4837xaBsPKdh19s14kC1VMDWEUK2aQpdlRhN9bY=;
        b=nXg5WXDLy/cCtdAFLAu4ul/T+peF/2hkcRuMPLxJu6w7Ygij7eNjYXMRQFAECxd/9M
         jz2lLwvNRcbXo25rLI42WRGuP6xJcRB7wcfRFOZMw5TiJ0ew50bgv1I1bhC/Y0Bc2P39
         rV4leocV1EGfzmyUL8o48mEiBaPS4ta28xd8JRr1eVeu1anCkuCpOB0+GwL2xAy8OJ4r
         05nzEX8PFy6lqbR3enY7Lk4Ztfh/vvCwgCTG2SEfl01C42W6dmn8Wu2Lzvr9gvjpmcRa
         LB7UarGzhu0kL48qNFK3w0pv0nn2subz0Ksk0K5nUMTSRrb4EWgoMlyZ3aDMMtCJDT9/
         L4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlMdAYlnGsbk25Gqxp897JPLGEmFCIro/CXEiOJIDnUjKxk+fYPaikTR2v85IpJkuNqZ0k6W7UneT1EVZyzKRt@lists.infradead.org
X-Gm-Message-State: AOJu0YziaeyZQOXkOhyNBW2ll7i61aE9mDSKXiKYOGXaNRUMwqulbZkX
	g66we1Voa+j4v6R4vOzQ7Xezs3E1STSc5I86s4E/JnGP4FmaDxRMZ29MuhzTWA0=
X-Gm-Gg: ASbGnctoHxP9O8NXlPu6aCBbRCR5p8HYl9yJN0SwDKCo3NHt6PcOcsdKkRAr32WZNnC
	IGoxF0DhtyhH3Q69Iqq3rsX+y/PLdfkNMARuwdtTQ8u+YEKHG/UaoIGvsB0oDlbvOBdWYRylnov
	nPHzE4SKcnNg4XoxB/4vcI3AzaF0P7u6cg6pmvSqK1UVFGCk6x1kyejCS5ZQ0OmIFBQQtbcQCt7
	M2G/YNG/fv8Ms1Qt9XExTYnAFYni0fVr/UHWps9QHQv+cVe39iSPBcNnXMvrEODgqJLEHGpanR2
	LEYiCKjsZNkZZgLHUxPPHKRL4KA9DGB+tY6PTkiFXmzJ
X-Google-Smtp-Source: AGHT+IHA8cRGoAIkPVPFNmZnRzpsn7R6Bm6hI1qPItBl8eiyD+ALObZwrN5Smom3mHRzHmPrld4JMw==
X-Received: by 2002:a05:600c:1992:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43d50a553f2mr30247065e9.31.1742571971921;
        Fri, 21 Mar 2025 08:46:11 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2102:ce42:30c0:9b40])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd9e96bsm30814545e9.25.2025.03.21.08.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:46:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org> (Stephen
	Boyd's message of "Thu, 27 Feb 2025 14:55:00 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
	<1j4j205ark.fsf@starbuckisacylon.baylibre.com>
	<5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 16:46:10 +0100
Message-ID: <1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_084614_194894_486C8719 
X-CRM114-Status: GOOD (  35.18  )
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

On Thu 27 Feb 2025 at 14:55, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2025-01-15 07:58:55)
>> 
>> I'd like to register controller init hook to apply on all the clocks of
>> a particular type. The reason to do that is to drop the big clk_regmap
>> table that are a pain to maintain (in addition to be ugly). I hoped it
>> would also save a bit of memory.
>> 
>> The solutions we've been discussing so far feels like we are moving
>> around the problem, recreating the memory saved somewhere else,
>> perhaps in a more complicated way. I'd like to find something more
>> convinient to use, which does not scale the memory used with the number
>> of clock registered. The point is not a different hook for clk_hw after
>> all.
>
> What are the goals?
>
>  1. Drop clk_regmap table

That my first goal

>  2. Reduce memory

Would be nice

>  3. ??
>
>> 
>> Here is an idea, how about list of hook identified by ops and controller ?
>> 
>> The node would look like this
>> 
>> struct clk_type_init_node {
>>        struct list_head         entry;
>>        
>>        struct device_node       *of_node;
>>        struct device            *dev;
>>        const struct clk_ops     *ops;
>> 
>>        int (*init_hook)(struct clk_hw *hw);
>> };
>> 
>> The change would be minimal in core CCF, just searching the list for a
>> match in clk_register. On most platform the list would be empty so there
>> is virtually no penalty when it is not used.
>> 
>> From the controller, the usage would be very simple, just calling a
>> function before registering the clocks, something like:
>> 
>> int clk_type_register_dev_hook(struct device *dev,
>>                                const struct clk_ops *ops,
>>                                int (*init_hook)(struct clk_hw *hw))
>> 
>> or the 'of_node' equivalent.
>
> Why can't we register the clk at the same time? I don't understand why
> we want to search a list to match something up to what could be another
> argument to the clk registration API. Isn't this the same as 
>
>  clk_hw_register_data(struct device *dev, struct clk_hw *hw, const struct clk_register_data *data)
>
> Why is that hard to maintain? Is that because the clk driver is
> registering various different types of clks and it wants to do different
> stuff depending on the type of clk?

Exactly

> Why wouldn't wrapping the clk_ops
> in another struct and then using container_of to find the custom clk_ops
> not work there?

For this particular problem, it still does not scale well. There is more
than 20 different ops (and counting) for that clock type. Those would
need to be duplicated for each different way to get the regmap. That's
really not ideal

Side note: That's very interesting idea for another topic I'd like
address someday - not having all clock as global, but the just static data.
That would be a nice way to attach an allocator.

>
>> 
>> I admit this is heavily inspired by how devres works :) but it does solve
>> the early clock controller problem and does not scale with the number of
>> clock registered.
>> 
>
> I don't know if devres is a good model. It's about tracking allocations
> and things to undo later, not really to track things to do when called
> initially.

My point was more the decoupling it allows.
Maybe it is me being too picky, but what I'm trying to do is related to the
clock type, so it bothers me when it scales with the number of instances
instead of the type.

More generally, something devres-like allows to register an attribute
and link it to a group. Then the group members come and just pick what
they need. Whatever manages the attribute does not have to track
them. That is pretty much aligned with what I'm trying to do.

-- 
Jerome

