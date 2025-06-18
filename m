Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF23AC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQwxkK4m1uswVgPfIluVBcJFx2KSRyxdlqqRRWbCSxI=; b=O3KheYDm3aqssfkyHRQW5mStZK
	pJxmJmgBHvlEzqsmdiGoHwhvgRnXETpr9Dhb1UMUZIMTVXYafRGvnPU3h6DI8GyonZX6OAG/CmA7I
	AN4Zsoig+oocGwOZqdkRR698ra3Y19OPAQ50j3LsdcyQcFGgel188G81CUHZyMQGBzb3I2wfTAn+p
	Xc6GL8uwlDx+XLdG4BhV6+m5ylbJUi7C6L2w1ufnOx3npFRoFLDho94GwdQE9J8Xebc1EcbElUKLn
	fGjz0weVFW/RVQQsVjqlJHzNn9lElYeazR/cSd787xAtJZdcKmRc+4TQYxAQtCk6kfklyIVjr6J9Q
	XgWNKv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsz5-0000000AKRD-3DBY;
	Wed, 18 Jun 2025 13:37:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtY-0000000A7iR-3mBp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gQwxkK4m1uswVgPfIluVBcJFx2KSRyxdlqqRRWbCSxI=; b=oqoRncmhM7dlTVrDqiagUbX5Nb
	LOYULDeecaYCNOm+Uv/h1ACxHZkxPzP48P65yGt00HIksjCudk0Hk27LJV0EJRMxD1rByq+hDrCik
	RrMzrjrhMRsWZlWG2JwG1Z8CMJAbu16HEIgzqc97SoJ1KlYMDgwvoyb8VG8pwC8f/g1EO4I36EjWB
	bwH2g+hMhNm/pqhXK4KKVN45Z72dH96WfbeiggKThGqCs42Feo/8YuPwOPgJWO5tDNAx6rQCqqKMU
	I5Y2qnz0v2Xj6MGj68Il/dWg/GPk28hH3NEN0oVAe1mRy1KX5LO4G2mvHzxUQrftBZtJFK4ZVZZS2
	Xy6T83mQ==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtW-00000004219-2Ehn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:28:00 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC8011F7C6;
	Wed, 18 Jun 2025 12:27:38 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 265ED13721;
	Wed, 18 Jun 2025 12:27:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qDMrCLqwUmg4UgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:38 +0000
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
Subject: [PATCH 06/12] backlight: Include <linux/of.h>
Date: Wed, 18 Jun 2025 14:16:38 +0200
Message-ID: <20250618122436.379013-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122436.379013-1-tzimmermann@suse.de>
References: <20250618122436.379013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	TAGGED_RCPT(0.00)[]
X-Rspamd-Queue-Id: CC8011F7C6
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132758_718369_1A0466EC 
X-CRM114-Status: UNSURE (   8.12  )
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

Include <linux/of.h> to avoid dependency on backlight header to
include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 9dc93c5e480b..1e9b7e85d99a 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -16,6 +16,7 @@
 #include <linux/ctype.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 #ifdef CONFIG_PMAC_BACKLIGHT
 #include <asm/backlight.h>
-- 
2.49.0


