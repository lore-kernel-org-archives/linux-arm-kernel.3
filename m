Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A886C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKFbsKGv3ILH4cYw/IV0cPzmTVV6FlS/4IE/gRTMmSs=; b=hIoL2DoPqXpZnBUZGMRbnKMB0P
	a5IMM/MrP6wt+wbIoNnPzWESTcEYYYvbTXcrhuT4288Wk7usrUVxJVBpIzEzPOot3UrFvOrsKfGKW
	C3d4QNI3ntN9vcmWCeY9zqtkAHWt/8dCb4dmGR660qXLZIqXD8pdBRMexOkKXR8SMfEkYC16Rurlc
	SSrudUEvIDImr3JPvQjwCKnxVVrFJg5RwNiUCzqB3XWCQ/9FPfmucGk80IKHMdgTpEWQR59Xu8cjU
	PMRnEI7+DgLMrsrGwiMRUyacnuFaiVs5bjczNkFlh4+ALthRhlSad4UPU2lQ0bD2pdLnv+51WdBNd
	3uKCWVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKj1-00000004bwN-3DF0;
	Wed, 26 Feb 2025 16:57:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnKaE-00000004a6u-41tA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 16:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F40F5C630C;
	Wed, 26 Feb 2025 16:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B430C4CEE4;
	Wed, 26 Feb 2025 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740588509;
	bh=V0eP11ys4UBKYIyVMcIalsuc1S5/rdawoXtavRMVxbM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iCdE1u/srDnmbqcyqDr0YGZIETy/BcVLfqnaDFDiU4YHsBTfAlTZAZMCgKqhrZU5G
	 27NcKpuZp5El+JeuWaltK7Nra2rWzKQyV6KGA+tkhLs+EMA/gqZ27EoiK9xozIfo/z
	 ZRb9iqvGFPHcC8BziEzCHO7vN1r0zQsBlXHkWCleYRNcI4NquYihoX25X4mqPFund4
	 0RZrbqSI0MYF8XEGzXzOZkq6osEujIoaZpr79C9U4Q/wJv/sVleC/I+UzoFhJiaRce
	 DSc+qOEPzTweP1iV6OsIOINf0AL3Qr/5atJYGQbrP9v5j8T/ZIBWnaqCDFlyF26Ra3
	 ZH0fCN0sDb7+Q==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot creation
In-Reply-To: <Z786ODqxlYNpj40l@arm.com>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
 <Z7xSfVME4z2ComUm@arm.com> <86ldtvr0nl.wl-maz@kernel.org>
 <Z7yElHKrJGn8XuPS@arm.com> <86jz9fqtbk.wl-maz@kernel.org>
 <yq5aseo3gund.fsf@kernel.org> <86ikozqmsl.wl-maz@kernel.org>
 <yq5a8qptauyl.fsf@kernel.org> <Z786ODqxlYNpj40l@arm.com>
Date: Wed, 26 Feb 2025 22:18:21 +0530
Message-ID: <yq5a1pvkbqju.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_084831_110627_FD70917A 
X-CRM114-Status: GOOD (  27.99  )
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Wed, Feb 26, 2025 at 03:28:26PM +0530, Aneesh Kumar K.V wrote:
>> Marc Zyngier <maz@kernel.org> writes:
>> > On Mon, 24 Feb 2025 16:44:06 +0000,
>> > Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
>> >> >> On Mon, Feb 24, 2025 at 12:24:14PM +0000, Marc Zyngier wrote:
>> >> >> > > On Mon, Feb 24, 2025 at 03:09:38PM +0530, Aneesh Kumar K.V (Ar=
m) wrote:
>> >> >> > > > This change is needed because, without it, users are not abl=
e to use MTE
>> >> >> > > > with VFIO passthrough (currently the mapping is either Devic=
e or
>> >> >> > > > NonCacheable for which tag access check is not applied.), as=
 shown
>> >> >> > > > below (kvmtool VMM).
> [...]
>> >> >> > My other concern is that this gives pretty poor consistency to t=
he
>> >> >> > guest, which cannot know what can be tagged and what cannot, and
>> >> >> > breaks a guarantee that the guest should be able to rely on.
> [...]
>> >> What if we trigger a memory fault exit with the TAGACCESS flag, allow=
ing
>> >> the VMM to use the GPA to retrieve additional details and print extra
>> >> information to aid in analysis? BTW, we will do this on the first fau=
lt
>> >> in cacheable, non-tagged memory even if there is no tagaccess in that
>> >> region. This can be further improved using the NoTagAccess series I
>> >> posted earlier, which ensures the memory fault exit occurs only on
>> >> actual tag access
>> >>=20
>> >> Something like below?
>> >
>> > Something like that, only with:
>> >
>> > - a capability informing userspace of this behaviour
>> >
>> > - a per-VM (or per-VMA) flag as a buy-in for that behaviour
>>=20
>> If we=E2=80=99re looking for a capability based control, could we tie th=
at up to
>> FEAT_MTE_PERM? That=E2=80=99s what I did here:
>>=20
>> https://lore.kernel.org/all/20250110110023.2963795-1-aneesh.kumar@kernel=
.org
>>=20
>> That patch set also addresses the issue mentioned here. Let me know if
>> you think this is a better approach
>
> From the patch linked above:
>
> | @@ -2152,7 +2162,8 @@ int kvm_arch_prepare_memory_region(struct kvm *kv=
m,
> |  		if (!vma)
> |  			break;
> |=20
> | -		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
> | +		if (kvm_has_mte(kvm) &&
> | +		    !kvm_has_mte_perm(kvm) && !kvm_vma_mte_allowed(vma)) {
> |  			ret =3D -EINVAL;
> |  			break;
> |  		}
>
> we also have the same ABI change every time FEAT_MTE_PERM is present.
> TBH, I'd rather have it from the start as per the patch in this thread,
> irrespective of FEAT_MTE_PERM. I'm fine, however, with better exit to
> VMM information though.
>

The patch also does:

#define kvm_has_mte_perm(kvm)					\
	(system_supports_notagaccess() &&				\
	 test_bit(KVM_ARCH_FLAG_MTE_PERM_ENABLED, &(kvm)->arch.flags))


That is it depends on userspace to drive the behavior and also relies on the
FEAT_MTE_PERM hardware feature. I was considering whether, if we're
introducing this capability, should we also include FEAT_MTE_PERM? since
adding FEAT_MTE_PERM would also require a capability to handle VM
migration

>
> If we don't want to confuse the VMMs, we could skip the
> kvm_vma_mte_allowed() check only for VM_ALLOW_ANY_UNCACHED and
> VM_PFNMAP vmas, maybe the latter only with FEAT_MTE_PERM. I don't think
> the VMM would get it wrong here since a VFIO mmap() would not support
> MTE anyway.

ok.

-aneesh

