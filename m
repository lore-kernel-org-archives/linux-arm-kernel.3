Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5C3D2CE1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC0VQe9iijL9C/bOgvAk/xsvmHyIYufV9RIURGY8C64=; b=Se7TEhnk++vrXtXUao5FJiV6mE
	o690p49X/reZM3cbH94KNdYhnWbyWeZzm9CL2vITX/WMoKbVZp+XbvtXhTiTaMaysMH2X4UeMnMRV
	IKMSoBoGr6LwPP3HgEtY6Q5WRBuX6dSX5o+oXaUdTj9msl6UVZvtpGjHaZfh0SPJMsw9ADl64VqmD
	guNTpXStlPnAEBT9TNg2QsgtzK+8xZU8CZ6qVN/k9frJzFK3zMUyxRPVhQFkjnDdtggnsRQ7pvcM+
	pqW3TW/ceTF7Oj8TSuZoUq6WLHibkv/XVf2AAPh6eloXTMVNaL0lHhDQroAn04UbqX25wPKU3e/X0
	1jM1ByNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRNQW-0000000919R-3nz6;
	Fri, 05 Dec 2025 04:28:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRNQU-00000009194-1XQY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 04:28:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8378339;
	Thu,  4 Dec 2025 20:28:04 -0800 (PST)
Received: from [10.163.52.42] (unknown [10.163.52.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DB043F86F;
	Thu,  4 Dec 2025 20:28:06 -0800 (PST)
Message-ID: <5f6bcd93-b565-4b10-9a2d-6851141e5dbe@arm.com>
Date: Fri, 5 Dec 2025 09:58:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/19] coresight: trbe: Use PERF_AUX_FLAG_PARTIAL instead
 of PERF_AUX_FLAG_COLLISION
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
 <20251201-trbe_buffer_refactor_v1-1-v1-8-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-8-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_202814_562970_F4068D12 
X-CRM114-Status: GOOD (  22.56  )
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

On 01/12/25 4:51 PM, Leo Yan wrote:
> When tracing stops, there is no collision with other samples, so using
> PERF_AUX_FLAG_COLLISION does not accurately reflect the trace state and
> may mislead userspace.
> 
> Use PERF_AUX_FLAG_PARTIAL instead to indicate that tracing stopped and
> the record may contain gaps.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index b06885a08e082fd34f68d9588518807b5c47c86e..0caa4a6b437a3aa39fc6bcc72a23711b54f7c598 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -669,21 +669,14 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
>  	}
>  
>  	/*
> -	 * Mark the buffer to indicate that there was a WRAP event by
> -	 * setting the COLLISION flag. This indicates to the user that
> -	 * the TRBE trace collection was stopped without stopping the
> -	 * ETE and thus there might be some amount of trace that was
> -	 * lost between the time the WRAP was detected and the IRQ
> -	 * was consumed by the CPU.
> -	 *
> -	 * Setting the TRUNCATED flag would move the event to STOPPED
> -	 * state unnecessarily, even when there is space left in the
> -	 * ring buffer. Using the COLLISION flag doesn't have this side
> -	 * effect. We only set TRUNCATED flag when there is no space
> -	 * left in the ring buffer.
> +	 * Mark the buffer to indicate that the trace is stopped by setting
> +	 * the PARTIAL flag. This indicates to the user that the TRBE trace
> +	 * collection was stopped without stopping the ETE and thus there
> +	 * might be some amount of trace that was lost between the time the
> +	 * TRBE event was detected and the IRQ was consumed by the CPU.
>  	 */
>  	if (!is_trbe_running(trbsr))
> -		perf_aux_output_flag(handle, PERF_AUX_FLAG_COLLISION);
> +		perf_aux_output_flag(handle, PERF_AUX_FLAG_PARTIAL);

This is interesting. So there is a no possibility for the records to be
overridden in the perf ring buffer and incomplete record is all that can
happen when TRBE is stopped, without stopping the ETE first ? Could both
of these scenarios might be possible as well ?

>  
>  	if (is_trbe_wrap(trbsr))
>  		return TRBE_FAULT_ACT_WRAP;
> 

