Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1078C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiMRSofvV53/fss6wNtLFE8fj0/QvLxuUCYdCoepWGU=; b=JQsLCYMQVhcf4OMZ0vQwDWJUDg
	tYdpiuOfdaeuOPO+Q6aRn5gEL2+j5MuID19JfBve/Rj6c4NLEFHd99wVBRbe+Xi26oITLCyKP15Vi
	vBcML37t3g5rgCO0VnSKxgG108CEVNQgm9oRIB8l4pDBumuBBafd4XsEeC70rphu40SAq/BJEm4zu
	DytihyO06HBpfaWbS+srgQ9EXdDEXPffVW6VvdQv0pWIWU8BI7PBjbKb7XwmqWsPDbq46c1/bH5Cm
	iIhlGT7iT5GJa23oK6pLs3WNoyywJ0pYQIsSvpDL/YGLHkOlLr1gODy7ewx6KDrDTSwW4qUNwm/Yy
	ZAdaAsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKc3O-0000000Fhkd-2jm3;
	Thu, 29 May 2025 12:08:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbSS-0000000FcpW-1yQX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:30:02 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7PJN5YnVz6L4sw;
	Thu, 29 May 2025 19:28:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2939F1400CA;
	Thu, 29 May 2025 19:29:52 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 May
 2025 13:29:51 +0200
Date: Thu, 29 May 2025 12:29:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Songwei Chai <quic_songchai@quicinc.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Andy Gross
	<agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] coresight-tgu: Add signal priority support
Message-ID: <20250529122950.00001fe6@huawei.com>
In-Reply-To: <20250529081949.26493-4-quic_songchai@quicinc.com>
References: <20250529081949.26493-1-quic_songchai@quicinc.com>
	<20250529081949.26493-4-quic_songchai@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043000_656314_5FAA6746 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, 29 May 2025 16:19:44 +0800
Songwei Chai <quic_songchai@quicinc.com> wrote:

> Like circuit of a Logic analyzer, in TGU, the requirement could be
> configured in each step and the trigger will be created once the
> requirements are met. Add priority functionality here to sort the
> signals into different priorities. The signal which is wanted could
> be configured in each step's priority node, the larger number means
> the higher priority and the signal with higher priority will be sensed
> more preferentially.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>


> diff --git a/drivers/hwtracing/coresight/coresight-tgu.h b/drivers/hwtracing/coresight/coresight-tgu.h
> index 6c849a2f78fa..f07ead505365 100644
> --- a/drivers/hwtracing/coresight/coresight-tgu.h
> +++ b/drivers/hwtracing/coresight/coresight-tgu.h
> @@ -13,6 +13,112 @@

> +enum operation_index {
> +	TGU_PRIORITY0,
> +	TGU_PRIORITY1,
> +	TGU_PRIORITY2,
> +	TGU_PRIORITY3
No blank line.  Also convention on anything other than a terminating entry
is to leave the trailing , 
> +
> +};

> +
>  /**
>   * struct tgu_drvdata - Data structure for a TGU (Trigger Generator Unit)
>   * @base: Memory-mapped base address of the TGU device
> @@ -20,6 +126,9 @@
>   * @csdev: Pointer to the associated coresight device
>   * @spinlock: Spinlock for handling concurrent access
>   * @enable: Flag indicating whether the TGU device is enabled
> + * @value_table: Store given value based on relevant parameters.
> + * @max_reg: Maximum number of registers
> + * @max_step: Maximum step size
>   *
>   * This structure defines the data associated with a TGU device,
>   * including its base address, device pointers, clock, spinlock for
> @@ -32,6 +141,9 @@ struct tgu_drvdata {
>  	struct coresight_device *csdev;
>  	spinlock_t spinlock;
>  	bool enable;
> +	struct value_table *value_table;
> +	int max_reg;
> +	int max_step;

Ah. Here some of the bits missing in previous patch that make
the description make more sense.  Fair enough.

>  };
>  
>  #endif
> 
> 


