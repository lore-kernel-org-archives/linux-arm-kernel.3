Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D41CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzW2rY1I2AKLs/LU+wRizdzQ22+SHdlJ/3qusxmFBDE=; b=QiDjusFaD5/7u7CEftplnSQmlA
	coFWUYh02V0la8rou0EfTgt+w76KFvDZZ0a1dthncPtoo70muyEHO9Vhd/F4ArhK5rQdS99xgByPU
	xVs8N6z+/18NqNI8tMm1X34h/Tz4MQD+17SFtWmtLmv+ZzVkgk6jKMID6/EPs1Nr6aQmgRsrcoof6
	1I+3LX7nhxY/MsuC9+6O+s4RH2BnoqyFxz0eu4zdZigPxHr/jGLnIGySDG+KFuDocdJ3utOnlSEik
	s7s+Rbiln1/C4mT4VJLurBPm9DoIvnUjVitBx+X2xmQRzKY7bJdsFgagi8CbrG+4wnLrCNw4HXP3X
	wtfEhs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBF00-000000004Db-35sq;
	Tue, 21 Oct 2025 16:14:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEzx-000000004Cp-2u5V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 16:14:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47101c27c9cso75865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761063247; x=1761668047; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzW2rY1I2AKLs/LU+wRizdzQ22+SHdlJ/3qusxmFBDE=;
        b=LOjYw+i68jqJfAhw7Jn1FdSw7ZRXmdTTlBJzdS3xrYgx3wMFKl4VSMacoJCShWbcYZ
         s1T9EbyGPOewm7We+4UrXXVVAPQ8rEE2HCr4ymxgGufLhhMoyjFHScIknJeuHKOboIHG
         eBVazjnpDr7V+77k6ocERe7B6l18Tpoa3jefH77IE3kVRnUUXJoSwC9MTVcB9VL6yez+
         I7kayAFz2njDzR9Wws4LHjvygcmQgjhav2aNqowVPe/HPbHh1JgcldnRuReTk5slB4z/
         KQm9NrdLhlfERp/J6VSEfRF225kelyVopDQZghBSGtIUkunvWxgxGAw0cE5diFfL3shb
         KbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761063247; x=1761668047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzW2rY1I2AKLs/LU+wRizdzQ22+SHdlJ/3qusxmFBDE=;
        b=q8eQRn3RGfzS6XInKQvV1qtqFAvC0hzvRG2yrRRkZDIT5Iv5aoqLURWHtJlKcF9oGa
         O5nOLhWSwmgy4JT/kplU6+sSJh+GNF2wREh7EJqe/VgeD3WloDxHuR4HrntpuIVlFtyc
         sFRB+PTgjGH2OWpVjM4Erxu6pfZVwhSZo1Nw7OHZFDuVL4NPxYxK+edMIpeXIJay+wnL
         mzuHdOQ/SntlBdYHqFzSiSmOzsIlxDbMtiiXv+BA4LTP8UTrlSJ842vGHSHSGC0g90SS
         JQ24RiiIYRwfvj1lEI3KQeLPwQAeOgILeBfvBK29VpcUyo+xaQ99xzKMh5QCw/xVKHwz
         LdGg==
X-Forwarded-Encrypted: i=1; AJvYcCUOq8+Ugzpo+1FXaX+TkiVqsjH9PJUFWpcb8Mg28dPu2N2KcnuOj9TYVZ5wPXjXAeipmbUBv9CD1wpxIcXCRoqG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4MZS+1jXVvrvDUYRmt8PmV/nssCZk1IKwsjZbzssgk99c9yO0
	MwP7hquyLhFQYs99wcXz/OH4IgoDrwAu/VwDhOZcCmd4yTMdjFOIpJKXMmVj4Kkrxe+mPgaKAZK
	Vf6FOX6qmYwbjF+YZdWsjitHWuIDoxlvac9DrRyuP
X-Gm-Gg: ASbGncuvQ6j6n6zsvQCg/MeW+lrTWxGnRF1s+r0JyCyOxpGFkT/c6zW6pTaYwRSH3Kq
	AunsVTQEHV0LlqOeoD3hfnHhLFI+bbLFxGUin1KL1bZPC/W3FFzvFAkzrmJ0Vwx87ltek271kVf
	PZTV8wnv4So5zhZ9FXBIEm47N200zcqB75Mk7CcyuQxvLvf+8VL9JTLDMZDJ4AYWFOHg2sfLa9n
	I1PbEjfd6klnb24W2dtb7hhPybjVnQWhB2TdSonEjwtaWHqbA1w9oHT3eCatpXWI4lYLNPH7hcX
	jPjWHkshUyLmopkr
X-Google-Smtp-Source: AGHT+IE14qTEBghQgzjgcliX4306euS6iolIBF3AxWlF2cEnTAIMms5VkABvdFJelKcvqwketyvRe6yUthJZ0L6j/JI=
X-Received: by 2002:a05:600c:8719:b0:46f:aa9f:e345 with SMTP id
 5b1f17b1804b1-47497744bccmr724965e9.7.1761063246555; Tue, 21 Oct 2025
 09:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <20251013185903.1372553-4-jiaqiyan@google.com>
 <3efcf624-58f1-4390-b6e2-a0aa5e62a9a3@infradead.org>
