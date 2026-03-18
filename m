Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597D2FEDA09
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 01:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCyetuy2W7yLJXH1MrmSQIQFxypgDGqmngvv9gJ+Szw=; b=m3ADJ9H6tCNjo6Vula7gXfTbye
	LwRMnnI9kxFi0bwLb9/zgScqchX0t73krXulJI65djzM3ifub0szHYeSImPB8kcLkIcFxL4c9RJRh
	Izz3+xduoDfpX24u4Dx03VGIXnFWCeFfEUz5UI2gZfvcCk9whBDbk4Jda0Ikz7SEch4cBgdwM5OIT
	vNgoNCfLEFbxMgehpJStbM6LuaskW4VnZuxUnj7sKzGUYZfoMQ4Gq2gpM/wjXsHCUmt2ozhrkhXJQ
	EGbxtIsbvwgaspLXkBtFEYtu9EqD+34kRL7YWLhC33EfgnQPQU5cCol54KKHCK2C5iLF8msf3QK1M
	e+vpRX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fMl-00000007XL5-1TGM;
	Wed, 18 Mar 2026 01:06:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2fMj-00000007XKk-0D78
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 01:06:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJqIr3165228
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCyetuy2W7yLJXH1MrmSQIQFxypgDGqmngvv9gJ+Szw=; b=E3N7zgroMCUbjP4m
	6qBbZXIAzF4rKqXb0qqWKLOAeP3BC05hP8De3lF8ucaVJ5QArb2wXcehTFeeTLaU
	73KB3t7ZyDuCPiF6owK+GJnKw/ElZY4YBAmbab7odZkGMyYkqKjr2bxw3MNGNDhs
	3UJ6fVpY8M89PGPa9bmdHDyo4ssT/LPK1vWawWZuG3Q2KoAaq6xA6Pg/anueO4Lb
	iO8QOH6/Mj8nm/txyYxbRBRuj0+wwoBnBE16gFQcILf8YoKsddZ0fmYpDrUi1BKx
	SW/O79hpQrougel/TqG2uM22akyv8TAvjp48BXVwZNB6iBnA3UkpIfA3WUsNzi3t
	r6jMGQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6u3b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 01:06:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8298b363fb6so21197150b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 18:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773795987; x=1774400787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCyetuy2W7yLJXH1MrmSQIQFxypgDGqmngvv9gJ+Szw=;
        b=NpQ26O5nVKQhZ3xdkCwGsm2cjRG/5cBp+QJEBKBW9Mu40i4ZM6CkqngflTrQArnAGy
         cnBrVND0tDKNphT6vaLqKXRTTO346GVTyPtG+7e66TT3qbDHAr2xRXwHo33AQe2BGZCF
         7JxzK7kk3pCiNHOUi3KhYzWK8PPdAyxzok3PImYPaj6TCQsV9g2PFdy3f4mBqtCk/ZFv
         7tAgRLTEnNknB0YfBtWJGZ6LtBXOtgGevEtD7uYjoej/NcJgYhvmQtjkiyrGFB3QiS9U
         VajVXNXKs+OuMKRE/p022wraNqA2LGtuqhA/qK1qtZasKhTAfIiz1j4AJs4Yxg8QgjLz
         tm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773795987; x=1774400787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCyetuy2W7yLJXH1MrmSQIQFxypgDGqmngvv9gJ+Szw=;
        b=XM0//WjeaYC86+QqBaGgDfXADhjpSNVWFidbEbhu/HXkIeV27wvzEhWNgU3CaTMLmS
         xS+QCIstlGP3Im5KxuQvWONV7y9n2pAEXB5qNCl9F8v+0No+e8FWVxMqr9IdNV1jEcfp
         h2pmybZbH3iLGZMS9MS69/W75lTOEdY8+fvKdUEa+krJSWZDC6eRMe6yfZCxOAyv1sQ5
         KWDuN94TGcXpdQqD1FEVLae3EbPQ0i8ov411CSqeThwznZquYj8yatpjVT1QAbsEACd2
         N3PrciFo3vZucesSrFQEvADd+oLvaO3bgZyjLJm3ti6vuH6KewJuw+tAkgPRLzSvOjcp
         5Hyw==
