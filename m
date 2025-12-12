Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58564D59F50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCLPUx88ZdHJmS22/LgzBzk06kvYjDGU5Iph4HFcUyk=; b=YdnQuSPl6FAOopxHqzSM93Dm8w
	3YAM8LPO9g84AcOdqAVyNipGdVX8IIUuW4pjlyyx8bqSf2AEEdodpfuqKYC7bme0CjQxSHDG5WPZ+
	WQ1CWQKV2mcRH+paQLBsdwl5BbHM732syT5p92j0sQYXXZ09WK/Zdr3i2I2jlmRYD4my1py3TnlQB
	FNxYT4nzrStZGQGaOLzHZNDlUlAFk0HWbnRZGMMVDE3Dk6auPlVBlsHKXrZZ88jmRVJ9v3d30aLeL
	/nQJuJJcl7pJQa/1RUWtseI+4vmWLkAjfZ5t/btRK2AvkckkQS8vTQU2dnD/reDVIx0h5C/D3g/pR
	TITRfu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBqg-00000001BPN-00xE;
	Fri, 12 Dec 2025 22:42:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBqd-00000001BOy-0m7b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 22:42:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779a4fb9bfso152345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 14:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765579369; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4oq3JUf8OF8JQ1mhGlxfKtkxZXWDcQMW2iLDcf2Q2yQsGLnM7u8PZ3gZAalqu2Fo4
         y7XlyWdYXZsGNNTzxXEv6f+dttKVxeh5UGIOnTwaxyN4df07Rvn9dl7F6kiEGqHbi26A
         j6+zlI8Q/ke0fk6LhrhTCqYXamHme21gBtbZn4qkxeWGVIDdu4D3D0tgrb/89XVR160S
         jFynlA25TNYZ0XUM6fkAcWbA0m7YmIf0EoPlE8s+8WldVaEBpR0dY6377M5bM24fnzT/
         7P0P1KiefGi6HSrwYluMBRdnbCscnPNnct5w7PE/XEW/NyEVuu21RIk3BhJ/QLSo1BZF
         lkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GCLPUx88ZdHJmS22/LgzBzk06kvYjDGU5Iph4HFcUyk=;
        fh=Yo0mTCMsTITs59ZnUmNmCrUpZw/eaSR476bC5vJDcvw=;
        b=FA9x3Zt4HTC7baVCCTuSt+be9JEfYN48tOgGYsB7PzZti+6OrjSdMFw/7YSgpSYJnf
         A58xBvQptIFvptT3B7x5gg04MQQcPsSh6mxq2x+ezm4ioKzIWTLHBg+BMFRoSScROE9W
         GQCg9tAgP1NGcCeQj+atg4iymTXNlQFWNn4Ipnyrch7P6sTXLy7iuwizunSnsj2wK9JR
         dd7w/9L+Omh9psdKH1XNB0uJPaO+w5JXzEVx2wjNZ6pqqtY1+t+hucTeNePm9DYo6PqL
         k3hpCLATiQqmoqpPlFWsE6gEdjgbWQjuiwkjGUjEf402PI7tueXXYg6QJk0NMHU3FV6q
         AkVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765579369; x=1766184169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCLPUx88ZdHJmS22/LgzBzk06kvYjDGU5Iph4HFcUyk=;
        b=MRZux2gmKX6C0xTdK3Rgxun/8YquNjVGYF7nZVxp6QpL+7j8LnvKIM2xOsj1E0s+6x
         CA+oVl6UWGgT49qZtCJMMho+6ckp3p4KDQ7rPbB7MSHRCFiKDZRtQnWYVNWLNInHAdFx
         hz49eRzmI1QRI1vlefyVW1meMfD2YvcndnlP5q1zzGlz+p+Dm84NrLSk/VM440mI7IS+
         SWezCvLm6QEjSH4Xc5BHq0HCeoYOCwyQ6wHcUA7k0+Hz0L+Siyq6k/Tpazj9183p2OVW
         PiIgg1HzP24ozW0tDtpSexjkPGQTzcXl4g/RTd0a2tXyKZXJhE0bHlikAaVPfJjO23CU
         xPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765579369; x=1766184169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCLPUx88ZdHJmS22/LgzBzk06kvYjDGU5Iph4HFcUyk=;
        b=ZMYAQvKk2roW/S14samnZgFTNBaehrFHqFm9ZR0n3KTfACEkKwhOT7ao3yUD9+AIH9
         6XFVrO71JSfFQLWupHLSmI9kBtXfMzzS0QcjQYB1hbtZkkd2OcDY4gBJbvsRIvtzg1w3
         TlqBVMKOGPUQ5WcyKVdKo1D8X55oaF7EBz8mN/E2gkr5fmjJdZ9GiMpruo3GhOqazu+x
         YUcBy47u6Dig8Wgt8zzJBWN1UYcY30EkN/z04W4sG/NhrSzQtYP3g2zfEgRTBvIL4/vn
         LPQWd371w8MNfjHOQq6gPK9+lM57jozXfBZZ4j1RRJl04uuGObQ76qTh2dwWWg7YQBe/
         3hig==
