Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C535C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=; b=biKhKFaqE1vtX6PR/T152UB8zg
	ilbXyE90GqQpk0JUQRhwcJYi/3HYCwCwAc9Qf7SWjYwfQ4CweQ4kwVZi/r7TbKPn0upKVKzjrKuve
	adTwwxnxQ+aEvQ2z+8ebn1vvwdYSZ6wp1PuKoRA0hb6TWX5gD4EGSwr3VrGjjx/D6f/jO4XzS1tQ/
	Fn76cW9XTJH+BNfAPddLP0WrzFPINMzKPRAjOWelQNeXrPL2VNctoC1cknjh1CThL2YtGpZxIDKIw
	OQ0jBD9JHX+S0iTO3/M8uhB0QH0TSpGtqu+KqSU4YNETuFU5uW3fbXZhDChgQdI3gGVwv8n/Ax4YE
	8QdmxTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfxc-00000005FmF-1Nd0;
	Tue, 15 Jul 2025 13:44:44 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubenv-000000054bj-1hM6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:30:40 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B2001F7A4;
	Tue, 15 Jul 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=GDxaNOaZqAGFlkzCJDe+JzEsaNKUmX1pxuAMWZ43n7B/3CPqoPS9VAx/bfAyIGFJ5Cae6Y
	z6AS0d1pM1y7QRtSG4NA9mgyDp1bwGwERdIx+Kq8rxU61531mdjCYT0sCmMrF2tSLxYcIO
	s85e925G7OZQpHXc7KX/InljsrZon+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582602;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=A5KgqXA3cgstpR5H8MbCEvZ6GNzMQIqVXNge3bcbD7M020j8IzEEbB/lzhPEBqrOTae+tK
	Hf7MeBY5b6JVdFCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KuI8GJks;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ynBfnVH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=KuI8GJkspX4xamZxa5n9JtrrgRXqkzY90+Xu7R7giB75X/jWBJLrx0G1ZjbiL3uXmehWnl
	EbA1+ds6AkxrDCn/8/mxG2yNsFElwEj0TOtpKoNTqacxua9VzZK+ChBikJPbqcGNWoUbW2
	6+Pd8sKOM+MWKf5rZmen3KOVut2rVK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=ynBfnVH9IeVNT2PvvTiq5RfFV+Rq88Y8ejdkE9NF8WX5xS3r3MER2D41qbFmExFWcVE2dH
	5am5mjPcceZHdADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F6C113306;
	Tue, 15 Jul 2025 12:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IK7pFchJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:30:00 +0000
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
Subject: [PATCH v2 10/15] backlight: jornada720: Include <linux/io.h>
Date: Tue, 15 Jul 2025 14:24:47 +0200
Message-ID: <20250715122643.137027-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715122643.137027-1-tzimmermann@suse.de>
References: <20250715122643.137027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TAGGED_RCPT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	R_RATELIMIT(0.00)[to(RLpx6hatunazuh7ud675imbh78),to_ip_from(RL95szse9eqfwu74ziohs8j73e)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Queue-Id: 0B2001F7A4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_053039_733976_F06B15A9 
X-CRM114-Status: UNSURE (   9.26  )
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

Include <linux/io.h> to declare IOMEM(). Avoids dependency on
backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/jornada720_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/jornada720_bl.c b/drivers/video/backlight/jornada720_bl.c
index e28d2c071798..bbb65fdaddc7 100644
--- a/drivers/video/backlight/jornada720_bl.c
+++ b/drivers/video/backlight/jornada720_bl.c
@@ -7,6 +7,7 @@
 
 #include <linux/backlight.h>
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.50.0


