Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E513D3B7D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=; b=eszPX16Cn4h0n+kQq1OTdAplnR
	5dI52hqPHBNHX209kZ0DHmlPWyFrwEvuBbeMXsQKZFJflJgFe7jKA9VD7Y9hfkMLoO2b2yyiB/N9b
	5/AVVXyVeG0dzhRb/S7Y5q/JV0q5HD4KMgy1CDCrmXSUjfHgLMz0jdq+sGDHpTdCv3tMdY9woSW0u
	MAKgk00cebO/Wnv+K1uav0EF9mQJYyFRrBZFU6AFnTrC02WpELSpwGIWPIhPcanJFg1NelJZJowRH
	67tgVcrnTthNv/Zg0vfthgRN27Wft4NvPJ66FHGoMUwQnZ/HVN79aAvuE6MY6beb9iKV+I2TNFyYx
	2jhNzuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAL-0000000BDAC-1G7U;
	Sat, 06 Dec 2025 20:46:05 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAD-0000000BD8N-3Bl4;
	Sat, 06 Dec 2025 20:46:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bxKxX6bz3DVF7YxxfRqjfwVgFsHjh0zZMWFwX02HAjgyZn2nVlVT+AYF0JJKUNMeBP3dZL+NrtGkftpQgR3x2Op51YmqZzuT36XqkOtjhdZSLZBbIgHnSmvf8ZMWe9zaDcyfixpa6856V9yXEsKbBOncuNj6vyCn2fBtKaIryBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053942; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=; 
	b=PjBXyb9SRnT63beS2uyQjY+xkQ2a46zTQRJLrMdt4PC02LhuR1qTcJ9BQHzJKbHTUeZbSkdZJuV3C+ms1iP8K3QdaDtdGSx1fZgiylYr6KJ3W5LRpl3l8aXk4es7VnvkGQSfV6eZ/ZF/oLK/Hu6sof7HwhRqNb4HpFd1i8hytdo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053942;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=;
	b=dGlxK8TY+xA/Dg/qdYMwl7T2Kg0iLNu73rvjEY0NROd9EnRzBsoMkXsbfcW9B7vp
	Oq8qeP+5KUk0FFX+xkNE9nsbsFtg+S5DJz9M1KbXuqX3eSmXr5GIVVj4Hqk3JneZoZv
	/qL9yzB7ICQtHlckBINWsAbwzZdkjV0VaCfAaULs=
Received: by mx.zohomail.com with SMTPS id 1765053941764885.8345194629629;
	Sat, 6 Dec 2025 12:45:41 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:11 +0100
Subject: [PATCH v2 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-1-7fb45bbfbebd@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
In-Reply-To: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_124601_012189_8CDA9F70 
X-CRM114-Status: GOOD (  11.17  )
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