X-Forwarded-Encrypted: i=1; AJvYcCXuuCmj93c7np/YiSilL1WPNZwaEsSeN2SNObbS5kx4X2GOtH4mxYDclHo1ADdgbVAenun68m6bw9Vq2I0h9YKV@lists.infradead.org
X-Gm-Message-State: AOJu0YwTG9MfCwyjZ7Mj48NCEWvPYyl0YUMG9x7JGPC+ZumBQbizRyai
	NMxH7aINbN7U17mtp9mJckQIOT2BlyjJjgA4mM2J1RYkLJeGMR9eeK/9d+hDFUoLe76A5KpAn0t
	OKossZjcQexnaVKszdrkvps7SN6TNX4ocdVRdKxj2o+Rf6tKhfT4uHa0WVpLgcoqDEAk2jh47H4
	h9lA==
X-Gm-Gg: ATEYQzwZwfv+ro9JqQBSciEQ6KHX7YL0odssA9kWhDrZwppw4dD4FJSyYb2ut1ISAEF
	dkqhwPf0fsODLb6hlv2Gir1KY8VU2RDEVyLVDJLm+I9Zbpmspo5y0TV3zZ/FdQzQPrtnJuWDvtd
	idqgoM1KufTSlNaK0q1j0B7nzmYdzSJmcdsGUA6823tB0qRmRZCFpra1X0VOtr09hyeq973C6Tj
	0dPcSixM4qc3WNeni/Ix8vH/KylfPqsuMMywVRj+jPqdagjJfAnfmsbhzpEGgVoJBA7HGwu35sg
	AzJ89CQUieOmoLxCBbVPyggwouWpnpmVBaadAm5VL1oC0IC7G2E+rWQ2gKPcQgbZjsTxVq/CeHB
	j9LfcvibARg9VSN6QZMzAuHSGPxXRIkpGprN8NZ8gNadL71v1eIfsa43+jUJucXljasEnUKMvwV
	IykDvwJFystBk=
X-Received: by 2002:a05:6a00:3d53:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82a6acaaec3mr1506174b3a.17.1773795987117;
        Tue, 17 Mar 2026 18:06:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d53:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82a6acaaec3mr1506122b3a.17.1773795986406;
        Tue, 17 Mar 2026 18:06:26 -0700 (PDT)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bdd776bsm664244b3a.49.2026.03.17.18.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 18:06:25 -0700 (PDT)
Message-ID: <be947dff-881d-4c3f-821c-9b9806ce4f9d@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:06:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/7] coresight: tmc: add create/clean functions for
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
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
 <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
 <1c4ab892-6f01-40ff-83e2-9060aa69616f@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <1c4ab892-6f01-40ff-83e2-9060aa69616f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IuAsHtoCRkAwtmaUtZ7SPkTGwpEQ1_Nx
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b9fa93 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ihr8kAaVTVC09hDvwRkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IuAsHtoCRkAwtmaUtZ7SPkTGwpEQ1_Nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwNyBTYWx0ZWRfXwgTfEsVH6BLK
 b9geHn6fCN6v7UDcr0WRqkn0ufDql6JmN477aN7LHzsUjbJrb6xtM6ZQMY97PNnP5ScRlG/NVmb
 b/ffebI3/wWDoYy9SbOYtrrxob0ZclMsMPnVvI7sFBJaZ/iUsGl8iiXZh1HmVUOtwzBED/r+wz6
 4Q3Ob4rS03tzTdTil0bHMmTrgEMg/SHVuBxJnO/Q7fI+yhWYj0f2c0yOCdzkKjKGCoFO9k/fCGv
 bBIs3HzbsN0aiOE7J9b/yRDzDSIqU0GmZWrs7FLFtqKL2wFDYmbETO5tukDAGbWaMcNhh4OVllQ
 nvrScaqLbdwdNWluWl24+pc2FWdGSBwe96iVMLGMZBusKCvM8QSWUa7pEicXhh8Kfhen2BwPoSj
 xF4lphTXJRgOh8b+bDqcEobzLBjJM+jfgUoDRKo9RvZdD4CGxJb0SrbxlFhWddpBypLcKaHY2I2
 HfMoZrFsP22DxMmcb0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_180629_122075_F1727A48 
X-CRM114-Status: GOOD (  29.81  )
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



