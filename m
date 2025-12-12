Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DD6D4335B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 01:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd1kWl+e0QkfeVDmjwKDiRL6KWrbfO8Cm6aCDNo3pTc=; b=f+AS01US5TbnmgpiT06G3eEUOW
	G1VW7TAqs1vxGzM4rWOrekvi9e8gmlxWh/uD3RrTyNZmuN3x53jcsW1qY5g52BrwbqryfeuIzGpcs
	fQgbI7pqvyCbUTxDXSgfJ9lo8A/PBfR98j/nnXeGBPxVRJhSEjGFGyUnGgPmwo00FrOYAzzixcGQq
	1bSbDr9hU6NgQfrXCX9iwy05hspNxwa3CbZEFkt609Tqo7P0269BP8NKLPBX1ruan9KGR2Y90ubOV
	1jjVBvMUer9+9WOmM0Vt2Lz1e4zbOhxxq1O2YiyTVnqA5tsWC5Wut5OiNVl3+I82ilHwaAdMHSarq
	TF7BlJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsLn-0000000HV6C-0X17;
	Fri, 12 Dec 2025 01:53:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTsLk-0000000HV5n-23mD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 01:53:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47a815c43baso96945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 17:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765504418; cv=none;
        d=google.com; s=arc-20240605;
        b=bHjxICoWb0lqAlDEn3v0XRyFbZzAn1AEtwtFZLh3gouo2XgHf8sZCcDOWBssAiXv3I
         YUZExyTWi7L8LemS2UKLWd4HPqM69Q0/S3+/58WqRJYvBsN+pjuxs+9op/yULaXv4N2D
         Yg3Gr4SSYmbT7U6GlnKHVE5vk8CetLiwb9zbnljp7Bw/Gr2RkZ/WrT7SORWsX4gPLM1i
         vgvmpgRKp+pmXEP9VejSdnpczXL3Epa3cti9f6KOd1EqzSfmWc+3JSVInRCiP+ThD+P/
         chDBzfi78/OrobjsqRK1ylcXyQaJcO80UUROXhC+dVFo5m94OmnoGGmUAA7H8GJ8qLV1
         nG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rd1kWl+e0QkfeVDmjwKDiRL6KWrbfO8Cm6aCDNo3pTc=;
        fh=28vg5L92pD9AtbBJACMCtshIQi4O0D7XNDPPQ64eI1g=;
        b=k0oyrsqvdV24d4k+GD5JderK8n8pe9yFNvwyAoJAa3nPB2+ZBckSD6Bmti0Z8G56w2
         DwnvcmJX9ztoH4ckAqx/w12zcVsQBxky7slSKW7Jp4dN3HMFQgmFpcqS29D1rOrXm2Oy
         fSCqIHp5Q0QdlWvp3VoZPy1II2b6sS8hFN1hass39UAtf4nkJQ/nLIhWPfcPeLV5V4Q7
         VksyHDsdLgbnAibaO25HTxBHw/I06OjfLSkLeNMcfTquOBV6CRi+rnh4Ngo772GkXD41
         nhD/nw4F0ZrsGmqpV6WcVHyJRhR+/2p76Up9uDj2da7AorI6xEQ8asxhhvyekeB6qNUo
         5FLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765504418; x=1766109218; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd1kWl+e0QkfeVDmjwKDiRL6KWrbfO8Cm6aCDNo3pTc=;
        b=fyFZUhNH+zdhLJnUsUI8CQiwhG7fVrbu388iLn5F3BXoU8aI9t4kmq8zjX2Tl+pFov
         YIiQSf0ruGuKNQQwlt9FSO9L5YgbnLXi63Eg0vywRxGkVFfhLfLpVnNhlfQUjFcA6Tr1
         /ypfi8vpFPRWU/gnIyvO7x5Gix4uZrMJfmmsg7Vfpt/imJsOmZ/J8MDFkFKSZzZc+p4a
         gDSkM3zjppIcZe571Zp+iIAzQ2VMxQcdM7Ac2civLNyXFjc7dKBUDwvaahiP5rRkEx3a
         XYJDzxjGHvAgne2zqAjt9Llho6gM1cl67QMzUXG7T/HxMBFK/bt2PmhNLu9yWGLCanZB
         DpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765504418; x=1766109218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rd1kWl+e0QkfeVDmjwKDiRL6KWrbfO8Cm6aCDNo3pTc=;
        b=KyMi4AwQcJuaUw44RNFQvL2XYJjJn9P/wJbGXLugRfXmgh54lzyhQVopdfkKk9sZjz
         QCL1H/j2+XAf5PfQ8hSt4ecKr98svsieO0j4bdQBTcbV9YU/grvEwl6SEyZrBClCWwhU
         TdadQh8vn64DQigoOjdpB3c74qHwTzSa+8BeAeqAm9hI2pOn2YJTFPHg7TADNxF1qd9i
         vTzyhMozdyLq+GlBM/BKfd074dt7dWmcZHArrn+17trkiAnpM/AhtU/Z2093n8HD4Z4Q
         h7NOE2FbwLhVoOvMNavPHHwdXmUrX/sBLfYyddSXCRVFwBpf/EiTr9hM3KZ5Xy2jTh6u
         nHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV55g2QUgBOyprDS4IMEN5SUuyOrleziLBBGqRo63IVCxYljvVLQELZ6CbTQiFKCrgssnoPC9tmG8AYkw031ulX@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn8eb7P/d4EFoG0xXRBRSAHr38mWxCkSCzsYWz0Mf4WySYF8Zf
	o0cpIL2ofqdyFpT5a8fzSRn94STXP6mG7lEiYRuANUl+/OUUZyEAdVJOpV3ln2ih30Jm4FNSnRq
	o1soBtDMY7bdLiA5ym8EU6npZIOzW6UFel7MTKP4m
