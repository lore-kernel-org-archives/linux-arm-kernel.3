Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89078D43356
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=; b=0CbW0/UxSN2YibbrVGt3VDMR10
	Cxm3Fm7uHIobLLH1DbE92iZjHmJbp3CfSt8R0E+ycRzPgGKho5aGWnDlrzzKLEV5oeOoZl8oztV0n
	ReEIb4Zm6tK3H7aDTGYL1Q/mKEp6xBCSoAQpK8LP3FUgk/gANUGaPt7HQVvKsWA7R0CTmbKrNScQ+
	+3Xld4Yan2ZFaSS1HlF2YnHJKSjTrIB6Fs5Evfehrub/8K8lCsFw22tfGOH2UudD2voNUq3WL/ljz
	K8GMMSeBjBK3abbTEq+A5ZodvuXA+7n4T+CC5U3f5h0U1XmS2MUWUvbS7A+nFrMg/17wxLj7VPhUT
	pOVcCnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTP-0000000HG1L-3Ayi;
	Thu, 11 Dec 2025 20:41:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTL-0000000HFzq-3oZm;
	Thu, 11 Dec 2025 20:41:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765485657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WBkitdwJz9dfAeHGANV0qWkGie5Q52vUHt2nYnvJ5NzD5JtU/j3I+x1F57yCc5clt97Q/eOTynuGHIhIKA5+gxyxMYwbqYRHdNKaywy1PNnh/RHZHWdBbICjUxHF0430pC4WDEoKjnMFFOhCoAmOnPwvYVDvCPWGsofEsFrmOQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765485657; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=; 
	b=Qeh1WLcmAkJBifekdvlq3k0MXXut5K3NiKTb4EhtSQHlR/GkH6arYl5rPgPd0NSkWEehpQn1kUF0cMgMi7bKu4auKM5FjwfdVDXfzluJX8GTxAbbYfDF+FsMA5em3g+FgLhETxrdHvQvFcxLUQx/ZsT49R5e99bKwkv9tqG4kQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765485657;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=;
	b=i5H8CIpHjYGxo7s5vL60QrceF/q6gP8ijx93fnfxAOiuJYj0wd3ylce+eEfl4fkn
	x5kGwXr017YJnJL7RqyxCBigVkDjOffWHhpTzb6UqFLFfOvFmS7hXo534rT8YF0/2jm
	a8o0/3wvhxRiRUVdFQRFLPZHkZq+EPdXwTPN8eHo=
Received: by mx.zohomail.com with SMTPS id 1765485655793219.61784133741503;
	Thu, 11 Dec 2025 12:40:55 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 11 Dec 2025 21:40:31 +0100
Subject: [PATCH v4 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-vop2-atomic-fixups-v4-1-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_124111_987619_184132E9 
X-CRM114-Status: GOOD (  11.95  )
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
format, so throw a warning if this ever happens, instead of attempting
to stagger on.

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


