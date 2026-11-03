Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14457606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QkZ7KTsu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4SNtPoy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DqbjqLnGmLvGgfiPehVeEkfrGreI3m7/ZDiq2XZUR3M=; b=QkZ7KTsutjz9Am
	4Ix3qM6yx8XxLR+1oTEWdI1LaqjSO96FMVvYI38qmgN847MRDaMEBLtXroVfxkpmc2I58SURrYsuR
	l1D+IYcWWJI2uaS7kGkTG0iCXUGAxzelt/GXUjMDX7qtMqkR5xEdyYWuALGbyzs3ffH12P7aR1Em5
	ZysGoPZRTk8ZXV9LTISQgcgOkkFDD1ZdmLeK7dTlRH8rHHcIEmouBmUzaTnYWEgDse6POGUmsQSqn
	MSW9PM5k/TLCiuma31L+OPrIBA7te5tzBwj/jfirkr3jVqOJbG340ooEAfBxEPoKVqMcbuEaAoyDd
	mEZtAPFHBUX8yXHSnM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDy-00000002Tq1-0GYz;
	Tue, 03 Nov 2026 13:06:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDX-00000002Sy2-2s8t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B1FC4400E;
	Tue,  3 Nov 2026 13:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287611F00A1C;
	Tue,  3 Nov 2026 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711183;
	bh=DqbjqLnGmLvGgfiPehVeEkfrGreI3m7/ZDiq2XZUR3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l4SNtPoyN6FGl+0CJmHEpwZcGlZsOOMyv547R5O7TCMbgz6kt0FRVc2VJMVW6/amE
	 BdRn8xj9+myFNDCEZrEfCQGrpGYJfccIsUfUoyRQCU2aVCtXdjXhs7Z8PRDQx96cbS
	 tsZUwxBn75mx+M0IIg0yeiVlj+AgiY8GoTIPtDcdZ4saWvxC8t1YB40VmbMevqAAi8
	 B0hUyYPY0VqvrQqJ8uTwLDKu2PetOouHQPUyj2J3E1GmKHxLJu0I3JHrAt3tmU2k8E
	 C7O4cMZ3chBTJPPjeV51SuSC48mNSiWoruY4hsrycvQE7vcw82xNiaRVcRxbR1VUtg
	 Zzgr8UmQsy/zA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDV-0000000ATWs-1vix;
	Tue, 03 Nov 2026 13:06:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Xuheng Li <xuheng@cs.columbia.edu>
Cc: Quentin Perret <qperret@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Add an ISB after mapping a hyp fixmap slot
Date: Tue,  3 Nov 2026 13:05:45 +0000
Message-ID: <179371111261.2844725.5233996061235125955.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028-fixmap-isb-v1-1-6c9f0f9cb810@cs.columbia.edu>
References: <20261028-fixmap-isb-v1-1-6c9f0f9cb810@cs.columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, xuheng@cs.columbia.edu, qperret@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 23:02:10 +0000, Xuheng Li wrote:
> fixmap_map_slot() installs a valid PTE for the CPU's fixmap slot (or
> the fixblock slot) and issues a DSB ISHST before returning the slot's
> VA, which the caller then accesses.  It does not issue an ISB.
> 
> The DSB guarantees that the PTE write has completed, but without a
> context synchronization event the architecture does not guarantee that
> a later access on the same CPU uses the new entry: its translation may
> have been performed speculatively while the slot was still invalid, in
> which case the access takes a translation fault.  At EL2 that fault
> ends in hyp_panic().  The clear side, fixmap_clear_slot(), already ends
> with an ISB.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Add an ISB after mapping a hyp fixmap slot
      commit: 0e24f9db2ebedc271add0c5dbf2821b8f8a0ab06

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



