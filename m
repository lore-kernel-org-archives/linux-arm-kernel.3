Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6F9C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Slx4ccuRWaY0rxsjL8o0FXzUV7zpEZYUBzQCDU2r9rQ=; b=uxU+FkoYkEcU9CXQTC/tRGbBN3
	ERZxnzQZyhSqCx7jzYUlWQh2Pn8102y/umMTpirmM8sbTmDotFHGDc0iaMtml6IuFQZ/TikfD13HS
	VEK6kHPde/WEhFzmyxyWnQFVVwldDxmncp4DFlHE3fLKCOdZyYVFo6lBHrW9Ozdm1JclRCPfbmyc6
	kZcdj5w6LfQ7zyPgPPUzH3ytQqAxqQtPqWtHF7RfTIutYHQ4WwHIlpTOU5NrxuyPT8MLZLAQnyJnt
	BnBA2rAA9r6Th+7NYv7yOystWtqpzphy6i62J7sofNyfp98uGvYSk3YlCOLPsrIJT6d/iyePLHgHQ
	SGI7rz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJhL-0000000GOYT-0NCQ;
	Wed, 14 May 2025 21:31:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJfH-0000000GO1V-2ojq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 21:29:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso20725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747258161; x=1747862961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Slx4ccuRWaY0rxsjL8o0FXzUV7zpEZYUBzQCDU2r9rQ=;
        b=HXIAr1M475qYYyMPLUs5E9LdMLdSXnfBMf2J8PdtOtCVQcftlHHZJR1xmX+0Qi9lG4
         dlXKlhPMLO1B4FzPfpSFu5ZQOijLO6sCfskm07rp18x+kXl38QNutQGKB4X/W4sdL3Dp
         7H0HlEy9/PmafoimdDhuaGwNoEarTvsJ590OYMFMge6ZAQX0GqrMigJ418n5NqA7AuNj
         RFTJRXzFq7IRdgv73LAoffDvXUSJL0V4o3nJrAXog0wU1m/iv5dOx6YmH4klxxBPO5op
         maVi1f29Ub0Pdp2LJkiWltbpjoFM22GzF26S1jX5KcN/Xuxh+GkvvF/ye4+zW22mOis5
         YP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747258161; x=1747862961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Slx4ccuRWaY0rxsjL8o0FXzUV7zpEZYUBzQCDU2r9rQ=;
        b=KZEb0wxU8yhGAWR/z9ypN7UqnyDbvem//VbTronZoQUtjVfyRF5YECc0foRVgHNfKK
         YGp3pzeK1WCXqCOOMck+97elhkGisxCuisGEwWa+kTIYpBMv0D9EheQdRZ8KCJWQbHkP
         2/VJ7/9Q0kuBgcF9hBgN5mAQTNFW0ksL9NHSck6uj2za/hCgK+M4qXSXrSvfAjem7seb
         DEk/nHVY0AcAtQdKBtw+WFb/fpUdBHQgXQ1GLPB9zeaEWC84KBMgIv2r/825wnlRbbQW
         yuglEE2UqW4UCf7ybucrUXytP7HiC8dtIshRml9iGUVtfKT+bTIUikGrAc4bkftbHG5p
         pIfw==
X-Forwarded-Encrypted: i=1; AJvYcCXozYGO9FatuEugRiwmrfUsk9SfjXyaKP9YSaD3rHObkaaHcW2luYwCwY5nGWOgv1oMl1GmfhkzXAp2QXdtfq87@lists.infradead.org
X-Gm-Message-State: AOJu0YwzLF9+rAzWGhtKDExUL0AIaO1QFqSYUPh33t1QcwTrjjs0kNUc
	8VpwFtJxd6tGJ/LFkphbkQGfA/2FllVj7bOcv0VwZa5u25ZItz+EXbUJPJ7HqJOy2QAE4PIzqY8
	igP8hc/YmvRh89nHDCn6kxXKZFyiGHZ9fsszIMzuH
X-Gm-Gg: ASbGnctlcWm+Ne7ar1VJJZ1s7pHQXoA2r17Qz9pxMibPxnTTJJtCzVTZWZmVrM0nYqD
	UbcJO9XVgBIXo+VbyKFpYRfZBpXQikD6wDWNsRK/GAyB0WC/+OSly7LgBj2xqQPaWFsyU9eSYek
	cx7kUrf5dXIGECV4eiLfLgmAneMDRgelwuFjEdw9i6dGHXUDywX0oDuTD2EiI6fg==
