Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C5ECD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 20:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70yQ8bv6MXX6iZNUydJIVV6T4ubI6+gm2CGCrTBA49k=; b=X28kvlyCpoveo8JSR1hoZvfHsR
	/4+lyGXqspgxl+0KgFkCZPYcakCRM7patE4c33/xgaoMpwNUQjBEjBzweLbYvDvYTLVKJTO4Y206Z
	UYz5VMnNrmK2fzMwC0vEzkQ3IRY/bD+THC5u1fOCTf3aFUxJIEo0YtHNm3FbyJCuDTW0K3W8S8pgX
	9JAwm14q/937grhOW2cdktWZhws4SF0boBEbTbBGV+R2Wwjee9DGf7F7XACdMTmy8cdsCA8WB2byi
	SBKpOi9hzNh8Qrd9b4ehVwsQRW8BxTwnlk96RUPLbLi+ZtHFqyjTDbcpuJr/NiNl5DwHHZ1EoLloR
	uCyI93mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh1P-00000004Oy8-25ci;
	Mon, 08 Jun 2026 20:56:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWh1O-00000004Oy2-15S7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 20:56:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BC7A441FC;
	Mon,  8 Jun 2026 20:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DE81F00898;
	Mon,  8 Jun 2026 20:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780952193;
	bh=70yQ8bv6MXX6iZNUydJIVV6T4ubI6+gm2CGCrTBA49k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=eR47QBVsHXZofLip9psUhAEnJrLLtQG1WcQaS99HSCHBV53YzYm+blVy7j8+kbzZ7
	 Q9M8nHmXB59YFS7MdufUstexwinSKiuHcEjyRGxK4CDnNm9Qm4yBYuz1vRqyZ3mvBa
	 GccUyYvJywY6USo19PRp5QdpnawpUaq557jtYBld4TidI/Nj51kvCfqUlfTaFiGqqB
	 +rZ63Pn+02o+uOvCfxUuzg6VNbFUm39lX+k5q8KpISDNMnWD71nGgapFS8yts9eg3O
	 W7xZjL2mdpWa+9IBKad7rexyEkTltb0hYLFtHj1Nw1/tpogLo0qfp8S96Oygopcsy1
	 8858O1wu1Rwfg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id DC87AF40076;
	Mon,  8 Jun 2026 16:56:32 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Mon, 08 Jun 2026 16:56:32 -0400
X-ME-Sender: <xms:gCwnamS-Sdh-YcyPO4Ia3Yuwi6UKP5FW-vIq-ajIGnUKA_CH1i-tQA>
    <xme:gCwnamm8MnBYju7x_HSA3yjOfj9Ofqd0m_c4hhsvMFji4DI1jbBDwidn6DNtdP2Mu
    VvMG7p9KjiMF-q7N6dUhsfEvRhQSYSVSCXYmfW_8sLULNAlROsrNA>
X-ME-Proxy-Cause: dmFkZTFJOFEcoyxJXRx69v+XjpS3PUhyEfjQZwp9H//NHMrCE2uXMekYtl2BZHZkNYEiRZ
    FtwdZqKXunw/EDn2+6uTGj6xx+Wa/qzaaRBZTT6LTQIJFVJTZKLg9VPmVLHtgnubDJlJCN
    BaWYITFrqjlUcreT3NJH24hkEuA1lqvdu7CM6jrZmatWLa5W6yliP2TGFXXxshM6huhUEI
    cYpnOqtRNqmdApnKN8+RI1QLkldOhTzBehayEUln6z3FzBavBEJI1nYUuAJf5Gv2JmpX+G
    Nne340WcWmc5XlBTfziac/FROmqWI2Y29n61Fqi3s+RW2uoyB7OWe50ch+OWkf0S8d69cD
    1q+7NCa6T0FohD1UT0f8EQnrHsECgu+xt616ZYSh2S9AN8jVxyOooa4ejDtl/l82xYu0IR
    Wh1jtHdbZJeIV7qvFhrbNqEKMwV3aaeWgDh7uuSh4QcsgNJVYl89SLBI+FmRsy4sv1ffi6
    fIjaIzdcQQN+ZDToMmhOs486+ZZc8fV95YN1zIc3lJU8dyv7PeBWcCtLzJYHzI+DnSWcyT
    2yYLS0jjYpsWdq9kLK3vclLNxE5R/vnS9Xgng83c9iGw989NETmZlSjmVtdEgXg+OGe59S
    fkQsOF2IhF/iODFYtnhUwGstH4iWz8jxep4tfMDLImQvkUzIq72RmHaiGvyw