X-Gm-Gg: AY/fxX505sbzkcY1MXTCRD4Vf6Ati7VgFZSsC3bWQxWQ4BuablUxuBTDfCrqlRWUb3+
	1bixLLBvRqTRZOPqjJO197HgJmUSlwDzD/QSdUzuUXI7Y9zRAQR6LYRaEmL0V2Qzz1YId3UESkX
	BnG1zpNqm0AS29fAxTxwBqINxDRBAPyH7naFPBLQk8FvVuN/xtNosP2S3zVd2ZN6F3iHsGk1muc
	nSPfMqG6//eqvvMmNZgz5OHa/vtpDouXHZ4uFj6afjM6SyZVA7GK3Uxg/lVR4Ih1f2G0wCliywS
	Dj5tgX3DrGctaXOfu9d+hpoEFA9m
X-Google-Smtp-Source: AGHT+IELyZ67Mh/WAPeTceCN8jbRYqNn7LfXokCBfkoubbVjvqqfzZOlYxJtEOZmuwbdnCZhp2hA4fTZEV/raHqViWM=
X-Received: by 2002:a05:600d:3:b0:477:86fd:fb49 with SMTP id
 5b1f17b1804b1-47a88c5c13dmr1386955e9.10.1765504417716; Thu, 11 Dec 2025
 17:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <20251013185903.1372553-3-jiaqiyan@google.com>
 <3061f5f8-cef0-b7b1-c4de-f2ceea29af9a@huawei.com>
In-Reply-To: <3061f5f8-cef0-b7b1-c4de-f2ceea29af9a@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 11 Dec 2025 17:53:26 -0800
X-Gm-Features: AQt7F2rTGmuQE0DHKTuWqG307odD2vjHJLASzh2BvequPFTSz6j2Q6CLsqIFn98
Message-ID: <CACw3F51mRXCDz7Hd4Vve98NoskhB2cSc88zAGfd6Hwr4uCBxPA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] KVM: selftests: Test for KVM_EXIT_ARM_SEA
To: Zenghui Yu <yuzenghui@huawei.com>, maz@kernel.org, oliver.upton@linux.dev
Cc: duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	vsethi@nvidia.com, jgg@nvidia.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_175340_615075_DF00AFB0 
X-CRM114-Status: GOOD (  40.63  )
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

On Thu, Dec 11, 2025 at 5:02=E2=80=AFAM Zenghui Yu <yuzenghui@huawei.com> w=
rote:
>
> Hi Jiaqi,
>
> I had run into several problems when testing it on different servers. I
> haven't figured them out yet but post it early for discussion.

