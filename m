Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1E4F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 22:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsBgxeKjwcEzvtbeTaz72ARqj2+5utUw1UnaJUIRhqY=; b=pLt6NvkUow+tdaVU7JH0J2uGeb
	XIJYyJUL6Ya+42rsJ6YxEOxqtr0p4mdQoJr1raui51ygZOgKhQVBBJBZ9iXZGwXMtV2b0SWox9pVg
	h9KR0OAfTA0j7/5skvpr0Kq6gKBfwUgRh/Gv8hPygJEFMFeQZzeL0HD7da2x398SUnraxldtIxsCn
	zWCPJKjNRuv/AINhkifd8Zh4BBJ4TAefSNZW8sbEZLYmI7qy14jNI7NnR62ybmkCk3Jp4ze3HiYmZ
	dul4pRB7AI0uweLQ3JN7TlFF/Dfskrdn25SzEtxbYAes3kCOeIAs9sEc+KFpe5fZxmFhzfvEhc/k3
	MUYJE2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJyX-0000000CqvQ-2ZXs;
	Fri, 10 Apr 2026 22:05:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJyU-0000000Cqv3-337G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 22:05:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C16340A1B;
	Fri, 10 Apr 2026 22:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86022C19421;
	Fri, 10 Apr 2026 22:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775858713;
	bh=1aGhOd3AxAlBekv6ZZLQoxDGrkSC+gUNZs2lFVEs6QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0D3VwgEfA4Gcl4ZtdmHo3hzgBxOhkzxIU8sw54XsQGU/ywFJi8DvvRb/LGXrAt7s
	 kkPcKoSPLtw3DkaWllEPRvRqUkBrUNb+27QxNcYfM757IzWqUq63gfDaDhXxyj6wbO
	 iqDxeVqBSNHUfttFeAg11OXZdV8FcduMjJT+VwKbwDAWnAQEfcl4CPH21mkkRZ7398
	 fRDA5oZ82rpDFpTS3fE2R5Q4MN35soFHSJPIeavX6MoNWkE4reDmK2kibVzID4tuRg
	 7lKbhH/uR/8NyyjiIrKWV+lKDJ03AYMqqU7miCXMRqLQYbrZ1qFFBQGAT8QXFgXATg
	 RvTo8g1ec3r+g==
Date: Fri, 10 Apr 2026 19:05:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 0/6] perf arm_spe: Dump IMPDEF events
Message-ID: <adl0FblAxDv_at28@x1>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
 <adkqSLNceF2OQuBo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adkqSLNceF2OQuBo@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_150514_830948_7692E079 
X-CRM114-Status: GOOD (  21.23  )
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

On Fri, Apr 10, 2026 at 09:50:16AM -0700, Namhyung Kim wrote:
> Hi James,
> 
> On Tue, Apr 07, 2026 at 03:05:14PM +0100, James Clark wrote:
> > In the Arm SPE raw data dump, IMPDEF events aren't printed. Add the
> > ability to add names for some known events or print the raw event number
> > for unknown events.
> > 
> > For example:
> > 
> >   $ perf report -D
> > 
> >   ... ARM SPE data: size 0xd000 bytes
> >   00000000: b0 18 c6 32 80 00 80 ff a0  PC 0xff80008032c618 el1 ns=1
> >   00000009: 64 e7 42 00 00              CONTEXT 0x42e7 el1
> >   0000000e: 00 00 00 00 00              PAD
> >   00000013: 49 00                       LD GP-REG
> >   00000015: 52 16 10               	EV RETIRED L1D-ACCESS TLB-ACCESS
> > 
> > On N1 the event line becomes:
> > 
> >   00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS LATE-PREFETCH
> > 
> > Or on other cores it becomes:
> > 
> >   00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS IMPDEF:12
> > 
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> > Changes in v2:
> > - Put MIDR in arm_spe_pkt (Leo)
> > - Use for_each_set_bit() (Leo)
> > - Use BIT_ULL() to fix 32bit builds (Ian)
> > - Don't call strtol() with NULL (Ian)
> > - Link to v1: https://lore.kernel.org/r/20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org
> 
> I'm getting this on 32-bit build.
> 
>   In file included from /linux/tools/include/linux/bitmap.h:8,                    
>                    from util/arm-spe-decoder/arm-spe-pkt-decoder.c:11:            
>   util/arm-spe-decoder/arm-spe-pkt-decoder.c: In function 'arm_spe_pkt_desc_event':
>   util/arm-spe-decoder/arm-spe-pkt-decoder.c:377:37: error: passing argument 1 of 'find_first_bit' from incompatible pointer type [-Werror=incompatible-pointer-types]
>     377 |                 for_each_set_bit(i, &payload, 64) {                      
>   /linux/tools/include/linux/bitops.h:55:38: note: in definition of macro 'for_each_set_bit'
>      55 |         for ((bit) = find_first_bit((addr), (size));            \       
>         |                                      ^~~~                               
>   In file included from /linux/tools/include/linux/bitmap.h:9:                    
>   /linux/tools/include/linux/find.h:118:51: note: expected 'const long unsigned int *' but argument is of type 'u64 *' {aka 'long long unsigned int *'}
>     118 | unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
>         |                              ~~~~~~~~~~~~~~~~~~~~~^~~~

I saw this as well.

- Arnaldo

