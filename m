Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C73D49209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYJFqr+arxm9nYk3LLY7JaZyG1nYHqgmF0KRVSthn3Q=; b=byMUxKxodGkn9BWns7xPo5tghW
	eOBBp+rNyXeJF1Tmf4iU+stu3MVKC0yLviMRJ3aTvCaDD/dB+2C9/+/sEvubIlJUpQYOr3oqCjsVA
	DXhzgyrOIDOALZCMdoXL8//c76WNJqLFJV2Q8JxLLKqeYeGUGm7/ALUByW8kTBgqZXpBYfAStgQDZ
	8LT+HaxRIBNmtUUlg8cPMep47gCLjsD+KyEXwhOD2BuYlgftFIAlR7SUjo6MqqBWhq3Omt4CpBoEJ
	amuvN9cV63fGz+ONiq7MYxlnFwG4AdyMlcxzzWykjI76QdTxQWZcri0dM43nXbP6+i9GxZdAHd0Zh
	o7zZVRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz9E-0000000978g-2Ueo;
	Mon, 18 Nov 2024 10:38:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz5g-000000096NY-14mX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:34:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37DC7169C;
	Mon, 18 Nov 2024 02:35:13 -0800 (PST)
Received: from [10.57.67.249] (unknown [10.57.67.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B7B43F5A1;
	Mon, 18 Nov 2024 02:34:41 -0800 (PST)
Message-ID: <ea311a21-959d-4985-9364-7c85d256ab09@arm.com>
Date: Mon, 18 Nov 2024 10:34:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] coresight: etm4x: don't include 'pm_wakeup.h'
 directly
Content-Language: en-GB
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-5-wsa+renesas@sang-engineering.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241118072917.3853-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_023444_343185_FB5561A8 
X-CRM114-Status: GOOD (  11.58  )
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

On 18/11/2024 07:29, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 66d44a404ad0..559972a00fdf 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -23,7 +23,6 @@
>   #include <linux/cpu_pm.h>
>   #include <linux/coresight.h>
>   #include <linux/coresight-pmu.h>
> -#include <linux/pm_wakeup.h>
>   #include <linux/amba/bus.h>
>   #include <linux/seq_file.h>
>   #include <linux/uaccess.h>

If you plan to take this as a collection outside of CoreSight tree,

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Otherwise, I can pick this up.


Suzuki

