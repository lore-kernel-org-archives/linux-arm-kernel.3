Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B30E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0e9YJibIR/AhTNkHuFDCP19SLZ/59xfDvVfmhfrNN0=; b=v4cwbWQzrPqYWQca8SIiGI+Sha
	3Eje6kcxISAreyqDT4ZzmDjinkyDICyzedc9xaKQ5NkZt5rFTgAvf7LgmX83di20FDzdO2MEu4atU
	wEGJ5YQxrZ00BNxJJITk6bfleg+HYso35r4c9ONPOo0NfiGAaaGYypFDDPBZDzTATlZ3odWSJvQCl
	lQhCDuzTESjTaAsXKADw52+D90mKvbiBk55BIdRt0rBoeTwTiXhn/Vvwn1jh4rQy8Evbki4hAY6OF
	TXwGPtrEhGRRtJ8TFEGrEis4QtFJrb438QYJDTUJtXeZ/rvRR1p6s2gQDlCITYAyFRp8GQsPbYe8g
	v86rne9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVr2F-0000000Bm4i-0IyQ;
	Thu, 09 Jan 2025 11:49:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqzy-0000000Blhd-1URq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:46:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593671516;
	Thu,  9 Jan 2025 03:47:15 -0800 (PST)
Received: from [10.57.32.219] (unknown [10.57.32.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1D683F673;
	Thu,  9 Jan 2025 03:46:45 -0800 (PST)
Message-ID: <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
Date: Thu, 9 Jan 2025 11:46:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, mike.leach@linaro.org,
 james.clark@linaro.org, alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
 <20241221165934.1161856-2-yeoreum.yun@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241221165934.1161856-2-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_034650_445558_1DA3ABD9 
X-CRM114-Status: GOOD (  12.82  )
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

Hi Levi,

On 21/12/2024 16:59, Yeoreum Yun wrote:
> When etm4x configuration is modified via sysfs while etm4x is being
> enabled via perf, enabled etm4x could run with different configuration
> from perf_event.
> 
> To address this, disallow altering config via sysfs while csdev is enabled.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../coresight/coresight-etm4x-sysfs.c         | 132 +++++++++++++++++-
>   1 file changed, 128 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index 11e865b8e824..cc1f112921d7 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -174,6 +174,9 @@ static ssize_t reset_store(struct device *dev,
>   	if (kstrtoul(buf, 16, &val))
>   		return -EINVAL;
>   
> +	if (coresight_get_mode(drvdata->csdev))
> +		return -EBUSY;
> +

Is it not better to have separate "configs" for perf and sysfs ?
And etmX driver can populate the "running" config, based on the
mode specific config. That way, the configs can be updated
independently without affecting the running config or the perf one.

Suzuki


