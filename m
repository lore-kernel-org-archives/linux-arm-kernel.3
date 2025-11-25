Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ECBD0E6E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li1WfcmqjtXPdjeerPuuC1oso8LxzzKitkh3QfY2DDk=; b=pMiGj3sFY1HacAXvmV3ZKmdXeP
	nluutqHqDVDWy2kJ9SwRWwKKMpVF/+8BCnUvJ+pWNYy13YH9Td0ZuzHEnfWohbLoTSluqqJ5OdC5V
	0F0xN9ZVYAPjtuvEZ+fZDXC5D0iBBjlFwUNAPOVWUfCe13S8o5S71EFlcpR5WzQkJnnwM9gSN6NTl
	K12PbFNp403c2GnnNtQgmz5JfictSjzGtIBhHaXYv77W9EKLZkFyQytxZBFwL1tK6qPkWXh5EMN2+
	aOm6fiLwr8UumiCZiMHbuzng/1dx350yV2TCyth7HzWClWm4hseYCxZob9EXmhkteP1WO3ubb2ozh
	GkhklLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtV8-0000000DNpa-3VeU;
	Tue, 25 Nov 2025 13:54:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtV6-0000000DNpG-1DhQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:54:37 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so9027217a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764078874; x=1764683674; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li1WfcmqjtXPdjeerPuuC1oso8LxzzKitkh3QfY2DDk=;
        b=skB3zTT/dRG0iJd7uuDWuspH9SUUYhbh9ZGSre/LFCA3NnTjxboQPoy668rwor0KMB
         bMxp2g1CynR3F93UrVXlHqyYCS+544FzZ4xtjwj+ggKJIUvzcD7YXc+w+DwAbt4KvUXV
         SVn0/lQr5Glh2bnU8qzmQsInLEuSm3uTUumZw8FtsCrAuIgn/Otw7Kg8ScV89wbutFYM
         J4/rbRseRQ/H/O5YbUxeGj1C2l+cOpP1luYwiIIQ9LQxo59QOqgbuDd1Klbe32D8/OXz
         RwQS47cfiz5RNRAGBRQwR7hndSnd9fGdqna+R5/0EfS9V06IBJerORMLZsWA7WOccRPJ
         PaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078874; x=1764683674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=li1WfcmqjtXPdjeerPuuC1oso8LxzzKitkh3QfY2DDk=;
        b=Xifr62ApCD5AEbwrgIuj+YhGK8JXmLsLXsRwr78240izSB8QvfOff15RnNQ6uXVnwh
         lpsPjdrCingU9CkniFrT64vh655RTDyOYQGwdS+8T0Azn04aQVs3DkVQrS0TKIsENBDL
         DzWiGTNojj1bElo2ZZ8Il/rXZkXrhGNkvNdddbHrQk5Br3PKkHaZmY4U9tObwfOyg6+y
         UVwn+Q8AsiCpfZDpy/dgdKSTROMh2Tb3jKCAJD9dCdNLl2M5Ut3Ch3W1bBoHJzqgIJpA
         YqmWcw1GjhtFVfIEEzxrixK84XCwo8R1qV/PRU8bCgBej4cBTdBVRAFDihgwrAicRg3e
         4/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKqkOWdCA7mUMsahUwgF7TwAcis6sfJHUst2Anfye0/GCHAWnySv1Ttij6uJd7wQs+ZH+SsScKSA9gr/13vHTA@lists.infradead.org
X-Gm-Message-State: AOJu0YyzCKte+R4HJvTPs/wU2jNlB2qxQqwwaZcDFKjURUqEvpc4gf4g
	UmuOfaGfgoC0RP8SCXZU4EpE8fjL/uqqAQzW2J9AEfStNaBJFESGKxfkVDwHNcX2MHzQ9l6WCTR
	g07pGkceUgFwyVR/BHhg5mvhexObPvyhFwEGQ+ZIX
