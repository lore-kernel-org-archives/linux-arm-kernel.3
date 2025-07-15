Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C301EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=; b=CkjaIQkKM1t9Hi+ApVw+AbrurV
	CEB+BxWY3di9pavi5cdMkasdcPzzmwfrSzfgYrvOPi+utU00Y91PH9e5Qj5Sw7oHA5+eoEfs/it82
	hpDIueiVm1wPpL9DRynL9h1JDwHr2Rm5m48KQUeJX4JyVbSVjNetw/5uJ/Ggx8iAmXXeYIEBbrvHW
	e1hlW7TeRIZskpX/IEuvkFk5+67r8XRZtXlBjyXiFtyhnBiKY2S6GlxmEuaCfgoEXz3z4+f1AxJuQ
	BVDIAuUP5lLGHPQj+IkPdRlj7UrM7nyjUOShNUFbHYLoqTN/tEQwDVv2FiLncJXcfZEUnkfGWukIv
	BiTUZptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfNa-000000059rD-2wd5;
	Tue, 15 Jul 2025 13:07:30 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubenF-000000054J8-0xVV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:29:58 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 37FCA1F38F;
	Tue, 15 Jul 2025 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=QoKW7Yh6porPglfWJz2OZChxEiamLvLxKaIvycNJxh3bg7LYQSgk60CjlzhWEIENjMyj1Y
	q42aI+n4ZNGdVGyAL8V1PftB8WPf2Xi1kTG2OG9CYS8agqfLmfAGndWG93mrdnPIbFKu69
	JzeBhVTqGI2vhk9xwmhVfZQzUouV/PM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=AkfZqHcjcB3keVB6qvSM3e0/bATe1ldj69gbeuALdJU7JgXK3Jo+3SZONymHV1JreOp94h
	CwLntdyDfgzpm6BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QoKW7Yh6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AkfZqHcj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=QoKW7Yh6porPglfWJz2OZChxEiamLvLxKaIvycNJxh3bg7LYQSgk60CjlzhWEIENjMyj1Y
	q42aI+n4ZNGdVGyAL8V1PftB8WPf2Xi1kTG2OG9CYS8agqfLmfAGndWG93mrdnPIbFKu69
	JzeBhVTqGI2vhk9xwmhVfZQzUouV/PM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=AkfZqHcjcB3keVB6qvSM3e0/bATe1ldj69gbeuALdJU7JgXK3Jo+3SZONymHV1JreOp94h
	CwLntdyDfgzpm6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CEB913306;
	Tue, 15 Jul 2025 12:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HyAMIcFJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:29:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	deller@gmx.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	fnkl.kernel@gmail.com,
	j@jannau.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sven@kernel.org,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	support.opensource@diasemi.com,
	duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/15] backlight: Do not include <linux/fb.h> in header file
Date: Tue, 15 Jul 2025 14:24:37 +0200
Message-ID: <20250715122643.137027-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: 37FCA1F38F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_052957_413937_2FB21CC9 
X-CRM114-Status: GOOD (  11.09  )
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

Remove the final dependencies on fbdev from the backlight subsystem.
This is really just the include of <linux/fb.h> in backlight, but it
has some fallout in other code.

Patches 1 to 14 fix all the implicit includes that come from fb.h
throughout the kernel. It's all trivial, but touches various drivers.
Maintainers are in CC. Patch 15 fixes the backlight header.

With the series applied the backlight subsystem should be free from
fbdev dependencies.

v2:
- add missing clean ups in jornada720, rave-sp, rt4831

Thomas Zimmermann (15):
  platform/x86: dell-uart-backlight: Use blacklight power constant
  drm/panel: panel-samsung-s6e63m0: Include <linux/of.h>
  drm/panel: panel-samsung-s6e88a0-ams427ap24: Include <linux/of.h>
  drm/panel: panel-summit: Include <linux/of.h>
  fbcon: Add necessary include statements and forward declarations
  backlight: Include <linux/of.h>
  backlight: apple_dwi_bl: Include <linux/mod_devicetable.h>
  backlight: as3711_bl: Include <linux/of.h>
  backlight: da9052_bl: Include <linux/mod_devicetable.h>
  backlight: jornada720: Include <linux/io.h>
  backlight: ktd2801: Include <linux/mod_devicetable.h>
  backlight: led_bl: Include <linux/of.h>
  backlight: rave-sp: Include <linux/of.h> and <linux/mod_devicetable.h>
  backlight: rt4831: Include <linux/mod_devicetable.h>
  backlight: Do not include <linux/fb.h> in header file

 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c            | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 1 +
 drivers/gpu/drm/panel/panel-summit.c                     | 1 +
 drivers/platform/x86/dell/dell-uart-backlight.c          | 2 +-
 drivers/video/backlight/apple_dwi_bl.c                   | 1 +
 drivers/video/backlight/as3711_bl.c                      | 1 +
 drivers/video/backlight/backlight.c                      | 1 +
 drivers/video/backlight/da9052_bl.c                      | 1 +
 drivers/video/backlight/jornada720_bl.c                  | 1 +
 drivers/video/backlight/ktd2801-backlight.c              | 1 +
 drivers/video/backlight/led_bl.c                         | 1 +
 drivers/video/backlight/rave-sp-backlight.c              | 2 ++
 drivers/video/backlight/rt4831-backlight.c               | 1 +
 include/linux/backlight.h                                | 1 -
 include/linux/fbcon.h                                    | 7 +++++++
 15 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.50.0


