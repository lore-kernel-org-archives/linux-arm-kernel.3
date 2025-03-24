Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D818C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 19:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/O44KYInqLdyBmooGuKw9grgPLVhuDKuNXkXOSDVW0=; b=sTBdvs9FLRpv+xGuhg861MebG1
	GLKvuDMpLA/AVxH6F6GN1saE54tdrnsPg7Az+mj3aqMdfg0jAHQapPAjA1PZjGfa/PsO1vOkNIdk5
	Zi/78PGWirGtf5zmVWCJAxW7hMIyUTo4byQVviUI6fn8xXqcRxAIvf+pg2FbP7VP2LLg4bk7GTjY7
	+dq/4LlEK+s6jf1VPh3qQnl5sztwPgfpPdJ18D0P0Z1B82FMVVFz+X1fR23hO0ZOaSYvwSfNuF/7u
	JICqikxQVRYI+FkEj5LjUFVkXlheUMWhWieZ0K8sGQLh03FgaHw3CkyHfI5rtv6+nCO9ZmNWY2F64
	ueIQ+e1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twnK4-000000042tB-3Z70;
	Mon, 24 Mar 2025 19:18:56 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twn1b-0000000409n-22FG;
	Mon, 24 Mar 2025 18:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742842778; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fgU94D9cYKlHsTcTzK39CbFNmFR/XgRyKMeRuTO6qdiIBqJjgqCcEtHWUN/FJgFbmYIygxHLYdaLjW2x14g2DCd3FhPnu43axKl8RfgX/wq/2paJvv/a9Lpak7RQt7FEmWbYHquhuM28FqTTKNEN9UB1EXMefDWaGN0Wag1E8+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742842778; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T/O44KYInqLdyBmooGuKw9grgPLVhuDKuNXkXOSDVW0=; 
	b=R9nuZSwa5jIo66yFQuOvzQuOubRSdrcEZtEaY699thl4CpHPKaloHN0+oazl2ByRDISnfY2Erv5C8D42N02Cq/nutxoot5XQ+QuAVXYbQACWux3nfP7PAJIVQiHkNvM/FzUnx19qG+Gk5VAeghWLIk24Nibc+UcWYWe51RJSZQE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742842778;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T/O44KYInqLdyBmooGuKw9grgPLVhuDKuNXkXOSDVW0=;
	b=lXswI1q/vbBW6kPRlrWIaPqwL9TMRePhLR81ATdmanKFLWNHPjytk36QRECn/a5X
	CVy31Ydu9oF2GTU6A46orK+lLIlRnr2/vmMbNVBnNMCwUWm0IS0mNg43QfTWA/ddbiZ
	l01Slses9JglhyoPraFn+rBEu9FFZFUl/ohV4Iqs=
Received: by mx.zohomail.com with SMTPS id 1742842776245696.5273810292497;
	Mon, 24 Mar 2025 11:59:36 -0700 (PDT)
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
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v5 2/6] drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
Date: Mon, 24 Mar 2025 15:57:57 -0300
Message-ID: <20250324185801.168664-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_115951_581484_B07D3948 
X-CRM114-Status: GOOD (  10.59  )
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

As done in panthor, define and use these GPU_MMU_FEATURES_* macros,
which makes code easier to read and reuse.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c  | 6 ++++--
 drivers/gpu/drm/panfrost/panfrost_regs.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 9e6f198ef5c1..294f86b3c25e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -615,6 +615,8 @@ static void panfrost_drm_mm_color_adjust(const struct drm_mm_node *node,
 
 struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 {
+	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
+	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
 	struct panfrost_mmu *mmu;
 
 	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
@@ -633,8 +635,8 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 
 	mmu->pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= SZ_4K | SZ_2M,
-		.ias		= FIELD_GET(0xff, pfdev->features.mmu_features),
-		.oas		= FIELD_GET(0xff00, pfdev->features.mmu_features),
+		.ias		= va_bits,
+		.oas		= pa_bits,
 		.coherent_walk	= pfdev->coherent,
 		.tlb		= &mmu_tlb_ops,
 		.iommu_dev	= pfdev->dev,
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index c7bba476ab3f..b5f279a19a08 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -16,6 +16,8 @@
 #define   GROUPS_L2_COHERENT		BIT(0)	/* Cores groups are l2 coherent */
 
 #define GPU_MMU_FEATURES		0x014	/* (RO) MMU features */
+#define  GPU_MMU_FEATURES_VA_BITS(x)	((x) & GENMASK(7, 0))
+#define  GPU_MMU_FEATURES_PA_BITS(x)	(((x) >> 8) & GENMASK(7, 0))
 #define GPU_AS_PRESENT			0x018	/* (RO) Address space slots present */
 #define GPU_JS_PRESENT			0x01C	/* (RO) Job slots present */
 
-- 
2.49.0


