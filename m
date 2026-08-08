Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A680C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 14:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umhegfornY2q+dliAsJ0qNPWy6KgS5Ezk4jQr8oXmA0=; b=2oefUym7K8D9ueiTM57eTYiOLj
	CVx0WlZfcOSRO13Z1j4Vs+o1MbjL2tJ+Ac/Rj0G+GIUpngvk9E7L/U7EgfwjaYBEHnWCHjDYVF8eN
	E852N6Sl+3+N5pkJJVRBF9tNrCEGS/Fm1F9sJW3WB7KPs9Vi/UoEHvZZ7MrqbBh+bBgk+4sLaHWOB
	WMpqUEj5+eGYuW5zsEqWuI1SZVHns/WHd/u3f0qy7LoHYGks3NpNJZgf3hua7JLbu9vn7BNz0+STv
	THQbXJiE7j1GeV11rnNf9G9tTp3JedFyAJOy+eZqJUb4MRwgdQHOHfrhQHsX0MPiDdc5LRj0gFBCw
	ycY18ykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsi56-00000009SGQ-0ZIt;
	Sat, 08 Aug 2026 14:31:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsi53-00000009SG3-0fgS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 14:31:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so3736a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 07:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786199478; cv=none;
        d=google.com; s=arc-20260327;
        b=kq38979zFWkLBIr13FhRjDUinXyTzpoP7l00/dWzUcYv6r6SyhHpqDT40fsVlU7+BM
         mP2KjfWtidwELImpppMCIAPuyc96ixwmRHhPQknBzs14IPBrpKhalRvETsO6O8oRGN1Y
         57ZiYQAzn6moOYuwxC0EfQa9HcttJrIFSkOXh9rKfOC8ncXLUi3xB91l9p+yytVOMCxM
         mveM0oh5tAfMeOn44Qu2Fipn8XFfl0zFntkkUtczn2HEmkokccZ2xthcm9v4O92DKgBp
         WBhymqv01QcofbIl//OBmJ1cfmGCzwl/O1/NtmnG/XJ9/r+GOQ7Mqzj19qDHf3ZT6k7j
         i5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=umhegfornY2q+dliAsJ0qNPWy6KgS5Ezk4jQr8oXmA0=;
        fh=8WCClFn5c+TlQAK8tNzg2lTrF6SFscu7XjdtC1NqxZY=;
        b=W2sEUWxdKLcmnBbxLGoQ32P4rgJFFSphNu7hMilQKVOQsFKzxsniRg46G4PNiyVJ6g
         Dm2L5+Ia0uTQLeNG6BZL2pkSZtqCNuNZYSjXCuNVBu4dPj1Do20g/duDSy855fJUDZ/j
         22xDjkJVx40ZPVvV6P5ogtArByFszypwzt92ZbHOXT3E9zmCqkKQgug+zq0qOjHOHUIu
         n6sDw9WWgaaqtTqZHS0QmFC/oS01VLHUua7UpkyJQyDq85NUBPQdlmVGyqmZtzqLgxoM
         zfhKji+oVFxsV8a+ODLIoU5Ip5sOhjJ0joK/ALRL925Sf705MBhGX6W5ALQanDwPElI1
         AdrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786199478; x=1786804278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=umhegfornY2q+dliAsJ0qNPWy6KgS5Ezk4jQr8oXmA0=;
        b=NyBkYv9Wk1CpqbOci4SjPhZsploi6JmSEMIwJnFLXKpQ5fsLq6bzEZJ1cdQIIhQ8/J
         HJICaOU765SmTwaE1muiz/ZzeZhfzgSO2EQbdISlVFcGttmgwv8bZD6OaxxpSTMTlE8/
         F9eoon0D39kE1tyMU8GDRVpGqlFXlcRn+IG+ieH3egKI84oTneJ/cAMiM+a5nVQ4Lt8L
         SD5B1QQXB6IL1nfE7/+FUPmwWW9PRsSwMRR3iPJmGuMUv1YAcTSbOkIfUy39TGz9eo8N
         nD7fQbqPMoreTy2AjbvgzSzkDFgzCLbSgH5Oqyy6NSMmJLQ9IxkofswcBVXCodzXwUwR
         xJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786199478; x=1786804278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umhegfornY2q+dliAsJ0qNPWy6KgS5Ezk4jQr8oXmA0=;
        b=OxGJYOTQk3zoM2jKvS/KgIYID+GB742sHjeGdPskKUa8hAYeLHGqISgwVZt2/ZWqvh
         GqyHJc/cgD7o8CqH42uIIny6889bMP1d06DagwfkihpG8w/qOBB0B2A1js8Avp4Tmle/
         MTxS5qVdqGv+3tdDvXHcdO3OEPlcJE/X4FgMzAGytKCp6dYatIo91FrR2NcLkfoqnyUO
         QYn0cOyIFoQsnhYlyyYoofhHxtuWlxWUnskq8xQ0iaZ/5mW17t/288mMtzOBQBeDNUHK
         pW4EAtKNtERvGDnDaRDuCeV8sZBKdKHQI9wE20/jIDwzSaxRwbvnMxwaOwHVUxBejH2i
         kyWw==
