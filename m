Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB752CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esTzJAps+Q9ohTe0smajF9MVNFiYXLuAoXALxngs7YA=; b=D4kEB1q6AXDvZdg5/lwun1b0YJ
	9qbOueCobi6FyuRTt9vHtnXbE8lnuMZqRcTdAOr88UZgMz4whVTCD6fwihKkw1pDu1VFarGRfIue+
	HOx+jNIuL3NKwxZ0b0fmk7001Y0Ve97kYg5vnc8mRswJkUI2/mdUACih1+rwWRaAj2AXVz8sk6s1z
	FUUsoF4qjnW6Gr8XiXnFjIq9kqcq0vx4hB49hDYu5Fjm5Tzjon/IL7axmBuhtp+BvYCigmJPXBYt1
	JN31uOYIpn47sxNDzzW3DV90WvV6aGxJbiDEVDYiTFK7s0dkQ3DiYR4L8aqaZiRqdFE8ARo7JaDzz
	J5lSSY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fJ-0000000B2hk-4B5b;
	Fri, 12 Sep 2025 18:38:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fH-0000000B2dX-0PLZ;
	Fri, 12 Sep 2025 18:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757702297; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jYhju4p2xqEoKJTllo2yZ8ezc39M9zpj2Xqu/SFzebFUFnh2hHQcDybEkwpmJFNmOw2lNARHLKbxr9pokaxeMf7+gvlI5sPweHT/VbTlo86CUR96QUzZp+BqL+9Wrrg8XsLDWRw92MeTdUGAQKgpZz42fky5S5fcxiwlEwj4Cv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757702297; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=esTzJAps+Q9ohTe0smajF9MVNFiYXLuAoXALxngs7YA=; 
	b=WcooTMWQVaZyIQf92UQ+g4GRnK2nuXy2EVr9xOLco9ijmvKH00vLhi7NIRA7OUeG1hp0Sf3WccLxrQfjoTelrG5IYvfgFaIQajQiGHRjIAQPlmGzGctl7swiXwbkcJ5MuFo7xntBLNN6L0wVfktOucYFo0N6RflE6f5y/xPPnmg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702296;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=esTzJAps+Q9ohTe0smajF9MVNFiYXLuAoXALxngs7YA=;
	b=e/+Mq0lrdf4I9fFWBSoBwTEBFQvysct6QKYHYTBa8a/U9AUHkhm/+MHoFRiRehV2
	9MuxLF5eKdBav3TV4+Nu6aXYJc07t6uB7JVt1WNhFa6jn5Xz4SQYkHPyX2kW0k2FK48
	k5SB/WgzK+tTTRo6wiBRVyzQM41yaptoFWZAmJdU=
Received: by mx.zohomail.com with SMTPS id 1757702295104374.16826602133335;
	Fri, 12 Sep 2025 11:38:15 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:06 +0200
Subject: [PATCH v2 07/10] drm/panthor: move panthor_devfreq struct to
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-7-779a8a3729d9@collabora.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_113831_205265_16D3A903 
X-CRM114-Status: GOOD (  14.60  )
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

In order to make files other than panthor_devfreq.c be able to touch the
members of a panthor_devfreq instance, it needs to live somewhere other
than the .c file.

Move it into the panthor_devfreq.h header, so that the upcoming MediaTek
MFG devfreq can use it as well.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 32 ---------------------------
 drivers/gpu/drm/panthor/panthor_devfreq.h | 36 ++++++++++++++++++++++++++++++-
 2 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 8903f60c0a3f06313ac2008791c210ff32b6bd52..02eb3ca15d1874e1cbafc6b614b196c5cc75b6a1 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -12,38 +12,6 @@
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
 
-/**
- * struct panthor_devfreq - Device frequency management
- */
-struct panthor_devfreq {
-	/** @devfreq: devfreq device. */
-	struct devfreq *devfreq;
-
-	/** @gov_data: Governor data. */
-	struct devfreq_simple_ondemand_data gov_data;
-
-	/** @busy_time: Busy time. */
-	ktime_t busy_time;
-
-	/** @idle_time: Idle time. */
-	ktime_t idle_time;
-
-	/** @time_last_update: Last update time. */
-	ktime_t time_last_update;
-
-	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
-	bool last_busy_state;
-
-	/**
-	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
-	 * last_busy_state.
-	 *
-	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
-	 * and panthor_devfreq_record_{busy,idle}().
-	 */
-	spinlock_t lock;
-};
-
 static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
 {
 	ktime_t now, last;
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index f8e29e02f66cb3281ed4bb4c75cda9bd4df82b92..e8b5ccddd45c52ee3215e9c84c6ebd9109640282 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -4,11 +4,45 @@
 #ifndef __PANTHOR_DEVFREQ_H__
 #define __PANTHOR_DEVFREQ_H__
 
+#include <linux/devfreq.h>
+
 struct devfreq;
 struct thermal_cooling_device;
 
 struct panthor_device;
-struct panthor_devfreq;
+
+/**
+ * struct panthor_devfreq - Device frequency management
+ */
+struct panthor_devfreq {
+	/** @devfreq: devfreq device. */
+	struct devfreq *devfreq;
+
+	/** @gov_data: Governor data. */
+	struct devfreq_simple_ondemand_data gov_data;
+
+	/** @busy_time: Busy time. */
+	ktime_t busy_time;
+
+	/** @idle_time: Idle time. */
+	ktime_t idle_time;
+
+	/** @time_last_update: Last update time. */
+	ktime_t time_last_update;
+
+	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
+	bool last_busy_state;
+
+	/**
+	 * @lock: Lock used to protect busy_time, idle_time, time_last_update and
+	 * last_busy_state.
+	 *
+	 * These fields can be accessed concurrently by panthor_devfreq_get_dev_status()
+	 * and panthor_devfreq_record_{busy,idle}().
+	 */
+	spinlock_t lock;
+};
+
 
 int panthor_devfreq_init(struct panthor_device *ptdev);
 

-- 
2.51.0


