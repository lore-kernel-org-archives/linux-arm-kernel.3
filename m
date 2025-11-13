Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C6CD5BC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9X7iTrE54YvbjdjoY+sM5rW8UTYJ7bZtGLvp7X0Czrc=; b=dr053p4aE3r/PjH6kIPIcpfnJ6
	0EpM/WXoJE2Dj6sBTiQ17P/peQ5zv0tiIrdOEF2cjoUL7XtcuweqVTpos6b1rFmERqxGJzHoigWSh
	hwUNqN9zzI930LIldPFMKavEb/QkxkWu0jhJeAaWRKTB81zeeDqL4UwvaCL4ZsctKVl6AcZKfWvQl
	NpjDU+Qg6rmFcul1PgPUEEqYDY2OduJPO16I/BiRAzG/UGm7T9DonStsnHrbcefCK6KZIbsndAPb1
	QXEjV4hF7IoziQ8IoCY1zdNP+vEHNs2vaRWFkelP4e9kMDKcm6mcMkii6wZPs7NC47OXdeH1kU06P
	kiNGCIhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUhj-0000000AIIX-4C4u;
	Thu, 13 Nov 2025 10:37:28 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUhh-0000000AII6-44Fs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:37:27 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4504458b29eso220257b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 02:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030244; x=1763635044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9X7iTrE54YvbjdjoY+sM5rW8UTYJ7bZtGLvp7X0Czrc=;
        b=pbWEgOXu0+QxajExYsxQV0FDyXabtxk+//aLuDybjbI3ixzLx24NH8cz4Uu6QEOviY
         E198XqqGpyfnoetZYv8D6l28At51lqQTPW8Bc7t/BvKMX0DrOrLRsXxFhonWhbp/IqDH
         rSyZXvExuI0Trn/uGEoPfHEsUCmmSjevGSeNoK1u7gn9sycGz7IhnalyIS0P0jnWhCaY
         1XcMkbVcM76pWyyc3XT5tlQIiwHyqIGZ3SW2vMx6xkxrWiHzmDsabAhnCmAMniGFyiSV
         pMMDAJAfsk5I4oIlTsaczQswIuZnUI6krFgZ7UJ31uzn6FowUJ6uggH7WmJ5goy2+mfC
         D1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXrFFnCTq3fEzUME3J+t7AehTmRU0jYuEmrFSFcqjIb7RIXqhWn0ZDnxyksR1pjmNmN8wHdD5+PaxY6jmLPJQv2@lists.infradead.org
X-Gm-Message-State: AOJu0YwnfCSLxfsC//tCOuZ+3hLskvbq+bH0IHedFs4a2LKGqaZ+h0Pt
	4SedYam55yoaTCssVfrQcYUixKiiFQ4CevNAB4dDYVeWypMyOVQS8OXblOHO2Q==
X-Gm-Gg: ASbGncua/Z1ZefjtSPjKICVRtg5lvDwPT6C5fehoMe5rJUAUknAGQZw7U656qimi/0y
	QhCuaWvweaHPHvJF94vwAgTWjtpycSPWy6aN6taxPpj/FEAubjuznXugt/aOyxPpvUrq7Zk+oLk
	3AhJpfw2FqKnUXSar1EdiFBzxgL1jbhzrMwlxGkRM7ojXhe/yErce+g3RETmgsMx704cFByYtAW
	arxyqX8upNjGekPAq1489L2RXhUXhBvW0D5Umu/WLM3qrRiQnI3ZwSHdHjD335RIxtK7ywatHba
	43YHtMemYIs/CnOG0DbMyAh9/QalolloILseQ0h822eMwEqnOtc41QBTZk/CcreWyXoN99VbyI9
	Mg8ZcRdj91VcacRxVUZKujP6k/lQELBHKccWY+C2A/uQlmXU0BXJdW7P0U1C/HFARBa0YPW3gd3
	X0kxPpEGLouqGRkA==
X-Google-Smtp-Source: AGHT+IE/f6sikSSSQxq5UoFZC0KflDi2CwXhInx9Gf6bYjFg8swkwTEGM1fl7p9fobc8bv67Tx2JyQ==
X-Received: by 2002:a05:6808:c144:b0:450:10b:a53a with SMTP id 5614622812f47-450746aa372mr2852284b6e.65.1763030244344;
        Thu, 13 Nov 2025 02:37:24 -0800 (PST)
Received: from gmail.com ([2a03:2880:10ff:51::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c73a3d420fsm896950a34.30.2025.11.13.02.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:37:23 -0800 (PST)
Date: Thu, 13 Nov 2025 02:37:22 -0800
From: Breno Leitao <leitao@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>, oss@malat.biz
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	paulmck@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: arm64: pseudo NMI bootconfig question
Message-ID: <wqzhgeu5vlkeuomajvy7vf3x4gf3fsnzmczmkswvjo7xdyzzbo@6uqjqftbzgot>
References: <rs4igmsjrm6r2aio4nbe5jos3vcqk2u4bjhltjwtj2pn3cquip@kv3grgec7qrb>
 <20251113133403.308046d2df1c97ba7dcd2388@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113133403.308046d2df1c97ba7dcd2388@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_023726_015668_324BE370 
X-CRM114-Status: GOOD (  20.90  )
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

Hello Masami,

On Thu, Nov 13, 2025 at 01:34:03PM +0900, Masami Hiramatsu wrote:
> > I wanted to have pseudo NMI enabled by default in the debug kernel
> > (without relying on kernel command-line parameters), but this isn’t
> > possible today. The reason is that `irqchip.gicv3_pseudo_nmi` is an early
> > parameter, which can’t be set through bootconfig, so, independent of my
> > .config, I need to hack cmdline arguments to have the debuggability
> > I need.
> 
> Yeah, that parameter is for early architecture initialization,
> which is done before parsing bootconfig.
> 
> Can you try building kernel with:
> 
> (arm64)
> cmdline=$(cat /proc/cmdline)
> CONFIG_CMDLINE="irqchip.gicv3_pseudo_nmi=1 ${cmdline}"
> CMDLINE_FORCE=y

This option isn’t practical for my use case since I maintain a generic
debug kernel that needs to support multiple workloads and services, each
with their own kernel command line. I’d need something similar to the
old CMDLINE_EXTEND feature (which was removed some time ago), or perhaps
a mechanism like CMDLINE_PREPEND or CMDLINE_APPEND, which were never
introduced.

Another possible solution would be to load bootconfig earlier in the
boot process so that early parameters can be defined within bootconfig.
Petr suggested this approach some time back, but it doesn’t appear to
have made it upstream.

https://lore.kernel.org/all/20231123194106.08f5832f558fe806b1fd8098@kernel.org/

I’m not fully up to speed on the details of this change, so I want to
ask directly: Would Petr’s approach—allowing early parameters to be set
via bootconfig make sense from a bootconfig design perspective?

> BTW I wonder why you can not configure your bootloader to pass it.

The main issue is that changing cmdline parameters increases the
confusion for users, and updating the kernel command line isn’t simple
in a heterogeneous environment.

My objective is to provide a drop-in kernel replacement, so the user
only needs to swap the kernel binary, gaining additional debugging
capabilities without modifying anything else.

Additionally, it’s common for the same kernel version to be used across
different bootloaders, which makes distributing and installing debug
kernels even more complicated if additional changes (such as appending
configurations to the cmdline) are required.

Thanks for your help!
--breno

