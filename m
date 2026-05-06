Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E31FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkcGmXg709UchoeBb+ayEFY84FKzk00zigTRHZ9oDz0=; b=3XrsSiXG8kLS2fiICb++AfypN4
	qMKn28GgfgU2y8aUnfEwLrvurjKG3yiZaKvMwuDjOP7qu8OcgGebldK+310yCw/llNAga+3Iv279p
	a/Y9lUYZcTiyxKe4Sa9/XAYo4fxZjj8HmuaQbg707KqLc5gg8e0+7t8aU1QF5lgkxOvuye3P2eyxH
	uxWrd87bIVcI/fOdn6eSN1UvtmO29sFR7IJ801PT/Roddk06xBvrMYdhquLrlkHh1SGd532t105vu
	BXZ1f/f9X+X0VDPx1CqRrY7si+p5Tq0+7hJSU0sHt6hx62LD+X7q0Nm+2j4WEtvuD0i1Bjq7Pn+y5
	b6DMGGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcjJ-00000000yMZ-3Hz6;
	Wed, 06 May 2026 13:56:01 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcjI-00000000yM1-1fUc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:56:00 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b2e91add2aso63158775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778075758; x=1778680558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkcGmXg709UchoeBb+ayEFY84FKzk00zigTRHZ9oDz0=;
        b=reJdCUcp1xN4850A7mH5RL2taW/odIDJCoPFFxNulZ635JxQ7HO888oaE8OTvHpADU
         Md+et0BCY0ILCK38Olvq/mS+KqVT3HSp2MlP1XFhTOSFc092PeT/cy3MRNKbgb3akb31
         E4cTv/MbmL/4z0ZDrcnNL7mH2Eil4nPgrUPwZUwx+gKCibUe2KcOZFFMxscUx+etDzqH
         Fb35lv8/Pw4XMZGpOjSXkBnbeeZzVWVacxf3JNrzpCNr/8PVhJA4UtzSjcPzn+T6LitZ
         KDZn37S6RJOP25rYtMQecVhDbR/p2TeqIxbSRCoLQFUsb6YvC0mE2v0LQ/LWTBQ+OCxB
         YnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075758; x=1778680558;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gkcGmXg709UchoeBb+ayEFY84FKzk00zigTRHZ9oDz0=;
        b=AHejSbv1qTq8Sj1NeKIQcmchR5Xj2crmDySZ3l16z1wzyMr0TrBmNSZ//8REhhREWC
         Fxg0z/49DcCjCjSZT5Bjy1TegbWkWYJUNitNVdmAAsDcIHhwmmCKskZC+/J3hHcNa2ul
         rI3KRN+PqgyZtmbTr4nyszlA4MZE+lpyDhAvPGMEW5VLPmGSReGRxfFawJ8BvzdlMPek
         6FonMupJF0Z78SwGNQuYu8/ro40Xbbge94LxFrf115kxrF4xlg07fQUy0wW/Is9cuPqZ
         J+TSF4bFwj7OGJHu0GZu3J8Df0ll2UpN9PfkXXKiQYOL5wpflHISq7NwiCYtNIDiDRyb
         2Sgw==
X-Forwarded-Encrypted: i=1; AFNElJ8bOStnJ3yNv2tDRUnhdFgqycYczAbJBj2UPPGwkRDWiRNy7CIzUBxJdN0lnGPfgsIbtYr6HRPMLr131+7qfNIE@lists.infradead.org
X-Gm-Message-State: AOJu0YyDycLHq47Xp4L/1A4U55b5PYRxufsRx6/NGjVV2AMCbNbd4FYH
	JnBpkVAd9IGr7VT/dmE5CzQL8KNoZNCFGMzwxItLrAcfK3UwXAXwSAQfRyzQ/vvqAPMnO6ZVdZZ
	fhePwjQ==
X-Received: from pllt5.prod.google.com ([2002:a17:902:dcc5:b0:2b2:48d8:c695])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d07:b0:2b2:ebed:7af8
 with SMTP id d9443c01a7336-2ba78b3ffdamr36929145ad.1.1778075758298; Wed, 06
 May 2026 06:55:58 -0700 (PDT)
Date: Wed, 6 May 2026 06:55:57 -0700
In-Reply-To: <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
Mime-Version: 1.0
References: <20260504224213.1049426-1-jthoughton@google.com>
 <20260504224213.1049426-2-jthoughton@google.com> <25838e74-01dd-d085-395b-676266dc9a9a@loongson.cn>
Message-ID: <aftIbW9G4RfoTuXh@google.com>
Subject: Re: [PATCH 1/5] KVM: arm64: Grab KVM MMU write lock in kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: Bibo Mao <maobibo@loongson.cn>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Ricardo Koller <ricarkol@google.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, James Hogan <jhogan@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_065600_444743_B9F11823 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, May 06, 2026, Bibo Mao wrote:
> On 2026/5/5 =E4=B8=8A=E5=8D=886:42, James Houghton wrote:
> > kvm_arch_flush_shadow_all() may sometimes be called on the same `kvm`
> > concurrently in the event that the KVM's `mm` is __mmput() at the
> > same time that last reference to the KVM is being dropped.
> >=20
> > T1              T2
> > KVM_CREATE_VM
> >                  Get VM file from T1
> > close VM
> > exit_mm()       close VM
> >=20
> > T1: exit_mm() -> kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >      with only the KVM srcu read lock held.
> >=20
> > T2: kvm_vm_release() ---> mmu_notifier_unregister() ->
> >      kvm_mmu_notifier_release() -> kvm_flush_shadow_all(),
> >      again, with only the KVM srcu read lock held.
> By looking through the code, kvm_arch_destroy_vm() will free PGD page onl=
y,
> page table walking is executing in deleting memslot or exit_mm().
>=20
> With normal code, life cycle of VM is something like this:

Not necessarily.  Abruptly closing the VM, as described below, is also "nor=
mal"
(though likely uncommon).

>   KVM_CREATE_VM
>     Create_VCPUs
>     Create memslots
>     Destroy_VCPUs

This is incorrect.  KVM doesn't provide any way for userspace to destroy vC=
PUs.
Userspace can fully release every vCPU fd, but the vCPU object within KVM s=
tays
alive (and indirectly reachable) until the VM is destroyed.

>     Destroy memslots
>   close VM
>   exit_mm()

Note, exit_mm() may or may not be called.  E.g. there are VMMs that will de=
stroy
a VM and start a new one (perhaps even the same conceptual virtual machine)=
 in
the same process / mm_struct / address space.

> And there is kvm_get_kvm()/kvm_put_kvm() function call with creating/dest=
roy
> vCPUs, however no such operations with memslot operation. Is it possible
> that VM is destroyed without removing memslots, such as the following
> operation.
>   KVM_CREATE_VM
>     Create memslots
>   close VM
>   exit_mm()

Yep.  KVM cannot make any assumptions when it comes to userspace-initiated
operations.  Even a VMM that super strictly follows the first approach may =
exit
abruptly, without destroying memslots, e.g. if it's OOM-killed.

