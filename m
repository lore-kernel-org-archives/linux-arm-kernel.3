Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC243CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/1d4MNXx8F6WoIg+pWhQR6lyz8UlfDfaD1LAFn90c8=; b=NoMF8wD9aMi7ZCtnCxOYVmNDVk
	zqNV0gY/Kq1YMoyvyPErotJ2yLdJCnjh9cHNpxra2KDMwgN+surdM606X0ds1+OLY+o/nWTia4mRU
	8p7w+Z5bpNAG8FHOvA0B9foG57HQzDaZoX5OQBIQ8SVgSXUKkmTJuupzOkZPa+WyyOJOUTo/sEV39
	OU4npa1CJQGJQVatJBAtgOB1kg63HruwaVSMmEdop8u2A3wbEFdcibkPFFwKU1wWLW1mkwFSPNfyM
	DMuO6UU3MAwzCyx65WvSMwlNHYu4PWzUH+E5OpVKbR7GW3H9Vh5t8PX3DI86YsesRvhrGvqvdt0Dt
	4rQC6w/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKylq-00000003u0d-1B7e;
	Thu, 07 May 2026 13:28:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyln-00000003tzZ-2wt5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 13:28:04 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44a74032ff8so662549f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 06:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778160481; x=1778765281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/1d4MNXx8F6WoIg+pWhQR6lyz8UlfDfaD1LAFn90c8=;
        b=Mvcagjd8xUp5H/Tjd2c+hHaG+p+zIrCXrG/NSDv0Hb5P/vNZs+sMkKQrlxUPhd8ECU
         G5jZtU2iv/QVb90jJ1+8zgV3odZIay0wz1FkhzaBpPHHVAECxiqzrztyQ+DrqD0wdyAg
         bxJd6rskIFK9z3XAxDZmuOwv4x0qEdlQ5RpH6lMJIzhjF2T3N+8k6Y8YgnVYnRTiwdGk
         DLBF0CzCggAgpHHTSHhKBUk7fQ6ppzggim31UE/Ru880mWESqoR7WK1y+J62vCHJsYhU
         r0jNf0jR0sHccj4ObKwiXyc6p6drqLCEQaRuDoa/8Imf8orCJOZc+QLTNBYAU40y1Cfl
         1TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160481; x=1778765281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/1d4MNXx8F6WoIg+pWhQR6lyz8UlfDfaD1LAFn90c8=;
        b=AEZRf5cq3T8ELFIBygDLoFLA/nkHv/D1mZ0me4ldocxvablqzR6LR9srBOtq4qeRmQ
         oKfxJcrxKtaQtlVESQ5/bRVLG7uF+Qcl8c/vDZKxiwSFpQB8Gw25k7mRUSPnXDIVjjPK
         NKHabXU2QE03cbTK69T083KJXdG46jBQ4yCoWO4r7985De1i4BL4n75VE0EYs7VFWf0k
         vFKJijLUJVzNwoPsY3uRLSOY79IgN5Piuf6+X0lVgo3wsBG9VhpCCwoEZmCG809GGG1d
         lCOMvWWzd6A7e2Mb3lZgBMv131JCw7kcH4Zh1Q05Q0hwrlc2rNzoRnv+pepaXPabp1Mr
         3ZmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+V9N9OGLzar6FXCtfZwhnYN39CzTn8dSu/D9cr2r2ai4QGRKK73q3bECl5WUeS7rVruqRhAomTn+kjTla/c9fs@lists.infradead.org
X-Gm-Message-State: AOJu0YwEJt0y1Ln6jMcnwR6Raa8r0XnQAGnt7486XuU/sybWPUgbsuJl
	qUTUnlOj3mgNAUsiW1BAT4alMeldwuloILHLxAoXm3UpInwBzDa3R9I=
X-Gm-Gg: AeBDieu0DFV3sYi8ygFvChN8EGhknFyh5+6reANMKVekFMjPuP1+3k0+muuiQZ+mS4w
	cV5eIowlpPtMat31taDJ4JgJygJzQbFbRfitjpmiDrAt3vyK9fz22l2/xCml4kKeGOrK8KoTzyt
	oA3LVn/ZwX/QoC6ySIn5CW1mjUEEd46UnKTopZDINsMYwtSBHGeZW/dsWyxQzN7h5a+cVrUW3AG
	szaAmUoZkhxZr9R4WwVc4nIFYo1o/68C0mT5eIfJRI4quusjTmuGJurapYSV3zMroDv/8Vm9597
	mueFE+RZRvea20pPO8qu46gCZoWyIANGD1CR5Myo5hibhOqc+Qo5wZHrf2rbug95TCjrTG5RgYc
	WS9lUJI4ZkQ3BI3sIppKG4NFaMGaZCn2TdsNk6AJruarNZJy/W8liekq0RlTgrrQ3z1JWxv4sBc
	A/rfjJzRqFEkyZyAKVr24taWIEBFf/8J5JuYPmFoNqK1q1tgol/NKbYg/IYej3Wm0tTxNOlG6YU
	h2QckBtxoN7wjIB0h3BDiWwvh3jQg==
X-Received: by 2002:a5d:588b:0:b0:44b:7ec9:2d76 with SMTP id ffacd0b85a97d-4515b056d5fmr14170290f8f.7.1778160480564;
        Thu, 07 May 2026 06:28:00 -0700 (PDT)
Received: from [192.168.1.17] (host-79-50-55-97.retail.telecomitalia.it. [79.50.55.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055e2d3d0sm20037129f8f.34.2026.05.07.06.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:28:00 -0700 (PDT)
Message-ID: <6cc62409-9ca5-4db1-9526-65dd8b88981c@gmail.com>
Date: Thu, 7 May 2026 15:27:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
To: Xilin Wu <sophon@radxa.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
 <330D3C56EBC6D08F+3d956321-39de-4308-a977-ad8f7101ed92@radxa.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <330D3C56EBC6D08F+3d956321-39de-4308-a977-ad8f7101ed92@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_062803_764931_869A09EB 
X-CRM114-Status: GOOD (  19.75  )
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

On 5/7/26 10:21 AM, Xilin Wu wrote:
> On 3/26/2026 5:11 AM, Anna Maniscalco wrote:
>> Previously the device was being accessed while potentially in a
>> suspended state.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>> Changes in v2:
>> - Simplify patch by acquiring device just around the call that needs it
>> - Link to v1: 
>> https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 573085349df3..cab7d110aaf5 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const 
>> void *cookie,
>>       struct io_pgtable *pgtable = 
>> io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
>>       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>       struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
>> +    int ret;
>>         /* The domain must have split pagetables already enabled */
>>       if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
>> @@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const 
>> void *cookie,
>>           cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
>>       }
>>   +    ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
>> +    if (ret < 0) {
>> +        dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: 
>> %d\n", ret);
>> +        return -ENODEV;
>> +    }
>> +
>>       arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
>>   +    pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
>> +
>>       return 0;
>>   }
>>
>> ---
>> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
>> change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20
>>
>> Best regards,
>
> May I ask what is the status of this patch? Without this patch, I can 
> trigger a crash easily on sc8280xp by running fastfetch multiple times.
It's ready on my side so if someone could review I think it could be 
merged.
>
> Tested-by: Xilin Wu <sophon@radxa.com> # sc8280xp-radxa-dragon-q8b
>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


