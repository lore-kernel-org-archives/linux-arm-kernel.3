Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED18D5E146
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqrKpPBYw5wpF0Dodsy2Se7XrTTqVI3LQhOdZ9MeH9Q=; b=KgiRcWGAJAHqXCIV0I5skToF0N
	LmwYl2peEla9lO3DF/hrwK21mWoSXVzVlI4E87W0mbQNdv+0XZx4ZPGY+vWOjBswFAL1h30EWkLDR
	poeW6kg646lg++aydjojIxX8/aCHmuqIWf+nSbYQreu57IR4PwiKUyW1H8OzHMyfUvUlEOZKHJuAl
	MNMlh0P+uhBZhxSFdCiGi3Q5sUOL0x0L+82z5i/YtV2aEgy1ZCqBml0i2a61cDX/QoaFQpxfPpB5T
	vhx1huqWbDHDbuNwVUs8cD0dbf18vnVpjcYH7lcaVQtchHjt+MzkRJQz9IGbUJxmrO6uPd8tfur/A
	a6d1pPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTnZ-00000005ABS-20RY;
	Tue, 16 Dec 2025 12:05:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTnX-00000005AAP-1QMR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 12:05:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97BD7FEC;
	Tue, 16 Dec 2025 04:04:47 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DEE43F694;
	Tue, 16 Dec 2025 04:04:54 -0800 (PST)
Date: Tue, 16 Dec 2025 12:04:52 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: James Clark <james.clark@linaro.org>, Joel May <joel-linux@jmay.us>,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Linux perf Profiling <linux-perf-users@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH] arm64: perf: fix syscalltbl path base
Message-ID: <20251216120452.GA912180@e132581.arm.com>
References: <b2651f20-6f3a-49f5-9cd8-3fb028b2cab5@app.fastmail.com>
 <fcefc3c0-541d-40cc-84e3-9c2460308bdb@linaro.org>
 <23c07ac4-ff13-47a5-824a-e7af1d1847a3@app.fastmail.com>
 <bda366b4-fa53-4feb-a7ce-ee47cfc404b5@linaro.org>
 <20251215112818.GB681384@e132581.arm.com>
 <0076b248-9b23-408d-9448-701df3c8d952@app.fastmail.com>
 <20251215164920.GD681384@e132581.arm.com>
 <67bafe7d-6761-4b1c-8742-628513e7e8bd@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67bafe7d-6761-4b1c-8742-628513e7e8bd@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_040459_440798_3933224E 
X-CRM114-Status: GOOD (  22.68  )
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

On Tue, Dec 16, 2025 at 08:17:51AM +0100, Arnd Bergmann wrote:

[...]

> I didn't find the reference to breaking, do you just mean it
> would break when falling back to a header provided by the
> toolchain's own asm/unistd.h, or a problem with the modern
> generated version that is solved by using the old asm-generic
> file?

Sorry for confusion.  I mean build breakage caused by using
toolchain's own asm/unistd.h.

> I would also point out that s390 no longer needs a custom script
> as of 6.19, since the last incompatibility between the s390 format
> and the x86 format of the tbl files got resolved with the removal
> of the s390 compat mode.

Thanks for the info.  I saw 4ac286c4a8d9 ("s390/syscalls: Switch to
generic system call table generation") for the s390 consolidation.

To be clear, Perf makefile now only uses
tools/perf/arch/*/entry/syscalls/syscall*.tbl to create syscall arrays
for tracing (e.g., print beauty string for syscall trace).

The dilemma is that the *.tbl files are in ./tools/perf, if we generate
unistd_64/32.h headers are not visible to other programs under ./tools.

> >> or we just stick with
> >> the old asm-generic/unistd.h copy and use that on arm64 as well.
> >
> > I will proceed this way for now.  From a maintenance view, it is a
> > pragmatic solution that only requires reverting a few patches and does
> > not introduce any new code.
> 
> Note that if we ever need to update the
> tools/include/uapi/asm-generic/unistd.h file for new syscalls,
> that will get harder in the future once we remove the
> kernel's own include/uapi/asm-generic/unistd.h. I'm sorry
> I never sent that fix after the previous cleanup that introduced
> the common script.

I agree this is a potential risk if we stick to static headers.

Thanks,
Leo

