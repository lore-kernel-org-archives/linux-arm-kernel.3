Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5634EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfIwDLueUpdSLLQiafQ4ArRKWl+h2XDcNKHLfewAO8E=; b=jdin/k2PkYDO5pgJW6sRdEzSVr
	JXfjDBGm8xKj9Kl4CN72lv8zeepz2AIUP+/QlIP8dgrPCJufXtRK8tBj7x23HXNLjcEjC/1q294DP
	0v1kqzq9XctSFuGuI8kAfvAAO9zIAz78G8utyb5JVh34RnO22VjkqfRCdK2kX0Al5gmFwBWRaMSsP
	oOdeOZkZ7DqnS3Q/iW8YLKp8CtEuz+vU/1ZExZBHAaNNw26jApUqyLzMlhfslXEuE3/E1Sr/eUTQW
	Ab0bhsPSMGROHDjBKvT4ceB9ttoqJa03w4ZY1Ipzxw2XkKrkrnbbwneALzeY00ZsVaH+Kg0swKVpH
	kPDWihHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfso-00000005ExR-3buU;
	Tue, 15 Jul 2025 13:39:46 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubenm-000000054ZV-0z4n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:30:31 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5599621250;
	Tue, 15 Jul 2025 12:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfIwDLueUpdSLLQiafQ4ArRKWl+h2XDcNKHLfewAO8E=;
	b=fZP0dWCzbVasw5rkikeRR9v/UB3Qy1brvJl6bTF14MWV5UNnjSDc3J6x3S+gLxax+eHYrI
	QoQUNwb6H4/NsGRh8/4HyMsDK0rxFIs3CCB4r6yJ5QUbZYtQ1MXddZjEF3CfNWfTmUkRAa
	6UzQ8HGtttb5jlg1ntl4kHxRFML937Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfIwDLueUpdSLLQiafQ4ArRKWl+h2XDcNKHLfewAO8E=;
	b=76J/k3jKQo40f/90yjZH7qtWlJCciblfX+qiHezSGaPo4Kpxza6jrnllOlTct6GxjNVfrr
	MQiEdq+IIpApwfDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfIwDLueUpdSLLQiafQ4ArRKWl+h2XDcNKHLfewAO8E=;
	b=fZP0dWCzbVasw5rkikeRR9v/UB3Qy1brvJl6bTF14MWV5UNnjSDc3J6x3S+gLxax+eHYrI
	QoQUNwb6H4/NsGRh8/4HyMsDK0rxFIs3CCB4r6yJ5QUbZYtQ1MXddZjEF3CfNWfTmUkRAa
	6UzQ8HGtttb5jlg1ntl4kHxRFML937Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfIwDLueUpdSLLQiafQ4ArRKWl+h2XDcNKHLfewAO8E=;
	b=76J/k3jKQo40f/90yjZH7qtWlJCciblfX+qiHezSGaPo4Kpxza6jrnllOlTct6GxjNVfrr
	MQiEdq+IIpApwfDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B244613306;
	Tue, 15 Jul 2025 12:30:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mFAkKstJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:30:03 +0000
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
Subject: [PATCH v2 15/15] backlight: Do not include <linux/fb.h> in header file
Date: Tue, 15 Jul 2025 14:24:52 +0200
Message-ID: <20250715122643.137027-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715122643.137027-1-tzimmermann@suse.de>
References: <20250715122643.137027-1-tzimmermann@suse.de>
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
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc),to(RLpx6hatunazuh7ud675imbh78)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_053030_416923_2761C31F 
X-CRM114-Status: GOOD (  10.00  )
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

The backlight interfaces don't require anything from <linux/fb.h>, so
don't include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/backlight.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 10e626db7eee..f29a9ef1052e 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -10,7 +10,6 @@
 #define _LINUX_BACKLIGHT_H
 
 #include <linux/device.h>
-#include <linux/fb.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-- 
2.50.0


