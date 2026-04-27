Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEA7FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C0XFTVZm6nDhiD0bMo8SDFHEq9ueglfbqYEb/g+IqfE=; b=4RP/4zOe+yWQOitkB5lGId9P93
	R72iTTY2no07AnJ9YXQx8N8ml/S0N7F2D94uD602Gwm48YCtN9h+avhFlto5VZononop4mvuLAtXk
	50Ho/Bzd4StV9oHW7E00SrP56hKo2K9glNZNOdFAftPEsFn6OYE1578u8z9JaVscA6/iyV/Ru8l4B
	zLYWuLBDxzGcUuoIcoKudFRv9SYAsmpGra/7VRT/8FEk4u9HmUB35kgpn77eLPRi9Vi74NXgbljDK
	lDneurxyj+xsw2EAr+7ML83Xxa5XzqDfmklA+HIegs9NsZpLhz2qNOlo7INfQ7JP5NfHnO94z7ogA
	UuulGXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGhc-0000000GPLO-4AdV;
	Mon, 27 Apr 2026 07:48:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGha-0000000GPKn-1DF0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 07:48:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so122649575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777276100; x=1777880900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0XFTVZm6nDhiD0bMo8SDFHEq9ueglfbqYEb/g+IqfE=;
        b=WVNgzsn8SD9xHsIfu7LUJz6/apBWboWTNu7/MAifqt1TAUGxucoys7a4Ao+9jQcMMF
         FVi+xNcVe9D6zVcOQ3QQphCKEI0Zmtae03pi7Ee8/yapGTryL8x2HOg/pYmy+n0b3I6q
         BszdG+kbuOOjL5hjum026owAe7N5odfRIntHrXkZcbXyJK5BO5V1opN0JZE+tNZHbH7K
         bl3awPD+izB2OTwLFX5v2qBTJNcWns9tWDcWQq1LriZxeUqF0JykTRzhC0jtIT5WYStv
         xsChGdheD2uH6cqNCI8nAF0PemyIMsQLMyLsAaSHA9eXhj0l9eVWzgUcmniZ9wThZjFD
         d4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777276100; x=1777880900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0XFTVZm6nDhiD0bMo8SDFHEq9ueglfbqYEb/g+IqfE=;
        b=dbTX+RV6AV3nh1CFncmTlZsejTo5uNYIwZwaITJ5wCMiQqoqNMj4h/+N22Qhu7hhhl
         IIKJmIaZu10Gh2EWnBf0jneG8aYXDiuJpfa/21xmFUjnPXoaQQen7s0mMjbsQhZAKTtA
         H7OUgZhAVq7IYSpaFWyBZHtJbW5NLjH6yQLyo0wyldZJ4CvKgmk+t96LkOiv0Ex2NEtd
         wJsqLuG1ECN7rVhOYghGZaCIR6dDtiIr/SGcbM8WJl9WzEVrfs8BuA9MSETdPCcHAH+m
         PXkW2LfFB1gc3EmIBSHHi45j26iisbZcLXapJiuT4agkfl26vfFRYYuT4eEHWs1on7Rv
         26bg==
X-Forwarded-Encrypted: i=1; AFNElJ/tUELs1SbWKk8Hf9g/e0Pi+uzZg/unXRqxBDTDsNh38wE5HYmMWAjE4kA/mS+zosyiT18taAN4iImNCwZhUIY/@lists.infradead.org
X-Gm-Message-State: AOJu0YwROZL69CgnsiwmmhN6HSwuhuWTIcrDZIH7ciYhX4Rt+D9E6SE5
	AyGAqv5a/89yB9KAUoBuv7sbF1jiTMUoHMFCbGrEAlpJCnepjbgdw2yG
X-Gm-Gg: AeBDievpzQABC8eI9NkHUaGagQn2IhY0+75LBJwCvDwe4kYgCq0q4MbqIeUeReRAzSr
	QJAm696xi1oLzv5tK4L9pnkzf9V7d4o+jB8pyDKmIKA+CNPKkvX4ZWBCKSJWUxfN+xvw1ECKUD0
	6k8Qefuo7xx50gQPNyw3A6qLCAyQFQ+mi5O4wtP6j3WdRFNoxFi20grCbvAwf7HDc4XvIstZKBI
	Vk7xVS+pe615C2/oZ0PUP9MdqsjglbH6OgVQ8hqBJoVqz0w5A6kXYpMD4EO70gzBss1S/FmQGEA
	uJQUdN37ggBZewEqp2cyOJBg4ehOlvW09utjz+dzK1GuaneSj5EHrnqwdBgKROL2vdxzcPZ+yEH
	eBHMDplNTkyOruWOFLw6EMCzWUPM4tjOWoTR/ho9ncoy4eBhGIRUwnhXLWJMM/f7A5uACxpp/Jo
	6HU6Gm8tSd3tai3NXq/GSLpWjXbZ1VQ/Rpf8tY2qmurtYG4qcr7w==
X-Received: by 2002:a05:600c:5295:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-488fb77facemr578263265e9.21.1777276099604;
        Mon, 27 Apr 2026 00:48:19 -0700 (PDT)
