Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF8ACA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryoj3LTxsfjRQQADo/jP46yuAnzMRJ2PJMbmihfU5Ck=; b=jpr79ipOCmvKkQIM1hoZ9WBw82
	JF8mTetvB3EIr8TiWcmRPKTcFD8rI+JW3v2uqyl/C3vajknfkQN5bT0TcT7J+Fbb0PXjexRgWc6kL
	MUw9/y5Pktlje8YgRhVOH68pE1uEmlg0sc5VfwuA6oiPReVCTVSK327eX5hWrz9onMaFo22Ux7qJZ
	jASvhI4ltLn2m/M2HaN7SzHPjWm1Cf+yGl36DdWN1lGoFG7drZA0mx5bwIAvgEeTamkeF8fnqfuiS
	DzfRhxuhCCJsPCyOqb63wUauRS4qyjuuLPKlyH/U5O8//3aoaDRPNdfJ1seO+6rivyonbHUfOvUqb
	XpAPXPiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkPg-000000062xw-3GQV;
	Wed, 03 Sep 2025 10:08:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjJc-00000005nvj-2zHm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:58:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CAC41688;
	Wed,  3 Sep 2025 01:57:53 -0700 (PDT)
Received: from [10.57.5.59] (unknown [10.57.5.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 182B03F694;
	Wed,  3 Sep 2025 01:57:59 -0700 (PDT)
Message-ID: <2f243b22-d8d3-4352-b226-aaf9ccfe825b@arm.com>
Date: Wed, 3 Sep 2025 09:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_015804_799093_E08CC8BB 
X-CRM114-Status: GOOD (  20.07  )
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

On 06/08/2025 09:09, Jie Gan wrote:
> Some TPDM devices support both CMB and DSB datasets, requiring
> the system to enable the port with both corresponding element sizes.
> 
> Currently, the logic treats tpdm_read_element_size as successful if
> the CMB element size is retrieved correctly, regardless of whether
> the DSB element size is obtained. This behavior causes issues
> when parsing data from TPDM devices that depend on both element sizes.
> 
> To address this, the function should explicitly fail if the DSB
> element size cannot be read correctly.

But what is the device only has CMB ? Back when this was originally 
merged, we raised this question and the answer was, "Only one is 
supported, not both." But this sounds like that is wrong.
Could we defer the "Warning" to the caller. i.e., Let the caller
figure out the if the DSB size is found and predicate that on the
DSB support on the TPDM.

Suzuki

> 
> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 0633f04beb24..333b3cb23685 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
> +		if (rc)
> +			goto out;
>   	}
>   
>   	if (tpdm_data->cmb) {
> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
>   
> +out:
>   	if (rc)
>   		dev_warn_once(&csdev->dev,
>   			"Failed to read TPDM Element size: %d\n", rc);


