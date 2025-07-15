Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00D9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ3KsY7RuJMCeoFmZ+VPC2LvIrEx59LTT+bBZVmw8v0=; b=TgcCDBXs+tHUqx3NQOeRXWO6rZ
	dRb4eLrmd5wiSiQBRKfosL/lJQaozab4msIvSMfIZD69Y6RPnOGg06YczBSCB3vymiLjwGMEkI78w
	tpk4IU2QyXLTo6oYJ9DA6RvhX8I0iQiVGEumpMvP2CCo6CEwzeSGQMwn5U7Ky0Gdw5wvYeqsHdA95
	Q9x2uwnGPCwJ+BePp0J5/7E7DzgqRwwPuhQ3pfL1kpIQx8L1YEr69BF54OWSWPYQDC9C9QuGk2/aM
	+QUSEanflodEJ724giTv1NVRSng+1+3xivlwX9QLF3w6HfsqnzjUyt+Pkj5gckvfg+GYxpop1Syru
	d2u5StGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdTk-00000004tYr-2tLc;
	Tue, 15 Jul 2025 11:05:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdRJ-00000004t4q-0EwQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:03:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso5107590f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752577391; x=1753182191; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CQ3KsY7RuJMCeoFmZ+VPC2LvIrEx59LTT+bBZVmw8v0=;
        b=wPahR1MxqKhy2l/3OL7wGyZH4D5Ubv/n+D/xBq08namygg0pTjItLkM2G8YJENFZUB
         L9fom3x3Gcyv0bhYsF9TqD2QR7/MdEgdsj7cNij0NclkCNLoXLnIrHMf0I9cpiKivUfO
         qEf8y2L+G5QvgxQhJ8L7HhaBm4Ctsbt9rY5sTozsKrHZK9OIBsyR15XS8vdl1FSk02TR
         6GBT4iKYG3aTi42XWarIs1Mq4g5p1MPCAXbvrIpmmNH7Au6MmeiVGWmAIhxkbbSxjVyW
         Uv4M+aDW1OqgZKDVnOKd6xb1LGxuxvuTKcOnTypft6bfDjNcY1xSsT2tchoDK+D6dA2i
         IFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577391; x=1753182191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ3KsY7RuJMCeoFmZ+VPC2LvIrEx59LTT+bBZVmw8v0=;
        b=ggyG4mM5WR+1/2X3xzyY7e40m/cbuNf2b/vGA2UYtliUMha33tjcIyIHKG0BEeqX+T
         bQSfGdSICpQrAg3wogZoH+IAQJBnu4rLgQ6MN3LtTZDbmUf5iOQJ2bKg49ueyQB2sRMX
         Pa5DI0DmL3lwWNV4ZVgmzjgTcrh6aPcbxSX42LSvxd9TeeZDXzNiuOHpRpHwzXfgYjNw
         sO1m4YyYLbXF63Mgq2GxNlq7Sqoe2qu3uCp8kuyrmcMhyQLhhNX7P5qSvPycVvwo331V
         KZUP2CbRUvhKP3HYdYeVBj00TCMOCcHPtcZ8NpFhnhrrpyTRLFYOgXxDHlxkBDg04mU1
         Z24g==
X-Forwarded-Encrypted: i=1; AJvYcCXcdbadShb4flVRGnGtMWlyhnIgxtp91+Hrf6tzYMt1d0Tke3NilBu7aCRJcefPjHbfHGGkWWtZhSqQpT+AxKcl@lists.infradead.org
X-Gm-Message-State: AOJu0YxW+Uc60QF8xx9XZ/USegvcmfNM5/qfxrx0Mw7EXSS6pXvywc6h
	ge5qf2o2yEg08DWhZ0svFZs9WAVn1ZIh/MR3Kg1UXdE3UfJp6i7R1pMiJ5ma40XBdnw=
X-Gm-Gg: ASbGncvQyOMeqSFh5Xum4rx900qhC5ekuc5T51CFq2W0vP+PRFwRMk+GzW6JJ74AbFn
	CfrKZKaTw5xLgBIqB6LSGYGv3e2SLr4I1mfIcs+KiDHDez7fIY9AqpgGfeo5KDvbiHeCK335sqm
	BwMwVSWcrZV5veVJwksB4OBOCFgjVmWPauIhWvmz+fMRmwf3xlOKOq9gMFM8ngEu02Fp/8Y45oZ
	xH3wSnBqhkgo1qXf4iWYxkmFwognbmWL4athaDmGeKxRPWDz7DafG+kvFRIdnk/ZlBq+svmERh5
	LbwNxL6FgXO15l6EIx/0Wq+oZCOM/jLMyhVZmMBz8QlP8aG3G62ox0SKgPgxxML/0TKvbFoLLDq
	4Qos8rkAtWlVIkX+P+nYNNV5tQ1yrsgCFF+RkIkM/rKVWFGxaaFZdyu2IP6/Z
