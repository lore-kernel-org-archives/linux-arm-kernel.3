Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B84109C04A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky4DvPbbgbPbz/fiQ3c/eRMLtH5FjLUEf7wNWkzqAPI=; b=JQZ5IIKCSn7tmrKlmQfFHp8iqQ
	jjd5Ldm2eUfuAtGoCMkH6m0WnBy1IqGFo2WWnCBFIPnRittjHnfzKlgdV8i9ApTQaVYL+Y6gnYYNc
	D7vMrsGkSHeXf3jkBLJFVbWcHls80e8OPCxyMm5GQ1T6sGe5gU8NqKqLGVvX4f2zTSM2pSIogZFju
	vax63pNHd0FNJ26r12/8QWWG1ME3VC/43oIWcz1pt2ApWWd4m08qWZgf9HomrWrR6FyfLxXqMsnoR
	GPPViL/1cSj1l7buP5lGwSrS+0Nrbq+OG5xxgIVZshGuFJu8AtlchjduNX2ng0fdo2y6YyVRYbGl1
	/7PaSFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SOR-000000041F0-3bly;
	Wed, 25 Mar 2026 17:51:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SOP-000000041EG-0P3y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 17:51:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0E92444;
	Wed, 25 Mar 2026 10:51:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC8033F836;
	Wed, 25 Mar 2026 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774461104; bh=eyHFdRn6lnnq6+lCvCionMA4Nb++tb101R0MsbqPO8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uzw9nsMrAWynoJtFLpCa/TUcYX/0f9tskJXQBeSJ+HaO/oOxxij0klbRy1ONBXGnE
	 Ewv0m9zqd7e9lcNBYGd7L/pESkasEwZrYk4zx68dv4N/cY5upC/HsEvFU218WccCqq
	 qWtbgxCz292RMALQFQs+nea5dMsRCAVoRbn8pbBo=
Date: Wed, 25 Mar 2026 17:51:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 01/11] arm64: Skip update of an idreg field affected
 by an override
Message-ID: <acQgq4oNWP__3qvV@arm.com>
References: <20260302115653.1517326-1-maz@kernel.org>
 <20260302115653.1517326-2-maz@kernel.org>
 <abwXl35xQ2ze1XwJ@arm.com>
 <a35839df-74a0-46b3-b5e8-7e0a066b210d@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a35839df-74a0-46b3-b5e8-7e0a066b210d@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_105145_449055_D9F34E9F 
X-CRM114-Status: GOOD (  35.18  )
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

On Wed, Mar 25, 2026 at 02:54:28PM +0000, Suzuki K Poulose wrote:
> On 19/03/2026 15:34, Catalin Marinas wrote:
> > On Mon, Mar 02, 2026 at 11:56:42AM +0000, Marc Zyngier wrote:
> > > When computing the new value od an idreg that contains a field
> > > affected by an override, do not update that particular field.
> > > 
> > > The value computed at init-time must be kept as-is, as that's
> > > what the user has asked for, for better or worse.
> > > 
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >   arch/arm64/kernel/cpufeature.c | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > > index c31f8e17732a3..28fc77443ccd3 100644
> > > --- a/arch/arm64/kernel/cpufeature.c
> > > +++ b/arch/arm64/kernel/cpufeature.c
> > > @@ -1224,6 +1224,13 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
> > >   		s64 ftr_cur = arm64_ftr_value(ftrp, reg->sys_val);
> > >   		s64 ftr_new = arm64_ftr_value(ftrp, new);
> > > +		/*
> > > +		 * Don't alter the initial value that has been forced
> > > +		 * by an override.
> > > +		 */
> > > +		if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
> > > +			continue;
> > 
> > I got lost in the in the cpufeature framework, so I may be missing
> > something.
> > 
> > Let's say the primary CPU has a feature field with value 2 and we want
> > to override it to value 1. For e.g. a LOWER_SAFE feature, boot_cpu_data
> > will stored the overridden value of 1.
> > 
> > A secondary CPU comes online with the same feature missing, so value 0.
> > With the above change, we no longer update the system-wide feature
> > value, leave it as 1. Later on, for a system feature we may turn it on
> > even though the secondary CPU does not support it.
> > 
> > In summary, this makes the overridden field sticky for secondary CPUs
> > even if they don't support it.
> 
> That is true. I think we should let the secondary CPUs alter the values,
> with initial CPU feature value with the override value set, the system
> could then choose the safest among the override and the others.

It works for me. We should add a comment somewhere that the override is
not expected to work for features where we allow differences (some
FTR_NONSTRICT).

> > Unrelated to your patch, I think we can similarly fail to reject
> > secondary CPUs in check_early_cpu_features() -> verify_local_cpu_caps()
> > because of __read_sysreg_by_encoding() which uses the override value
> > unconditionally. From this perspective, we are now consistent with your
> > patch above.
> 
> This is true as well and the override takes the priority and with the
> wrong level of override value the system could be made to think that
> some features are available even when it is unsafe to do so.
> We should sanitise the values read by __read_sysreg_by_encoding() with
> the "overrides". I can cook something up.

Or remove this check if we expect the override to only work on the
resulting sanitised value, not individual checks.

-- 
Catalin

