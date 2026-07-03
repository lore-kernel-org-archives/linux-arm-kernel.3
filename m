Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3770C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PGvbZD7ywqopLmUyxA8byM9CEoPluv6LQwI4b6n0Zo0=; b=Vaku7X/bOiW0gli/EQ9cKUR5Ah
	HDEHmN/5FvpEIZDyEi9unHPOSUfabaCWmCFAaSJXNvG7C5UkSsWiFs8hYQo/nf5lJSUZzj1hPSkSg
	78vYlrlJv3FUlKs7YIuCWPuMiAx9Xq1u3OZniJzw4koSprjMgO3uB0cGRXrdr+3O29Xj2ApQpcnjO
	N317KldpV6t5lnAJKH86TA5uzPrgB7BwvDw13pFbHH96cXDzCrYyu3U3eXFKMXXSCHCrB7PoZZLTb
	lO+8kwxghMgnPzU034+kqT90qvSydHDUPyyFCnuqvn1ka7xq2r/18j+a2oRR8rxbz5WFnP3ZmfNZN
	caR35LQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbfV-00000006kcd-1h48;
	Fri, 03 Jul 2026 11:02:49 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbfS-00000006kbM-3B0v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:02:48 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C092D75B3B;
	Fri,  3 Jul 2026 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PGvbZD7ywqopLmUyxA8byM9CEoPluv6LQwI4b6n0Zo0=;
	b=mH3vvDrOkvClCa3gEN5igb4cmlXH5yjI43o1VmZ9Vbijj3zjm95fxHvzKTRmWY3XX4m1w2
	teEsEGnrgN2I53CypKp5GcwUb21QfEXdCiSPB461xwTUJo5M6c2612jrf4uBOu8Wa4m2nd
	Kv5Hcogc84ASsH5UsrXyiQkRyWiY9BM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076565;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PGvbZD7ywqopLmUyxA8byM9CEoPluv6LQwI4b6n0Zo0=;
	b=ukFMd8zQezzkN9v/CKDOgyaIH9kAmQsRHILMdzz8g0lzJrspi141k7AbKqq1ZBKNKqyXK0
	8oFpD4FNjyOqxoCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MWLhrO8v;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=95o3mJ2S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783076564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PGvbZD7ywqopLmUyxA8byM9CEoPluv6LQwI4b6n0Zo0=;
	b=MWLhrO8vsBF2Nv39fWIcIAo9rqR7XjjyWXeC5ixkJ7Xd9xrOxWOCJQ2oEOfLMMGiUvJOTt
	KoWRp8gZZJ9kivEJkzHLHkGrxxvMHk3OXdvtKtbAgEjgeRJKtAdGlWTTafkK/CUO5usqi9
	aWdrusJrqJo/ArcnmuZzo0Etwp36EbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783076564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PGvbZD7ywqopLmUyxA8byM9CEoPluv6LQwI4b6n0Zo0=;
	b=95o3mJ2SoX28GelFVi3gXmNtwCRg7/t605XqN2AWPchheI7ngVjHgdXCFvbVr3J3X0HJ8m
	vO9UwBFtgGIRlyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF9CC779AA;
	Fri,  3 Jul 2026 11:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QGcuM9OWR2pMTwAAD6G6ig
	(envelope-from <clopez@suse.de>); Fri, 03 Jul 2026 11:02:43 +0000
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
	=?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
Subject: [PATCH v3 0/2] KVM: arm64: vgic: Fix racy LPI release and re-registration handling
Date: Fri,  3 Jul 2026 13:01:28 +0200
Message-ID: <20260703110130.2609872-2-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C092D75B3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040246_948434_D6DF493B 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

Fix a couple of potential issues that could arise from racy LPI release
and re-registration for the same INTID.

The issue fixed in patch 1 can manifest itself through either a
leaked LPI structure, or a prematurely deleted LPI. The issue fixed
in patch 2 could materialize as a spurious -ENOMEM failure when
registering an LPI.

v3:
* Use refcount_dec_and_lock_irqsave() instead of unconditionally
  grabbing the xarray lock in patch 1.
* Add patch 2.

v2:
* Address Sashiko's review. Fix the direct release path by decrementing
  the refcount under the xarray spinlock, preventing a UAF that would
  have been introduced in v1.

Carlos López (2):
  KVM: arm64: vgic: Fix race between LPI release and re-registration
  KVM: arm64: vgic: Mitigate potential LPI registration failure

 arch/arm64/kvm/vgic/vgic-its.c | 10 +++++++++-
 arch/arm64/kvm/vgic/vgic.c     | 10 ++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)


base-commit: 1ee27dacbe5dc4def481794d899d67b0d4570094
-- 
2.51.0


