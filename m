Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52873EEF304
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G1NjBZLS2dGThviFkw+Hs4fu8RnfXS7kK3f1HgMTxHE=; b=gpEQ50BV4MDQK1Zx3AlDGVLpXP
	jk6CFXHGKwxUUjHvLZ0rBfGZ8f6gkCVwOkUe2O/5LQJ1v+3JLCN0RJnk8wF+sDcDbcT7hVTKNU9nG
	TZibselPO3UGMfyVU8ja+n3gA9jyTtPlv+uIyluOhz9udJ8neF2k/iIXCJga7eCcZw8D48BSuhfCX
	JRau0vqMyLFDm6HXa4mgu0TsVVN9uEzk8gEYeS+Ug58W/eylBSWU+iWQMes0/7sLiqGqinw6LHG91
	HYVDG6LvXJZUYJw+hCnSGjmtE6eP7smgJAs/0UlIdHqtH5/gTL2c/n3g1Lpx62sGTowJx4iIrRYl7
	R2m5iISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8kF-00000001sj6-1v2Z;
	Thu, 05 Mar 2026 13:28:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8kE-00000001six-17ES
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64A7561340;
	Thu,  5 Mar 2026 13:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A6CC116C6;
	Thu,  5 Mar 2026 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772717281;
	bh=lnBSHxmNphnGNCi22PlaGFKdvnE9IXS9939YI+0IHf0=;
	h=From:To:Cc:Subject:Date:From;
	b=LetMebQDnbnkvkpZ77o4DJegqdAtRxcSwn2e975//5D15F2wztxAf6ue0O1wcByQz
	 uJ+bbLHmbT0GAE6/l3QQlflrP9/sgfSRgoQbPZmTZTynD/FwJHR5RGSygFhtIn2SkM
	 a5n1U5V0UGJmuLYe6m4KE+u6MEetsu3ELvKiz3axzLeagbC+DOMKoqDS6J5DaPKAOT
	 QT8o0BGvLvl13qZYSPoDt4uq47vSpvg8qYu3VWDi39nrPlMYkPn7dwHqVbOLpMlWc7
	 9yps8TnTd2J0Xk82h14cyL9endiFGiz4W/MCnMWx7ELXvcVQMe1tDRgYGTzDi9zchQ
	 ydHvonROTXS7w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vy8kA-0000000GST7-3TSz;
	Thu, 05 Mar 2026 13:27:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Quentin Perret <qperret@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: pkvm: Fallback to level-3 mapping on host stage-2 fault
Date: Thu,  5 Mar 2026 13:27:51 +0000
Message-ID: <20260305132751.2928138-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, tabba@google.com, qperret@google.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

If, for any odd reason, we cannot converge to mapping size that is
completely contained in a memblock region, we fail to install a S2
mapping and go back to the faulting instruction. Rince, repeat.

This happens when faulting in regions that are smaller than a page
or that do not have PAGE_SIZE-aligned boundaries (as witnessed on
an O6 board that refuses to boot in protected mode).

In this situation, fallback to using a PAGE_SIZE mapping anyway --
it isn't like we can go any lower.

Fixes: e728e705802fe ("KVM: arm64: Adjust range correctly during host stage-2 faults")
Link: https://lore.kernel.org/r/86wlzr77cn.wl-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Cc: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 38f66a56a7665..d815265bd374f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -518,7 +518,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		granule = kvm_granule_size(level);
 		cur.start = ALIGN_DOWN(addr, granule);
 		cur.end = cur.start + granule;
-		if (!range_included(&cur, range))
+		if (!range_included(&cur, range) && level < KVM_PGTABLE_LAST_LEVEL)
 			continue;
 		*range = cur;
 		return 0;
-- 
2.47.3


