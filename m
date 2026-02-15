Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D11FEF586D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6+sQXT3njLPQ8KohNJXrXJPRvqzIkn4onxixnNBYnA=; b=K7YwFt25DzOtuvIkvKBhP61s2O
	zyGQRqYdhw6IOCDMqiVNfU37Z57rQWI9xEHroGArpY/sSgdRr2+duGJZAeFn2ky6cSexz7Mb5tZJr
	wX5d0wcTmYq6UoTx5T6lP+S3Wd9pn+zUjq28B+qUYoBRq+CMM+xmX2D/FCJax7/K5lUcwAsi671d8
	E4T/vB/ot+mxnSnvQcqIyhi+LWwFpiayUKzwVScwxAIhuYTig2TRkmjOf92eI86VyLwaC+8fOMVVB
	g8L0Ef4dNrydtjeakawgt8IzhmlhIMno41lR9A6re50niTVN+YuLIsTgrysNn5SMAk967763xMDr/
	32xeS+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrYzD-00000005JoZ-0D8M;
	Sun, 15 Feb 2026 10:04:19 +0000
Received: from forward100a.mail.yandex.net ([2a02:6b8:c0e:500:1:45:d181:d100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrYz9-00000005JlZ-3GQ5;
	Sun, 15 Feb 2026 10:04:17 +0000
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id AAC16C01C8;
	Sun, 15 Feb 2026 13:04:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id j3UBeWUGPiE0-iAOvSvzo;
	Sun, 15 Feb 2026 13:04:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1771149849;
	bh=U6+sQXT3njLPQ8KohNJXrXJPRvqzIkn4onxixnNBYnA=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=SP34syZG9uV727kbJf1JQvSVgQLRscDxQmMfQtPTHeLozEOJQB3pti7TZVN7eO9zF
	 RbQm8ahOD2m4Is1UJw8plbFw493oqiuzGjQSWPRaRNf+QjdAmJv53yGJNqFz7nW5hq
	 aNThQjzcQhrlLaJhUP5AGzWQJxF6tRHJTdF3G6U0=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Date: Sun, 15 Feb 2026 13:02:51 +0300
Message-ID: <20260215100302.136719-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
References: <20260215100302.136719-1-work@onurozkan.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_020415_997667_3CB7214F 
X-CRM114-Status: GOOD (  11.28  )
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

If sram-supply is missing, Panthor falls back to a
dummy regulator with a warning. This implicit behavior
hides missing DT wiring behind regulator core fallback.

Make SRAM handling explicit: require sram-supply for all
Panthor compatibles except mt8196-mali where GPU supplies
are intentionally managed outside Panthor and DT does not
model sram-supply for that compatible.

This keeps DT power modeling explicit and avoids relying on
dummy-regulator fallback.

Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2249b41ca4af..5f6075f18fe3 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	 * But without knowing if it's beneficial or not (in term of power
 	 * consumption), or how much it slows down the suspend/resume steps,
 	 * let's just keep regulators enabled for the device lifetime.
+	 *
+	 * Treat sram-supply as mandatory except for mt8196-mali. It manages
+	 * SRAM outside Panthor so this driver must not require direct control
+	 * over it.
 	 */
-	ret = devm_regulator_get_enable_optional(dev, "sram");
-	if (ret && ret != -ENODEV) {
-		if (ret != -EPROBE_DEFER)
+	if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali")) {
+		ret = devm_regulator_get_enable_optional(dev, "sram");
+		if (ret) {
 			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
-		return ret;
+			return ret;
+		}
 	}
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-- 
2.51.2


