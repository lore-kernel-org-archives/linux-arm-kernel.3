Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA13CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebXcvEqpe5lwjoRn6x1zFE9H08K/qMa9HBHovY/qAic=; b=0BXtdiGeBReC8A6ZL5vr78UbGg
	uc9BEfbjVY82DinGXh5zvIYpJjdky7VNAkySgPxJtVi1RF+Fg8kdcv9VcDs+6wDziYQfvydcZbdNs
	B+in2W6+FuWkeSFb4D207z6l5dzhcaENWe9DPIOOGaavAc+lzCfo7hzuifSdLy+JgVmwz++0VkYRf
	AoaIcdhHpGlC1U2Mq2g0ZMXzLw3XJfR7qJOnRKjejgRrsYoFKMZiFptsO4dBo/j5sjtY/FenccW5u
	QhxL+va7awZcNKhoY4LErs9UdDhTMcH0qSq0OiqIFWJJR/pUl44oMC4hyUZM08w9R8Lyuelr6idij
	OgSUTGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOxNe-00000006tfs-1Ki7;
	Sat, 21 Dec 2024 11:10:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOxMS-00000006tWk-2gDq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 11:09:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361a50e337so18860945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Dec 2024 03:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734779370; x=1735384170; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ebXcvEqpe5lwjoRn6x1zFE9H08K/qMa9HBHovY/qAic=;
        b=FQW+4hSdasiFilqsGROD/PM8waK0BlMHyB4M5N6LYS2Y7+N3RhkaHlV1Y97fmtFBiv
         Gj9tBDOOt7FGbfdMm2ziXhwyc3MY1EQDtIJ9w8d/AeSHEYGeJm/edNJndeedNgFVlzvb
         GwY4EWjYjOnOBBAUik7pFVsqNFIYJ+62PYv8vECmE1+zyGE8RlOYZoZxNALZE/tHZH+o
         nnYww20TqLDbGETCkMDyL4Wos8JQi6BpIMX1FjqZ6pbBX5qdyedF6U1XL6EHJGd42FOV
         MPNi4tKtrJocD7fdp3wXh9fMjyJgqnFlXvXRUlGCOT3rO8MNie6fIMtSg2Po3/CBk8q6
         Lgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734779370; x=1735384170;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebXcvEqpe5lwjoRn6x1zFE9H08K/qMa9HBHovY/qAic=;
        b=eYChdnPmJu3CyubjZpc5s1GLke2Y8lVWKLvpuvZLu7MGRa9UcRIP4zK0AisXfImXqb
         u4WjjZUEYtneGzhHaUh/134wEHdEHTfJDCOsx74pbnSE1EgDEP9n2iD9NL+Hylp9l3O/
         BY6mTGNPNWY0AMESbbg26yjA9mhQcw9LvukI6i1zUK1xvIXBuOa5Qbz4KstaKTB3FDut
         iuVNgHtWJ68bv7yigVPo9rWyv7DuNL/uyEwd7vpVU3g50xpHi/Ocbb+mOj7PgQddNEof
         nKlWmuQnaE1tsHwujJCB1AXBmisGiEhoOxuJBJvQhX+H1nPhQFWTbs9OznVtIywz6/j6
         8R/A==
X-Forwarded-Encrypted: i=1; AJvYcCVZdxDo/cDnsB4Zla2ZkTT8LJWFJV7NdKduIk78B4dFLfJIxr4xtJ3BUoj73LXiO+MPQqGJ7mKHFJmNl4Ur/4gA@lists.infradead.org
X-Gm-Message-State: AOJu0YxaIvzPeoPStY3j0aQpy2Fs478wI0Q3QJoyFM6RTzWY5ZnKmqwU
	hi2MxOM1DReYRaBcfBMy5JsoaRwZXKE6/C2ACMYEWYj8ELDlXB+W5+PeGqN1vvA=
X-Gm-Gg: ASbGncv7xqC1Qp6NDYHPgpwsBRGm8j9QgdMhX9yBLQBxPP1GyNh7Sx+S+S140RBUljH
	PuV0G6/NvY00vfCTl+w0wzneR33bIrh5OfMS2eBS8YnWqerDZhGlCC9LOI9YGQMmehAJV3IszIx
	07xb6FCVkCm8Gcg5HiWzYrPZcu1U9fQgqdnPoNXhk5zbOki2lYye7MjQzV14tY8Dx1gT8etVptH
	YrXpmhgce11fY6DKFOZPah9sOtL6Ztb6CrOk5dxpCpq9xeHxPKNOcQE
