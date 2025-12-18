Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F919D68BDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 06:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHELJkiwO5DJ1E79hwURyIqaqyuI3uk4+oYUYY0KnPE=; b=p91mHb7bZe/tSrLRAC6BrmZ1pH
	fDFmorV4RuHQyeUezrH7gH3/DuA4+UTPHEpXECyk74nFfz2HAQaH0NLv51k8NBAC/lgBCX1V6zcdx
	sPZfNC+FyjcgqSQgYjQPIJNr8LhaNXdpvAfU5UEKeMcpARXNCO9s/6XOZYPEjbOUp3K2CvXuvNv3w
	hZ1iC24m3+XN+xC18JdfRxs0RMG4QuQThPQ9CzV46XP7cBjFCc50pzCOYt8O0KNnx0DI+lxbnc5BR
	aW9rrsgiGik9GdW2AXFKn2wcMHLNVGAYZEUIrdMGBNt/QzThUIKMCtup1B05Qp9mveDEhpaxxvGAS
	I8l2IWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Ph-00000007tHR-1bYF;
	Thu, 18 Dec 2025 06:23:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW7Pe-00000007tGm-1kDZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 06:22:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI3agmd754680
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 06:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eHELJkiwO5DJ1E79hwURyIqaqyuI3uk4+oYUYY0KnPE=; b=P2FyFvIgZjapmh1z
	pQoDSCOVKGUS7ylPyqIW/HQ8TTt1gRVwO4Nf8zetl9zIAaAvHr0a9ajQUdI+iqiP
	mvZzBzwiVDlWNw3eX8llzJ0HZjQP/7P2oi90P8zScyLe/4AG8SxoH97/Dwyj5DPd
	cL8ai0Kt37QyBRo9ZhZsxXt1rdubr2ffWLbtIzVYskcp6BOwczhGZfhA4BUixXoK
	jjIz6AcmOGSUA2rSgxbo0BAekgSMJr6zeH1sanHqfA5+s0dwHxrp9QvLEMmh6dEz
	Qrzls1MIr6YfMkRk8Su6H2CnHElRJrtIvPb/ySxtzyIhe20SjV3eWPBG0ItqB0Vw
	OFFY5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0rd3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 06:22:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so7602645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 22:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766038975; x=1766643775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHELJkiwO5DJ1E79hwURyIqaqyuI3uk4+oYUYY0KnPE=;
        b=ZonybJyWi6vfaWeKqLuKdBsdr3iJepTvPH0xGkeadMv2UaPRq7j9BAIbfxd50OQH5T
         LS6a+RwZV93Av48L73EWIHa4PmT/ZFwtjsWOvs71hsPksXuCnSHU1GIm3MkzdhyBVNra
         aEp4Flv1jMj/OJLtHgcN/Gvc+rxMzGxYyak8GD8HPtXs6TRiUpYhCcAGMZqNdGFDxLjW
         Swm3m2/FiwCLLw1QLWwNNhOu92Uo/hQYlX27GiI9HkQu20xTMA5UmYTqpgLMg0RT41hp
         k/flXsAC6VF7SaZeFcKlajZBdYC8H5dx3XEuZizIhYn5up9LHh/IEPXhATw+wnwZbj1j
         nrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766038975; x=1766643775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHELJkiwO5DJ1E79hwURyIqaqyuI3uk4+oYUYY0KnPE=;
        b=Uz9JLPIyFlt7UOqp4r7U6HNdh0FhLpwGsIn+bf0k85JXxPSxs6XZy4k8AgWmyid2QL
         qkV6r26PJzfWPzhqQdMv1RTfU5atiEueVSBEzYEbF+V3xNTqEa09KZjoN7tT9XXamFBE
         7/P+4K+jH+oe7w6dUUuCT7F4aRX/DeyS2AjyRsrSvAMjFv2TCMTcfuzyX9l2kWcPAjqf
         htMBqXNHvWWcQMRxolxV2SFrHNJiZTviPO2YSwO95/h0xKNsCir7kWU+4K4VXds2my3Z
         FwfZYQtDgHvkJolPxImuc9TardyEg1vV6X8sOwsnK2nnwXALQfkRnLqnZmxFCvI754La
         0okw==
