Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1EAD1F9CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0l+iIJxyD9k+2I5y9ZW93RjH58dMF4Wla37h+3I3DM=; b=MHeSLK3btPPLLs4T8nD6BNTZ1B
	0ej7cY4G6yqSqejiwLZIUU+S2Kqu5VV4imS2wBRGHwLtQ3zjRFIlGxRhN6T/NYHC/ry0EgdjYwKIE
	6MTsOPyTu/y4k4BpIPqslFHxm7SPKUaa7JCiXK6K8JR7wE6l3P6+tCRn7C8WjYSG4YUonRVpVc2bD
	bCNGdARl947hiVcvnjPyRv26nyoKzWfmlwvw2tf/RK57h8dHJVYIg906kjhrcbG13Jt01uaGd7SQD
	ebGGR0LwjUawjAMx+CMjVWwp47AQoIkf2EjUAv7nfLSAs/96/419sg4+hAo3GewwsXxvbqJXaTg4r
	Zp7ObWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR889-00000007xwp-0sLj;
	Thu, 04 Dec 2025 12:08:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR886-00000007xwS-1Re7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:08:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54B28339;
	Thu,  4 Dec 2025 04:08:06 -0800 (PST)
Received: from [10.163.49.196] (unknown [10.163.49.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACBF33F73B;
	Thu,  4 Dec 2025 04:08:08 -0800 (PST)
Message-ID: <9440a191-86af-4eea-b867-8f65131bd701@arm.com>
Date: Thu, 4 Dec 2025 17:38:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] coresight: trbe: Use helpers for checking errata
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
 <20251201-trbe_buffer_refactor_v1-1-v1-1-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-1-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_040814_452529_E84A3077 
X-CRM114-Status: GOOD (  17.32  )
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
> Use the existed helpers for checking errata instead of open coded

Small nit - s/the existed helpers/the existing helpers/

> equivalent.> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 293715b4ff0eb0abe30f9b477700ca94f81cd4a2..0ddb3db0213cf0014e29decfb79da68b0a351b31 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -723,7 +723,7 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
>  	 * the space we skipped with IGNORE packets. And we are always
>  	 * guaranteed to have at least a PAGE_SIZE space in the buffer.
>  	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE) &&
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata) &&
>  	    !WARN_ON(size < overwrite_skip))
>  		__trbe_pad_buf(buf, start_off, overwrite_skip);
>  
> @@ -946,7 +946,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>  	 *  - At trace collection:
>  	 *     - Pad the 256bytes skipped above again with IGNORE packets.
>  	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
> +	if (trbe_may_overwrite_in_fill_mode(buf->cpudata)) {
>  		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
>  			return -EINVAL;
>  		buf->trbe_hw_base = buf->trbe_write;
> @@ -970,7 +970,7 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
>  	 *     - Adjust the TRBLIMITR.LIMIT to leave the extra PAGE outside
>  	 *       the TRBE's range (i.e [TRBBASER, TRBLIMITR.LIMI] ).
>  	 */
> -	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_WRITE_OUT_OF_RANGE)) {
> +	if (trbe_may_write_out_of_range(buf->cpudata)) {
>  		s64 space = buf->trbe_limit - buf->trbe_write;
>  		/*
>  		 * We must have more than a PAGE_SIZE worth space in the proposed
> 

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

