Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB54C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FQ6pbI1jk3S/yj6OPTZt3LX86x/dG8H+CO9qoc6x60=; b=g0+RFThKUyDVRvAM0CDxdBjT94
	jIMm15vf5U+nT9iiOMQK+j2GghLUFMm+QLkyO4V6U/C/QD4MM9NkRGQv0ZqNeg2EM6ECaRM1CvRvh
	z1qXWLJTKkK3k1aKHQn9xnvoWhcLrppYQQcGXpRVwj+49CVzGX3eNSi19n5FyFcyfyda5Uk8KMYDD
	vEXOKOAfnJ4cW06tmob/+Q9ELw+aIRkZTi2DvAedmuVVp7cJfa+8Bl/D1fGfSIgOTZaiDbJaiikoN
	IJHrNtoe+cKEG6qKwiUQr7qsv7gwJkE9xyqKFmInagwpezrmKvZRu8egSQ/T9bu7QcycY016bp2gS
	F8V8EEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaFr-0000000BYL7-0sm8;
	Tue, 14 Jul 2026 10:20:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaFn-0000000BYKi-3pmc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:20:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3361497;
	Tue, 14 Jul 2026 03:20:37 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88B163F7B4;
	Tue, 14 Jul 2026 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784024441; bh=c77uFUVgfJ05mGTz42Oxlye2lWOsU1Hake6afPEeEPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uk6F5TpQWkphk/6l4qeUni50zp5hcGobptnFkKTHCmH49LPAMZYLISkl7NeszC45b
	 OEe++W+nFKAMqOVmeU5Vh7XaiMgzkQmu4OT08Za+vpqtbygAJjAuspZqXmPGyb8sTZ
	 th3WksP5yMlHkekGOpO4c66dKP8d0d69y+lxxNKk=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	yangjinqian1@huawei.com,
	caijian11@h-partners.com,
	liuyonglong@huawei.com,
	yezhenyu2@huawei.com,
	yubihong@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v4 3/6] KVM: arm64: Add auto DBM support for hardware dirty tracking
Date: Tue, 14 Jul 2026 11:20:36 +0100
Message-ID: <alYNdPKCYOiHXqpZ@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e01b9a9d-9f38-44ab-acfc-069f143863d6@huawei.com>
References: <20260709104026.2612599-1-zhengtian10@huawei.com> <20260709104026.2612599-4-zhengtian10@huawei.com> <alTJOy8Sv4aAp_9y@LeoBrasDK> <8f949334-3ce7-44f4-b6da-f08a4126affd@huawei.com> <86zezunifl.wl-maz@kernel.org> <e01b9a9d-9f38-44ab-acfc-069f143863d6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_032044_047311_1E28D4D7 
X-CRM114-Status: GOOD (  30.62  )
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

On Tue, Jul 14, 2026 at 03:44:37PM +0800, Tian Zheng wrote:
> 
> On 7/14/2026 3:23 PM, Marc Zyngier wrote:
> > On Tue, 14 Jul 2026 02:14:45 +0100,
> > Tian Zheng <zhengtian10@huawei.com> wrote:
> > > 
> > > On 7/13/2026 7:17 PM, Leonardo Bras wrote:
> > > > On Thu, Jul 09, 2026 at 06:40:23PM +0800, Tian Zheng wrote:
> > > > > The DBM (Dirty Bit Modifier) attribute, introduced in ARMv8.1, enables
> > > > > hardware to automatically promote write-clean pages to write-dirty. This
> > > > > prevents the guest from being trapped in EL2 due to missing write
> > > > > permissions.
> > > > > 
> > > > > In this design, DBM is controlled by the page-table level flag
> > > > > KVM_PGTABLE_S2_DBM rather than per-PTE software flags. DBM is
> > > > > automatically set for writable non-device pages when the page-table has
> > > > > KVM_PGTABLE_S2_DBM flag, which is determined at MMU init time based on
> > > > > hardware capability.
> > > > > 
> > > > > The DBM bit is set in stage2_set_prot_attr() for initial mappings and
> > > > > hugepage splitting, and directly manipulated in
> > > > > kvm_pgtable_stage2_relax_perms() when removing write-protection. On
> > > > > W->RO downgrade, DBM is cleared to prevent hardware from silently
> > > > > upgrading RO+DBM back to W+dirty, which would bypass KVM's write
> > > > > tracking.
> > > > > 
> > > > > kvm_pgtable_stage2_pte_prot() does not extract the DBM bit back into
> > > > > enum kvm_pgtable_prot because DBM is a page-table policy determined by
> > > > > pgt->flags, not a per-PTE property. Callers should check
> > > > > pgt->flags & KVM_PGTABLE_S2_DBM instead.
> > > > > 
> > > > > This ensures DBM is consistently applied across all PTEs, including
> > > > > during hugepage splitting where child PTEs inherit DBM from the parent
> > > > > block entry via the pgt->flags mechanism.
> > > > > 
> > > > > Safety: DBM bit is only interpreted by hardware when VTCR_EL2.HD=1.
> > > > > When HDBSS is not enabled (HD=0), ARM architecture guarantees hardware
> > > > > completely ignores DBM bit in PTEs.
> > > > > 
> > > > > Co-developed-by: Eillon <yezhenyu2@huawei.com>
> > > > > Signed-off-by: Eillon <yezhenyu2@huawei.com>
> > > > > Co-developed-by: Leonardo Bras <leo.bras@arm.com>
> > > > > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> > > > Hello Tian,
> > > > 
> > > > Have you added the above tags due to this patch being based on the below?
> > > > https://lore.kernel.org/all/20260629111820.1873540-2-leo.bras@arm.com/
> > > > 
> > > > Thanks!
> > > > Leo
> > > Hi Leo,
> > > 
> > > 
> > > Yes, I added your Signed-off-by because the DBM-related code in this patch
> > You really can't do that. Only Leo can give his SoB, you can't forge
> > it yourself.
> > 
> > > is based on your implementation in:
> > > 
> > > https://lore.kernel.org/all/20260629111820.1873540-2-leo.bras@arm.com/
> > Then take the patch as is, and add to it as a separate patch. Or work
> > out in private with Leo whether he's happy with a Co-dev. But never do
> > that unilaterally.
> > 
> > Thanks,
> > 
> > 	M.
> Got it, thanks for the clarification, Marc.
> 
> I'm sorry about that — I'll remove them in the next version.
> Instead, I'll mention the reference in the commit message with a link to
> Leo's original patch:
> 
> Based on Leonardo Bras's patch:
> https://lore.kernel.org/all/20260629111820.1873540-2-leo.bras@arm.com/

That works out for me!

Thanks!
Leo

