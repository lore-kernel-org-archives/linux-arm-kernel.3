Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0A5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MM0aY3IGl5pPmEiIFxxLVMtI88aL1w/wNM1GrGdM4UI=; b=zEPQaQKd1dBfMPU/iKFyKV8wd9
	PTePrz9G7Ii4XOXi2/jbZmCFltpSq85OiXh5YZpbMpSvNz1LK//DpclNGAG4DJU+YE8/Zrtukb+Bc
	8j7P9TcMRN6mUYguUV5s7ApWINSzKqnfqY3NSZ8RdO7ft59pQnPqUCshcpdss311hGRXFWWZXkNdg
	Tmu1GJ8+5GjI3LjI1p6faZI3YhU22P0OMYfuK4oDdt+yFYCyTtjaPoSBcnTekM0MOjH0sOUZ2Tllt
	It+P2xXb6RZe4K9UJXRhxWVjiBvVOpQsPMzZNjCziXc5rnK6cIFCAulGHqaJJmu0NDYs6b9HVVkYT
	yDIfl5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbfc-00000006kg5-0EJD;
	Fri, 03 Jul 2026 11:02:56 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbfZ-00000006keD-2Zdi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:02:54 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B9E3F75BAC;
	Fri,  3 Jul 2026 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM0aY3IGl5pPmEiIFxxLVMtI88aL1w/wNM1GrGdM4UI=;
	b=PL1iuCueLagwGQFEPwDBm89ilCThUZHzbFuEAczjPi53p8ZF6Z0gcmMgJDVFMiATbuhLrC
	eFagIKFySqtraTEo1ZC4JGa+sbDyxqwr6SDGY/o//DvqfCSxrumSrgrg1tlPuVq574tHV7
	5Y93usJOjqmvr4BQBGeuxCpwdGVEv4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM0aY3IGl5pPmEiIFxxLVMtI88aL1w/wNM1GrGdM4UI=;
	b=fEDRalz6S/bgrXGEUB6ZQ8+orxvHGWKAvyefYeoSVI+nUJ+jGEyn7XIR75AoOQqbhG2vWM
	e2DYDaeb3EvLU8Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM0aY3IGl5pPmEiIFxxLVMtI88aL1w/wNM1GrGdM4UI=;
	b=PL1iuCueLagwGQFEPwDBm89ilCThUZHzbFuEAczjPi53p8ZF6Z0gcmMgJDVFMiATbuhLrC
	eFagIKFySqtraTEo1ZC4JGa+sbDyxqwr6SDGY/o//DvqfCSxrumSrgrg1tlPuVq574tHV7
	5Y93usJOjqmvr4BQBGeuxCpwdGVEv4w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MM0aY3IGl5pPmEiIFxxLVMtI88aL1w/wNM1GrGdM4UI=;
	b=fEDRalz6S/bgrXGEUB6ZQ8+orxvHGWKAvyefYeoSVI+nUJ+jGEyn7XIR75AoOQqbhG2vWM
	e2DYDaeb3EvLU8Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 08D42779AA;
	Fri,  3 Jul 2026 11:02:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AHcWO9WWR2pMTwAAD6G6ig
	(envelope-from <clopez@suse.de>); Fri, 03 Jul 2026 11:02:45 +0000
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
Subject: [PATCH v3 2/2] KVM: arm64: vgic: Mitigate potential LPI registration failure
Date: Fri,  3 Jul 2026 13:01:30 +0200
Message-ID: <20260703110130.2609872-4-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260703110130.2609872-2-clopez@suse.de>
References: <20260703110130.2609872-2-clopez@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040253_800666_C1E6E76F 
X-CRM114-Status: GOOD (  14.78  )
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
condition is hit.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 1d6f83f60f79 ("KVM: arm64: vgic: Store LPIs in an xarray")
Signed-off-by: Carlos López <clopez@suse.de>
---
 arch/arm64/kvm/vgic/vgic-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 577286069368..ace3e59fff97 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -121,7 +121,7 @@ static struct vgic_irq *vgic_add_lpi(struct kvm *kvm, u32 intid,
 		 * from the deferred release path, pending cleanup by
 		 * vgic_release_deleted_lpis(). Evict and free it if present.
 		 */
-		oldirq = __xa_store(&dist->lpi_xa, intid, irq, 0);
+		oldirq = __xa_store(&dist->lpi_xa, intid, irq, GFP_NOWAIT);
 		ret = xa_err(oldirq);
 		if (!ret && oldirq)
 			kfree_rcu(oldirq, rcu);
-- 
2.51.0


