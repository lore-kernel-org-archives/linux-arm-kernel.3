Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA8EEFCD82
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5Bl/CcfOoD/YcwIGB95IJzr0daTjYmyc7JgdasMSjs=; b=fRW9k8mBrL9/LUkXPO1cb3j853
	YSj4uRQrsHTbXdkMfbv/XBWANFt+Xd6WDpHlCHvao1wMb8F9T0Ri+DejQeUJ+kcghZSrYK/3PMOyF
	6WrOHS6EFy8JqqA2XSboK470vtlOeXYWzmkyM6lSYkl5yiFhMoDCUWR11+E8X+dG9ck6IJxX5Rief
	eN1l5SEtWdIAym1bACGHcmORaVii4LNRCvuTAURx+yk4ed6W2rjUrn1tN1wcANF8bKVRzbHKCqm7r
	+RQZHz3hu1IAeZMCyLN7uJqJk4UDcdk3T7aTt1IPEv08dhKQj1TzqWwtX6GmzztxtLENmylFDy7fh
	CriL+zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXpj-000000075P6-27eX;
	Mon, 09 Mar 2026 10:27:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXph-000000075NZ-0Smz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 10:27:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WAfp3773176
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 10:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5Bl/CcfOoD/YcwIGB95IJzr0daTjYmyc7JgdasMSjs=; b=p0vgh6UKCspttP+x
	fPE+azhQMsW98g8r8SH3nMipXPUPrcn28Rv/wBFjWLXqSJ/rcbr9W8EwYCkuG/kx
	G8pYsArPnq2snDQJFbHwtWnykC5neyIUQGA37ezii/s7MPdetOmZeOmhoBX4ohJs
	pVS5vKT4nhY+0iynALJSLHwVVGjWge5gUCiuRJ2EgMGb+ZzzEJysH5iLxg0j95n3
	3juPO17mrYozXBmCEyFzQ73qDldgGbXQ+7Ze3CIzf+KOWlklezzK/AIaltmZkeFv
	WYTG47FAicqNdh2fnEhAetMSZZGySfdCNOEeQ62jdR68/P/FHT4QnSiB8q6Enf/H
	EHCzUQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8dx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 10:27:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598007eb74so42794145a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 03:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773052047; x=1773656847; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5Bl/CcfOoD/YcwIGB95IJzr0daTjYmyc7JgdasMSjs=;
        b=QTsHm9vTenVCJvhh1v/YUzvU6e+ggbIyfIiU2znoraUUk/ld8aWV0GnbyXurU67HT3
         YEgVwqWOy5HIJ0l7knnbKCj3uhnrAO8QDb6bmVdk89/Flf0WgSTfmXByyzxL9da7F0dZ
         85ePU2zIlrIpeYlfY2z+KYeqc9iIOxSOkAv/RfqgKKmdBMOnemZC7wPWn1RN4UAgajzk
         47LXlJq7qbx6GLKNa5TCLtuRR07iL9XbrWj5Nwq4Me4sE4KtiI2V+JHtAxcYnkMtYISa
         lQ48sZRm7vtrbNa4OvOYak0LqnGL1JXsBCIbx49fgyAaXKQmsySEaGZBfb+swMQLacvU
         td+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052047; x=1773656847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5Bl/CcfOoD/YcwIGB95IJzr0daTjYmyc7JgdasMSjs=;
        b=hYzUpFMODo+B42Z3ZgRgwVjen72ouMqyaYjocOAyCiFfuIC0YtEqNQT1NhFkkz1Wk8
         8qntLz7Ybtkw2Gkn1FfQUri373P1fyWjaktRLdfszwxrtbG6OYW5QiNrwrdf7oahDTHu
         wY35m8T8mwyilaZqD8+rORKEJXGt4XGxTMvbNpgcWDISBhpfywULNzP9VDbj+JV6/2Td
         BTbwzHVkHuQ/XcNd3EVmnmsfd27NLSr8UlOE389JtDoLEi9ZddP39EMwYdpyTA+6ibWn
         GYoX6RLs0Xr0cLpFUu3YHVexBYo6ZuUE94Upu4SuCPsg3Rg67dR/hLshDUd4NGioR0sy
         Yr2w==
