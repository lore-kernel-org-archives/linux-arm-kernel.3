Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956F3C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 11:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=; b=I4JjgEJXOAAza3V9tDvuWLuLs9
	eS+5ZPCyfkaTx0RUyVj3QwY6JcTW/njU65JRdKW4q/1B+hzVG68p6UqaDysfsGxQk2SqSY7ktOc8H
	JHZ66zemrHvSc+sHJcIAcHkqm9vgVTs2f+v9sedgtmhW6f5F5IFtf8KcEUY1jG6YNvjkKFeVmxssf
	9p7JavkrZDvwgglJGWbAY3pRL/DhyBAqNMNC8cDwA62gLrpNqYwY0/NM/psy66SJKRm5B2dndSUul
	AqYVkIY00tirsnWoFbJEZvGBK6pLrJD1iI9nowAzoZcNg4uFfr57rQTxXs/reW/3MNaIE/swfVE6r
	Xjg4wuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxQH-00000006gds-1DEt;
	Tue, 10 Jun 2025 11:45:45 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwll-00000006bdm-1cQ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:03:54 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 73BC11F852;
	Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=rlhvlR+UiKVZj1BbdntIP2jXL3lI4ixzg4F90ypK71Vn+GQOfgTql9fgNwZZlWIp31lvbE
	q7aTFRD+h11hzPt50I4roVy06UHPh+n8LxuXbzJdkTuOAxUlDrCkHlhi+yhwaQjjoBdV9w
	iTxJg0njiSIn5fPuccpHCeXO00T5IUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=l1WVTku3H5tVEG7Ao1t2VB12ojtE0QsoQX0AjzmYFuDmEbu2Z3nqmX4FlDPTew+bdXqhMm
	TQY9kLMgaDyMwTDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rlhvlR+U;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=l1WVTku3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749553406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=rlhvlR+UiKVZj1BbdntIP2jXL3lI4ixzg4F90ypK71Vn+GQOfgTql9fgNwZZlWIp31lvbE
	q7aTFRD+h11hzPt50I4roVy06UHPh+n8LxuXbzJdkTuOAxUlDrCkHlhi+yhwaQjjoBdV9w
	iTxJg0njiSIn5fPuccpHCeXO00T5IUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749553406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3FyHIoikmcz/gU+8T29N/Q9anRoC0fTRgVb+97m9RA=;
	b=l1WVTku3H5tVEG7Ao1t2VB12ojtE0QsoQX0AjzmYFuDmEbu2Z3nqmX4FlDPTew+bdXqhMm
	TQY9kLMgaDyMwTDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2490213A17;
	Tue, 10 Jun 2025 11:03:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHCTB/4QSGgOTAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:26 +0000
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
Subject: [PATCH 09/14] fbdev/omap2: Do not include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:42 +0200
Message-ID: <20250610105948.384540-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Queue-Id: 73BC11F852
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_040353_565085_7B953C9C 
X-CRM114-Status: UNSURE (   9.72  )
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

Fix the compile-time warnings

  drivers/video/fbdev/omap2/omapfb/dss/dpi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/dss/sdi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
  drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c      | 1 -
 drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 86ed4c077c30..ad8ae1727966 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -13,7 +13,6 @@
 
 #include <linux/kernel.h>
 #include <linux/delay.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/platform_device.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index 2d3e5d4467c5..68e569ec0f83 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/regulator/consumer.h>
-#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
index ea8c88aa4477..152dbeaa6451 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c
@@ -16,7 +16,6 @@
 #include <linux/mm.h>
 #include <linux/omapfb.h>
 #include <linux/vmalloc.h>
-#include <linux/export.h>
 #include <linux/sizes.h>
 
 #include <video/omapfb_dss.h>
-- 
2.49.0


