Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CF7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf+5I4mtvTjsPy4fCTVlt4edYy7KKeLFbDhcyqxDQRQ=; b=HeGEOJO+M1PoXs20yPjm6GBXNL
	pjCdwCHW7R1yxJ27t/bwYprKZiM59mn4/WBefa3jrFMnfDOijSjj1308nBMSGY/3+bTJ1Lj5RTYHB
	voconC1NusJRJ9QeAJpM+wlkXAWa0PDFNPcD48rFwmkM0ReXDuAepqvIhATLJE2C4sK7owhmYMIsY
	wDmwcl8XlZcTf/ZoEhHoxcZ0NiHIgxr4sO4w2bo28K24dIVANlhSt4yb7Ti0WYDt8QNMDoWFinVOd
	KlJRbXXcWdrfbUfOuW9oxLRvnvHFFAT0nKZEFeir6VR8d0Vozp6g1pqYtoCE9xq4tDB83DxM6t1KN
	eVGoMxWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmJN-00000005tjh-3bc4;
	Fri, 31 Oct 2025 10:24:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmJH-00000005tgk-3GkK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 31 Oct 2025 10:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Sf+5I4mtvTjsPy4fCTVlt4edYy7KKeLFbDhcyqxDQRQ=; b=DprEZFCnqdVYLroIRdpDb5NQWE
	H/SfUflqiOMNyBK1l4l8NzvVw7KP721sSupMSWI/RnQ+h+JQGWtSJkLJcGmXBSUMaMQb1gMDcc9WG
	LNKNtNuW7/vH4MA3QsxugPpFvEndVokKRL0r77Oq4qV3tJNoHnpqD2zCl5oaUc0+rnzehDzxEaV8r
	YtSOPbz0PLievqd6KQ0eOg/yM0DbytVdA5I/f1bRFP+0IYzDr5l00t40xOtVJo9BrMcS8LeZ6XIwM
	v6/Iy1afqHeAtwm3SblgJFf0e9+8RX5A72Gx2lkCX1jAoFXc9iuXZU5zHYvB7umyTdVEQE3pP5KH1
	5LLL8f5Q==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElRW-0000000B1FY-05qb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 09:29:11 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 810F1227EC;
	Fri, 31 Oct 2025 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761906271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf+5I4mtvTjsPy4fCTVlt4edYy7KKeLFbDhcyqxDQRQ=;
	b=yb6WFp/DfHYJGuVdrE0OGeXJmNponGg21GqYaXiUUljCOJYPZ4ER1GJHvcM9AEkL5Ui6ea
	Ykxp97Zw379SCWwITZKLQUDZo0BElZUnuNn1DpNKIIrvl3EE3GxCeVXZWL+GEIcM8fI+gT
	fbn+A7ZRWCVDM6Q9xQgpY6ph8k9993A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761906271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf+5I4mtvTjsPy4fCTVlt4edYy7KKeLFbDhcyqxDQRQ=;
	b=vAkH915oxmaBRl2raFJYsan+FYACQDgCibo+bjtsK3Yg+S1Mrvx3UdWsb5gN/vLuDIgk+u
	BOg6knv8hptheXDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761906271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf+5I4mtvTjsPy4fCTVlt4edYy7KKeLFbDhcyqxDQRQ=;
	b=yb6WFp/DfHYJGuVdrE0OGeXJmNponGg21GqYaXiUUljCOJYPZ4ER1GJHvcM9AEkL5Ui6ea
	Ykxp97Zw379SCWwITZKLQUDZo0BElZUnuNn1DpNKIIrvl3EE3GxCeVXZWL+GEIcM8fI+gT
	fbn+A7ZRWCVDM6Q9xQgpY6ph8k9993A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761906271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sf+5I4mtvTjsPy4fCTVlt4edYy7KKeLFbDhcyqxDQRQ=;
	b=vAkH915oxmaBRl2raFJYsan+FYACQDgCibo+bjtsK3Yg+S1Mrvx3UdWsb5gN/vLuDIgk+u
	BOg6knv8hptheXDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D09C513A1F;
	Fri, 31 Oct 2025 10:24:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QI9oMV6OBGlqEgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 31 Oct 2025 10:24:30 +0000
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
Subject: [PATCH v2 1/4] pmdomain: bcm: bcm2835-power: Prepare to support BCM2712
Date: Fri, 31 Oct 2025 12:24:20 +0200
Message-ID: <20251031102423.1150093-2-svarbanov@suse.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251031102423.1150093-1-svarbanov@suse.de>
References: <20251031102423.1150093-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,broadcom.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,linaro.org,gmail.com,gmx.net,suse.com,raspberrypi.com,suse.de];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	R_RATELIMIT(0.00)[to_ip_from(RL7mwea5a3cdyragbzqhrtit3y)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_092910_363436_CE336156 
X-CRM114-Status: GOOD (  14.61  )
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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