X-Forwarded-Encrypted: i=1; AHgh+RrfQ0uhUeKcexcQPjhCooHAWPV5qbKftNlJCLX/XLRjH7+wIM65m766H/5rmjvBG1HrSrdp3uQ+qulbXpF0JBzl@lists.infradead.org
X-Gm-Message-State: AOJu0YyJrxGjDr53B8mh7iMnqmL7SxynReAbXNnPm+ziWddkMku/k3b/
	6tR549p8SYvSrvcBSLOGq5V3JDabahuHj5d/wbfr/NrJhSa5oZvZevw6aXXURUeHfuy6uE1K2sO
	+x2eRbCo5tiRKEMa4g58lK5VND9Ffsc2kstiiHoYb
X-Gm-Gg: AR+sD10V09JRoT4m51WwRNw7dI7E0SWV1nfvqDcPy9DKqIHIbv8fcH17eTk+WOdFWe+
	UorPOwETC8LzVTFKCES3PdFJN625CpWKe6bzuXgN8VMgs3qVhBUxvEfxJyOCzhFsO7VS5Md6OLm
	l4TaUlI3OpL4eQl96pz5/PWrNszHzmmX6cNXE4r9So4fgBcJU5Qn2MI3uBH9NvCltu4rAddw3Fs
	1arlQTVn0sYBSy5eal32uKeB+r7F0jR3LICHIqNfz0BpFgVxKRv96WaSoAZjSWBnlBlf/3+oR2C
	CCVP6Os4GBZDvgRUgOgIjfamo3S8KthQdknNGpxGf/xF9hB9yldGqa60sB7+iDzxE2alk7D9AGY
	=
X-Received: by 2002:a05:6402:2c5:b0:697:7f69:48e3 with SMTP id
 4fb4d7f45d1cf-6a1f4f5d874mr38566a12.10.1786199477331; Sat, 08 Aug 2026
 07:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260808085824.732659-1-smostafa@google.com> <20260808085824.732659-4-smostafa@google.com>
In-Reply-To: <20260808085824.732659-4-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Sat, 8 Aug 2026 15:31:04 +0100
X-Gm-Features: AUfX_mx7PbbfJVVT5axwb5kWqfzAC8auOtaruvcG6cTNxOokXMk8vC24H5OnKzM
Message-ID: <CAFgf54pb+5UnYYkbMKe280-ODvbQ=Vhtj8Qk7btR6ZNDwrmzrQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Fix hvhe and broken CNTVOFF_EL2
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	yaoyuan@linux.alibaba.com, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_073121_225840_3BACE2FF 
X-CRM114-Status: GOOD (  25.65  )
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

