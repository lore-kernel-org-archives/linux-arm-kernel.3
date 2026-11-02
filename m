Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC29D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gqaOE8CI;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F+5WWgPW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=euznYBocIb8kfNgcKlt2GHcUVDSBs2gzY/11E05nVeE=; b=gqaOE8CI75MMtmQg+S0e9AiDna
	thA9w3cAQlqrwyBGlvMNx6kStwH6QW0iv8DvZV9UVb0OLIvzPdMrIXfC2iF4Ai3EgDsSEFecKPpPJ
	bbTs6nUhAoqPbkbcSF2nElBBJm4vgsH0UiZKAzzcXIbQyXJuk7Lu+GPyWtL/9sbLkTB2+xUIozJ+I
	AyurLrkqt/yPfONtT2+gHdN6KkCG0Q1U8ty0HP1oRquUnW3WJiaZ1dflEizfrTBRXkBwvm+HfOvGy
	2eHNFsfitK+WZ+LW19y4NDGvJr9SW1nzlwUp8xHlYsvd89AFSYDidzGfsKmJkhZvH/pBWX0Ai9oUa
	Xgl//kkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnQB-0000000Fs3M-3tWg;
	Mon, 02 Nov 2026 08:29:39 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnQ9-0000000Fs2O-0Azy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:29:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=y8BgwjagvHGf78IlM6ng3nm9vDTk3b3hu1EyL1SF7ec=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793608174; v=1; x=1794212974;
 b=F+5WWgPWHTgZkLOdWp34fjp8vKNTzLwWGqZ/4900AI/b1FTmGpR1sFpQt8SzIiPVy20OvRLv
 h7fwwNHkpAZeLqoAxkwBPghJibjqFi5yr5vvVF8G2NWNsTRh8Fx/D44CNgsqKctPTHRQgrIphKQ
 IaHcegGiTwV+63OFDSO3Vjy0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id eddade33f188acbf;
	Mon, 02 Nov 2026 08:29:34 +0000
X-Mizu-Trace-ID: eddade33f188acbf
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: vgic-its: Update GITS_CTLR.Enabled under its_lock
Date: Mon,  2 Nov 2026 08:29:33 +0000
Message-ID: <20261102082933.2673799-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_002937_243236_EF77305B 
X-CRM114-Status: GOOD (  11.56  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A GITS_CTLR write that disables the ITS clears its->enabled and
invalidates the translation cache under cmd_lock, while an MSI
injection tests the enable bit and populates the cache under its_lock.
An injection that passed the test before the disable can cache its
translation after the invalidation, and the cached path then injects
the LPI from the disabled ITS on every later MSI for that event.

Take its_lock around the store and the invalidation, so that it
serializes the store against the test. Nest it under cmd_lock, as the
command handlers do.

Fixes: 86a7dae884f38 ("KVM: arm/arm64: vgic-its: Check the LPI translation cache on MSI injection")
Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
Link: https://lore.kernel.org/ah6Lsi4MfKUU6wBR@v4bel/
Suggested-by: Oliver Upton <oupton@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    Changes since v1 [1]:
      - Reworded the commit message.
      - Rebased on 7.4-rc1.
    
    Picking up the fix Marc was worried had stalled [2].
    
    The GICR_CTLR.EnableLPIs path has the same window and is left as
    is. vgic_its_invalidate_all_caches() can't take kvm->lock there (it
    runs with vcpu->mutex held) or config_lock (the userspace GICR_CTLR
    route already holds it). Instead, the vgic_target_oracle() check in
    my LPIs-disabled series [3] keeps an LPI off a redistributor with
    EnableLPIs clear. The two don't depend on each other.
    
    vgic_its_free_collection_list() still leaves the cache alone. A
    guest reaches it only through a GITS_BASER write, which already
    drops the cache (8cd92f77ae4f). An ITS reset frees the devices
    first, which drops it too. That leaves a failed collection-table
    restore. A VMM gets there with translations cached only by enabling
    the ITS before the restore, against the documented order. Those
    translations then keep injecting their LPIs into the old target
    vCPUs.
    
    Based on Linux 7.4-rc1 (6628e7d4c6b25; also applies to kvmarm/fixes
    79f3724ca8913).
    
    [1] https://lore.kernel.org/all/20260917162020.1612577-1-fuad.tabba@linux.dev/
    [2] https://lore.kernel.org/861pbr6emw.wl-maz@kernel.org/
    [3] https://lore.kernel.org/all/20261026092802.2636798-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/vgic/vgic-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 7e9b265b1f521..68e3034e52236 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -1800,9 +1800,12 @@ static void vgic_mmio_write_its_ctlr(struct kvm *kvm, struct vgic_its *its,
 		 !(its->cbaser & GITS_CBASER_VALID)))
 		goto out;
 
+	/* vgic_its_resolve_lpi() tests the enable bit and caches under its_lock. */
+	mutex_lock(&its->its_lock);
 	its->enabled = !!(val & GITS_CTLR_ENABLE);
 	if (!its->enabled)
 		vgic_its_invalidate_cache(its);
+	mutex_unlock(&its->its_lock);
 
 	/*
 	 * Try to process any pending commands. This function bails out early

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


