Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DA3C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 19:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uu3d0MtSSjzAtw+Qhy9CyN3/i5xOqsepAkaEuUF8bc8=; b=jem40a8hxwwFoNHfN9G4iOMhV6
	iaCPZ00AolkbxRLPypJVdalgx97/394tw+FjbL7czt+02xJF9fJP6wvCawZDwCUl4xai5JpN0wUkS
	3dUd2MkOcgiO/U3T5GCrx3IeFsArd+FKQiSarZ0zq+WV8sZD3ryqjmhBcj/9egrv80cYL76e0p1Wu
	oR3Bgw6MaCMrWi8ZpSGmxPsOW2bx8TblF6qFqFC4/6O0T38/gOPibyXrm0gt1k+JRkP9A76bMxxTt
	hqRZYW0E3wwnz0CCRkm/Gvitz08dAmxZ1hzRLt3hOhvOTt36wAo4P8dzr7LyThl/JVjRwD1BEvpjY
	ld27fYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twnTM-000000044ie-3kDp;
	Mon, 24 Mar 2025 19:28:32 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twn1t-000000040Md-1QPY;
	Mon, 24 Mar 2025 19:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742842796; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bJt1y4i/ehYsNO7hM5jVKOhrvEse1fiM1TFcl3MYIcmgiZplh5zRBgewFoSbWFy2EZ6+ghE8Gsuo6TLL/LXDiiee9ACqfdTUjnN0XpUxdo4lzQDptQOF2W4GuWM1Wk9O3SSgHawv50mlKGq5QlVQi7hmnbSSct6rI9LyLL+Y1mw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742842796; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uu3d0MtSSjzAtw+Qhy9CyN3/i5xOqsepAkaEuUF8bc8=; 
	b=lB5UCEoGnZdPFFQ0S5uR0ZjV6DXkCeSHLSrNu+oWewq2ldkV7y/VEzvSXZ9lV7I8UcTAIhO2OZw4oGXVYAuQsuaf7e4jwA+7wMKF3O2Pn4BkjriTvFwn0uXT8NEYgD2ZKOzl73ZqBuA4vG7EvqzM3O3S5Zgx1R1vwA5Sj67Ob4g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742842796;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Uu3d0MtSSjzAtw+Qhy9CyN3/i5xOqsepAkaEuUF8bc8=;
	b=fk7CoS5pCtIWrMdXWC7Xg9VA45aN11Bf+iu/k+3J0ozV34hlPFayd/DLB+ddh7il
	jNeRIqVqUDpp/Ljhwe7Er7UNxGz1WSLyvgA2AjO/hOOK6DgS1TQrWKoDu5G99OYOc6R
	Wc7of82scqX9i8IthnMWsjCpLY6fNHDvLScnJ4vA=
Received: by mx.zohomail.com with SMTPS id 1742842794374585.952480853528;
	Mon, 24 Mar 2025 11:59:54 -0700 (PDT)
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
Subject: [PATCH v5 6/6] drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192
Date: Mon, 24 Mar 2025 15:58:01 -0300
Message-ID: <20250324185801.168664-7-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_120009_436906_6AD175ED 
X-CRM114-Status: UNSURE (   8.36  )
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
index 21e2f6c8d6be..237e6054d0af 100644
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
2.49.0


