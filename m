Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7918D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGqoFSDWLOV8851mhEU1eX7X6R0vyVbI0a4sg15Ylrs=; b=V0i/SKRG7jfP4WPk7mMjltnL26
	Hhg07jLv0wr/3TAaDmKcr8VlcRRQ7wDpDIlHEs6mikejpIoWyi3TK//l3XJxNB9tLtdmbYBdDNl6w
	OKlTid58DC4YgXklMH1tdEJA/Pt1OmyTTnYjiIXyY8SPky+y8vQZ2cYNM+0B6cEh54zu+qbT6U85C
	CKozcPlCm0KIzPkBgbU8R0yb+p+MUFI2YMn0MIxULVNdZ2HftffsqgTKt8UVd2Sp3CSrbKX0xZOeq
	GO8QaOdgg9igxbKrOsJBLax0xsH4JFIoDNKTYzIcMaopTaIRHrYQsk/DPX+ViuxMTJrNL+3eX8NAC
	swc6uvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6kd-00000003WVz-2JSQ;
	Mon, 15 Dec 2025 11:28:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6kZ-00000003WVe-1v2M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:28:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAB81497;
	Mon, 15 Dec 2025 03:28:13 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FA853F73B;
	Mon, 15 Dec 2025 03:28:20 -0800 (PST)
Date: Mon, 15 Dec 2025 11:28:18 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Joel May <joel-linux@jmay.us>,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Linux perf Profiling <linux-perf-users@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Message-ID: <20251215112818.GB681384@e132581.arm.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_032824_292933_A4A2E1A0 
X-CRM114-Status: GOOD (  34.47  )
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

On Mon, Dec 15, 2025 at 12:52:24PM +0200, James Clark wrote:

[...]

> On 15/12/2025 11:33, Arnd Bergmann wrote:
> > On Mon, Dec 15, 2025, at 09:47, James Clark wrote:
> > > On 15/12/2025 00:12, Joel May wrote:
> > > 
> > > Hi Joel,
> > > 
> > > There is a similar fix on the list here:
> > > 
> > > https://lore.kernel.org/linux-perf-users/20251204-perf_fix_syscall_header-v1-1-b8e27f74ed6a@arm.com/
> > > 
> > > I'm not sure if commit 1 alone will also fix your issue, or we'd need to
> > > collapse both of the commits in that set.

We need to apply both patches in the share link - we need to apply the
second patch to revert generating unistd_64.h in libperf.

> > > The first commit has an older fixes: tag and also fixes some other
> > > issues so it might be better to take that one rather than this one.
> > 
> > I don't understand that other "fix", doesn't that just work around
> > the arm64 build issue by adding another special case for arm64?
> > 
> > If we want the tools directory to have a copy of the generated unistd.h
> > files instead of generating them, it should at the minimum be done
> > the same across all architectures.
> 
> I don't think it's a special case, the other architectures already have a
> copy of their syscall headers in tools/ don't they?

Correct.  Most of architectures simply include

    tools/include/uapi/asm-generic/unistd.h

x86 includes their own unistd_32/64.h; only arm64 attempted to generate
unistd_64.h dynamically, but this is problem for build dependency - when
build perf, feature tests in tools/build/feature/ run before libperf and
fail if unistd_64.h has not yet been generated by libperf Makefile.

> My original commit that is reverted by Leo's patches is more of a "fix" than
> his fix. It turned out that running the generator script for the Perf build
> wasn't the best idea after all. Now it's obvious that we'd have to keep
> injecting that build rule into every tool that needs it. And it doesn't even
> respect this rule described here that tools headers should be decoupled from
> the kernel sources:
> 
>  linux/tools/include/uapi/README
> 
> I don't see the benefit of manually copying over the generator script and
> its input file and then updating every build rule to invoke it when we can
> manually copy over the output of that script and not have to do anything
> else.
> 
> Ian makes the point that we can run the generator for doing
> check_headers.sh. But at least that only needs to be done for one tool and
> can be in addition to the manual copy.
> 
> James