X-Google-Smtp-Source: AGHT+IFT6+e+1LHPoHL9zRhZjHAJcWyBIubOz9pyvb5+t2eyC4mO5maHD0gKqNkv9qAY4Y+9Ky5qRQ==
X-Received: by 2002:a5d:4291:0:b0:3a5:8d0b:600c with SMTP id ffacd0b85a97d-3b60a145bc0mr1397391f8f.3.1752577391366;
        Tue, 15 Jul 2025 04:03:11 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc9349sm14634243f8f.45.2025.07.15.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 04:03:10 -0700 (PDT)
Date: Tue, 15 Jul 2025 13:03:08 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/6] Add module support for Arm64 Exynos MCT driver
Message-ID: <aHY1bPeEMXycbKjR@mai.linaro.org>
References: <20250620181719.1399856-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_040313_098046_09B391A3 
X-CRM114-Status: GOOD (  34.00  )
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

On Fri, Jun 20, 2025 at 11:17:03AM -0700, Will McVicker wrote:
> This series adds support to build the Arm64 Exynos MCT driver as a module.
> This is only possible on Arm64 SoCs since they can use the Arm architected
> timer as the clocksource. Once the Exynos MCT module is loaded and the
> device probes, the MCT is used as the wakeup source for the arch_timer to
> ensure the device can wakeup from the "c2" idle state.
> 
> These patches are originally from the downstream Pixel 6 (gs101) kernel
> found at [1] and have been adapted for upstream. Not only has the Exynos MCT
> driver been shipping as a module in the field with Android, but I've also
> tested this series with the upstream kernel on my Pixel 6 Pro.
> 
> In addition, I verified that the Exynos MCT module cannot be unloaded on my
> Pixel 6. This is due to /sys/module/exynos_mct/refcnt > 0. So if you try,
> you'll get this:
> 
>   root@google-gs:~# rmmod exynos_mct
>   rmmod: ERROR: Module exynos_mct is in use
>   root@google-gs:~# cat /sys/module/exynos_mct/refcnt
>   9
> 
> Thanks,
> Will
> 
> Note1, instructions to build and flash a Pixel 6 device with the upstream
> kernel can be found at [2].
> 
> Note2, this series is based off of krzk/for-next commit a15edf91668b ("Merge
> branch 'next/dt64' into for-next") with [3] on top.
> 
> [1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
> [2] https://git.codelinaro.org/linaro/googlelt/pixelscripts/-/blob/clo/main/README.md?ref_type=heads
> [3] https://lore.kernel.org/linux-arm-kernel/20250602151853.1942521-1-daniel.lezcano@linaro.org/
> 
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Donghoon Yu <hoony.yu@samsung.com>
> Cc: Hosung Kim <hosung0.kim@samsung.com>
> Cc: kernel-team@android.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: John Stultz <jstultz@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Youngmin Nam <youngmin.nam@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: André Draszik <andre.draszik@linaro.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-samsung-soc@vger.kernel.org
> 
> ---
> Changes in v4:
> - Missed the "v3" string in the previous series for the actual patches
> - Re-generated patches with --base a15edf91668beefdb5171c53fa698c9b43dd1e0d
>   for kernel test robot.
> 
> Changes in v3:
> - Rebased on top of Daniel's timer modularization prep series [3] and
>   krzk/for-next commit a15edf91668b ("Merge branch 'next/dt64' into
>   for-next")
> - Added owner references to Exynos MCT clocksource and clockevent objects.
> - Dropped #ifdef MODULE conditional section in favor of just using
>   module_platform_driver() which will properly handle setting up the
>   of_device_id table based on if the driver is built-in or a module.
> - Update commit message for patch 2 based on John's feedback.
> - Dropped DT change from v2 as it was picked up by Krzysztof for CPU Idle.
> 
> Changes in v2:
> - Re-worked patch v1 5 based on Rob Herring's review to use the compatible
>   data for retrieving the mct_init function pointer.
> - Updated the Kconfig logic to disallow building the Exynos MCT driver as
>   a module for ARM32 configurations based on Krzysztof Kozlowski's findings.
> - Added comments and clarified commit messages in patches 1 and 2 based on
>   reviews from John Stultz and Youngmin Nam.
> - Fixed an issue found during testing that resulted in the device getting
>   stuck on boot. This is included in v2 as patch 5.
> - Collected *-by tags
> - Rebased to the latest linux-next/master.
> ---

Applied, thanks

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