Received: from vitor-nb (dsl-43-224.bl27.telepac.pt. [176.79.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1393f5sm718761025e9.9.2026.04.27.00.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:48:19 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	vishalm@ti.com,
	sebin.francis@ti.com,
	d-gole@ti.com,
	Devarsh Thakkar <devarsht@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] pmdomain: ti_sci: re-sync TIFS with genpd on resume
Date: Mon, 27 Apr 2026 08:48:03 +0100
Message-ID: <20260427074808.3244226-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_004822_360180_FEC1FF13 
X-CRM114-Status: GOOD (  18.93  )
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

From: Vitor Soares <vitor.soares@toradex.com>

When a device in a TI SCI power domain is on the wakeup path of a
wakeup-capable child, the suspend path skips genpd_sync_power_off().
No put_device is sent to TIFS and the domain's genpd status remains
ON.

TIFS powers off the hardware during deep sleep regardless, since it
was never informed to keep the domain active. On resume, because the
domain's genpd status is ON, no get_device is issued. The driver
then accesses registers of a powered-off domain, causing a
synchronous external abort (AXI bus error, ESR 0x96000010).

Commit 0b5fe1c4ab3c ("pmdomain: ti-sci: Set PD on/off state according
to the HW state") exposed this. Before, domain status was initialized
to OFF, so get_device was always issued on resume.

Add a .resume hook that queries the domain's state from TIFS and
re-syncs TIFS with get_device when genpd has it ON but TIFS has it
OFF. The hook is only registered when the is_on op is available,
since detection depends on it.

Move ti_sci_pm_pd_is_on() earlier in the file so it is available to
the resume hook.

Fixes: 0b5fe1c4ab3c ("pmdomain: ti-sci: Set PD on/off state according to the HW state")
Cc: stable@vger.kernel.org # 6.18+
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/pmdomain/ti/ti_sci_pm_domains.c | 66 ++++++++++++++++++-------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/ti/ti_sci_pm_domains.c
index e5d1934f78d9..ec976d77b818 100644
--- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
+++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
@@ -131,6 +131,23 @@ static int ti_sci_pd_power_on(struct generic_pm_domain *domain)
 		return ti_sci->ops.dev_ops.get_device(ti_sci, pd->idx);
 }
 
+static bool ti_sci_pm_pd_is_on(struct ti_sci_genpd_provider *pd_provider,
+			       int pd_idx)
+{
+	bool is_on;
+	int ret;
+
+	if (!pd_provider->ti_sci->ops.dev_ops.is_on)
+		return false;
+
+	ret = pd_provider->ti_sci->ops.dev_ops.is_on(pd_provider->ti_sci,
+						     pd_idx, NULL, &is_on);
+	if (ret)
+		return false;
+
+	return is_on;
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int ti_sci_pd_suspend(struct device *dev)
 {
@@ -149,8 +166,37 @@ static int ti_sci_pd_suspend(struct device *dev)
 
 	return 0;
 }
+
+static int ti_sci_pd_resume(struct device *dev)
+{
+	struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+	struct ti_sci_pm_domain *pd = genpd_to_ti_sci_pd(genpd);
+	const struct ti_sci_handle *ti_sci = pd->parent->ti_sci;
+	int ret;
+
+	/*
+	 * If genpd's domain state is ON but TIFS powered it OFF during
+	 * suspend, re-sync by issuing get_device before the driver resumes.
+	 */
+	if (genpd->status == GENPD_STATE_ON &&
+	    !ti_sci_pm_pd_is_on(pd->parent, pd->idx)) {
+		dev_dbg(dev, "ti_sci_pd: ID:%d genpd/TIFS out of sync on resume, re-syncing\n",
+			pd->idx);
+		if (pd->exclusive)
+			ret = ti_sci->ops.dev_ops.get_device_exclusive(ti_sci,
+								       pd->idx);
+		else
+			ret = ti_sci->ops.dev_ops.get_device(ti_sci, pd->idx);
+		if (ret)
+			return ret;
+	}
+
+	return pm_generic_resume(dev);
+}
+
 #else
 #define ti_sci_pd_suspend		NULL
+#define ti_sci_pd_resume		NULL
 #endif
 
 /*
@@ -200,23 +246,6 @@ static bool ti_sci_pm_idx_exists(struct ti_sci_genpd_provider *pd_provider, u32
 	return false;
 }
 
-static bool ti_sci_pm_pd_is_on(struct ti_sci_genpd_provider *pd_provider,
-			       int pd_idx)
-{
-	bool is_on;
-	int ret;
-
-	if (!pd_provider->ti_sci->ops.dev_ops.is_on)
-		return false;
-
-	ret = pd_provider->ti_sci->ops.dev_ops.is_on(pd_provider->ti_sci,
-						     pd_idx, NULL, &is_on);
-	if (ret)
-		return false;
-
-	return is_on;
-}
-
 static int ti_sci_pm_domain_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -283,6 +312,9 @@ static int ti_sci_pm_domain_probe(struct platform_device *pdev)
 				    pd_provider->ti_sci->ops.pm_ops.set_latency_constraint)
 					pd->pd.domain.ops.suspend = ti_sci_pd_suspend;
 
+				if (pd_provider->ti_sci->ops.dev_ops.is_on)
+					pd->pd.domain.ops.resume = ti_sci_pd_resume;
+
 				is_on = ti_sci_pm_pd_is_on(pd_provider,
 							   pd->idx);
 
-- 
2.53.0


