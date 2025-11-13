Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418C1CD5BC7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odvoltUK/dRo1JBW9Ei0JMd3EJS3tGAZW0oVxpOuIO4=; b=GqhpjsVAI6lt2YvH8CdGyhDfhc
	AX5dhBhFjaTCqO/yEfGWnKAzRs4OnVfEmaNi0mYgKNl9zDdED4BrinYqUK1Bf2IHI+k4pQ1lgDOSc
	KmZJ9yHpFoBRlx2v+0Fuk4kKAmBpBPWWeGA4rY0VCao9kVao6miZ8aTJqAColslOrQe1jBAVQDO7k
	tZOEKkU0uwiSaX0SzQOng7F29usDy3DbkvsKdwKoOQNcxlbuC3y1irsQhB5Bnl/NgtI+5inivu7nh
	tiiM5JcPjmLPreR6IcxBMcCzvlSsabYMSY78hO7rIThc4MbKth8hiPdUInXHw3sHNPJ6PWwaGqHRB
	luXaFIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVNi-0000000ANbt-2Gl7;
	Thu, 13 Nov 2025 11:20:50 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVNe-0000000ANbK-1jSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 11:20:48 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251113112042euoutp02157ac29f3d43fc48ff9fbaf412aa832b~3jQdtMsba2135921359euoutp02_
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 11:20:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251113112042euoutp02157ac29f3d43fc48ff9fbaf412aa832b~3jQdtMsba2135921359euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763032842;
	bh=odvoltUK/dRo1JBW9Ei0JMd3EJS3tGAZW0oVxpOuIO4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hG0xtnvXvrpfYjrfneHCHyyVnzjmJfY2SdAW/hMZsh8/5xxPVU5u8m2fYZyN8DGTh
	 CbGUi8lUVudJXuLS+lpRtN8pcGlDk2seG+vrc7772tcIyF2mo9NbYGBRGKYdcJ/TVZ
	 4Pmk/+/gklVfjXzUlmBrNHRTIr2iPV8ETuNRCh2A=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251113112041eucas1p26612d4e1c1ed5f4bc3e4e89731845869~3jQc2iQ3N1731417314eucas1p2E;
	Thu, 13 Nov 2025 11:20:41 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251113112040eusmtip26f28645250051b318f2dca8faa7a8aab~3jQcQXypg0318803188eusmtip2E;
	Thu, 13 Nov 2025 11:20:40 +0000 (GMT)
Message-ID: <25249458-6df8-4457-a7a8-18b8c1d6c3e6@samsung.com>
Date: Thu, 13 Nov 2025 12:20:39 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 04/45] KVM: arm64: Turn vgic-v3 errata traps into a
 patched-in constant
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, Zenghui Yu
	<yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Yao Yuan
	<yaoyuan@linux.alibaba.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <86qzu2tczj.wl-maz@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251113112041eucas1p26612d4e1c1ed5f4bc3e4e89731845869
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251113095225eucas1p261508e40d5b802f6e5be58600bb4a02c
X-EPHeader: CA
X-CMS-RootMailID: 20251113095225eucas1p261508e40d5b802f6e5be58600bb4a02c
References: <20251109171619.1507205-1-maz@kernel.org>
	<20251109171619.1507205-5-maz@kernel.org>
	<CGME20251113095225eucas1p261508e40d5b802f6e5be58600bb4a02c@eucas1p2.samsung.com>
	<b618732b-fd26-49e0-84c5-bfd54be09cd2@samsung.com>
	<86qzu2tczj.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_032047_072608_415C4E0B 
X-CRM114-Status: GOOD (  17.36  )
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

On 13.11.2025 11:59, Marc Zyngier wrote:
> On Thu, 13 Nov 2025 09:52:23 +0000,
> Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 09.11.2025 18:15, Marc Zyngier wrote:
>>> The trap bits are currently only set to manage CPU errata. However,
>>> we are about to make use of them for purposes beyond beating broken
>>> CPUs into submission.
>>>
>>> For this purpose, turn these errata-driven bits into a patched-in
>>> constant that is merged with the KVM-driven value at the point of
>>> programming the ICH_HCR_EL2 register, rather than being directly
>>> stored with with the shadow value..
>>>
>>> This allows the KVM code to distinguish between a trap being handled
>>> for the purpose of an erratum workaround, or for KVM's own need.
>>>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> This patch landed in today's linux-next as commit ca30799f7c2d ("KVM:
>> arm64: Turn vgic-v3 errata traps into a patched-in constant"). In my
>> tests I found that it triggers oops and breaks booting on Raspberry Pi5
>> and Amlogic SM1 based boards: Odroid-C4 and Khadas VIM3l. Here is the
>> failure log:
>>
>> alternatives: applying system-wide alternatives
>> Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 18 Comm: migration/0 Not tainted 6.18.0-rc3+ #11665
>> PREEMPT
>> Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
>> Stopper: multi_cpu_stop+0x0/0x178 <- __stop_cpus.constprop.0+0x7c/0xc8
>> pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : vgic_v3_broken_seis+0x14/0x44
>> lr : kvm_compute_ich_hcr_trap_bits+0x48/0xd8
>> ...
>> Call trace:
>>    vgic_v3_broken_seis+0x14/0x44 (P)
>>    __apply_alternatives+0x1b4/0x200
>>    __apply_alternatives_multi_stop+0xac/0xc8
>>    multi_cpu_stop+0x90/0x178
>>    cpu_stopper_thread+0x8c/0x11c
>>    smpboot_thread_fn+0x160/0x32c
>>    kthread+0x150/0x228
>>    ret_from_fork+0x10/0x20
>> Code: 52800000 f100203f 54000040 d65f03c0 (d53ccb21)
>> ---[ end trace 0000000000000000 ]---
>> note: migration/0[18] exited with irqs disabled
>> note: migration/0[18] exited with preempt_count 1
>> rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>> rcu:     1-...0: (7 ticks this GP) idle=0124/1/0x4000000000000000
>> softirq=9/10 fqs=3250
>> rcu:     2-...0: (7 ticks this GP) idle=0154/1/0x4000000000000000
>> softirq=9/10 fqs=3250
>> rcu:     3-...0: (7 ticks this GP) idle=018c/1/0x4000000000000000
>> softirq=9/10 fqs=3250
>> rcu:     (detected by 0, t=6502 jiffies, g=-1179, q=2 ncpus=4)
>> Sending NMI from CPU 0 to CPUs 1:
>> Sending NMI from CPU 0 to CPUs 2:
>> Sending NMI from CPU 0 to CPUs 3:
>>
>> Let me know how I can help in debugging this issue.
> Wild guess. Can you try this (untested)?
>
> 	M.
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> index fc7a4cb8e231d..598621b14a30d 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> @@ -829,8 +829,8 @@ static const struct midr_range broken_seis[] = {
>   static bool vgic_v3_broken_seis(void)
>   {
>   	return (is_kernel_in_hyp_mode() &&
> -		(read_sysreg_s(SYS_ICH_VTR_EL2) & ICH_VTR_EL2_SEIS) &&
> -		is_midr_in_range_list(broken_seis));
> +		is_midr_in_range_list(broken_seis) &&
> +		(read_sysreg_s(SYS_ICH_VTR_EL2) & ICH_VTR_EL2_SEIS));
>   }
>   
>   void noinstr kvm_compute_ich_hcr_trap_bits(struct alt_instr *alt,

That's it! Now it boots fine on the mentioned boards. Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


