Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957EEC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgWYvBUZsAdFKPaveOzEc3d+WOgwdbiYYocXO60wkYI=; b=z2tSKM0RFXzcXj/lomfAmnV+Nv
	0bpOuV9z1kLIrPVDsCVqCuZcMSm0w/SM4MtdG/hisKgyCO/459dTgNa6WBz+lrKt4BIP1V9RppwfT
	K4ubYaA9/FxhiuPWaqatmbohuy5JSk+En7r/ISxbRkpan1rM3n7ZwqEuUteAfscMmmA0Ma+CKr70n
	s7JDVSFSaoJyFfe6oBjsUuWau5USMA4io9kqBUnJUdghGLLMRbiDK1z0uxtreaqvONKooR6Ter2SR
	DuYA5HbRo5WbZ/nR57seZRddumfVV1pWcR78oD8JbPZo6k//7c5YSk9nzQk3iMMPQLogN62p+aBZV
	tJS7aIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaZO-00000004RLe-1nUo;
	Thu, 31 Jul 2025 21:12:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaTm-00000004QHX-1I59
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 21:06:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-456007cfcd7so28255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753995980; x=1754600780; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWYvBUZsAdFKPaveOzEc3d+WOgwdbiYYocXO60wkYI=;
        b=t/ZvrcZGOMAGD8fNiaMsa+247ROM/G5RokZiDCYADY+8uKkunF11QpYx8h4p18Z1X7
         QkAeEdPC3zXFfsyhhKxXuBcAAIwSlVRCbo8+Yb0v6McKnFQAA/gwU6i/n2fnQP7QtsUJ
         UZW3gLwou/5u5+XsQM+nEazAx/zD37zb6o4dKBrIXFZp0og4jgGkBwrQo0vuwNIK1UCd
         wq1orATdhuyYYDAjLz3p108QbBs4OA3N+MzMpgGoV6WMJV+ilCfy5kMno1krWfA33jME
         E52fD3IKNmsXJCzql7f6VMnreBxzO690TzkXPQXbylpWnfcOnWoEVWEuezB9TET9cpH6
         ZdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995980; x=1754600780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgWYvBUZsAdFKPaveOzEc3d+WOgwdbiYYocXO60wkYI=;
        b=Rvn3FX3ad9KvIBFQJ8FQynZIGq5EKRh6icTmfdj5rHgAj9dslR9nbvdfzB6p+5CaND
         ygH2CWr2qHOPeFR9XMxqKP65D/Td6G0oelFW49lFCJnF7G92f63Fb4sECyzgO6N410vr
         7QWw2YTvodV2RS8BTw0o5YrBYsL5FBoz6LeuHBN7siO8Zt+RFTByRZqPndWrWdzjOi3X
         f/uHxoGBxSdXsWnx46mOgo9DkqA1Fx97Pdh2R7RddkU4jpy9XCB4W4LmfOP0wATBsvGw
         AC68YVffWv/KOupRp0hWsP7FNPalzI15h7+7yZdpyLJNvrGQUM4UPbxgCbqwRh579EHJ
         WKiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9CTwTCUNYlFuuqPOzdvqcLlPqXEoekbFVCaFadKjTVwxpJhvXrv/b7E0eMOc6tdfui/3ImObSn1Imi4CkwFpo@lists.infradead.org
X-Gm-Message-State: AOJu0YxzceXCaL0XUvHTmidFbS5nsOYhI8kivKPjMfS6zK0+HkO639za
	zMjC2i22jYae2idpNtExHDB02qlO2E+2yI7sHfbG1VrJFoItnhryAtmw2UJhOShX0FpO0WQi0AG
	YIhfnOu8nK2KTpnBWBikLJc5gNT33dH68D2mw+8GU
X-Gm-Gg: ASbGnct3OwuJEGgrr23GkGtGNJx/TviHciS+ZJ+C72HSDSDigpj+91o1axxSqGQ5jwu
	VHsAkbfzMsYWA0ClmFFJ7fH02eSOoxR3AaOhSx2Vb6YeO9anO2Ky1FSnJi2fjCSH1IOnpr40v49
	EejccV0ff3GNqP+P6ijkvvj4kkJONqTWtivtOTknGhEAZndCldZNErfQB6HGHgAOcAYHrfoaPcZ
	SanEyS0/153sPi7uFnef7WakWfvJ1FlfJKKAQ==
