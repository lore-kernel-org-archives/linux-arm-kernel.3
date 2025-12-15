Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04731D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xa75FA/RqA1hTGcKPQBo5+mpgZRoAUQ+aXrfjGdq9w8=; b=rvGURdVe2fnCUgts9BE/9Fimxy
	ky7GYus2bd+/m8+aMsa1/sQHmk0lNBPtwer6XuKQaYteXbMBd2YxwNwkCsU7Hrfq2WNoZv0kqFvVw
	gBC3cbiFPFxnZGmRnWhJTai5sdpvKx12PZbERwXyUSXzxeLvFuqM2hrgL7SimyFCQF/6JkOr9mXtj
	TLcb+JiSVjykGNZqz3ktjENyMtpK/WIZ+68NrYdAckbn8ilfCkIG2Qya0W0e//C8yWi7syTBvqZHE
	aQmL8ospzFXpx5Y75Dou7ZcM7mcfZmBPOavV3y+3DRdYuEg1ZAquSmOi6E0NMktmCEOS+cXBYttYH
	YCSdU1SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Hm-00000003kX0-21zr;
	Mon, 15 Dec 2025 14:10:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Hk-00000003kWF-1KET;
	Mon, 15 Dec 2025 14:10:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765807815; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R3o+hGXvUapVQ5VCm+yS9PfOLszeIb8BZ4GiZaYOA/q/MfTNlEsF4a0xAaPIU7LmUCJkaTbRNvw/2behwM8dEFsnr9CbdCI7cEcZHZAaI9qBnvEhdFBCHOwYgoZmzPLcalwCQp+PztuQzEYUGEMCqEo7gQSrXUCTYKLyUTbNg88=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765807815; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xa75FA/RqA1hTGcKPQBo5+mpgZRoAUQ+aXrfjGdq9w8=; 
	b=WyXpkNBlhQA1E/6JHBrrqxeodpPkHQdRCNidMT5mV8HNGVoLjePPjHP4U10cmXRB24zek0Sri8dPN0nQwKY8V8FwnTaxJItyTZIJpZEUmBUiPBTEMQtqEFwEtPrOJ7rrrbo0vME2xsmp1tRtALHLJfO13sYs5aKpN6qFZLJIMr4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807815;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=xa75FA/RqA1hTGcKPQBo5+mpgZRoAUQ+aXrfjGdq9w8=;
	b=SMOlJD0wpctpy2O7koRqm0IocKl1oGKAFyXSZD/kDNKz+if9gljK5t2+zcP2ah2i
	Njp9Vbfkl09u/E6SUx0xAiRJLeQ+6NlCOk+hJttPcNujWawCMxGstg53Y/QO0HD0P0a
	vr/6oPeMDuVHbAz+VPtl3hXBM7Yr23ryhBoZzS3Q=
Received: by mx.zohomail.com with SMTPS id 1765807811261322.6235762524807;
	Mon, 15 Dec 2025 06:10:11 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 15:09:17 +0100
Subject: [PATCH v5 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-vop2-atomic-fixups-v5-1-83463c075a8d@collabora.com>
References: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
In-Reply-To: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061048_412939_0AC941C1 
X-CRM114-Status: GOOD (  11.55  )
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

From: Daniel Stone <daniels@collabora.com>

We should never be able to create a framebuffer with an unsupported
format, so throw a warning if this ever happens.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..20b49209ddcd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	format = vop2_convert_format(fb->format->format);
-	if (format < 0)
+	/* We shouldn't be able to create a fb for an unsupported format */
+	if (WARN_ON(format < 0))
 		return format;
 
 	/* Co-ordinates have now been clipped */

-- 
2.52.0