X-Google-Smtp-Source: AGHT+IHtyqQCkUrNJiUCv4rKrRfdaVNrxqYbN3dpp1JTn37YnHa0lc60bhCiTqHmnbfcp5FYiIwPf8xUOcF9xc4J1CY=
X-Received: by 2002:a7b:cb0b:0:b0:439:9434:1b66 with SMTP id
 5b1f17b1804b1-442f96918d2mr1145e9.1.1747258160984; Wed, 14 May 2025 14:29:20
 -0700 (PDT)
MIME-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com> <20250505161412.1926643-7-jiaqiyan@google.com>
 <830ecd3d-13d4-4f12-9fea-e20cc69d0a5c@oracle.com>
In-Reply-To: <830ecd3d-13d4-4f12-9fea-e20cc69d0a5c@oracle.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Wed, 14 May 2025 14:29:09 -0700
X-Gm-Features: AX0GCFsv8ezjBmFZxLF3RCnN2B0FNrLKw7sWOsaJ5KQNDume-9PaaiuTEgpZ5b8
Message-ID: <CACw3F53-SaPccosPqYcXWGEpwfKj-VbSJ5nJa3f82oFMbHAy2Q@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] Documentation: kvm: new uAPI for handling SEA
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_142923_711149_0EEDA033 
X-CRM114-Status: GOOD (  37.10  )
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

Thanks ALOK, for pointing out the typos! Queued the fixes to V2 while
awaiting for reviews on other patches.

On Wed, May 7, 2025 at 12:25=E2=80=AFPM ALOK TIWARI <alok.a.tiwari@oracle.c=
om> wrote:
>
> ...
> > +Inject SError
> > +~~~~~~~~~~~~~
> > +
> >   Set the pending SError exception state for this VCPU. It is not possi=
ble to
> >   'cancel' an Serror that has been made pending.
> >
> > -If the guest performed an access to I/O memory which could not be hand=
led by
> > -userspace, for example because of missing instruction syndrome decode
> > -information or because there is no device mapped at the accessed IPA, =
then
> > -userspace can ask the kernel to inject an external abort using the add=
ress
> > -from the exiting fault on the VCPU. It is a programming error to set
> > -ext_dabt_pending after an exit which was not either KVM_EXIT_MMIO or
> > -KVM_EXIT_ARM_NISV. This feature is only available if the system suppor=
ts
> > -KVM_CAP_ARM_INJECT_EXT_DABT. This is a helper which provides commonali=
ty in
> > -how userspace reports accesses for the above cases to guests, across d=
ifferent
> > -userspace implementations. Nevertheless, userspace can still emulate a=
ll Arm
> > -exceptions by manipulating individual registers using the KVM_SET_ONE_=
REG API.
> > +Inject SEA (synchronous external abort)
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +- If the guest performed an access to I/O memory which could not be ha=
ndled by
> > +  userspace, for example because of missing instruction syndrome decod=
e
> > +  information or because there is no device mapped at the accessed IPA=
.
> > +
> > +- If the guest consumed an uncorrected memory error, and RAS extension=
 in the
> > +  Trusted Firmware choose to notify PE with SEA, KVM has to handle it =
when
> > +  host APEI is unable to claim the SEA. For the following types of fau=
lts,
> > +  if userspace enabled KVM_CAP_ARM_SEA_TO_USER, KVM returns to userspa=
ce with
> > +  KVM_EXIT_ARM_SEA:
> > +
> > +  - Synchronous external abort, not on translation table walk or hardw=
are
> > +    update of translation table.
> > +
> > +  - Synchronous external abort on translation table walk or hardware u=
pdate of
> > +    translation table, including all levels.
> > +
> > +  - Synchronous parity or ECC error on memory access, not on translati=
on table
> > +    walk.
> > +
> > +  - Synchronous parity or ECC error on memory access on translation ta=
ble walk
> > +    or hardware update of translation table, including all levels.
> > +
> > +For the cases above, userspace can ask the kernel to replay either an =
external
> > +data abort (by setting ext_dabt_pending) or an external instruciton ab=
ort
>
> typo instruciton -> instruction
>
> > +(by setting ext_iabt_pending) into the faulting VCPU. KVM will use the=
 address
