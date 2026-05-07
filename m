Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBA6CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSOmSFJwCPNmD4rhxZFAOsBilrO5DsGS6d5uAovPx48=; b=WahLnMs/iNbxRpxww5ndH+TiSu
	jtDvHETKDlCO4cAJiM/G2DgDdZlLy1w4ir7Mh7yr4oahcnbxxUIjhSWXJzlKdjtiDake/FhJyKUh3
	XxcdRewKlhiIKwKLNoevFErXwLFOMJMSFNxcq9RsOwhKEnVFhp3ot0hAtAdG28nPnXBRPRbrVKTYi
	s8CLqqKbrNbjIZqE+J02ZW6mHyu5dRUqJZTOOuM2bRTSrNHQlm5fXdpqNKP4MEutUAzA8jIG+W1dn
	eS5jAXfisJRT+ZcjKAIn8npkoshA/aGldqu7s1PQdnuazu2kqZGdm2k1yh2QeqcJVI/Hcb7DGpBBY
	hOC4sh5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0u7-00000004EqU-1XIL;
	Thu, 07 May 2026 15:44:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0u5-00000004EpD-03Z4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:44:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so6610545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778168683; x=1778773483; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSOmSFJwCPNmD4rhxZFAOsBilrO5DsGS6d5uAovPx48=;
        b=iRoGkLti3nD20mKXcOX2WRdi0GO1O+YuiyjF3KClwUF/9y6MM7n5ioWUQ3FpnB8DVh
         NG99ewge66BEdj7dIMDDK4oM8mSFOK48pDB+atK5cDrErVwYMLVOvoaAKpJxbQVsA23v
         vJsFS+QqZmg1tUK5KjeLnMv2dWhH+4yWX6YpftELeTSOboRwaezostlsEOPJsEOYFTyO
         ydGCC6jxzSQmDZDV7axuv8tXKQWf09MYmpFeVD8AJTOBmM9qtd2Ne3l98FpeQd2kAJJ8
         Ygj0uMFMFlvnpoTEgT6wDe0mJB0Ib246y+wj0tZgGx+LHJIhJXqWLiX62UQuLccbGmX8
         aHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168683; x=1778773483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSOmSFJwCPNmD4rhxZFAOsBilrO5DsGS6d5uAovPx48=;
        b=eepYpwwiF3psQbwK3jKPlfs3EioDdUrrEefscJ1JOl+y2UCScTV3VhW/QRInGWQFBh
         R4aoRoO9zbBGPU6l5sPlPgR2YvQtAOK01LQ/Rw/h8jmjytqiz9RHoQdw5Snt34M/LSz+
         lVUFUnEQDKWUznDZ4Eink1pbn4PUF8mxf6lOkTefq9Dn/Xecc2rcm02cZktIPvjmXnjm
         1A7xTfu5aEkkj4jC7KOu8mj3eKroPFVcfyDj7sD92DrATLutNH+vuMo/Kruv8gpykS+F
         MubMQiHQpHt0UnqzvyuZKOZcVdRaRw+31RWmMrmU4ZoqC//ApksttvUydCttB0172daX
         oHuA==
X-Forwarded-Encrypted: i=1; AFNElJ+KTMO9/kvkIOv54xdSiSgaNICLWuC0o1R7LKd/r5Fx5GjRuZaTe6SyC/IvnpTTSdClc2eZVsPfcu/ygnFua2v3@lists.infradead.org
X-Gm-Message-State: AOJu0YwkdPbR1WLcbPy5ffNwxiffBLbXkdUJx9nfxh8ceP6GTMbuaQkG
	T2B2dllV8wejRKjJCXRrbLQMAPQav2nJ7Hhmm4R3XwqrojasiPeX8XY=
X-Gm-Gg: AeBDievO6h9O5pLvvQh8cFTkkoxO9SsNfsUCTl8c4BTXSpL1JhVSl92KoDYVDLmv5z9
	VFnwe+jKND1fFbwusGM1FafA95dZTr1al9ZSrzR+Wknu374qt3kXlurqaLW2ASaJR635rmV6VLb
	+SCzWluDLjU1RVucXPTts+e5GffpD/7vQ74aoLTcuHv0qE98aOII/0WsfvweD8OKkjIEyNySAzD
	6DirBNuaOyPBNNRYOdNzT0WWKU55Ne1h3IXqtmpYeWJnHseC3JFpMQ5rWcPDQ8aC8CGXYr9sp1K
	WjdgSAJeUslei6Mu7wPqdg9naLx5eaxy5rNSilF7LtnxyBMwipZ630vdb0nqAMEwWymvaNuMlO0
	BYgzMF64dpPuWfdg3meJwsgQhAtH7dJl2VlSeop/txvRgmeN8JR4aswHi4wGBJLRtnejafmCGyt
	B7j3UgHYdWSXtsNV8MLfQ3iXGzmtZGJOiwinek3pA5YUIirDseXK8uUIierIQxqSL33phUUqBsz
	sEqnBifkLgRnvlS4Mc=
X-Received: by 2002:a05:600c:2d15:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48e51e16d0bmr83937765e9.8.1778168682869;
        Thu, 07 May 2026 08:44:42 -0700 (PDT)
Received: from [192.168.1.17] (host-79-50-55-97.retail.telecomitalia.it. [79.50.55.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fe317sm65839805e9.4.2026.05.07.08.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:44:42 -0700 (PDT)
Message-ID: <c6e73ca7-fc97-483a-8abf-f2c31407807c@gmail.com>
Date: Thu, 7 May 2026 17:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
To: Robin Murphy <robin.murphy@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
 <d071cc86-0449-430f-a572-4f43c3440748@arm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <d071cc86-0449-430f-a572-4f43c3440748@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_084445_078438_13962ACD 
X-CRM114-Status: GOOD (  29.92  )
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

On 5/7/26 4:47 PM, Robin Murphy wrote:
> On 25/03/2026 9:11 pm, Anna Maniscalco wrote:
>> Previously the device was being accessed while potentially in a
>> suspended state.
>
> The SMMU driver's own write_context_bank() calls all look to be safely 
> within arm_smmu_rpm_get() scopes that are holding an RPM count when 
> relevant (or the one at probe time before RPM is activated at all), so 
> indeed this seems like the appropriate solution for here where we're 
> free to assume that Adreno platforms must always have a power domain.
>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
>
> Just a minor nit: it's probably OK in this case (unless Will 
> disagrees), but for future patches, it's preferable for the commit 
> message to be self-contained, so as to give a sufficiently clear 
> description of the problem, and summary of the solution, without 
> having to be read in the context of the title and the whole diff to 
> make sense. For example, if I were writing this I'd put it something 
> like:
>
> "
>   iommu/arm-smmu-qcom: Ensure SMMU is powered up in set_ttbr0_cfg
>
>   arm_smmu_write_context_bank() assumes it is being called with RPM
>   active, but it turns out that is not guaranteed in the path from
>   qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the the
>   register accesses to lead to an [external abort/hang/whatever] when
>   [doing whatever it is] while the GPU is idle. Add the RPM calls here
>   to make sure the SMMU is active before we touch it.
> "
>
> Thanks,
> Robin.
Thanks for the feedback, I've sent a v3 with an improved commit message.
>
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

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