X-Forwarded-Encrypted: i=1; AJvYcCVXzQTGfTou+GoJYyRc4NG5GB66AUal4Sd60t4b/jAw9AG8F/yCbLNB7V+WvaVflIPwaIr8U++5eDc9G0uYN5Pf@lists.infradead.org
X-Gm-Message-State: AOJu0YzLKT4kmxNDiucTpwHUR9rmd9rJ6tljOjGcDS9Va+J/dSmEGHGb
	PDGmkaYxmPOS5b9DDPuhRJKuEEVYF2iFxiMTHakUXdjfrNry4Dks5L3Wb1bKW3suNDRC1Tz++2Z
	fHvqJkHnQmXxFfJAP/LdvD+78m6N3/EClLxc2Fy1r
X-Gm-Gg: AY/fxX5Ku/x5n1tzTg827VmVZfQTppsJ3c3ioBojzvsRne5iBdIda+g6qOiHvJV2+jF
	WIjgfr4eNfGbAP0/Cs4WSqHDjdTbGLVkZ0F2iozLJlNf09NsFZxV2QSZpPSeo5yAOXCDauwVoG9
	WkHFVHLqs6p9N+KadaSD1QCXOhnLBfYZKua+BzmTaNoZC+Rr5lrwnExmW7azRurV7T2+04u7OA/
	d5VWTTbdNqSEt0QAzDbmtvKes42mWPoZgmeeojcOFlW6/rp7Xa2kiSrMVdd8z67d9IE7sseqBuv
	P4spBaAZvp8P+i1yZar5hOUTWshN
X-Google-Smtp-Source: AGHT+IGycUDLgfiYo6g1zTqU/jgYJfkyvEbX43ygSbXNWZeJGMb236iTpZ88xPMSD0uFM0/wQUo7NV0Ahf4F4PzTuS8=
X-Received: by 2002:a05:600c:83c4:b0:477:86fd:fb18 with SMTP id
 5b1f17b1804b1-47a94869ebbmr337505e9.8.1765579369059; Fri, 12 Dec 2025
 14:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <20251013185903.1372553-3-jiaqiyan@google.com>
 <3061f5f8-cef0-b7b1-c4de-f2ceea29af9a@huawei.com> <CACw3F51mRXCDz7Hd4Vve98NoskhB2cSc88zAGfd6Hwr4uCBxPA@mail.gmail.com>
 <dbcfb853-5853-5967-1bf9-76c6b3839717@huawei.com>
