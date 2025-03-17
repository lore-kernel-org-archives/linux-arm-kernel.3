Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27601C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shM7+TC0TXgX3AuBtBbLz5FbCbczMV6yD/4P/qN2rI4=; b=TYaaUe4EE4P0XAeciHM3KoiKPq
	rldY4a2i75H9Uq1IlWC+SDrTLLq8DFAHxfNApbNVKT2PkoQNDrFHA09MZQ9ftgfS/N34y2xJJdkg7
	GyJwFwnXD4Lt1VkNdmwRyXc67XsWHndflmpf6YQM83l6oP0KW8K44YO93C8cOI2C9JHqTHn4B4Jf/
	Hxl5j1XGGjUG6dvBmNhYZA/37tbS4SXV/jphfHNYVDdGv0JJJm8byPGkmy4eBksHcdaEsuDgRT2p7
	B3xmhShkdGGmmi3O/jlpNq9AVrfn1k49q9I9sbAK2QPuPycmzpihsMCjbeqFW/edu0wNswSiW7s2s
	Z2lqL1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9zg-00000002dkz-3p13;
	Mon, 17 Mar 2025 12:55:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9oT-00000002boR-20ac;
	Mon, 17 Mar 2025 12:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742215393; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W/8A6fXZMKuCo7yUW8I8FHOZojX8UAAcSDBG9imgFl5PeZ2NYsdDcluh5eHBAOULjnU8hgh0xJFyqlwtadsFDiS8PRiU9nykISmIdY/RMzjnUxbGOBRNCAm/x1D8l49E53aPOQCWWj97nOHyJnlhCg+HaOdF+K0WJ+WQ3/RVXeA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742215393; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=shM7+TC0TXgX3AuBtBbLz5FbCbczMV6yD/4P/qN2rI4=; 
	b=MwCdaGOOs9ebmu4IcYdfX22qmjpwTQa7COKws79IFpzW8VfEfzNwptQ+hP1SSGfJv4RXdx1n9ygWajUnyFnYlOrIyBl6wC2xEYaFSyut0+a80dTZWGtGIKdE3DV9Lp5EcK//yLPFCrqZwuUXHO4QkaE5WKvpTZsvTfKW/C6YVCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742215393;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=shM7+TC0TXgX3AuBtBbLz5FbCbczMV6yD/4P/qN2rI4=;
	b=OkfHSrIsBxJzTXcPR4jVqm/6LfIZAQTv4yvcZNw/J3zSglqeeyBC2rlheQqlHOaH
	+26HPd/l9kWLb6PiB02Q62F3yd3D6LBrtde59SV53yYo6+1SXtNudesPF/Q6Dt/9GO5
	5tOkRkxeKAwL96yOkDNE6iZyhaEjVQNdUN1euCuU=
Received: by mx.zohomail.com with SMTPS id 1742215391542357.2105699159947;
	Mon, 17 Mar 2025 05:43:11 -0700 (PDT)
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
Subject: [PATCH v3 6/6] drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192
Date: Mon, 17 Mar 2025 09:40:44 -0300
Message-ID: <20250317124044.16257-7-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
References: <20250317124044.16257-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054325_566973_E0E64444 
X-CRM114-Status: UNSURE (   8.33  )
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


