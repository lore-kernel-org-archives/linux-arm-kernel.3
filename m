Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B1C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 00:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tx2qCtcW1iHm6LrN7B3tW80PWrDcUeBrILrqk51qr+0=; b=YJJoLvGCfIDLZetkKdi2JNU8vW
	yX0WaGHusDZiZDEB0HDCjAIbbBb3DihoCzwPSL6sOSeOgkGI+EMqjCxJbAxZ9hTJK8GINl0FvrkPE
	TkYBLzxVeHJp7cNO7F//NRna6vQ5ToYIKOWpzwdZaEwmdUsLrJNQ+4S6EqEgp29z//6rJiyXdI3tg
	2yKgGNZNxd66JpiIKshHj+1m55QaZRrK8tezQpnwtjD+gHDfNLL9jz/PGjAsuC5sKu09fX7hXXm0P
	Hfw39jYt1wrARTU8L0uDtKjsb8IpzFcGbP6oEVNGbqk3CmcOPZ3QXJhHGlZAXFCjEJu4idgIu2dQm
	kNAe7N+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNlv-0000000G5QT-0a4t;
	Sat, 12 Jul 2025 00:07:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNex-0000000G4XU-0ZWS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 00:00:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-453663b7bf1so27485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 17:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752278406; x=1752883206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx2qCtcW1iHm6LrN7B3tW80PWrDcUeBrILrqk51qr+0=;
        b=3A8xYBCgQkYrhO72sJyu4hL2jzeDywSEYE1O3hTGkpoY2e9IrdlHBnMEhlAUZUK7xn
         OsaRpLaBjYbwfXCK0atulciZ+bionBeGSlJMRHhH/KLMxVQvPsuRa3OLZYsJDNGJzlek
         cXFgFQ4jX/hPWJoMBz3dJ1U1yFgVuAa5KSBjWWIxkfX1SSV0IGQvV6eaIxczod3Je8DV
         QbpoYeAKTrH+/JADIYa3L2/tFFgOQZcFzEuCZANPq24SguSd55VEHJfeqw+bl+b/RYvQ
         ALIYQru76KaKKHqSETV5PXmolqFYY0tyRnMGxptq1G7szjH0fCwHevILKApP4ZvSIW77
         j2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752278406; x=1752883206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tx2qCtcW1iHm6LrN7B3tW80PWrDcUeBrILrqk51qr+0=;
        b=p8R52OhKoUDijkUhywUGgY7JpavdXHs+/ZrI/Ayh+CbuaJq8gTeGOc6OhvAx2TPvtG
         9Gbm40wjsL5gOYpWGSkXDU0TjeC1em0pG3D6eIBgrSVsokLKXUlGDdmwr75mRw7vsdvP
         1sBeBh5B/MUEvuVbt9TxyuF3vVeuYH87prd35jG7+Fha/nCZ1LrD2X8h+I4h0/C8vL3n
         FMa9c7/0eeQl4rRRThSgCB/J/0T8iC059R1kJAhguTWOaLqAtC07bB1CCXbhwQbeJctZ
         A2b4WGIyy40qqKNKDZSAbvJWGJN+CP90WwdiVew6qC7mktjYofWusWeo9kIz++GKwYSh
         FnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyTVvOuZdsR/ndqWHt4e0yMUHbi/hwtIznF+pSso3ZHDJn9s0p7jPMv1lbxj8GIUK6c1XdUb2LQMPlkRmOAogv@lists.infradead.org
X-Gm-Message-State: AOJu0YwbAQIj8vfOOV5ppjT7Lf/Ujeqxwbl/UuJrAviB8mNfMaqU/ws8
	hlPBhG/wAj1pEPq7VYtJsdpUpH3EkUQDRCO69u32yQcZ7XjDFu2T97A+PW49jKn1ZvUxAuZSeDT
	pLTQiFET7GfAwW/QEaER8UuGtzbMSLusiqGoeIoft
