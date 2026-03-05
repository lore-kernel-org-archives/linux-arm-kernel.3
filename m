Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757C1F30956
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVxY2Nvs4CUcsSzzohIG+ez/mPEabd4kcPakxAuZGEQ=; b=HM9676IdIX9XsccMiONcIa+PXF
	BY6sDLCgA+rqr1VrFR75SUaGlySI06PXtOB6xt0+qhisHK2a0AMUzAWWUhaluvJGjDDy7A1tzRuHH
	nuF9Lq3wDXMhWaM2jKKto+xct7gS/OoTHocI6tUyHl6o+VwTIdhwfpGoIb2kxAHGOrfleZaR+ookF
	PZU3NJH7tbxbvqEfVvQ5Gg6CLZn9z4nyrWF512+5h0VneZW1okyVtyPq1yQcA423E4IgeB8+YRVlP
	oVDB3i803gQ+LlfQuaAhLcIAmqPLJUDJzHoI+CGktyns3eTlOLbPDtXwaX0l3trTFeF9iGvfgShrr
	ucsNiZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8T1-00000001r99-1O42;
	Thu, 05 Mar 2026 13:10:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Sz-00000001r8l-3OEJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 13:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LVxY2Nvs4CUcsSzzohIG+ez/mPEabd4kcPakxAuZGEQ=; b=XWvalX5FVTT1IYPUm0sJJQQGNL
	3ZyazmKsst/Tu/o1lzWR1AfZQPDBFUOW7IlaOGw4+Jwr3tkNwTk5ep2vp3RP2wWohUity6aI/JMpi
	jttcZ6fVnM9eP8TA4I7myRrEMb+TZCe4IgNoRHP6gThWCRl3foxdYoLrfoRr4df7UUZarXBgmF1e5
	lvZutvve4LmoF6gnrOWc98DptY4csH+2ZmwuJLWc+XW20+r4eWAxDiM2lyfJK5AEPJCopK/DQS2Ev
	ysZno+3SWW4/YEf//qr0EAPeQlv2nCRNLT6wSzV/+ryy9m3FKB3dqIvHt7Rd2PCP3GFClxCHkV9xt
	bsgySxeg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Sw-00000006oDq-1mR5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:10:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439b2965d4bso4188876f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772716208; x=1773321008; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVxY2Nvs4CUcsSzzohIG+ez/mPEabd4kcPakxAuZGEQ=;
        b=C9acug8Da1qm0ApjmNls+9rjKg06L22dminHHiEsTfLeBtAgiZKVyGt4z8aYSpKi2V
         bQkIB2ghpBpeZ0aCWrHYJxMl0OBn8n/Mq8DFOIF5BVhyV22BTfoYqTUd21N2ebq8Wn+E
         YBz215pWQ13kHK8CNgzf64DnZa6Oq2WhmTHFJfJ7We+dBXcVLnLTfW/ecyHuatvKQxSN
         AGWBvqrYXN2w6NNibH/sTVZsL/NCTJPvH39tbj8pz2rCn1XGn8UPWuAvVva4T+Nkhy2F
         nZDD8ztM9V+JJOuUVaTwfSxl6LdXpf/RByyw0TceUI7SudCQ5JaOYLDSmpGYzGGwaaRO
         EXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772716208; x=1773321008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVxY2Nvs4CUcsSzzohIG+ez/mPEabd4kcPakxAuZGEQ=;
        b=bksRaoCJGgHzu6G3FOmIw7G79dNpyTXgGOkSar7VpV9nl4BuVJKdezPYUUkAMmjXpe
         S4JXVy42CmStrubsqzfRpDl2I4KrlAnd+rNGuWyNzT6kmaTrO/ScmdmE/0J7z+Xcbk/R
         nRUf/9v82aTfwt4sgMf6zD3GsOakBsgbZ8hQv3d2K36YhI8GMkz0vuz78kJsTrWusYMQ
         lhi1GTLr1yMDk84NgS6QUlauydHCGkV8ie4L9z9ZnN3TF1rgVyuPaaCJSOEDZITPJmzC
         IhWCEzs+cthXfSCIh2LELoRE3WW6xYIhrCTNzyBBVSwjUNFZ3935LKLH6wuyGFhZk+vW
         alew==