On 3/17/2026 7:01 PM, Suzuki K Poulose wrote:
> On 13/03/2026 09:02, Jie Gan wrote:
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
>>   drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c  | 108 +++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
>>   3 files changed, 126 insertions(+)
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
>> index 4dc1defe27a5..fdf23e1c932f 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1918,6 +1918,114 @@ const struct coresight_ops tmc_etr_cs_ops = {
>>       .panic_ops    = &tmc_etr_sync_ops,
>>   };
>> +/**
>> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
>> + * @drvdata:    driver data of the TMC device.
>> + *
>> + * Remove unused buffers from @drvdata->etr_buf_list and free them.
>> + */
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
>> +{
>> +    struct etr_buf_node *nd, *next;
>> +    unsigned long flags;
>> +
>> +    lockdep_assert_held(&drvdata->spinlock);
>> +    list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
>> +        if (nd->sysfs_buf == drvdata->sysfs_buf) {
>> +            if (coresight_get_mode(drvdata->csdev) != 
>> CS_MODE_DISABLED) {
>> +                /*
>> +                 * Dont free the sysfs_buf, just remove it from list.
>> +                 * drvdata->sysfs_buf will hold the buffer and free 
>> it later.
>> +                 */
>> +                nd->sysfs_buf = NULL;
>> +                list_del(&nd->link);
>> +                kfree(nd);
>> +                continue;
>> +            }
>> +        }
>> +        /* Free allocated buffers which are not utilized by ETR */
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> This is dangerous ! Restoring the irqflags to an uninitialised value 
> from a different function thant where it was locked. Please clean this up
> 

Noted, will take care of it in the future.

Thanks,
Jie

> Suzuki
> 
> 
>> +        tmc_etr_free_sysfs_buf(nd->sysfs_buf);
>> +        raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +        drvdata->sysfs_buf = NULL;
>> +        nd->sysfs_buf = NULL;
>> +        list_del(&nd->link);
>> +        kfree(nd);
>> +    }
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
>> +    struct etr_buf_node *new_node;
>> +    struct etr_buf *sysfs_buf;
>> +    unsigned long flags;
>> +    int i = 0, ret = 0;
>> +
>> +    lockdep_assert_held(&drvdata->spinlock);
>> +    /* We dont need a list if there is only one node */
>> +    if (num_nodes < 2)
>> +        return -EINVAL;
>> +
>> +    /* We expect that sysfs_buf in drvdata has already been 
>> allocated. */
>> +    if (drvdata->sysfs_buf) {
>> +        raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +        /* Directly insert the allocated sysfs_buf into the list 
>> first */
>> +        new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +        if (IS_ERR(new_node))
>> +            return PTR_ERR(new_node);
>> +
>> +        raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +        new_node->sysfs_buf = drvdata->sysfs_buf;
>> +        new_node->is_free = false;
>> +        list_add(&new_node->link, &drvdata->etr_buf_list);
>> +        i++;
>> +    }
>> +
>> +    raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
>> +    while (i < num_nodes) {
>> +        new_node = kzalloc_obj(*new_node, GFP_KERNEL);
>> +        if (IS_ERR(new_node)) {
>> +            ret = PTR_ERR(new_node);
>> +            break;
>> +        }
>> +
>> +        sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, 
>> cpu_to_node(0), NULL);
>> +        if (IS_ERR(sysfs_buf)) {
>> +            kfree(new_node);
>> +            ret = PTR_ERR(sysfs_buf);
>> +            break;
>> +        }
>> +
>> +        /* We dont have a available sysfs_buf in drvdata, setup one */
>> +        if (!drvdata->sysfs_buf) {
>> +            drvdata->sysfs_buf = sysfs_buf;
>> +            new_node->is_free = false;
>> +        } else
>> +            new_node->is_free = true;
>> +
>> +        new_node->sysfs_buf = sysfs_buf;
>> +        list_add(&new_node->link, &drvdata->etr_buf_list);
>> +        i++;
>> +    }
>> +
>> +    /* Clean the list if there is an error */
>> +    if (ret)
>> +        tmc_clean_etr_buf_list(drvdata);
>> +
>> +    raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>       int ret = 0;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>> hwtracing/coresight/coresight-tmc.h
>> index 319a354ede9f..81237944b986 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -208,6 +208,19 @@ struct tmc_resrv_buf {
>>       s64        len;
>>   };
>> +/**
>> + * @sysfs_buf:    Allocated sysfs_buf.
>> + * @is_free:    Indicates whether the buffer is free to choose.
>> + * @pos:    Position of the buffer.
>> + * @link:    list_head of the node.
>> + */
>> +struct etr_buf_node {
>> +    struct etr_buf        *sysfs_buf;
>> +    bool            is_free;
>> +    loff_t            pos;
>> +    struct list_head    link;
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


