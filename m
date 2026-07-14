Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7981C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPIRB9Dd4cOslVY5PESm6bOvGNSOObw9pvt/3Q1F9Uw=; b=hZcVe/PqwOYXGnDoqAElBUFsSj
	iGTHPNJpotuBxKbCHDnv5hYsxZvM/m3s4znIP4Uen6iWQ0v2YvVTVxvx9eVVE6DtkrxmZGehQvX8z
	9BTriku9uRp80GAZR2LxGM3K9yi5DGVi585FdxiDmqZf9bU4RQ9B/jRu5gZY3/mmOT9+ztPhb8UTl
	KOhxShG4jZrkfXPmZ0afe43mu5a4Ud7BE0BSYUwdllGsZ60fvmIurj0l0Q1piFT2SrKDeJccs9IqG
	w3UeaA4w2avlHqFRimExRpE5PkrAxrbcdKteiFwYdjLzOWme0sJ+zisX+IZfuu79UGGW/tIDSOJM5
	ebE/spQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdtx-0000000CLbl-01yZ;
	Tue, 14 Jul 2026 14:14:25 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdts-0000000CLaU-0Vw4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:14:23 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoLl6R2TmTuEeArsUoDOwQTL9TMA2pN37gY4+xgZ41F6GivSzHmlVihRMo/ybG7vu+dCkuEjuOb5D4nADDKA9ql@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784038457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPIRB9Dd4cOslVY5PESm6bOvGNSOObw9pvt/3Q1F9Uw=;
	b=egJYqFOfjZj+cdqG4WRezDqxIggnaAoNP4GUMnJVZ1zW0Akph/52GnXGen35SqYUblQBEG
	D19bdZCdrdJGfb7CsNqPe2A1hrzZu3hjYXyhWiEOAvxKuhl9k0W3PkczFuk+TZNVK/KTb+
	ywDd77ZHUyQgBly0cR+JqF/sK4caeHQ=
X-Gm-Message-State: AOJu0YyHNFaiwT6qFykYDmpqbF5n0aSDiwVjPlJCGc+Czrp3Xx5Fctgq
	EOqKVH3sLqhIhzrVFff9bKy9d4iSETOdtb0zTVh5EcRo8Aj7l1PbYXHfeuFGZMJLLHaECulgpiA
	0CaBIvKpVnLQkphULpKHtWlbOAjxG4M8i7UW9U/nY
X-Received: by 2002:a05:622a:11d1:b0:51a:72e5:9b2f with SMTP id
 d75a77b69052e-51d7bd89849mr13077231cf.20.1784038433589; Tue, 14 Jul 2026
 07:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260714110756.116950-1-alexandru.elisei@arm.com>
 <CA+EHjTxFAqO38zZNTM5oQ26X7eUcu3ggfhMY2gn2bB4sMbOxoQ@mail.gmail.com> <alY2e8bfsMDyI2QZ@raptor>
In-Reply-To: <alY2e8bfsMDyI2QZ@raptor>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 14 Jul 2026 15:13:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwhYpC-fzXKr9J7015AwAtoHvnUqm31ockQMLjKM-fOoQ@mail.gmail.com>
X-Gm-Features: AUfX_mzpDe5iSeTUKNhFhM8dxY-CxssfUNHFcChEyJoMZ4XDmFgf8k8egb_tvdk
Message-ID: <CA+EHjTwhYpC-fzXKr9J7015AwAtoHvnUqm31ockQMLjKM-fOoQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Reject guest_memfd memslots when the VM has MTE
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_071420_602884_E704B127 
X-CRM114-Status: GOOD (  25.73  )
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

On Tue, 14 Jul 2026 at 14:15, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
>
> Hi Fuad,
>
> On Tue, Jul 14, 2026 at 12:44:57PM +0100, Fuad Tabba wrote:
> > Hi Alex,
> >
> > On Tue, 14 Jul 2026 at 12:08, Alexandru Elisei <alexandru.elisei@arm.com> wrote:
> > >
> > > The user cannot use MTE on VMAs created by mapping a guest_memfd file,
> > > as arch_calc_vm_flag_bits() does not set VM_MTE_ALLOWED.
> > >
> > > When creating a guest_memfd backed memslot,
> > > kvm_arch_prepare_memory_region() rejects the memslot if MTE is enabled for
> > > the VM and if guest_memfd has been mapped in a VMA that intersects the
> > > memslot.
> > >
> > > However, the documentation for KVM_SET_USER_MEMORY_REGION2 explicitly
> >
> > nit: s/explicitely/explicitly/
>
> I think that's what I wrote :)

I fixed the quoted text (pressing enter right after the word)! :) The
original msg says `explicitely`

It's a nit anyway.

> >
> > > states that the only condition for userspace_addr is for it to be a legal
> > > userspace address, but the mapping is not required to be valid nor
> > > populated at memslot creation.
> > >
> > > If userspace sets userspace_addr to an address that hasn't been mapped, or
> > > if userspace_addr belongs to a VMA that isn't backed by the guest_memfd
> > > file, or if the VMA doesn't intersect the memslot, memslot creation is
> > > successful and KVM ends up with a VM with MTE and guest_memfd-backed
> > > memslots.
> > >
> > > Forbid guest_memfd memslots unconditionally when the VM has MTE to prevent
> > > this from happening.
> > >
> > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> >
> > Is this worth a Fixes: tag?
>
> Fixes: 32e200bd6e44 ("KVM: arm64: Enable support for guest_memfd backed memory")
> ?

Yes, the author of that patch should have known better...

<snip>

> I can iterate through all the memslots and check that none are backed by a
> guest_memfd file when userspace enables the MTE capability.

Sgtm.

Cheers,
/fuad

> Will wait for a day or two to send v2.
>
> Thanks,
> Alex

