Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1403C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kpYueEtFBgcTo2VblGMdW3oPMA2MzFgTFdzQYaZrL0Q=; b=vRtHx6nrOO44O3l4XtMWn589Kx
	fTK6y3HhkvVwXwlmDIspMC8DpbRWuuCu7SxuuNOU0drIAxlHKnBDzLwYaVHE6D/0dS0ke4RwCnHpU
	X6YZzeAwh1onRTfIASFbGf+JJ/W8ug3zjOueMecm4v/0+V9ndBnlFiwdzc33lsPsIpKKS2PghvhKJ
	lIpagwsuQ7bNjT37n4vfInQQITL6ixQht6d5KTdmcD8eFPTrlnq4AofImctdsewR4BdpujQm/5CdY
	OES0HOZ3RFZ7Oo7A+aaRiiinmV17U50xGIYHH2DuzTitpJBw1kT+/76Qq3n6I6FKUcDEV/I8rIVIs
	xFLlmRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtYj-0000000AP6X-2DFf;
	Wed, 18 Jun 2025 14:14:37 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtA-0000000A7Ys-0SeI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:27:37 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 88F8E1F7C0;
	Wed, 18 Jun 2025 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kpYueEtFBgcTo2VblGMdW3oPMA2MzFgTFdzQYaZrL0Q=;
	b=v8kW+/Whte4SxfoSH7s4wz8zF9pYu/DtVMUitJ3lHbL9tcaq9bqp97fUoBGE1dgdKwDHZJ
	+hWVdjbY32Rvd9ZNlsrlTDqGPFjiKSh8Sfu3aN5DQu0zqNrkP+aJORwjOiLxCCO6o+hViK
	Dq/wuTLxyCEhckcdevWZjKVsx6X+BdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kpYueEtFBgcTo2VblGMdW3oPMA2MzFgTFdzQYaZrL0Q=;
	b=yyqNFC86/O5vIsjbS00Q/L6NY74aiSeLTeYDp9dCdGMWnb5KPvUoTn3m7U/+eUby5iHXPQ
	E/qO3GkiWfSuJqCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kpYueEtFBgcTo2VblGMdW3oPMA2MzFgTFdzQYaZrL0Q=;
	b=v8kW+/Whte4SxfoSH7s4wz8zF9pYu/DtVMUitJ3lHbL9tcaq9bqp97fUoBGE1dgdKwDHZJ
	+hWVdjbY32Rvd9ZNlsrlTDqGPFjiKSh8Sfu3aN5DQu0zqNrkP+aJORwjOiLxCCO6o+hViK
	Dq/wuTLxyCEhckcdevWZjKVsx6X+BdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kpYueEtFBgcTo2VblGMdW3oPMA2MzFgTFdzQYaZrL0Q=;
	b=yyqNFC86/O5vIsjbS00Q/L6NY74aiSeLTeYDp9dCdGMWnb5KPvUoTn3m7U/+eUby5iHXPQ
	E/qO3GkiWfSuJqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CC0C713721;
	Wed, 18 Jun 2025 12:27:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PM5nMLWwUmg4UgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
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
	deller@gmx.de,
	support.opensource@diasemi.com,
	duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/12] backlight: Do not include <linux/fb.h> in header file
Date: Wed, 18 Jun 2025 14:16:32 +0200
Message-ID: <20250618122436.379013-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_052736_291928_E0D2D52A 
X-CRM114-Status: UNSURE (   9.50  )
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

Remove the final dependencies on fbdev from the backlight subsystem.
This is really just the include of <linux/fb.h> in backlight, but it
has some fallout in other code.

Patches 1 to 11 fix all the implicit includes that come from fb.h
throughout the kernel. It's all trivial, but touches various drivers.
Maintainers are in CC. Patch 12 fixes the backlight header.

With the series applied the backlight subsystem should be free from
fbdev dependencies.

Thomas Zimmermann (12):
  platform/x86: dell-uart-backlight: Use blacklight power constant
  drm/panel: panel-samsung-s6e63m0: Include <linux/of.h>
  drm/panel: panel-samsung-s6e88a0-ams427ap24: Include <linux/of.h>
  drm/panel: panel-summit: Include <linux/of.h>
  fbcon: Add necessary include statements and forward declarations
  backlight: Include <linux/of.h>
  backlight: apple_dwi_bl: Include <linux/mod_devicetable.h>
  backlight: as3711_bl: Include <linux/of.h>
  backlight: da9052_bl: Include <linux/mod_devicetable.h>
  backlight: ktd2801: Include <linux/mod_devicetable.h>
  backlight: led_bl: Include <linux/of.h>
  backlight: Do not include <linux/fb.h> in header file

 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c            | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 1 +
 drivers/gpu/drm/panel/panel-summit.c                     | 1 +
 drivers/platform/x86/dell/dell-uart-backlight.c          | 2 +-
 drivers/video/backlight/apple_dwi_bl.c                   | 1 +
 drivers/video/backlight/as3711_bl.c                      | 1 +
 drivers/video/backlight/backlight.c                      | 1 +
 drivers/video/backlight/da9052_bl.c                      | 1 +
 drivers/video/backlight/ktd2801-backlight.c              | 1 +
 drivers/video/backlight/led_bl.c                         | 1 +
 include/linux/backlight.h                                | 1 -
 include/linux/fbcon.h                                    | 7 +++++++
 12 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.49.0


