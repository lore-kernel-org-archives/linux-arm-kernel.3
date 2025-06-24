Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UddDk769ZKsmK2aQWqIF88uQfyivetng7RpNIF5HC8U=; b=etTLKzhxyCy4yu1GubpssiLJDS
	Wc/WuV0D13mVGhK238jurEluHZYz2i1jF/hAZllh4MglPAzJsWuJW4NJpAnjR3WAuiZF3AEM3BbSK
	s0P9iZDeYnXSJq4wUUuGT6N0guA+F4kKS4mM2u7wsJekkvSlSi/Rp04hld2Jj1sCrCHVTPh+j4yzj
	xkekcskep+6jiJCVCjjn12BsArlSxBS5n3YRuRQNkJimFP3GrmOsWmkq/wOdrVhoXYTb0xFHPzGgm
	RTjtMWsAucZ9FmepviaSvFxpkkWsdlyKN9UlG9LcDuhxCF6rNAsFVdsBqoJZnlU9CLAiETkWToNS9
	fy6nt0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9j7-00000006fHz-1IPz;
	Tue, 24 Jun 2025 19:54:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5y0-00000006CRN-1q8l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F6EDA51E94;
	Tue, 24 Jun 2025 15:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCA4C4CEE3;
	Tue, 24 Jun 2025 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750780427;
	bh=5gIuZaIyM0SgNtIvnnpKjpM1YltAyHByEE6D09stErU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMzZ2gJG0TMEGpMVxiZHeLdfiXSAJ+T3/T4x4bgZPBc9wtt2C3vBJZPx7RUO7pzV7
	 lD1VDfRASF6KaK7Ww3fKSeaTkws+AN8Mzz8FMLUOawupf+ELUiRAimpcF0vDk8mbXP
	 IT2Dpmqp/nyuQzLRfPWyJoODLt0LUIFydHyeIgh7EQz3onJNCtYU1NVsLwBA+lMiIC
	 3I1D6u/4aXIIzafWyePJlp1uBqE6C21sn79PgMfrG5DZtfAQVTAYUfx1EwPkUWAb9J
	 0lYpVqNzO1TQycN+lcjutyS5WcGz8+JUjiIwEzBUNzXdOGud8oNexRNPY5l/c6a9mC
	 IdwDZTxK4Twug==
Date: Tue, 24 Jun 2025 16:53:40 +0100
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Reichel <sre@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 05/10] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <20250624155340.GL795775@google.com>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
 <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>
 <20250619114958.GJ587864@google.com>
 <f30406ae-90ed-4f81-9519-e6ae2dcc9e03@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f30406ae-90ed-4f81-9519-e6ae2dcc9e03@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_085348_610327_A9BA6D6B 
X-CRM114-Status: GOOD (  22.16  )
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

On Sat, 21 Jun 2025, Sven Peter wrote:

> On 19.06.25 13:49, Lee Jones wrote:
> > On Tue, 10 Jun 2025, Sven Peter wrote:
> > 
> > > The System Management Controller (SMC) on Apple Silicon machines is a
> > > piece of hardware that exposes various functionalities such as
> > > temperature sensors, voltage/power meters, shutdown/reboot handling,
> > > GPIOs and more.
> > > 
> > > Communication happens via a shared mailbox using the RTKit protocol
> > > which is also used for other co-processors. The SMC protocol then allows
> > > reading and writing many different keys which implement the various
> > > features. The MFD core device handles this protocol and exposes it
> > > to the sub-devices.
> > > 
> > > Some of the sub-devices are potentially also useful on pre-M1 Apple
> > > machines and support for SMCs on these machines can be added at a later
> > > time.
> > > 
> > > Co-developed-by: Hector Martin <marcan@marcan.st>
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Sven Peter <sven@kernel.org>
> > > ---
> > >   MAINTAINERS                |   2 +
> > >   drivers/mfd/Kconfig        |  18 ++
> > >   drivers/mfd/Makefile       |   1 +
> > >   drivers/mfd/macsmc.c       | 498 +++++++++++++++++++++++++++++++++++++++++++++
> > >   include/linux/mfd/macsmc.h | 279 +++++++++++++++++++++++++
> > >   5 files changed, 798 insertions(+)
> > 
> > This is ready.  Let me know when you have all of the other driver/* Acks.
> > 
> 
> They've all been reviewed by the respective maintainers.
> 
> I assume you want to take this all through the mfd tree and we'll need acks
> from Sebastian for power/reset and either Linus or Bartosz for gpio then.

That's right.

> The one line change inside drivers/soc/apple would usually go through my
> tree and I'm fine with taking that through mfd instead.

If there are no build-time dependencies on it, you can take it.

I'm happy to take only the inter-dep ones or all (except the arch/ ones).

-- 
Lee Jones [李琼斯]

