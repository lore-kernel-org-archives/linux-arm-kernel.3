Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47C8CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3jNslkvxCH15PEXdGbHH65kT5HxvScb1Q4kNqfPk74=; b=PXL4wa0PTMyKgqGPks/i77o/2I
	sVmk4VBjPshsSLsJ+3RIuDhbdu77+VCeiDtGk4FWShnY1rdGZwI4ENrVaxfbqtuseCTYbHbDdMEtF
	8c7orN0l1+qQZeX1Kb/oGGAz3hNlOllqEWVzhl0SDn45QcKXIDw7K7UFQg/Tp4F5rgWT/Sb+/QQd8
	JceUI9XUI3HZOPIxed1baiwaVmyO1/ybyyglslEr1e8CseyJbj77Uc0NALrlk8qKxU2rX4SI+0ET2
	RKMtO49lzdTs7wrB0ZjImDEdpNaELMiNoSoT6vlfkv44r1I0R4NJaBx020qhRtS55fgtkTdH7FMcs
	SobHgjsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnG-00000007zsh-1S6F;
	Wed, 01 Oct 2025 13:22:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3wnD-00000007zp2-0WRF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 13:22:52 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 851A34C7;
	Wed,  1 Oct 2025 15:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759324878;
	bh=tztn0kyH+Of9Zzr5Fu0ONfRf43JS7/RDhGUij6qb3Mo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=trFvogi1uFzgZok12UvXtGLQ5vMps/vUpD+ViH+qBXXINVWb5OdRIx61UyH2lD2Br
	 Rzstn5tMVb0NaOEwUcSnV/QXQPJtgPTdio95sCZwCdxmPPwkMQqUgjsJMvJNrdf5yC
	 vQKKhoB0HYzKR3QZ6ybfUECVXhtW8bVIffmApXYc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 01 Oct 2025 16:22:13 +0300
Subject: [PATCH v6 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-xilinx-formats-v6-1-014b076b542a@ideasonboard.com>
References: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
In-Reply-To: <20251001-xilinx-formats-v6-0-014b076b542a@ideasonboard.com>
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
 bh=tztn0kyH+Of9Zzr5Fu0ONfRf43JS7/RDhGUij6qb3Mo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBo3SsgNVdn6D2ZZ1DR0l6y9qmAjyIft/P4xsvqw
 16HnW3NcF6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaN0rIAAKCRD6PaqMvJYe
 9R7AD/9Rk0zCfiabAmQpjRSsz3YvlbpBV7/QTYZnkKhQ0uknsZ/Gli54CQz3T+JYhbbzqlI+QRc
 h5pyF657doRhJPt7GfLcTfwKee0PNolFeBVWvZ6oNdlMPHzPERAUMf7lfy1Kxx3YgjF4mh7P5HV
 +Tr8t7NY14dgQarcCPlwCYDzwgtCji9Jpz9Fhps0T8woBZu1NJDTB7RahchobOo/Fjj1TBoXvIn
 UjKQmLjXk15YdiFupdI7EmDgi3PDRjk8txX6RxWyV7C9NbwL+cLwI6ZK1/QI2sdBtAcbhA6AKZT
 ohcNcQa/3b2RRXKzvHIIUGat0uw9pHF3mXiIUnWMkQbEV5iLZVKv+/SXGO3yGHaXO5YvAJ4mB0M
 sOeAzDBI76deLmoyPtjuOy7IkG7vehl5z/5fAWVEzrH81moCCo+oRpsNECdZdZLB+gE4NkWssUh
 oiJl32ZBF+1oLHaouU2HCWRK56kmGQ6Zf90x3ewrBxRCCq2Vx/Sr+7uW1mC5OUWna0zbkeGJmKC
 wOZIDNFwVb+SmCa3TIlEhP/hAE9U7CA/Lu0IRdpPdZ9p2dfsNE4RCCNPGQGKLz9TN+1gt7zsvDO
 0eEMdLDdh2JvI2tEvUPMAcX8cA5FrutpJ43QoiyYGju11AKBAhSy9tO0krZfecau0iC5dtahkbl
 2q5tp4+qtjL4m/g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_062251_293681_1C6A666B 
X-CRM114-Status: GOOD (  11.35  )
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