Thanks for testing, and I will be happy to work with you to improve
this test code.

>
> On 2025/10/14 2:59, Jiaqi Yan wrote:
> > Test how KVM handles guest SEA when APEI is unable to claim it, and
> > KVM_CAP_ARM_SEA_TO_USER is enabled.
> >
> > The behavior is triggered by consuming recoverable memory error (UER)
> > injected via EINJ. The test asserts two major things:
> > 1. KVM returns to userspace with KVM_EXIT_ARM_SEA exit reason, and
> >    has provided expected fault information, e.g. esr, flags, gva, gpa.
> > 2. Userspace is able to handle KVM_EXIT_ARM_SEA by injecting SEA to
> >    guest and KVM injects expected SEA into the VCPU.
> >
> > Tested on a data center server running Siryn AmpereOne processor
> > that has RAS support.
> >
> > Several things to notice before attempting to run this selftest:
> > - The test relies on EINJ support in both firmware and kernel to
> >   inject UER. Otherwise the test will be skipped.
> > - The under-test platform's APEI should be unable to claim the SEA.
> >   Otherwise the test will be skipped.
> > - Some platform doesn't support notrigger in EINJ, which may cause
> >   APEI and GHES to offline the memory before guest can consume
> >   injected UER, and making test unable to trigger SEA.
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
>
> [...]
>
> > +static void inject_uer(uint64_t paddr)
> > +{
> > +     if (access("/sys/firmware/acpi/tables/EINJ", R_OK) =3D=3D -1)
> > +             ksft_test_result_skip("EINJ table no available in firmwar=
e");
>
> Missing '\n'.

Thanks.

>
> We should return early (to actually skip the test) if the file can not
> be accessed, right?

Oh you mean I missed exit(KSFT_SKIP), right? Agreed.

>
> > +
> > +     if (access(EINJ_ETYPE, R_OK | W_OK) =3D=3D -1)
> > +             ksft_test_result_skip("EINJ module probably not loaded?")=
;
> > +
> > +     write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
> > +     write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
> > +     write_einj_entry(EINJ_ADDR, paddr);
> > +     write_einj_entry(EINJ_MASK, ~0x0UL);
> > +     write_einj_entry(EINJ_NOTRIGGER, 1);
> > +     write_einj_entry(EINJ_DOIT, 1);
> > +}
> > +
> > +/*
> > + * When host APEI successfully claims the SEA caused by guest_code, ke=
rnel
> > + * will send SIGBUS signal with BUS_MCEERR_AR to test thread.
> > + *
> > + * We set up this SIGBUS handler to skip the test for that case.
> > + */
> > +static void sigbus_signal_handler(int sig, siginfo_t *si, void *v)
> > +{
> > +     ksft_print_msg("SIGBUS (%d) received, dumping siginfo...\n", sig)=
;
> > +     ksft_print_msg("si_signo=3D%d, si_errno=3D%d, si_code=3D%d, si_ad=
dr=3D%p\n",
> > +                    si->si_signo, si->si_errno, si->si_code, si->si_ad=
dr);
> > +     if (si->si_code =3D=3D BUS_MCEERR_AR)
> > +             ksft_test_result_skip("SEA is claimed by host APEI\n");
> > +     else
> > +             ksft_test_result_fail("Exit with signal unhandled\n");
> > +
> > +     exit(0);
> > +}
> > +
> > +static void setup_sigbus_handler(void)
> > +{
> > +     struct sigaction act;
> > +
> > +     memset(&act, 0, sizeof(act));
> > +     sigemptyset(&act.sa_mask);
> > +     act.sa_sigaction =3D sigbus_signal_handler;
> > +     act.sa_flags =3D SA_SIGINFO;
> > +     TEST_ASSERT(sigaction(SIGBUS, &act, NULL) =3D=3D 0,
> > +                 "Failed to setup SIGBUS handler");
> > +}
> > +
> > +static void guest_code(void)
> > +{
> > +     uint64_t guest_data;
> > +
> > +     /* Consumes error will cause a SEA. */
> > +     guest_data =3D *(uint64_t *)EINJ_GVA;
> > +
> > +     GUEST_FAIL("Poison not protected by SEA: gva=3D%#lx, guest_data=
=3D%#lx\n",
> > +                EINJ_GVA, guest_data);
> > +}
> > +
> > +static void expect_sea_handler(struct ex_regs *regs)
> > +{
> > +     u64 esr =3D read_sysreg(esr_el1);
> > +     u64 far =3D read_sysreg(far_el1);
> > +     bool expect_far_invalid =3D far_invalid;
> > +
> > +     GUEST_PRINTF("Handling Guest SEA\n");
> > +     GUEST_PRINTF("ESR_EL1=3D%#lx, FAR_EL1=3D%#lx\n", esr, far);
> > +
> > +     GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_CUR);
> > +     GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
> > +
> > +     if (expect_far_invalid) {
> > +             GUEST_ASSERT_EQ(esr & ESR_ELx_FnV, ESR_ELx_FnV);
>
> I hit this ASSERT with:
>
> # Mapped 0x40000 pages: gva=3D0x80000000 to gpa=3D0xff80000000
> # Before EINJect: data=3D0xbaadcafe
> # EINJ_GVA=3D0x81234bad, einj_gpa=3D0xff81234bad, einj_hva=3D0xffff41234b=
ad,
> einj_hpa=3D0x202841234bad
> # echo 0x10 > /sys/kernel/debug/apei/einj/error_type - done
> # echo 0x2 > /sys/kernel/debug/apei/einj/flags - done
> # echo 0x202841234bad > /sys/kernel/debug/apei/einj/param1 - done
> # echo 0xffffffffffffffff > /sys/kernel/debug/apei/einj/param2 - done
> # echo 0x1 > /sys/kernel/debug/apei/einj/notrigger - done
> # echo 0x1 > /sys/kernel/debug/apei/einj/error_inject - done
> # Memory UER EINJected
> # Dump kvm_run info about KVM_EXIT_ARM_SEA
> # kvm_run.arm_sea: esr=3D0x92000610, flags=3D0
> # kvm_run.arm_sea: gva=3D0, gpa=3D0
> # From guest: Handling Guest SEA
> # From guest: ESR_EL1=3D0x96000010, FAR_EL1=3D0xaaaadf254828
> # Guest aborted!
> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
>   arm64/sea_to_user.c:172: esr & ESR_ELx_FnV =3D=3D ESR_ELx_FnV
>   pid=3D38112 tid=3D38112 errno=3D4 - Interrupted system call
>      1  0x0000000000402f9b: run_vm at sea_to_user.c:246
>      2  0x0000000000402467: main at sea_to_user.c:330
>      3  0x0000ffff8e22b03f: ?? ??:0
>      4  0x0000ffff8e22b117: ?? ??:0
>      5  0x00000000004026ef: _start at ??:?
>   0x0 !=3D 0x400 (esr & ESR_ELx_FnV !=3D ESR_ELx_FnV)
>
> It seems that KVM doesn't emulate FnV when injecting an abort.

I believe so; this happened to me when I tested on an architecture
that doesn't provide valid FAR. I tried to fix this in [1] in the
past, but didn't get any traction and somehow escaped my attention...

Oliver and Marc, what do you think about [1]? If it sounds like a
valid fix, I can re-send it out as an individual patch.

[1] https://lore.kernel.org/kvmarm/20250604050902.3944054-3-jiaqiyan@google=
.com


>
> > +             GUEST_PRINTF("Guest observed garbage value in FAR\n");
> > +     } else {
> > +             GUEST_ASSERT_EQ(esr & ESR_ELx_FnV, 0);
> > +             GUEST_ASSERT_EQ(far, EINJ_GVA);
> > +     }
> > +
> > +     GUEST_DONE();
> > +}
> > +
> > +static void vcpu_inject_sea(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_events events =3D {};
> > +
> > +     events.exception.ext_dabt_pending =3D true;
> > +     vcpu_events_set(vcpu, &events);
> > +}
> > +
> > +static void run_vm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> > +{
> > +     struct ucall uc;
> > +     bool guest_done =3D false;
> > +     struct kvm_run *run =3D vcpu->run;
> > +     u64 esr;
> > +
> > +     /* Resume the vCPU after error injection to consume the error. */
> > +     vcpu_run(vcpu);
> > +
> > +     ksft_print_msg("Dump kvm_run info about KVM_EXIT_%s\n",
> > +                    exit_reason_str(run->exit_reason));
> > +     ksft_print_msg("kvm_run.arm_sea: esr=3D%#llx, flags=3D%#llx\n",
> > +                    run->arm_sea.esr, run->arm_sea.flags);
> > +     ksft_print_msg("kvm_run.arm_sea: gva=3D%#llx, gpa=3D%#llx\n",
> > +                    run->arm_sea.gva, run->arm_sea.gpa);
> > +
> > +     TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_ARM_SEA);
>
> I can also hit this ASSERT with:
>
> Random seed: 0x6b8b4567
> # Mapped 0x40000 pages: gva=3D0x80000000 to gpa=3D0xff80000000
> # Before EINJect: data=3D0xbaadcafe
> # EINJ_GVA=3D0x81234bad, einj_gpa=3D0xff81234bad, einj_hva=3D0xffff41234b=
ad,
> einj_hpa=3D0x2841234bad
> # echo 0x10 > /sys/kernel/debug/apei/einj/error_type - done
> # echo 0x2 > /sys/kernel/debug/apei/einj/flags - done
> # echo 0x2841234bad > /sys/kernel/debug/apei/einj/param1 - done
> # echo 0xffffffffffffffff > /sys/kernel/debug/apei/einj/param2 - done
> # echo 0x1 > /sys/kernel/debug/apei/einj/notrigger - done
> # echo 0x1 > /sys/kernel/debug/apei/einj/error_inject - done
> # Memory UER EINJected
> # Dump kvm_run info about KVM_EXIT_MMIO
> # kvm_run.arm_sea: esr=3D0xffff90ba0040, flags=3D0x691000
> # kvm_run.arm_sea: gva=3D0x100000008, gpa=3D0
> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
>   arm64/sea_to_user.c:207: exit_reason =3D=3D (41)
>   pid=3D38023 tid=3D38023 errno=3D4 - Interrupted system call
>      1  0x0000000000402d1b: run_vm at sea_to_user.c:207
>      2  0x0000000000402467: main at sea_to_user.c:330
>      3  0x0000ffff9122b03f: ?? ??:0
>      4  0x0000ffff9122b117: ?? ??:0
>      5  0x00000000004026ef: _start at ??:?
>   Wanted KVM exit reason: 41 (ARM_SEA), got: 6 (MMIO)
>
> Not sure what's wrong it..