X-Forwarded-Encrypted: i=1; AJvYcCWvDqz1SjZ1sctROpxMCLddij2dFNWRXWgMHc50G6h0myoEiNTMv7i6o4z4E/mYXlklqVcdGsSqtSpiiisVYv+G@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3TX5i/HCiW+vkOPg4n5IoAnORXyZKKOqIBMIFXOMwwbyPcLk
	Ejh5dwe2jcfjSE7oVgRRsIk/AU43OpFdNGxyow2LS+gYLBwnQ6nuwac/+Ykj4HYgCgCnHITC276
	qc9MxcIcCWFcFVUZD38ylIriTb3GOXZf+r610IXv5X1ELyozX+zHsPnnnIY7zIUJqf7mAaP/pJQ
	6FpA==
X-Gm-Gg: AY/fxX45szhi5h2Ho1hv2tYjZOkwPyG5shy8zTQxZPzl0mCau4Zdk5ORedtl1pMGAwS
	vmbZh3/zYWF76r8kAxE0PIRLcq+I3H/0WnlVudcw651z0LrOE5144xPxl6v8epSCHmWbe7iXwsG
	yThLp1mRpVk/H9II2A6KeY/mTP6FKi5L3C7GMTznBicz3f+eIiiBIf4qr9mywhtKN2wVjGOlPfp
	udch1EiU7nRUp7lxjMotoSSfVc+B2WyenK+mvo4Wt2TPB/L6On+NEC3fioXJBwmrCQkgFJJiVmx
	AKnh6ndXh3esLypMWidnLU/Ck/Tfy3l7JJ+5x6wLOQ5pThp6mQL2Ks+FgOyxg+21jqaMRttQIci
	luKVVn0rw5tBSpxKIJC7jksX20FJWryBhgWeMyDr6MPJi0OVDiaDFYsx8LhKyvNqqNeo1Y/8o0u
	I=
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr208205785ad.5.1766038975445;
        Wed, 17 Dec 2025 22:22:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+FyM7wBk/VF56wDLrIHrbG+1Bc/PNe0xTLbeKo9ADwAsOvz7b6r6pc62boctM0Ir24GZAEg==
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr208205585ad.5.1766038974867;
        Wed, 17 Dec 2025 22:22:54 -0800 (PST)
Received: from [10.133.33.162] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d1612698sm12452575ad.47.2025.12.17.22.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 22:22:54 -0800 (PST)
Message-ID: <ea84b279-8d55-4707-b6cf-85006da27456@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:22:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
 <20251028-configure_tpda_reg-v4-1-23000805d21d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251028-configure_tpda_reg-v4-1-23000805d21d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JfawHk7SWb4S-v5wX95o9QmaniAnGkT2
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=69439dc0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=vt1N-9ERMdqQCVxgAxwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JfawHk7SWb4S-v5wX95o9QmaniAnGkT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1MCBTYWx0ZWRfX5WaP/0gLGYdM
 8snK2hIAiMDZQYtD0h7VJluSFekCXHs8InhhjFFJmNMZ9DyDQb3Qi2gId/b9MzsRWEt8nOEnwg/
 fUuYN7iVQHY0jotLrT4Ih1WEtcAvHDEBtjHzkWnZIj9NIm9QI3lub+D3LecaEQX8XdWkmmOAfO/
 0zdmTJWDpJksm30hCZoDD4gXp3HjbBRg92QEvR5t6UXvI6ALBCOO7Ny0r3OmRrE2UBTHphQgvlb
 HFKImKsHqa1pwpLDhM+1BMe2yfZ37zymoK2sdOd+f7lXVBX3ovZKD/Mr8IimLtL1zjEEHYq+0OB
 wd9t3URQkne39so0+XXMqdRQQn3kfvySZKAReq3GssE7sMpZN1zJ+4kKYNcVq3j8Dw79ZBqqcCQ
 1/qXi/tq/IjqXpBmcRhHbAGnVGtImg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_222258_587291_79BF8908 
