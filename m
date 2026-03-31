Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB681061B32
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiV+1znICc4RRD/GuO7WBE/z8znFEgrbrfEBfCb3I90=; b=s2M4+5pn8rrWoi6PjbwTC96dFS
	gy1shqjpFdzKyBJv6Cq1G4Pz4+IwA1anNdIG+QImwD2JABeQKc1qniiY0lvQpXD7MOksqbV19T5O8
	V0OTCLXQ4bQKGHfXHIquZe8uraVX8T8/b3ISQCtMDY12Ng68CmYCDdCR7oAePwAQjV0z2MPHUCs8u
	jOYr+TeLr8RlAwMyDOHZ9K7wFfePyqbYLNU4s7guAd0F4ERVX9PZnTgwhpKughbA9qEOsXrDxlJ0X
	+dg3qA/ldmwoTwPo88UiLHNLqfxJ88vh1Y8Oba7HpWTA0pT/vtJNZuNNB5nxEAl4mzmqI+3VFI/E+
	g7X1/TnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7X8l-0000000Cqij-0dzD;
	Tue, 31 Mar 2026 11:20:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7X8j-0000000CqiI-1Eti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 11:20:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06C6C1D31;
	Tue, 31 Mar 2026 04:20:02 -0700 (PDT)
Received: from [10.57.17.66] (unknown [10.57.17.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6114F3F641;
	Tue, 31 Mar 2026 04:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774956007; bh=n1ZePIbPk37s4fDM2JRxX9OGO38qfVv+3mF2l5ZHx4U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AyickMe9wbMD8Fc6tfFysdPK5l72V8ovZVsDJj7Rrlr9HGRNq+lasflNzmYd3p/5Y
	 knSwLpQCMxJGtZR7mQD2278qbwlaUElPPwRl02MDq8G3kkAFjuBNv7nXSyXjWSfJvn
	 wCPBgyafkofu/BNtznjbx3UHtLH60JM2avqbxXeM=
Message-ID: <afc5bd00-28ca-413b-b047-ee53589c285d@arm.com>
Date: Tue, 31 Mar 2026 12:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] arm64: Skip update of an idreg field affected by
 an override
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, Fuad Tabba <tabba@google.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20260302115653.1517326-1-maz@kernel.org>
 <20260302115653.1517326-2-maz@kernel.org> <abwXl35xQ2ze1XwJ@arm.com>
 <a35839df-74a0-46b3-b5e8-7e0a066b210d@arm.com> <acQgq4oNWP__3qvV@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <acQgq4oNWP__3qvV@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_042009_445215_D4541AF2 
X-CRM114-Status: GOOD (  31.48  )
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

On 25/03/2026 17:51, Catalin Marinas wrote:
> On Wed, Mar 25, 2026 at 02:54:28PM +0000, Suzuki K Poulose wrote:
>> On 19/03/2026 15:34, Catalin Marinas wrote:
>>> On Mon, Mar 02, 2026 at 11:56:42AM +0000, Marc Zyngier wrote:
>>>> When computing the new value od an idreg that contains a field
>>>> affected by an override, do not update that particular field.
>>>>
>>>> The value computed at init-time must be kept as-is, as that's
>>>> what the user has asked for, for better or worse.
>>>>
>>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>>> ---
>>>>    arch/arm64/kernel/cpufeature.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>>> index c31f8e17732a3..28fc77443ccd3 100644
>>>> --- a/arch/arm64/kernel/cpufeature.c
>>>> +++ b/arch/arm64/kernel/cpufeature.c
>>>> @@ -1224,6 +1224,13 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
>>>>    		s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
>>>>    		s64 ftr_new = arm64_ftr_value(ftrp, new);
>>>> +		/*
>>>> +		 * Don't alter the initial value that has been forced
>>>> +		 * by an override.
>>>> +		 */
>>>> +		if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
>>>> +			continue;
>>>
>>> I got lost in the in the cpufeature framework, so I may be missing
>>> something.
>>>
>>> Let's say the primary CPU has a feature field with value 2 and we want
>>> to override it to value 1. For e.g. a LOWER_SAFE feature, boot_cpu_data
>>> will stored the overridden value of 1.
>>>
>>> A secondary CPU comes online with the same feature missing, so value 0.
>>> With the above change, we no longer update the system-wide feature
>>> value, leave it as 1. Later on, for a system feature we may turn it on
>>> even though the secondary CPU does not support it.
>>>
>>> In summary, this makes the overridden field sticky for secondary CPUs
>>> even if they don't support it.
>>
>> That is true. I think we should let the secondary CPUs alter the values,
>> with initial CPU feature value with the override value set, the system
>> could then choose the safest among the override and the others.
> 
> It works for me. We should add a comment somewhere that the override is
> not expected to work for features where we allow differences (some
> FTR_NONSTRICT).
> 
>>> Unrelated to your patch, I think we can similarly fail to reject
>>> secondary CPUs in check_early_cpu_features() -> verify_local_cpu_caps()
>>> because of __read_sysreg_by_encoding() which uses the override value
>>> unconditionally. From this perspective, we are now consistent with your
>>> patch above.
>>
>> This is true as well and the override takes the priority and with the
>> wrong level of override value the system could be made to think that
>> some features are available even when it is unsafe to do so.
>> We should sanitise the values read by __read_sysreg_by_encoding() with
>> the "overrides". I can cook something up.
> 
> Or remove this check if we expect the override to only work on the
> resulting sanitised value, not individual checks.

True, but if some capabilities are PERCPU local features, then there is
no way to override them with the controls. I have the following patch,
that could do the trick :

--8>--

arm64: Apply overrides to CPU local capabilities

If an override has been applied, make sure we apply that for the
secondary CPUs too, to limit the features.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
  arch/arm64/kernel/cpufeature.c | 40 +++++++++++++++++++++++++++-------
  1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 2e1e4de9a2cd..2b494302b767 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1217,10 +1217,41 @@ void __init init_cpu_features(struct 
cpuinfo_arm64 *info)
  		init_cpu_ftr_reg(SYS_GMID_EL1, info->reg_gmid);
  }

