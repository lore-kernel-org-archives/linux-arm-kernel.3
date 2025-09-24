Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B1ACAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra9h0pKy9hrfzn/xULq5J28p+78Z8nIxSntYx3sf93M=; b=aSy1dxUjigJjIHnosi98e346xD
	FnxHxQjFbcjWRzQgWLfiZ1+s6FOAPjOqM7XvTeakCLpuP2vlnuMiiHHOe04rgeOXGR9uAFqacle95
	Gj8YzZGTXJsFP4fCO2uPueSfUFaLsdw1rf1GeZOgNyNhxJhwHcsWKAJAJrya0iZw4FZc66UWvci50
	HQy70eEFxn39qEYd/Bz1B9uRc6UyUZxZ/aHqbO5vPzusK6HZwQkP5cG8oYWAnWjxP8S74eELJGbxI
	84ZjPp3O1+gY+67Z3kQlLcAUw/B8PZHDyOvzmMxpuMn+0C9cbxTa54uf7nkJ0h1OW8fLs2qRCGpB1
	eqzIkw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1T7l-000000023ux-2YjR;
	Wed, 24 Sep 2025 17:17:49 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1T7h-000000023q8-3zc7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 17:17:47 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77f22902b46so86830b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758734264; x=1759339064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra9h0pKy9hrfzn/xULq5J28p+78Z8nIxSntYx3sf93M=;
        b=BE5jrEV9oege7qddyXTu7LmTdBSe+ZXahF9XQnKE+2NCBeLPY+I+SxH/+bowtiopwI
         4s6aHGHwq5lw6321KxT4Wmy88GJZFP7o9Y4PMupeKurjYk58OQG7qUgratruE3m2Ohk9
         u4CcX81UcuBv3EG4elS7fwwmhxS0Sw9lDGRmspSrTPD78FxM05eF77jOaW1X7hXsZ68I
         /IXV7OFHiK1+WgjInVSTNmCdf7lMJeQtqimdWWX/OlcFPdohSVzF/hbxVWtHy/wePr/n
         F+hxpmzJ9BColkuPgvBbEF66ndni1hM5J8ZYMhTmotS6es8wpfgkoMvSwJgkp/69bWqM
         9jDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758734264; x=1759339064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra9h0pKy9hrfzn/xULq5J28p+78Z8nIxSntYx3sf93M=;
        b=OVHXMqp7ZCgy1b1dNdkVjcpZ8R1b1yngSJgPawXzkcDemn3VSgIRWi19VugfnSnQmN
         DcZ4FGuyRR0FeWzHrVQOOepwjwViHwop9CJ1rw1FBBU+Qk32FgGWEEqOyUdXltQhMAjF
         ELzwlObylY2uDrCAVrqOIARFn9VNOhVmiGP0IgbVgyV2Gka33dgtUC26atTTcZuyd51a
         ElLOa72POkhD9w4zZ3LXg+/QgXeqI6kpjvzueDs7WuWBEcKk71ecfxXdNoYeDttOpqKJ
         rtk8O34MxnNXAUfKD+6Sd8qGE/e/p4FlZpK+IepBs2Wzzgq8+O9f4X69Oik/eOnyg0me
         xxrg==
X-Forwarded-Encrypted: i=1; AJvYcCWMnmU2muAqCrcD1mc86nWHbi1Sz7QVSETJH1VqvTZKo9GRLBMy7cgbiywQgph/l8bh3OZhYId5Izqo/OZ2NnDv@lists.infradead.org
X-Gm-Message-State: AOJu0YyHja7mI/8/vK/NJ8wL1lGht8F3Ypu0PfhXX2wpXqwcpehSSXoU
	RDgjn6Ego7mzRGTHIFGcfy0k9/VD08jKAgVgKl2zF/AdQSDhMv28spqyHs/fSp17ZA==
X-Gm-Gg: ASbGnctO2Z7c5tOKtkkhWcxEFz8EwWFSQQffJX7q2NxABW7aJDcyY8Q6OuH1KHpeCYz
	ooy5pRP/wye1/wXICXXmsXdwev5bmUX8kaM9eENdYkhZlAqUu4K48yGvEH4w9UcCpW+IA6+8F7C
	mqfkuM3VMmEPNkm6LF8sETazC9D7D16PYessqQAHV9S/QAYKj+Vd5hsjpjOfby1t1SOjcEARZ+A
	KRkgFRr7g5fh0x28faQ+Cv4VR+U11V/aAeD4pW08+p86vVgz6Lan58Enyih8jfC/qoheII8/pm3
	jHRhXzyFpJ0OK3CTB8qcYv98QjdoWaMkkUOLbuwu72p0KKgiUY8LJnclNlWAO+APX7ddjOvb7sX
	0mgc3bbPGnDKhgmo7u/vVG66FhCE4PcC4syZlx43CORUn9JnIRP9kOn9WRUFZFtwRLROcEg==
X-Google-Smtp-Source: AGHT+IECcRUUOXZw8N72wAdSdn4wRjBNkobfFLE0UHBTkp1YQV+wUXCx2YiosQc5CaxumRtZ4E56yA==
X-Received: by 2002:a05:6a20:258f:b0:2d3:f411:a970 with SMTP id adf61e73a8af0-2e7d3eaa484mr412304637.41.1758734264070;
        Wed, 24 Sep 2025 10:17:44 -0700 (PDT)
Received: from google.com (83.117.83.34.bc.googleusercontent.com. [34.83.117.83])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dbc8e7cc4sm17407079b3a.29.2025.09.24.10.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 10:17:43 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:17:39 +0000
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
Message-ID: <aNQnszeIfeHjx3GS@google.com>
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
 <20250827102645.1964659-1-m.szyprowski@samsung.com>
 <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
 <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
 <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_101746_012925_92F3C8F7 
X-CRM114-Status: GOOD (  23.18  )
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

Hi Daniel,

On 09/24/2025, Daniel Lezcano wrote:
> 
> Hi Marek,
> 
> On 19/09/2025 23:31, Marek Szyprowski wrote:
> > On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
> > > On 27/08/2025 12:26, Marek Szyprowski wrote:
> > > > For some unknown reasons forcing percpu interrupts for local timers
> > > > breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
> > > > machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
> > > > flag only when driver is compiled for newer ARM64 architecture.
> > > > 
> > > > Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
> > > 
> > > I am pretty sure the patch above was not tested on arm32, thus this
> > > workaround seems reasonable.
> > > 
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Daniel, any chance to get this merged?
> 
> The patch does not apply. However it is not your fault but a glitch in the
> previous pull request and the regression found in the Exynos MCT.
> 
> Apparently, Thomas had to drop the entire pull request while I thought he
> dropped only Will's changes.
> 
> A pull request with the previous changes for v6.17-rc1 and with the new
> changes for v6.18-rc1 is about to be emitted but without the Exynos MCT
> changes for the modularization. That means your change does not apply
> correctly anymore on the current changes.

Is there somewhere I can check to see which changes will be re-sent? I don't
see them in the timers/drivers/next branch. Will it be patches 2-4 plus the
fixes for the section mismatch and this new IRQ fix? Once that's all sorted
out, I'll base the new modularization patches on top of that.

Thanks,
Will

