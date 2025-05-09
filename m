Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9410CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcem+G0XyoyCW9gWqwOXj2uB2Sqx92heFQfGMmvNO74=; b=jEVTSy2C/YzG99GBM99HwI5sxc
	771HrRezee8Sc0Hj+xZxTxlfOOv08dVAdOg7jt5FqXeXyW1YzLuZhGv98AcC+oZBhLhfO38Gha2lL
	T2trD+TLs4tCg0q8cpnonHRI/wvKl9E/abg+eq+76vSbfOGD0+nQhCdIYLpHxJDUOZdkPpS8UEy5+
	5QwF/3XH+1L+pLzokdeCN96fBk3olPdAr7SJxgeLhk45TjWCzR0WEqAGYHMYsfyVTfbZ6bFrOSmap
	FR5zVpQOQHofLg9a5px6yGiv/F1aOyHlFynSl6Lf9+7a0QoN2hKhTOQQn9Z4gpH5N2xiHcSXke2Qk
	OmRNsdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLev-00000003Oq5-0OEX;
	Fri, 09 May 2025 11:12:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKkU-00000003EHi-0gXf;
	Fri, 09 May 2025 10:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746785672;
	bh=33sX9S2Jlt4X8Crp65Sy6YYfUXNzf0QbXMSWJBZZdlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kQypb13/LhfLY/tjrv9OSS+R6um7HEh/fpcPrfA/Y9BaZiYjNbShKC6/nmU89dGTu
	 uZE7G4uciOMCyGMEY61sdpvb4Lu103K5O8YgGdqx23v8ZyNJasTJM/W+dQs6qo2+wl
	 4Ert/W9/Y/2E50PU2DTwqr07D/3Dtu2Tg9zdHT71b+V+NCKRCyryS6COnynxkpNr4H
	 wJeXNmsHSBLx3jpTtqS+daZ7uJMJTNVS7XmZ8bWEjrFmh8HgnTx5mBhrzUYbvXbzUV
	 tCgzLNL91+eShoyTPHvtsk1yPuII0QIjHknTEf1GBXuWdap28EKE4jmaYo8Gx8qdjt
	 gEN6vcSujzSDQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54D8F17E0C0A;
	Fri,  9 May 2025 12:14:31 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 09 May 2025 12:12:49 +0200
Subject: [PATCH v6 3/5] drm/panfrost: Commonize Mediatek power domain array
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
In-Reply-To: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746785666; l=4267;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=33sX9S2Jlt4X8Crp65Sy6YYfUXNzf0QbXMSWJBZZdlQ=;
 b=WJVUyuGGi1RtE1ncr6ro6HoNYyaB727WpQW7A55qXFAouhejxURf32FAa/s9bN4D8upsMCajf
 +XgR3Q+WWo1BA2ugaopEUfinm6UQ5WonU3zjegpRMGKdLHbIQuk0j04
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_031434_458247_172A8ECC 
X-CRM114-Status: GOOD (  14.81  )
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

In the panfrost driver, the platform data of several Mediatek SoC
declares and uses several different power domains arrays according to
GPU core number present in the SoC:
- mediatek_mt8186_pm_domains (2 cores)
- mediatek_mt8183_pm_domains (3 cores)
- mediatek_mt8192_pm_domains (5 cores)

As they all are fixed arrays, starting with the same entries and the
platform data also has a power domains array length field
(num_pm_domains), they can be replaced by a single array, containing
all entries, if the num_pm_domains field of the platform data is also
set to the matching core number.

So, create a generic power domain array (mediatek_pm_domains) and use
it in the mt8183(b), mt8186, mt8188 and mt8192 platform data instead.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7b899a9b2120c608e61dab9ca831ab8e907e8139..21b28bef84015793d9dba6b1e585891dc0dfcb6d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -789,6 +789,8 @@ static const struct panfrost_compatible amlogic_data = {
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
+static const char * const mediatek_pm_domains[] = { "core0", "core1", "core2",
+						    "core3", "core4" };
 /*
  * The old data with two power supplies for MT8183 is here only to
  * keep retro-compatibility with older devicetrees, as DVFS will
@@ -798,48 +800,43 @@ static const struct panfrost_compatible amlogic_data = {
  * coupled regulators instead.
  */
 static const char * const legacy_supplies[] = { "mali", "sram", NULL };
-static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
 static const struct panfrost_compatible mediatek_mt8183_data = {
 	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
 	.supply_names = legacy_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_pm_domains,
 };
 
 static const struct panfrost_compatible mediatek_mt8183_b_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
-static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
 static const struct panfrost_compatible mediatek_mt8186_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
-	.pm_domain_names = mediatek_mt8186_pm_domains,
+	.num_pm_domains = 2,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
-/* MT8188 uses the same power domains and power supplies as MT8183 */
 static const struct panfrost_compatible mediatek_mt8188_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.num_pm_domains = 3,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
-static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
-							   "core3", "core4" };
 static const struct panfrost_compatible mediatek_mt8192_data = {
 	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
 	.supply_names = default_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
-	.pm_domain_names = mediatek_mt8192_pm_domains,
+	.num_pm_domains = 5,
+	.pm_domain_names = mediatek_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };

-- 
2.49.0


