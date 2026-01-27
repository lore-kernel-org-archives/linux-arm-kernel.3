Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F30D19512
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 01:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ED79bZ+N6386gyoOtfA0esj4+TJdCY9jaQYBeN+5W7E=; b=W1NpIOyhvnfByKbE9bNi0+MRhb
	8jl7jCu/kgQSG5usdKXDxotJZwx31f4ovbxG9ex57pJjbg1OnVFfborhmsHf+e5ASpxhcgHp8D6xQ
	ibyRQnecpikbQUBHZfwSTpC7PiEvvyCuJPaRex33ihtdB2/X5q5FpMTfhiMTBvURe/Dlc+1nzyMqj
	4iCyGJ8M993+pXquzIIMg9F1EpnlY0WoLW4uOisoK/FbUEuJjRgDgkTvEKg142iTd31pDS/Y4RDZ3
	t+S0DgdknUCb1IsVRXhoS3NvuhIspn5lNaV9cIXP7zRiw9ygYbcmEvsX8ur1k9zvbZ0Q1lKEZq9yU
	qXzYjN4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXRP-0000000DPig-24s0;
	Tue, 27 Jan 2026 01:00:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXRM-0000000DPhx-3o0q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 01:00:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgxh0925414
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ED79bZ+N6386gyoOtfA0esj4+TJdCY9jaQYBeN+5W7E=; b=HVGt4FFjbj/3VHu4
	xzK73t2cgsX5J4O2BpmRLKYiR751UJpO1Oh6hjO3KHz3/+CIRYP1VfdkExKqHea3
	g7Kgr52yaYsLxAuL4QUhuSYUzwyzYJ2mXBE8ix1JFHQ5epijG2Zoz6x+zl6ucO73
	XpJkv7J6QVftp5PejLwp36dl1dMyo/a65ivsdo4Q1ogvgKb4BJCw09x8XWvcd6uk
	NYlce73KGvvUAaoIiTicA6KEJ3laOg3YO+ewoovXVm5GSHvVCCh7DDg2tOOhGIw1
	QXaKsdyC+4Ouih1zQ5mOu3598bUAHwYp1IcCNei7wB7pwKUn58O+Vu150qNyGU8H
	qIoTLw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxadpsmdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:00:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a76f2d7744so46765345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 17:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769475620; x=1770080420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ED79bZ+N6386gyoOtfA0esj4+TJdCY9jaQYBeN+5W7E=;
        b=S7WnMFRwvAx8jXlZKxsp2X9fzHsXZMguSeJ/HNexDLHvMsHX3HWcqHQ1LPQ8w22ILN
         QTTilJIOYO/sdeF7eugDTuHoh2gkJp4QKewyd8McTTzrk1cTWV3xttvVrOAgiyeZMeL0
         SaG6EXav5tUGp5PSZp6g7YAE5tn7UJX6xbiQt0xAI0fNssm1BsF0O1Cfcbx5t53YWtnH
         LDaAvruQL+XiG/8i/uiQblSdww2cDelPYg9F/3JH+HVbeKh/Fpb2FjoHOKMiOaz67P8M
         MjTCo4372Eg/9iiQcmzpLS+8XS5LsZrnXIBPllqMLmsUW1MkqCBLN4GO7W5NBx/Tmvfo
         Xn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769475620; x=1770080420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ED79bZ+N6386gyoOtfA0esj4+TJdCY9jaQYBeN+5W7E=;
        b=RlSVOZCYkYgfJv2j4d9oeaXiGob6jKxwb473Kurkui2SAjHE1nSG9Ms0NzMzz5BEJ1
         H4fkQ5Q69mNyyI3OLVIb9H6GrVxDgSBSAhuBMNT1vk1A3hW+PuBImswG19937IHTwucJ
         xcwhDMe/Mk+B3yhkwcEptc6V33Msl9s8H4qW2899fPCTg64XnMvOZpQrDQALpHURgQLe
         0qvp2FRAacSeZra5IHC4+UsfnYmxMq7kMmZ95dKNraAZ6B2YogaOgooERFuf4XgegAZ9
         QGlzcewUkpmwq6HgwDGDU9PKv9u0aeUPsuhRuxmb/TnV9JJSIlEDoLR3K1/HNMADk3+9
         5Bxw==