X-CRM114-Status: GOOD (  26.00  )
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



On 10/28/2025 10:02 AM, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
> These registers define the characteristics of cross-trigger packets,
> including generation frequency and flag values.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c       | 230 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h       |  27 ++-
>   3 files changed, 299 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> new file mode 100644
> index 000000000000..80e4b05a1ab4
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

Gentle reminder.

Do I need update the date and the kernelVersion of the sysfs 
node?(target 7.0?)

Thanks,
Jie


> @@ -0,0 +1,43 @@
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
> +Date:		October 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger synchronization sequence interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
> +Date:		October 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FLAG packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
> +Date:		October 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable cross trigger FREQ packet request interface.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
> +Date:		October 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Enable/disable the timestamp for all FREQ packets.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
> +Date:		October 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Set global (all ports) flush request bit. The bit remains set until a
> +		global flush request sequence completes.
> +
> +What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
> +Date:		October 2025
> +KernelVersion:	6.19
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
> +Description:
> +		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
> +		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 333b3cb23685..a9a27bcc65a1 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -147,9 +147,37 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>   	u32 val;
>   
>   	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	val &= ~TPDA_CR_MID;
>   	val &= ~TPDA_CR_ATID;
>   	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
> +	if (drvdata->trig_async)
> +		val |= TPDA_CR_SRIE;
> +	else
> +		val &= ~TPDA_CR_SRIE;
> +	if (drvdata->trig_flag_ts)
> +		val |= TPDA_CR_FLRIE;
> +	else
> +		val &= ~TPDA_CR_FLRIE;
> +	if (drvdata->trig_freq)
> +		val |= TPDA_CR_FRIE;
> +	else
> +		val &= ~TPDA_CR_FRIE;
> +	if (drvdata->freq_ts)
> +		val |= TPDA_CR_FREQTS;
> +	else
> +		val &= ~TPDA_CR_FREQTS;
> +	if (drvdata->cmbchan_mode)
> +		val |= TPDA_CR_CMBCHANMODE;
> +	else
> +		val &= ~TPDA_CR_CMBCHANMODE;
>   	writel_relaxed(val, drvdata->base + TPDA_CR);
> +
> +	/*
> +	 * If FLRIE bit is set, set the master and channel
> +	 * id as zero
> +	 */
> +	if (drvdata->trig_flag_ts)
> +		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>   }
>   
>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
> @@ -265,6 +293,206 @@ static const struct coresight_ops tpda_cs_ops = {
>   	.link_ops	= &tpda_link_ops,
>   };
>   
> +static ssize_t trig_async_enable_show(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
> +}
> +
> +static ssize_t trig_async_enable_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf,
> +				       size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->trig_async = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_async_enable);
> +
> +static ssize_t trig_flag_ts_enable_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
> +}
> +
> +static ssize_t trig_flag_ts_enable_store(struct device *dev,
> +					 struct device_attribute *attr,
> +					 const char *buf,
> +					 size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->trig_flag_ts = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_flag_ts_enable);
> +
> +static ssize_t trig_freq_enable_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
> +}
> +
> +static ssize_t trig_freq_enable_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->trig_freq = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(trig_freq_enable);
> +
> +static ssize_t freq_ts_enable_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
> +}
> +
> +static ssize_t freq_ts_enable_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf,
> +				    size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->freq_ts = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(freq_ts_enable);
> +
> +static ssize_t global_flush_req_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (!drvdata->csdev->refcnt)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	CS_LOCK(drvdata->base);
> +	/* Only read value for bit 0 */
> +	val &= BIT(0);
> +
> +	return sysfs_emit(buf, "%lu\n", val);
> +}
> +
> +static ssize_t global_flush_req_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf,
> +				      size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (!drvdata->csdev->refcnt || !val)
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	CS_UNLOCK(drvdata->base);
> +	val = readl_relaxed(drvdata->base + TPDA_CR);
> +	/* Only set bit 0 */
> +	val |= BIT(0);
> +	writel_relaxed(val, drvdata->base + TPDA_CR);
> +	CS_LOCK(drvdata->base);
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(global_flush_req);
> +
> +static ssize_t cmbchan_mode_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +
> +	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
> +}
> +
> +static ssize_t cmbchan_mode_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf,
> +				  size_t size)
> +{
> +	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	guard(spinlock)(&drvdata->spinlock);
> +	drvdata->cmbchan_mode = !!val;
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RW(cmbchan_mode);
> +
> +static struct attribute *tpda_attrs[] = {
> +	&dev_attr_trig_async_enable.attr,
> +	&dev_attr_trig_flag_ts_enable.attr,
> +	&dev_attr_trig_freq_enable.attr,
> +	&dev_attr_freq_ts_enable.attr,
> +	&dev_attr_global_flush_req.attr,
> +	&dev_attr_cmbchan_mode.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group tpda_attr_grp = {
> +	.attrs = tpda_attrs,
> +};
> +
> +static const struct attribute_group *tpda_attr_grps[] = {
> +	&tpda_attr_grp,
> +	NULL,
> +};
> +
>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   {
>   	int atid;
> @@ -280,6 +508,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>   		return atid;
>   
>   	drvdata->atid = atid;
> +	drvdata->freq_ts = true;
>   	return 0;
>   }
>   
> @@ -323,6 +552,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
>   	desc.ops = &tpda_cs_ops;
>   	desc.pdata = adev->dev.platform_data;
>   	desc.dev = &adev->dev;
> +	desc.groups = tpda_attr_grps;
>   	desc.access = CSDEV_ACCESS_IOMEM(base);
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev))
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
> index c6af3d2da3ef..0be625fb52fd 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.h
> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
>   #ifndef _CORESIGHT_CORESIGHT_TPDA_H
> @@ -8,6 +8,19 @@
>   
>   #define TPDA_CR			(0x000)
>   #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
> +#define TPDA_FPID_CR		(0x084)
> +
> +/* Cross trigger FREQ packets timestamp bit */
> +#define TPDA_CR_FREQTS		BIT(2)
> +/* Cross trigger FREQ packet request bit */
> +#define TPDA_CR_FRIE		BIT(3)
> +/* Cross trigger FLAG packet request interface bit */
> +#define TPDA_CR_FLRIE		BIT(4)
> +/* Cross trigger synchronization bit */
> +#define TPDA_CR_SRIE		BIT(5)
> +/* Packetize CMB/MCMB traffic bit */
> +#define TPDA_CR_CMBCHANMODE	BIT(20)
> +
>   /* Aggregator port enable bit */
>   #define TPDA_Pn_CR_ENA		BIT(0)
>   /* Aggregator port CMB data set element size bit */
> @@ -19,6 +32,8 @@
>   
>   /* Bits 6 ~ 12 is for atid value */
>   #define TPDA_CR_ATID		GENMASK(12, 6)
> +/* Bits 13 ~ 19 is for mid value */
> +#define TPDA_CR_MID		GENMASK(19, 13)
>   
>   /**
>    * struct tpda_drvdata - specifics associated to an TPDA component
> @@ -29,6 +44,11 @@
>    * @enable:     enable status of the component.
>    * @dsb_esize   Record the DSB element size.
>    * @cmb_esize   Record the CMB element size.
> + * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
> + * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
> + * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>    */
>   struct tpda_drvdata {
>   	void __iomem		*base;
> @@ -38,6 +58,11 @@ struct tpda_drvdata {
>   	u8			atid;
>   	u32			dsb_esize;
>   	u32			cmb_esize;
> +	bool			trig_async;
> +	bool			trig_flag_ts;
> +	bool			trig_freq;
> +	bool			freq_ts;
> +	bool			cmbchan_mode;
>   };
>   
>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
> 