X-Google-Smtp-Source: AGHT+IHu149uAhUPHJpaT1OCWuyqQOS8jTVaD6srJBKVvvWQBN8J3K5SUrcTjL+zAGJJAbBoLYGa1w==
X-Received: by 2002:a05:600c:4510:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-43668b783d0mr51917575e9.29.1734779370393;
        Sat, 21 Dec 2024 03:09:30 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:98ba:3af5:f499:255b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4471bsm106710285e9.44.2024.12.21.03.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 03:09:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> (Stephen
	Boyd's message of "Fri, 20 Dec 2024 16:12:03 -0800")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 21 Dec 2024 12:09:28 +0100
Message-ID: <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_030932_890922_2639B3B2 
X-CRM114-Status: GOOD (  29.50  )
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

On Fri 20 Dec 2024 at 16:12, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-12-20 09:17:43)
>> Remove the big clk_regmap tables that are used to populate the regmap
>> field of clk_regmap clocks at runtime. Instead of using tables, use devres
>> to allow the clocks to get the necessary regmap.
>> 
>> A simpler solution would have been to use dev_get_regmap() but this would
>> not work with syscon based controllers.
>
> Why not have two init functions, one that uses the syscon approach from
> the parent device?

That would duplicate all the ops and would not scale if anything else
comes along. It would also tie the controller quirks with
clock ops. I would like to keep to clock ops and controllers decoupled as
much as possible

> Is the typical path to not use a syscon anyway?
>

I sure hope there will be no new syscon based controller but, ATM, around
50% are syscon based in drivers/clk/meson. Those are here to stay and I
doubt we can do anything about it.

>> 
>> This rework save a bit memory and the result is less of a maintenance
>> burden.
>> 
>> Unfortunately meson8b is left out for now since it is an early clock
>> driver that does not have proper device support for now.
>
> We should add a clk_hw_get_of_node() function that returns
> hw->core->of_node. Then there can be a similar function that looks at
> the of_node of a clk registered with of_clk_hw_register() and tries to
> find the regmap either with
> syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
> node for the clk.

That's the thing. It means encoding the controller quirk of how to get
regmap in the clock ops. I would be prefer to avoid that.

With what you are suggesting I could make an ops that
* Try dev_get_regmap() first
* Try the syscon/of_node way next

I can make this "trial an error" approach work but I think it is pretty
nasty and encode controller stuff inside the clock driver.

>
> TL;DR: Don't use devres.

Using it makes thing nice and tidy. clk_regmap does not care were regmap
comes from. It just picks it up where it has been prepared

That approach could be extended to support controller with multiple
regmaps, with a name that does not depend on regmap_config and is local
to the clock controller. This will be useful when the name if defined
somewhere else (syscon, auxiliary device, etc ...)

>
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/meson/a1-peripherals.c | 165 +-------------
>>  drivers/clk/meson/a1-pll.c         |  18 +-
>>  drivers/clk/meson/axg-aoclk.c      |  22 --
>>  drivers/clk/meson/axg-audio.c      | 435 +------------------------------------
>>  drivers/clk/meson/axg.c            | 131 -----------
>>  drivers/clk/meson/c3-peripherals.c | 212 +-----------------
>>  drivers/clk/meson/c3-pll.c         |  34 +--
>>  drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
>>  drivers/clk/meson/clk-dualdiv.c    |   2 +
>>  drivers/clk/meson/clk-mpll.c       |   6 +
>>  drivers/clk/meson/clk-phase.c      |  11 +
>>  drivers/clk/meson/clk-pll.c        |   7 +
>>  drivers/clk/meson/clk-regmap.c     |  88 ++++++++
>>  drivers/clk/meson/clk-regmap.h     |   7 +
>>  drivers/clk/meson/g12a-aoclk.c     |  34 ---
>>  drivers/clk/meson/g12a.c           | 261 ----------------------
>>  drivers/clk/meson/gxbb-aoclk.c     |  19 --
>>  drivers/clk/meson/gxbb.c           | 393 ---------------------------------
>>  drivers/clk/meson/meson-aoclk.c    |   7 +-
>>  drivers/clk/meson/meson-aoclk.h    |   2 -
>>  drivers/clk/meson/meson-eeclk.c    |   6 +-
>>  drivers/clk/meson/meson-eeclk.h    |   2 -
>>  drivers/clk/meson/meson8-ddr.c     |  11 +-
>>  drivers/clk/meson/s4-peripherals.c | 231 +-------------------
>>  drivers/clk/meson/s4-pll.c         |  33 +--
>>  drivers/clk/meson/sclk-div.c       |   5 +
>>  drivers/clk/meson/vclk.c           |   2 +
>>  drivers/clk/meson/vid-pll-div.c    |   1 +
>>  28 files changed, 165 insertions(+), 1981 deletions(-)
>
> It would be more focused if you split the patch into two. One that
> installs the init clk_op and implements the logic to hook up the regmap
> and one that removes the arrays that are no longer used.

I should have done so indeed.


-- 
Jerome

