Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFA2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8buXX1p3SURBMsTZcHdbZSaeDVkNSZ0ppj4rFscaaHQ=; b=3stSJtFXHrCIk0CvkqUaZ7IXJZ
	vdzGs6JYR1b78+1U3bEYFaKhiq8BV8K+UasDJfFJtRl5D/R5rE5hICDmSaAeRJT7SUzvbnod8S30J
	Eyaf46b2JlLUGyDfSdh5fZUhE6ps60uX3cCySSAK1+xdUBClAIC19YVfqfLqmAxzJZHyLDaqDHrBe
	NjiRvpv4oyFqRgmoBkZILtziGxSSPieS9XDLYQP/Q6hyDEHXxb/ncbtOrsEBydz3666lDur/C/MIL
	lxhNKkL440J4av4bMjsOIDiKvE5J32sd8/05dmRGsAc9mk6B2C+E0efH2te6MQc4guNYOWxOkW1d9
	v5mkYsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9PX-0000000Eyg9-481t;
	Fri, 14 Mar 2025 18:05:31 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt91Y-0000000EufI-1fz8;
	Fri, 14 Mar 2025 17:40:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741974029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RNfoLYrPcM5k+wBec+Ms/i559bYXoXcUmmz1PNU5mjFxjHmbsphVyTukDQBetPUpXWTT0v5mAc1q63mq3RFdn92Yd4JRiOkJKmVQWhzSy6pd4zSmew00j14JVbxBzawC6fQtNIm0cQ7Erg2fL0QT6nqh+gU+SejTVgxLPqK09Dg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741974029; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8buXX1p3SURBMsTZcHdbZSaeDVkNSZ0ppj4rFscaaHQ=; 
	b=DOCwy5MrXkFSoLugFoUydcHQU/JPbVHOe9XWTSkRq8PkBpogPYe8CREedZJz5HYRmNWQ12q4New14Si8IZLRWpV5ASsPPdFcnrY8vkVA7AuE4yy8W0QqE6nwYZtdRKjGjZIGTik3H2/zBW+PlQYpR/AOGFy+idQyYGPs6iChwBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741974029;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8buXX1p3SURBMsTZcHdbZSaeDVkNSZ0ppj4rFscaaHQ=;
	b=AMkNsEAWcF7JhcLYqecczRzn9fdLEf+3Eo0YksMngnTWgXanMox8HPLGbV7w0No4
	zzqcH5J2U/s5DYzDQqBEdtbYgkdIIkk1LSdOKeaTh5DHUpt1F7TyZBJHbZPF2RLikjQ
	TvAfwEpwQpeuxVzOtUlMCjBieFNpUCHnHLMYTnas=
Received: by mx.zohomail.com with SMTPS id 1741974027158733.9448801872073;
	Fri, 14 Mar 2025 10:40:27 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kernel@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sjoerd@collabora.com,
	angelogioacchino.delregno@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v2 6/6] drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192
Date: Fri, 14 Mar 2025 14:38:58 -0300
Message-ID: <20250314173858.212264-7-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_104044_498944_84A642AB 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

MediaTek MT8192 SoC has an ARM Mali-G57 MC5 GPU (Valhall-JM). Now that
Panfrost supports AARCH64_4K page table format, let's enable it on this
SoC.

Running glmark2-es2-drm [0] benchmark, reported the same performance
score on both modes Mali LPAE (LEGACY) vs. AARCH64_4K, before and after
this commit. Tested on a Mediatek (MT8395) Genio 1200 EVK board.

[0] https://github.com/glmark2/glmark2

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index e854f290858f9..ef30d314b2281 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -836,6 +836,7 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
 	.pm_domain_names = mediatek_mt8192_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
 static const struct of_device_id dt_match[] = {
-- 
2.47.2


