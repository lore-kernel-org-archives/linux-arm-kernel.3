Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC85CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tD2U/HmgJxBzAQZ2WANquFxFh0SXL7yoKMcGAmneX0U=; b=UrJB1EVXLfS6QU7xxQMKKsSuyS
	da9uE73fV1eGLqM+xpkpIJ49Luw+/ZNhw+Jnawo3hPL421rGGamRT3zLMUO6/FZUO4GHzdRS/vpGv
	VoDtFfSZAw70K3XagIzepFJneUdCf8YjRA5VUrMLSkl/OL/aJSujjpkHJkqLMS8u7cS6Dtb187Q1p
	sqMpOY65tyJPk9Cvx9Nl1549TombTSU6wTJ4reaYcbB89YgnnthCMkTqFAVZ7jaXjI2QPyvl93SGo
	RvAug4h7iazsvHit22Si4IMODOlXsjGGLwNMrM7cVmB9Hscjbib3qRAtPMCE6q/+q4mzvxa0Q2PCc
	Ep3xMIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXXy-00000002O1o-19cl;
	Fri, 05 Sep 2025 14:36:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTcS-000000012Ok-2W7C;
	Fri, 05 Sep 2025 10:24:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757067864; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SuKZyoAwUWFKn7sciDyOB8jFC5iUsDPyz1FIZCDW3txy+Etu6VXei2UlYaf2xP1b6iuMFawC5kuQWb6qkPckdr9nrd2vmO6yJXzhMturuRJHITt63B4b0ZXEUrCCPTaHjApx+p6kBfkI+/hahTQtaLMYZYMiQ8wLN0Yo6FrYBG0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757067864; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tD2U/HmgJxBzAQZ2WANquFxFh0SXL7yoKMcGAmneX0U=; 
	b=iIh7mWHrKVxtfKn+7B3Yue8FW+oUjHDd2rhTSpgKc9wNA8j6/ahUKmdP4PeIxPmc0ZVvopxUaW3W2kuTvFSLJAqOIhGf/KtKiGOsEBn1OG94Mkq5zHzDrKKoTZOZFcRrAkYIlBVXp86H6dG8S1j/LU35liFx1xj9ekpJSiDB7Ng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757067864;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=tD2U/HmgJxBzAQZ2WANquFxFh0SXL7yoKMcGAmneX0U=;
	b=UnSWHfAmPsF5kEJY2MbGAr+48Enh3MREpqtahzmiVGlxRHsL1q71jyFIHj2t5SDU
	YjkD/8HLaSCydf0d8i/Kz3zm0tZJZQJw53W8m9DUJ1+pGq54XJmIPwoBf4RgjcfQcwa
	lO3WXHv0FHzftQMGyraThzfVbusLsREmhbmlX5NY=
Received: by mx.zohomail.com with SMTPS id 1757067862443543.6422329389278;
	Fri, 5 Sep 2025 03:24:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 05 Sep 2025 12:23:04 +0200
Subject: [PATCH RFC 08/10] drm/panthor: devfreq: expose get_dev_status and
 make it more generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-mt8196-gpufreq-v1-8-7b6c2d6be221@collabora.com>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
In-Reply-To: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
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
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_032436_703241_CA3E83E1 
X-CRM114-Status: GOOD (  15.65  )
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

The only device-specific part of panthor's get_dev_status devfreq
callback is getting the clock frequency. All the other logic surrounding
what it does may be useful for other devfreq implementations however.

Expose it in the panthor_devfreq.h header file, and make it call back
into get_cur_freq instead of poking the common clock framework directly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 29 +++++++++++++++++------------
 drivers/gpu/drm/panthor/panthor_devfreq.h |  3 +++
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 02eb3ca15d1874e1cbafc6b614b196c5cc75b6a1..d495dd856299826c4bddc205087d8914d01d7fc4 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -43,6 +43,15 @@ static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
 	return err;
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
 static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
 {
 	pdevfreq->busy_time = 0;
@@ -50,14 +59,18 @@ static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
 	pdevfreq->time_last_update = ktime_get();
 }
 
-static int panthor_devfreq_get_dev_status(struct device *dev,
-					  struct devfreq_dev_status *status)
+int panthor_devfreq_get_dev_status(struct device *dev,
+				   struct devfreq_dev_status *status)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
 	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
+	struct devfreq_dev_profile *p = pdevfreq->devfreq->profile;
 	unsigned long irqflags;
+	int ret;
 
-	status->current_frequency = clk_get_rate(ptdev->clks.core);
+	ret = p->get_cur_freq(dev, &status->current_frequency);
+	if (ret)
+		return ret;
 
 	spin_lock_irqsave(&pdevfreq->lock, irqflags);
 
@@ -79,15 +92,7 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 
 	return 0;
 }
-
-static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
-{
-	struct panthor_device *ptdev = dev_get_drvdata(dev);
-
-	*freq = clk_get_rate(ptdev->clks.core);
-
-	return 0;
-}
+EXPORT_SYMBOL(panthor_devfreq_get_dev_status);
 
 static struct devfreq_dev_profile panthor_devfreq_profile = {
 	.timer = DEVFREQ_TIMER_DELAYED,
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
index e8b5ccddd45c52ee3215e9c84c6ebd9109640282..a891cb5fdc34636444f141e10f5d45828fc35b51 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.h
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
@@ -52,6 +52,9 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev);
 void panthor_devfreq_record_busy(struct panthor_device *ptdev);
 void panthor_devfreq_record_idle(struct panthor_device *ptdev);
 
+int panthor_devfreq_get_dev_status(struct device *dev,
+				   struct devfreq_dev_status *status);
+
 unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
 
 #endif /* __PANTHOR_DEVFREQ_H__ */

-- 
2.51.0


