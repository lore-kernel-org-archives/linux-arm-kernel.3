Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB444CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laH6VsELHp+YZ/QiMWE66EVtfbqvEoAjIyqzf+SaxQc=; b=2xtYKaUZoSBGizjWCDNGV9FJr+
	M0PNI10gKBkEsNzky/2CkKb4ry95kdtdDCV6tYHInhHldo8mFQ8i+FDvl3TwkLsDkN5iKaxb1j6M/
	P4uku0kGnHCmDqOFs2UI6fpcXV3mZo94mJkxqQyPlcCdYa5vMCkSv9bE9aId3XsTLbK83bNPtTVGi
	vVVav31zEAls46SCegkAFd/vZUuD1MQ6sY/S8ns4gQU2s1wHeLqlsiyGtIDpwwQ5KHgwD+uKhwxjc
	tbHtyLR/0Rh/ZDZfE7A9G+duWL/dDe7c3G8j+VbnSoaEeiVg5hHBWRH8c3vYXy+hI4FvOuAlM/UNz
	ZtJDQ6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mRA-00000008HDa-43Ef;
	Fri, 17 Oct 2025 15:32:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mR8-00000008HBq-3vIj;
	Fri, 17 Oct 2025 15:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=laH6VsELHp+YZ/QiMWE66EVtfbqvEoAjIyqzf+SaxQc=; b=biODnVOIXl/ZalovH3Ikg8MPN7
	rh4q9WLhW2q7C9n3fUzJwExgmYimzRIN7QwGMdB7p5pWeRwvhKfW0j0C6z7+dMkrOTpe7hNp6rqNC
	2p3sUSkirJq4KNudhTKbiL4phkoZ4TOx+nA3wQbgB/6jE4uzhUhmcHqBpEFZMikGxcGNkuPUgZjAP
	3mGC8nKN/hgtq29s4kIl/Nv0D//6KkhN9oUOXGf7ydvRFbIKcBZzCLSm85hBdc/oeREwXqfbKY/jq
	cgsXkfTybkPiwuotOe3Y7N6ot/vOJOwyl2b0m2MePnr7EoXpVcKJV2xaf82pEOalkMWIl5dDdOSnM
	Gu3mufUg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mR5-00000007gTx-2RCB;
	Fri, 17 Oct 2025 15:32:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1760715113; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nMHcwnjYn/1VqbLUtC+zUK564fuecXw2VqPQknoGUPabxzjSlvMMfe8pV3o5xf5TD7gPL9BghUpC54gjiQoE2nW7FC/V9R88xczZn6rPjDdug5PC/cL7XJVWS3il/PSKcbQWTseKeqbjU7ka2i2LK1wiwQ9KQT6EN6z73DsitJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760715113; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=laH6VsELHp+YZ/QiMWE66EVtfbqvEoAjIyqzf+SaxQc=; 
	b=ABxUIFciVepLvw6ty7bkhi5uEgdMVwTzKH1roNO7lwVdCDePkFbg4PKngz2Q4ne2P8Ox5E9HjFnVlWG22yshYRbEpJDAWPlRtyY8hXVQbOnC/u8EznCA/FABGzNyRrcM7WaHeMeNh/5XNnEmLHyj9kU6+qDWtYUgNqZNB7JdRtM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760715113;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=laH6VsELHp+YZ/QiMWE66EVtfbqvEoAjIyqzf+SaxQc=;
	b=ExXS/+yIy2n/qm5xmujpyGg0aMflqJGpYIyRHtjGQKUHL0GCiTLrv8K78gR5XO5o
	D9/hzg+SwZ554RbLpNi8o0S0f4u5htBGe2ijmiQdVRSyslXulYV1a0+Z63uqzsocLrX
	6XCOIbm9+osJh4jeJE2AvSnUp2p6Iyn7gBObfSnM=
Received: by mx.zohomail.com with SMTPS id 1760715111354334.72447358215334;
	Fri, 17 Oct 2025 08:31:51 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 17 Oct 2025 17:31:10 +0200
Subject: [PATCH v8 3/5] drm/panthor: call into devfreq for current
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-mt8196-gpufreq-v8-3-98fc1cc566a1@collabora.com>
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
X-CRM114-CacheID: sfid-20251017_163208_107434_8177DEFB 
X-CRM114-Status: GOOD (  17.82  )
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

As it stands, panthor keeps a cached current frequency value for when it
wants to retrieve it. This doesn't work well for when things might
switch frequency without panthor's knowledge.

Instead, implement the get_cur_freq operation, and expose it through a
helper function to the rest of panthor.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 30 ++++++++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_devfreq.h |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h  |  3 ---
 drivers/gpu/drm/panthor/panthor_drv.c     |  4 +++-
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2df1d76d84a0..a6dca599f0a5 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -62,7 +62,6 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 				  u32 flags)
 {
-	struct panthor_device *ptdev = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
 	int err;
 
@@ -72,8 +71,6 @@ static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 	dev_pm_opp_put(opp);
 
 	err = dev_pm_opp_set_rate(dev, *freq);
-	if (!err)
-		ptdev->current_frequency = *freq;
 
 	return err;
 }
@@ -115,11 +112,21 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 	return 0;
 }
 
+static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct panthor_device *ptdev = dev_get_drvdata(dev);
+
+	*freq = clk_get_rate(ptdev->clks.core);
+
+	return 0;
+}
+
 static struct devfreq_dev_profile panthor_devfreq_profile = {
 	.timer = DEVFREQ_TIMER_DELAYED,
 	.polling_ms = 50, /* ~3 frames */
 	.target = panthor_devfreq_target,
 	.get_dev_status = panthor_devfreq_get_dev_status,
+	.get_cur_freq = panthor_devfreq_get_cur_freq,
 };
 
 int panthor_devfreq_init(struct panthor_device *ptdev)
@@ -197,7 +204,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 		return PTR_ERR(opp);
 
 	panthor_devfreq_profile.initial_freq = cur_freq;
-	ptdev->current_frequency = cur_freq;
 
 	/*
 	 * Set the recommend OPP this will enable and configure the regulator
@@ -295,3 +301,19 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev)
 
 	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
 }
+
+unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
+{
+	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	unsigned long freq = 0;
+	int ret;
+
+	if (!pdevfreq->devfreq)
+		return 0;
+
+	ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
+	if (ret)
+		return 0;
+
+	return freq;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index b7631de695f7..f8e29e02f66c 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -18,4 +18,6 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev);
 void panthor_devfreq_record_busy(struct panthor_device *ptdev);
 void panthor_devfreq_record_idle(struct panthor_device *ptdev);
 
+unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_DEVFREQ_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 9f0649ecfc4f..f32c1868bf6d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -214,9 +214,6 @@ struct panthor_device {
 	/** @profile_mask: User-set profiling flags for job accounting. */
 	u32 profile_mask;
 
-	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
-	unsigned long current_frequency;
-
 	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
 	unsigned long fast_rate;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fb4b293f17f0..75898d83a207 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -25,6 +25,7 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>
 
+#include "panthor_devfreq.h"
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gem.h"
@@ -1519,7 +1520,8 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
 
 	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
-	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
+	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n",
+		   panthor_devfreq_get_freq(ptdev));
 }
 
 static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)

-- 
2.51.0


