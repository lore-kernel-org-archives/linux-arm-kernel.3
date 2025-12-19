Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4D6D78763
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8ie7qRXSv1sYZJUe4zmLlAP0vesXgb1+cNig60wBoU=; b=y/4djsdYD0oSvpagVlNqKSgwb7
	AT+l1yFk/E652zGyz0eonVJr3FAEZgVmi5T942rM+ckmIrc/3arwIg4h37QtGd1yTF0RaAc1Yawd3
	QsRlm8VsOBQ7+KUF9QpgiEx0rF3DNOv7NbhRDLAkW4FDvs+bXbNPYAZF3KEpeaje+ZarskvbknRF3
	bw8Xcpj3cGUK/tg1+crSy7MaZQtdrAqfJhaNDWv3kVGZarq9R8KlgarX+PPTGe5MLKaY5f8rL+7Fr
	5VlzLiMjTYWsoJQkIVDoze3rytEDDtZk53dxqw3uOUn5+S/a8pUH7j+7oHthJfmDlYXqrFoyKwO2p
	S78PgoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZSY-0000000AHGB-3PEx;
	Fri, 19 Dec 2025 12:19:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZSP-0000000AHE1-0Toa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 12:19:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB7LqV4154543
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8ie7qRXSv1sYZJUe4zmLlAP0vesXgb1+cNig60wBoU=; b=Fk/i0G9optb2fa2F
	aRsr9yQ66G5Avrq/OpTuQE9i3ArWRiKBMoYY8okR0YdBPZh8YBtPKG1VTysInz+j
	Ga8z1FBBDEWh/jyO/4gaVwIjoaoa12JQ63MRTRJxkwYS16A0XJ3GqzgkQXhoc2f4
	UKZJ62hhxkvzPAUoBInMbzhtplmfRLov1VuD4hN+24uQXgNW8Ft59qL+0b6ifpaT
	xnpkR6yvjZzCgaifUD1SbNPWGZIIFPWYJvG69GUnKSMp7sUfWdOzZ+AtS/N3MlsI
	PE3b98xpXPiJ7dH7jlpgKbEDqlVRA4Xwi6yQO2InpKdP3i4gwsfpJNoQScVCeW7A
	TSXFwQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ctmrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 12:19:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so3966057a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 04:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766146779; x=1766751579; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8ie7qRXSv1sYZJUe4zmLlAP0vesXgb1+cNig60wBoU=;
        b=POJQx7pwalJ7lIo3A/Pmvb196gJ1WU7oDlILbLRsFBYetIdKV0UVkxdXRKLfPZQgBr
         gLJtrM8VKD0sOBz0uinknT/ALdFxbDeskPn5jKlQpUIPEu9hAKkT16pab45deZigAuML
         SDBtahigEBwz5Q9W+k3zLLmTJPKlvkb/JPggeYyPWQI2eeMXui1/mBFY07ALDoDbEiPG
         t3XCiQi7xMg3XMnDtxT575jWIzKQsnLodWnrLFW+vagc8iXfwu2aJRV9pEp3uc6Py0Nh
         Lut3DP7ygdNvX97x84klrFYWRxHdsXym6qU+EAttzMDp3hbKj/l9IlZGOMg5T15K0tfe
         EVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766146779; x=1766751579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8ie7qRXSv1sYZJUe4zmLlAP0vesXgb1+cNig60wBoU=;
        b=it5ggoMGeTHfzG7H7gLvMsJWzwVG066RzJ+h798s1Vdfx08iN4UyGhmEESN70y1KZs
         KTtbNAq9C0hb/HpPKrdZ3Sr6QsOAUxJ6kl3DGztuovz4tBXQO8CG1L6+QTq+f0zhc2wQ
         I4ScFmjgI8fmpX9q4Yp65NJkPwzu4QI73O1u8ZG/zK0R8d3nSb9aCsVOHGtDumLe0eY9
         8Un9auiJulENZM3YuzPW1za4pxUY9vXeF7LdkAUb+ACdkKXvCSOpeXuRbWxZFIntGPUY
         DIqePCCHozpYi6nn1LWvaTrgcyA06fC5GEy8Fn5vDPdN2qO2Ez42Sw+nGHSCwAUPfkbK
         PrOw==
