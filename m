Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9813105F7AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFJCLG36XIdSzhoFoZlQMFSyPn/0qRaN9YhO75SwEVo=; b=1flIu1JZjjP2CUavejcDn+QXvP
	S/GjflxZY/2Of+6Bt5mXACAYMtS46ztH0QrW8U8gz7y5FU0t3zlkZbYkboNJ4DJoo8wRfqE0mEwjY
	qvQKewUsOcIwSk0AVzOC2+ECaAZygpwVhcCi48qhx/eSsgSWC6EkG8ga0Yvaz/4lVB9bey7L3W+T3
	2uE6gXWZqy4TyZj5H3zfH8GbjY+bYVZjQjE+N4A9oBRt/pD58L7Ln+rz2f6P8HnIKR169UAZ3/hR2
	jWEg6opXF3ErWDSCyKs58fURixz6R8reR3M412baHcAaYx6tVv+fosv6oRNRY7Oe1MBh/wG9huh2R
	D/xWnXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13ix-00000000Prl-3nBJ;
	Fri, 13 Mar 2026 14:42:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13iv-00000000PqY-0Ktl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:42:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDB36165C;
	Fri, 13 Mar 2026 07:42:35 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94FA03F7BD;
	Fri, 13 Mar 2026 07:42:41 -0700 (PDT)
Date: Fri, 13 Mar 2026 14:42:39 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
	acme@kernel.org, suzuki.poulose@arm.com, leo.yan@linaro.org,
	peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@redhat.com, namhyung@kernel.org
Subject: Re: [PATCH 1/2] perf: tools: cs-etm: Fix print issue for Coresight
 debug in ETE/TRBE trace
Message-ID: <20260313144239.GM4153946@e132581.arm.com>
References: <20260313132129.2743468-1-mike.leach@arm.com>
 <20260313132129.2743468-2-mike.leach@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313132129.2743468-2-mike.leach@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_074245_159374_0B564C8E 
X-CRM114-Status: GOOD (  21.62  )
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

On Fri, Mar 13, 2026 at 01:21:28PM +0000, Mike Leach wrote:
> Building perf with CORESIGHT=1 and the optional CSTRACE_RAW=1 enables
> additional debug printing of raw trace data when using command:-
> perf report --dump.
> 
> This raw trace prints the CoreSight formatted trace frames, which may be
> used to investigate suspected issues with trace quality / corruption /
> decode.
> 
> These frames are not present in ETE + TRBE trace.
> This fix removes the unnecessary call to print these frames.
> 
> Due to an addtional fault with the OpenCSD library, this call when ETE/TRBE
> are being decoded will cause a segfault in perf. This fix also prevents
> that problem for perf using older (<= 1.8.0 version) OpenCSD libraries.

Thanks for patches!

> Fixes: 68ffe3902898 ("perf tools: Add decoder mechanic to support dumping trace data")
> 

Redundant empty line.

> Reported-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Mike Leach <mike.leach@arm.com>
> ---
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> index 3050fe212666..f7e89693cf16 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -739,7 +739,8 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
>  		goto err_free_decoder;
>  
>  	/* init raw frame logging if required */
> -	cs_etm_decoder__init_raw_frame_logging(d_params, decoder);
> +	if (format == OCSD_TRC_SRC_FRAME_FORMATTED)
> +		cs_etm_decoder__init_raw_frame_logging(d_params, decoder);

Could we improve a bit to add checking in
cs_etm_decoder__init_raw_frame_logging(), something like:

 cs_etm_decoder__init_raw_frame_logging(struct cs_etm_decoder_params *d_params,
                                       struct cs_etm_decoder *decoder)
 {
+       /* No formatted trace frames */
+       if (!d_params->formatted)
+               return;

Sorry I should have mentioned this early.

>  
>  	for (i = 0; i < decoders; i++) {
>  		ret = cs_etm_decoder__create_etm_decoder(d_params,
> -- 
> 2.43.0
> 

