Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F37CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXVAe1dWQ6RcIxrCYaZLcSY7pOAxZ2fVsnnHaPgs7Gg=; b=VB89hmpWIG5suh3RNVtWI6tZ1y
	RXhEImXZIWhVF/AHX38933JOUIMoNLAS5Z5nuFn+ItVJtMFOLEhisjZXYlFTL/SYjDS3lF7njE8+a
	QPK53OCJ/rvu51iwwJtkJihTLwR6Xs1e82QuLhsykqShfLuUlBb9y0titlApPp/7mpSDt3NaBNYww
	ZAh73qKhTUoIl5KErXrbVXeMEYonrPVHQXcfliuVLRg91BpUy815ohaqf94fqhleH3XvPDxuQdFoa
	F36aTJZ10huKoADL/6qTdpkN7yR00TTdLPqt2uCwU6l4Jn0qYWmOEuGojjgZte7IiN6DTuXdgN1tL
	QnlUn0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrCe-0000000BJ9g-1MZ0;
	Wed, 17 Sep 2025 12:24:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrCb-0000000BJ6b-0afz;
	Wed, 17 Sep 2025 12:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758111828; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E0GmMoLQYTY/lItj4o7Nc87jRO1EvXAN3nVRtnhHzAo35cI31kfkzAi+Ae4jlID6v09cpkanZtuV0ll0NHJyFz+V8lXxRdaiB/9ZWJUR3RCclFJnQC1FwtKRTJEkhl7iB8uFJbUQtg5EkWy2MyasPkIh0POHXFq9VIpK+lEUD0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758111828; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dXVAe1dWQ6RcIxrCYaZLcSY7pOAxZ2fVsnnHaPgs7Gg=; 
	b=Pz+xwgA/7Bp4N/h1/+u0XbkRTmjCPprpAYIHrQQuAD7KvtiLzT0G8c7E+wRFghtOL/ylXhDOlsi07udI2rQz2fx1s6dnjpMZhx9ViE7IzJ5cJ5W2fs9aW2e+qvLXWCQMxzsYkK9/5avIYUHeAl1FSoXwrTf+W8wEl87AbLHKMXM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758111828;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=dXVAe1dWQ6RcIxrCYaZLcSY7pOAxZ2fVsnnHaPgs7Gg=;
	b=GgNnbVCPC2fk9cqeEumr2JnVNZTBTH8wYGM3+zpj8zylHIBDkmlY0LNuQ1WsQfch
	MdD6cc6Pz7xSWlbyU9fYdjtACjI02/hSTjMSF26uLGYtT+NC8yDxH7IUsC6AghW8uAm
	FlsqlTQpV0O4ljdUfow7Np1yVS9ch73Og9qsvXsU=
Received: by mx.zohomail.com with SMTPS id 1758111825910315.2626180686518;
	Wed, 17 Sep 2025 05:23:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Sep 2025 14:22:38 +0200
Subject: [PATCH v3 07/10] drm/panthor: devfreq: make get_dev_status use
 get_cur_freq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-mt8196-gpufreq-v3-7-c4ede4b4399e@collabora.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
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
X-CRM114-CacheID: sfid-20250917_052401_261990_92791979 
X-CRM114-Status: GOOD (  13.17  )
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

Make it call into get_cur_freq instead of poking the common clock
framework directly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 8903f60c0a3f06313ac2008791c210ff32b6bd52..118da7cbb3c809e4aabfef7d20914e61c2b62555 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -87,9 +87,13 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
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
 

-- 
2.51.0


