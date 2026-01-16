Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046D4D47CA4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 01:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MEf0DHBWe9wPAEndIy61oCPwiRgDkfJY9Tvwbfp9TWI=; b=msJ7mmWoaNgOZ1DyzhvcCGYmzX
	tamropJti44exNLVU7URkA4owbNW5lFg0wTQFCDNdNmcZ2hggaOYIUsdhYF39lIDWH5f0/9o1Ct44
	HyEk3reJ/Fp4EKOUB2O14UTAAiS0wkZdU9ySN1Sh+X1yVX/a4LwolSwR2veCQvfHwovgWbcyGS7cV
	4a4X5IdZV6OCCd2nsbl6NkT0GsLeYLlWw6soDxKtsLG1KdvxqvabZ/uJ35D/WGBxcwKEwrpbb8t4F
	/SNRD5mVhOwn0jtoATtf0czhIqvC9fur18gf3MP3ykPwpzL8VFGyZHxOJOaG8JkHnnmYp4k09vjMJ
	LU6Zg/bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYCa-0000000DNyx-0jx8;
	Fri, 16 Jan 2026 01:00:36 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYCX-0000000DNyY-04ZV;
	Fri, 16 Jan 2026 01:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ME
	f0DHBWe9wPAEndIy61oCPwiRgDkfJY9Tvwbfp9TWI=; b=galtRY90/scvUYiiqi
	R1/BDctSZsJyCULal6+W/axAI5CMzUGIw3sof82uUF7JrrmZTlZZC1d2ALOQ39YI
	BvCNy19aIN90CRYfdMxBTXkQPwuZiOxDUmkTI2YR5aSvvuGQ/DE8/sWUpRQje9Hz
	im+5Wk0Juf7PIlHwhyZFRVxA8=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXRJeKjWlpWfAVGQ--.9426S2;
	Fri, 16 Jan 2026 08:59:59 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Add mode valid callback for crtc
Date: Fri, 16 Jan 2026 08:59:49 +0800
Message-ID: <20260116005953.286225-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXRJeKjWlpWfAVGQ--.9426S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFykGr1kGFy5KF1DtryUAwb_yoW8XF15pa
	17ArWYgr4rKFZFgFn7JF4DCw1akw1ayayxJrs3Ww13uFyftr4DX3WrC34DCry3XFy7Ga43
	KrnFyFW5AF1I9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jrl1kUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7Q87mWlpjY+34wAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170033_427798_EDCA5479 
X-CRM114-Status: UNSURE (   8.56  )
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

From: Andy Yan <andy.yan@rock-chips.com>

Filter the mode that can't output by the crtc.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..74fba29bfff3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1439,6 +1439,17 @@ static void vop2_crtc_disable_vblank(struct drm_crtc *crtc)
 	vop2_crtc_disable_irq(vp, VP_INT_FS_FIELD);
 }
 
+static enum drm_mode_status vop2_crtc_mode_valid(struct drm_crtc *crtc,
+						 const struct drm_display_mode *mode)
+{
+	struct vop2_video_port *vp = to_vop2_video_port(crtc);
+
+	if (mode->hdisplay > vp->data->max_output.width)
+		return MODE_BAD_HVALUE;
+
+	return MODE_OK;
+}
+
 static bool vop2_crtc_mode_fixup(struct drm_crtc *crtc,
 				 const struct drm_display_mode *mode,
 				 struct drm_display_mode *adj_mode)
@@ -1884,6 +1895,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
 
 static const struct drm_crtc_helper_funcs vop2_crtc_helper_funcs = {
 	.mode_fixup = vop2_crtc_mode_fixup,
+	.mode_valid = vop2_crtc_mode_valid,
 	.atomic_check = vop2_crtc_atomic_check,
 	.atomic_begin = vop2_crtc_atomic_begin,
 	.atomic_flush = vop2_crtc_atomic_flush,
-- 
2.43.0


