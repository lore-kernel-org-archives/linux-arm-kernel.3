Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA23D1F9D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dafRh57dgCcXZRJfs7G2Sjtc6JTcrlRUlsNrsEgi+c4=; b=Dk7w+/iQfReIrQn4RcOKjB1fol
	8c7OK6LYtzqBM/+kHGbmNr7416t0WUSf7sB4akTRhE4qmQVNrpqAn50jJaxfmFFSmG0QQ7nTlx5mg
	PP2momWxF7IH0ndSntz2VlMLMIK1fn1jNekEhxt655aFbweQfjielIHQhESh9HzF8op0EWJbvidUG
	FX1UsddMgZE1szHVFwbzposNmBygHm+/NGsB8Tt+IPeFerBtyHbMbd52CSPI9DoKb+U3l6enS4nh0
	4zJKekS4WlZjM+Ji/xnHP+3VdqbmlKS5vrzLRQJcVkuXsKcYvKsvETI1JBN95EUXTARVJbonw96F5
	4Cndz7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8VD-00000007zOL-1OF7;
	Thu, 04 Dec 2025 12:32:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8V9-00000007zNv-0kRx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:32:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92ECD339;
	Thu,  4 Dec 2025 04:31:54 -0800 (PST)
Received: from [10.163.49.196] (unknown [10.163.49.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEF183F73B;
	Thu,  4 Dec 2025 04:31:56 -0800 (PST)
Message-ID: <92ab073c-c2fc-4218-a8c8-458a69619db7@arm.com>
Date: Thu, 4 Dec 2025 18:01:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] coresight: trbe: Remove buffer disabling in
 trbe_handle_overflow()
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
 <20251201-trbe_buffer_refactor_v1-1-v1-3-7da32b076b28@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-3-7da32b076b28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_043203_285003_FE75E16B 
X-CRM114-Status: GOOD (  16.75  )
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
> When trbe_handle_overflow() runs, the buffer has already been disabled
> and drained, so the duplicate operation is unnecessary.  Remove it.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 2f44e4a65e0ee2b2c8fdd06a51ab01fc57f44a4e..f5597bd9b5fba9a8f5053d5823b03380fd468b5c 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1077,7 +1077,6 @@ static int trbe_handle_overflow(struct perf_output_handle *handle)
>  		 * is able to detect this with a disconnected handle
>  		 * (handle->event = NULL).
>  		 */
> -		trbe_drain_and_disable_local(buf->cpudata);
>  		*this_cpu_ptr(buf->cpudata->drvdata->handle) = NULL;
>  		return -EINVAL;
>  	}
> 

Like the previous patch - trbe_drain_and_disable_local() would have run
if TRBE_FAULT_ACT_WRAP case is being handled via trbe_handle_overflow().
But please do mention these details in the commit message for things to
be clear and explicit.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