X-Gm-Gg: ASbGncvJvOYblMCgPjkssWQbhtIVfdS+6RL082NDwjh8jGWzZT42MA/3eW9LgARDh1W
	iKr/li/0zp61OYcOJk1M4oMXbPYW3tCcc+FtHOzO8UN3w/1Za7ACuuhtM37XguyZK7YoUgQZU9M
	0XMOIjOQfWNtGRcjEtDlHCOXv0rtkLmI7qWxhZMdkQqXaTJNJmb1N0dpxtFjsR6ZlULjbO+CvRS
	FUgpDSltZwy5Sp+jI70tXh3JqSERQb3I5kRrw==
X-Google-Smtp-Source: AGHT+IGm/4nykkyL/t8NH+t513GwsEYgWr6SSPjErflvI3eUGlmuciPanbhrR0B98Q027GSJ0c2DKA/l/x09XDzmWT0=
X-Received: by 2002:a05:600c:5023:b0:453:79c3:91d6 with SMTP id
 5b1f17b1804b1-45604733553mr315825e9.1.1752278405508; Fri, 11 Jul 2025
 17:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com> <20250604050902.3944054-6-jiaqiyan@google.com>
 <aHFpt0qJF-Rvb2bS@linux.dev>
In-Reply-To: <aHFpt0qJF-Rvb2bS@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 11 Jul 2025 16:59:53 -0700
X-Gm-Features: Ac12FXxsGWdg2WMinw3VOi85RWYlMpcQBa3KtW7EiT-XKhADcP3_mP0w71DBbsg
Message-ID: <CACw3F525HQZ81riTQPuhR0moe8tNEst2AycwrGuM5xDq=oJGaw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] KVM: selftests: Test for KVM_CAP_INJECT_EXT_IABT
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_170007_175952_91F98F26 
X-CRM114-Status: GOOD (  25.72  )
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

On Fri, Jul 11, 2025 at 12:45=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> On Wed, Jun 04, 2025 at 05:09:00AM +0000, Jiaqi Yan wrote:
> > Test userspace can use KVM_SET_VCPU_EVENTS to inject an external
> > instruction abort into guest. The test injects instruction abort at an
> > arbitrary time without real SEA happening in the guest VCPU, so only
> > certain ESR_EL1 bits are expected and asserted.
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
>
> I reworked mmio_abort to be a general external abort test, can you add
> your test cases there in the next spin (arm64/external_aborts.c)?

For sure!

