Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56365C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfn+cvLcuo2+8PMQ2pEe08Zdvwxhoz9ADZwuC0pV8LY=; b=X+m10P9HC3OLIcaOuPBBKQWmNz
	TWViJgjUMKl9iUnNhVobagGbbtGm3Yaxz/d9/SwAr8vECb4KLOMkga5yr48IZnWMPD0KYH8PO/lY+
	nJM0tUTX2ypukr6BrZAVpJLZ8mqd0W0KsajE96OAwd2CPR9v7dV4RIfGc6RZbyuPLxkd6gUWnL3PI
	5iuMalx/gE1rMIfj4Fzs8hn7+BIUk9hPDLIuZ2gMpkdWOSiDtAl46Wz6UcQd7b/mQj/DVgyE64azD
	l7NEvWXrGc/TQmcus9Xg7H9AfGop9XLMtfkRpw0QEh+r3R2klRSzKwqHw8edh3nqCva6I6S+8P2Dq
	dWjivrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRON-00000006b0q-0RB5;
	Mon, 13 Jan 2025 20:50:35 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXRM1-00000006ac3-0R3c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 20:48:10 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d9f0ab2313so1992a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 12:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736801286; x=1737406086; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfn+cvLcuo2+8PMQ2pEe08Zdvwxhoz9ADZwuC0pV8LY=;
        b=F08R8+YFYXGzVq3MCqam7qP9QfeGSWvk0curqa3at8U/TmRhkCkicFPLcWCfp+ib32
         7js2dUGv/PscmhebK3EMsefufoWgJhl/eNnRiNgjIu44Aq44pbPnbNXstJjOaWN7oS8E
         tE8BQ4lPc5h8D3mwaxm2fKI4dXZhaVZoQyPFO7CejV9bhEik8eysBp0GDD/HqdEAI9f7
         LhhwYccq7c4jxCDiAA7XArA4ZfP4UpdO3h1CpXtgqCMWK4xb32s9Rjv6Eu87t5xZLYYE
         VKoFC2+Y8TdDdZs7DShm9a70AynNL/hn+3BLDmp38cPcl4OYtq/Mp1JR1mtjqs1ZYZoo
         OUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801286; x=1737406086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfn+cvLcuo2+8PMQ2pEe08Zdvwxhoz9ADZwuC0pV8LY=;
        b=Eub6MIWUdjDYxOUo/D6Ff50vBxY3KsKkeStAI4kvDyxz7d6hj87sQ3mQUzG7sQItZP
         M1qujo2XyvQgvg0KMqDYLcZF4kINg0lNYXsHmSPSzuMW3sJch9+BkBIGZiwHleu8pZJp
         vVjpoHtG3cwIZgqknmLMFHvp9JQQgMEJ0f4LRFFU1BM2EhuV3D3uutcmsTVS6FtHmR8+
         3EAXxnUg3r6NlC//2YXsFZx9jczhi7K67cEcw2/9HtDZF3BMSoGp9dhA4XrzqDcggiJ/
         pHfxlepB45CEt/PxX5wppVuFxBYS1NZK88qmrwrz74SmdYsY9LmqYMVRZlABv6zOK2a1
         vA1w==
X-Forwarded-Encrypted: i=1; AJvYcCX0tL6JeDq6SPOlr0qnhJ3b4prUrImGyMchR+2VZgP/CUy7i8l8JwqXun7x3ae0Mus67sMw1Y4D437v1NuusR3q@lists.infradead.org
X-Gm-Message-State: AOJu0YxAldFinMd1LjuqYUW9mRgWHf+cnBpNRtj+FlfBixNA8zycTcng
	2ce9mpI/0ZjUZlGnJJpc5UFheNwZX8jUrl1oUViRWuvN/qxhWDMPSjoK+Y3k1CYka+fzAyxLlfT
	bgaIg10kRwgt2kz7agFWoW65UWeUsgy+99IhK
X-Gm-Gg: ASbGncsAyaMnUCSciD01JsTEzaE1jlWSuIO0+qmIX9OmilsEOJpG5NBcP0O4I8+dzr7
	ggxUeJA1O/mZjMaHcgkdrGvwjkjmaDwNg6tf18yY=
