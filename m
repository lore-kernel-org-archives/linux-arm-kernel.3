Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC19CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMJunAX4GgTUnfdlT58BrIL66UezK+YQZcmeEHYrE2w=; b=Cg2ni9Seo57PDSOpK8864G8sFF
	KZCsrWqBhsWfsV9/vCNulqz8T3DZkEiY2bwkX2dRKxKZrZnRZdBBk+Z0SdJ9CfQys7Osu3N3Mpw2J
	O4ZJHTPLVT3CubIxjeC25cjFiWAzwhWn0DzFMLO1ZqLBw15a4qp4UXPY8om8ql4iEGbSQLhx9+l/8
	zjTQA+uuIDOIksiWMu7IogfBuFHprIVnSIJQuhNSJaeJ1smrAihmlxqzhUVXzP4SPh21IYJbZX5uf
	EWXia9zxEi8e+Uibw88TpQPSXcbmaIepP0HAwvo14bc926ihDn8nDlwCIoIL1VVss7xqVcUCyQc+w
	I5z5pbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKtO-00000001jQ3-13jZ;
	Tue, 19 May 2026 13:53:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKtL-00000001jPB-3OUa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779198830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMJunAX4GgTUnfdlT58BrIL66UezK+YQZcmeEHYrE2w=;
	b=iAOyXM6oQKGCs3i0/y0cFzEni5dv8jqdIw6V7e2MBE0bkr3xUNRQbr9iHLp+yR5eaN4SqP
	NqxK9BdUgdRY0+n+QnyRh3mFZTxJcTRDbRajQ4xnj6AEbG9oqqNdc6067SEQCBkqGGvFZ4
	zpgi17kDbrbtBPPjwyJIMkKWNTkANfA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-dhieIqW-PJeyP3QzOzjtiw-1; Tue, 19 May 2026 09:53:47 -0400
X-MC-Unique: dhieIqW-PJeyP3QzOzjtiw-1
X-Mimecast-MFC-AGG-ID: dhieIqW-PJeyP3QzOzjtiw_1779198826
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490261c79fcso696005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198826; x=1779803626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMJunAX4GgTUnfdlT58BrIL66UezK+YQZcmeEHYrE2w=;
        b=SiRbNszZxJMGl4qWjV7Vst1taQhqDQBLphc+W3TfvYQJFXiaTjACSG2AIKelyld6sN
         HwNpLIHEuG+C4hdVRrtS67ekRb8nh50RYJ9ltWB8xp3fH+Q5Y+yRgfNo+UH6cD76VTms
         KlKNAZBD3CyowlaxUJNx/Vch8+mWGQnJjBefuSOw2wNY2/X6cXdPPu8fvmRG1FiJ8Eon
         kSvX++9qeVOvogCwZu3Cdn4zC5ldQpKL+NFjBXpyzhLCbJSjAcklIs/hCsKNj70McN80
         n3t9Qo5F3IT56QZ0mPVOvcf02TVkvUc1if2DVSOAF5CsTorrpFOGdhog0W5vcmhi7s98
         k7HA==
X-Forwarded-Encrypted: i=1; AFNElJ9DWsPVt55B/Ku24ffCSE9zi+zUNcIR99z5mTq9o2h666nBW9S5ktU78hmB0B2A1aQgZ68KKqW1uKP3SeeV7kQW@lists.infradead.org
X-Gm-Message-State: AOJu0YwRtDZIF4EX1jsN8W//ZHcqT14klCMR5bopHA4PnCMsQvO8EwLu
	MK6BiuRwfNBnsVigx5DbKjxcHOFica9nbf93dMeRC6ETeNMVqkOHonef10CsDwW6O5r2RA5z8+H
	Kmm/dJEU9gY2XgJK+xcdxj3HgPM0xUnvZ5NgLagccU+9dbl4q18VNPzQyPlT2imYs1g/MyNje2g
	YknaVCytevurVaEJK0o3datbhx/URsxSAoHKd4mZ7qpjF/CRkJnzI=
X-Gm-Gg: Acq92OGNSh0mJzVCfO5+ob5uFzgI/ZXoflXzz4243AKGzmWNbRFzxHcw7Nti2874f+u
	AQwKxsBpPa3YPZz5DIVMDjsoGoSgncSFHY6hG+yKzMl5X6bh0DzR3cHYi982cQ0C9zcK6UjcoMW
	AkZ+PHSJ38e/e2DZN33tb+IOvCIkFtT7FlHcWqmBq5TytnxJQDTiqgGN3JyyaJE/OUPyKwVdQka
	9Ddykx4q/deCWiNUlBedvvPT+NZ56bj3Do6hLYoaJ5liDUqFqgMTH0M3mptLwO/e1BYTC76D71K
	cFbDSQ==
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr159587295e9.7.1779198826440;
        Tue, 19 May 2026 06:53:46 -0700 (PDT)
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id
 5b1f17b1804b1-48feea99dc7mr159586875e9.7.1779198826081; Tue, 19 May 2026
 06:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com> <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com> <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com> <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
 <CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
 <3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
 <agxFbniU_6eQ98t2@willie-the-truck> <cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
 <CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
 <86qzn7wp3y.wl-maz@kernel.org> <593a782c50f3c8656e13b36dfb975a67d43a908e.camel@infradead.org>
In-Reply-To: <593a782c50f3c8656e13b36dfb975a67d43a908e.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 19 May 2026 15:53:19 +0200
X-Gm-Features: AVHnY4J8OrpUxEzodEMJc7lM9sDn1bgq4nXZ_hmQu7D8CU-GrOTBpsMt27h0TJk
Message-ID: <CABgObfbS-z3OphDna5W_JQPvw+OK=yXJurVMHp1ANZ5uGEgVhQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
To: David Woodhouse <dwmw2@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvm <kvm@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kvmarm@lists.linux.dev, linux-kselftest <linux-kselftest@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -i4Qa7wn7ArpWQUfq6p3-y9DePCEgtEBOWMMhF2KvDo_1779198826
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_065351_918944_592F3280 
X-CRM114-Status: GOOD (  16.25  )
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

On Tue, May 19, 2026 at 3:00=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> Or some guest configurations which have only ever been tested under KVM
> could have a bug where they *rely* on the registers not being writable,
> and write values which are inconsistent with the rest of their
> configuration. Which breaks the moment those registers become writable.

Yeah, just having guests that worked by utter chance - but you still
don't want to break them - is the case that is most likely. Crappy
code that runs only under emulation/virtualization appears with
probability 1 over time.

Is this likely in this specific case---probably not, honestly.
Christoffer's patch dates back to 2018 (commit d53c2c29ae0d); *back
then* KVM/Arm was a lot less mature, and people developing for Arm on
vanilla upstream kernels have moved on from Linux 4.19.

I would still lean towards accepting the code considering the limited
complexity of the addition (in fact I like it more now that it uses
IIDR instead of v2_groups_user_writable, but that's taste).  However,
there's a huge difference between setting expectations based on 2018
vs 2026 maturity, and perhaps that's why Marc overall is inclined to
put this in the category of pointless bug for bug compatibility?

In any case, there's no arguing over this documentation patch, which
is already a good thing to know.

Thanks,

Paolo

> And those hypothetical cases *do* happen. All of the time. There's a
> massive zoo of guest operating systems; not just the major players like
> Linux, FreeBSD and Windows but a whole bunch of embedded home-grown and
> network appliance kernels.
>
> Nobody is claiming that we shouldn't fix any bug ever.


