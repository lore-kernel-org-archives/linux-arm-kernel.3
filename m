Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89A2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVmMD7elwQv8n1BlEJAOh1USBe7E/nc4/WlOvcEJFpw=; b=VFQzZcmmbsck47s/16SjJ3OtrN
	PIkfX8by9AZe15DcOCsJ0XsgGXdMQvpjKX92Po9i62aRaALrZJOehk/GnWiQHtbNDGlW82NAcoKnA
	Lo4tN43OkFcHACkX1+1Dc7YW8OACZCGnf4aGboEEe7Qje5ZIsoAzCwZlxJgoOL57qvd+UD0Fjk300
	fxdCzkDDkZ2RmMkH2foN433LRbU758Kq/BAT38XysR/3jYv8f7Az8gv3LMicyzQsCxsLJt4blusTH
	2FMDgN9k6HmmdLaH+HTTdOr8NM/nWHcZ4rg2BanVJabiOdsYudfbOJz39FmZ2Eb6eQ+dejeQWycPw
	oPdroZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qc0-00000006DZ5-2UZE;
	Thu, 09 Oct 2025 13:23:16 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qbx-00000006DVD-3CCN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 13:23:14 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D16C51F7E1;
	Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7916313AA6;
	Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGdeHC+352iECAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Oct 2025 13:22:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/log: Add free callback
Date: Thu,  9 Oct 2025 15:16:30 +0200
Message-ID: <20251009132006.45834-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009132006.45834-1-tzimmermann@suse.de>
References: <20251009132006.45834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: D16C51F7E1
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_062313_941346_2D3F175A 
X-CRM114-Status: GOOD (  12.06  )
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

Free the client memory in the client free callback. Also move the
debugging output into the free callback: drm_client_release() puts
the reference on the DRM device, so pointers to the device should
be considered dangling afterwards.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 116e0ef9ae5d..470df4148e96 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
 	}
 }
 
-static void drm_log_client_unregister(struct drm_client_dev *client)
+static void drm_log_client_free(struct drm_client_dev *client)
 {
 	struct drm_log *dlog = client_to_drm_log(client);
 	struct drm_device *dev = client->dev;
 
+	kfree(dlog);
+
+	drm_dbg(dev, "Unregistered with drm log\n");
+}
+
+static void drm_log_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_log *dlog = client_to_drm_log(client);
+
 	unregister_console(&dlog->con);
 
 	mutex_lock(&dlog->lock);
 	drm_log_free_scanout(client);
 	mutex_unlock(&dlog->lock);
 	drm_client_release(client);
-	kfree(dlog);
-	drm_dbg(dev, "Unregistered with drm log\n");
 }
 
 static int drm_log_client_hotplug(struct drm_client_dev *client)
@@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
 
 static const struct drm_client_funcs drm_log_client_funcs = {
 	.owner		= THIS_MODULE,
+	.free		= drm_log_client_free,
 	.unregister	= drm_log_client_unregister,
 	.hotplug	= drm_log_client_hotplug,
 	.suspend	= drm_log_client_suspend,
-- 
2.51.0