X-ME-Proxy: <xmx:gCwnalIcnsMZucKYGxMSNqqv8zgrCpz0NdTK9q9JxTfcw4BaBTkCJw>
    <xmx:gCwnah0pCx6acIcQuAj4hGC62xv59Vg0n1TbmLQ2gEtVnyPF_zebqA>
    <xmx:gCwnar5jISbKO6Eq0OKR5yAvyb-1Pqlcu6-mD5ss43zQ6yGyJM-fVg>
    <xmx:gCwnaq-LSUWeNjivbKcVoj0UUFW2hbnuLgguK7GHOsujSuy08JnZMQ>
    <xmx:gCwnaiUP_o5AbGGbc_I5fwQuvCc_zsF-iyKAGHTuufLIbOkX4cCT9ti7>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BDBC31820082; Mon,  8 Jun 2026 16:56:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 08 Jun 2026 22:56:12 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Marc Zyngier" <maz@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>
Cc: "Oliver Upton" <oupton@kernel.org>, Aishwarya.TCV@arm.com,
 linux-arm-kernel@lists.infradead.org
Message-Id: <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com>
In-Reply-To: <87tsrc946i.wl-maz@kernel.org>
References: <aicVyebkEMs6w6UV@sirena.co.uk> <87tsrc946i.wl-maz@kernel.org>
Subject: Re: -next boot failures during KVM setup
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Mon, 8 Jun 2026, at 22:18, Marc Zyngier wrote:
> [+ Will, Catalin, Ard]
>
> On Mon, 08 Jun 2026 20:19:37 +0100,
> Mark Brown <broonie@kernel.org> wrote:
>> 
>> I'm seeing boot failures on a range of physical arm64 platforms in
>> today's -next.  Turning on earlycon it looks like we're getting bad
>> pointer dereferences during KVM initialisation:
>> 
>> [    0.728923] kvm [1]: nv: 570 coarse grained trap handlers
>> [    0.735138] kvm [1]: nv: 710 fine grained trap handlers
>> [    0.741326] kvm [1]: IPA Size Limit: 40 bits
>> [    0.748840] Unable to handle kernel paging request at virtual address ffff00000478e000
>
> That really doesn't look like a duff pointer.
>
>> [    0.757027] Mem abort info:
>> [    0.759917]   ESR = 0x0000000096000147
>
> Translation fault, level 3. My take is that something is getting
> unmapped.
>
...
> I've reproduced with -next on an A72 platform. But it doesn't happen
> with kvmarm/next on its own. So it is likely something coming from
> another tree that messes up with CMOs, or .
>
> The stack trace here is slightly better:
>
> [    0.099138] Unable to handle kernel paging request at virtual 
> address ffff0023d9ead000
...
> [    2.136462] Call trace:
> [    2.138896]  dcache_clean_inval_poc+0x24/0x48 (P)
> [    2.143592]  init_hyp_mode+0x644/0x960
> [    2.147333]  kvm_arm_init+0x128/0x280
> [    2.150987]  do_one_initcall+0x4c/0x458
> [    2.154813]  kernel_init_freeable+0x1f4/0x2a0
> [    2.159161]  kernel_init+0x2c/0x150
> [    2.162642]  ret_from_fork+0x10/0x20
> [    2.166210] Code: 9ac32042 d1000443 8a230000 d503201f (d50b7e20) 
> [    2.172292] ---[ end trace 0000000000000000 ]---
> [    2.176958] Kernel panic - not syncing: Attempted to kill init! 
> exitcode=0x0000000b
> [    2.184608] SMP: stopping secondary CPUs
> [    2.188523] Kernel Offset: 0x47dbd5dc0000 from 0xffff800080000000
> [    2.194604] PHYS_OFFSET: 0x80000000
> [    2.198080] CPU features: 0x04000000,804b0008,00040001,0400421b
> [    2.203988] Memory Limit: none
> [    2.207031] ---[ end Kernel panic - not syncing: Attempted to kill 
> init! exitcode=0x0000000b ]---
>
> This points to the following code in kvm_hyp_init_symbols():
>
> <quote>
> 	/*
> 	 * Flush entire BSS since part of its data containing init symbols is read
> 	 * while the MMU is off.
> 	 */
> 	kvm_flush_dcache_to_poc(kvm_ksym_ref(__hyp_bss_start),
> 				kvm_ksym_ref(__hyp_bss_end) - kvm_ksym_ref(__hyp_bss_start))
>
> </quote>
>
> which I suspect is related to some of the new BSS related code in
> arm64/for-next/mm.
>
> Ard, does this ring a bell?
>

Haven't seen this myself, surprisingly, but yeah, this is obviously related.

By now, I am wondering if unmapping that region entirely is really worth the
hassle, or whether we'd be better off just remapping it read-only.

Given we're at -rc7, I'd lean towards dropping the whole branch for now, or
alternatively, only drop/revert "arm64: mm: Unmap kernel data/bss entirely from the 
linear map" (and its followup fix "arm64: mm: Defer remap of linear alias of
data/bss") so that the region always remains readable via the linear map.


