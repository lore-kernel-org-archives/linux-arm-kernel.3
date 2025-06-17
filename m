Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD043C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NIdWve1K1b8QzOBntihNhgvZs/2vkEK7FdH81C/3/I=; b=ah809SjKiEnHRbNjDt+Wgdoixn
	g8nse9XsZSxE4dhcDHx8D/8C1VAS8jWllKU6YYHvZCpCrb+ggi6Iixk6ecsKkZiFbjaQrP2OBSs0F
	XZo1QPn0zITzoK7pHefP5Hq+3lNq27OgOKOCL9evvIvkmV4CD7v3NvCUfZoYibI4pj5ZyObJfKsi9
	Tg3+EVypq2E4SL0VTNyRPFXfPKeeqN3HymRmV6dgb/EwvobqOmaAh0sGtV2WYCtKvwayTmGZ15R0X
	lIVMF0K/L9EEz9CEC3yysyn3ZXU0s6JyHGj6u6RB1+qN/08GVo5g45x3/Bbn5m3JNMXGCh0u9It7g
	HEIVXncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRefX-00000008VEZ-3rFo;
	Tue, 17 Jun 2025 22:20:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRedK-00000008V5b-1e3C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 22:18:23 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2350b1b9129so44722325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 15:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750198702; x=1750803502; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9NIdWve1K1b8QzOBntihNhgvZs/2vkEK7FdH81C/3/I=;
        b=kKAPcPjcvXk0a0ubVFfNqhNdgUHcK9C0cuGUcF/21z3hX/XGkCIq0ehRA1ZBOnisQ/
         7xMh3g60ga5vTLgfflJwvj2uCFSl6d+o/SwCGfeDCFU6PzYEJgpnofleImOSyEugbO+Q
         pkxKJ8fwZsyE9EQ+RmqIDNQsWZnOiNX7mPgZAH//6eRhBdPsk/S6GAVs9mJB0n7T/uuu
         HS15oUUCSXg8Mi9rdhG4C9OCRSdNBeIItJqBNRFUoW1LFyXQs02O/UpJGCaeePxsOjjx
         uy8TZuWmo9cTPUasCt17IpO+kwRKwsrKl9aRzhMAmSMAdP3j23HhpvOcgkxcW3korW7y
         NnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198702; x=1750803502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NIdWve1K1b8QzOBntihNhgvZs/2vkEK7FdH81C/3/I=;
        b=UqaO9Q9rPRESQpSkzg5GsmC944iGYROtiqttEmZGpyabHQgpGnBDhs9PMZ3UuXo5pr
         Gs/g3063hibD1EPFrOwAO3mkmLtWrvZGonzbN2jWRnY1JyWnfy5v+w+OuDs/DmqONKzy
         Jnh4a9vY66L8UJLkzoNZInX94m13UV8aV7ik60NixRk/3u0kW6XJhNE5UFRAQDXYEzU8
         uN0grCqYJr1H3Krk5CjbM+aPRXvOgYyUwNFO5KT58Mxc5lQRG1cuM1zOLwzdT/pueHsC
         4aYHPFt+9t0pW+M1GXTFu4BPSWtnlvBRUXvMp7gKirM1GBBHMs4QDUhYOb7d7VhKx8jz
         tY8A==
X-Forwarded-Encrypted: i=1; AJvYcCXziJZ9Evu406dlO98u3V8jQ84iuYOWuPEbOWGTufx/E2eHvY9nyEzn6SI1p6mB8atnsK2+4zn3FqKJCVY31i4h@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb60jm1lK+ZsDt+bUG6IC1uRfEtswUWSj0yIreWg+y++si5fKo
	95hxaf7+SXLIgYodI6rV7J6dCrrIXFMKbs3kO7Ui9kaDwbs1nZqG9zu2
X-Gm-Gg: ASbGncs39Gp2+Y7awzW1XBTO1xrl7Hwz+URp8hMu6SG0lU/00QdAge2Xie2Burfln8S
	YBSqw7JlFCSY54JlclqhCAFRTGUTiB0V1H40afi2kQoUIuOe0+1Hcp4K5keRpPwpSLNiKCJfGZL
	yv699UnpqQZRbAl/YyCMamz+QwRz8U7Ceo0dzR6XHgCgpF55eDFBt4GEmJyzhNwlNwFGDP2L4ED
	6ukpQSuED5IuoMuf2G52Ig4hple+xwRiaymUj+2WMpcBTkfD4iRGWcMJVpsTRn7GZk1OJvQK0qa
	GC9lnPGEDbSalDrYZS8E1bT9T0oH0hb5HLl+TcLGZoOoUk8JEq2YqIVYkPBSJs4=
X-Google-Smtp-Source: AGHT+IF91BQZXlbd6uuMahbLtTEtN2tg3W8Od60D+rCGiIPm2Y3r9UQq92CpdM0V1gssQmyVDCfWGA==
X-Received: by 2002:a17:902:8bc8:b0:234:a139:120d with SMTP id d9443c01a7336-2366b32e4ebmr135159835ad.7.1750198701630;
        Tue, 17 Jun 2025 15:18:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4cd9:8b8e:24cd:5a36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca40fsm86178655ad.208.2025.06.17.15.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:18:20 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:18:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Vinod Koul <vkoul@kernel.org>, 
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 08/11] Input: apple_z2: Drop default ARCH_APPLE in Kconfig
Message-ID: <oinzomct3qvhmlvulhsubckhtarrz2eedk4ymgnvfeebmiljtt@3wtkh3un7cdb>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-8-0e6f9cb512c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-8-0e6f9cb512c1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_151822_430368_4633F561 
X-CRM114-Status: GOOD (  10.48  )
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

On Thu, Jun 12, 2025 at 09:11:32PM +0000, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied, thank you.

-- 
Dmitry

