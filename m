Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83FFC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shM7+TC0TXgX3AuBtBbLz5FbCbczMV6yD/4P/qN2rI4=; b=d0dLzJAyPAlOfOvrxRdvSI5X/s
	LPBZ6v1boBF5h0D43DuL7Chl8yODpbxawHZj+mwG0JaRrU4BV14/jTAIn1pjeFErTUW2LNemQtoGc
	Y6YhzVn5XRg8Z1fID+TNcsuFGjVe2F8i80j65ZL7cXDBhg9cz2dg9VpzEDVB7wKivQ2RAil4xtQZS
	Kkq1PA1aUNCz//haPM4LlYfvaeZF3IH3vCq+Fv+lJKgtz06EmJPWcutboZoCCbO+pF3EvJ6cK1fZR
	RvVsOuiMgTfbQlffCwiziRCCsbbWZicdw6htwp/x/Rzxn1qcEJthGqW76CXFIBXU5Y8WuzPsdSH1o
	gL1MtfxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuC2D-0000000359P-0iUH;
	Mon, 17 Mar 2025 15:05:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBs8-000000032oH-3FLR;
	Mon, 17 Mar 2025 14:55:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742223307; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FraZ/OZHfwHywgfrsOG7TMIsQQppBBwQIA4714x3XRnJP7e/ZVphJqe5ysLm+JszrBtO5HvJOhlxRv03o7iYYaeGiwTqWUQCryu6ClkboduZGLUehevcL/YPtTGITjJG9qQNDxDAnXjnyb2uyJm6eeApuqBS1fT0vwccFrEmRng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742223307; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=shM7+TC0TXgX3AuBtBbLz5FbCbczMV6yD/4P/qN2rI4=; 
	b=L7YHsNwyvwhYW7PygyZG7QsdKBi+3FQaGn5s9K2Ek9QYE1EIWUUieE9GzauUZZn/FGNx7zO3+qN6BR42d5XUZzZpLVXWlt+yeJkAU0LPJes169OuObYNdFicou6TxZ/nWOV3rNSZFSjUEOQk3uObv66/vdbFBxQRCNPRbJEOMvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742223307;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=shM7+TC0TXgX3AuBtBbLz5FbCbczMV6yD/4P/qN2rI4=;
	b=EXO/jW8DFpe9a6NnJnrU/CfigN8dh4tmx/TMFuBx5CxrwtYNbq5aOePIXi8T0qDI
	zjIQrh+SrkG/03Gkqm0BBB6a3Z1J4ytpIWHp36aA9/So3R2QbRMabUfBQad0WwWvX/N
	XSsKRGXvx4bN/XqQr6gI92I4wrQqIuxyhpap+34A=
Received: by mx.zohomail.com with SMTPS id 1742223306740713.2683007620236;
	Mon, 17 Mar 2025 07:55:06 -0700 (PDT)
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
Subject: [PATCH v4 6/6] drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192
Date: Mon, 17 Mar 2025 11:52:45 -0300
Message-ID: <20250317145245.910566-7-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_075520_856331_BE84CC64 
X-CRM114-Status: UNSURE (   8.23  )
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