X-Forwarded-Encrypted: i=1; AJvYcCXiJUCIuctU+sNobmLVG7ObRRv1yhl7eNtkSRR2PW2VCwY04xW7AHn1r1lIdZQFNEES6rmZqQyl/oESllh/IN6k@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+b6D38dcF63xu7KPkfXc/8PjZliDZcskIRsw+7xw/Lo0Ifktr
	XehUUakfRUfoX4zj1Y49J9gX4sPupMkWa+DA/t8eDiLyWWWmq/Hiu7XL/MMiwpuaXIgKn3eH5k9
	tdY9+HkcJdTeZNr5HHmpUmH68++Ngqw37zKFAUyPzq6QPwrPjJwdBicOXr9bU+7wRI8Ejcbxfj5
	KOzA==
X-Gm-Gg: AY/fxX6lEZ3UTcxHTnPNQl3MyYgvwfp2m0Nx1+0UVMsKvIbpS1XebosMOimIa2CqEMp
	HoDZXZ6nNaNIu1X6OzoCbPqxoiYA2R3PaudUzqnyKvnW0muc4o7xWhfAY6QYE20NqfxNy6Jsyu6
	bmpBc7nxYSYW0WeiHqCVFL1nEosUt2Uq4gVLWQzo7r0bj8jsInQDOn+E96rjUxJ29VWrzFtVLsC
	hZgvjsmsZHJ7nvRQKzHAZKU+xFGjDCau/cXMolViEDZEY3+MXplUUsG+7woF1LAQatiuU+6ocxl
	PUMxNn+kzIXaOGMpfNCFwjvxTvob6tpyZmQpgylPGpBUNiI9yB5YCaZqaneTm5NdXw7SdZAmoiZ
	5trmtdUZTeLeoq1+NdKkui3bNKtKsXBSwio/IOYnxzj8gHQG3qsWSrHhXnkiApGf5eYT7MlMBQL
	M=
X-Received: by 2002:a17:90b:3142:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-34e92142ba3mr2363819a91.12.1766146778867;
        Fri, 19 Dec 2025 04:19:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXRieKP8HYsQLwYG31Vzxf0EkjIgG+DCRb1+EQMc/g7tO0OrvHjl3zDTzRzI7WsUoInHOg/g==
X-Received: by 2002:a17:90b:3142:b0:34c:f5b5:c1b6 with SMTP id 98e67ed59e1d1-34e92142ba3mr2363795a91.12.1766146778288;
        Fri, 19 Dec 2025 04:19:38 -0800 (PST)
Received: from [10.133.33.111] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c147943sm2039789a12.26.2025.12.19.04.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 04:19:37 -0800 (PST)
Message-ID: <832fb36e-35e4-4c73-b32c-ee77489db951@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 20:19:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tao Zhang <tao.zhang@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
 <20251219-add_sysfs_nodes_to_configure_tpda-v5-1-ca93ddfe9d30@oss.qualcomm.com>
 <afc078d5-5855-4439-98ac-c132a2588627@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <afc078d5-5855-4439-98ac-c132a2588627@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WuuTG3mJppJPg0qqkdd_lFZos4W0vLR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEwMiBTYWx0ZWRfX4wzX9oZ1ywv+
 Q/hLG8N6+uXtC1OKCEWlSb3CFNaz0ufCBO2wE9IFn0PvUDI1zx6679CGCE6cYig8m2RIYyecCDe
 Kl5MtTIxspQHswNg0PI7B79ED9EIUAvPFVdRlLzal0koklAikauzq9zdCy9DfnqSv5tfcU1moXn
 SwSVGKHBZkeElah2EtE+BUC4itNayfnNra4en08a8XaqMxeR5njkgMKRsh8U44b9pEBhHIb7wHo
 DAZwoP63LzJWRa87o71zs+emMT8h+HavIx637Bz/NYF/rGgRqeB2knMrx3WwQMd2O8U+aHTTMKy
 woECbZYyEi2B1UahAAatH5Quwb6wujxDvnAt2m5V165XzEtik0ssES4MGYz0aicNfYDUNPT8yET
 75UzX7aHAgPSXj1cRi43/c5DL9bwnmgl5oMAGmk7VMjEa7cDqoJUIjUmr2pFiGiimhXB637wHuu
 Jq/FB0aVmLCchZ4BJwg==
X-Proofpoint-ORIG-GUID: WuuTG3mJppJPg0qqkdd_lFZos4W0vLR4
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=694542dc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=_uz3lYCekpwsQ1Z5yrUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_041941_165744_0A222816 
X-CRM114-Status: GOOD (  24.10  )
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



