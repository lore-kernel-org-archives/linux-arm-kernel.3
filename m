Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F326C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6JZFjPqT1RzNfVV3TzFIG74pIbhA09vMpjakh/h3kM=; b=B94M+OEOqgAfjUbTWcIhG1htK4
	HmFTrUys6j7aMxZJEJslIpDLJ5UaRo01h5mPckBAn9vFT7dZMpQK/4z8diEKUhr1m29fggL4K4AyU
	LSr22mm2yMyiMmDuc+lqKPY5Y6rc/ra+B0vR6zTjB7uv97huHAlt2GFvmCqRBYfmuPyh3ZW2Qklhl
	WK129dxFzWcMHTeXie+alcLrEm5uwiBACAbanzO79aD33jCNqSbWn5iXIBxoCZBrg5fuuYUZ97+uP
	galbqBGK1IR5/Aj7Kf2vh7t06Lrf7T+6bPXbde5FzbMwzdERBgRiyquXUTQItuWKGSagYjUmSLU3z
	g+A/gd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR87p-00000004Ddj-1lX0;
	Mon, 16 Jun 2025 11:35:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR768-000000044W7-3Jro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 465D44ACA5;
	Mon, 16 Jun 2025 10:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C15CC4CEEA;
	Mon, 16 Jun 2025 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750069792;
	bh=qCjn4b3dsxaZ0m4CPz/s3LvG4e9wRnwEuVYtfzCD6X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjMUBDw+/Ua2rbyhJ54OcZlayTfHW5nD/Vam8begoOIVspIuvQJ/613VosV+A9Tac
	 WmtrssHkU1lDpRU3M3Y/ORM5fAObZ+0g6Pz/dIBH59L9G8PGAqC4rCMkxx4Ku+BA5J
	 EtPvpkDnhEWzRcIaqrrW503SyWf+84eLrIHP6yvVbFGJZp9udfRNSX3jOSmJm7sy04
	 K4V4c1p6LxNnI0leyQqrZqPi4Z6sZ0MnrrkPZb+i0vJA2noWvfayvLK+Haa8sAwSHI
	 impnIP+dCQkSbCOIg0NuPpa9DtiCJDIMVtc6Us32PMfVhs9fVwJfpJ93dBZe9Ne/pB
	 gI60azjGBU7aA==
Date: Mon, 16 Jun 2025 11:29:45 +0100
From: Will Deacon <will@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Nick Chan <towinchenmi@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple
 A7-A11, T2 SoC support
Message-ID: <20250616102945.GA17431@willie-the-truck>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_032952_848639_B4A6182E 
X-CRM114-Status: GOOD (  20.88  )
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

On Mon, Jun 16, 2025 at 02:36:18AM -0700, Ian Rogers wrote:
> On Sun, Jun 15, 2025 at 6:32 PM Nick Chan <towinchenmi@gmail.com> wrote:
> >
> > This series adds support for the CPU PMU in the older Apple A7-A11, T2
> > SoCs. These PMUs may have a different event layout, less counters, or
> > deliver their interrupts via IRQ instead of a FIQ. Since some of those
> > older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> > be enabled by the driver where applicable.
> >
> > Patch 1 adds the DT bindings.
> > Patch 2-7 prepares the driver to allow adding support for those
> > older SoCs.
> > Patch 8-12 adds support for the older SoCs.
> > Patch 13-21 are the DT changes.
> >
> > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> 
> Hi Nick,
> 
> This is substantial work and it looks good to me. Do you know why
> there's been little progress on landing these patches? Buggy Apple ARM
> PMU support in the kernel has led to reworking the perf tool. It seems
> best that we can have the best drivers possible.

You reworked the perf tool to support these things? Why? These changes
are targetting chips in old iPhones afaict (as opposed to "Apple Silicon").
I think that (a) most people don't particularly care about them and (b)
they're not fully supported _anyway_ because of crazy stuff like [1].

Will

[1] https://lore.kernel.org/r/20240909091425.16258-1-towinchenmi@gmail.com

