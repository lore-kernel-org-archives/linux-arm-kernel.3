Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC06C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98nwCRYv2SeYsyOZNSoNm6lFlX/EwFYW68/vkffV1uA=; b=P6Ze2jxkdmktldW8z8QxvchBYD
	aGeMwb3Fplgz0QZGfYdbxUg/ad2rE8Xv8HG2UuBIgjnNciB1I9bM4kk7XNy60IHvWIltxXpusXUjk
	2lZsZ88qk1G4gd8ULDIFrW18m5yR/H2dQvZGYjbIWuW5q688TUBL7mMMnb5I6KRiijIdNgqH8hRov
	qDlw8625d1fOqLvrkYV72ooZaoeczd9rbUcu6AEJNzfhCtzn9tu6G+Rjs7ya9UdIkvtS1aRfPWYTg
	58mSutmva30DJqYJtrAwEOrTL4v2zc4n07Na9OGkcr1+l8JL/pssXgCJrsjVJaJ3UjaJLBm+5AdnI
	kx3UeG+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUlt-00000009ZHH-1F1Z;
	Wed, 22 Jan 2025 07:03:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUhC-00000009Yda-1wzR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:58:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21636268e43so143578525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 22:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737529117; x=1738133917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=98nwCRYv2SeYsyOZNSoNm6lFlX/EwFYW68/vkffV1uA=;
        b=tTYOoYHQwyQb7T40Tmj3cu28pprnlGUzv9csrEa0rNdjimE0m98otnbif3Z8MT7nUS
         NMZumssvoJU6zgRaq2xAqSsRM0xtkidUY9PdsNr5U8IHxrU6wuRRtCih8+ALLIEVhTwO
         yYtoIfZ1vV28CFbKtq5bId7fOg33fEB6TgVcyOTpleSOGB+BU4CL9nyFx+8z4nvZ5u2M
         z636rOsuxfRiGTjuH6BjsF4wha2C7B8wulHsOeWAq6hvS/S/MMkwSnNkkUKU3nixUuco
         2lTPn8vF5vH9kq8MrZJmYd6stOiaFiXW9HOGC/gTaqz0lMPhFYvutfzpzU7Thq9IcoVF
         cGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737529117; x=1738133917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98nwCRYv2SeYsyOZNSoNm6lFlX/EwFYW68/vkffV1uA=;
        b=rZGKYuJlwgP21z/3uMZzOLaTvc1qN6PgsHDg9rU0N4Zza52w24aS1Tv0sftfJ7Xk1Q
         REN9nkMax7J48uj8ZrbFGukQkRdLSZsbp8Ya1JQ//cAGhtA8JZmLF1v3Za1+yRr1RNwo
         mTE700o5ZWcYKy5IxILQuRyOgS2uOQ6WByLEG1924XCROon+dLZDQXsYZP0iSdOY+VuV
         z3tGOACY/BpUvPwOMbUl9KeWWBqmcVfIUO7Huf+8YzRuHcG7ei1NBHc/dtalfP0l63q1
         bFQNbLMnHJRO0ctC+9VLidUjEtpXqH+jNqPPzaTdt5pZLvtOkHouBoUaX3eLP3z2fLcQ
         6Qeg==
X-Forwarded-Encrypted: i=1; AJvYcCWSlwdknKYzygl+dRWIsCOCabLxgGrqS6YIMdftuAXcaqto6QhnkPcvpq5Uu7uarSw2qISITUZ8R/Bqms7nhOQm@lists.infradead.org
X-Gm-Message-State: AOJu0YyRAoHSwhAGExpzh4EH6tiLTrcf/lp+Y4jvmmIIpk2LNLY4uVla
	Z1n/UfCMjJvk3eLdkziEQtAWESZ0dd5M5giIk8g+kWA41cuQCOl1W9DxRcLWRyM=
X-Gm-Gg: ASbGnctcQ17ZuMkDgKtxjtosCw6bve93YrrATjKUWXsXVXCPClZ40L1vjyLUah2gb6e
	lMoC2uf49rDEZ8J4UAKqd35Zu6xPbro8Me3hLAGmz82jW+rjS3Iq8QOzZYljB5gr5du1YpBH63i
	liSB2b9n1HWUcR0q82NpA2MzmLxVPGKWsSmAN4gcacEh2AWx+8ndMPwBxumYX0ruHAdUmN/sqhM
	Ajb08IegQ3XcxPiFc9NdAovItI5pWe5SsXBB9tfQJklfhkiXdeG9HX4n95wPa49x1gGSw6S
X-Google-Smtp-Source: AGHT+IFlyQTrbWJ70KA4F7+yV/Afg3zlHDmPMltEFy0yFNqRhEfo+qrlLDzqJAfprSQh6gV4oL8egQ==
X-Received: by 2002:a05:6a20:9144:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1eb215ec11cmr37960260637.30.1737529117262;
        Tue, 21 Jan 2025 22:58:37 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab9b9b1esm10519029b3a.99.2025.01.21.22.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:58:36 -0800 (PST)
Date: Wed, 22 Jan 2025 12:28:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: s3c64xx: hide unused variable
Message-ID: <20250122065834.c4va6uwjrfny2mfv@vireshk-i7>
References: <20250122065216.1371158-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122065216.1371158-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_225838_515999_9B56D1F6 
X-CRM114-Status: GOOD (  20.48  )
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

On 22-01-25, 07:52, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A previous compiler warning fix extended an #ifdef block, but that
> led to another warning in some builds:
> 
> drivers/cpufreq/s3c64xx-cpufreq.c:27:28: error: 's3c64xx_dvfs_table' defined but not used [-Werror=unused-variable]
>    27 | static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
> 
> Add yet another #ifdef check around that variable.
> 
> Fixes: 76b218721e5f ("cpufreq: s3c64xx: Fix compilation warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

I too have sent a fix this morning:
236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org

> I wonder if the driver should instead depend on CONFIG_REGULATOR
> and drop the #ifdef checks.

The way CONFIG_REGULATOR is used in the driver, it seems like it can
be used without regulators too. The initial commit also confirms this.

commit b3748ddd80569ec753f62e709629b8c639143222
Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date:   Mon Jun 15 11:23:20 2009 +0100

    [ARM] S3C64XX: Initial support for DVFS

    This patch provides initial support for CPU frequency scaling on the
    Samsung S3C ARM processors. Currently only S3C6410 processors are
    supported, though addition of another data table with supported clock
    rates should be sufficient to enable support for further CPUs.

    Use the regulator framework to provide optional support for DVFS in
    the S3C cpufreq driver. When a software controllable regulator is
    configured the driver will use it to lower the supply voltage when
    running at a lower frequency, giving improved power savings.

    When regulator support is disabled or no regulator can be obtained
    for VDDARM the driver will fall back to scaling only the frequency.

    Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
    Signed-off-by: Ben Dooks <ben-linux@fluff.org>

-- 
viresh

