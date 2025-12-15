Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BE9D5B854
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjdAh91N38JTTN3WcUdzvziMIhuBPgDj6HNd+K1rqpo=; b=sTy95w2hyRvBCQ6Y2RvSQxR4D/
	h1GaHGvV7WM3SNRQu2jwHQCB++jIbbpB5M4wE5S5MutRib25cjzf2xW/dPMdJhxpNFPkDJQYrlQ2/
	oaodJaHk8eI+5NdQRlk8Y8lG/b0xUGonppIkavmZU67OkHLH/U/rHuqiPUC4qMcj4H/L60E7jRibj
	/LIOE+2g+pJjw0RmqlHil2uFERvRGOHh8Q6DICEEcY51u4X+rJImoF3YI4dlI/PsNjojEsCG+alp1
	uZ3TzN9Au9KvlpFyLH7iHtXx8kp0H8w50yd0X/1LYT3L+M+r9bxxNRAQRwVYLR44BQxUCJKlzWkW2
	lXQuqFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBlG-000000041J2-3pKv;
	Mon, 15 Dec 2025 16:49:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBlE-000000041IZ-3TaL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:49:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C40E7FEC;
	Mon, 15 Dec 2025 08:49:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C76F3F694;
	Mon, 15 Dec 2025 08:49:22 -0800 (PST)
Date: Mon, 15 Dec 2025 16:49:20 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: James Clark <james.clark@linaro.org>, Joel May <joel-linux@jmay.us>,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Linux perf Profiling <linux-perf-users@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Message-ID: <20251215164920.GD681384@e132581.arm.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
 <0076b248-9b23-408d-9448-701df3c8d952@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0076b248-9b23-408d-9448-701df3c8d952@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_084924_903559_6A083D13 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, Dec 15, 2025 at 01:22:04PM +0100, Arnd Bergmann wrote:

[...]

> Ah, I see now that arc/hexagon/loongarch/riscv just use an old
> copy of the header based on the and no longer update them. I only
> saw that they have the stub version but hadn't realized that they
> never updated past the point where we started generating the
> ones for the uapi.
> 
> Still, I would suggest using the same method across all architectures:
> either we figure out how to use the generated headers on all of them
> (including x86, which uses yet another method)

Switching to generated unistd.h headers would require removing
tools/include/uapi/asm-generic/unistd.h and generating unistd_64/32.h
on the fly, while still keeping arch's stub headers under
tools/arch/${arch}/include/uapi/asm/.

As discussed in [1], I would prefer to drop these headers, but Ian
noted that this could break builds with older toolchains.  We keep the
tools/ copies of unistd.h because tools need the latest syscall
numbers; relying on outdated toolchain headers can lead to build
failures or incorrect behavior (e.g., perf falling back to predefined
but wrong syscall numbers).

One idea is to install kernel headers first and then build tools, e,g.:

   cd linux
   export CROSS_COMPILE=aarch64-linux-gnu-
   make ARCH=arm64 headers_install O=$OUT
   make ARCH=arm64 O=$OUT -C tools/perf

Generating the headers dynamically would avoid maintaining duplicated
copies under tools/ and no need for periodic syncs.  However, this is a
quite big effort, not just perf, we need to update makefiles to the path
of the installed headers.  I'd like to hear opinions from tools
(perf/bpf/selftest) maintainers before proceeding.

> or we just stick with
> the old asm-generic/unistd.h copy and use that on arm64 as well.

I will proceed this way for now.  From a maintenance view, it is a
pragmatic solution that only requires reverting a few patches and does
not introduce any new code.

Thanks for your suggestion!

Leo

[1] https://lore.kernel.org/linux-perf-users/20251209104926.GS724103@e132581.arm.com/

