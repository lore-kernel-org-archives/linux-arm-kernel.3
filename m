Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF64C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFCbhy0sZ01qJ5mL5LQVDsxV3OzfSGba7uC9ZFpdg6Q=; b=KpQmTxbJg5Yc/AktS10RHiLYir
	vN6uJnDq5D5qSUbP6IIlcfRgL1xOqJ2go2rYyK97xFrS2AQA/xGgKuOTE5dw7XOrYtY3fsoSHKoZj
	WEn3pkp1nuBYdlHjPWCPkmTxQy8wJfRoGH0oaUch3S1NEqvVEBtPrpjJRALV2S9UMiSbi09lwTuhX
	cxLOrOYhTXLZ8C2cuHb52tBp3xZ7CeOzmiwAdYejR3DxIGIHk6ZK4GsJ1nxKUGoWApyHx4cLXgKG4
	oZm3O+TGIGdmkbVjMNyDnbc/jsghfh3mhLJzcmrMA+rFUCJOklTt+GlbeEz/0j+vbxEGWzt6OhASH
	I2alPb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBR4-0000000AaMy-0s5D;
	Tue, 06 May 2025 06:05:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC9R1-0000000A6SV-1H4Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 03:57:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36305113E;
	Mon,  5 May 2025 20:57:24 -0700 (PDT)
Received: from [10.163.54.208] (unknown [10.163.54.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38E4A3F673;
	Mon,  5 May 2025 20:57:28 -0700 (PDT)
Message-ID: <911d8ce8-9b2e-4c86-ac56-aae523adfe36@arm.com>
Date: Tue, 6 May 2025 09:27:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Disable MMIO logging for coresight stm driver
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250430110347.2091013-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_205735_398798_5DC56657 
X-CRM114-Status: GOOD (  12.48  )
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



On 4/30/25 16:33, Mao Jinlong wrote:
> When read/write registers with readl_relaxed and writel_relaxed,
> log_read_mmio and log_write_mmio will be called. If mmio trace
> is enabled to STM, STM driver will write the register to send the
> trace and writel_relaxed will be called again. The circular call
> like callstack below will happen. Disable mmio logging for stm
> driver to avoid this issue.
> 
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
>  drivers/hwtracing/coresight/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..f3158266f75e 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -22,6 +22,8 @@ condflags := \
>  	$(call cc-option, -Wstringop-truncation)
>  subdir-ccflags-y += $(condflags)
>  
> +CFLAGS_coresight-stm.o := -D__DISABLE_TRACE_MMIO__
> +
>  obj-$(CONFIG_CORESIGHT) += coresight.o
>  coresight-y := coresight-core.o  coresight-etm-perf.o coresight-platform.o \
>  		coresight-sysfs.o coresight-syscfg.o coresight-config.o \

As Suzuki mentioned, please do update the commit message.

Otherwise LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