In-Reply-To: <dbcfb853-5853-5967-1bf9-76c6b3839717@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 12 Dec 2025 14:42:37 -0800
X-Gm-Features: AQt7F2rl2f5bneq6f6crNhZuIfA-M_NY1_crL-5oW0NtvHoqkZtXMaIozb_07o8
Message-ID: <CACw3F51FQwCLe17E4VC5wtpnCyuBOMrchvoBYCcwTxPkuxD+fg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] KVM: selftests: Test for KVM_EXIT_ARM_SEA
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, duenwen@google.com, 
	rananta@google.com, jthoughton@google.com, vsethi@nvidia.com, jgg@nvidia.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_144251_549679_067BE852 
X-CRM114-Status: GOOD (  26.14  )
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

On Fri, Dec 12, 2025 at 1:22=E2=80=AFAM Zenghui Yu <yuzenghui@huawei.com> w=
rote:
>
> On 2025/12/12 9:53, Jiaqi Yan wrote:
> > On Thu, Dec 11, 2025 at 5:02=E2=80=AFAM Zenghui Yu <yuzenghui@huawei.co=
m> wrote:
> > >
> > > I can also hit this ASSERT with:
> > >
> > > Random seed: 0x6b8b4567
> > > # Mapped 0x40000 pages: gva=3D0x80000000 to gpa=3D0xff80000000
> > > # Before EINJect: data=3D0xbaadcafe
> > > # EINJ_GVA=3D0x81234bad, einj_gpa=3D0xff81234bad, einj_hva=3D0xffff41=
234bad,
> > > einj_hpa=3D0x2841234bad
> > > # echo 0x10 > /sys/kernel/debug/apei/einj/error_type - done
> > > # echo 0x2 > /sys/kernel/debug/apei/einj/flags - done
> > > # echo 0x2841234bad > /sys/kernel/debug/apei/einj/param1 - done
> > > # echo 0xffffffffffffffff > /sys/kernel/debug/apei/einj/param2 - done
> > > # echo 0x1 > /sys/kernel/debug/apei/einj/notrigger - done
> > > # echo 0x1 > /sys/kernel/debug/apei/einj/error_inject - done
> > > # Memory UER EINJected
> > > # Dump kvm_run info about KVM_EXIT_MMIO
> > > # kvm_run.arm_sea: esr=3D0xffff90ba0040, flags=3D0x691000
> > > # kvm_run.arm_sea: gva=3D0x100000008, gpa=3D0
> > > =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
> > >   arm64/sea_to_user.c:207: exit_reason =3D=3D (41)
> > >   pid=3D38023 tid=3D38023 errno=3D4 - Interrupted system call
> > >      1  0x0000000000402d1b: run_vm at sea_to_user.c:207
> > >      2  0x0000000000402467: main at sea_to_user.c:330
> > >      3  0x0000ffff9122b03f: ?? ??:0
> > >      4  0x0000ffff9122b117: ?? ??:0
> > >      5  0x00000000004026ef: _start at ??:?
> > >   Wanted KVM exit reason: 41 (ARM_SEA), got: 6 (MMIO)
> > >
> > > Not sure what's wrong it..
> >
> > Does your test machine have SDEI or SCI enabled for host APEI? Do you
> > see any kernel log from "Memory failure:" saying hugetlb page
> > recovered, and recovered significant earlier than the KVM exit here.
> > It maybe the kernel has already unmapped hugepage in response to SDEI
> > or SCI before this test actually consumes memory error, so no SEA is
> > actually triggered.
>
> No kernel log was printed when I saw this failure.

Hmm, and even no CPER logged by APEI/GHES? That makes me suspect the
error wasn't injected successfully.

In that case, I found a bug in sea_to_user.c: GUEST_FAIL is not
handled by run_vm and results in unhandled MMIO.

Here is a fix I tested on my side, with some other minor fixes. Do you
mind trying it?

