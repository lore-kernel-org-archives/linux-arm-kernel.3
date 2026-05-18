Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1C1CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lATa/r0ZFjw8qqV79/ZQNsUYTNfLU6ueO04eOm44xtk=; b=0tD3KM6fWJSQKMow/Xc3MUbSgD
	PGHcuGXGPsiBvbFGvA9xz3xWWMzj/z8pZQsiuoJUylc09dhZPPmi2DN8tZGA9UxPfLtun3D4pnd8o
	lPrKXB63uiLVGlgsh4p9rYNKcBNDkj/iFgX74lcrXfUGQFalb+tPBJzxQRvdnaSSSpF4rgE8PugU6
	CyNC+NzWPR2T4kbb6QiAGRCV37OlHO1FXcuK/JOZx/1d99KV7hyN7NWHWfDMJU/+pAv5mLO/gLMHP
	3FkuH3eFGe35Ji/Q03rCXcmdFLGIMjGpkLUzQPXX/xhU56lcThZejDNkfBc2Z6CreCw/O1NPmV2di
	2Ua7CBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzXx-0000000G6Rn-2AYK;
	Mon, 18 May 2026 15:06:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzXw-0000000G6RO-0KCg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61E2E60120;
	Mon, 18 May 2026 15:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00FDC2BCB8;
	Mon, 18 May 2026 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116779;
	bh=lATa/r0ZFjw8qqV79/ZQNsUYTNfLU6ueO04eOm44xtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDSQU9Ik86VcwMW+OHuD9X8bUcZFMKMi5POlmSn6wCAMje+cG2xN9F5ScxYbZ44Wz
	 IFSgolBsUDPX5yCAVN4Se9swKebpvd/NiVca7o8l8Ru8zBQm3lGzeTrDvhl9HEHIil
	 VvznJgGdhRxmZIclUhXK9+bk1u+8EJO8A9rs3SHaKyaW7qNV/hMp9ufWvBtxT9NxOx
	 djFk5yVSGOaKK2yhfahm434KPsSj44fYqB5YmENPlsA5Ab2WhGF8ilxVvKfiFE7cNH
	 aLFKwscgEhqU6fenL2wkSK3V2ILiu+3H7S+ug519nIDIEpnLHgdxW1G6h3uhyO0Ks6
	 TLr9QYkQuPAeA==
Date: Mon, 18 May 2026 16:06:11 +0100
From: Will Deacon <will@kernel.org>
To: Fredrik Markstrom <fredrik.markstrom@est.tech>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Santosh Shilimkar <santosh.shilimkar@ti.com>,
	Olof Johansson <olof@lixom.net>, Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>,
	Ivar Holmqvist <ivar.holmqvist@est.tech>,
	Malin Jonsson <malin.jonsson@est.tech>
Subject: Re: [PATCH v2 0/3] arm64: perf: Skip device memory during user
 callchain unwinding
Message-ID: <agsq4wZMGth-T3BG@willie-the-truck>
References: <20260430-master-with-pfix-v3-v2-0-bd526ec04a75@est.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-master-with-pfix-v3-v2-0-bd526ec04a75@est.tech>
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

On Thu, Apr 30, 2026 at 12:55:12PM +0200, Fredrik Markstrom wrote:
> Perf callchain unwinding follows userspace frame pointers via
> copy_from_user. A corrupted or malicious frame pointer can point
> into device I/O memory mapped into the process (e.g. via UIO or
> /dev/mem), causing the kernel to read from MMIO regions in PMU
> interrupt context. Such reads can have side effects on hardware
> (clearing status registers, advancing FIFOs, triggering DMA) and
> on arm64 can produce a synchronous external abort that panics the
> kernel.

Hmm, but why is unwinding special in this case? If userspace has access
to sensitive MMIO/device mappings, it can presumably pass them to
syscalls and trigger crashes all over the place?

Will