X-Forwarded-Encrypted: i=1; AJvYcCWRR1RBJLU0wpg9bAOZ8cvN6tiyTJUk5FxDr8jj/gnSa2lW4JbbMlIn9BzPgP8fiyb/N47PX8r3YNR5/85zmdXy@lists.infradead.org
X-Gm-Message-State: AOJu0YxaLOjxyZ3mCLpLe8BFOm5tVHdP36gGoHeaw7H73mTV6+s9yIO0
	6pYXGjsz8wLWGZi67DfwwNvcvXf2U3Ze5bPDH0iOasc2+R3Q3WrmONDosRgA7FMlW1zAE00IDcp
	QmBLUsfI9ZWpUb2C//DFxmqIhJyIYFhkNeoP9POKls/E/tU/8KlCYwwAVYHW2UbEF+K9BBHhpOq
	OjcQ==
X-Gm-Gg: ATEYQzyd4x9LgLI6g7WOmE3K3fyoBvfo4+U9EIoP0/u27Z0KMeYZBr7HAU52KoEa8ns
	FMLqqTAxtHKhcRpSySAjm21AhONs9a/fziRXb887V7Se76gcBVUnmMvnTtypU2nv0ltle4WfLXS
	czJmjG+qLy2BdgDDrzvWhmFzdj2CGWoWcL2dSKLEBFlMfI3rAXtOWBA37So6aBg9XZg+Tw0LCsI
	/0ZoKvwFNk689Aat+nubFP2xGzlsM6AmQunGzaNyCKkY0Grv322AAGI59SU0YPlpVlTpqN1xHDd
	M9CBrtrrmhdE3Fo0PUmTKx47U+FRKyj8xadweyI0hEFDxY8xmTun03mhlj7ovT1lCaKVsviote0
	zHQSxEN5G8yOZTYrte24LOt+e1aJhL7cZ7ySuvIAcskz9WwfwQPLz1SmpqlOv40jgg4MPBiCafz
	fhCkYVp3QDig8=
X-Received: by 2002:a17:90b:4a8a:b0:359:8293:67f2 with SMTP id 98e67ed59e1d1-359be34419amr10117575a91.32.1773052046609;
        Mon, 09 Mar 2026 03:27:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8a:b0:359:8293:67f2 with SMTP id 98e67ed59e1d1-359be34419amr10117555a91.32.1773052046095;
        Mon, 09 Mar 2026 03:27:26 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm8652277a12.25.2026.03.09.03.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:27:25 -0700 (PDT)
Message-ID: <94da5711-7bd2-48fe-b1d4-8d8542b75843@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 18:27:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
 <20260309-enable-byte-cntr-for-ctcu-v14-2-c08823e5a8e6@oss.qualcomm.com>
 <03705fdb-e13d-4b5b-8ee4-af9348469b42@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <03705fdb-e13d-4b5b-8ee4-af9348469b42@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LcFGTEqjgF-nrCa-tiKhq03vflATxxPl
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aea08f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=b4jqt5UQwNLUUHEC-OMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5NiBTYWx0ZWRfXwZM2mn6OawMz
 8a/p3skAWUvUMUSe8TjnKvU4gmo0501V5CqO8YGe/Q6aqTwkUqSGLiLwutokkAm/f3zLHZ4kC0I
 V6mq2/6D0Er/HMFT/HAcVa504twqZR/YfEiArh0bOKLfNNCKcyKvG3ttFP6nUB8X7ZKQcs6+Fdc
 5NL6iT43ug30NT3GX0VRANOuyrjmwYVJRdoYvbaLVrO1ot7FP8DCTuUXhYReCbw2rBuX8F2mwif
 joJHooay9y7OOvSwuMxWvlv+ttMvhjHhO6D7okiLv2aD2dwO523HxO1V3T3lqQ1E33vePqec1mA
 a72ehpFBB9SgwnQBrhZirWW/FmzBoaJCOd5gaojPkW1WOeoRx901Dt9IgV+WR4L3JZtx/mDErkD
 auZtJ+I/PVM98W1SWno8tIC2qWT+Sp1WAwm+6eRvQNys5c+8igr05bwDcvZmEnDm8jOQ6h4TkVe
 pc1OzL/NOYPfM94wcgQ==