X-Google-Smtp-Source: AGHT+IFm3eKGXrXl/O/AM6upHGvXxmGw78o++n3la/oaRAWXtoLaY8AnkOKammwFhld3+mfKolmNlEirM7qsdbyTR+8=
X-Received: by 2002:a05:600c:524d:b0:456:e94:466c with SMTP id
 5b1f17b1804b1-458aa0ceb0fmr65675e9.3.1753995979762; Thu, 31 Jul 2025 14:06:19
 -0700 (PDT)
MIME-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com> <20250604050902.3944054-2-jiaqiyan@google.com>
 <aHFohmTb9qR_JG1E@linux.dev> <CACw3F509B=AHhpaTcuH9O851rrDdHh1baC8uRYy7bDa7BSMhgg@mail.gmail.com>
 <aHK-DPufhLy5Dtuk@linux.dev> <CACw3F53TYZ1KFv0Yc-GCyOxn7TF3iYjTNSE8bd3nte=KaCN0UQ@mail.gmail.com>
 <CACw3F50Q_G75wf2rBm-P-NkyyO72i1NKqR9se99QrgipfD62yg@mail.gmail.com> <aIk88sBA2eIEF7w-@linux.dev>
In-Reply-To: <aIk88sBA2eIEF7w-@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 31 Jul 2025 14:06:07 -0700
X-Gm-Features: Ac12FXzFKc2B2EcyGnO8u_UvWK78u_LF9_nWfSQdCWk4Auknl3BBza84szmbGVs
Message-ID: <CACw3F504DbPhnN5MyBq4XES-=Te3Z4Xxqfkpifiu1DEgO3tUyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: VM exit to userspace to handle SEA
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
X-CRM114-CacheID: sfid-20250731_140622_353645_89B23D45 
X-CRM114-Status: GOOD (  40.29  )
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

On Tue, Jul 29, 2025 at 2:28=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Fri, Jul 25, 2025 at 03:54:10PM -0700, Jiaqi Yan wrote:
> > On Sat, Jul 19, 2025 at 2:24=E2=80=AFPM Jiaqi Yan <jiaqiyan@google.com>=
 wrote:
> > >
> > > On Sat, Jul 12, 2025 at 12:57=E2=80=AFPM Oliver Upton <oliver.upton@l=
inux.dev> wrote:
> > > >
> > > > On Fri, Jul 11, 2025 at 04:59:11PM -0700, Jiaqi Yan wrote:
> > > > > >  - Add some detail about FEAT_RAS where we may still exit to us=
erspace
> > > > > >    for host-controlled memory, as we cannot differentiate betwe=
en a
> > > > > >    stage-1 or stage-2 TTW SEA when taken on the descriptor PA
> > > > >
> > > > > Ah, IIUC, you are saying even if the FSC code tells fault is on T=
TW
> > > > > (esr_fsc_is_secc_ttw or esr_fsc_is_sea_ttw), it can either be gue=
st
> > > > > stage-1's or stage-2's descriptor PA, and we can tell which from
> > > > > which.
> > > > >
> > > > > However, if ESR_ELx_S1PTW is set, we can tell this is a sub-case =
of
> > > > > stage-2 descriptor PA, their usage is for stage-1 PTW but they ar=
e
> > > > > stage-2 memory.
> > > > >
> > > > > Is my current understanding right?
> > > >
> > > > Yep, that's exactly what I'm getting at. As you note, stage-2 abort=
s
> > > > during a stage-1 walk are sufficiently described, but not much else=
.
> > >
> > > Got it, thanks!
> > >
> > > >
> > > > > > +/*
> > > > > > + * Returns true if the SEA should be handled locally within KV=
M if the abort is
> > > > > > + * caused by a kernel memory allocation (e.g. stage-2 table me=
mory).
> > > > > > + */
> > > > > > +static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
> > > > > > +{
> > > > > > +       /*
> > > > > > +        * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any ex=
ternal abort
> > > > > > +        * taken from a guest EL to EL2 is due to a host-impose=
d access (e.g.
> > > > > > +        * stage-2 PTW).
> > > > > > +        */
> > > > > > +       if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
> > > > > > +               return true;
> > > > > > +
> > > > > > +       /* KVM owns the VNCR when the vCPU isn't in a nested co=
ntext. */
> > > > > > +       if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
> > > > > > +               return true;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * Determining if an external abort during a table walk=
 happened at
> > > > > > +        * stage-2 is only possible with S1PTW is set. Otherwis=
e, since KVM
> > > > > > +        * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. a=
ccessing the PA
> > > > > > +        * of the stage-1 descriptor) can reach here and are re=
ported with a
> > > > > > +        * TTW ESR value.
> > > > > > +        */
> > > > > > +       return esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW)=
;
> > > > >
> > > > > Should we include esr_fsc_is_secc_ttw? like
> > > > >   (esr_fsc_is_sea_ttw(esr) || esr_fsc_is_secc_ttw(esr)) && (esr &=
 ESR_ELx_S1PTW)
