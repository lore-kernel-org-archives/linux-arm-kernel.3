Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA06C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w5jBY6szrCZ5t7UcDEhppljpHv4wR8myGe4Fwx7Ik1Q=; b=kq+pQ67vhG2HuFyhFXQw7MXrbB
	jWA6DDWZO0sYyZ+p6fTy1LTXHJD6LyuUVjsyvTwXW7/J9+Jez1TpHQBPXQ66LaLW9pKTzmiUl7I4V
	/uBoYU6i0iPFh4Deh32U34oHJ7s+SSDjgpKa1zkHsFd0OWacTYCcwZbHfIGlnqMsM8tYPb9Wfp0xJ
	ymHuJsdYozZcgoacIn4m4mYjZ9L+YHm0ISqIhSIRk6LeQ8bxL9/XOsoWfJovvsA3hsirB6BAuPBU5
	u6M+qIK7MPxkA7UxQV9jHFMj749BNq8UHUDpwAFjtTRF+iISsGO1051ELKbrjCeytOW8IUxG4NJ8u
	JNvBP5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Er7-0000000BsS4-2iWH;
	Thu, 17 Sep 2026 16:21:01 +0000
Received: from out-230.mta0.migadu.com ([2001:41d0:1004:224b::e6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Er3-0000000BsR7-0H5Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 16:21:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4ZCPZ+9Q6roBF3CJHBhT63aw+NcWPYPDK3zziyG/hEY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789662053; v=1; x=1790266853;
 b=EXmNWqV0qoEYJqOslp9DcBmEO6pIsDiDtyEwlar36I/6lUppACfue4Q4EpgBpO0lyJMS8vgk
 4JkDCtaZUcSK7TmB3LNj3myRy22XF21bMS+YRognHUI0G2wcLH0Bec8WgaE/AdL+lsStYLhS/e3
 om+ZJbDYPLblb/YN3omLwUbM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id efb44d216b9e5b22;
	Thu, 17 Sep 2026 16:20:21 +0000
X-Mizu-Trace-ID: efb44d216b9e5b22
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: vgic-its: Update GITS_CTLR.Enabled under its_lock
Date: Thu, 17 Sep 2026 17:20:20 +0100
Message-Id: <20260917162020.1612577-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_092058_145265_0C518049 
X-CRM114-Status: GOOD (  10.66  )
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

vgic_mmio_write_its_ctlr() clears its->enabled and invalidates the
translation cache under cmd_lock, but vgic_its_resolve_lpi() tests the
bit and populates the cache under its_lock. An injection that passed
the test before the disable can cache its translation after the
invalidation, and the cached path then injects from a disabled ITS.

Commit 13031fb6b835 ("KVM: arm64: vgic-its: Drop the translation cache
reference only for the erased entry") made the concurrent invalidations
safe but left this window open. The linked v2 closed it, and Oliver
withdrew his own diff there over a kvm->lock/vcpu->mutex inversion in
its vgic_its_invalidate_all_caches() hunk.

Take its_lock around the store and the invalidation, nested under
cmd_lock as the command handlers do. This is the v2's GITS_CTLR half,
widened to cover the store, and it has no such inversion.

Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Link: https://lore.kernel.org/ah6Lsi4MfKUU6wBR@v4bel/
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Based on v7.3-rc3, applies cleanly to kvmarm/fixes.
    
    Picking up the fix Marc was worried had stalled [1]. Unlike the v2's
    GITS_CTLR hunk [2], the its->enabled store is inside the locked section
    too, so the enable test in vgic_its_resolve_lpi() is serialized by the
    lock rather than by store order.
    
    vgic_its_invalidate_all_caches(), the GICR_CTLR.EnableLPIs path, is
    left as is: it can take neither kvm->lock (it runs with vcpu->mutex
    held) nor config_lock (the userspace GICR_CTLR route already holds it).
    It belongs to the locking cleanup Oliver deferred as a long-term fix
    when he withdrew the v2 [3].
    
    [1] https://lore.kernel.org/861pbr6emw.wl-maz@kernel.org/
    [2] https://lore.kernel.org/ah6Lsi4MfKUU6wBR@v4bel/
    [3] https://lore.kernel.org/ah9KeH8bFl8NOveO@kernel.org/

 arch/arm64/kvm/vgic/vgic-its.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 9e782a4fea7e5..70b4acf1bf81d 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1738,9 +1738,15 @@ static void vgic_mmio_write_its_ctlr(struct kvm *kvm, struct vgic_its *its,
 		 !(its->cbaser & GITS_CBASER_VALID)))
 		goto out;
 
+	/*
+	 * vgic_its_resolve_lpi() tests the enable bit and populates the
+	 * translation cache under its_lock.
+	 */
+	mutex_lock(&its->its_lock);
 	its->enabled = !!(val & GITS_CTLR_ENABLE);
 	if (!its->enabled)
 		vgic_its_invalidate_cache(its);
+	mutex_unlock(&its->its_lock);
 
 	/*
 	 * Try to process any pending commands. This function bails out early

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.39.5


