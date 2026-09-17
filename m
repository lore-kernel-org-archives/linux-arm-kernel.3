Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDA7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toCee6UgEMHOs7etiM3N5M9e+48b59raMg6RtKIcXRU=; b=eQR2apgL7flm8XxLGIHXPZmn5q
	5FGhg3NzsG2U8YkyfkFWvBLzUehz7rsw0+XNs4hcyQqAoaAtTittnkRUVWyGnkGub31OTZsKPLkJU
	phCV9G5lOqaQLi5PS2c3PCwPA+Wsr8IHPtQHDlHXz2zeMesonevjKWEJ91lVBth1l6ttA4twabd19
	o5MQRjfFpdAKTDuC1Va2vRrTVpJktDDM5+xs3Jp+WPkEd2x1OZyzj7X73CTaq8bT5A2tELMLeok8h
	hsT/hxVC+Kh+AdjALpEBu69XEYhtqQNBdtqPcKM2wNWixixWYRAD8bvQ3d2B51yQ2/RxxRtoB/R6y
	A1cX0tbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hp3-0000000CLJh-3E44;
	Thu, 17 Sep 2026 19:31:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Hp1-0000000CLJF-1t0D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 19:31:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9480D1476;
	Thu, 17 Sep 2026 12:30:57 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DE343F7B4;
	Thu, 17 Sep 2026 12:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789673461; bh=Gb0RN/m9mh8iOtufEqLHMLjTufZb8KtDn+YQ8GIuUTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DOpOdo2rdUM5LYOSxm6J7IaJIKhEZ39OXU03jJgsqEUxPwKUDmAcEuY43y3Pa9F1D
	 Nj62v8/4YZzJsxHMU3UFrahkHCYzXsy1Glpryt++e5loKPZZfEcC2TrjqqOarBhmfg
	 zgMT9N4uoMYppi4jtARUjBxC//1zanKKuJzBTCXo=
Date: Thu, 17 Sep 2026 20:30:49 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Ene <sebastianene@google.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Sashiko AI <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] KVM: arm64: ptdump: Check the page tables aren't
 freed when accessing
Message-ID: <ezplrvcw7buhd75v5rezvkhbgdfldxklqavdpnxl2fad5thswe@kctrvkjzr6cs>
References: <20260916230337.4162485-1-weilin.chang@arm.com>
 <20260916230337.4162485-2-weilin.chang@arm.com>
 <aqugxlnqegPzMpB-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqugxlnqegPzMpB-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_123103_529701_81D92222 
X-CRM114-Status: GOOD (  18.75  )
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

On Thu, Sep 17, 2026 at 09:11:50AM +0100, Vincent Donnefort wrote:
> On Thu, Sep 17, 2026 at 12:03:36AM +0100, Wei-Lin Chang wrote:
> > An open debugfs file keeps the KVM structure alive, but does not prevent
> > mmu notifier release from freeing the stage-2 page tables when the VMM’s
> > address space is torn down. Therefore page tables belonging to the mmus
> > could have been freed when a thread opens or reads the ptdump files.
> > Take the mmu_lock and check mmu->pgt is still alive before accessing the
> > page tables.
> 
> As Sashiko said, the read_lock is probably enough, including the existing one in
> kvm_ptdump_guest_show()
> 
> With that change:
> 
> Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> Tested-by: Vincent Donnefort <vdonnefort@google.com>

Thanks for the review and testing!

I agree taking read_lock is enough for most of these, but changing
kvm_ptdump_guest_show() to read_lock could result in a dump showing
weird output e.g. 0-sized ranges. This happens when the dump reads a
block, and a parallel fault turns that block into a table, and the dump
descends into the table later.

This is debugfs afterall so I think it isn't a dealbreaker, but it adds
another purpose to this patch. Maybe we can change
kvm_ptdump_guest_show() into taking a read_lock when someone reports a
scalability problem when dumping the page tables.

I'll stick to changing the other ones into taking the read_lock now.

For future reference: KVM_PGTABLE_WALK_SHARED is required if we want to
change kvm_ptdump_guest_show() into taking a read_lock.

Thanks,
Wei-Lin Chang

> 