> > > >
> > > > Parity / ECC errors are not permitted if FEAT_RAS is implemented (w=
hich
> > > > is tested for up front).
> > >
> > > Ah, thanks for pointing this out.
> > >
> > > >
> > > > > > +}
> > > > > > +
> > > > > >  int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > > > > >  {
> > > > > > +       u64 esr =3D kvm_vcpu_get_esr(vcpu);
> > > > > > +       struct kvm_run *run =3D vcpu->run;
> > > > > > +       struct kvm *kvm =3D vcpu->kvm;
> > > > > > +       u64 esr_mask =3D ESR_ELx_EC_MASK  |
> > > > > > +                      ESR_ELx_FnV      |
> > > > > > +                      ESR_ELx_EA       |
> > > > > > +                      ESR_ELx_CM       |
> > > > > > +                      ESR_ELx_WNR      |
> > > > > > +                      ESR_ELx_FSC;
> > > > >
> > > > > Do you (and why) exclude ESR_ELx_IL on purpose?
> > > >
> > > > Unintended :)
> > >
> > > Will add into my patch.
> > >
> > > >
> > > > > BTW, if my previous statement about TTW SEA is correct, then I al=
so
> > > > > understand why we need to explicitly exclude ESR_ELx_S1PTW.
> > > >
> > > > Right, we shouldn't be exposing genuine stage-2 external aborts to =
userspace.
> > > >
> > > > > > +       u64 ipa;
> > > > > > +
> > > > > > +
> > > > > >         /*
> > > > > >          * Give APEI the opportunity to claim the abort before =
handling it
> > > > > >          * within KVM. apei_claim_sea() expects to be called wi=
th IRQs
> > > > > > @@ -1824,7 +1864,32 @@ int kvm_handle_guest_sea(struct kvm_vcpu=
 *vcpu)
> > > > > >         if (apei_claim_sea(NULL) =3D=3D 0)
> > > > >
> > > > > I assume kvm should still lockdep_assert_irqs_enabled(), right? T=
hat
> > > > > is, a WARN_ON_ONCE is still useful in case?
> > > >
> > > > Ah, this is diffed against my VNCR prefix which has this context. Y=
es, I
> > > > want to preserve the lockdep assertion.
> > >
> > > Thanks for sharing the patch! Should I wait for you to send and queue
> > > to kvmarm/next and rebase my v3 to it? Or should I insert it into my
> > > v3 patch series with you as the commit author, and Signed-off-by you?
> >
> > Friendly ping for this question, my v3 is ready but want to confirm
> > the best option here.
> >
> > Recently we found even the newer ARM64 platforms used by our org has
> > to rely on KVM to more gracefully handle SEA (lacking support from
> > APEI), so we would really want to work with upstream to lock down the
> > proposed approach/UAPI asap.
>
> Posted the VNCR fix which I plan on taking in 6.17. Feel free to rebase
> your work on top of kvmarm-6.17 or -rc1 when it comes out.

Thanks Oliver! I sent out v3 based on the VNCR fix here on top of the
current kvmarm/next.

>
> https://lore.kernel.org/kvmarm/20250729182342.3281742-1-oliver.upton@linu=
x.dev/
>
> Thanks,
> Oliver

