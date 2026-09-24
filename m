Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D9C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=; b=wlEp69+z62KQ2W4wbXo+YEvqYY
	gUW2kolGCEfLUmE4YgtgWH1yASqeqqqa9l6h3ZdUgaGTzPdDzH0dZOZWkl6sjqSHU9b+7oKSDt0Ld
	a3ss7b8mAbR5oOCRVKSWpQhJdmj488rVYMkrulWsAeOswhXqwtQ3dPvx4QztmFPl9pgTN04oPmM/Z
	rHdt/W/HVhYnIlKoZ6x830JYyRpGCwSIsQ6pzvKztBFZMO3bQaZrxl471Z2KttsIXRM48FHBQcrDs
	cu8kzr/zF2RmGykZPjITesS8VhMI+ebCu0kwRd0yqYsJKMy7lCcIlhWr7QjHajSuVAp0G5QxNnoaI
	xsRuzEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fnI-0000000AZqC-1F0X;
	Thu, 24 Sep 2026 09:31:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fnH-0000000AZpb-1Yua;
	Thu, 24 Sep 2026 09:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=; b=kY/1/lGey/hiP9D8rAuHA+lH0x
	b4PjNY0qIr70S4qcKahjuj/Ucg/XMwTPcSgoBIday+x68cG5777oeKLocgCGxvluDB7mkDSMw7sL2
	Eeji6tvE6+lrfgfAePn7axk6EE3XUxbkH3/w6yQLvZzSBDYqiZsaV7ErzOiJl4eYMEcG4f6rOgIbx
	lOmf3okgdgEWa1ZtmqtxQYEjEoZfH2q26ID/IvuR8K0L/ldsSJZW1Rx3sAnqFzS/DAzce3/klHYJy
	YPxHzZW5B1Te6B+rDPB6osQfnZrev//gDj7GUOQ+T47ghr5tV6o0qV+UATeSGfBhr2WB2vBIZ//ks
	1JCFwVdQ==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fnA-0000000Fmul-0KlA;
	Thu, 24 Sep 2026 09:31:03 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2276621E37;
	Thu, 24 Sep 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790242251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=xOCRYUji5YGOomTuwabeuv4lVWehlLnSbQO505eNnYFBDTJJHNVhtfcn7KWL9VuKtJUwUG
	U3+pSI2mEPZ3M0+9eBkpAozXKLSo5EkBpSGt7NDDehFaq3dS0x9cm18PTHFk4lJLPZWl0Q
	5UhrX93hczCoxNWG/GNyLWfbQPq0Lho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790242251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=hcaG2BmBN8RpCzgUImDkVhCd4jadO1K10lHG0EliOUcZ6SKQ6PIi/Dd3pLETHtlt6oEMql
	Q52sxpdwnDE6yxBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NCAQ8wlH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=B5K7fuSR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790242247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=NCAQ8wlHzSjj22Mp5WtBpQSSbsGzsynKwAS9wnWJOqzDInDouS8G5yFj74601ElwpptgWz
	BFp/X23TPESlPxJYSdg897HDlOYorWZ2VSJIZ52xyLnhYfAMluAdZ1kecNmmZMT8g7E3xY
	ZjDe8kgwIAZLcbF901D6+4lVn1iSaoA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790242247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5qHmT8mqoU/l4reYg7Eb+0uAE5mbLL+lTgBwhE2yy78=;
	b=B5K7fuSR7zGFiT91J2r1XWZaM/q96dFA32nS7RNZ/rQQjsSspv945N1hwzYCw8IwSVBVhK
	jYelmgRKJLRWuZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70E0113668;
	Thu, 24 Sep 2026 09:30:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2es5CcbttGp+IgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 24 Sep 2026 09:30:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jani.nikula@linux.intel.com,
	Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/fbdev: Move helpers to clients/ subdirectory
Date: Thu, 24 Sep 2026 11:29:12 +0200
Message-ID: <20260924093036.82356-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2276621E37
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLgosu6qu4h11rje89ht7rjgg5)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_103101_999385_3F22CB76 
X-CRM114-Status: UNSURE (   9.77  )
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

Helpers for fbdev emulation are still linked into drm_kms_helper.ko,
which is for mode setting. Move the source and header files to the
clients/ subdirectory and link them into drm_client_lib.ko. This has
some fallout throughout drivers, but it's all trivial.

There are 3 module parameters to drm_kms_helper.ko that control fbdev
emulation. For compatibility with existing installations, leave them
in this module.

v2:
- update armada and docs

Thomas Zimmermann (2):
  drm/fbdev: Move fbdev module parameters next to module init
  drm/fbdev: Move fbdev helpers into client library

 Documentation/gpu/drm-kms-helpers.rst         |  6 +--
 drivers/gpu/drm/Makefile                      |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  2 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |  2 +-
 drivers/gpu/drm/clients/Makefile              |  3 +-
 drivers/gpu/drm/clients/drm_fbdev_client.c    |  2 +-
 .../drm_fbdev_helper.c}                       | 34 +---------------
 drivers/gpu/drm/drm_crtc_helper_internal.h    |  9 +++++
 drivers/gpu/drm/drm_fbdev_dma.c               |  2 +-
 drivers/gpu/drm/drm_fbdev_shmem.c             |  2 +-
 drivers/gpu/drm/drm_fbdev_ttm.c               |  2 +-
 drivers/gpu/drm/drm_kms_helper_common.c       | 39 +++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  2 +-
 drivers/gpu/drm/gma500/fbdev.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  1 -
 drivers/gpu/drm/omapdrm/omap_debugfs.c        |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_device.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
 drivers/gpu/drm/sitronix/st7571.c             |  1 -
 drivers/gpu/drm/tegra/fbdev.c                 |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |  2 +-
 .../drm_fbdev_helper.h}                       |  4 +-
 28 files changed, 76 insertions(+), 60 deletions(-)
 rename drivers/gpu/drm/{drm_fb_helper.c => clients/drm_fbdev_helper.c} (97%)
 rename include/drm/{drm_fb_helper.h => clients/drm_fbdev_helper.h} (99%)


base-commit: ff831af91674990f9f1814340860e96943d5df1a
-- 
2.55.0


