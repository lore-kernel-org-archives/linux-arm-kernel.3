Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D2AC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOaM3EeMGkU4XF9a7KrM5zisSmQdMMkGMuiU0CKTxSg=; b=OhGSYA6j0CP92NKbRP3jqT2wCN
	0C/Y1yMwm05Tn/OoL5ZZSrw0QXmAzjTXhxGft++GFYU2j8dP4E2oNjKAtP6vK95SgPzVHrTVbj4cl
	GaOwuSjZdidSbnGZh0l5RRiwZvzrpvxIOheEFSHt7Hzr/U/6vtJE6nRVex1h4I4skSlKjqrikoRAm
	7ckEH+/1yEqy9MTtxNCvuIyal2i10NZ1wxgWYH5dp0NGzP+s0KZ84G5iDbp6yTrIjKdGvQaeMQVeV
	9rjl2KLZEd6DTU1M2o8LVyAdCrj/vnwqongd/atv4xfRYoEMrkLfFFOEsl7tupbVpi5oTbHHFW3CX
	PPe1jqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7sv-0000000D3P1-05jt;
	Wed, 30 Apr 2025 13:54:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7qf-0000000D338-2iXD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:51:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2326106F;
	Wed, 30 Apr 2025 06:51:33 -0700 (PDT)
Received: from [10.1.33.69] (Suzukis-MBP.cambridge.arm.com [10.1.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 934443F673;
	Wed, 30 Apr 2025 06:51:39 -0700 (PDT)
Message-ID: <1efe761e-964b-4b24-b1e3-dc33bf1749b7@arm.com>
Date: Wed, 30 Apr 2025 14:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Disable MMIO logging for coresight stm driver
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_065141_735615_C5121DCB 
X-CRM114-Status: GOOD (  14.40  )
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

Hi,

On 30/04/2025 12:03, Mao Jinlong wrote:
> When read/write registers with readl_relaxed and writel_relaxed,
> log_read_mmio and log_write_mmio will be called. If mmio trace
> is enabled to STM, STM driver will write the register to send the
> trace and writel_relaxed will be called again. The circular call
> like callstack below will happen. Disable mmio logging for stm
> driver to avoid this issue.
> 

Thanks for the fix, looks good to me. However, I think the commit 
description is a bit cryptic. Could we say :

With MMIO logging enabled, the MMIO access are traced and could be
sent to an STM device. Thus, an STM driver MMIO access could create
circular call chain with MMIO logging. Disable it for STM driver.

Suzuki

> [] stm_source_write[stm_core]+0xc4
> [] stm_ftrace_write[stm_ftrace]+0x40
> [] trace_event_buffer_commit+0x238
> [] trace_event_raw_event_rwmmio_rw_template+0x8c
> [] log_post_write_mmio+0xb4
> [] writel_relaxed[coresight_stm]+0x80
> [] stm_generic_packet[coresight_stm]+0x1a8
> [] stm_data_write[stm_core]+0x78
> [] ost_write[stm_p_ost]+0xc8
> [] stm_source_write[stm_core]+0x7c
> [] stm_ftrace_write[stm_ftrace]+0x40
> [] trace_event_buffer_commit+0x238
> [] trace_event_raw_event_rwmmio_read+0x84
> [] log_read_mmio+0xac
> [] readl_relaxed[coresight_tmc]+0x50
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..f3158266f75e 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -22,6 +22,8 @@ condflags := \
>   	$(call cc-option, -Wstringop-truncation)
>   subdir-ccflags-y += $(condflags)
>   
> +CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
> +
>   obj-$(CONFIG_CORESIGHT) += coresight.o
>   coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
>   		coresight-sysfs.o coresight-syscfg.o coresight-config.o \


