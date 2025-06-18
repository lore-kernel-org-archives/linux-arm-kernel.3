Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107B7C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=; b=kJVkKsoxBpDLSCIO3KAU7evvxR
	oejB3sXAGim6+Egr3juPC8uZFrHUxaTK0c0LXHTUz/dN61eldT72c6aari+z6uAgp6spM2NIrufy8
	Z2eESecQ21V7K7U0tYdMu2g4Q1gjonIZp292Hh3WJAoch6VqOUmFKkZNqCC2EEzJq+cCAYuhJOrYt
	KSPe8zF3BaBo06kb7351lX7fHp05+JvBVHsEH1lLvI5xTtY1fCQ7N0BhCkCrOxM59kNgL1qYRhHDf
	uQGlC4NjQm3Fj6Y9+bEnbdtlddCq9f9m11dyIfgzlAwMZYVSpO/r3LOOJD5jSmJ7rKk3/RFRUVkfQ
	Bb+6yN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu3r-0000000AU8f-0K5J;
	Wed, 18 Jun 2025 14:46:47 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrte-0000000A7ku-2as3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:28:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 589AC21248;
	Wed, 18 Jun 2025 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=vs7G0AdC4LPmwUKixwGgofQg/aOEomQTHHEdn1AexiB1eoWR2gxKQtV5ZauJEJ+mYsKKkx
	L688anvAiWalbnWJ3rY+E6rfmCOVe/le9Im8OZPJlcZs1zrjQEAlcQF3P5Twb3gH1TozNi
	puX2A1ReYCGsjtKeYRPOEXxWa7FVxUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=C6gx6DbrylyWvenw5nwZIXKMOIy6uKIRWmQaKG5mz/o8Rj4MN+9XBIlpDigApJuxuk8/ab
	RhSC0/tEoInHw+Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=vs7G0AdC4LPmwUKixwGgofQg/aOEomQTHHEdn1AexiB1eoWR2gxKQtV5ZauJEJ+mYsKKkx
	L688anvAiWalbnWJ3rY+E6rfmCOVe/le9Im8OZPJlcZs1zrjQEAlcQF3P5Twb3gH1TozNi
	puX2A1ReYCGsjtKeYRPOEXxWa7FVxUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=C6gx6DbrylyWvenw5nwZIXKMOIy6uKIRWmQaKG5mz/o8Rj4MN+9XBIlpDigApJuxuk8/ab
	RhSC0/tEoInHw+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC9F013A99;
	Wed, 18 Jun 2025 12:27:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cAHeKL2wUmg4UgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:41 +0000
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
Subject: [PATCH 11/12] backlight: led_bl: Include <linux/of.h>
Date: Wed, 18 Jun 2025 14:16:43 +0200
Message-ID: <20250618122436.379013-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122436.379013-1-tzimmermann@suse.de>
References: <20250618122436.379013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_052806_801302_B7F47F7D 
X-CRM114-Status: UNSURE (   8.54  )
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

Include <linux/of.h> to declare struct of_count_phandle_with_args().
Avoids dependency on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/led_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index d2db157b2c29..44aac5fb2663 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -9,6 +9,7 @@
 #include <linux/backlight.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 struct led_bl_data {
-- 
2.49.0


