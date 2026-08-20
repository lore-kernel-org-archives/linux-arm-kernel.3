Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34417C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FsF+dC/ofr8sxGFtHAB/t3yjlu1tenoFlMvm24uheM=; b=lzbDrdcDIXSvDwklvzVEah+/2b
	CKnBKhPsNB0w+UMb+I4hAYxNb6cHpaUvKRgIVuF/V9UiLg7Ute3b6CRgX0ezAx7YK75CjCzp5Cr9H
	WjyNWOcsC60m7G+T5SwQPbhtw3DuDAweB5OWuGBSXkncWF4LS/R+wLNb39Am3QgNO1nIO2xYGZqd+
	AEv0rqPik5m09SYR2IZpPqLiC7r8LR2RZK0GLxG1ecsWeXYbqAAKHlX/TpiCJa0CkneaGMEfcyBk1
	Bzzjhy2CgYbHe/n/pJwTd5qvjlGr5IUOwoFkEpzrmaVXs5Nwv70lb7dgWi9wU6LA8NYOUXcBeAmdJ
	Q6jYioCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCJ1-0000000CMBP-1nrH;
	Thu, 20 Aug 2026 23:36:19 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCIx-0000000CMB4-3UOm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:36:17 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso253995a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268975; x=1787873775; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FsF+dC/ofr8sxGFtHAB/t3yjlu1tenoFlMvm24uheM=;
        b=aT23IvGMMT7bsg4RIe9UAkcdTnJzO+CY6s+c8+SC3LyDCqz1AdvuziRBAmGs+FpbhK
         bGXLtAKPdp0Kb2M0xBUC4MUwpn9/71mmvGhKLS6aSybhEIIwo5Kaac3xvDw3nYp0osDv
         DKEwYLGe88DDHgnl2TgsbEjUaYPzPDCjy0GhWe1hTcXZcRjfk0PPBEOm+HiMqt3IrG72
         qGBYqA8pSCrnodZQfRzsifjw9FqdZJR3sDUUX7FRFiTBlL/c41AIypxCNuJBrKD1Q01C
         j36rNRCC82yl1BNptR+0Rs3I2SgcssKyerItN5LL1JKlo3jcZVLfnEUeOFdnpTLTrWS5
         RnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268975; x=1787873775;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FsF+dC/ofr8sxGFtHAB/t3yjlu1tenoFlMvm24uheM=;
        b=muDm4hq27ySkQwGaj2ad2MA806FCTEqDFnm/BMl0ngjK9mqgqZc6/iGTvMBrZlof6w
         PO6p+LQvhEoEHPkgy4U/+MvBebFokccmd5LMBSuUyL9K3wIDEMeI3V9cr2DAZ1/KQQd1
         wK8ErGwblRsmHt7tm0Fltox1RH4g0s1ZbQavt/33ktl9llhb4rJgFEhm90P5PdYR0pQq
         ou07fJncgn/t9zYEg86VluF2hxidl1zMR5KMi9ouo1t2Olw4mhx/KAEYTfzk8aow9wwO
         w81PN3PFfGypzC90WHb1dMqrX66GQTd8o4iu02eeJY6HgzN1AzclxydxYTvAm1b3LzGH
         zUAw==
X-Forwarded-Encrypted: i=1; AHgh+RpIeRrkJIe2Ut/exMMpzZpThmwCLFTr3xPlIGNeOBaqnHYNGQrSSx6K0QdbBMYhaIJ7e/aEYafrW8gNYMMbpfU2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8djCNHT/uzWEjIitBpfeXa+HfhYKEhW7OKTgYHWQ+oRjEWhoE
	Y/0cEIU/1z4OAbTkUR22qdqSkmMmh1aAcdgs4eXI4PUHLWQCwEqcIyIus0Dg3u4f7aC3BnrQFL+
	35KUwCA==
