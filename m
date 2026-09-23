Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DEEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpBDbIP8yvq+Fmf2FciZjevO7LeQexU7dyJwxxAp6co=; b=c5pW6e/yhbspBweIh3SfRy2vsp
	F/UwHIS8gnG3s88EehHl8vE2KxEse5zz3l1+EOZfyWaQVOSvjVDOB7MX8xlEHqN1+zwUbqeCoP9d9
	5MgO1i/62bIT6p0DKaWAWidcZ7YsgLuMVOa/tx8lhnbEA5hilKFTY2fe49fWY26W7RyZSfE9rtzxM
	D1VmeTD1BBMZu9/l6LumPJJBeIvDsHnkSv04WOLa/P8EYUxLPjs/OKxkyeOfUwSgl/WH2xzGEB+lK
	/QapOsPVK5iIESp9sL2OVj5rzbbM3wAn7MnvwqmAvYcnYjlWcERwMAAKXYNy5GsbmT5mwi/5W4TKo
	9+LMtsaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mzf-00000008O2B-2F0x;
	Wed, 23 Sep 2026 13:26:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Mze-00000008O1y-07ag
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:26:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37EC6600AA;
	Wed, 23 Sep 2026 13:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7690C1F000FF;
	Wed, 23 Sep 2026 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790169996;
	bh=DpBDbIP8yvq+Fmf2FciZjevO7LeQexU7dyJwxxAp6co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HcljQSRZTXKzCzv23eDmZBXttSKnJHWt75BS8zBW7Dn+gQ/EsaHyv/vAdAU1yxgF9
	 v7o+8DfaKQtuEMMP9qnWhtLIIYxEQNCdV2LAqJVTwpcRmwz/QHcq01BSoYaN7JVGrY
	 2t4NCRUHgdviRapBHeY1O+/BvNkTCH4B1mJA1wxn9UbZE1gVIq58CiLcL9g0zoQqdz
	 4zKMdnUQVLjYRbg77a+bFzT6NjfP58YiyVBXuNJsnaYo2mgIHmYcUakuRA7o5XRPMQ
	 3erdKXC5v48l2BEy0MRZu0Oj8s8W29nkdgG18lVsJmypxt+8Wh5uHb+Yp0u3aOK4X/
	 oBVZEWQxsAq5w==
Date: Wed, 23 Sep 2026 14:26:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 01/14] KVM: Allow architectures to disallow pre-fault
Message-ID: <arPTeFAcxA5MJqxg@gremlin>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
 <20260922-kvm-arm-prefault-v3-1-787bd3bc7e3f@kernel.org>
 <arKxjsxuO1F5ExrY@kernel.org>
 <arK5n9HrbZMCOHOt@google.com>
 <arK5ynpRi7VbY7Ek@gremlin>
 <arK8seJVT9wYgVCP@google.com>
 <arLD-eZ6dRvfZ52q@kernel.org>
 <CA+EHjTxFVWHUBCD+SZvSG7T6=i6ZMWWRkNqQ3rMmSt6LwrcjtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxFVWHUBCD+SZvSG7T6=i6ZMWWRkNqQ3rMmSt6LwrcjtQ@mail.gmail.com>
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

On Wed, Sep 23, 2026 at 11:54:15AM +0100, Fuad Tabba wrote:
> Hi Lorenzo,
>
> On Tue, 22 Sep 2026 19:07:53 +0100, Oliver Upton <oupton@kernel.org> wrote:
> [...]
> > I'd favor doing something like below and sticking the comment inline in
> > the ioctl handler. Unless I'm missing something blatantly obvious, I
> > don't see why the x86 or s390 pre-conditions can't be tested early too.
> [...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> [...]
> > +int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
> > +{
> > +        if (!kvm_vcpu_initialized(vcpu))
> > +                return -ENOEXEC;
> > +
> > +        return 0;
> > +}
>
> The same goes for arm64's pKVM check: kvm_arch_vcpu_pre_fault_memory()
> returns -EOPNOTSUPP for is_protected_kvm_enabled() only after
> vcpu_load(), so on a pKVM host the ioctl loads a vCPU the hypervisor
> may not have created yet before rejecting it. Could that check move
> into kvm_arch_pre_fault_allowed() as well?

Ack yeah that sounds good, will do for v4!

>
> Cheers,
> /fuad

--
Cheers, Lorenzo

