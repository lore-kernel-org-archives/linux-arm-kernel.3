Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353FACF885D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 20:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BThhvF5ievsQl3XMb2cq/94HXhHJyFh3X1ZGRt9Ldys=; b=bfgr7pWr7+rqyd2YSsynJE0Tkh
	Gma09kC+9OopUR0kC5T8e/nWwi8ohs1Nv/jiGHNWB7XhnMx5Bgy4tUlYGcvRCzbHnLEtcqgOjbrm7
	sgOvcUePAcQ4vtPQgggcNKGapMc0+9VDhlLGPHS5mu9CoWqUcvVIWGYKk0AFCYeBrS5jghRAF7JhP
	u+sJBs6IUh74HxenSqdNVt6olfDZTju+WFPppOK52SP+wFOMf/QcW1Fxd7Y3yhChfcdwGNoUnaSIy
	5Pv9noUot1wlyHwfdkkHT2QBoD5pRKAJKXU98Cg03ZMSbJKBc9+f89ce1Gq9KcJ0CGl+Vo2D9uh7d
	NYMxKCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBaU-00000007MPV-2HQB;
	Thu, 20 Nov 2025 20:49:07 +0000
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMBaR-00000007MOT-0WPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 20:49:05 +0000
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:ec95:b1d9:10ea:943d])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4C59FB00535;
	Thu, 20 Nov 2025 21:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1763671736;
	bh=QKCTW//ReohcZBVlaY/hR/6GYCdQgcMLzosE3RgI0Hs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=twhSn7yFBv9qGLTnY2s92RCC2TWLLtNaMbxhv3qLARNVnkE+G5kEHxQq6Q1dnhMRG
	 ZIEnR9W9psvHteZIj30wYzw+HWQEz/J391fjkbEQL9Vi+8UoFeCicyQKZYK+qg+PP1
	 a9S2PgquCN8QgovK6AOR8x0+FBZxb2GjW/mshzNdPLiFSepUW+MnPhpcT/Az8izkET
	 EVGhukO0rHRV/txB6lz3f4aVUEgok4c1GmtIbGP/sDIbC9g34J2uasBXUCBOmaPUjR
	 lwo7uYnbTO41wtP0+kwAMY/P3RBtMcxA6lQ2p27mPNZgdKq1VhjeItR/aqEeXLEopN
	 cwv8LYklQcslQ==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,  Doug Berger
 <opendmb@gmail.com>,  Florian Fainelli <florian.fainelli@broadcom.com>,
  bcm-kernel-feedback-list@broadcom.com,  Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>,  Hoan
 Tran <hoan@os.amperecomputing.com>,  Andy Shevchenko <andy@kernel.org>,
  Daniel Palmer <daniel@thingy.jp>,  Romain Perier
 <romain.perier@gmail.com>,  Grygorii Strashko <grygorii.strashko@ti.com>,
  Santosh Shilimkar <ssantosh@kernel.org>,  Kevin Hilman
 <khilman@kernel.org>,  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
  Masami Hiramatsu <mhiramat@kernel.org>,  Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>,  Srinivas Neeli <srinivas.neeli@amd.com>,
  Michal Simek <michal.simek@amd.com>,  linux-gpio@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
In-Reply-To: <aR22decsE0DYDUnS@xhacker> (Jisheng Zhang's message of "Wed, 19
	Nov 2025 20:22:13 +0800")
References: <20251118003229.26636-1-jszhang@kernel.org>
	<20251118003229.26636-6-jszhang@kernel.org>
	<CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
	<m2ecpvm20y.fsf@free.fr> <aR22decsE0DYDUnS@xhacker>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Thu, 20 Nov 2025 21:48:30 +0100
Message-ID: <m28qg0mnvl.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_124903_609693_72A9DC02 
X-CRM114-Status: GOOD (  14.17  )
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

Jisheng Zhang <jszhang@kernel.org> writes:

> On Tue, Nov 18, 2025 at 11:03:41PM +0100, Robert Jarzmik wrote:
>
> hmm, each controller adds 16bytes, then even on 100 controller 
> platforms
> 1600bytes. 1600 Bytes/64MB ~= 0.238%. it's trival. And is there 
> such platform?
Yes, actually most of them have around 64MB, at least the pxa25x 
and pxa27x.
The pxa3xx might have more (thing 128MB, maybe 256MB).
There are very old platforms, we're in 2003/2004 there ...

> From another side, recently UP support is removed from the core 
> sched,
> that removing adds more .text and .data overhead, so if the 
> users really
> care about this kind of 16bytes, it means he(she) can't afford 
> even the
> 16Bytes overhead, then I bet he(she) the always SMP in core 
> sched, so
> why not stick with the old kernel? What do you think?
I think I would go with Andy's proposal, decouple the changes :
 - keep your changes in the PM callbaks
 - remove your change (put back the ifdef) in the data structure

Cheers.

--
Robert

