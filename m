Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60742E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3/63yYiq4hsu89GJorjusDtFx9dgMRwYHYJqJytQf4=; b=hK660n+icQcnT0BHmLYykT6Een
	PtION0pj8I0PGOn0+6AzoBaAtj0iJMdFoRsxg1Jj+SGQW0vf9m73E23KaKFEcDSvA1H+i6kKT9Quy
	snLLxHXfktbwx6hR/kMxX9ydXRM86Sh5zNcf4nEn46aNqY0qUHHVJTwtqM+5dzxdnIuvfJ488mCvV
	Yw+ZW2Kpt6e+PlWqEhcSOMHxNeBLamngqGWDPRVbqpj0ufx6vpjr+3NYhmgo07sqAtQZPgzPpqghS
	0azSptIj09JFmPp/Yf+Gpu100kmXxH0ZiZ4OJOyx4HN3DseWSyN/lSEjOVnLf3DPwnxYyf/ImG+jj
	p1RteD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlnk-0000000C4Fz-06GY;
	Wed, 04 Dec 2024 09:36:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljP-0000000C39z-45C4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:31:41 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 091189FC;
	Wed,  4 Dec 2024 10:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304666;
	bh=yyEyn4rhIqdMmRak4lQf+pKYkr0S+P4y5/aRt0CjZDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P4AHUURpDLAXSpjWAH/xWCkloWXEG8soupjlwQI8Tk8+0cpc3wbf38WNwT2LL5UYE
	 3mEXc0DTqMq3B0zioUXapCPGmO+BGNktreRyt37OyVInCD97pVqJObj0PUIJ6rj1kI
	 sQmXDkvQoddlIJkMTmWNn48+r3SkYZaCleQ0nnpo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:01 +0200
Subject: [PATCH 01/10] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-1-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=yyEyn4rhIqdMmRak4lQf+pKYkr0S+P4y5/aRt0CjZDo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFwjuDalmviB58VM3aWIBl9mLEZF4MBEs2ty
 FCH354qfrOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhcAAKCRD6PaqMvJYe
 9TI8D/9epVIOmQ6mUczxxULoiWYF/+qqqE6uduUiFg9hjNn00T05QWqLOgU3AGXXj4cf2/FQAwu
 YZ3dXzeYwzRxeZK3AkMdF6GbHO8kId1C2kj+HONkTnF0avbPtPb15SXCs4N/xubiCNbNjozMVQQ
 xoE8XtmSQVe5vQ6GVa0AiqZHT82V9eWlqIIC3utxzWrDAKF38GnJoh0KNP0L9sy7t8/92xlQqni
 lw+zlmHZG/HtmkzECYrvmkWdaAOWNcNmkvtofJTcy3jjLHhgEGb5Q02U5yRoxXtO7OYkiAbSyRX
 /78KfP3YGhDWH+QjQaZYao1TF/P4pzZyKNFi4BmpnFve6YtRkuXZ8dZIXD6O44Tahq5BDrOdJV+
 hp3U+lOc0bVkTzX2Slb9qSeK9n0Sk20wtlJWLgA4C7ikH/dVGj/VBP6qGcKF659sqlDVJbPWNjy
 v41sViFqjtxdvTAYN68NwOgQqVo/1+R6pbPNPeXU3JZ+vLIvSx1SIVCDpb08x6NgWQmcUch7tmM
 z3DxSTnt1oUN9nppSnpV1NIbDZeWQAccf6CHSMs5Tszc3M1pbsqck7R7QusCtxruGXkY9tUd9wR
 8NLauOvprqRHCiNDzHbXAIm8a/6kRRaO/6ROPh+Zy1oxWkM+QqA2dqu1Bla6CrX+NncCm208FY6
 xgK8OilUnNLKPlA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013140_156620_DCC76DDE 
X-CRM114-Status: UNSURE (   9.64  )
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

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel. Handle wrong calls by printing a warning and
returning 0.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 193cf8ed7912..e84c4ed6928c 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -429,6 +429,13 @@ unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
 	if (!info || plane < 0 || plane >= info->num_planes)
 		return 0;
 
+	if (info->char_per_block[plane] * 8 %
+	    (drm_format_info_block_width(info, plane) *
+	     drm_format_info_block_height(info, plane))) {
+		pr_warn("unable to return an integer bpp\n");
+		return 0;
+	}
+
 	return info->char_per_block[plane] * 8 /
 	       (drm_format_info_block_width(info, plane) *
 		drm_format_info_block_height(info, plane));

-- 
2.43.0


