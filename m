Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59C6C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=; b=nKWxElcSqaxDChcAfNRk7YY1uq
	D+N92OX/Kd7szNcrMGoArmJvtLykLZpdl21VEQ08aP/Zc7dBjxMsn9gvbjz0pB2j6HNtVo9W9mJBh
	UUpZwWpVE1X3V8rxlexJaC1dyfexjWnuNf50YK2KgoKcJ8odK2UHhm+KAZ+tRJOZSkUPz86SkSayy
	hYfG/9pHsMARm67cuUpZoFFbUghbKbfNn2+Xv0CgBK99NYsBuU8PZ4W498k1uuTmJ3w5nQtBGHHgK
	s4Wg1UCtrCB1doL8/gEbmPyetU1xDqXZrunifJjvR7a5jFTVUYrw5xOE/Ipku1jXinVBxz1mGAcQe
	4sKYZghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxhM-00000006hra-00CZ;
	Tue, 10 Jun 2025 12:03:24 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwlK-00000006bWH-0YBp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:03:27 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E99D1F848;
	Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=dNxzJShpIEYWmLE4CdcGR2HSN5SZ9moOGdQtUCo8isxyeaqAr3ebOkV66v8SyR+V/uxvPO
	7jAxqVqlV4fycMH3kc0PQIoxoONPlsoUVymdlfpInkrWHsEI8k2WkjqcsCDxFN7dnIApCP
	rucaLILT5BhQaHk18B+VA2YFX4ZSHNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=/4ndFyI78v71NKYLyklrybB6ZG0OmkxJHyI1SadiM7OmzOQjqRQX3oqlNbbQ3fKun3EkOo
	sZcWLG6SfKASmyCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dNxzJShp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/4ndFyI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=dNxzJShpIEYWmLE4CdcGR2HSN5SZ9moOGdQtUCo8isxyeaqAr3ebOkV66v8SyR+V/uxvPO
	7jAxqVqlV4fycMH3kc0PQIoxoONPlsoUVymdlfpInkrWHsEI8k2WkjqcsCDxFN7dnIApCP
	rucaLILT5BhQaHk18B+VA2YFX4ZSHNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JBBa1CNqwIJKfOnOIWpEbn0xaM85120pWePKC5roVMI=;
	b=/4ndFyI78v71NKYLyklrybB6ZG0OmkxJHyI1SadiM7OmzOQjqRQX3oqlNbbQ3fKun3EkOo
	sZcWLG6SfKASmyCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA8CA13964;
	Tue, 10 Jun 2025 11:03:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AA8pL/oQSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	soci@c64.rulez.org,
	simona@ffwll.ch,
	jayalk@intworks.biz,
	linux@armlinux.org.uk,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/14] fbdev: Fix warnings related to including <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:33 +0200
Message-ID: <20250610105948.384540-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2E99D1F848
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_040326_314049_39A1FC78 
X-CRM114-Status: GOOD (  10.33  )
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

Some source files in fbdev do not include <linux/export.h> properly;
others do when they don't have to. The build scripts warn about these
cases.

Clean up to fix the related warnings. While at it, also fix trailing
whitespaces in the affected files.

Thomas Zimmermann (14):
  fbdev: Remove trailing whitespaces
  fbdev: Include <linux/export.h>
  fbdev/c2p: Include <linux/export.h>
  fbdev/cyber2000fb: Unexport symbols
  fbdev/matroxfb: Remove trailing whitespaces
  fbdev/matroxfb: Include <linux/export.h>
  fbdev/omap: Include <linux/export.h>
  fbdev/omap2: Include <linux/export.h>
  fbdev/omap2: Do not include <linux/export.h>
  fbdev/mb862xx: Do not include <linux/export.h>
  fbdev/pxafb: Unexport symbol
  fbdev/sisfb: Unexport symbols
  fbdev/viafb: Include <linux/export.h>
  fbdev/viafb: Do not include <linux/export.h>

 drivers/video/fbdev/c2p_iplan2.c              |  1 +
 drivers/video/fbdev/c2p_planar.c              |  1 +
 drivers/video/fbdev/core/cfbcopyarea.c        |  2 +
 drivers/video/fbdev/core/cfbfillrect.c        |  2 +
 drivers/video/fbdev/core/cfbimgblt.c          |  2 +
 drivers/video/fbdev/core/fb_ddc.c             |  1 +
 drivers/video/fbdev/core/fb_defio.c           |  1 +
 drivers/video/fbdev/core/fb_io_fops.c         |  1 +
 drivers/video/fbdev/core/fb_sys_fops.c        |  2 +
 drivers/video/fbdev/core/fbcmap.c             |  1 +
 drivers/video/fbdev/core/fbcon.c              |  1 +
 drivers/video/fbdev/core/fbmon.c              |  2 +
 drivers/video/fbdev/core/modedb.c             |  1 +
 drivers/video/fbdev/core/svgalib.c            |  1 +
 drivers/video/fbdev/core/syscopyarea.c        |  2 +
 drivers/video/fbdev/core/sysfillrect.c        |  2 +
 drivers/video/fbdev/core/sysimgblt.c          |  2 +
 drivers/video/fbdev/cyber2000fb.c             |  4 --
 drivers/video/fbdev/macmodes.c                |  3 +-
 drivers/video/fbdev/matrox/g450_pll.c         | 26 ++++----
 drivers/video/fbdev/matrox/matroxfb_DAC1064.c | 47 +++++++-------
 drivers/video/fbdev/matrox/matroxfb_Ti3026.c  |  1 +
 drivers/video/fbdev/matrox/matroxfb_accel.c   |  2 +
 drivers/video/fbdev/matrox/matroxfb_base.c    |  1 +
 drivers/video/fbdev/matrox/matroxfb_g450.c    | 62 ++++++++++---------
 drivers/video/fbdev/matrox/matroxfb_misc.c    | 21 ++++---
 drivers/video/fbdev/mb862xx/mb862xx-i2c.c     |  1 -
 drivers/video/fbdev/omap/lcd_dma.c            |  1 +
 drivers/video/fbdev/omap/lcdc.c               |  2 +
 drivers/video/fbdev/omap/omapfb_main.c        |  2 +
 drivers/video/fbdev/omap2/omapfb/dss/apply.c  |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/core.c   |  1 +
 .../fbdev/omap2/omapfb/dss/dispc-compat.c     |  1 +
 .../video/fbdev/omap2/omapfb/dss/display.c    |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  1 -
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  1 +
 .../fbdev/omap2/omapfb/dss/dss_features.c     |  1 +
 .../video/fbdev/omap2/omapfb/dss/manager.c    |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/output.c |  1 +
 .../video/fbdev/omap2/omapfb/dss/overlay.c    |  1 +
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  1 -
 drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  1 +
 .../video/fbdev/omap2/omapfb/omapfb-ioctl.c   |  1 -
 drivers/video/fbdev/omap2/omapfb/vrfb.c       |  1 +
 drivers/video/fbdev/pxafb.c                   |  1 -
 drivers/video/fbdev/sbuslib.c                 |  1 +
 drivers/video/fbdev/sis/sis_main.c            |  9 ---
 drivers/video/fbdev/via/via-core.c            |  1 +
 drivers/video/fbdev/via/via-gpio.c            |  1 -
 drivers/video/fbdev/via/via_i2c.c             |  1 +
 drivers/video/fbdev/wmt_ge_rops.c             |  1 +
 51 files changed, 132 insertions(+), 95 deletions(-)

-- 
2.49.0