commit b96a92d1006fbe2752ba133eb76b0c45c9c54265
Author: Jiaqi Yan <jiaqiyan@google.com>
Date:   Fri Dec 12 22:27:53 2025 +0000

    KVM: selftests: Improve sea_to_user test

    Several improvments to the test for KVM_EXIT_ARM_SEA:
    - refactor run_vm to catch GUEST_FAIL, instead of causing confusing
    kvm exit with unhandled MMIO
    - sync far_invalid to guest
    - exit with KSFT_SKIP or KSFT_FAIL when should

    Change-Id: I8b735de3b669297f0638bea2d32a0b36211f7f5c

diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c
b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index 573dd790aeb8e..6fd3cd881b415 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -98,11 +98,15 @@ static void write_einj_entry(const char
*einj_path, uint64_t val)

 static void inject_uer(uint64_t paddr)
 {
-       if (access("/sys/firmware/acpi/tables/EINJ", R_OK) =3D=3D -1)
-               ksft_test_result_skip("EINJ table no available in firmware"=
);
+       if (access("/sys/firmware/acpi/tables/EINJ", R_OK) =3D=3D -1) {
+               ksft_test_result_skip("EINJ table not available in firmware=
\n");
+               exit(KSFT_SKIP);
+       }

-       if (access(EINJ_ETYPE, R_OK | W_OK) =3D=3D -1)
+       if (access(EINJ_ETYPE, R_OK | W_OK) =3D=3D -1) {
                ksft_test_result_skip("EINJ module probably not loaded?\n")=
;
+               exit(KSFT_SKIP);
+       }

        write_einj_entry(EINJ_ETYPE, ERROR_TYPE_MEMORY_UER);
        write_einj_entry(EINJ_FLAGS, MASK_MEMORY_UER);
@@ -123,12 +127,13 @@ static void sigbus_signal_handler(int sig,
siginfo_t *si, void *v)
        ksft_print_msg("SIGBUS (%d) received, dumping siginfo...\n", sig);
        ksft_print_msg("si_signo=3D%d, si_errno=3D%d, si_code=3D%d, si_addr=
=3D%p\n",
                       si->si_signo, si->si_errno, si->si_code, si->si_addr=
);
-       if (si->si_code =3D=3D BUS_MCEERR_AR)
+       if (si->si_code =3D=3D BUS_MCEERR_AR) {
                ksft_test_result_skip("SEA is claimed by host APEI\n");
-       else
+               exit(KSFT_SKIP);
+       } else {
                ksft_test_result_fail("Exit with signal unhandled\n");
-
-       exit(0);
+               exit(KSFT_FAIL);
+       }
 }

 static void setup_sigbus_handler(void)
@@ -158,7 +163,6 @@ static void expect_sea_handler(struct ex_regs *regs)
 {
        u64 esr =3D read_sysreg(esr_el1);
        u64 far =3D read_sysreg(far_el1);
-       bool expect_far_invalid =3D far_invalid;

        GUEST_PRINTF("Handling Guest SEA\n");
        GUEST_PRINTF("ESR_EL1=3D%#lx, FAR_EL1=3D%#lx\n", esr, far);
@@ -166,7 +170,7 @@ static void expect_sea_handler(struct ex_regs *regs)
        GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_CUR);
        GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);

-       if (expect_far_invalid) {
+       if (far_invalid) {
                GUEST_ASSERT_EQ(esr & ESR_ELx_FnV, ESR_ELx_FnV);
                GUEST_PRINTF("Guest observed garbage value in FAR\n");
        } else {
@@ -185,25 +189,19 @@ static void vcpu_inject_sea(struct kvm_vcpu *vcpu)
        vcpu_events_set(vcpu, &events);
 }

-static void run_vm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+static void validate_kvm_exit_arm_sea(struct kvm_vm *vm, struct kvm_vcpu *=
vcpu)
 {
-       struct ucall uc;
-       bool guest_done =3D false;
        struct kvm_run *run =3D vcpu->run;
        u64 esr;

-       /* Resume the vCPU after error injection to consume the error. */
-       vcpu_run(vcpu);
+       TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_ARM_SEA);

-       ksft_print_msg("Dump kvm_run info about KVM_EXIT_%s\n",
-                      exit_reason_str(run->exit_reason));
+       ksft_print_msg("Dumping kvm_run as arm_sea:\n");
        ksft_print_msg("kvm_run.arm_sea: esr=3D%#llx, flags=3D%#llx\n",
                       run->arm_sea.esr, run->arm_sea.flags);
        ksft_print_msg("kvm_run.arm_sea: gva=3D%#llx, gpa=3D%#llx\n",
                       run->arm_sea.gva, run->arm_sea.gpa);

-       TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_ARM_SEA);
-
        esr =3D run->arm_sea.esr;
        TEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_DABT_LOW);
        TEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
