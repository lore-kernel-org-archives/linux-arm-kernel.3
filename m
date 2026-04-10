Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24F1F459F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQjQsqYkkTPxyxnrSNMex01Xco2HiyveR1lAVHYiUeQ=; b=Ugiv50pSEwbzOG8b8FZlIJJLU2
	ed2nsbhXpspTG9begL0TFw7tTbbFmHG00huol2Z2Qcw2aGLH6fdu0yYkCH5X+esVTHj6F75r8Vfau
	58cl3qqZIaReXfj1nmo+sFv1kaPniKYgKdf4tRgNY/glqi9v7ZHv8qzgT3CkscJYOaKBiz4BLmmsi
	AM+BsqFJF6iG//0MYmVC6iDSHhU25rrogYcXIic6GraMkz3tGbsrTyOJv3CBLud1XmVbNC2DSU1w3
	dCcw2lbzKhkOIo7thmfL//yzv/uIjZQnt1MSOE+3TG5tyL9ajfOk6aeob6HtSL+tffT7MTfFuYOLy
	V89jE5bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF3m-0000000CZh6-1ZH6;
	Fri, 10 Apr 2026 16:50:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF3l-0000000CZgu-15Zh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 16:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5242A6024D;
	Fri, 10 Apr 2026 16:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631D6C19421;
	Fri, 10 Apr 2026 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839820;
	bh=pMfWqUL50U9uJZvRyzRrUAe3IDyJM8UFSorNX2tsNw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ny2puyZQhUYAM+38B7qKb965c/CJi/dQvWVVygiDPaMFJZfFaLeP4RaRskNk13DON
	 6ym39KDsGfHhM09JcFQzMTZ4PFIgyTaMSpY5XEykAzULo0NDROV+oxtP7Bf5sdtunF
	 2uAto/1nsJhOBTwGluX6gur+zNBhw9v9tqwrdd+IhTRWmFTmiqvZycWybZPc5KPUn6
	 Qzkza6IO6B4S2mALuqFGtJ1zDi2k2z6kFRaQyr49P1Y76rfgvW/08vSu+1edx0N0/O
	 nEXf2pVAL20jvy39DDLiQ9GD7aMHo6SZJQvxi1XUJ7coxL1a5SwdEyqW3vNiS3MCxt
	 LrhnR4ApN7WIQ==
Date: Fri, 10 Apr 2026 09:50:16 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 0/6] perf arm_spe: Dump IMPDEF events
Message-ID: <adkqSLNceF2OQuBo@google.com>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
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

Hi James,

On Tue, Apr 07, 2026 at 03:05:14PM +0100, James Clark wrote:
> In the Arm SPE raw data dump, IMPDEF events aren't printed. Add the
> ability to add names for some known events or print the raw event number
> for unknown events.
> 
> For example:
> 
>   $ perf report -D
> 
>   ... ARM SPE data: size 0xd000 bytes
>   00000000: b0 18 c6 32 80 00 80 ff a0  PC 0xff80008032c618 el1 ns=1
>   00000009: 64 e7 42 00 00              CONTEXT 0x42e7 el1
>   0000000e: 00 00 00 00 00              PAD
>   00000013: 49 00                       LD GP-REG
>   00000015: 52 16 10               	EV RETIRED L1D-ACCESS TLB-ACCESS
> 
> On N1 the event line becomes:
> 
>   00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS LATE-PREFETCH
> 
> Or on other cores it becomes:
> 
>   00000015: 52 16 10                    EV RETIRED L1D-ACCESS TLB-ACCESS IMPDEF:12
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v2:
> - Put MIDR in arm_spe_pkt (Leo)
> - Use for_each_set_bit() (Leo)
> - Use BIT_ULL() to fix 32bit builds (Ian)
> - Don't call strtol() with NULL (Ian)
> - Link to v1: https://lore.kernel.org/r/20260401-james-spe-impdef-decode-v1-0-ad0d372c220c@linaro.org

I'm getting this on 32-bit build.

  In file included from /linux/tools/include/linux/bitmap.h:8,                    
                   from util/arm-spe-decoder/arm-spe-pkt-decoder.c:11:            
  util/arm-spe-decoder/arm-spe-pkt-decoder.c: In function 'arm_spe_pkt_desc_event':
  util/arm-spe-decoder/arm-spe-pkt-decoder.c:377:37: error: passing argument 1 of 'find_first_bit' from incompatible pointer type [-Werror=incompatible-pointer-types]
    377 |                 for_each_set_bit(i, &payload, 64) {                      
  /linux/tools/include/linux/bitops.h:55:38: note: in definition of macro 'for_each_set_bit'
     55 |         for ((bit) = find_first_bit((addr), (size));            \       
        |                                      ^~~~                               
  In file included from /linux/tools/include/linux/bitmap.h:9:                    
  /linux/tools/include/linux/find.h:118:51: note: expected 'const long unsigned int *' but argument is of type 'u64 *' {aka 'long long unsigned int *'}
    118 | unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
        |                              ~~~~~~~~~~~~~~~~~~~~~^~~~

Thanks,
Namhyung

> 
> ---
> James Clark (6):
>       perf arm_spe: Make a function to get the MIDR
>       perf arm_spe: Handle missing CPU IDs
>       perf arm_spe: Store MIDR in arm_spe_pkt
>       perf arm_spe: Turn event name mappings into an array
>       perf arm_spe: Decode Arm N1 IMPDEF events
>       perf arm_spe: Print remaining IMPDEF event numbers
> 
>  tools/perf/util/arm-spe-decoder/Build              |   2 +
>  tools/perf/util/arm-spe-decoder/arm-spe-decoder.c  |  17 ++-
>  tools/perf/util/arm-spe-decoder/arm-spe-decoder.h  |   3 +-
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.c     | 144 ++++++++++++++-------
>  .../util/arm-spe-decoder/arm-spe-pkt-decoder.h     |   5 +-
>  tools/perf/util/arm-spe.c                          |  62 ++++++---
>  6 files changed, 158 insertions(+), 75 deletions(-)
> ---
> base-commit: 74e2dbe7be5037a5e5eed6bc1ad562747ac88566
> change-id: 20260331-james-spe-impdef-decode-d944f4fdcff7
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 

