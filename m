Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC43C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUlWML/fsXetNwxqvoOqkD0pz1cXL+R3ZbMDWiTp+MA=; b=Q21WwaMk78/d+rvG0dSrdxOkNU
	e3//irDxA3pgTsL9lxCwZpaqn3Hi7b4Tpj/RXhzkKa3P3DUGy754cmaxQEsv7fj1MesN+24U4J9bK
	BNPjht9OgzOUb3sIXvcAArArNx88EOCVzJxs+QWVAva6npSHE36dwCu1mmtjveLcJ0zPWmL1u+5oN
	9XSP0IG7hyR9Wz6L1Mln58KfrfETEWf1UjFjpuG69csFkb+ku1V+2tP3QEAd+ogLfqZ228PJbCsru
	ffRFA8DV9Eslpyoe4wwOXe6jqfgzeL3+EjM5ERDDcejSS6u5+SV3qgpep0KgCaF41oZWbFnH6zll8
	2ON7ePow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mrB-0000000A7i3-3k4G;
	Tue, 29 Apr 2025 15:26:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mV7-0000000A3Nm-2kmQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:04:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E05761567;
	Tue, 29 Apr 2025 15:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8E5C4CEE3;
	Tue, 29 Apr 2025 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745939040;
	bh=07G9Y0+nqlY03fvr8srBQeJEfqq0mWj7H4qgzsSSMC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2RSriF1PYemUlOEM4eytLR7EQokiggwNpQWL0brlA0py7t88h57IFIcL3nc5JPlr
	 zCEIvgdOJeWphGywZ/RdE3vyNdiDgxakgkRvo8c5nD9A+l8FFq94QHjjT6CL3E7iQD
	 +098om27DJSagNnfegkQWkf90HjK3jV2dh7n9xJvapwQSzFEtyQuLE3O+aKosQPIzQ
	 PWsy1RFZv3tZbkoSWBEeBtLsfLMRcnP+abFPekl8OrQKHAU9m66tMiwhjoC1X6b8EX
	 KL2W+7To5tAf31adc5+48VNfVCFm1h1z3tMqjdEWqeuGGTOIegkqrdycZSIQPOmxaN
	 u4KpDbEcNoCrw==
Date: Tue, 29 Apr 2025 16:03:54 +0100
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: tglx@linutronix.de, ruanjinjie@huawei.com, catalin.marinas@arm.com,
	oleg@redhat.com, sstabellini@kernel.org, peterz@infradead.org,
	luto@kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
	paulmck@kernel.org, mingo@redhat.com, dietmar.eggemann@arm.com,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	joey.gouly@arm.com, kevin.brodsky@arm.com, dave.martin@arm.com
Subject: Re: [PATCH -next v6 1/8] entry: Split generic entry into generic
 exception and syscall entry
Message-ID: <20250429150353.GA26272@willie-the-truck>
References: <20250213130007.1418890-2-ruanjinjie@huawei.com>
 <20250320142612.396250-1-linus.walleij@linaro.org>
 <CACRpkdZKaUtnv0HfTci1-_WekNkmJyNA3znx7cUgJW5NNDAYVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZKaUtnv0HfTci1-_WekNkmJyNA3znx7cUgJW5NNDAYVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Apr 28, 2025 at 04:46:02PM +0200, Linus Walleij wrote:
> Hi Thomas,
> 
> On Thu, Mar 20, 2025 at 3:26 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > > Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> > > entry logic and the generic syscall entry logic, which are otherwise
> > > loosely coupled.
> > >
> > > Introduce separate config options for these so that archtiectures can
> > > select the two independently. This will make it easier for
> > > architectures to migrate to generic entry code.
> > >
> > > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >
> > If the generic entry maintainer (hi Thomas) thinks this patch is
> > OK it would be nice to have it applied because it will also make
> > the ARM32 transition to generic entry easier as we can work on
> > exception and syscall entry each in isolation.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Do you think this patch is something you could queue on some
> tip branch for v6.16?
> 
> I don't know if either arm64 or arm32 is going anywhere with
> generic entry for v6.16, but having this in-tree makes it easier
> to split the task going forward. We can always pull it into some
> branch or just wait for v6.16-rc1 to get this patch under our
> patch stacks.

Agreed, having the core part merged would be really helpful if possible.

Cheers,

Will