In-Reply-To: <3efcf624-58f1-4390-b6e2-a0aa5e62a9a3@infradead.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 21 Oct 2025 09:13:55 -0700
X-Gm-Features: AS18NWBrgiqcwjUkY7yriOgg09EsrU9gzSKpZPzp6diSIUTDX5ipeIw05uqw6vQ
Message-ID: <CACw3F53cqiwtGyeJw+baS23sK3byenC8R5ddzW6Q1e_Bzk8tJA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] Documentation: kvm: new UAPI for handling SEA
To: Randy Dunlap <rdunlap@infradead.org>
Cc: maz@kernel.org, oliver.upton@linux.dev, duenwen@google.com, 
	rananta@google.com, jthoughton@google.com, vsethi@nvidia.com, jgg@nvidia.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_091409_748547_21011D70 
X-CRM114-Status: GOOD (  37.85  )
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

On Mon, Oct 13, 2025 at 6:51=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/13/25 11:59 AM, Jiaqi Yan wrote:
> > Document the new userspace-visible features and APIs for handling
> > synchronous external abort (SEA)
> > - KVM_CAP_ARM_SEA_TO_USER: How userspace enables the new feature.
> > - KVM_EXIT_ARM_SEA: exit userspace gets when it needs to handle SEA
> >   and what userspace gets while taking the SEA.
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > ---
> >  Documentation/virt/kvm/api.rst | 61 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/ap=
i.rst
> > index 6ae24c5ca5598..43bc2a1d78e01 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -7272,6 +7272,55 @@ exit, even without calls to ``KVM_ENABLE_CAP`` o=
r similar.  In this case,
> >  it will enter with output fields already valid; in the common case, th=
e
> >  ``unknown.ret`` field of the union will be ``TDVMCALL_STATUS_SUBFUNC_U=
NSUPPORTED``.
> >  Userspace need not do anything if it does not wish to support a TDVMCA=
LL.
> > +
> > +::
> > +             /* KVM_EXIT_ARM_SEA */
> > +             struct {
> > +  #define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID   (1ULL << 0)
> > +                     __u64 flags;
> > +                     __u64 esr;
> > +                     __u64 gva;
> > +                     __u64 gpa;
> > +             } arm_sea;
> > +
> > +Used on arm64 systems. When the VM capability KVM_CAP_ARM_SEA_TO_USER =
is
> > +enabled, a VM exit is generated if guest causes a synchronous external=
 abort
> > +(SEA) and the host APEI fails to handle the SEA.
> > +
> > +Historically KVM handles SEA by first delegating the SEA to host APEI =
as there
> > +is high chance that the SEA is caused by consuming uncorrected memory =
error.
> > +However, not all platforms support SEA handling in APEI, and KVM's fal=
lback
> > +is to inject an asynchronous SError into the guest, which usually pani=
cs
> > +guest kernel unpleasantly. As an alternative, userspace can participat=
e into
>
>                                                                          =
  in
>
> > +the SEA handling by enabling KVM_CAP_ARM_SEA_TO_USER at VM creation, a=
fter
> > +querying the capability. Once enabled, when KVM has to handle the gues=
t
>
>                                                                      gues=
t-
> > +caused SEA, it returns to userspace with KVM_EXIT_ARM_SEA, with detail=
s
> > +about the SEA available in 'arm_sea'.
> > +
> > +The 'esr' field holds the value of the exception syndrome register (ES=
R) while
> > +KVM taking the SEA, which tells userspace the character of the current=
 SEA,
>    KVM takes
>
> > +such as its Exception Class, Synchronous Error Type, Fault Specific Co=
de and
> > +so on. For more details on ESR, check the Arm Architecture Registers
> > +documentation.
> > +
> > +The following values are defined for the 'flags' field
>
> Above needs an ending like '.' or ':'.
> (or maybe "::" depending how it is processed by Sphinx)
>
> > +
> > +  - KVM_EXIT_ARM_SEA_FLAG_GPA_VALID -- the faulting guest physical add=
ress
> > +    is valid and userspace can get its value in the 'gpa' field.
> > +
> > +Note userspace can tell whether the faulting guest virtual address is =
valid
> > +from the FnV bit in 'esr' field. If FnV bit in 'esr' field is not set,=
 the
> > +'gva' field hols the valid faulting guest virtual address.
>
>                holds (or contains)> +
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
> > +caused the SEA. Userspace may also emulate the SEA to VM by itself usi=
ng the
> > +KVM_SET_ONE_REG API. In this case, it can use the valid values from 'g=
va' and
> > +'gpa' fields to manipulate VCPU's registers (e.g. FAR_EL1, HPFAR_EL1).
> > +
> >  ::
> >
> >               /* Fix the size of the union. */
> > @@ -8689,6 +8738,18 @@ This capability indicate to the userspace whethe=
r a PFNMAP memory region
> >  can be safely mapped as cacheable. This relies on the presence of
> >  force write back (FWB) feature support on the hardware.
> >
> > +7.45 KVM_CAP_ARM_SEA_TO_USER
> > +----------------------------
> > +
> > +:Architecture: arm64
> > +:Target: VM
> > +:Parameters: none
> > +:Returns: 0 on success, -EINVAL if unsupported.
> > +
> > +This capability, if KVM_CHECK_EXTENSION indicates that it is available=
, means
> > +that KVM has an implementation that allows userspace to participate in=
 handling
> > +synchronous external abort caused by VM, by an exit of KVM_EXIT_ARM_SE=
A.
> > +
> >  8. Other capabilities.
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
>
> --
> ~Randy
>

Thanks for your quick review, Randy. I have queued fixes and am
waiting for reviews on other commits in this PATCH.