Does your test machine have SDEI or SCI enabled for host APEI? Do you
see any kernel log from "Memory failure:" saying hugetlb page
recovered, and recovered significant earlier than the KVM exit here.
It maybe the kernel has already unmapped hugepage in response to SDEI
or SCI before this test actually consumes memory error, so no SEA is
actually triggered.

>
> > +
> > +     esr =3D run->arm_sea.esr;
> > +     TEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_LOW);
> > +     TEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
> > +     TEST_ASSERT_EQ(ESR_ELx_ISS2(esr), 0);
> > +     TEST_ASSERT_EQ((esr & ESR_ELx_INST_SYNDROME), 0);
> > +     TEST_ASSERT_EQ(esr & ESR_ELx_VNCR, 0);
> > +
> > +     if (!(esr & ESR_ELx_FnV)) {
> > +             ksft_print_msg("Expect gva to match given FnV bit is 0\n"=
);
> > +             TEST_ASSERT_EQ(run->arm_sea.gva, EINJ_GVA);
> > +     }
> > +
> > +     if (run->arm_sea.flags & KVM_EXIT_ARM_SEA_FLAG_GPA_VALID) {
> > +             ksft_print_msg("Expect gpa to match given KVM_EXIT_ARM_SE=
A_FLAG_GPA_VALID is set\n");
> > +             TEST_ASSERT_EQ(run->arm_sea.gpa, einj_gpa & PAGE_ADDR_MAS=
K);
> > +     }
> > +
> > +     far_invalid =3D esr & ESR_ELx_FnV;
>
> Missing sync_global_to_guest()?

Ah, yes, and I can add sync_global_to_guest and get rid of
expect_far_invalid in expect_sea_handler.

>
> Thanks,
> Zenghui

