Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF8BCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8/pa2LbEvgl9X3+G3QMRkcLt8ATvzwHE9Kdtn1XYAY=; b=XDeh6WMzcApdLX/JnhBJ/nbRqB
	N9Yh1gC5Px0BZV7B4XMHlyAYK2i6G/xaFGx7bGKxxC+qDn6ekf2DHDnrspKrNEYDN1JuVdy9hFQrT
	23FJX2Ke0/NnVF0Ifg+IatD38a8OzdxBEPwZaRog7lB8OqYggreJl2hwTerc62lvelu/iEqNW2+2P
	rINJ6gOYENTfSqCYZ3WCXYTeSCMAqGYOaPhceTnawiRRiaCXgGShmQ3yLgYcBj4gVuAX283XXjpB5
	cwM+0zfzNVvkplY6tRoymlkyKMDhanDoKU3K9BffWVLIkahdRzosZqVHK0WqB8S4XimEYGncEfle5
	R11fWNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylj5-0000000AKwO-1neZ;
	Wed, 17 Sep 2025 06:33:11 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uylj2-0000000AKu1-0rPC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 06:33:09 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1B7BF21E40;
	Wed, 17 Sep 2025 06:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758090785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8/pa2LbEvgl9X3+G3QMRkcLt8ATvzwHE9Kdtn1XYAY=;
	b=08NWMzMtc/jlbCJEQjlvsIIBGeLoITSpKwuy/pySyNuQt4TU8NtWW/X8grD+31YoV9zwpt
	jnQ53NvSWqGgYQTz3ql1ERDmI/B1ZxYfZFPoGJ/LeohDpinGN3l6YWJE9BsNXoEabBRVb8
	vHJf+QXS0mH8uZU1Npslt8RvOTYwqwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758090785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8/pa2LbEvgl9X3+G3QMRkcLt8ATvzwHE9Kdtn1XYAY=;
	b=E+Lx8joecgq7TJWKNCNvUEfqmM20ecji3WV5E7aK2Dc8C2AqveuVOnIgAsIhA5Kc5urHYj
	+VkUT0HpuspNmZAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758090785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8/pa2LbEvgl9X3+G3QMRkcLt8ATvzwHE9Kdtn1XYAY=;
	b=08NWMzMtc/jlbCJEQjlvsIIBGeLoITSpKwuy/pySyNuQt4TU8NtWW/X8grD+31YoV9zwpt
	jnQ53NvSWqGgYQTz3ql1ERDmI/B1ZxYfZFPoGJ/LeohDpinGN3l6YWJE9BsNXoEabBRVb8
	vHJf+QXS0mH8uZU1Npslt8RvOTYwqwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758090785;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8/pa2LbEvgl9X3+G3QMRkcLt8ATvzwHE9Kdtn1XYAY=;
	b=E+Lx8joecgq7TJWKNCNvUEfqmM20ecji3WV5E7aK2Dc8C2AqveuVOnIgAsIhA5Kc5urHYj
	+VkUT0HpuspNmZAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2170E13A63;
	Wed, 17 Sep 2025 06:33:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kOjbBSBWymiIXwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Wed, 17 Sep 2025 06:33:04 +0000
From: Stanimir Varbanov <svarbanov@suse.de>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Willow Cunningham <willow.e.cunningham@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: [PATCH 1/4] pmdomain: bcm: bcm2835-power: Prepare to support BCM2712
Date: Wed, 17 Sep 2025 09:32:30 +0300
Message-ID: <20250917063233.1270-2-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250917063233.1270-1-svarbanov@suse.de>
References: <20250917063233.1270-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_233308_392937_AD4409CA 
X-CRM114-Status: GOOD (  15.04  )
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

BCM2712 has a PM block but lacks asb and rpivid_asb register
spaces. To avoid unwanted results add a check for asb existence
during probe and also add a new register offset for bcm2712 to
control grafx_v3d power domain. The decision to use the new
register is implicit - if asb register base is null then the
driver is probed for bcm2712 (the other supported SoCs have
asb register space).

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
---
 drivers/pmdomain/bcm/bcm2835-power.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index f5289fd184d0..1d29addfe036 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -79,6 +79,7 @@
 #define PM_IMAGE			0x108
 #define PM_GRAFX			0x10c
 #define PM_PROC				0x110
+#define PM_GRAFX_2712			0x304
 #define PM_ENAB				BIT(12)
 #define PM_ISPRSTN			BIT(8)
 #define PM_H264RSTN			BIT(7)
@@ -381,6 +382,9 @@ static int bcm2835_power_pd_power_on(struct generic_pm_domain *domain)
 		return bcm2835_power_power_on(pd, PM_GRAFX);
 
 	case BCM2835_POWER_DOMAIN_GRAFX_V3D:
+		if (!power->asb)
+			return bcm2835_asb_power_on(pd, PM_GRAFX_2712,
+						    0, 0, PM_V3DRSTN);
 		return bcm2835_asb_power_on(pd, PM_GRAFX,
 					    ASB_V3D_M_CTRL, ASB_V3D_S_CTRL,
 					    PM_V3DRSTN);
@@ -447,6 +451,9 @@ static int bcm2835_power_pd_power_off(struct generic_pm_domain *domain)
 		return bcm2835_power_power_off(pd, PM_GRAFX);
 
 	case BCM2835_POWER_DOMAIN_GRAFX_V3D:
+		if (!power->asb)
+			return bcm2835_asb_power_off(pd, PM_GRAFX_2712,
+						     0, 0, PM_V3DRSTN);
 		return bcm2835_asb_power_off(pd, PM_GRAFX,
 					     ASB_V3D_M_CTRL, ASB_V3D_S_CTRL,
 					     PM_V3DRSTN);
@@ -635,10 +642,12 @@ static int bcm2835_power_probe(struct platform_device *pdev)
 	power->asb = pm->asb;
 	power->rpivid_asb = pm->rpivid_asb;
 
-	id = readl(power->asb + ASB_AXI_BRDG_ID);
-	if (id != BCM2835_BRDG_ID /* "BRDG" */) {
-		dev_err(dev, "ASB register ID returned 0x%08x\n", id);
-		return -ENODEV;
+	if (power->asb) {
+		id = readl(power->asb + ASB_AXI_BRDG_ID);
+		if (id != BCM2835_BRDG_ID /* "BRDG" */) {
+			dev_err(dev, "ASB register ID returned 0x%08x\n", id);
+			return -ENODEV;
+		}
 	}
 
 	if (power->rpivid_asb) {
-- 
2.47.0