On 12/19/2025 6:22 PM, Suzuki K Poulose wrote:
> On 19/12/2025 10:04, Jie Gan wrote:
>> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
>>
>> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
>> These registers define the characteristics of cross-trigger packets,
>> including generation frequency and flag values.
>>
>> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
>> Reviewed-by: James Clark <james.clark@linaro.org>
>> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 +++++++
>>   drivers/hwtracing/coresight/coresight-tpda.c       | 138 +++++++++++ 
>> +++++++++-
>>   drivers/hwtracing/coresight/coresight-tpda.h       |  69 ++++++++++-
>>   3 files changed, 243 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices- 
>> tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> new file mode 100644
>> index 000000000000..a7855922328e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
>> @@ -0,0 +1,43 @@
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_cr/ 
>> trig_async_enable
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger synchronization sequence 
>> interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_cr/ 
>> trig_flag_ts_enable
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FLAG packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_cr/ 
>> trig_freq_enable
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable cross trigger FREQ packet request interface.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_cr/ 
>> freq_ts_enable
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Enable/disable the timestamp for all FREQ packets.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_cr/ 
>> global_flush_req
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Set global (all ports) flush request bit. The bit 
>> remains set until a
>> +        global flush request sequence completes.
>> +
>> +What:        /sys/bus/coresight/devices/<tpda-name>/global_cr/ 
>> cmbchan_mode
>> +Date:        December 2025
>> +KernelVersion:    6.19
>> +Contact:    Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang 
>> <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:
>> +        (RW) Configure the CMB/MCMB channel mode for all enabled ports.
>> +        Value 0 means raw channel mapping mode. Value 1 means channel 
>> pair marking mode.
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/ 
>> hwtracing/coresight/coresight-tpda.c
>> index 3a3825d27f86..d25a8bcfb3d4 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
>> @@ -137,12 +137,32 @@ static int tpda_get_element_size(struct 
>> tpda_drvdata *drvdata,
>>   /* Settings pre enabling port control register */
>>   static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
>>   {
>> -    u32 val;
>> +    u32 val = 0;
>> -    val = readl_relaxed(drvdata->base + TPDA_CR);
>> -    val &= ~TPDA_CR_ATID;
>>       val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
>> +    if (drvdata->trig_async)
>> +        val |= TPDA_CR_SRIE;
>> +
>> +    if (drvdata->trig_flag_ts)
>> +        val |= TPDA_CR_FLRIE;
>> +
>> +    if (drvdata->trig_freq)
>> +        val |= TPDA_CR_FRIE;
>> +
>> +    if (drvdata->freq_ts)
>> +        val |= TPDA_CR_FREQTS;
>> +
>> +    if (drvdata->cmbchan_mode)
>> +        val |= TPDA_CR_CMBCHANMODE;
>> +
>>       writel_relaxed(val, drvdata->base + TPDA_CR);
>> +
>> +    /*
>> +     * If FLRIE bit is set, set the master and channel
>> +     * id as zero
>> +     */
>> +    if (drvdata->trig_flag_ts)
>> +        writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
>>   }
>>   static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
>> @@ -258,6 +278,116 @@ static const struct coresight_ops tpda_cs_ops = {
>>       .link_ops    = &tpda_link_ops,
>>   };
>> +/* Read cross-trigger register member */
>> +static ssize_t tpda_trig_sysfs_show(struct device *dev,
>> +                    struct device_attribute *attr,
>> +                    char *buf)
>> +{
>> +    struct tpda_trig_sysfs_attribute *tpda_attr =
>> +        container_of(attr, struct tpda_trig_sysfs_attribute, attr);
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    unsigned long val;
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    switch (tpda_attr->mem) {
>> +    case FLREQ:
>> +        if (!drvdata->csdev->refcnt)
>> +            return -EINVAL;
>> +
>> +        val = readl_relaxed(drvdata->base + TPDA_CR);
>> +        /* read global flush request bit only */
>> +        val &= TPDA_CR_FLREQ;
>> +        return sysfs_emit(buf, "%lu\n", val);
>> +    case FREQTS:
>> +        return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
>> +    case FRIE:
>> +        return sysfs_emit(buf, "%u\n", (unsigned int)drvdata- 
>> >trig_freq);
>> +    case FLRIE:
>> +        return sysfs_emit(buf, "%u\n", (unsigned int)drvdata- 
>> >trig_flag_ts);
>> +    case SRIE:
>> +        return sysfs_emit(buf, "%u\n", (unsigned int)drvdata- 
>> >trig_async);
>> +    case CMBCHANMODE:
>> +        return sysfs_emit(buf, "%u\n", (unsigned int)drvdata- 
>> >cmbchan_mode);
>> +
>> +    }
>> +    return -EINVAL;
>> +}
>> +
>> +static ssize_t tpda_trig_sysfs_store(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     const char *buf,
>> +                     size_t size)
>> +{
>> +    struct tpda_trig_sysfs_attribute *tpda_attr =
>> +        container_of(attr, struct tpda_trig_sysfs_attribute, attr);
>> +    struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +    ssize_t ret = -EINVAL;
>    +    unsigned long val;
>> +
>> +    if (kstrtoul(buf, 0, &val))
>> +        return ret;
> 
>          return -EINVAL;
> 
>> +
>> +    guard(spinlock)(&drvdata->spinlock);
>> +    switch (tpda_attr->mem) {
>> +    case FLREQ:
>> +        if (!drvdata->csdev->refcnt || !val)
>> +            return ret;
>              return -EINVAL;
> 
>> +
>> +        val = readl_relaxed(drvdata->base + TPDA_CR);
> 
> CS_UNLOCK before readl ? I didn't mean the global_flush_req to be
> unified with the rest. Obviously it has different access semantics.

We dont need CS_UNLOCK for reading a register.

The global_flush_req is supposing access when the tpda is enabled. I 
will put it in a separate patch with detail description.

> 
> 
>> +        /* set global flush request bit */
>> +        val |= TPDA_CR_FLREQ;
>> +        CS_UNLOCK(drvdata->base);
>> +        writel_relaxed(val, drvdata->base + TPDA_CR);
>> +        CS_LOCK(drvdata->base);
>> +        ret = size;
> 
> Please remove this from all the cases and explicitly return -EINVAL in
> the error cases.

Will fix it.

> 
>> +        break;
>> +    case FREQTS:
>> +        drvdata->freq_ts = !!val;
>> +        ret = size;
>> +        break;
>> +    case FRIE:
>> +        drvdata->trig_freq = !!val;
>> +        ret = size;
>> +        break;
>> +    case FLRIE:
>> +        drvdata->trig_flag_ts = !!val;
>> +        ret = size;
>> +        break;
>> +    case SRIE:
>> +        drvdata->trig_async = !!val;
>> +        ret = size;
>> +        break;
>> +    case CMBCHANMODE:
>> +        drvdata->cmbchan_mode = !!val;
>> +        ret = size;
>> +        break;
>> +    default:
>          return -EINVAL;
> 
>> +        break;
>> +    }
>> +
> 
> 
>> +    return ret;
> 
>      return size;
> 
>> +}
>> +
>> +static struct attribute *tpda_global_cr_attrs[] = {
>> +    tpda_trig_sysfs_rw(global_flush_req, FLREQ),
>> +    tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
>> +    tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
>> +    tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
>> +    tpda_trig_sysfs_rw(trig_async_enable, SRIE),
>> +    tpda_trig_sysfs_rw(cmbchan_mode, CMBCHANMODE),
>> +    NULL,
>> +};
>> +
>> +static struct attribute_group tpda_global_cr_attr_grp = {
>> +    .attrs    = tpda_global_cr_attrs,
>> +    .name    = "global_cr",
>> +};
>> +
>> +static const struct attribute_group *tpda_attr_grps[] = {
>> +    &tpda_global_cr_attr_grp,
>> +    NULL,
>> +};
>> +
>>   static int tpda_init_default_data(struct tpda_drvdata *drvdata)
>>   {
>>       int atid;
>> @@ -273,6 +403,7 @@ static int tpda_init_default_data(struct 
>> tpda_drvdata *drvdata)
>>           return atid;
>>       drvdata->atid = atid;
>> +    drvdata->freq_ts = true;
>>       return 0;
>>   }
>> @@ -316,6 +447,7 @@ static int tpda_probe(struct amba_device *adev, 
>> const struct amba_id *id)
>>       desc.ops = &tpda_cs_ops;
>>       desc.pdata = adev->dev.platform_data;
>>       desc.dev = &adev->dev;
>> +    desc.groups = tpda_attr_grps;
>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>       drvdata->csdev = coresight_register(&desc);
>>       if (IS_ERR(drvdata->csdev))
>> diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/ 
>> hwtracing/coresight/coresight-tpda.h
>> index c6af3d2da3ef..8a075cfbc3cc 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpda.h
>> +++ b/drivers/hwtracing/coresight/coresight-tpda.h
>> @@ -1,6 +1,6 @@
>>   /* SPDX-License-Identifier: GPL-2.0 */
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All 
>> rights reserved.
>>    */
>>   #ifndef _CORESIGHT_CORESIGHT_TPDA_H
>> @@ -8,6 +8,30 @@
>>   #define TPDA_CR            (0x000)
>>   #define TPDA_Pn_CR(n)        (0x004 + (n * 4))
>> +#define TPDA_FPID_CR        (0x084)
>> +
>> +/* Cross trigger Global (all ports) flush request bit */
>> +#define TPDA_CR_FLREQ        BIT(0)
>> +/* Cross trigger FREQ packets timestamp bit */
>> +#define TPDA_CR_FREQTS        BIT(2)
>> +/* Cross trigger FREQ packet request bit */
>> +#define TPDA_CR_FRIE        BIT(3)
>> +/* Cross trigger FLAG packet request interface bit */
>> +#define TPDA_CR_FLRIE        BIT(4)
>> +/* Cross trigger synchronization bit */
>> +#define TPDA_CR_SRIE        BIT(5)
>> +/* Bits 6 ~ 12 is for atid value */
>> +#define TPDA_CR_ATID        GENMASK(12, 6)
>> +/* Bits 13 ~ 19 is for mid value */
>> +/* Assign a unique master ID to identify the TPDA device */
>> +#define TPDA_CR_MID        GENMASK(19, 13)
> 
> Where do we use this ? Does this need to be preserved ?
> Is this programmable ?
> 

We havent usage of this field. I will remove it in next version.

Thanks,
Jie

> Suzuki
> 
>> +/*
>> + * Channel mode bit of the packetization of CMB/MCB traffic
>> + * 0 - raw channel mapping mode
>> + * 1 - channel pair marking mode
>> + */
>> +#define TPDA_CR_CMBCHANMODE    BIT(20)
>> +
>>   /* Aggregator port enable bit */
>>   #define TPDA_Pn_CR_ENA        BIT(0)
>>   /* Aggregator port CMB data set element size bit */
>> @@ -17,9 +41,6 @@
>>   #define TPDA_MAX_INPORTS    32
>> -/* Bits 6 ~ 12 is for atid value */
>> -#define TPDA_CR_ATID        GENMASK(12, 6)
>> -
>>   /**
>>    * struct tpda_drvdata - specifics associated to an TPDA component
>>    * @base:       memory mapped base address for this component.
>> @@ -29,6 +50,11 @@
>>    * @enable:     enable status of the component.
>>    * @dsb_esize   Record the DSB element size.
>>    * @cmb_esize   Record the CMB element size.
>> + * @trig_async:    Enable/disable cross trigger synchronization 
>> sequence interface.
>> + * @trig_flag_ts: Enable/disable cross trigger FLAG packet request 
>> interface.
>> + * @trig_freq:    Enable/disable cross trigger FREQ packet request 
>> interface.
>> + * @freq_ts:    Enable/disable the timestamp for all FREQ packets.
>> + * @cmbchan_mode: Configure the CMB/MCMB channel mode.
>>    */
>>   struct tpda_drvdata {
>>       void __iomem        *base;
>> @@ -38,6 +64,41 @@ struct tpda_drvdata {
>>       u8            atid;
>>       u32            dsb_esize;
>>       u32            cmb_esize;
>> +    bool            trig_async;
>> +    bool            trig_flag_ts;
>> +    bool            trig_freq;
>> +    bool            freq_ts;
>> +    bool            cmbchan_mode;
>> +};
>> +
>> +/* Enumerate members of global control register(cr) */
>> +enum tpda_cr_mem {
>> +    FLREQ,
>> +    FREQTS,
>> +    FRIE,
>> +    FLRIE,
>> +    SRIE,
>> +    CMBCHANMODE
>> +};
>> +
>> +/**
>> + * struct tpda_trig_sysfs_attribute - Record the member variables of 
>> cross
>> + * trigger register that need to be operated by sysfs file
>> + * @attr:    The device attribute
>> + * @mem:    The member in the control register data structure
>> + */
>> +struct tpda_trig_sysfs_attribute {
>> +    struct device_attribute attr;
>> +    enum tpda_cr_mem mem;
>>   };
>> +#define tpda_trig_sysfs_rw(name, mem)                \
>> +    (&((struct tpda_trig_sysfs_attribute[]) {        \
>> +       {                            \
>> +        __ATTR(name, 0644, tpda_trig_sysfs_show,    \
>> +        tpda_trig_sysfs_store),                \
>> +        mem,                        \
>> +       }                            \
>> +       })[0].attr.attr)
>> +
>>   #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
>>
> 