> > +from the exiting fault on the VCPU. Setting both ext_dabt_pending and
> > +ext_iabt_pending at the same time will return -EINVAL.
> > +
> > +It is a programming error to set ext_dabt_pending or ext_iabt_pending =
after an
> > +exit which was not KVM_EXIT_MMIO, KVM_EXIT_ARM_NISV or KVM_EXIT_ARM_SE=
A.
> > +Injecting SEA for data and instruction abort is only available if KVM =
supports
> > +KVM_CAP_ARM_INJECT_EXT_DABT and KVM_CAP_ARM_INJECT_EXT_IABT respective=
ly.
> > +
> > +This is a helper which provides commonality in how userspace reports a=
ccesses
> > +for the above cases to guests, across different userspace implementati=
ons.
> > +Nevertheless, userspace can still emulate all Arm exceptions by manipu=
lating
> > +individual registers using the KVM_SET_ONE_REG API.
> >
> >   See KVM_GET_VCPU_EVENTS for the data structure.
> >
> > @@ -7151,6 +7184,55 @@ The valid value for 'flags' is:
> >     - KVM_NOTIFY_CONTEXT_INVALID -- the VM context is corrupted and not=
 valid
> >       in VMCS. It would run into unknown result if resume the target VM=
.
> >
> > +::
> > +
> > +    /* KVM_EXIT_ARM_SEA */
> > +    struct {
> > +      __u64 esr;
> > +  #define KVM_EXIT_ARM_SEA_FLAG_GVA_VALID   (1ULL << 0)
> > +  #define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID   (1ULL << 1)
> > +      __u64 flags;
> > +      __u64 gva;
> > +         __u64 gpa;
> > +    } arm_sea;
> > +
> > +Used on arm64 systems. When the VM capability KVM_CAP_ARM_SEA_TO_USER =
is
> > +enabled, a VM exit is generated if guest caused a synchronous external=
 abort
> > +(SEA) and the host APEI fails to handle the SEA.
> > +
> > +Historically KVM handles SEA by first delegating the SEA to host APEI =
as there
> > +is high chance that the SEA is caused by consuming uncorrected memory =
error.
> > +However, not all platforms support SEA handling in APEI, and KVM's fal=
lback
> > +handling is to inject an async SError into the guest, which usually pa=
nics
> > +guest kernel unpleasantly. As an alternative, userspace can participat=
e into
> > +the SEA handling by enabling KVM_CAP_ARM_SEA_TO_USER at VM creation, a=
fter
> > +querying the capability. Once enabled, when KVM has to handle the gues=
t
> > +caused SEA, it returns to userspace with KVM_EXIT_ARM_SEA, with detail=
s
> > +about the SEA available in 'arm_sea'.
> > +
> > +The 'esr' filed holds the value of the exception syndrome register (ES=
R) while
>
> 'esr' filed holds -> 'esr' field hold
>
> > +KVM taking the SEA, which tells userspace the character of the current=
 SEA,
> > +such as its Exception Class, Synchronous Error Type, Fault Specific Co=
de and
> > +so on. For more details on ESR, check the Arm Architecture Registers
> > +documentation.
> > +
> > +The 'flags' field indicates if the faulting addresses are available wh=
ile
> > +taking the SEA:
> > +
> > +  - KVM_EXIT_ARM_SEA_FLAG_GVA_VALID -- the faulting guest virtual addr=
ess
> > +    is valid and userspace can get its value in the 'gva' field.
>
> the 'gpa' filed -> the 'gpa' field.
>
> > +  - KVM_EXIT_ARM_SEA_FLAG_GPA_VALID -- the faulting guest physical add=
ress
> > +    is valid and userspace can get its value in the 'gpa' filed.
> > +
> > +Userspace needs to take actions to handle guest SEA synchronously, nam=
ely in
> > +the same thread that runs KVM_RUN and receives KVM_EXIT_ARM_SEA. One o=
f the
> > +encouraged approaches is to utilize the KVM_SET_VCPU_EVENTS to inject =
the SEA
> > +to the faulting VCPU. This way, the guest has the opportunity to keep =
running
> > +and limit the blast radius of the SEA to the particular guest applicat=
ion that
> > +caused the SEA. If the Exception Class indicated by 'esr' field in 'ar=
m_sea'
> > +is data abort, userspace should inject data abort. If the Exception Cl=
ass is
> > +instruction abort, userspace should inject instruction abort.
>
>
> Thanks,
> Alok