X-Forwarded-Encrypted: i=1; AJvYcCX+KIlq8Ha5m48qXpRqTGPkUUjhB6Detlkxcgwo54tQlNN5eUhgJk8llmKEoFvhso2i3fIox7t1ZanI6fhc+yiS@lists.infradead.org
X-Gm-Message-State: AOJu0YylY7bbavnkmpYbsDg3h/4dEzM8rPThyzzQgNQtW6f4sNu2lY8H
	LfV8UHodLkkmKRbUFuh1/tEHcquXx+dRxrS5GTZYf9GUE1PzkuIS2fTwyI+7/NlgJeXFXU1XFzZ
	v8FxZGjfEsJsyPZM3YM1rwlTNrn+NIOuQC15r156q4FpnVOQkLBOCFr0s/7MvB9RIpmsYJusR31
	Vp6g==
X-Gm-Gg: AZuq6aKrnIig3cJnwNaYyop8gI8l3qpEx3N4Ys2kEW+PIbI2XAJvl17bHvfgEM9CaJw
	wxpJsZ6uwNlL5F9d0aZL1eBAxJ27qHTKPB49kiDo8/krQW8KMNgTfBOuB2DnVZbR5DyS8Y3kSTp
	QtdIz+9i4kGuC+HQYRL0vjCQ8BQ5ToUoaF6TuKgtNXe426fIjLwWOJ6UPYSFTt/lPJljh2BklvC
	D1DU5GhvBOwChu04DgttXtF/pZmXTdx4w30s4Lcs/zdycRNMhgViQDxtpU0KsjYwSM4Isv1k7g7
	ECRAbOb19y4B5H0QqDu6ZAq0e18+oIZRAMqKv7Hyhcg2SDDktEvIXAr2H7onS8DO8bgQRtVELJ6
	CGt+sQEHKVd388wixOvpOMdDwseqkUEJIXOx27OoljJPKVOJ7/11eqsIp/ihEFwrfs1hr2tKtqd
	Q=
X-Received: by 2002:a17:902:dad2:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a870ddde7emr100275ad.47.1769475618857;
        Mon, 26 Jan 2026 17:00:18 -0800 (PST)
X-Received: by 2002:a17:902:dad2:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a870ddde7emr99805ad.47.1769475618168;
        Mon, 26 Jan 2026 17:00:18 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd781sm98605985ad.24.2026.01.26.17.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 17:00:17 -0800 (PST)
Message-ID: <bb391648-c7ab-4c43-8bea-c0fe1b6c3e13@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 09:00:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] coresight: etr: refactor the
 tmc_etr_get_catu_device function
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-4-22978e3c169f@oss.qualcomm.com>
 <c046085f-82e8-4a77-93be-c2a8d59db97e@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <c046085f-82e8-4a77-93be-c2a8d59db97e@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C7UylFUEBKIvScK7ECaRARhVBQ7NqrQS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDAwNiBTYWx0ZWRfXyAe2+Y+/QXyQ
 52PQ+xkkGgpRGfMVTEIQ8IlGF109IRUswAE46oXGhcaza9P7TyTV6IBo6OgSnqT94YRC1VBByjm
 rLvNP+sN8jqFKTKXfUam2QGNdNGO59tJZ4kLyrLRfYa+1iDyJVdN+VOqeyjqcpDa6kcuy6Gw/U1
 2TgFtTRebPjKnKmYChyhTFwzR1HsGcIroZXquTiT1Qayd/yxnTvoKgOTlR9z2f8fukUBFHItMU2
 LSAap/E2S506xvsuychVKiG+LyIwRUqBAvX92mUcBEsHgUekH6df6We5uWFw3Hk2krMg1lpXQfw
 8nDoF8PaHyKyvVgT+tytgsCAc8HPFzA7oxXjsaUftpeQLKCaOnC9jsbZ55yMXyWzuL2+/wdwj2/
 ke5eXK3w2PJhDyCIFUM4EXOlUij1wUShCmAwxHATsSyFpdx2nE1gjFZKrzuRXJJNcuAjoieOdNF
 XzrsltP78SjGeCQAJ/g==
X-Authority-Analysis: v=2.4 cv=GvdPO01C c=1 sm=1 tr=0 ts=69780e24 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JWV3lzYn8tzaYNbzfnMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: C7UylFUEBKIvScK7ECaRARhVBQ7NqrQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_170020_955442_88857908 
X-CRM114-Status: GOOD (  27.99  )
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



On 1/27/2026 12:10 AM, Suzuki K Poulose wrote:
> On 22/01/2026 02:08, Jie Gan wrote:
>> Refactor tmc_etr_get_catu_device to retrieve the helper device connected
>> to the TMC ETR based on helper_subtype.
> 
> Please could you leave this as it is and add :
> 
> tmc_etr_get_ctcu_device() ?
> 
> It doesn't make much sense to refactor something that is a wrapper for
> a generic function. Please avoid un-necessary abstraction

Well noted. Will fix it in the next version.

Thanks,
Jie

