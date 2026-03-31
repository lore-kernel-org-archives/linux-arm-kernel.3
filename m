Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E073FF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzN1Up3fqWbxCFKWrOl1SwoVlfS9THjfdjJdTAATjaw=; b=OLbqhxg/cQ26yFCxofo9JlTMC8
	0FEBvC2wdv8VQizXI4Fh6QC3c3z9aZ5Kith2YBz7uVqTkfCpKqkaHHnbFlRdQyyPiWgY6BgIv4/C7
	j2KnmUSJ6bEWXS9HOvv/DsdCikF3sqKcsRRvx72w26MjmVdNsyu6KhvVcOMyBOkB+ebP5UiZZK7R5
	kjaMI+e74PfStQZ0vj5V69aezf9vQl/H/uVYuOwQw0py7nFp+6nsTDoc5KKqsbl6NUrldH8LKDBGl
	G9TVdRwQeV5XBHaxNbhHMaDWyOUOsAATCoXhYeQfDOfF2RhN7GzUFxE4RzMczWBmSeLfMo0/8rebI
	fQyvd+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W3o-0000000CkKE-3tXI;
	Tue, 31 Mar 2026 10:11:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W3k-0000000CkJ3-2X8t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:10:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cfce3a195so1236099f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774951854; x=1775556654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzN1Up3fqWbxCFKWrOl1SwoVlfS9THjfdjJdTAATjaw=;
        b=mqYPEhpmdKeSHE1SGmZdJscN+5I7SDSeiQo2RUN9lb4d6NnYAWQxmr2lFKsa98PmKY
         GBuZSvxhPVX/YmcwxKpzRwof6r1Qm/Neoz/aBgwghDvEDDiMNsKm21tmhx3Raog7NEz+
         GLhHrKkQoc7tmg82VVVLiQJelIkNSvBgOAl39/SL2HXMcvwpxR1u0WcYcmZZdb/ijfpq
         CEzDMRF0BIK2poTWV372a4QpaNfZAO5d3KvqnQzxAIJaqdKhFKRRy3/cxF2vAaVysi60
         l0Z5sAb6hrCxUDHJ4ZjB+Xv6JjwAKNnvlgqJ+yVPqsMV4DusIzGCDGWFSNx3K8UVYsZ2
         pFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774951854; x=1775556654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzN1Up3fqWbxCFKWrOl1SwoVlfS9THjfdjJdTAATjaw=;
        b=B/IGSWBSM2BUYON/MVok1JF0yIERzO+d9c2WWBF65gj2vawCMgRGlosdNxtWgCxTt6
         sufcVYmyOeAz7vUKlklxaN86TPq3T+X/4HmL5xcMWg9j253XmQbHbml1+tEUz4jAnw3d
         Q8O1GdGb84Pz1qmFqZabckrcioSH4pMbmPZ2mLeEo/O052prLztX7XFRUrjOfPu8vDCs
         IXsca3/oWze5r/E8TCjdFmD+XftGsUUYeRM6F9n6ieyj7frlSogcyLMVsBJkT8iMNnQA
         imNF34HVCgivdLEEaRFLgubW5G6TFERsPEbJQPxIieLJ2AKI7rOFqccL4cyuKo1d9X6x
         o5yg==
X-Forwarded-Encrypted: i=1; AJvYcCUdKCSEmmaAA0giWZpCsZobTNJdCtINo5aCGhChpEGaTxtJdH/Yxrlmzk5HcgSu9yLFKmafTIiGEuciDfgQjYs8@lists.infradead.org
X-Gm-Message-State: AOJu0YzjivQWM5blbxCy8dy1MXJmPzq1WOlu9BDdka/4r+aAAmGdGGtk
	h1KuCmnAjIxC5w9lYsC4I0s059+m/B8YI99hDrUD59FXDL6s63PBvF/GCK4viVABmg1ViVZGpBg
	BBYK+qlU=
X-Gm-Gg: ATEYQzzz2cMgvLfTKXj6QW9sNFe/YL8DBMPdPms/YU2XrKOurmTfkOHELkAgYoPK4ia
	FNZMZyNNJADBtcg99+XumvuFRsCfYumWgjTuYxTWGGwDKnVXq8SfRBaeqXKnjydiHbzMjzN/OIv
	jhWbxw+wuUaTCCkPTy+7xTqyeVwHUPjiJvO0GLY7HCrQhkrN7OXAB8rwqgb4/DjJmcUy4IOO1f9
	C0GHwrCFn/oVnISQjrjCro896ch+7SveCNEmYYq462XTYuMXbnykITRLBi/HQi/cxOK6sEeEozd
	C1gyAWghji9oCP11rwp9C6c6EcWMG5H1+PKyyZ9BcB2Q54LTmKK9Ppc2j/gxykxEdSbwhEW/Zpp
	fOkpi1s42H0OjsiJA+pX5c/zAYph1X/OhdktDL7JU3HIQGbGP4KS6WZ9YuqXdpuX+6GXlOHg7BR
	zbr/I/5twrog1g4Cdyz/konWmAv2oc
