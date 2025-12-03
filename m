Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1040D15DAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YYwUR99g4UYBnu5OIez8XFhBvQSv5YEZ+xGmLAE1iNc=; b=aYRmnQW9D4EdMEHc5fSBP0WOay
	aLmFyHQYysoZumlHa2tFcwXa0ujvVOVuIKqRaKLXD4mh1xCiMnhYIEhItA6wuEYa/a/tYQ+ydYqDz
	IOR/6PyOREIYg6VB8zrFVN82GWgfsDEeLWaViBKJxA+RNZRmHyRA6ch7mRzJkITSvy0/nZBaYloFm
	DVzA8m6zXdJe24zWv3Jh89vch0QIQfW+84BBE7HCELKosr3YnLN2XzBnnneUytnUes4m1DVgCSOtN
	EIH80iSbb1R5RVBIhWc53TwNO8S3ATnzhXMOfP9qtjMXkor21Ydw5oJZlHxcXWkuIjN+L/D6C9Oyr
	5K5EW/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpYf-00000006n7A-2ylW;
	Wed, 03 Dec 2025 16:18:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpYc-00000006n6U-3EBN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 16:18:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59DFE339;
	Wed,  3 Dec 2025 08:18:13 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0B93F66E;
	Wed,  3 Dec 2025 08:18:18 -0800 (PST)
Message-ID: <29a61f75-df0b-41da-9c8d-3e2ced0a9ce7@arm.com>
Date: Wed, 3 Dec 2025 16:18:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-1-1db9e621441a@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-1-1db9e621441a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_081822_857181_ECE01968 
X-CRM114-Status: GOOD (  17.47  )
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

On 08/09/2025 03:01, Jie Gan wrote:
> Remove ctcu_get_active_port from CTCU module and add it to the core
> framework.
> 
> The port number is crucial for the CTCU device to identify which ETR
> it serves. With the port number we can correctly get required parameters
> of the CTCU device in TMC module.
> 
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
>   drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
>   3 files changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 1accd7cbd54b..042c4fa39e55 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>   
> +/**
> + * coresight_get_in_port_dest: get the in-port number of the dest device
> + * that is connected to the src device.
> + *
> + * @src: csdev of the source device.
> + * @dest: csdev of the destination device.
> + *
> + * Return: port number upon success or -EINVAL for fail.
> + */
> +int coresight_get_in_port_dest(struct coresight_device *src,

Please could we make this more explicit :

	/*
	 * Find the input port number at @csdev where a @remote
	 * device is connected to.
	 */
	coresight_get_in_port(struct coresight_device *csdev,
			      struct coresight_device *remote)
	{

	}
Suzuki


