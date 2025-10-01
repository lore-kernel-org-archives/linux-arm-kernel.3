Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3333CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 17:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-ID:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvArmBnYwxZFDHG+7f3QRDYA2mq0pxTfhcIvB/jeV7I=; b=kw08A7fg6qMpalegTUcZjl4Yvr
	BRnU0othFTrSTEDYXusPkis7VY0vtKjoomENNbb5ckqhpDrLIVStT+WnHYIxqZJ0twfqHW+lY8O0W
	kGHibAoK19lTrhUkUbjqwhM/WQIZv2f2rSJGfwiDc/ienrR1ZOMuhtAnYa/we1aZ6S/jwCEeFhqPG
	qlPFXyuS33TZsRYFCpYKuQ5Dkyd1jT2SAwj61IaesNUdKRJy89wK5Xc3x16omrSPvzsRMDjVThW2b
	o4rbDrsADFst2PyKgiJeID4VhNl5NsiKzEJ1gC5zYyml/sbFxaHAJ56JrQdxMVmQigSsFr1WFjufv
	KIlgcbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40vs-00000008g2g-131I;
	Wed, 01 Oct 2025 17:48:04 +0000
Received: from a8-31.smtp-out.amazonses.com ([54.240.8.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40vp-00000008g24-3b3e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 17:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=xojwidlurxakxokupknu2uvuxvz4uggf; d=kvanals.org; t=1759340878;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
	bh=aBM58zz7LIm5qVT9yhJTwKXLHuaEoiEGSu/GD9elgxw=;
	b=Zs3VeK4eH7akdmeuFEMA6S80Ogqod0D5imEX76WD0mOXSiVydr4ho2/9KPZeadpW
	Qliu6eql10u1xgQiOTeMgQliu+ZpkMgFGEMRFQC9QBbSJ/+dHd7E21TXSbCXLz6ko6l
	jv05ErBjtAl0q+I+5VcR3zhIKI5SyV84ajL5xORkt9IKQrrVvjGtVoHvYHnLEkmCd43
	nxakYPGbU+oTZXdjMQBFK6FfvarRDFMV4B4EdnMigdWG0xUwTJDhoVOE6cPO0K1x9A2
	0ScZfqGLQtZEVZo9g0sfJ/UBOZYZmPXVMvDMVKOZOff1aD9Gvx42tZrRvq5fP6Zp+v8
	HzEwjfE0OA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1759340878;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To:Feedback-ID;
	bh=aBM58zz7LIm5qVT9yhJTwKXLHuaEoiEGSu/GD9elgxw=;
	b=szcpz0Bd//xaJWMRd0OlMMdk2Z0zmSKxEOdaBGcymQWFOy0fK4pyXT6agRQrTeMq
	PsE9lQzxgoiJevp5y7E19lJXNM3+X16tMf1y61K9KfM1mp5CEkblfLEPZAddwxIp13g
	Acq/wDj0AkzQHgqAYRk1UI5lXB9+49Bqg1z7Exa0=
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: KVM: arm64: Regression in at least linux-6.1.y tree with recent
 FPSIMD/SVE/SME fix
From: Kenneth Van Alstyne <kvanals@kvanals.org>
In-Reply-To: <aNz1PnARMC4DPeYb@willie-the-truck>
Date: Wed, 1 Oct 2025 17:47:58 +0000
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	catalin.marinas@arm.com, ardb@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-ID: <01000199a0e35b65-1c5cae69-ae59-43ad-b6ac-491cc43f5ca5-000000@email.amazonses.com>
References: <010001999bae0958-4d80d25d-8dda-4006-a6b9-798f3e774f6c-000000@email.amazonses.com>
 <aNz1PnARMC4DPeYb@willie-the-truck>
To: Will Deacon <will@kernel.org>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (olympus.kvanals.org [IPv6:2600:1f18:42d5:300:0:0:0:ffff]); Wed, 01 Oct 2025 17:47:58 +0000 (UTC)
Feedback-ID: ::1.us-east-1.5jHMwTu/Jzmoolk7Ak3w+RKcSxXCCShHRX8XGxXgrSs=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.8.31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_104802_176253_34540B2E 
X-CRM114-Status: GOOD (  28.65  )
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

Hi Will, thanks for the prompt reply and thorough explanation!

On the 6.1 branch, those functions have additional logic around realtime =
kernels, like so:

static void get_cpu_fpsimd_context(void)
{
        if (!IS_ENABLED(CONFIG_PREEMPT_RT))
                local_bh_disable();
        else
                preempt_disable();
        __get_cpu_fpsimd_context();
}

...

static void put_cpu_fpsimd_context(void)
{
        __put_cpu_fpsimd_context();
        if (!IS_ENABLED(CONFIG_PREEMPT_RT))
                local_bh_enable();
        else
                preempt_enable();
}


Honestly, we don't even set CONFIG_PREEMPT_RT for our ARM64 kernels, but =
in the interest of being complete, should we also not call =
preempt_enable/disable if (!irqs_disabled()) ?

I'm assuming this will get queued up for a fix in the stable branches =
soon in any case.

Thanks,

--
Kenneth Van Alstyne, Jr.
(228) 547-8045

> On Oct 1, 2025, at 05:32, Will Deacon <will@kernel.org> wrote:
>=20
> Hi Kenneth,
>=20
> Thanks for the report.
>=20
> On Tue, Sep 30, 2025 at 05:31:38PM +0000, Kenneth Van Alstyne wrote:
>> Sending via plain text email -- apologies if you receive this twice.
>>=20
>> If this isn't the process for reporting a regression in a LTS kernel =
per
>> =
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html,
>> I'm happy to follow another process.
>>=20
>> Kernel 6.1.149 introduced a regression, at least on our ARM Cortex
>> A57-based platforms, via commit =
8f4dc4e54eed4bebb18390305eb1f721c00457e1
>> in arch/arm64/kernel/fpsimd.c where booting KVM VMs eventually leads =
to a
>> spinlock recursion BUG and crash of the box.
>>=20
>> Reverting that commit via the below reverts to the old (working) =
behavior:
>>=20
>> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
>> index 837d1937300a57..bc42163a7fd1f0 100644
>> --- a/arch/arm64/kernel/fpsimd.c
>> +++ b/arch/arm64/kernel/fpsimd.c
>> @@ -1851,10 +1851,10 @@ void fpsimd_save_and_flush_cpu_state(void)
>>  if (!system_supports_fpsimd())
>>  return;
>>  WARN_ON(preemptible());
>> - get_cpu_fpsimd_context();
>> + __get_cpu_fpsimd_context();
>>  fpsimd_save();
>>  fpsimd_flush_cpu_state();
>> - put_cpu_fpsimd_context();
>> + __put_cpu_fpsimd_context();
>> }
>>  #ifdef CONFIG_KERNEL_MODE_NEON
>=20
> Hmm, the problem with doing that is it will reintroduce the bug that
> 8f4dc4e54eed ("KVM: arm64: Fix kernel BUG() due to bad backport of
> FPSIMD/SVE/SME fix") was trying to fix (see the backtrace in the =
commit
> message). So the old behaviour is still broken, just in a slightly
> different way.
>=20
>> It's not entirely clear to me if this is specific to our firmware,
>> specific to ARM Cortex A57, or more systemic as we lack sufficiently
>> differentiated hardware to know.  I've tested on the latest 6.1 =
kernel in
>> addition to the one in the log below and have also tested a number of
>> firmware versions available for these boxes.
>>=20
>> Steps to reproduce:
>>=20
>> Boot VM in qemu-system-aarch64 with "-accel kvm" and "-cpu host" =
flags set -- no other arguments seem to matter
>> Generate CPU load in VM
>>=20
>> Kernel log:
>>=20
>> [sjc1] root@si-compute-kvm-e0fff70016b4:/# [  805.905413] BUG: =
spinlock recursion on CPU#7, CPU 3/KVM/57616
>> [  805.905452]  lock: 0xffff3045ef850240, .magic: dead4ead, .owner: =
CPU 3/KVM/57616, .owner_cpu: 7
>> [  805.905477] CPU: 7 PID: 57616 Comm: CPU 3/KVM Tainted: G           =
O       6.1.152 #1
>> [  805.905495] Hardware name: SoftIron SoftIron Platform =
Mainboard/SoftIron Platform Mainboard, BIOS 1.31 May 11 2023
>> [  805.905516] Call trace:
>> [  805.905524]  dump_backtrace+0xe4/0x110
>> [  805.905538]  show_stack+0x20/0x30
>> [  805.905548]  dump_stack_lvl+0x6c/0x88
>> [  805.905561]  dump_stack+0x18/0x34
>> [  805.905571]  spin_dump+0x98/0xac
>> [  805.905583]  do_raw_spin_lock+0x70/0x128
>> [  805.905596]  _raw_spin_lock+0x18/0x28
>> [  805.905607]  raw_spin_rq_lock_nested+0x18/0x28
>> [  805.905620]  update_blocked_averages+0x70/0x550
>> [  805.905634]  run_rebalance_domains+0x50/0x70
>> [  805.905645]  handle_softirqs+0x198/0x328
>> [  805.905659]  __do_softirq+0x1c/0x28
>> [  805.905669]  ____do_softirq+0x18/0x28
>> [  805.905680]  call_on_irq_stack+0x30/0x48
>> [  805.905691]  do_softirq_own_stack+0x24/0x30
>> [  805.905703]  do_softirq+0x74/0x90
>> [  805.905714]  __local_bh_enable_ip+0x64/0x80
>=20
> Argh, this is because we can't simply mask/unmask softirqs and so when
> they get re-enabled we process anything pending. I _think_ irqs are
> disabled at this point, so perhaps we should only bother with
> disabling/enabling softirqs if hardirqs are enabled, a bit like the =
hack
> Ard had in:
>=20
> =
https://lore.kernel.org/all/20250924152651.3328941-13-ardb+git@google.com/=

>=20
> Hacky diff at the end.
>=20
>> [  805.905727]  fpsimd_save_and_flush_cpu_state+0x5c/0x68
>> [  805.905740]  kvm_arch_vcpu_put_fp+0x4c/0x88
>> [  805.905752]  kvm_arch_vcpu_put+0x28/0x88
>> [  805.905764]  kvm_sched_out+0x38/0x58
>=20
> (I think we run context_switch() =3D> prepare_task_switch() here, so =
irqs
> are disabled)
>=20
> Will
>=20
> --->8
>=20
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index fc51cdd5aaa7..a79df0804d67 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -184,7 +184,8 @@ static void __get_cpu_fpsimd_context(void)
>  */
> static void get_cpu_fpsimd_context(void)
> {
> -       local_bh_disable();
> +       if (!irqs_disabled())
> +               local_bh_disable();
>        __get_cpu_fpsimd_context();
> }
>=20
> @@ -205,7 +206,8 @@ static void __put_cpu_fpsimd_context(void)
> static void put_cpu_fpsimd_context(void)
> {
>        __put_cpu_fpsimd_context();
> -       local_bh_enable();
> +       if (!irqs_disabled())
> +               local_bh_enable();
> }
>=20
> static bool have_cpu_fpsimd_context(void)