X-Received: from pgmj16.prod.google.com ([2002:a63:5950:0:b0:c97:228f:37ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6001:b0:3cc:fb7d:a9ab
 with SMTP id adf61e73a8af0-3cd2fd8e99emr4211436637.2.1787268974429; Thu, 20
 Aug 2026 16:36:14 -0700 (PDT)
Date: Thu, 20 Aug 2026 16:36:13 -0700
In-Reply-To: <7kapvdum7qk7l4epbeqvrybqxapuhvwltz7axfprxldw2utozh@t4url3mqbpom>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-2-5298f42d49bb@google.com>
 <j6bfvbzjivlcsu3slbnaoomxxqyypmfl2bupo3k5ipnt6fc5lo@e5ntbx7yd4qw>
 <CAEvNRgEruoa4d_8Y1MpkdzbHg3j1Yv=-Y6w6Yy=v6mJgPajjWw@mail.gmail.com>
 <zb5krzhrg3soslplynegqo52brd53wk3meas45udqpjms6oluk@zecqwzn7zziy>
 <CAEvNRgEHEE67+vjQqJjYD3M4yuwuR+4-36Hw4-sp5caYzmxbkQ@mail.gmail.com> <7kapvdum7qk7l4epbeqvrybqxapuhvwltz7axfprxldw2utozh@t4url3mqbpom>
Message-ID: <aoePba0sbVFzUl_9@google.com>
Subject: Re: [PATCH v2 2/4] KVM: SEV: Drop page refcount early during RMP
 fault handling
From: Sean Christopherson <seanjc@google.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_163615_877331_578C22D9 
X-CRM114-Status: GOOD (  25.23  )
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

On Thu, Aug 20, 2026, Michael Roth wrote:
> On Thu, Aug 20, 2026 at 03:35:31PM -0700, Ackerley Tng wrote:
> > Michael Roth <michael.roth@amd.com> writes:
> > Ah I see what you mean. I think we mean the same thing, let me add to
> > the commit message that I meant after dropping the refcount early. Does
> > this help?
> > 
> >   The filemap_invalidate_lock() is already dropped in kvm_gmem_get_pfn()
> >   before returning to sev_handle_rmp_fault(). After dropping the
> >   refcount earlier with kvm_release_page_unused(), these scenarios are
> >   possible:
> > 
> >   1. Since the filemap_invalidate_lock() is dropped, the page can be
> >      truncated (or in future, converted), and the RMP entry is now
> >      shared.
> > 
> >      In this case, existing RMP table handling (psmash and checking for
> >      errors) would be sufficient. On finding a shared entry, psmashing
> >      would fail gracefully and no warning would be emitted.
> > 
> >   2. The page is truncated and freed, and then re-allocated to another
> >      SNP VM. The RMP entry is now assigned, but to another SNP VM.
> > 
> >      To address this, adopt the MMU invalidation protocol to guard
> >      psmashing.
> 
> This reads kinda weird to me, as if with #2 we're documenting a "bug" that
> this patch fixes, but the bug would only exist if we partially applied the
> bits of this patch the drops the ref counts earlier and left out the
> bits of the patch that introduce the mmu notifier logic that replaces it.
> 
> I think with patch 1 applied (which covers the
> psmash-a-now-shared-entry case while retaining the original refcount
> logic), the only thing this patch is doing is replacing the elevated
> refcount logic with the MMU invalidation logic as prep for dropping
> reliance of refcounts entirely.

(I had already typed this up before I saw Ackerley's response, so dagnabbit I'm
hitting send).

Agreed.  Less is more in this case, unless you want to explain all of the gory
details of how KVM handles MMU invalidations.

  Rework KVM's handling of RMP faults to rely on MMU invalidation logic for
  safety, instead of the current approach of holding onto a folio reference
  until the RMP operations are complete.  I.e. drop the reference gifted by
  guest_memfd immediately after getting the PFN, and instead do RMP updates
  under mmu_lock, after checking for relevant MMU invalidations.

  This will allow dropping guest_memfd's reference gifting entirely, which is
  ideally how KVM would operate for all "follow PFN" operations (GUP has many
  more complications, which is why KVM holds a reference across page faults
  *on top* of the standard MMU invalidation logic).

