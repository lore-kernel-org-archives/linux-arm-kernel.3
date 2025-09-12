Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BA5CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8sOpy/rAktuTLkSbEosXeREaQf1wLgvwiE0AeRcq3g=; b=A67l3/rHrZuJxj5YbGxyvDPS9W
	CcTEeaQ1/fuBUF95I+MgFWUMu9RAW4R0Ql0jSd8GGTScizMvnvOQDqwxFSTpUe4eX7IWmpfhQxZmf
	/X+rACk3ZZ3LTW2Uo6Dt0W6kTDnuyT+gKi6WBEhxsGKYs8II0S8Vgto1DXMAfbMlFcuNCl+9peswP
	3UieDuEK9i6chRbAkbDidqUKO/D2PDu3oZ8BJ0ndcCjaZ5eGMZVI8G7yqQHT6r3s01V9vppTS3OD7
	nc2jBTs84gc6/Pcv8SpQsEmwW6VJtIysKNEB1vGfKBXT5fx+gxQX6FcDv034w1nx0G7UA6bxDtuvw
	+ac0Og+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fQ-0000000B2pG-1XYP;
	Fri, 12 Sep 2025 18:38:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8fL-0000000B2ih-1BGV;
	Fri, 12 Sep 2025 18:38:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757702303; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a4tRqvqtJl9R9hCDCmWgA92dpDyvjYyxf5bZaBZnzumlk0K88olDl3cj8sv/AQN9MiDYQfW0cDu+xcB5YOR1fcYGMTLCMw2m6842DX09giz3fTARjh3/LHZTuiFKzt8ZZ+xTMINw5l8v819T1To1eG9OIq48c+o4MQIwWW/s6T8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757702303; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C8sOpy/rAktuTLkSbEosXeREaQf1wLgvwiE0AeRcq3g=; 
	b=Vxv4qnF4/hRnA6gggJC60iOILrka4iiIG5PRNxo4Rkbhbf9YYw4y3pp+VS0NzRGELT6sHnSjWZKLHDyAoCXdWKibFNk7+TIvIt/UzHJiAVNAB4Pu9tl1/f0A6J6AXooiI2dISM9mnJ/Rf6E+Es5kxLIMbKPBEeklHfZRKjIzF/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757702302;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=C8sOpy/rAktuTLkSbEosXeREaQf1wLgvwiE0AeRcq3g=;
	b=OpQH0mzJjlgF2SVIxCZOAbCy5K9FFiQZ+cLHOXqHG0zoq/rJbknktGNta9M0deEi
	noAbDTS8LSGEusGxWsg/XWY/o8DcTBrGs/af3v5pU1KytBZrfKFle3YvCIMZAj2o3ly
	lFik1GOirgeAWXVfZIID3uWgK0Ruj4ZUQI6qx58U=
Received: by mx.zohomail.com with SMTPS id 1757702302096356.60938068660244;
	Fri, 12 Sep 2025 11:38:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 12 Sep 2025 20:37:07 +0200
Subject: [PATCH v2 08/10] drm/panthor: devfreq: expose get_dev_status and
 make it more generic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-mt8196-gpufreq-v2-8-779a8a3729d9@collabora.com>
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
X-CRM114-CacheID: sfid-20250912_113835_470158_48BD7A89 
X-CRM114-Status: GOOD (  15.66  )
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
 drivers/gpu/drm/panthor/panthor_devfreq.c | 11 ++++++++---
 drivers/gpu/drm/panthor/panthor_devfreq.h |  3 +++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 02eb3ca15d1874e1cbafc6b614b196c5cc75b6a1..34b621b155f1324ba4f0a07c981da669d945a545 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -50,14 +50,18 @@ static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
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
 
@@ -79,6 +83,7 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
 
 	return 0;
 }
+EXPORT_SYMBOL(panthor_devfreq_get_dev_status);
 
 static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
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