On Sat, Aug 8, 2026 at 9:58=E2=80=AFAM Mostafa Saleh <smostafa@google.com> =
wrote:
>
> When running on a setup affected with broken CNTVOFF_EL2
> (has_broken_cntvoff())
>
> Booting with VHE or protected mode(nvhe) (id_aa64mmfr1.vh=3D0
> and arm64_sw.hvhe=3D0) works fine.
>
> However launching a protected VM with protected hvhe mode panics the
> guest kernel:
>
> [    0.000000] Internal error: Oops - Undefined instruction: 000000000000=
0000 [#1]  SMP
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.2.0-rc3=
-g05f75bd71e0e-dirty #29 PREEMPT
> [    0.000000] Hardware name: linux,dummy-virt (DT)
> [    0.000000] pstate: 000003c5 (nzcv DAIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    0.000000] pc : arch_timer_shutdown_virt+0x4/0x1c
> [    0.000000] lr : arch_timer_starting_cpu+0x1c4/0x2d4
> [    0.000000] sp : ffffa6bd9a193c00
> [    0.000000] x29: ffffa6bd9a193c20 x28: ffffa6bd9a1bcf88 x27: 000000000=
0000000
> [    0.000000] x26: ffff00001be70dd8 x25: ffffa6bd99d85000 x24: ffffa6bd9=
9d85ee4
> [    0.000000] x23: ffffa6bd99d85000 x22: ffffa6bd9a1499c0 x21: ffffa6bd9=
a1ab900
> [    0.000000] x20: 00ffffffffffffff x19: ffff00001be8b600 x18: 000000000=
000028c
> [    0.000000] x17: 00000000510f0010 x16: 00000000510f0010 x15: 000000005=
00f0000
> [    0.000000] x14: 0000000000000000 x13: 0000000000000000 x12: 000000000=
0000018
> [    0.000000] x11: ffffa6bd9a8ac000 x10: 0000000000f0000f x9 : fffffffff=
fffffff
> [    0.000000] x8 : ffffa6bd98822e18 x7 : 0070752d65746174 x6 : 00111ff76=
e007261
> [    0.000000] x5 : ffffa6bd9ad68078 x4 : 0000000000000000 x3 : ffffa6bd9=
8822a0c
> [    0.000000] x2 : 0000000000000073 x1 : 0000000000000001 x0 : ffff00001=
be8b600
> [    0.000000] Call trace:
> [    0.000000]  arch_timer_shutdown_virt+0x4/0x1c (P)
> [    0.000000]  cpuhp_invoke_callback+0x11c/0x280
> [    0.000000]  cpuhp_issue_call+0x1e8/0x224
> [    0.000000]  __cpuhp_setup_state_cpuslocked+0x1d8/0x2b8
> [    0.000000]  __cpuhp_setup_state+0x50/0x74
> [    0.000000]  arch_timer_register+0xc0/0x148
> [    0.000000]  arch_timer_of_init+0x148/0x170
> [    0.000000]  timer_probe+0x74/0x124
> [    0.000000]  time_init+0x18/0x58
> [    0.000000]  start_kernel+0x1c0/0x3ac
> [    0.000000]  __primary_switched+0x88/0x90
> [    0.000000] Code: c80b7d2a 35ffffab 17ffffeb d503245f (d53be328)
>
> The workaround avoids setting non-zero CNTVOFF_EL2 and trapping the
> virtual counter to emulate the offset.
> In the VHE path (timer_set_traps()), traps are only enabled when the
> guest actually has a non-zero virtual timer offset.
> However, __timer_enable_traps() in hyp/nvhe/timer-sr.c unconditionally
> set CNTHCTL_EL1TVT and CNTHCTL_EL1TVCT whenever has_broken_cntvoff()
> was true.
>
> Which causes 2 issues:
> 1) Protected VMs: kvm_handle_pvm_sysreg() does not find "cntv_ctl_el0"
> in pvm_sys_reg_descs and injects undefined instruction exceptions.
>
> 2) non-protected guests are trapped all the time even with offset of
> zero.
>
> Fix this by adding a check in __timer_enable_traps() similar to the one i=
n
> timer_set_traps()
>
> Fixes: 0bc9a9e85fcf ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity"=
)
> Signed-off-by: Marc Zyngier <maz@kernel.org>

For some reason, when I used b4 to pull the first version, it added
Marc's `Signed-off-by` which was not intended.
Probably it got confused by the patch in the reply.

Thanks,
Mostafa

> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/timer-sr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe=
/timer-sr.c
> index 51b4f5010b66..993065716913 100644
> --- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> +++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
> @@ -61,9 +61,9 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
>
>         /*
>          * Trap the virtual counter/timer if we have a broken cntvoff
> -        * implementation.
> +        * implementation and non zero offset as in timer_set_traps()
>          */
> -       if (has_broken_cntvoff())
> +       if (has_broken_cntvoff() && timer_get_offset(vcpu_vtimer(vcpu)))
>                 set |=3D CNTHCTL_EL1TVT | CNTHCTL_EL1TVCT;
>
>         sysreg_clear_set(cnthctl_el2, clr, set);
> --
> 2.55.0.654.g21b8a5bc05-goog
>

