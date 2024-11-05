Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A03D1CA0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 02:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:CC:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+OQffKNR5BLtwWsTOqp9Y8it4SWwjV1HbNYyqG5h3g=; b=Lx3bvfPFFa9me9xRUIR/8y8K0i
	tguv7vwXEx7zDzQ6+FtFcEiPFqyQY6GcYyTfd3numdNXCLDuW2rOI/2ZrzKDAKTKdXXb3s9wFcrXg
	/0hh0ECQCIjUKZzi4vi8RXFLBacIukS2Rii6iOvq/6bzVt3tBU7AdfBc4bGthxuGpHDABdJnO7D8l
	BVhlxR+bB1Ecgt02ED+gcH2gf7V0yux2C/dyB8O+2PFxPQvWh9MOKdR6O8g80e/uc+CaDpf4PuMsm
	aAzlSDPsD1oFn0TLkbcUPLywPHoYme4+/XICTKPDUZC8YWtr4gRoY+wyfJ6cp0gMN6164UhLuRg/E
	HRrM6XSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89cz-0000000FgR3-3OZc;
	Tue, 05 Nov 2024 02:49:10 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89bH-0000000FgMI-3yZF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 02:47:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XjCRZ3fWMz1ypCW;
	Tue,  5 Nov 2024 10:47:22 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id A57321A016C;
	Tue,  5 Nov 2024 10:47:12 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 5 Nov 2024 10:47:11 +0800
CC: <yangyicong@hisilicon.com>, <will@kernel.org>, <maz@kernel.org>,
	<mark.rutland@arm.com>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <oliver.upton@linux.dev>,
	<ryan.roberts@arm.com>, <linuxarm@huawei.com>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v4 3/5] arm64: Add support for FEAT_HAFT
To: Catalin Marinas <catalin.marinas@arm.com>
References: <20241102104235.62560-1-yangyicong@huawei.com>
 <20241102104235.62560-4-yangyicong@huawei.com> <ZykEUGdkyYClM8Zi@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <b851d802-ed2a-cad2-b96a-f7a9e3bb746e@huawei.com>
Date: Tue, 5 Nov 2024 10:47:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ZykEUGdkyYClM8Zi@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_184724_185994_F8199D60 
X-CRM114-Status: GOOD (  15.64  )
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

On 2024/11/5 1:28, Catalin Marinas wrote:
> On Sat, Nov 02, 2024 at 06:42:33PM +0800, Yicong Yang wrote:
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index 3d261cc123c1..ed8c784ca082 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -838,6 +838,12 @@ static inline bool system_supports_poe(void)
>>  		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
>>  }
>>  
>> +static inline bool system_supports_haft(void)
>> +{
>> +	return IS_ENABLED(CONFIG_ARM64_HAFT) &&
>> +		cpus_have_final_cap(ARM64_HAFT);
>> +}
> 
> I'm fine with this approach. If we ever get hardware with mismatched
> FEAT_HAFT and some secondary CPUs don't come up, we can revisit.
> 
>> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
>> index ccbae4525891..0bc88df7cb35 100644
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -498,6 +498,10 @@ alternative_else_nop_endif
>>  	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
>>  	cbz	x9, 1f
>>  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
>> +
>> +#ifdef CONFIG_ARM64_HAFT
>> +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
>> +#endif /* CONFIG_ARM64_HAFT */
>>  1:
>>  #endif	/* CONFIG_ARM64_HW_AFDBM */
>>  	msr	mair_el1, mair
> 
> If you still want #ifdefs, I'd have left it outside the HW_AFDBM. We
> already have a dependency in the Kconfig. Anyway, I can fix this up.

yes it has already depend on the HW_AFDBM. And one asm won't cause much to the
Image size if user want CONFIG_ARM64_HAFT=n. I'll drop the #ifdef here.

> I think as an additional patch we can also remove the ID checks for the
> tcr bit in tge HW_AFDBM case. But that's unrelated to this series.

ok. I'll post a separate patch for dropping this.

Thanks.



