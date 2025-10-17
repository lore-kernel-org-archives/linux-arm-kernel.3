Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B454CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yOELnPraOHG4rpw5A06azpzhjqHyhFImhx6f4OO8Aw=; b=B4lh4Me1FQc30KC8LYZZXsE670
	XkrVmdtebkQEsXuQ8YGVuSfnYDZLLLSKc94LMJtXzoe5JssmwulKZJ0wmGOxtjDhb3KlEBXz5Cbog
	YIOlUExoNf5BQoG6TyG3YUnId8dF1bhBRbZgR4Rf/BOmZGcp9/KjT0L1EfWbsgHg/KwJgVuwbz24W
	b55mNh+rinKLg+7PqykmHReT9xN7WNbRPaM/fDKxXvwt0urjNksh/Q7uU0k0ck2Oc/u9PCR5ClVPz
	1JIZ+hFyJwuuVLBHR3QOtK+j6CT8Y9m4AH9pDAiHS6K4rY2HuLMagFSM+s7FJQf1L6GGAuSD2flj4
	Hx9mbDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mRE-00000008HHW-2Vqv;
	Fri, 17 Oct 2025 15:32:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mRC-00000008HEZ-1QCW;
	Fri, 17 Oct 2025 15:32:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760715119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HtS7KfK859OPjcVOa4NDLnu5LU6Yrr4pqbelxq8+obwvH+ZFFmT1jETGp7XQLOZFDwwG2iK0WbmmMREKfLuOl7FSOdbgBXxrqtM+50qsNAH1NP+8kqK7kJd/tz7Fr79mmd9vDJ14oSE2Um5ZVX5/VeFoZBCHABQ4FJ0RiqnO7sY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760715119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8yOELnPraOHG4rpw5A06azpzhjqHyhFImhx6f4OO8Aw=; 
	b=Rxu/YqNUq1N9yWGlJDtGT1udUw/Qf2lEcZ4O5fWVnrRZ4qPfbaWwT7CP/kKz2DwQN4nOmmOOUrzUDPRsv4cNYr92hE6TiCzWogkCGlARBYLzI73GeDd2Yp9jYrg6khykjyCLxFIGlUUJuqT9Mp46/uzwmtxEPYSQUlqqM3XU6OU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760715119;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8yOELnPraOHG4rpw5A06azpzhjqHyhFImhx6f4OO8Aw=;
	b=KuCr1cStpf8NkZhrzQ/qWXrGulCmeXqF0bj0YLe6qJyxTj7TEmJaL4+mkfjaawbj
	97e0lh0PYnbCJmCoY/iCWLr0xw9uEjjm7SIXxSWpBO+V3jJltTNL5yjbxsZYiwWvqsz
	6/SdUVC/WKzsMOaGe5KBuaACnzl8pESdpDzDdrn8=
Received: by mx.zohomail.com with SMTPS id 1760715118219640.0245019859688;
	Fri, 17 Oct 2025 08:31:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 17 Oct 2025 17:31:11 +0200
Subject: [PATCH v8 4/5] drm/panthor: Use existing OPP table if present
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-mt8196-gpufreq-v8-4-98fc1cc566a1@collabora.com>
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
In-Reply-To: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
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
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_083214_433309_3EA53201 
X-CRM114-Status: GOOD (  14.43  )
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

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index a6dca599f0a5..ec63e27f4883 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -141,6 +141,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	struct thermal_cooling_device *cooling;
 	struct device *dev = ptdev->base.dev;
 	struct panthor_devfreq *pdevfreq;
+	struct opp_table *table;
 	struct dev_pm_opp *opp;
 	unsigned long cur_freq;
 	unsigned long freq = ULONG_MAX;
@@ -152,17 +153,30 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	ptdev->devfreq = pdevfreq;
 
-	ret = devm_pm_opp_set_regulators(dev, reg_names);
-	if (ret && ret != -ENODEV) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-		return ret;
+	/*
+	 * The power domain associated with the GPU may have already added an
+	 * OPP table, complete with OPPs, as part of the platform bus
+	 * initialization. If this is the case, the power domain is in charge of
+	 * also controlling the performance, with a set_performance callback.
+	 * Only add a new OPP table from DT if there isn't such a table present
+	 * already.
+	 */
+	table = dev_pm_opp_get_opp_table(dev);
+	if (IS_ERR_OR_NULL(table)) {
+		ret = devm_pm_opp_set_regulators(dev, reg_names);
+		if (ret && ret != -ENODEV) {
+			if (ret != -EPROBE_DEFER)
+				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
+			return ret;
+		}
+
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return ret;
+	} else {
+		dev_pm_opp_put_opp_table(table);
 	}
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return ret;
-
 	spin_lock_init(&pdevfreq->lock);
 
 	panthor_devfreq_reset(pdevfreq);

-- 
2.51.0


