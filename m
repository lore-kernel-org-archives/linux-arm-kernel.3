Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD198C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wjCxoF4gBTw6e3ea0KO0gWERFswNiTV11kJAng6/x0=; b=lAK7TUhsIsc046dwV6UEZ8HAHs
	oMl4FsYSQ28k1xEVLik/pcqjGEc32McOrdiEcsNQVHOXgI/ad2K5GvPYIVhaCFjeCbVGUVZ3eQFmj
	r2vj8Lllelozf8WlElRvqwDR5s9VsrUlw+NOAeBSDeG2pBdNXKMguvz3I6WFMGYGo6tcPQRdFd1+Y
	J4sMAYGkiSUdWAUkHPU7qxpzrW+QnfgT59aq7IID8ygUUET7NDR4EwdpydqI55WdrxhX97mtmhfoD
	anSEuSEHh9y/JLNEFQryIYpiMfBPgz+S2ewBHZcxOtpkoctnrhw5IIdbozH1V+PGmecSRrgWC995S
	N28s/U8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQmU-00000008YvT-19rv;
	Wed, 26 Mar 2025 13:26:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txQj1-00000008Y8V-2GjA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 13:23:20 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B146A99F;
	Wed, 26 Mar 2025 14:21:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742995290;
	bh=rnb9O5ga+vC0Au9mvXeMxO85sgNKSlUDQVe/FRuj+pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ovZtR2a/ZtjS+P/tBryQlDX2uBR6qpPsG4EqKUbJwM5WkXYz+dX9n/WiwJYlzs2Su
	 Sxm7/Z6dS+E9/0x0aAbBkAasC1FY2gGBKg2uU65q69m0evvZGK1+iYb/JHAIGi5+61
	 sp4I8XvvOn7O57f9O9hIvmlzv4GczHgQRldreRIM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 26 Mar 2025 15:22:44 +0200
Subject: [PATCH v4 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-xilinx-formats-v4-1-322a300c6d72@ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
In-Reply-To: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rnb9O5ga+vC0Au9mvXeMxO85sgNKSlUDQVe/FRuj+pw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4//A6V10zj9xebzMdauH1U9z/DSfJoRltXRwP
 8qPPHaNVfCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/wAAKCRD6PaqMvJYe
 9UpgEACtmWp6yWajbM571pCC9OqhLJWmaAGCHktwn+ik1RRI08C/HriGIK1ZEpa4aorA6mILQ6S
 X2JaKKYacaq/GpTTLesowL4YWmEgZZZDETPBEIctTuZWowHXQy9XjxvF0ssMJH321fTUBgKh1ac
 yrwXbiCjI4O0jTNKWx+fvEPZDB4QjLlPnbtBq09VMuxoi5Ddi8rhXTEAoQE8H4DAXseGwfWkHE/
 rlS2J6EiJFW7t82wLqGPxWYvFP9KKm2XGZjaaOfZzHfbDqyMOewit5BuGYgjOfidpD6WKrteJR/
 +TYg0nEy5KCcPlovtcQ0zJ/sJvttJ443ND6TPUdKppkTXXMZK7wjQsOB1WHbAO6NuJhZ3Ku4M/I
 77y/ZQD2tGZVg6h9KvwtOswpIHtMWy2WX7FVQqpE19e4dKz/Q6NEuUnXa5qty9AJ/Q3opHwUUsG
 hb3E3fE/d963yH57NESyWDz1dgQsR/ZZa9irO3Grjt7xREPM5GggJs3FFrhpOFdXzTJ2NvvTclB
 Y2mtI8S4k/EbUDTPgPNk4vMrRSztRCnu8E7GmbU/wxzQ5oq4uFF4AWlfhPeK1EuFgWc7B3lRnPg
 pkgkmoYae5+nyjLpMGKkQLo8cC04qN7uBoMi+tkF2W7kNtK9B6keyXuLeZHVKwuxOY7LioVJBV3
 FNxcurkQSWZBnIQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_062319_722495_F1A125A6 
X-CRM114-Status: GOOD (  12.09  )
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
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 3a94ca211f9c..2f5781f5dcda 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -454,12 +454,20 @@ EXPORT_SYMBOL(drm_format_info_block_height);
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


