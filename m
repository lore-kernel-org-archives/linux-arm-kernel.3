Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7BDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=; b=tDZmqyus7rheJuxXskwH4XdI6+
	NZ2ynWno5Rz4NPG/1BXQtJmtILPWUaxNbn669QJNHqXcS+R6OTDqh7JlMtIof4pSWFK6zM2v/A0X/
	uBvEsr6PNwjnqTqOco+YW9wxn55ZymjuIA2dKlZxHDPzNKiS9/HAOETUSDfes2c33gFB9qTGdg1Mc
	kLUTLBx+Zb3B9CnRoX5FCHBzx6ULxtS3nh4me7oFGatVXDrQczca1Ju/0Ee4F6c1g5lvnqX1DVoyC
	x/GnThKtKQtXctKmL25uX+hmTPR9Z5rs4D42zO2PTfDgt4pFkT7rvOoeOrUGwxnz5AwneGDV6EzsM
	SQaUTD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMW7e-0000000BYlH-474J;
	Tue, 03 Jun 2025 18:12:26 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVzu-0000000BY2e-35fQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 18:04:27 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so5750038b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973866; x=1749578666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
        b=N84vBxxvZzpONptGEGmiRQ02DKL4EjSKUdMBVom/mAmXpmODXXLkEKKM1vHEz2ilAD
         gXjxTBY4zJRy3AKR2h5aUg/cSPSxiAkbjyazWCmkjJ1kip9VA2VepwWwC9jyCFEl37a/
         178SyNIVeAJSvNbmUvp/Sn1hgUNFuRDmXwp5scNPQSmTFRQkE4bc3DlRJkO1zTY/E72i
         w/F0AL7NPbR/Jpy/8xj154xAq8BUiwrsCUW0zObr1tXRrWFCLQUxhebkZ3CF1rUKNHu8
         EiVmKp3CYMWf2OgDhLaKAnBuFWHeZCvmFRm54FSl5F2rgaUYhjaFaeuslj1APSm9+w13
         TF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973866; x=1749578666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
        b=Uw25gIga6dZywNp6upl2EXf61jHsxnwnVtRjuUn7+qjZNWigzSG9ydA4elHvwDUgSq
         y7nJw/nRlOMDt8v2S9yuYcVEC0m3hOo4unh/Q4Y1IIN7t0+vig1f5T4QPpsBLb6mHXP/
         XCmOh/3FSopAiXstV2jrFD9y0dGC7MY+pa932sF5sFVWVxJL61rDPIpPO72TczwISlW1
         GIKkwNkvEYqED1i6nAG1X8K28wTIbiXLtdc9xhE/zl4uYv9bfHoeNsUSW3NKy5mEIFRC
         ZZLrcDeJFx4TGVMy48JZnfAV/j1LkQ9lHW+w+jkFMY3MPu+XqiYI408Yvtic7UjGJVBY
         hCFg==
X-Forwarded-Encrypted: i=1; AJvYcCUizfwLYaWcTln0BVu0PvhE5ghLIHe2BD+aomOdTmaHvCGY+YFma2344fR90j5P35P6mifaLOK5jZutdRQTRxtZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyun+R9AXNzeuONXR4JBTHNsnvhQCup5NRgh1pHNk1IcJVqX3G
	kjQ0ONQcRvS9nDWAbr0qVEbufoU5qFmTkca/JReP6MUHVRrnyOTrE/1EbMXW1M7dTA==
X-Gm-Gg: ASbGncuLAZexfyPJVqeZjGS1vRSvfhuAks/yW5alNknPMETdkWrXqpXUCYO0XJqR0T4
	SRmX0ITz9+EKGvSW7JIcwdAOW3fMAUCb93KFhEdFB45AzPIFXAjigfE70lUxrxDvqAavQmujmty
	wd4DE+ab4S43Ev4tenATq7tv7DTlvOX5RkpSyDenifvqZqAPhCzdayLkUGmdnbAgYNnsKaI08gQ
	C9eB2aFStCh8/a/fVzfg2kFIZyBLmhQ2TwO9ToJJ27ChcXFYIz1jTa03Eayeftq31nhBawylkpf
	KPBxQ/2viEPdLoMJCuW1/obOKEZvrDABWWQHAmqFz/YI5xSi1kuMK9H/BES7dvQbNn6HiFCrx27
	6XsG4VZJVDo76ZgJQ5VHznHd2ONI=
X-Google-Smtp-Source: AGHT+IH7hVHc0tlAgXxgFaCxYRaYIJQ3DQ+FY7DmQvhi6XPfShjmFssaz9Z/mtpKobWUSTQxJxN8MQ==
X-Received: by 2002:a05:6a20:e68c:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-21ad98b31f0mr31767222637.35.1748973865748;
        Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe966d4sm9999195b3a.11.2025.06.03.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:04:21 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 0/7] Setting the scene to convert the timers into
 modules
Message-ID: <aD85JdXveNWlWDn4@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_110426_782197_46A6C191 
X-CRM114-Status: GOOD (  35.78  )
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

On 06/02/2025, Daniel Lezcano wrote:
> The timer drivers are all compiled-in. The initial pre-requisite is to
> have them available as soon as possible in the boot process. While
> this statement made sense a long time ago, the platforms have today
> multiple timers for different purposes along with architected timers
> which are initialized very early. For example, a timer can be used as
> a backup timer when the local timers are belonging to a power domain
> which is shutted down, or used a watchdog timer when the counter are
> shared, or also as a pulse width modulation counter. Another use case
> is the platform user may want to switch to a timer different from the
> architected timers because they have interesting characteristics in
> the context of a dedicated platform (eg. automotive).
> 
> In some existing drivers, there is already the code to load and unload
> a timer driver even if the Kconfig does not allow that. It means, the
> need is there but partially upstream.
> 
> There were multiple attempts to configure the timer drivers into
> modules but it faced the fact that we were unsure if it is correctly
> supported by the time framework.
> 
> After investigating deeper in the core code it appears we have
> everything set for the modularization of the timer drivers.
> 
>  - When a clocksource is registered with a better rating, the current
>    clocksource is swapped with the new one. The userspace allows to
>    change the current clocksource via sysfs
> 
>  - A clocksource can be unregistered
> 
>  - When a clockevent is registered with a better rating, it becomes
>    the active one
> 
>  - A clockevent can not be unregistered
> 
> A timer driver can be loaded later because of all the supported
> above. However unloading is unsupported because a clockevent can not
> be unregistered and that will lead to a crash.
> 
> But if the timer driver has the module owner set, the core framework
> will handle the refcount correctly and will prevent to unload the
> module if a clockevent is registered. All the refcounting is working
> in different use cases.
> 
>  - A clocksource is the current clocksource, the refcount is held
> 
>  - A current clocksource is switched to another one, the refcount is
>    released
> 
>  - A broadcast timer is registered, the refcount is held
> 
>  - A local timer is registered, the refcount is held
> 
> Consequently, it is possible to unload a module which is only used as
> a clocksource. As soon as a clockevent is registered, the refcount is
> held and can not be released thus preventing the module to be
> unloaded.
> 
> That mechanism ensure it is safe to convert the different timer
> drivers into modules.
> 
> This series adds the module owner in the different driver which are
> initialized with the module_platform_driver() function and export the
> symbols for the sched_clock_register() function.
> 

Thanks Daniel for taking the time to dig into this deeper to help identify how
we can safely convert the timer drivers to modules! The series LGTM. I'll go
ahead and address the review comments on my MCT series and rebase it on top of
your patch series.

Thanks,
Will

<cut>

