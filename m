Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9ABCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4HeLsqQkxYMFBGbd7yqW5+Knlu8wBpEGVr5F1LFIZYI=; b=atNnEHwwVp5lGWtrJKyUdGKd5Y
	dQ/jwRTDnl36XLVRVq4kUWwAJNr6xh/vWEhPyrinuAnXrAp0fPF88yrFpzgqv1/ZQuFQBWAwmiSjw
	23RDd9v2bcvo7BHnAYp9oOMRRGeDG01dsBXlLeHDNMAMLiSrFq+4gc6uWdLfBD1cZh+sc1fCWoXEZ
	OJ43ncfBdhzj8CWhPzoGXWaZY6Ie99xApsLRCmQQ1U7lpt2PAnnNNz1ebX2M7oGpCpTPZPVJ2WTWY
	bqHnCAauoXZAhfKONtiGG6s75lQ1Mvtg2kFCgAPPP+91au1ey+8XmCJwgVq1/EmqA5pC0RjFETVY5
	Jx0fpWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YYC-000000058oj-48Ct;
	Tue, 30 Sep 2025 11:29:44 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YYA-000000058oF-1Lu5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 11:29:43 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4BABB1F7D0;
	Tue, 30 Sep 2025 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759231778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4HeLsqQkxYMFBGbd7yqW5+Knlu8wBpEGVr5F1LFIZYI=;
	b=aQqG2ZTccOS9YvnXvvrtflyE4UgwkjiTfDoaXd/w+Lfdvo2VgR4jBcSszyB8gAOdFPUea5
	EK0lePyDkt4L1lX6S3jHp1IijoPwqv937IuZ4zACBAf39aqmohoE2yiBSFaiZKrE4xyVBA
	JI1bOMR1iZjFyjhKOahP49WqYpKckUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759231778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4HeLsqQkxYMFBGbd7yqW5+Knlu8wBpEGVr5F1LFIZYI=;
	b=h9htynst4zxGPMTouXx/mRawmprWw4tjNrFYWD43AEoB1lVKrU4AAgIEk9gQWiPsmlevll
	9UnDnSs6rh3MDjDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aQqG2ZTc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=h9htynst
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759231778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4HeLsqQkxYMFBGbd7yqW5+Knlu8wBpEGVr5F1LFIZYI=;
	b=aQqG2ZTccOS9YvnXvvrtflyE4UgwkjiTfDoaXd/w+Lfdvo2VgR4jBcSszyB8gAOdFPUea5
	EK0lePyDkt4L1lX6S3jHp1IijoPwqv937IuZ4zACBAf39aqmohoE2yiBSFaiZKrE4xyVBA
	JI1bOMR1iZjFyjhKOahP49WqYpKckUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759231778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4HeLsqQkxYMFBGbd7yqW5+Knlu8wBpEGVr5F1LFIZYI=;
	b=h9htynst4zxGPMTouXx/mRawmprWw4tjNrFYWD43AEoB1lVKrU4AAgIEk9gQWiPsmlevll
	9UnDnSs6rh3MDjDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC9971342D;
	Tue, 30 Sep 2025 11:29:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SNH8NyG/22gzHQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 30 Sep 2025 11:29:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] ARM: spitz: Do not include <linux/fb.h>
Date: Tue, 30 Sep 2025 13:26:46 +0200
Message-ID: <20250930112651.87159-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4BABB1F7D0
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_042942_508980_B84AA655 
X-CRM114-Status: UNSURE (   9.51  )
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

This ARM architecture's source file does not require <linux/fb.h>.
Remove the include statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/arm/mach-pxa/spitz.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.h b/arch/arm/mach-pxa/spitz.h
index 04828d8918aa..873844194a31 100644
--- a/arch/arm/mach-pxa/spitz.h
+++ b/arch/arm/mach-pxa/spitz.h
@@ -12,7 +12,6 @@
 #endif
 
 #include "irqs.h" /* PXA_NR_BUILTIN_GPIO, PXA_GPIO_TO_IRQ */
-#include <linux/fb.h>
 
 /* Spitz/Akita GPIOs */
 
-- 
2.51.0