>
> Thanks,
> Oliver
>
> > ---
> >  tools/arch/arm64/include/uapi/asm/kvm.h       |  3 +-
> >  tools/testing/selftests/kvm/Makefile.kvm      |  1 +
> >  .../testing/selftests/kvm/arm64/inject_iabt.c | 98 +++++++++++++++++++
> >  3 files changed, 101 insertions(+), 1 deletion(-)
> >  create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c
> >
> > diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64=
/include/uapi/asm/kvm.h
> > index af9d9acaf9975..d3a4530846311 100644
> > --- a/tools/arch/arm64/include/uapi/asm/kvm.h
> > +++ b/tools/arch/arm64/include/uapi/asm/kvm.h
> > @@ -184,8 +184,9 @@ struct kvm_vcpu_events {
> >               __u8 serror_pending;
> >               __u8 serror_has_esr;
> >               __u8 ext_dabt_pending;
> > +             __u8 ext_iabt_pending;
> >               /* Align it to 8 bytes */
> > -             __u8 pad[5];
> > +             __u8 pad[4];
> >               __u64 serror_esr;
> >       } exception;
> >       __u32 reserved[12];
> > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/s=
elftests/kvm/Makefile.kvm
> > index 9eecce6b8274f..e6b504ded9c1c 100644
> > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > @@ -149,6 +149,7 @@ TEST_GEN_PROGS_arm64 +=3D arm64/arch_timer_edge_cas=
es
> >  TEST_GEN_PROGS_arm64 +=3D arm64/debug-exceptions
> >  TEST_GEN_PROGS_arm64 +=3D arm64/host_sve
> >  TEST_GEN_PROGS_arm64 +=3D arm64/hypercalls
> > +TEST_GEN_PROGS_arm64 +=3D arm64/inject_iabt
> >  TEST_GEN_PROGS_arm64 +=3D arm64/mmio_abort
> >  TEST_GEN_PROGS_arm64 +=3D arm64/page_fault_test
> >  TEST_GEN_PROGS_arm64 +=3D arm64/psci_test
> > diff --git a/tools/testing/selftests/kvm/arm64/inject_iabt.c b/tools/te=
sting/selftests/kvm/arm64/inject_iabt.c
> > new file mode 100644
> > index 0000000000000..0c7999e5ba5b3
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/arm64/inject_iabt.c
> > @@ -0,0 +1,98 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * inject_iabt.c - Tests for injecting instruction aborts into guest.
> > + */
> > +
> > +#include "processor.h"
> > +#include "test_util.h"
> > +
> > +static void expect_iabt_handler(struct ex_regs *regs)
> > +{
> > +     u64 esr =3D read_sysreg(esr_el1);
> > +
> > +     GUEST_PRINTF("Handling Guest SEA\n");
> > +     GUEST_PRINTF("  ESR_EL1=3D%#lx\n", esr);
> > +
> > +     GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_IABT_CUR);
> > +     GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
> > +
> > +     GUEST_DONE();
> > +}
> > +
> > +static void guest_code(void)
> > +{
> > +     GUEST_FAIL("Guest should only run SEA handler");
> > +}
> > +
> > +static void vcpu_run_expect_done(struct kvm_vcpu *vcpu)
> > +{
> > +     struct ucall uc;
> > +     bool guest_done =3D false;
> > +
> > +     do {
> > +             vcpu_run(vcpu);
> > +             switch (get_ucall(vcpu, &uc)) {
> > +             case UCALL_ABORT:
> > +                     REPORT_GUEST_ASSERT(uc);
> > +                     break;
> > +             case UCALL_PRINTF:
> > +                     ksft_print_msg("From guest: %s", uc.buffer);
> > +                     break;
> > +             case UCALL_DONE:
> > +                     ksft_print_msg("Guest done gracefully!\n");
> > +                     guest_done =3D true;
> > +                     break;
> > +             default:
> > +                     TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
> > +             }
> > +     } while (!guest_done);
> > +}
> > +
> > +static void vcpu_inject_ext_iabt(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_events events =3D {};
> > +
> > +     events.exception.ext_iabt_pending =3D true;
> > +     vcpu_events_set(vcpu, &events);
> > +}
> > +
> > +static void vcpu_inject_invalid_abt(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_vcpu_events events =3D {};
> > +     int r;
> > +
> > +     events.exception.ext_iabt_pending =3D true;
> > +     events.exception.ext_dabt_pending =3D true;
> > +
> > +     ksft_print_msg("Injecting invalid external abort events\n");
> > +     r =3D __vcpu_ioctl(vcpu, KVM_SET_VCPU_EVENTS, &events);
> > +     TEST_ASSERT(r && errno =3D=3D EINVAL,
> > +                 KVM_IOCTL_ERROR(KVM_SET_VCPU_EVENTS, r));
> > +}
> > +
> > +static void test_inject_iabt(void)
> > +{
> > +     struct kvm_vcpu *vcpu;
> > +     struct kvm_vm *vm;
> > +
> > +     vm =3D vm_create_with_one_vcpu(&vcpu, guest_code);
> > +
> > +     vm_init_descriptor_tables(vm);
> > +     vcpu_init_descriptor_tables(vcpu);
> > +
> > +     vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
> > +                             ESR_ELx_EC_IABT_CUR, expect_iabt_handler)=
;
> > +
> > +     vcpu_inject_invalid_abt(vcpu);
> > +
> > +     vcpu_inject_ext_iabt(vcpu);
> > +     vcpu_run_expect_done(vcpu);
> > +
> > +     kvm_vm_free(vm);
> > +}
> > +
> > +int main(void)
> > +{
> > +     test_inject_iabt();
> > +     return 0;
> > +}
> > --
> > 2.49.0.1266.g31b7d2e469-goog
> >

