Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205E0CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbudV7zMvsb7+FwxqOXJAvF7A++Xaqp/S1V/c8KvSeU=; b=z8VzIoq6k1Kytw/QQUIAQ3m3mO
	U60dW8AqJC0ctLnEcArE1Qm5DLs9WjxwYMdC/OVat7GRcFqcZpZMt9x+7F+ou8rRC4Rp3nkqL/i0/
	GoEsXd7y/SanaXSll7eZz5rclSOE0M4RXGFm1UtO6NqePCg1uwhfP3H5SnNuOKuXXYukPt+4a5Fl/
	UqVg64jXwKJ7x2mDa0naLd+q09Z1xWnz+8kR+HxjKJWDHTRm8uTKQ+VEwwo3zgP2jT+UuIneKKHuT
	jt/r13EBSbBUdW3QqLVqnYyeoXysvAzqXpE5Dk4c1foGDcKFaELUdPmPm3s9CobcE+ALEZ1Rg3Bnh
	PmTNMuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38cJ-00000001fgw-4Bfk;
	Mon, 29 Sep 2025 07:48:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v38c6-00000001fSK-1iOw;
	Mon, 29 Sep 2025 07:48:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759132069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FoRiGAIGT/7v/0dltpRht4Kuk9jX6tdrMbXgZ0LBA5Mme5Vqw8Eyy7W/2IgAykTvn7exkgG1lqoJaKiOySH7J2TawgTQSVg/KycFF6yNiUC9NBD+cAGu2qsUlcWK8JXRd5M3Al77cdlPpPA/D6NbOU7M/s5+Q8P3XmUmLfJkzbs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759132069; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mbudV7zMvsb7+FwxqOXJAvF7A++Xaqp/S1V/c8KvSeU=; 
	b=d3Vh/vgKQm0q0OhbRtSDZDnqvkeH1mSjyzVZgTHab4FI16fNgFB9NFuwMcEwocMPZQNntZtw3k6nBaW53FJp5A9Aht45FJl063wDKtNWUOYHDN9ItpLKi/cZccXGiuMQbbnYb9BOstHGiN0uH6kcacEyaoCSZ/bjjpCg09/dlls=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759132069;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=mbudV7zMvsb7+FwxqOXJAvF7A++Xaqp/S1V/c8KvSeU=;
	b=gn0qCYtyyNrucuj9Z4P+Aj7HyzDuHH6QvVUHqYaMNGPt2L75YpvZaXDjpdM3JiKo
	dL9M5hTTKGtDCkbcqd3cgDAYevcg4iv82qdSaXIPh88gAGWF2JTWwIYf1peQU7cIx/v
	LCpp7Ajn32AfTiyUyILHlr09Tnzi8LpF3rUmIdCs=
Received: by mx.zohomail.com with SMTPS id 1759132067051470.75211841634405;
	Mon, 29 Sep 2025 00:47:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 29 Sep 2025 09:46:49 +0200
Subject: [PATCH v5 6/7] drm/panthor: Use existing OPP table if present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-mt8196-gpufreq-v5-6-3056e5ecf765@collabora.com>
References: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com>
In-Reply-To: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_004802_503686_F2E31EC3 
X-CRM114-Status: GOOD (  12.26  )
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

On SoCs where the GPU's power-domain is in charge of setting performance
levels, the OPP table of the GPU node will have already been populated
during said power-domain's attach_dev operation.

To avoid initialising an OPP table twice, only set the OPP regulator and
the OPPs from DT if there's no OPP table present.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 8903f60c0a3f06313ac2008791c210ff32b6bd52..4ec46a67db7d4331ac31a249e41ee19378cd411e 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -143,6 +143,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	struct panthor_devfreq *pdevfreq;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
+	struct opp_table *t;
 	unsigned long freq = ULONG_MAX;
 	int ret;
 
@@ -152,17 +153,22 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	ptdev->devfreq = pdevfreq;
 
-	ret = devm_pm_opp_set_regulators(dev, reg_names);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+	t = dev_pm_opp_get_opp_table(dev);
+	if (IS_ERR_OR_NULL(t)) {
+		ret = devm_pm_opp_set_regulators(dev, reg_names);
+		if (ret) {
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
 
-		return ret;
-	}
+			return ret;
+		}
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return ret;
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return ret;
+	} else {
+		dev_pm_opp_put_opp_table(t);
+	}
 
 	spin_lock_init(&pdevfreq->lock);
 

-- 
2.51.0