+/*
+ * Sanitise the register fields to clamp the values to the overrides that
+ * has been applied.
+ */
+static u64 override_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 val)
+{
+	const struct arm64_ftr_bits *ftrp;
+
+	if (!reg || !reg->override->mask)
+		return val;
+
+	for (ftrp = reg->ftr_bits; ftrp->width; ftrp++) {
+		u64 ftr_mask = arm64_ftr_mask(ftrp);
+		s64 ftr_val, ftr_ovr, ftr_safe;
+
+		/* Skip the fields not overridden */
+		if ((ftr_mask & reg->override->mask) != ftr_mask)
+			continue;
+
+		ftr_val = arm64_ftr_value(ftrp, val);
+		ftr_ovr = arm64_ftr_value(ftrp, reg->override->val);
+		ftr_safe = arm64_ftr_safe_value(ftrp, ftr_ovr, ftr_val);
+
+		if (ftr_safe != ftr_val)
+			val = arm64_ftr_set_value(ftrp, val, ftr_safe);
+	}
+	return val;
+}
+
  static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
  {
  	const struct arm64_ftr_bits *ftrp;

+	/* Apply the overrides */
+	new = override_cpu_ftr_reg(reg, new);
  	for (ftrp = reg->ftr_bits; ftrp->width; ftrp++) {
  		s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
  		s64 ftr_new = arm64_ftr_value(ftrp, new);
@@ -1524,7 +1555,6 @@ EXPORT_SYMBOL_GPL(read_sanitised_ftr_reg);
   */
  u64 __read_sysreg_by_encoding(u32 sys_id)
  {
-	struct arm64_ftr_reg *regp;
  	u64 val;

  	switch (sys_id) {
@@ -1577,13 +1607,7 @@ u64 __read_sysreg_by_encoding(u32 sys_id)
  		return 0;
  	}

-	regp  = get_arm64_ftr_reg(sys_id);
-	if (regp) {
-		val &= ~regp->override->mask;
-		val |= (regp->override->val & regp->override->mask);
-	}
-
-	return val;
+	return override_cpu_ftr_reg(get_arm64_ftr_reg(sys_id), val);
  }

  #include <linux/irqchip/arm-gic-v3.h>
-- 
2.43.0



> 