X-Forwarded-Encrypted: i=1; AJvYcCV0kmYMeSd0L2GxUNP5nLzDVVvrxl4P3NNHdgpFAoNr68x+tkJBpk6Iz0T4UM1qlr5X8Gkw1n1sFvvPOXjQMyy/@lists.infradead.org
X-Gm-Message-State: AOJu0YyYAvupCdz2g0qds+H9DSMYlU01JbDqNOy/t6K2MfVSEF07/aLQ
	tfbAFoSQCxG4udjK8H01SqiZjuEsBtRGOOMgkFoN25C7JU0CWLqcAk94kDhdoQ0Yo6TjrKHjG57
	8DMymvxI=
X-Gm-Gg: ATEYQzx1CsiRhtwJVdOD7l10zT/apIGnM/rMpOjRLSrneeEZZuIE5/lzr/qQivpxyE5
	vPYzpGE5kzFODErAXNHvsmwEipTPaC9xlOFLb+xOtztDSpXs4aI/DbAeySzunOKBVxkZyTF3vdr
	8E8LTYvtMAN3bv02uWT/5oNSKerPaLSqYP+QNh3q/IIy4LKx1bX+WEv6QSCMmxYrzvnii55vQ3P
	HU/J50cf1FmocBDsNcDvas0nhfnvhlMpBxFE+JuuYDC1X1kT4e74VYCh19yLEkqytkrbhIBgiQS
	/lxQ+3+ju0DFWxSzdWZ0POz0Dfn5YaiRFHyKrvfY/OQlW1xG6rwENY8j1q6ehvgEnwbUDx6NAoX
	RtwCv+H30hi06/eB9HH36tUAq6JE/4DbiqR92IyO706WEiXxYnOqAJGtvDBXkFOLSa6OTEJyOPw
	tSFR18zvZfMcRoX1KLd0oBRpEYB8Ko
X-Received: by 2002:a05:6000:22c2:b0:439:b715:6f49 with SMTP id ffacd0b85a97d-439c8020eadmr11409689f8f.59.1772716208133;
        Thu, 05 Mar 2026 05:10:08 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm30338894f8f.4.2026.03.05.05.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 05:10:07 -0800 (PST)
Message-ID: <208aebfe-3b25-4bf5-8c82-71f323f57847@linaro.org>
Date: Thu, 5 Mar 2026 13:10:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Read PMUVer as unsigned
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Colton Lewis <coltonlewis@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260305-james-kvm-pmuver-sign-v1-1-eea0a2116dd0@linaro.org>
 <86pl5i7ahj.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <86pl5i7ahj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_131010_566498_EC5B4263 
X-CRM114-Status: GOOD (  17.33  )
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



On 05/03/2026 11:59 am, Marc Zyngier wrote:
> On Thu, 05 Mar 2026 11:50:01 +0000,
> James Clark <james.clark@linaro.org> wrote:
>>
>> ID_AA64DFR0_EL1.PMUVer is an unsigned field, so this skips
>> initialization of host_data_ptr(nr_event_counters) for PMUv3 for Armv8.8
>> onwards as they appear as negative values.
>>
>> Fix it by reading it as unsigned.
>>
>> Fixes: 2417218f2f23 ("KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/kvm/debug.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 3ad6b7c6e4ba..b8632edba9a3 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -76,7 +76,7 @@ void kvm_init_host_debug_data(void)
>>   {
>>   	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
>>   
>> -	if (cpuid_feature_extract_signed_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
>> +	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
>>   		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
>>   							      read_sysreg(pmcr_el0));
>>   
> 
> How does this work on a system that advertises a non-architected PMU?
> 
> 	M.
> 

Hmmm yeah I suppose it doesn't, there's actually already 
pmuv3_implemented() and has_pmuv3() which open code the same check 
again. Maybe I can try re-using something and tidying it up.


