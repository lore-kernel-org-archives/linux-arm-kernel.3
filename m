Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD9FCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=; b=VCeUs764Tvy4RfIMEfZvNwXSbs
	YJOv5uBWCZhJQHRG2i8Z6IrE7okLE7GO+oXYvHN5y9Ys9KPpa4DRPKSiq2RutCgL2hfXe0rCjUR/I
	WNnuAnka+hFjsRz8To+7M3XPrXWr9bE++uqnix9Mgb1/xt+xneFBDzh8cMFHw/hqykl+9SLhQh8T5
	faNA7ovn++TQ2MGT9QzRUEG/XIJmk5JsMUcOfF7lyqWJVcDwRtXN8qxkHmWQRw3G7fARybI8rSsNh
	NVVKzaVsLLKj7oy6m9JV5ODvzi0R29Bc0qey/60SMzuZ1vRWWXVrOvY11ksYGU0ALMZoFLtC24ftE
	nJ7OWBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qbk-00000006DN5-1qMG;
	Thu, 09 Oct 2025 13:23:00 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qbh-00000006DLi-4BFD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 13:22:59 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AAC411F74A;
	Thu,  9 Oct 2025 13:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760016174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=awaNgI7/B8kYXqIFwTWq0bTxrrbbQgWzmYQL40a/KGIHLfrwsJezjNSwwQ5oBaRko8yH3L
	zJnopVUZRPGe8w1zUAsf23kKmnS2KVtb0P/nZd+/paWDRlBXL6/LUOufHd7EJ3p5of4rMm
	knVtAwJkGpGdK5RPUY0VgX03PRAagL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760016174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=cwrjkfKRUzslGnFAMfnZN+BbuuRHgp8fiGPsw7EQNL51euzvgDiBbRojNyLdDUzWltIC1j
	NbG6hac4zQvJojCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760016174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=awaNgI7/B8kYXqIFwTWq0bTxrrbbQgWzmYQL40a/KGIHLfrwsJezjNSwwQ5oBaRko8yH3L
	zJnopVUZRPGe8w1zUAsf23kKmnS2KVtb0P/nZd+/paWDRlBXL6/LUOufHd7EJ3p5of4rMm
	knVtAwJkGpGdK5RPUY0VgX03PRAagL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760016174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=cwrjkfKRUzslGnFAMfnZN+BbuuRHgp8fiGPsw7EQNL51euzvgDiBbRojNyLdDUzWltIC1j
	NbG6hac4zQvJojCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5308A13A61;
	Thu,  9 Oct 2025 13:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0EDeEi6352iECAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Oct 2025 13:22:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/client: Implement free callback for fbdev and log
Date: Thu,  9 Oct 2025 15:16:27 +0200
Message-ID: <20251009132006.45834-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_062258_172052_3A6EAD80 
X-CRM114-Status: UNSURE (   8.51  )
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

Add struct drm_client_funcs.free and release the memory fbdev and
log clients from its implementations. Also fix the locking in the
log's unregister code.

Resolves several corner cases in the current clients and avoids
duplicated code.

Thomas Zimmermann (4):
  drm/client: Add client free callback to unprepare fb_helper
  drm/log: Do not hold lock across drm_client_release()
  drm/log: Add free callback
  drm/client: Do not free client memory by default

 drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
 drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
 drivers/gpu/drm/clients/drm_log.c          | 16 ++++++++++++----
 drivers/gpu/drm/drm_client.c               |  4 ++++
 drivers/gpu/drm/drm_client_event.c         |  9 +++++----
 drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
 drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
 drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
 drivers/gpu/drm/gma500/fbdev.c             |  3 ---
 drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
 drivers/gpu/drm/msm/msm_fbdev.c            |  2 --
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
 drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
 drivers/gpu/drm/tegra/fbdev.c              |  2 --
 include/drm/drm_client.h                   | 10 ++++++++++
 16 files changed, 46 insertions(+), 35 deletions(-)

-- 
2.51.0


