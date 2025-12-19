Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE837D767C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAHXGDVV1nU+EBY6ZFWSlkEylTcqqGgTGBZ3ehY//8I=; b=xdqamu0+IPUb/qS4hrgPju1GjV
	kUd4zQceLz/a5+qEveJxxoSubOLBRcDNuef47k6/t1JNgZYCCl5yyNjUUI72Kc92mPsDVUpzahDD1
	oWY1EKm62epEcCcVNegbp9WU5TNAPYIFaUPpzpUphpAu/jUPwQmB65zpcXJHEkS1gvHl+B8hrbA7/
	Ez5EBy91TBaFVjLpG9ZVHXDEATAl60hCXrKxbeM1oSH1W/QIQGEeNvsj0TtNZ5gqeX2h7Y/piNVZC
	EmgVoau/+UEYXTL10o+SYLtL+U2Oqjh3cyxWaMP8W0FTuugVnr9yPY34HR/AU6GJnc1GtuQG+Y+F4
	QlSPOvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXfK-0000000A4Az-1Z0C;
	Fri, 19 Dec 2025 10:24:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXfH-0000000A4Ac-2n9C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:24:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99D86FEC;
	Fri, 19 Dec 2025 02:24:43 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937393F5CA;
	Fri, 19 Dec 2025 02:24:49 -0800 (PST)
Message-ID: <38dc6948-6233-4b0a-a769-538939abe345@arm.com>
Date: Fri, 19 Dec 2025 10:24:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] coresight: tpda: add logic to configure TPDA_SYNCR
 register
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
 <20251219-add_sysfs_nodes_to_configure_tpda-v5-2-ca93ddfe9d30@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251219-add_sysfs_nodes_to_configure_tpda-v5-2-ca93ddfe9d30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_022451_862517_1F06FEB3 
X-CRM114-Status: GOOD (  17.26  )
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

On 19/12/2025 10:04, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> The TPDA_SYNC counter tracks the number of bytes transferred from the
> aggregator. When this count reaches the value programmed in the
> TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
> tools to accurately parse each valid packet.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
>   drivers/hwtracing/coresight/coresight-tpda.h | 5 +++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index d25a8bcfb3d4..d378ff8ad77d 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -163,6 +163,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   	 */
>   	if (drvdata->trig_flag_ts)
>   		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
> +
> +	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
> +	/* Reset the mode ctrl */
> +	val &= ~TPDA_SYNCR_MODE_CTRL;
> +	/* Program the counter value for TPDA_SYNCR */
> +	val |= TPDA_SYNCR_COUNTER_MASK;

Do we plan to change this value via sysfs ? If not whats the point of
clearing the field. Why not simply set it (as it is all 1s anyways).

> +	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index 8a075cfbc3cc..97e2729c15c9 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -9,6 +9,7 @@
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
>   #define TPDA_FPID_CR		(0x084)
> +#define TPDA_SYNCR		(0x08C)
>   
>   /* Cross trigger Global (all ports) flush request bit */
>   #define TPDA_CR_FLREQ		BIT(0)
> @@ -38,6 +39,10 @@
>   #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)

Newline to separate the defintions of different registers, please.

> +/* TPDA_SYNCR mode control bit */
> +#define TPDA_SYNCR_MODE_CTRL		BIT(12)
> +/* TPDA_SYNCR counter mask */
> +#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
>   
>   #define TPDA_MAX_INPORTS	32
>   

Suzuki


> 


