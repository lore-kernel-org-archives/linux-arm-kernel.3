Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5214AD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 11:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LSmLJ51fc2rp+GAShOHhum4boh0qpZ+FUwIi1eUD1Y=; b=mbn9YuuHVJtMjZ9jBOzM7EY/dU
	6ODjEBdr149l+NFKPVl1vbpNKZkLMBo36TwQ1cBCZfn65tAgyhqUyUfdFEzjCcNIbAFsbnesvjf99
	FysxaAlME3nNfoyrea3noyUlcHAgQPdtYfaRsfUvh6aSA8xH/bk1fnf+ABrRoRGnxhB0XY836Trb8
	X9MW4ZvTwtMl9oAvghzxWrRq4z+emnmKRy7iW9qDm6zRnYCXjQGWp80WoAgL12C5bsFQ3gyP8EALJ
	4URlvHPWhZmre/sVfBBRaslTUkWwAm09CB9LBI0D3oBn5m29e6jOBr5kOgG44mHAvtKrv8mrtDPTW
	2wVZ5+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOmh-00000005KJs-3gNt;
	Tue, 02 Dec 2025 11:43:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQOmf-00000005KJX-29YU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 11:43:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3319153B;
	Tue,  2 Dec 2025 03:42:55 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B80433F59E;
	Tue,  2 Dec 2025 03:43:02 -0800 (PST)
Date: Tue, 2 Dec 2025 11:43:00 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] perf cs-etm: Don't use hard coded config bits when
 setting up ETMCR
Message-ID: <20251202114300.GV724103@e132581.arm.com>
References: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
 <20251201-james-perf-config-bits-v1-4-22ecbbf8007c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-james-perf-config-bits-v1-4-22ecbbf8007c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_034305_656440_0103ECDE 
X-CRM114-Status: GOOD (  11.81  )
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

On Mon, Dec 01, 2025 at 04:41:07PM +0000, Coresight ML wrote:

[...]

> @@ -746,7 +779,7 @@ static void cs_etm_get_metadata(struct perf_cpu cpu, u32 *offset,
>  	case CS_ETMV3:
>  		magic = __perf_cs_etmv3_magic;
>  		/* Get configuration register */
> -		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_get_config(itr);
> +		info->priv[*offset + CS_ETM_ETMCR] = cs_etm_guess_etmcr(itr);

I still think cs_etm_get_config() is better than cs_etm_guess_etmcr().

For ETMv3, we directly pass CONFIG to the kernel, and after validation
in the dirver, then the value will be set to ETMCR.  If we already know
the config value is consistent between user space and kernel, why
introduce a redundant "guess" operation here?

Thanks,
Leo

