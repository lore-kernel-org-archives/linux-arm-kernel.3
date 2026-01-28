Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1C8D3F09F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1UvATfuSFpKjLxkL30hy6NaLcEMxKSwr3maCsr1I3w=; b=dDB74sS+j+/cj6NFMk1FCxY0ez
	IjmdoDcPLDNrAoa//dcYpySWVzSN6Kv5Ww1UADUcopu3oDQXRWd/e0KdKEME6ZElX4L/UmRVZR4TB
	x1wqYn8QReGwpebhxZlgraVjA8EI20IagOD8qJH0fpsV3Evdey2HBSHMqM/48H6YnAeAcNKgSa2J5
	60QaBHY76jcToMGNXZ39iRBbO309/bYfud4rE8QYkaUuP8yeeQ1XNbFnDcEGopvYswRvnn+IrrUZx
	kmntgSwYk3/17UysQYde9RVNcfLsHKTpdV5hAZgtr1LrPlvEaYwhTUjZyD8t0tKYXp1DbX6uqdMdi
	+f34WJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Ir-0000000GTGm-0qJR;
	Wed, 28 Jan 2026 17:26:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Ip-0000000GTFa-1GGE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:04 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71BE518CB;
	Wed, 28 Jan 2026 18:25:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769621124;
	bh=0+4PliZFZn2ZEL7NwkuBYPphIbKpznlW8ky3nnE+a14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l/RCeaDCETgXlyJvTBp6P54B2jqhi/sPvgWMbKhDWJ7QNTDJa5IbfBmHyba4CwGsj
	 SCrfOMcMsBAk4VqdCWpdh4iEVkJ4cq0iaPzK6XQ11niEK3wp6fn0F3nis4Jq/P5+j/
	 jQCCYZo3wg2Zg/Kdd59BK26zi5Au7LDWD1UcuAts=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:26 +0200
Subject: [PATCH v8 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-1-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0+4PliZFZn2ZEL7NwkuBYPphIbKpznlW8ky3nnE+a14=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekail7GEf7ieuqRv7uv/kDEZDvLK0RPAIbNz4
 fljyBlDrbGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGogAKCRD6PaqMvJYe
 9VVQEACK6YFdQ9mnuV4a123HQG6WR3MxNCgB64Sp+5lubNNkrnPG9nuYR6k8H14+BL346x4IWPP
 0wW+FIROeLXY06xL++3w4bHku/b9/J0I/24FBqVtdHVKlWs7ctHJk56YPMi8WYpQ66Vr7I2+uT0
 h/SaGBgbu7ReHsKLUTuwibe/ckuDev0P+ENXxrmtowiAeIbyUdKQdl/XbNHFuEev06X5dGmkppp
 3va2vtW/HBRbTMJAWQaTwwAmu6k1FZ/WKtj5N81qRwKXsF1vUy37m8rwBgmyJQOYAfLOUYXPxXK
 2nzbo1pPgOOKiIccCDl5H2qLoAmM6/OTcia1nJ8wFQarPCYxCPIxzBW8kg3N4pfcFW5nRE80hDg
 ZoRfMbS8u4VDJD/9i8fytnaeu2VYGwaJefBHrrXkC509EAh5HXyIN16y7Gru0Z5lzsESuKU2CiY
 ceCHgNs+vVrQmEcXgv5XpNIXfcvkf7B6PiLEwLpwEAN8SZaO5y/jwwUDrPpZfw9PnTKPDaoEFQG
 RlBMz8EJ9XlnOp7JJqXDsVsKAW8Vy3yDVpT4fXbPoKoD6QeId9tyxTnWhfQRYWyLNeiBz0Wc+FM
 31vZhnlCDyM3VLlKWFFOhwKiFLSr3r2JdqIsDUFNTs2xmNfltx07EoSawe3cAs/smJl3d60cnVz
 cUgNe3nw/v4vkdw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092603_484490_F4DCD59A 
X-CRM114-Status: GOOD (  12.32  )
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

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel in a pixel block.

E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
pixels (Y components), and two padding bits, in a 4 byte block. That is
10.666... bits per pixel when considering the whole 4 byte block, which
is what drm_format_info_bpp() does. Thus a driver that supports such
formats cannot use drm_format_info_bpp(),

It is a driver bug if this happens, but so handle wrong calls by
printing a warning and returning 0.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e0d533611040..e662aea9d105 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -491,12 +491,20 @@ EXPORT_SYMBOL(drm_format_info_block_height);
  */
 unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
 {
+	unsigned int block_size;
+
 	if (!info || plane < 0 || plane >= info->num_planes)
 		return 0;
 
-	return info->char_per_block[plane] * 8 /
-	       (drm_format_info_block_width(info, plane) *
-		drm_format_info_block_height(info, plane));
+	block_size = drm_format_info_block_width(info, plane) *
+		     drm_format_info_block_height(info, plane);
+
+	if (info->char_per_block[plane] * 8 % block_size) {
+		pr_warn("unable to return an integer bpp\n");
+		return 0;
+	}
+
+	return info->char_per_block[plane] * 8 / block_size;
 }
 EXPORT_SYMBOL(drm_format_info_bpp);
 

-- 
2.43.0


