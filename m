Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2E8C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=we7lqF6l0Qar7m9x4y+leMPoOiIHvjnft51zpxljQgY=; b=qwm8Iw1UFd6tbbnwKgMWNLY93w
	jizwOOpt+rZqbGWBsPoC/L6O1+5pemRmyM8wmEcYDa4x3zeI10Go58/his8cG6ZlB2hO/yOo1yrfX
	7sPr+ivOC0JlQR3TphjTJry5+dmn8mKebhynSdm65F9UY1aGMneVr9rhNHZAm5JO74WwcZ+UVQV7w
	EAzM6Wy0/GFk6keU79DAaANVkL80azgPVdIn3IefE0i877DgUdPHEPfWgWF3LgSTQGuIg+WWiS9d8
	CqT8dyJSQSm3wIqNoLeICWHsfHOWhXIvBg9Ugr+WZlGYdmeZXsKmv4RyTp0adI+pPL0cnQ/XYdpad
	stBCix+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxL0-0000000EW1G-2StB;
	Wed, 15 Jul 2026 10:59:38 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxKt-0000000EVzA-3q5g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 10:59:33 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D01F23E2C;
	Wed, 15 Jul 2026 10:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784113164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we7lqF6l0Qar7m9x4y+leMPoOiIHvjnft51zpxljQgY=;
	b=ti/dA1g3X18nyqG7vhY2tRPVSYR5ylC7FgrZ9rdWpGiCK+ToUREAfgzmrZJxpDPeB2L1WQ
	vhN84cQ4UfUy9TQdbUM6U/ywHRUiw3rvkBF34D+a3QnycVpakUd4g4oMhSQlXobLJNcpcW
	qIkNRK8CP4BYLJ9Gyhn2/a7jZJRkTDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784113164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we7lqF6l0Qar7m9x4y+leMPoOiIHvjnft51zpxljQgY=;
	b=EQA3QzEMogjuEJKyRgd1oCggHhTAcx1SpRrTMwYurGNhu8Ci0PV1C74P8OY8qs4lfjWYSv
	gjELzdQLTQ0uBnBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ti/dA1g3";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EQA3QzEM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784113164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we7lqF6l0Qar7m9x4y+leMPoOiIHvjnft51zpxljQgY=;
	b=ti/dA1g3X18nyqG7vhY2tRPVSYR5ylC7FgrZ9rdWpGiCK+ToUREAfgzmrZJxpDPeB2L1WQ
	vhN84cQ4UfUy9TQdbUM6U/ywHRUiw3rvkBF34D+a3QnycVpakUd4g4oMhSQlXobLJNcpcW
	qIkNRK8CP4BYLJ9Gyhn2/a7jZJRkTDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784113164;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we7lqF6l0Qar7m9x4y+leMPoOiIHvjnft51zpxljQgY=;
	b=EQA3QzEMogjuEJKyRgd1oCggHhTAcx1SpRrTMwYurGNhu8Ci0PV1C74P8OY8qs4lfjWYSv
	gjELzdQLTQ0uBnBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 237BC779AD;
	Wed, 15 Jul 2026 10:59:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QEnVBQxoV2reeAAAD6G6ig
	(envelope-from <clopez@suse.de>); Wed, 15 Jul 2026 10:59:24 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 2/2] KVM: arm64: vgic: Mitigate potential LPI registration failure
Date: Wed, 15 Jul 2026 12:51:38 +0200
Message-ID: <20260715105137.3973823-5-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260715105137.3973823-3-clopez@suse.de>
References: <20260715105137.3973823-3-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL17rns84hbggp9ounzx9knj39)];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D01F23E2C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_035932_118953_3953CDEA 
X-CRM114-Status: GOOD (  14.67  )
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

Mitigate a potential failure when inserting a new LPI into the VGIC LPI
xarray.

When vgic_add_lpi() is preparing to register a new LPI, it pre-allocates
an xarray entry using xa_reserve_irq(), so that it can later perform the
insertion under the xarray lock without allocating.

However, since xa_reserve_irq() is called before acquiring such lock,
there is a potential race where xa_reserve_irq() observes a populated
entry, thus not performing the allocation, and another CPU removes that
entry before the xarray lock is grabbed to perform the insertion.

  CPU0 (Adding new LPI)                      CPU1 (Releasing LPI)
  =====================                      ===================
  vgic_add_lpi()
      /* Entry populated, does not allocate */
      xa_reserve_irq(.., intid, ..)
                                            vgic_release_deleted_lpis()
                                                xa_lock_irqsave()
                                                vgic_release_lpi_locked()
                          xarray node freed --> __xa_erase(.., intid)
                                                xa_unlock_irqrestore()
      xa_lock_irqsave()
      xa_load(.., intid) == NULL
      vgic_try_get_irq_ref(NULL) == false
      __xa_store(.., intid, irq, 0) <-- xarray node was freed, gfp=0
                                        cannot allocate, returns -ENOMEM

This can happen e.g. if the guest issues a DISCARD while the LPI is
still referenced from a vCPU's active-pending list (ap_list), and the
same INTID is re-mapped via MAPTI.

Mitigate this by passing GFP_NOWAIT to __xa_store(), so that the
allocation can happen under the lock in the rare case that this
condition is hit. Add __GFP_ACCOUNT as well to match xa_reserve_irq()'s
flags.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 1d6f83f60f79 ("KVM: arm64: vgic: Store LPIs in an xarray")
Signed-off-by: Carlos López <clopez@suse.de>
---
 arch/arm64/kvm/vgic/vgic-its.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 2240bdf20c92..b59e0e0e1e82 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -121,7 +121,8 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
 		 * from the deferred release path, pending cleanup by
 		 * vgic_release_deleted_lpis(). Evict and free it if present.
 		 */
-		oldirq = __xa_store(&dist->lpi_xa, intid, irq, 0);
+		oldirq = __xa_store(&dist->lpi_xa, intid, irq,
+				    GFP_NOWAIT | __GFP_ACCOUNT);
 		ret = xa_err(oldirq);
 		if (ret) {
 			xa_unlock_irqrestore(&dist->lpi_xa, flags);
-- 
2.51.0


