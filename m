Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D648E67497
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGZqRzRvnoLs/W1Vfmx2ZUUw4BIY94JQTxY8xpWG0qk=; b=rG6wQ5XcQNAdM5UPA+J64dC/BM
	L7rHsA71kcWx2pqLJ5fD99CvRwXaemDT/2YfJfMAcA5KzOeu7dJ1REO5Zap2Zc/dD3XeP/qE+Bg9P
	99Ey4iHaadgy5EU0xxbZpDL50pJoJtd+Y4KKIcFGRCyKcVJaSM8N66PYnC2c6cVxSDkCccSDnR3fH
	id64zFdN66QVruhhtfk+jFhETUU+xtNu9tRvxmVRBdUY2GgMazg3SmHFd2ryCQu67lDE42WhgY2qb
	F99fdh6OqdGVWDRdPSP6vKZWyheoDGG912C+kdRqbjTY9y7LtQYl/X3DysyEHYGqDryY+FyJevVls
	JG3SbVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjq8-0000000E1fV-1Qum;
	Mon, 22 Dec 2025 17:37:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjq5-0000000E1f8-3UGP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 17:36:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6376C497;
	Mon, 22 Dec 2025 09:36:48 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FC763F694;
	Mon, 22 Dec 2025 09:36:54 -0800 (PST)
Date: Mon, 22 Dec 2025 17:36:53 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: James Clark <james.clark@linaro.org>, Joel May <joel-linux@jmay.us>,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Linux perf Profiling <linux-perf-users@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Message-ID: <20251222173653.GF9788@e132581.arm.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
 <c8161700-ad9d-43d3-8c45-cfc110ebcd49@app.fastmail.com>
 <a5448524-a147-4edb-9359-bcee3d780eb6@linaro.org>
 <ce4e1210-94c2-4664-885b-e39106905e21@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce4e1210-94c2-4664-885b-e39106905e21@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_093657_917681_D8F1E20D 
X-CRM114-Status: GOOD (  23.47  )
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

On Mon, Dec 22, 2025 at 11:42:49AM +0100, Arnd Bergmann wrote:
> On Mon, Dec 22, 2025, at 11:05, James Clark wrote:
> > On 21/12/2025 9:48 pm, Joel May wrote:
> >> On Mon, Dec 15, 2025, at 03:28, Leo Yan wrote:
> >> 
> >> This is my first time contributing to the Linux kernel, so please bare with
> >> my ignorance.  I don't know whether it's acceptable to consider patches
> >> that conceptually improve something without an actual problem they're
> >> solving.
> >> 
> >
> > No worries, thanks for sending the fix. Yes I think it could be ok to 
> > apply your patch anyway. I just wanted to make sure we were all on the 
> > same page with both fixes fixing the same thing.
> 
> I still don't think that Leo's series is correct.

As discussed, I will respin the series to use asm-generic/unistd.h for
arm64, this is consistent with other arches.

> > You might want to drop the fixes tag though to avoid confusion if Leo's 
> > one gets accepted, because then technically it doesn't fix anything any 
> > more. Keeping Leo's fixes: tag is a bit better because it fixes 
> > additional things and targets an older commit.
> 
> Before that gets applied, someone should explain why arm64 needs
> any special treatment at all. A lot of work has gone into making
> the syscall table handling consistent across architectures, so
> whether we ship a copy of the generated header for perf, we
> generate a new copy or we rely on 'make headers_install', should
> should really be done the same way across every architecture.

I agree arm64 is not a special case.

For the long term, I think "make headers_install" is worth trying.  The
main concern is that it introduces a dependency between tool builds
and the kernel.  However, if tools/selftests need the latest kernel
features, it's natural to depend on the latest headers.

Thanks,
Leo