X-Gm-Gg: ASbGncvYr5QiTd+Msft4xuAo8DZowJLHXIY/MG9jDfIl3gAi/kZVjzkGt51QNWVglK9
	X5eHxxZDGQVeTC7GgAIys8b9OSsIoLaxITsdppqHLo/JsKusRp18upCGRzN9ijhIFq9xTdDqNkx
	Oqmqc3EIaa/hyAUh9RDQCL1f6nNvx0ynTStuegeejgjBYwi0Xv/9I2xHyFyHW/jGNNqwqdGSWSj
	tg78khfr3mpgYfEGVS3oNj+IRZr1sy2WL7X0LhOro5Loveh8uS0yGvi2249B9cPk6xcuf+jqulT
	U6ERcQ96UlywaDtnn701/Q==
X-Google-Smtp-Source: AGHT+IG6ASkGgvx/czvWoBu15bAdU7NpFOJSdMwjauSXrxJSakaQkNLc3nt+MghcZXQKiAwaDYQ8MHy93c2Td2xetAY=
X-Received: by 2002:a05:6402:27d2:b0:643:60b6:3eed with SMTP id
 4fb4d7f45d1cf-64555d0b0e8mr13479658a12.31.1764078873467; Tue, 25 Nov 2025
 05:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20251114-pkvm_init_noffa-v1-1-87a82e87c345@google.com>
 <86y0nyqoy9.wl-maz@kernel.org> <CACF_fqmWwtuF_7+OJ2rUPvDJzs4ubJO6XCf6N9cW2-AABSx_NQ@mail.gmail.com>
 <86ms4br2dz.wl-maz@kernel.org>
In-Reply-To: <86ms4br2dz.wl-maz@kernel.org>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Tue, 25 Nov 2025 14:54:21 +0100
X-Gm-Features: AWmQ_bkZGORaLGGQv90fi0qZIysVcT6wfv18GG47eL_bs8jumfSYM6eCm-h-Fcw
Message-ID: <CACF_fq=PwSucRBYCu7A7HvcZiGss49UQipERfmk0X84-gj5ZNw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Fix error checking for FFA_VERSION
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartlomiej Grzesik <bgrzesik@google.com>, Tomasz Nowicki <tnowicki@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_055436_394954_BEC9B770 
X-CRM114-Status: GOOD (  42.17  )
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

On Mon, Nov 24, 2025 at 2:22=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Mon, 24 Nov 2025 11:49:08 +0000,
> Kornel Dul=C4=99ba <korneld@google.com> wrote:
> >
> > On Sat, Nov 22, 2025 at 12:36=E2=80=AFPM Marc Zyngier <maz@kernel.org> =
wrote:
> > >
> > > On Fri, 14 Nov 2025 11:11:53 +0000,
> > > "=3D?utf-8?q?Kornel_Dul=3DC4=3D99ba?=3D" <korneld@google.com> wrote:
> > > >
> > > > According to section 13.2 of the DEN0077 FF-A specification, when
> > > > firmware does not support the requested version, it should reply wi=
th
> > > > FFA_RET_NOT_SUPPORTED(-1). Table 13.6 specifies the type of the err=
or
> > > > code as int32.
> > > > Currently, the error checking logic compares the unsigned long retu=
rn
> > > > value it got from the SMC layer, against a "-1" literal. This fails=
 due
