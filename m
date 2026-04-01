Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF44D35157
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0tNSg7osbhu8a+Ed8jInfszcsVnHM85GdKDXyTSNRck=; b=sVCcR9rgYRFKRooc61KWQ8RYj3
	VL9Zoag55yzivcR7Kxz4xcM9j2d6BNKZDNuZo7MCgd1V+ImQmW5uPQ4YGJvZAoG5BC5rVStRukdgp
	HcTNzUG8U4ikIY9+XeAu3wnT3IJtxRuzXYjiU+OZNFz6G68M26i4/PSs40lsD447A6DIbzTIhyJJi
	oJHINa+IbCzKLJuW/ysjEfPUzT4Or0QeP8gVsDYlzkkYnjY8Lr1L71udmA8Bht3DmBztz6cChufVY
	upqlU13idsegtwneaKOkx56m/4NBEjYl/voDfxxW4P3xfrQtUci1DURDIBGMyAKwAZ7OSQUQNXrDW
	ITQD+IWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qtS-0000000EJYe-2uf9;
	Wed, 01 Apr 2026 08:25:42 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qtQ-0000000EJY2-1iNU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 08:25:41 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F9E15BD44;
	Wed,  1 Apr 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775031937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0tNSg7osbhu8a+Ed8jInfszcsVnHM85GdKDXyTSNRck=;
	b=uJyXZMDAGs8wUkKiu2E3nmXhjoNJIlgRr77nC54d22buizv4aRrYtF4s6hs5SbNLMbHpHz
	L2n6Olz0RYwRKmfNHmOBwUMajTJqI+6G97J2yA+NR8h0cRAXiqXSbtDCoRWbbpHBaWpcYN
	Kc5scvf+4JVetz9nrqVeVjyYv30BrDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775031937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0tNSg7osbhu8a+Ed8jInfszcsVnHM85GdKDXyTSNRck=;
	b=qbehA/Q8ptiaijL8ilGQDzvcOkSCKG1gS08vy9zbI7FDVrA4OyAk70oz5xuM40ReAreW82
	upOLeI7r6dEkYoAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775031937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0tNSg7osbhu8a+Ed8jInfszcsVnHM85GdKDXyTSNRck=;
	b=uJyXZMDAGs8wUkKiu2E3nmXhjoNJIlgRr77nC54d22buizv4aRrYtF4s6hs5SbNLMbHpHz
	L2n6Olz0RYwRKmfNHmOBwUMajTJqI+6G97J2yA+NR8h0cRAXiqXSbtDCoRWbbpHBaWpcYN
	Kc5scvf+4JVetz9nrqVeVjyYv30BrDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775031937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0tNSg7osbhu8a+Ed8jInfszcsVnHM85GdKDXyTSNRck=;
	b=qbehA/Q8ptiaijL8ilGQDzvcOkSCKG1gS08vy9zbI7FDVrA4OyAk70oz5xuM40ReAreW82
	upOLeI7r6dEkYoAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA8D34A0B0;
	Wed,  1 Apr 2026 08:25:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9JszKIDWzGm3AwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 01 Apr 2026 08:25:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux@armlinux.org.uk,
	aaro.koskinen@iki.fi,
	jmkrzyszt@gmail.com,
	tony@atomide.com,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	soc@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files
Date: Wed,  1 Apr 2026 10:25:28 +0200
Message-ID: <20260401082533.214103-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[armlinux.org.uk,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,kernel.org,arndb.de];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_012540_597761_2A385010 
X-CRM114-Status: UNSURE (   9.04  )
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

CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
true here, so drop the lines from the defconfig files.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/davinci_all_defconfig | 1 -
 arch/arm/configs/omap1_defconfig       | 1 -
 arch/arm/configs/omap2plus_defconfig   | 1 -
 arch/arm/configs/pxa_defconfig         | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 673408a10888..72703ef0c51c 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -148,7 +148,6 @@ CONFIG_DRM_TINYDRM=m
 CONFIG_TINYDRM_ST7586=m
 CONFIG_FB=y
 CONFIG_FB_DA8XX=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_GPIO=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index df88763fc7c3..c6155f101fc9 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -136,7 +136,6 @@ CONFIG_FB_OMAP_LCDC_EXTERNAL=y
 CONFIG_FB_OMAP_LCDC_HWA742=y
 CONFIG_FB_OMAP_MANUAL_UPDATE=y
 CONFIG_FB_OMAP_LCD_MIPID=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 0464f6552169..8e09e66ccc4d 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -505,7 +505,6 @@ CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_TI_TPD12S015=m
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_LCD_CLASS_DEVICE=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index eacd08fd87ad..c51ae373ca88 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -391,7 +391,6 @@ CONFIG_LCD_CORGI=m
 CONFIG_LCD_PLATFORM=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
-- 
2.53.0


