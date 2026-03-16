Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE7F53D97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCP75YBSVNyiC0SMnuy0JEeD8LPAxxpS81/985sICXA=; b=UeSm2xA7GKhaAuOdEB68mHL/lz
	qzO7w7d4GjcEObgSoNTgMPjEnP/xp6ivoo9mUDA6alvT3fteshsJzmFK5N9e6xXTCJ+TBZnPtZgm8
	9/PVCfmQ2+wT1IXfLpO5qhXTP0qv0s6VIdWV+/0rJnywr4io1U/zaY/EQi54Jun40NwrOkKCFSePo
	G5FZOVGoBJVLHJMmYxix+BW4Sr7asWZXZt+gRUvLbm9cq9YOJgwrX6z5ti/FhnmmJSs+RFEFYo78C
	YLDI9RT5Fop5rCj7HKOcEVboCKYK5lt/HG+C/IqpfkG26UHRsfzRsAlUiEyuxr3Y4fry74E52D/dK
	JBMGv5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EdE-00000004ohK-3tEy;
	Mon, 16 Mar 2026 20:33:44 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2EdC-00000004ogy-2c2X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 20:33:44 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-509062d829dso43311cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773693221; cv=none;
        d=google.com; s=arc-20240605;
        b=he/G7ioqC0lqCMhPTe9UnqwRcsvLtc2oSTMuCe5gwx5Y67DUN9wil9/qRtcgepd5JL
         3erFrMpcH1lALBWVmBbwgESNo3lc+yTwUV31oSJ+qqR2dKVhkCqBzs89OIMkmdaj7T51
         B0EXT0KIzrFZUK2zz2vBIUfFebFRfzcyJgi5CBJ+uVYN/SUarZml/ChL9FPGkFmV1SXr
         05KkFNAQ8m4PGUem6/8OzKDATEWGM6GgmMxF6M82G2CMOnaVPfn28k2pqGyYLdS8YSgK
         9WMKPeMGHW6CD0ZnOZj2/h2/U+u0TxVfbiDEcdGLqgWx5Dmj9QelYAU6cU/ystUombfS
         cCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XCP75YBSVNyiC0SMnuy0JEeD8LPAxxpS81/985sICXA=;
        fh=s7c1+c9XqXaeycKTTApGvvs5/yMAQDMx9fG3T6tGoME=;
        b=KXNfymx3BzjU2D0D3D6q5EPtiFTAcsl2wHZxHwoEbr4JIzQZ+YFGtTSZfN1Ilk2wNd
         FKmrkPIKo/Mw3HBLCk4p9wZCqx5ili8hbS+g7XR2HUkRq7zA1s4gwJVyFKKI3CJMbi+s
         wWQRePYd5F3+bLOau4v1I0kpCMxIw7zHVawHKeJtlSxK0VPTKdlxTIIRjqkX88spFsu6
         v9YN2R9wx3tET5rW5fBaXv2nxrjZfSwtxYD4yjIuKGay0HES1cmPUvGpDM1gLxlIJk2s
         3nWtfUSGGZGrISzWpCk+D6uZmldD/l0sacuvQKuVMwsyq8v2dcPHQqP4u8N+xk8YuJbK
         H55Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773693221; x=1774298021; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XCP75YBSVNyiC0SMnuy0JEeD8LPAxxpS81/985sICXA=;
        b=YROmAGZUkIVjsa6pup9TPDRB3fXhsM8BjeAjndpjiSnd4/zojV/kGwql9NFPdqt7Av
         l/uB4PgSPkgtj0NMgx0GZ/LppAqna4f4tYdUeAytp5bIk+LvMrmo7hIm/BSmbz8WCIva
         CP5wsh/GM3Do4FRT86jklAZQ5yGKjw/IFw/lKXuAK9uriukDbvSeylOqwofA/he4iBvd
         hfpZg6u/zUckZtL2BMZNaEbCL3r2gaLJ/PJhrVVs+xmTGZseQ4ZMCxbVq6wWSyc+7KSt
         iz6HLGiFJrDQNXrrUzWVBwWr6dPwAbzTe/7p2Rbb46WYINDojUrChP2t3N6IDSRT49XX
         ZFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773693221; x=1774298021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCP75YBSVNyiC0SMnuy0JEeD8LPAxxpS81/985sICXA=;
        b=AEfynlmLeo70f1/qPUupfFs2GRbynWss2IyVWzykGlJ/yBKiYf+4MKFg9yH2qZh/0m
         MQul0HzY9diX+GpYvCcHB6vXduO8U48ZquLJzImeZdefw4da13cWcRqrP0PYMgNRkQdR
         bb2Mo90yYHKZCb1QT65PDLegSGyXoOtmQhSZPDxdskzeRuXmgA7mZJUQ0N/Z3zbSLM3y
         JDKIPIWmA9Z9UeIZKv/CanIoDuYWDbSALOb5pftPTiODgln30PtZF1pk7cIFYgcKGA8v
         hFYWtxqtUxRm2+iKjahBfuRqI9JsULYD/LJxRxqN2fwhno0KmL/wnKL1E8RhgFBe3WP5
         W7OA==