X-Received: by 2002:a05:6000:290a:b0:43c:ffcc:b682 with SMTP id ffacd0b85a97d-43cffccb8bcmr10943998f8f.33.1774951854536;
        Tue, 31 Mar 2026 03:10:54 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2580168sm26662371f8f.36.2026.03.31.03.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:10:54 -0700 (PDT)
Message-ID: <fa47405f-36c0-4ac1-915b-6d3e05502dd1@linaro.org>
Date: Tue, 31 Mar 2026 11:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] coresight: tpdm: add traceid_show for checking traceid
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mao Jinlong <quic_jinlmao@quicinc.com>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20260331-add-traceid-show-for-tpdm-v4-1-ed3dda24a562@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260331-add-traceid-show-for-tpdm-v4-1-ed3dda24a562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031056_684604_1BF9DD2C 
X-CRM114-Status: GOOD (  28.26  )
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



On 31/03/2026 11:05 am, Jie Gan wrote:
> Save the trace ID in drvdata during TPDM enablement and expose it
> to userspace to support trace data parsing.
> 
> The TPDM device’s trace ID corresponds to the trace ID allocated
> to the connected TPDA device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Changes in v4:
> 1. Return -EINVAL if the traceid is 0.
> - Link to v3: https://lore.kernel.org/r/20260325-add-traceid-show-for-tpdm-v3-1-0eb836d4ec30@oss.qualcomm.com
> 
> Changes in v3:
> 1. Only allow user to read the traceid while the TPDM device is enabled.
> - Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com
> 
> Changes in V2:
> 1. Use sysfs_emit instead of sprintf.
> Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show-for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-tpdm   | 10 +++++++
>   drivers/hwtracing/coresight/coresight-tpdm.c       | 34 +++++++++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tpdm.h       |  2 ++
>   3 files changed, 45 insertions(+), 1 deletion(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>

> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> index f8016df64532..bc36ba32c900 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpdm
> @@ -278,3 +278,13 @@ Date:           Aug 2025
>   KernelVersion   6.18
>   Contact:        Mao Jinlong <quic_jinlmao@quicinc.com>
>   Description:    (Read) Show hardware context information of device.
> +
> +What:		/sys/bus/coresight/devices/<tpdm-name>/traceid
> +Date:		March 2026
> +KernelVersion:	7.1
> +Contact:	Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(R) Show the trace ID that will appear in the trace stream
> +		coming from this TPDM. The trace ID is inherited from the
> +		connected TPDA device and is fixed for the lifetime of the
> +		device. Returns -EINVAL if the device has not been enabled yet.
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index da77bdaad0a4..9b16f368a58b 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
>   
>   static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>   		       enum cs_mode mode,
> -		       __maybe_unused struct coresight_path *path)
> +		       struct coresight_path *path)
>   {
>   	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>   
> @@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
>   	}
>   
>   	__tpdm_enable(drvdata);
> +	drvdata->traceid = path->trace_id;
>   	drvdata->enable = true;
>   	spin_unlock(&drvdata->spinlock);
>   
> @@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
>   	.attrs = tpdm_attrs,
>   };
>   
> +static ssize_t traceid_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	unsigned long val;
> +	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	val = drvdata->traceid;
> +	if (!val)
> +		return -EINVAL;
> +
> +	return sysfs_emit(buf, "%#lx\n", val);
> +}
> +static DEVICE_ATTR_RO(traceid);
> +
> +static struct attribute *traceid_attrs[] = {
> +	&dev_attr_traceid.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group traceid_attr_grp = {
> +	.attrs = traceid_attrs,
> +};
> +
>   static ssize_t dsb_mode_show(struct device *dev,
>   			     struct device_attribute *attr,
>   			     char *buf)
> @@ -1367,6 +1391,12 @@ static const struct attribute_group *tpdm_attr_grps[] = {
>   	&tpdm_cmb_patt_grp,
>   	&tpdm_cmb_msr_grp,
>   	&tpdm_mcmb_attr_grp,
> +	&traceid_attr_grp,
> +	NULL,
> +};
> +
> +static const struct attribute_group *static_tpdm_attr_grps[] = {
> +	&traceid_attr_grp,
>   	NULL,
>   };
>   
> @@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
>   	if (res)
>   		desc.groups = tpdm_attr_grps;
> +	else
> +		desc.groups = static_tpdm_attr_grps;
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
>   		return PTR_ERR(drvdata->csdev);
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
> index 2867f3ab8186..11da64e1ade8 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.h
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.h
> @@ -300,6 +300,7 @@ struct cmb_dataset {
>    * @cmb         Specifics associated to TPDM CMB.
>    * @dsb_msr_num Number of MSR supported by DSB TPDM
>    * @cmb_msr_num Number of MSR supported by CMB TPDM
> + * @traceid	Trace ID of the path.
>    */
>   
>   struct tpdm_drvdata {
> @@ -313,6 +314,7 @@ struct tpdm_drvdata {
>   	struct cmb_dataset	*cmb;
>   	u32			dsb_msr_num;
>   	u32			cmb_msr_num;
> +	u8			traceid;
>   };
>   
>   /* Enumerate members of various datasets */
> 
> ---
> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00
> 
> Best regards,


