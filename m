Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0677BC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wjCxoF4gBTw6e3ea0KO0gWERFswNiTV11kJAng6/x0=; b=0OS/0HX5/gCbLcmXsuX3N/D8bk
	Y3VzBX2cXL/VI4bSVAVkK8KwS5rwNk2JiLFNAJlq1Cq+YaX+i15RYBnJhQwhgLrNiOHVpu4Hpt6zj
	NP5T7qHASaPd7V70JatkRz5s7lDIGHiTyAIYI6kuezwGgxNlyHYSv6fxFluCkXdelVSecQKDIgx7v
	4ZqSA6zh/pyyLgcdx2Xi1hs6ogxcZEFJrWRas/kzHbcHkBCspcqnu1ce25udMIEIXGfjRqSVbLKdt
	uxNJCnW/QBUVB/Ro77dP1DwpZ7wrUEs/nLjw8OgV7SepYuQ2UzPEGY/x8vB69RAsZZAh9/0K2cFI9
	7l+xCaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IFY-0000000H8Pg-2QsG;
	Fri, 25 Apr 2025 12:33:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Gof-0000000Gr5q-0AdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:01:58 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D0B4D77;
	Fri, 25 Apr 2025 13:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745578909;
	bh=rnb9O5ga+vC0Au9mvXeMxO85sgNKSlUDQVe/FRuj+pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sb5sk5UfxD8qmpaDvvbR8Zj2LskR6jJ/A81uOBgRMzGIOWA11mW0zyk7ktESrTQOf
	 AFoypnmTrZ+D4mlLzkr3M8YZ7IbtSCSLlZknCd+OfHGoURCBD+setx5nR+jgJfd5Ij
	 WIGOVnyh7Z81JUk8SFSEHIHnq1eUsU1n3B4r+nmI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 25 Apr 2025 14:01:21 +0300
Subject: [PATCH v5 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-xilinx-formats-v5-1-c74263231630@ideasonboard.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
In-Reply-To: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rnb9O5ga+vC0Au9mvXeMxO85sgNKSlUDQVe/FRuj+pw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoC2uZ0gF4l87mnADMNdl5nDKdXbrZmaM0UJsBZ
 nn/PG/33qyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAtrmQAKCRD6PaqMvJYe
 9Sy4EACfOqlwgpKfB2i0IryEotLvaFuW3Vsa/n6owJ+Cy6FdOSjkBe/UzlkXbYeydjXKMtC4rns
 /GtNGv24JPp0U0y+H0mrClDhJ1JzoMIgePNzYS4DTMhTF6sivKSaBJ9KzFKZfqsjk/wT5vcaLpj
 GTNqt5x9Cx/cJ6aEgjTkRrsZkH26o6TKWsz0hQ7DkyTds+saH55Jogs0cTFeIl7VkOFjnkXHaLf
 o/nwxNfhBhElZLDADT85Y/qqd5FrtKpn5WktN2hBm6EeLWVT8DQtWN16BYv3+vMJK7hvEBKTWT6
 fDlNLCSn9Tqw+42pzzs9pxtrIaCUBSNpnS3shDLBYBl4YlnXqdfn5vQ0z40in6P8EIrwpPqxVk/
 LcV4RGhL3K8sUL6i2VHsy8KpCNUSyHXvU+i6YxpW1or7qJ/Bqa4v87/pIlbi6uTC86vh/m0m/gf
 j6bcSZSLMcDoWJO4uDbH9xOyePLqSIw80cEDzTdkR3t3uE4B2qDFaepxOnwNOjGs7hBF1zxL9n9
 ALqL5zO55qJhhWjCH1UqKXjCgAOJAQD5s5zdqlJyF5NgLTU7cVF4AfqDbxjpLv5YHnggFnER1JH
 gMuYwFeU/PqpnFEQknFuhN9cL/wQ4ZDV3H5BT0E4yLEaOkXSeyAHyhHtUnW+BwMsUxYK2cCXLL2
 fCkagyUYKiKH2OA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_040157_225488_EF134B58 
X-CRM114-Status: GOOD (  10.92  )
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