> 
> Suzuki
> 
> 
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-catu.c    |  3 ++-
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c | 32 +++++++++++++++ 
>> +---------
>>   drivers/hwtracing/coresight/coresight-tmc.h     |  3 ++-
>>   3 files changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/ 
>> hwtracing/coresight/coresight-catu.c
>> index 69b36bae97ab..d3972619cc96 100644
>> --- a/drivers/hwtracing/coresight/coresight-catu.c
>> +++ b/drivers/hwtracing/coresight/coresight-catu.c
>> @@ -334,7 +334,8 @@ static int catu_alloc_etr_buf(struct tmc_drvdata 
>> *tmc_drvdata,
>>       struct tmc_sg_table *catu_table;
>>       struct catu_etr_buf *catu_buf;
>> -    csdev = tmc_etr_get_catu_device(tmc_drvdata);
>> +    csdev = tmc_etr_get_helper_device(tmc_drvdata,
>> +            CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>>       if (!csdev)
>>           return -ENODEV;
>>       catu_buf = kzalloc(sizeof(*catu_buf), GFP_KERNEL);
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index cbbb15648fb7..16a4562533d5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -844,28 +844,37 @@ static const struct etr_buf_operations 
>> etr_sg_buf_ops = {
>>   };
>>   /*
>> - * TMC ETR could be connected to a CATU device, which can provide 
>> address
>> - * translation service. This is represented by the Output port of the 
>> TMC
>> - * (ETR) connected to the input port of the CATU.
>> + * TMC ETR could be connected to the helper device, which can provide 
>> address
>> + * translation service(CATU) or data filter function(CTCU). This is 
>> represented
>> + * by the Output port of the TMC (ETR) connected to the input port of 
>> the helper.
>>    *
>> - * Returns    : coresight_device ptr for the CATU device if a CATU is 
>> found.
>> + * @drvdata    : drvdata of the TMC device
>> + * @subtype    : helper_subtype of the helper device
>> + *
>> + * Returns    : coresight_device ptr for the helper device if a 
>> helper is found.
>>    *        : NULL otherwise.
>>    */
>>   struct coresight_device *
>> -tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
>> +tmc_etr_get_helper_device(struct tmc_drvdata *drvdata,
>> +              enum coresight_dev_subtype_helper subtype)
>>   {
>>       struct coresight_device *etr = drvdata->csdev;
>> -    union coresight_dev_subtype catu_subtype = {
>> -        .helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CATU
>> +    union coresight_dev_subtype helper_subtype = {
>> +        .helper_subtype = subtype
>>       };
>> -    if (!IS_ENABLED(CONFIG_CORESIGHT_CATU))
>> +
>> +    if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CATU &&
>> +        !IS_ENABLED(CONFIG_CORESIGHT_CATU))
>> +        return NULL;
>> +    else if (subtype == CORESIGHT_DEV_SUBTYPE_HELPER_CTCU &&
>> +         !IS_ENABLED(CONFIG_CORESIGHT_CTCU))
>>           return NULL;
>>       return coresight_find_output_type(etr->pdata, 
>> CORESIGHT_DEV_TYPE_HELPER,
>> -                      catu_subtype);
>> +                      helper_subtype);
>>   }
>> -EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
>> +EXPORT_SYMBOL_GPL(tmc_etr_get_helper_device);
>>   static const struct etr_buf_operations *etr_buf_ops[] = {
>>       [ETR_MODE_FLAT] = &etr_flat_buf_ops,
>> @@ -913,7 +922,8 @@ static void get_etr_buf_hw(struct device *dev, 
>> struct etr_buf_hw *buf_hw)
>>       buf_hw->has_iommu = iommu_get_domain_for_dev(dev->parent);
>>       buf_hw->has_etr_sg = tmc_etr_has_cap(drvdata, TMC_ETR_SG);
>> -    buf_hw->has_catu = !!tmc_etr_get_catu_device(drvdata);
>> +    buf_hw->has_catu = !!tmc_etr_get_helper_device(drvdata,
>> +            CORESIGHT_DEV_SUBTYPE_HELPER_CATU);
>>       buf_hw->has_resrv = tmc_has_reserved_buffer(drvdata);
>>   }
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index c9a82ff6cd00..7690a70069da 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -471,7 +471,8 @@ static inline uint32_t 
>> find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
>>       return crc32_le(0, (void *)drvdata->resrv_buf.vaddr, crc_size);
>>   }
>> -struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata 
>> *drvdata);
>> +struct coresight_device *tmc_etr_get_helper_device(struct tmc_drvdata 
>> *drvdata,
>> +                           enum coresight_dev_subtype_helper subtype);
>>   void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
>>   void tmc_etr_remove_catu_ops(void);
>>
> 


