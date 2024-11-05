Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFEBD2C11B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jDTbP3fOcL51JRwWKzuxSqaxfANeDb0GcrNEPDR3wvk=; b=IG5G6uQoGLjv7kaK8U8HIBq3C+
	CTch/7d+T/zbZBIi7hXW+P7HYUlNQMSW4gcOHuvSxHMG8DNWIK84C6tKDRgoD2LOpruRELq7z8aTQ
	FyYupq0N/MOUNVwZbgDPdQ7WgDKNKrtrkxRrNtGX/BQN6N6DWV/AAIbZAKhmUkfu/Cqn1ZzNu+snE
	cQ3MJyfhS3ePa+Az+xU/KmfqQ7SENX+4B2Mbqh5aesZx0MPjWSEneyr8jet6994hG989sf32yktEa
	9M1PhVWf3B9jB3xazaTKxZEOpn8492soVeS0T7f2kIWpzEu4/I88fEUkaJnYkEx6RRvp2CVHcmFf3
	ie673j5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Kp1-0000000HKFg-0996;
	Tue, 05 Nov 2024 14:46:19 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jlp-0000000H9Sq-0zKP;
	Tue, 05 Nov 2024 13:39:00 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D3621FBB7;
	Tue,  5 Nov 2024 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730813933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jDTbP3fOcL51JRwWKzuxSqaxfANeDb0GcrNEPDR3wvk=;
	b=nOuwBvL5K/lCDQnI/N1/mRbLRzzhXWQgb5qAwOeEznFiYqssnz3sJYjP8pB/2ZJbzI0Mw8
	ub1PS+e2pktR/zrDZKDC1CUJ7M3i3ACQEhtTedIS0UP9MW+s1gaaZYc4KAgi7L9nPQGdVG
	yA7zgD9MXR21iPh+6ntx7SA/OFAXFwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730813933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jDTbP3fOcL51JRwWKzuxSqaxfANeDb0GcrNEPDR3wvk=;
	b=8cUUe5jSnqRzmRedg+YtmtB63W+fe91HG+PCahBKHkNSXve8vY3mP4rIVS+LmRPR1Fleu2
	M0vnLYsCggVYFLAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730813933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jDTbP3fOcL51JRwWKzuxSqaxfANeDb0GcrNEPDR3wvk=;
	b=nOuwBvL5K/lCDQnI/N1/mRbLRzzhXWQgb5qAwOeEznFiYqssnz3sJYjP8pB/2ZJbzI0Mw8
	ub1PS+e2pktR/zrDZKDC1CUJ7M3i3ACQEhtTedIS0UP9MW+s1gaaZYc4KAgi7L9nPQGdVG
	yA7zgD9MXR21iPh+6ntx7SA/OFAXFwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730813933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jDTbP3fOcL51JRwWKzuxSqaxfANeDb0GcrNEPDR3wvk=;
	b=8cUUe5jSnqRzmRedg+YtmtB63W+fe91HG+PCahBKHkNSXve8vY3mP4rIVS+LmRPR1Fleu2
	M0vnLYsCggVYFLAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC5BF1394A;
	Tue,  5 Nov 2024 13:38:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C/ubKOwfKmcuEQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 05 Nov 2024 13:38:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	groeck@chromium.org,
	zyw@rock-chips.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	stable@vger.kernel.org
Subject: [PATCH] drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
Date: Tue,  5 Nov 2024 14:38:16 +0100
Message-ID: <20241105133848.480407-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[rock-chips.com,sntech.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch,chromium.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_053857_450615_CB095BAB 
X-CRM114-Status: GOOD (  14.58  )
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

The code for detecting and updating the connector status in
cdn_dp_pd_event_work() has a number of problems.

- It does not aquire the locks to call the detect helper and update
the connector status. These are struct drm_mode_config.connection_mutex
and struct drm_mode_config.mutex.

- It does not use drm_helper_probe_detect(), which helps with the
details of locking and detection.

- It uses the connector's status field to determine a change to
the connector status. The epoch_counter field is the correct one. The
field signals a change even if the connector status' value did not
change.

Replace the code with a call to drm_connector_helper_hpd_irq_event(),
which fixes all these problems.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 81632df69772 ("drm/rockchip: cdn-dp: do not use drm_helper_hpd_irq_event")
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: <stable@vger.kernel.org> # v4.11+
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b04538907f95..f576b1aa86d1 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -947,9 +947,6 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	struct drm_connector *connector = &dp->connector;
-	enum drm_connector_status old_status;
-
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -1009,11 +1006,7 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-
-	old_status = connector->status;
-	connector->status = connector->funcs->detect(connector, false);
-	if (old_status != connector->status)
-		drm_kms_helper_hotplug_event(dp->drm_dev);
+	drm_connector_helper_hpd_irq_event(&dp->connector);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
-- 
2.47.0


