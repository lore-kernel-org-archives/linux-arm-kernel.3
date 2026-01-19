Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57504D29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IC8dmyXUgGXJkFzck0emBpMKcZH6nFfGmpejhPsMbGA=; b=dK0v6/4G5d4Vzb1OoC5j/Ya0ex
	/S85wh9KHFBW9Y7iKoVzOxAPhxT9+xOW9mmpUv+qkfn9IGEqIPv/MoZRni74/NbHex6E/iC2D9Jsr
	ol/TOf91JrPQlqz9xzda9beRTve6YDmR8iJK/PBbH8YnhZDSli0RWX/KFgfrdUxac/cxr5ezvpGzq
	JWQV9yj5sMl+bXrhYxRyf1FSsJuzO4w4XJTQb3I2noZYyohRJo77oUHwz9ms1voVVaN/kqCk+Ki2C
	n6NMby+Gu2xt6zvjifGT6VCOf/uXdroVE7QYF/1BxfU+K9TeT8A6GvfAg9gVv02CLATe5/Ri0/BqC
	VEcvCGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpUc-00000002B8z-3Ojw;
	Mon, 19 Jan 2026 13:40:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpUX-00000002B8U-0iBT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:40:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D454B497;
	Mon, 19 Jan 2026 05:40:17 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A07073F694;
	Mon, 19 Jan 2026 05:40:19 -0800 (PST)
Message-ID: <d673a478-0f8f-4122-b49a-cd30213f1b5f@arm.com>
Date: Mon, 19 Jan 2026 13:40:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/47] arm64: mpam: Initialise and context switch the
 MPAMSM_EL1 register
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, will@kernel.org,
 corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-11-ben.horgan@arm.com> <aWk7Pyai4AcoQc_J@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <aWk7Pyai4AcoQc_J@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_054025_257880_A2A0E07B 
X-CRM114-Status: UNSURE (   9.56  )
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

Hi Catalin,

On 1/15/26 19:08, Catalin Marinas wrote:
> On Mon, Jan 12, 2026 at 04:58:37PM +0000, Ben Horgan wrote:
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 0cdfb3728f43..2ede543b3eeb 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2491,6 +2491,8 @@ cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
>>  		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
>>  
>>  	write_sysreg_s(regval, SYS_MPAM1_EL1);
>> +	if (system_supports_sme())
>> +		write_sysreg_s(regval & (MPAMSM_EL1_PARTID_D | MPAMSM_EL1_PMG_D), SYS_MPAMSM_EL1);
>>  	isb();
> 
> Do we know for sure that system_supports_sme() returns true at this
> point (if SME supported)? Digging into the code, system_supports_sme()
> uses alternative_has_cap_unlikely() which relies on instruction
> patching. setup_system_capabilities(), IIUC, patches the alternatives
> after enable_cpu_capabilities(). I think you better use cpus_have_cap().
> 

I'll switch to cpus_have_cap().

Thanks,

Ben


