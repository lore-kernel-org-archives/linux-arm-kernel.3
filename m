Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED03C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wooZN6SxzvR0nWa2hFUkQqaagaWu7DQLtXr79VHhu+k=; b=jNklsDAbN7iZ7VfS1dBPl3pJmo
	jTmRu8qwWx0N15XfbSmWOcpMBaw/tNjWIcOjG7/Xn/0FKwEw6B0pE928lhSTDeqZuxctKxtuM++1K
	1Y6GT1pIYMW91BD+aYO/q+l26PxltZOOJfVogJRSpOgi3PxsR5iEVm8EsXjyALLR5kSnMoSOzPGDH
	JAreCawlJ44AIkKYpKCQVNciAApoy9B4lBQi7eVd9fc7gTTwbJgkpgqTMlU0IL59ByQIQcYm6nanh
	1SEkWvRxXyZM4XxVxzduunbIjUdTj0IxSJZcyLhOQWlZOFCb6F3XaaranbAYAxb3K2uPj0sOCAKMa
	JeFvWj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEDL-00000007mTp-0XcV;
	Wed, 12 Feb 2025 14:59:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEAW-00000007lbI-3ui3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:56:54 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C37EA2F;
	Wed, 12 Feb 2025 15:55:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739372128;
	bh=VjE9mbKl9OnWT0ySTs7fj/5Evv6uFyb956WbNi6bAL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IDloWwaP/zRQ4wWJb5I8yauT0Jh+uJP244FniUmBEG48A0ZgggdSuyqlAN0v1TlIf
	 Yw63wthhy+2x4JHot9XqOVC139v8zyUODVgO9BHrptG5C+qhnb5g/mjnVvxamKtIER
	 EwkrU/W2FyaQoTjlCmINrqA+2Qf8PX7RVIHVSqO8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 12 Feb 2025 16:56:05 +0200
Subject: [PATCH v3 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-xilinx-formats-v3-1-90d0fe106995@ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
In-Reply-To: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=VjE9mbKl9OnWT0ySTs7fj/5Evv6uFyb956WbNi6bAL8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnrLaoLvPPLk/mVLX6uRBDJ4JdhqSsuASwrZP9b
 mFFJPeq5JOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ6y2qAAKCRD6PaqMvJYe
 9XIpD/4l+I20edPbx2nORFeqiEyG9CIgqm8A1uakiUKPVXy1Wh0X1XQ9+obe0VnoLA4NOTPawn3
 21OOOrbtaGYU3JXzR2eeOXV+erc7ZmzvolygdCPSXFqBAHE9rHm9At0ie+zhqZ+KYWqtDzjJWFJ
 EFbj9L5B1F/IUAohADcaqfsIe8pMA2eIJVJ3c3rwOtlN4ftIQkKR6OvYkT54uZttk0iMstpC0pg
 UqjzSTiv6rAuTdhmrx+8/KErEYCpr25TpV+atExvzEVlprdLT0l8DHWxwlZ5qBbVfhx1sKNGMkW
 LMa02qqxlWbk63bQShmU4mteGt9lqkIfGS4AelU5PSjankHi3Qee7RZavScwP47oS+w18VFsuKR
 xwne9mA18MM+AOKIn7vWGhxK4cvwfxBPwIf3DET2NXyr0ku3gu4ensddeulvXTOf4QTvoz88rQ+
 dFe/83KaimkU82p7tb4HiRg86v3RcUz/yWH5sPl5SF4ckZIY38Fq9MEQJBMT/Yj9BTeN1ubJG7z
 b6sBWxvSnwXdXdK6xgdMcVogy6ZVuankgvjCcqay37fn6UsMDUUxDxBu4Gn9x0JSJHWtcAmqFiD
 XQn4Mhinc919wC1SiC1d/w5yUeHknHMuOzaZdqmrTAMMmWHivRWg435OFLHXOnulvyyRnvRL/6H
 qpmoNg0Y6sWxeIg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_065653_113417_975516BF 
X-CRM114-Status: GOOD (  11.38  )
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

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 3a94ca211f9c..1e9afbf6ef99 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -457,6 +457,13 @@ unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
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


