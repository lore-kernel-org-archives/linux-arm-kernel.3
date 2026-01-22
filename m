Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3EAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84L8Ug9+EuohvKOlDpg0Av/wy2VNnkSIawVBEDCkbbY=; b=KhWsnsnxqmybnuhSry/k2NMn1A
	9JyzCbLlEOxwIknNS3Q2i64fNhhPJ1I0oO8amPn6evKUgKTpHClXe/fJDa40ezRH/fU4l8wKhx7E7
	MPCg+bWuEG7mCvdkQUFKRd++dGLCRzFPOvdUnum4z+KuMEmnO/fF4eXCa7vJh5U4vRKNKs/vhRdzI
	ppjb4xL+1t2n2Q6oMcV80f8pDXu5XKsOcZKpwAM5mCgPhMXi+GCXpC0itSMomn3K2oDOGqYWAoCee
	07C//TljrdbJg8ka6y/oqwPmFEsfI4I4H5/E3ZRjlNMpXgb2daQ9ONHgNNCLsnB5x7K+1Ct6mdJRT
	Ieal5F1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virU5-00000006nE4-1SLk;
	Thu, 22 Jan 2026 10:00:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virU2-00000006nDe-2Rh9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:00:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFDE21476;
	Thu, 22 Jan 2026 02:00:00 -0800 (PST)
Received: from [10.57.9.125] (unknown [10.57.9.125])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF1233F740;
	Thu, 22 Jan 2026 02:00:04 -0800 (PST)
Message-ID: <525fe4ad-3d3e-4c05-a6f5-da91157f362e@arm.com>
Date: Thu, 22 Jan 2026 10:00:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-1-22978e3c169f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-1-22978e3c169f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_020010_688736_06B898B0 
X-CRM114-Status: GOOD (  19.01  )
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

On 22/01/2026 02:08, Jie Gan wrote:
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
> index c660cf8adb1c..0e8448784c62 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>   
> +/**
> + * coresight_get_in_port: Find the input port number at @csdev where a @remote
> + * device is connected to.

This doesn't match the code ?

We are looking at the remote devices' in_connections ?

> + *
> + * @csdev: csdev of the device.
> + * @remote: csdev of the remote device which is connected to @csdev.
> + *
> + * Return: port number upon success or -EINVAL for fail.
> + */
> +int coresight_get_in_port(struct coresight_device *csdev,
> +			  struct coresight_device *remote)
> +{
> +	struct coresight_platform_data *pdata = remote->pdata;
> +	int i;
> +
> +	for (i = 0; i < pdata->nr_inconns; ++i) {
> +		if (pdata->in_conns[i]->src_dev == csdev)
> +			return pdata->in_conns[i]->dest_port;
> +	}

Suzuki