> > > > to a type mismatch: the literal is extended to 64 bits, whereas the
> > > > register contains only 32 bits of ones(0x00000000ffffffff).
> > > > Consequently, hyp_ffa_init misinterprets the "-1" return value as a=
n
> > > > invalid FF-A version. This prevents pKVM initialization on devices =
where
> > > > FF-A is not supported in firmware.
> > >
> > > Is this statement accurate? I regularly boot KVM in protected mode in
> > > environments that really cannot be suspected of implementing FF-A
> > > (there is no EL3 to start with). And yet I don't see any failure of
> > > the sort.
> > >
> > > Please clarify the circumstances this is triggered.
> >
> > I do have EL3 enabled, but the FF-A itself is not implemented.
> >
> > Without this change kvm initialization fails with the following:
> >
> > [    0.946776][    T1] kvm [1]: nv: 554 coarse grained trap handlers
> > [    0.952880][    T1] kvm [1]: nv: 669 fine grained trap handlers
> > [    0.958813][    T1] kvm [1]: IPA Size Limit: 44 bits
> > (...)
> > [    1.034089][    T1] kvm [1]: Failed to init hyp memory protection
> > [    1.041213][    T1] kvm [1]: error initializing Hyp mode: -95
>
> [    0.045492] kvm [1]: nv: 568 coarse grained trap handlers
> [    0.045860] kvm [1]: nv: 664 fine grained trap handlers
> [    0.046194] kvm [1]: IPA Size Limit: 42 bits
> [    0.220184] kvm [1]: GICv3: no GICV resource entry
> [    0.220525] kvm [1]: disabling GICv2 emulation
> [    0.220852] kvm [1]: GIC system register CPU interface enabled
> [    0.221264] kvm [1]: vgic interrupt IRQ9
> [    0.221565] kvm [1]: Protected hVHE mode initialized successfully
>
> Ergo, it works here without FFA (this is in a nested guest that is not
> exposed anything but PSCI in the FW emulation).

I think this all boils down to how the error code is set in reply to
the FFA_VERSION SMC. In the do_ffa_version function in this file, the
return value is set with no casts: "res->a0 =3D FFA_RET_NOT_SUPPORTED;".
Since res->a0 is an unsigned long and `FFA_RET_NOT_SUPPORTED` is a
(-1) literal, the latter will get promoted resulting in res->a0 being
set to 0xffs.
At the same time any implementation that returns "0x00000000ffffffff"
will still be compliant with the FF-A spec, while triggering the bug
I'm trying to fix here.

>
> > I managed to narrow this down to the FFA version check by examining
> > all of the places in kvm initialization logic where -EOPNOTSUPP is
> > returned. Since printing anything in this part of the code is somewhat
> > problematic I replaced =E2=80=9Creturn -EOPNOTSUPP=E2=80=9D with =E2=80=
=9Creturn res.s0=E2=80=9D to
> > examine the problematic register value:
> >
> > [1.041229][    T1] kvm [1]: error initializing Hyp mode: -1
> >
> > Note that the return code itself is cast to int before being printed.
> > Then a colleague of mine recommended looking into the arm_ffa driver.
> > (=E2=80=9Cdrivers/firmware/arm_ffa/driver.c=E2=80=9D) There I found tha=
t in the
> > ffa_version_check function, the return value from the SMC call is cast
> > to s32 before being checked for errors.
> > I did the same in the kvm initialization logic, which is how this
> > patch was created. Furthermore I also examined the FF-A
> > specification(DEN0077), where the error code value type is specified
> > as int32.
> > With this change applied I can now see that kvm is up and running:
> >
> > [    0.946839][    T1] kvm [1]: nv: 554 coarse grained trap handlers
> > [    0.952940][    T1] kvm [1]: nv: 669 fine grained trap handlers
> > [    0.958867][    T1] kvm [1]: IPA Size Limit: 44 bits
> > (...)
> > [    1.061717][    T1] kvm [1]: Protected hVHE mode initialized success=
fully
> >
> > The /dev/kvm file is also there.
>
> I don't dispute the bug. I dispute the assertion that the absence of
> FFA triggers it. So either your testing environment influences the
> behaviour, or you have extra patches that also change the behaviour,
> or something else.

To be completely transparent I stumbled upon this using the android
fork of the kernel, but I don't think that matters here at all.
On my device all cores start in EL2, so the problematic SMC call
should go straight to the FW. I believe that the FW sets the a0
register to "0x00000000ffffffff", indicating that FF-A is not
available. This behavior is actually what the FF-A spec says should be
done, so this is not a case of broken FW.
At the same time it does trigger a bug in the error checking logic,
which I described above.

