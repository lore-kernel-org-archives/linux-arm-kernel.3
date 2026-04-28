Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D97FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50+DMcLjfIUr3bIlABCmvGKfOqD2QOWGbiSARGxi53s=; b=Ebc41TuXYwrYcTI62h7QHC58cr
	3kpcsTnciksaW2rgMcuMsqdlQvn5HQHugbhQ6cSSCbRP86tS1T+9hcDps5GGxd8xDLkDfXuMe5Uhw
	aEf6yWYAdQnoWpn3qhR6Bj0IBOf1a2lk9qkYxzhzEzIQFWyz2YPWaXZSUDmtug9cFQe3WgWtyYy/B
	/YHA5kIAuSOhcv8dYrs8xM0tqIEh58pfX3DvA8oNzrYXSE9a+maMGnin32CpJ1X51QVV/K89MtwQw
	CzYcQj9GEi4pVlCdHHJ8I2zOj4nQoJydvpWQflfostx1Qsmy5DXrDrHUTYlseuhk7/OhSNja5KW7d
	UNs5AXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlkx-00000001zNu-0WcS;
	Tue, 28 Apr 2026 16:57:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlku-00000001zNW-2abE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF24243C25;
	Tue, 28 Apr 2026 16:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4ECC2BCAF;
	Tue, 28 Apr 2026 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777395471;
	bh=hZ0/IZxdG0H8WXycgd5737y0AjNHtzAueGMbQWJW+O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2EVUPYpppo5GxMsQv13o/gSgMZj7fOKUguIJ68E0aS7QIhkZCtBuQdeQlEGaGEJ4
	 2+hCxuRocGWSIr+VV4huz0XZaPITihk5mylBsEVHczQoHpii947l022VCJAD+9BkJ0
	 PdWlmeYnQwdvpAfiecEi3OtwvsHl35VMPZ0J1E8jCClb+9gvYmB72ItI4KiK6PQbr3
	 BXPl1x31U3a8NBX0EgUE10zasgy0i1L8n3i8lm8CFu+mwr4NJ6tVDmTYYMiXHDMt6C
	 wDO74dGyJ4q5fF36X751WSa4boJ1CkIMTVrMfoThG8Trl/Y+d1EoEi/KQaQLTwD7Dj
	 braGODl3UgWLQ==
Date: Tue, 28 Apr 2026 17:57:46 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, qperret@google.com,
	vdonnefort@google.com, catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 6/8] KVM: arm64: Propagate stage-2 map failure on
 host->guest donation
Message-ID: <afDnCiQNJrP7UI2m@willie-the-truck>
References: <20260428103008.696141-1-tabba@google.com>
 <20260428103008.696141-7-tabba@google.com>
 <afC5_jrTEVRfJ77x@willie-the-truck>
 <CA+EHjTyTy2qLm=CbOOYR6rmjg5tH38PifAV+qAhbZxidY5szxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+EHjTyTy2qLm=CbOOYR6rmjg5tH38PifAV+qAhbZxidY5szxQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_095752_682402_49A38AC6 
X-CRM114-Status: GOOD (  13.17  )
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

On Tue, Apr 28, 2026 at 03:36:43PM +0100, Fuad Tabba wrote:
> On Tue, 28 Apr 2026 at 14:45, Will Deacon <will@kernel.org> wrote:
> V2 will drop two patches (in addition to the HCR_EL2 one), and will be
> as follows:
> 
> 1. host->guest share and host->guest donate (kept, rewritten): add a
>    memcache-sufficiency check during the existing pre-check pass
>    (option 1) and return -ENOMEM cleanly without touching any state.
>    Restore the WARN_ON() on the subsequent kvm_pgtable_stage2_map() —
>    with the topup precheck it asserts an established invariant rather
>    than ignoring a reachable error.
> 
>    For the single-page donate, "topped up" is
>    KVM_PGTABLE_LAST_LEVEL - vm->pgt.start_level (mirroring host EL1's
>    kvm_mmu_cache_min_pages). For multi-page share I plan to use the
>    conservative nr_pages * (LAST_LEVEL - start_level) bound and flag it
>    as conservative in the commit message; happy to compute a tighter
>    alignment-aware bound if you'd prefer.

For now, I think we should just check against kvm_mmu_cache_min_pages()
because that's what the host is using.

Cheers,

Will