@@ -211,39 +209,48 @@ static void run_vm(struct kvm_vm *vm, struct
kvm_vcpu *vcpu)
        TEST_ASSERT_EQ((esr & ESR_ELx_INST_SYNDROME), 0);
        TEST_ASSERT_EQ(esr & ESR_ELx_VNCR, 0);

-       if (!(esr & ESR_ELx_FnV)) {
-               ksft_print_msg("Expect gva to match given FnV bit is 0\n");
+       far_invalid =3D esr & ESR_ELx_FnV;
+       sync_global_to_guest(vm, far_invalid);
+
+       if (!far_invalid) {
+               ksft_print_msg("Expect gva to match\n");
                TEST_ASSERT_EQ(run->arm_sea.gva, EINJ_GVA);
        }

        if (run->arm_sea.flags & KVM_EXIT_ARM_SEA_FLAG_GPA_VALID) {
-               ksft_print_msg("Expect gpa to match given
KVM_EXIT_ARM_SEA_FLAG_GPA_VALID is set\n");
+               ksft_print_msg("Expect gpa to match\n");
                TEST_ASSERT_EQ(run->arm_sea.gpa, einj_gpa & PAGE_ADDR_MASK)=
;
        }
+}

-       far_invalid =3D esr & ESR_ELx_FnV;
-
-       /* Inject a SEA into guest and expect handled in SEA handler. */
-       vcpu_inject_sea(vcpu);
+static void run_vm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+{
+       struct ucall uc;
+       bool guest_done =3D false;

        /* Expect the guest to reach GUEST_DONE gracefully. */
        do {
                vcpu_run(vcpu);
-               switch (get_ucall(vcpu, &uc)) {
-               case UCALL_PRINTF:
-                       ksft_print_msg("From guest: %s", uc.buffer);
-                       break;
-               case UCALL_DONE:
-                       ksft_print_msg("Guest done gracefully!\n");
-                       guest_done =3D 1;
-                       break;
-               case UCALL_ABORT:
-                       ksft_print_msg("Guest aborted!\n");
-                       guest_done =3D 1;
-                       REPORT_GUEST_ASSERT(uc);
-                       break;
-               default:
-                       TEST_FAIL("Unexpected ucall: %lu\n", uc.cmd);
+               if (vcpu->run->exit_reason =3D=3D KVM_EXIT_ARM_SEA) {
+                       validate_kvm_exit_arm_sea(vm, vcpu);
+                       vcpu_inject_sea(vcpu);
+               } else {
+                       switch (get_ucall(vcpu, &uc)) {
+                       case UCALL_PRINTF:
+                               ksft_print_msg("From guest: %s", uc.buffer)=
;
+                               break;
+                       case UCALL_DONE:
+                               ksft_print_msg("Guest done gracefully!\n");
+                               guest_done =3D 1;
+                               break;
+                       case UCALL_ABORT:
+                               ksft_print_msg("Guest aborted!\n");
+                               guest_done =3D 1;
+                               REPORT_GUEST_ASSERT(uc);
+                               break;
+                       default:
+                               TEST_FAIL("Unexpected ucall: %lu\n", uc.cmd=
);
+                       }
                }
        } while (!guest_done);
 }

>
> Thanks,
> Zenghui

