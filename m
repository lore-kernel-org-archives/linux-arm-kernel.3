Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5706AC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Mn9LHpATQYD60MMDJFhSmPSAE1hoAUrprtOqwvk3jQ=; b=rVPEhknGqug99MeQej7laxZM5r
	0Yto66zzmekKiwIuPQ/LeDzhKDdc+O2r6LoHNBLNlsf4LBTZbupkz3h5jp/pWIU0VPITqyYqSmn8R
	wB0hUjmYjaHRmmIN7oVrRmcAsomxOwqJsqB3wFhaSXGWHAS9Lhxv3VpKenP0RwaQPKbZPsiarRk2C
	5aIBCmMcLeiX+3wxETBEMQHM7ZadaZsrCth7NJ6oGH6TqUam/R2npE+zm281AXOdL1OrJT9fDwKQz
	NHr4m/OI/Rk3Wzs+7Jre/zmueI7FhsAO/9SevP9pk5f1OsF6NAzhIjFJ0/QeI6scjdPy4uU5KC4Bh
	lyFMA9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7mI-0000000Dm3c-0VAv;
	Fri, 25 Sep 2026 15:23:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7mF-0000000Dm3C-2mzV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:23:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E24B1688;
	Fri, 25 Sep 2026 08:23:51 -0700 (PDT)
Received: from [10.57.10.17] (unknown [10.57.10.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 863F73F882;
	Fri, 25 Sep 2026 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790349834; bh=//y9dPhjHq/ujPCrO92ZhJvyqsgBfC/qyzgIoS31GyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hiPkvze6xWnuXgjf7isAW+6ZYs+8hiozwT76bIXaPIMZqQDQFSopSgQ6Ul8qjMvDN
	 1dn7ziLWqkMm5w1VMB5N5WKNtRd5RVjl7Wmcv+VRFKuQCVGYi7yYBkALg4o1GccVnq
	 VNXBzkBnu5Ats955xS9i5iq3lPWyOYFAmdJTS9MI=
Message-ID: <f7662116-ef8e-4f97-90a4-07173236617b@arm.com>
Date: Fri, 25 Sep 2026 16:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com> <arZQCiF3iqp9eCsy@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <arZQCiF3iqp9eCsy@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_082356_146875_FFC5330B 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 25/09/2026 11:42, Catalin Marinas wrote:
> On Thu, Sep 24, 2026 at 02:51:56PM +0100, Suzuki K Poulose wrote:
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 32102c3912fa7..e8b29983b0021 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -293,6 +293,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar3[] = {
>>   static const struct arm64_ftr_bits ftr_id_aa64pfr0[] = {
>>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV3_SHIFT, 4, 0),
>>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_CSV2_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_EL1_RME_SHIFT, 4, 0),
> 
> I think we end up exposing this to (any) guest unless we mask it out in
> sanitise_id_aa64dfr0_el1(). Do the guests care about the RME version? I

Valid point. I personally don't think this matters. The FEAT_RME alone
is not useful or harmful. I could mask it in KVM as a safe bet.

Cheers
Suzuki

> don't think they should, especially the non-realm ones. For nested it's
> masked away already (limit_nv_id_reg()).
> 