X-Google-Smtp-Source: AGHT+IGDjMK+xCaZiz4na3kjUNgqUb+ERX7RVjtWKGSTA7bjfWQk5Kqr4iYGaho77kNGjfWYma759hCeMwaFShvNC1E=
X-Received: by 2002:a05:6402:1213:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d9f5e6332fmr20182a12.0.1736801286447; Mon, 13 Jan 2025
 12:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20250110110023.2963795-1-aneesh.kumar@kernel.org>
 <20250110110023.2963795-6-aneesh.kumar@kernel.org> <Z4Fk58k8YptDkVgm@arm.com>
 <yq5amsfxtrlw.fsf@kernel.org> <Z4Vk5gTnd8o7VKWL@arm.com>
In-Reply-To: <Z4Vk5gTnd8o7VKWL@arm.com>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 13 Jan 2025 12:47:54 -0800
X-Gm-Features: AbW1kvYWxIU1dFGSmkykoAkcDmgqCqq-9XdXuQzSMRHTH9jIGVye6w4pEqFRlP4
Message-ID: <CAMn1gO4huP4D_1mFdC8FsmvHkaQn+hC02ULcfBuS30VDM9=9gA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] KVM: arm64: MTE: Use stage-2 NoTagAccess memory
 attribute if supported
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <Suzuki.Poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_124809_143640_39016BFF 
X-CRM114-Status: GOOD (  31.11  )
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

On Mon, Jan 13, 2025 at 11:09=E2=80=AFAM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> On Sat, Jan 11, 2025 at 06:49:55PM +0530, Aneesh Kumar K.V wrote:
> > Catalin Marinas <catalin.marinas@arm.com> writes:
> > > On Fri, Jan 10, 2025 at 04:30:21PM +0530, Aneesh Kumar K.V (Arm) wrot=
e:
> > >> Currently, the kernel won't start a guest if the MTE feature is enab=
led
> >
> > ...
> >
> > >> @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm =
*kvm,
> > >>            if (!vma)
> > >>                    break;
> > >>
> > >> -          if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
> > >> +          if (kvm_has_mte(kvm) &&
> > >> +              !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) =
{
> > >>                    ret =3D -EINVAL;
> > >>                    break;
> > >>            }
> > >
> > > I don't think we should change this, or at least not how it's done ab=
ove
> > > (Suzuki raised a related issue internally relaxing this for VM_PFNMAP=
).
> > >
> > > For standard memory slots, we want to reject them upfront rather than
> > > deferring to the fault handler. An example here is file mmap() passed=
 as
> > > standard RAM to the VM. It's an unnecessary change in behaviour IMHO.
> > > I'd only relax this for VM_PFNMAP mappings further down in this
> > > function (and move the VM_PFNMAP check above; see Suzuki's internal
> > > patch, unless he posted it publicly already).
> >
> > But we want to handle memslots backed by pagecache pages for virtio-shm
> > here (virtiofs dax use case).
>
> Ah, I forgot about this use case. So with virtiofs DAX, does a host page
> cache page (host VMM mmap()) get mapped directly into the guest as a
> separate memory slot? In this case, the host vma would not have
> VM_MTE_ALLOWED set.
>
> > With MTE_PERM, we can essentially skip the
> > kvm_vma_mte_allowed(vma) check because we handle all types in the fault
> > handler.
>
> This was pretty much the early behaviour when we added KVM support for
> MTE, allow !VM_MTE_ALLOWED and trap them later. However, we disallowed
> VM_SHARED because of some non-trivial race. Commit d89585fbb308 ("KVM:
> arm64: unify the tests for VMAs in memslots when MTE is enabled")
> changed this behaviour and the VM_MTE_ALLOWED check happens upfront. A
> subsequent commit removed the VM_SHARED check.
>
> It's a minor ABI change but I'm trying to figure out why we needed this
> upfront check rather than simply dropping the VM_SHARED check. Adding
> Peter in case he remembers. I can't see any race if we simply skipped
> this check altogether, irrespective of FEAT_MTE_PERM.

I don't see a problem with removing the upfront check. The reason I
kept the check was IIRC just that there was already a check there and
its logic needed to be adjusted for my VM_SHARED changes.

Peter