X-Proofpoint-ORIG-GUID: LcFGTEqjgF-nrCa-tiKhq03vflATxxPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_032729_273252_6E5721A8 
X-CRM114-Status: GOOD (  25.09  )
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



On 3/9/2026 6:02 PM, Suzuki K Poulose wrote:
> On 09/03/2026 09:47, Jie Gan wrote:
>> Introduce functions for creating and inserting or removing the
>> etr_buf_node to/from the etr_buf_list.
>>
>> The byte-cntr functionality requires two etr_buf to receive trace data.
>> The active etr_buf collects the trace data from source device, while the
>> byte-cntr reading function accesses the deactivated etr_buf after is
>> has been filled and synced, transferring data to the userspace.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++
>>   3 files changed, 112 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-core.c
>> index c89fe996af23..bac3278ef4dd 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
>> @@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct 
>> resource *res)
>>           idr_init(&drvdata->idr);
>>           mutex_init(&drvdata->idr_mutex);
>>           dev_list = "tmc_etr";
>> +        INIT_LIST_HEAD(&drvdata->etr_buf_list);
>>           break;
>>       case TMC_CONFIG_TYPE_ETF:
>>           desc.groups = coresight_etf_groups;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 4dc1defe27a5..15c0874ff641 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1918,6 +1918,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
>>       .panic_ops    = &tmc_etr_sync_ops,
>>   };
>> +/**
>> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
>> + * @drvdata:    driver data of the TMC device.
>> + *
>> + * Remove the allocated node from the list and free the extra buffer.
>> + */
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
>> +{
> ...
> 
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
>> +
>> +/**
>> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
>> + * @drvdata:    driver data of the TMC device.
>> + * @num_nodes:    number of nodes want to create with the list.
>> + *
>> + * Return 0 upon success and return the error number if fail.
>> + */
>> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
>> +{
> 
> ...
> 
> 
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
> 
> Given the above functions are "EXPORTED" please could you make sure that
> the locking requirements are documented and asserted (lockdep_assert)
> in the functions ?
> 

Will checking the locking scenario here and asserted with 
lockdep_assert_held.

These two functions should be protected with tmc_drvdata->spinlock.

Thanks,
Jie

> 
> Suzuki
> 
> 
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>       int ret = 0;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 319a354ede9f..5ac07e8dd5ff 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>>       s64        len;
>>   };
>> +/**
>> + * @sysfs_buf:    Allocated sysfs_buf.
>> + * @is_free:    Indicates whether the buffer is free to choose.
>> + * @pos:    Position of the buffer.
>> + * @node:    Node in etr_buf_list.
>> + */
>> +struct etr_buf_node {
>> +    struct etr_buf        *sysfs_buf;
>> +    bool            is_free;
>> +    loff_t            pos;
>> +    struct list_head    node;
>> +};
>> +
>>   /**
>>    * struct tmc_drvdata - specifics associated to an TMC component
>>    * @atclk:    optional clock for the core parts of the TMC.
>> @@ -245,6 +258,7 @@ struct tmc_resrv_buf {
>>    *        (after crash) by default.
>>    * @crash_mdata: Reserved memory for storing tmc crash metadata.
>>    *         Used by ETR/ETF.
>> + * @etr_buf_list: List that is used to manage allocated etr_buf.
>>    */
>>   struct tmc_drvdata {
>>       struct clk        *atclk;
>> @@ -275,6 +289,7 @@ struct tmc_drvdata {
>>       struct etr_buf        *perf_buf;
>>       struct tmc_resrv_buf    resrv_buf;
>>       struct tmc_resrv_buf    crash_mdata;
>> +    struct list_head        etr_buf_list;
>>   };
>>   struct etr_buf_operations {
>> @@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>> coresight_device *csdev,
>>                      enum cs_mode mode,
>>                      struct coresight_path *path);
>>   extern const struct attribute_group coresight_etr_group;
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>>   #endif
>>
> 
> 


