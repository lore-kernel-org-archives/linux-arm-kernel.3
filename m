Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1EEC7113E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CRnnKtcQ6h2To++hnDOLOUqdXzz+wzrmPD9Ee7pPI0=; b=Wln2KkGRbMhK5dR7kITDyb4THH
	lqKx7wExq9N0GJrzVGiHDrhGyFCupJtKtCofj3MwI1g4slbB5QI7wVWclrmsJ/rBnSifIh3tyVfx8
	9EExfMek5mjJoLeLFnmDI6HTP+/Z/x0I9a+GoMxIn6PmftCT0Ox2jmRH96jYjo0ovLc05BbRnPb7h
	QE31e3Qt0i5fxqyRNtLYl7IijqFNskRHFjGWoBTvuq2o/b3WS548wZELJTnlPl3kUuZGEc/AffDF+
	OxX7t2Grr5J5JUf/ehye2OvGNGslH6DDzSMqKsE+LTddp12qLA57bzNusUDl6Bef3XbUwecsIB9hu
	GAVCwvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPanN-0000000CGH3-2zvW;
	Thu, 12 Jun 2025 05:48:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPajQ-0000000CFHi-05ek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 05:44:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 092771595;
	Wed, 11 Jun 2025 22:43:47 -0700 (PDT)
Received: from [10.163.33.129] (unknown [10.163.33.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B503D3F66E;
	Wed, 11 Jun 2025 22:44:03 -0700 (PDT)
Message-ID: <1a3ff93c-7a25-4462-849c-b5031953bd41@arm.com>
Date: Thu, 12 Jun 2025 11:14:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] coresight: perf: Use %px for printing pointers
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
 <20250611-arm_cs_fix_smatch_warning_v1-v1-2-02a66c69b604@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250611-arm_cs_fix_smatch_warning_v1-v1-2-02a66c69b604@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_224408_111871_81D7CA94 
X-CRM114-Status: GOOD (  16.77  )
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

On 11/06/25 8:14 PM, Leo Yan wrote:
> Use "%px" to print a pointer, which is better than casting the pointer
> to unsigned long and printing it with the "%lx" specifier.
> 
> Note, the printing format will be updated as 64-bit value:
> 
>   # cat /sys/devices/cs_etm/sinks/trbe0
>   0x000000003744496a

But what was it before this patch is applied ? Just wondering if
there are sysfs changes that might be visible to the user space.

> 
> This commit dismisses the following smatch warnings:
> 
>   coresight-etm-perf.c:854 etm_perf_sink_name_show() warn: argument 4 to %lx specifier is cast from pointer
>   coresight-etm-perf.c:946 etm_perf_cscfg_event_show() warn: argument 4 to %lx specifier is cast from pointer
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f1551c08ecb20ebd7feab82dbaee3176e6bcc999..f677c08233ba1a28b277674662c6e6db904873dd 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -851,7 +851,7 @@ static ssize_t etm_perf_sink_name_show(struct device *dev,
>  	struct dev_ext_attribute *ea;
>  
>  	ea = container_of(dattr, struct dev_ext_attribute, attr);
> -	return scnprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)(ea->var));
> +	return scnprintf(buf, PAGE_SIZE, "0x%px\n", ea->var);
>  }
>  
>  static struct dev_ext_attribute *
> @@ -943,7 +943,7 @@ static ssize_t etm_perf_cscfg_event_show(struct device *dev,
>  	struct dev_ext_attribute *ea;
>  
>  	ea = container_of(dattr, struct dev_ext_attribute, attr);
> -	return scnprintf(buf, PAGE_SIZE, "configid=0x%lx\n", (unsigned long)(ea->var));
> +	return scnprintf(buf, PAGE_SIZE, "configid=0x%px\n", ea->var);
>  }
>  
>  int etm_perf_add_symlink_cscfg(struct device *dev, struct cscfg_config_desc *config_desc)
> 