X-Forwarded-Encrypted: i=1; AJvYcCXKby9k0Dr/wTfTa0epGMGLDxB/YoyTyks9/ZHDfsTQrhgpZQQdHVngGYXVsOUgkY95T7lc8JosB/YGbYNVJHOp@lists.infradead.org
X-Gm-Message-State: AOJu0YyaS2F2WuNmBIG4qm1BsKl1ZNIvGFTkEVe/F6R7yYrEqEAFQXfm
	x2diH+VT0MRn3N/SLjk1wkLkXYpaCITV48rsP1qPX+mzKythLfcJgCZAtLHrShA2KK2L1lECro/
	rj4u/9b9wrs//ch+hK2TC8Ro0mz5ZgJLj2d1q4Cue
X-Gm-Gg: ATEYQzztNtxHyZe7tHoqcg4DK7eZPAZnP0qLP+Ot0xxrqWi4oiIdH4iBhUnv9lV79xi
	Cih20BHv5zz48NOF8F2N71jkijLgidWgkRn1CMqBBqAW68qxlPWMT0E4UidyIaUAgCQOCH3sdtR
	GqWaJ3dxbftB4MaGVlm7g6Zvj99l5yZIW56xbU1TpWX4MBnb3WHRmFO04P3YSfl22j3moNHX6Q/
	qaeEnQFyS8f1s/zWpd61mPeE5K7DmvitlQsJJxSAObP4EOnPfIkQTQSAdxUgQhSQBTFwwBTYsIe
	QFWWVatp
X-Received: by 2002:a05:622a:144f:b0:501:4eae:dbfc with SMTP id
 d75a77b69052e-5099ae2a155mr787131cf.5.1773693220799; Mon, 16 Mar 2026
 13:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <CA+EHjTyBtM5idopKisJf_e10aRifubtKEpbkjkEnmrOqa9-SPw@mail.gmail.com>
In-Reply-To: <CA+EHjTyBtM5idopKisJf_e10aRifubtKEpbkjkEnmrOqa9-SPw@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 16 Mar 2026 20:33:03 +0000
X-Gm-Features: AaiRm52rszfavVOV2FIeKmV442WE5Yr4f6pDh3yfG162HvC0brQIKx6ADDRQdIk
Message-ID: <CA+EHjTy=MCgeKoi9sA_eDuiODucOdMP5m4CAciUW=rStgJggmQ@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: arm64: More user_mem_abort() rework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_133342_677560_47393F88 
X-CRM114-Status: GOOD (  22.84  )
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

On Mon, 16 Mar 2026 at 20:26, Fuad Tabba <tabba@google.com> wrote:
>
> Hi Marc,
>
> On Mon, 16 Mar 2026 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
> >
> > Piqued by Fuad's initial set of patches[1] splitting user_mem_abort()
> > into more "edible" functions, I've added my on take on top of it with
> > a few goals in mind:
> >
> > - contextualise the state by splitting kvm_s2_fault into more granular
> >   structures
> >
> > - reduce the amount of state that is visible and/or mutable by any
> >   single function
> >
> > - reduce the number of variable that simply cache state that is
> >   already implicitly available (and often only a helper away)
> >
> > I find the result reasonably attractive, and throwing it at a couple
> > of machines didn't result in anything out of the ordinary.
> >
> > For those interested, I have stashed a branch at [2], and I'd
> > appreciate some feedback on the outcome.
> >
> > [1] https://lore.kernel.org/all/20260306140232.2193802-1-tabba@google.com/
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=hack/user_mem_abort-rework
>
> The series in hack/user_mem_abort-rework is different from this one.
> Here are the first few patches:

And I just realized it's because they're based on _my_ patches ... doh! :D

Sorry for the noise.

Cheers,
/fuad

> 7243471061be KVM: arm64: Extract VMA size resolution in user_mem_abort()
> 3a8557ce6025 KVM: arm64: Introduce struct kvm_s2_fault to user_mem_abort()
> 9f3c0a14bbcb KVM: arm64: Extract PFN resolution in user_mem_abort()
> 98740dc5cf2b KVM: arm64: Isolate mmap_read_lock inside new
> kvm_s2_fault_get_vma_info() helper
> ea364906b626 KVM: arm64: Extract stage-2 permission logic in user_mem_abort()
>
> The first patch here doesn't appear until quite later.
>
> Cheers,
> /fuad
>
> >
> > Marc Zyngier (17):
> >   KVM: arm64: Kill fault->ipa
> >   KVM: arm64: Make fault_ipa immutable
> >   KVM: arm64: Move fault context to const structure
> >   KVM: arm64: Replace fault_is_perm with a helper
> >   KVM: arm64: Constrain fault_granule to kvm_s2_fault_map()
> >   KVM: arm64: Kill write_fault from kvm_s2_fault
> >   KVM: arm64: Kill exec_fault from kvm_s2_fault
> >   KVM: arm64: Kill topup_memcache from kvm_s2_fault
> >   KVM: arm64: Move VMA-related information to kvm_s2_fault_vma_info
> >   KVM: arm64: Kill logging_active from kvm_s2_fault
> >   KVM: arm64: Restrict the scope of the 'writable' attribute
> >   KVM: arm64: Move kvm_s2_fault.{pfn,page} to kvm_s2_vma_info
> >   KVM: arm64: Replace force_pte with a max_map_size attribute
> >   KVM: arm64: Move device mapping management into kvm_s2_fault_pin_pfn()
> >   KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
> >   KVM: arm64: Simplify integration of adjust_nested_*_perms()
> >   KVM: arm64: Convert gmem_abort() to struct kvm_s2_fault_desc
> >
> >  arch/arm64/kvm/mmu.c | 428 ++++++++++++++++++++++---------------------
> >  1 file changed, 223 insertions(+), 205 deletions(-)
> >
> > --
> > 2.47.3
> >

