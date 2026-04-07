Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FB7FF5108
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbJYlsaUjBJ0noqr/9SapNhBGZSn0GuohwbG1uAFd7s=; b=vsJCemIpsqB3Q14f5qE+E1shS8
	JZfh6fq2HdWvfbi4lme3mbGlNNosPu99ZgiDxJTY3qOMezE2ZsTU2WNqODd10HRaWeV9nYXIoTSXu
	91HekM3eKk41MDw2LqFnv+GNNNKufqUg5YMmFqrdBdrDxSQotzCqgXmHCD6LvBTRiC9UC9jINC/ks
	qmDsdrFV0B3AZEmffIv/uAUKWoVfetiXPPUlfwV8Hn7N1O00+sBG66peCd2wGUqaIZYY7gXrNDY8R
	61Yr5g4GPrfKba1WRNKNQCB0DJ8R90JQAMTfhRSK9wk/ytL28NE6lTtn+bpXOWGwEX4GxrycHefYx
	GR90qOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8NT-00000006htl-21bU;
	Tue, 07 Apr 2026 15:30:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8NQ-00000006hs0-2Fqi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:30:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D4B31BB2;
	Tue,  7 Apr 2026 08:29:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B34703F7D8;
	Tue,  7 Apr 2026 08:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775575803; bh=llsE4IbiFMmBlTdmurpE6AzK69uhgqzLVniQo/ehG6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvAKs0sjx33rw9GsjeF3tZl/J0axWZqCY0NiNEGV10fwcOBdwG9qCQdWnT/HNw/lR
	 wPeMIqTlifnG03XLtPKotuEaqwbyds3KKBfp8iAAkajdICvM7V1MMEJjkW9ByjaUp3
	 TTRhKZNJjmNirXkynXOWULgQNci7mBCJOYWzYe+c=
Date: Tue, 7 Apr 2026 16:30:00 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] perf arm_spe: Handle missing CPU IDs
Message-ID: <20260407153000.GN356832@e132581.arm.com>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
 <20260407-james-spe-impdef-decode-v2-2-55d3ef997c48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-james-spe-impdef-decode-v2-2-55d3ef997c48@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_083004_616099_BAE8306F 
X-CRM114-Status: GOOD (  21.02  )
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

On Tue, Apr 07, 2026 at 03:05:16PM +0100, James Clark wrote:
> Don't call strtol() with a null pointer to avoid undefined behavior.
> 
> I'm not sure of the exact scenario for missing CPU IDs but I don't think
> it happens in practice. SPE decoding can continue without them with
> reduced functionality, but print an error message anyway.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  tools/perf/util/arm-spe.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 7447b000f9cd..fc11f32e4911 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -968,16 +968,23 @@ static int arm_spe__get_midr(struct arm_spe *spe, int cpu, u64 *midr)
>  
>  		pr_warning_once("Old SPE metadata, re-record to improve decode accuracy\n");
>  		cpuid = perf_env__cpuid(perf_session__env(spe->session));
> +		if (!cpuid)
> +			goto err;
> +
>  		*midr = strtol(cpuid, NULL, 16);
>  		return 0;
>  	}
>  
>  	metadata = arm_spe__get_metadata_by_cpu(spe, cpu);
>  	if (!metadata)
> -		return -EINVAL;
> +		goto err;
>  
>  	*midr = metadata[ARM_SPE_CPU_MIDR];
>  	return 0;
> +
> +err:
> +	pr_err("Failed to get MIDR for CPU %d\n", cpu);
> +	return -EINVAL;
>  }
>  
>  static void arm_spe__synth_ds(struct arm_spe_queue *speq,
> 
> -- 
> 2.34.1
> 
> 

