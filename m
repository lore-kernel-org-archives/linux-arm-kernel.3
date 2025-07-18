Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C7FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I5N1yFgSMKSP+yKcbwHy28RLjBgi4tDP/QpC0dPcGt8=; b=CtS8EQW8t5AzHNrIMOLD2xPAS2
	G4gCZomS97GTXqBfvbjWeDbxk3bSOMxlpEt6X1hB6RSi/oeFolSIlVdREXTzQUwh2a+xHZfDOe4k3
	vPRTc94QjGHj5rISW5FOZvOPTztVBVHfXjODlIs82TPKlZt1AQoyxd/bQf/Vt2jqmWu3ePsYTchJp
	MCARiu1lhA4TRRX4rcYgLYKIZd7SsvM3OjV0+RjEZGi6b8FI+t874QKwaicaAdQNey/GreiY+Mv5u
	T66uXBfrpSdlJwFkm6xtBoJ16bz6/oGMwWmM7I3OHR3fHS5OOJc2080p+lbWuJjshjjrAgQlUFtcO
	a9/ELPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucf0I-0000000Boqj-19zQ;
	Fri, 18 Jul 2025 06:55:34 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucemm-0000000BnPr-10AB;
	Fri, 18 Jul 2025 06:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=I5
	N1yFgSMKSP+yKcbwHy28RLjBgi4tDP/QpC0dPcGt8=; b=ki+en/rFRoCuGDoc9o
	jj5icWfNYuhgFscJfdlQOsyh8LJDuKh1mdo4qsx2swDaz57tsHTSz+EMB/vi9Xk5
	b+5LFHS9zy3gESIYW+wTyyA8JJzF/Cr290qDCSm/S+UY+k5LEbNTex2E+mykwF1k
	SdO6u4W1zZqhqeFcV2eBfL8Bo=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCHvgSR7HloFskiFg--.22270S2;
	Fri, 18 Jul 2025 14:41:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/2] drm/rockchip: vop2: Add delay between poll registers
Date: Fri, 18 Jul 2025 14:41:13 +0800
Message-ID: <20250718064120.8811-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHvgSR7HloFskiFg--.22270S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4UWrW3KFW5tF48AF1rXrb_yoW8Zr17pw
	4jgF12gF97Ga1jvr1xtr4DZw4Yyan7Aay7Gws7t3s7Gr98Kw1DJ3sI93ZYyFyUJ3Z7ArWj
	vw47J39rAF4q9r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jweOJUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgSOXmh56BWTowAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_234136_598245_C7B74902 
X-CRM114-Status: GOOD (  11.76  )
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

According to the implementation of read_poll_timeout_atomic, if the
delay time is 0, it will only use a simple loop based on timeout_us to
decrement the count. Therefore, the final timeout time will differ
significantly from the setted timteout time. So, here we set a specific
delay time to ensure that the calculation of the timeout duration is accurate.

Fixes: 3e89a8c68354 ("drm/rockchip: vop2: Fix the update of LAYER/PORT select registers when there are multi display output on rk3588/rk3568")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 45c5e39878133..d712c5b6b50e3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2066,7 +2066,7 @@ static void rk3568_vop2_wait_for_port_mux_done(struct vop2 *vop2)
 	 * Spin until the previous port_mux figuration is done.
 	 */
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_port_mux, vop2, port_mux_sel,
-					port_mux_sel == vop2->old_port_sel, 0, 50 * 1000);
+					port_mux_sel == vop2->old_port_sel, 10, 50 * 1000);
 	if (ret)
 		DRM_DEV_ERROR(vop2->dev, "wait port_mux done timeout: 0x%x--0x%x\n",
 			      port_mux_sel, vop2->old_port_sel);
@@ -2086,7 +2086,7 @@ static void rk3568_vop2_wait_for_layer_cfg_done(struct vop2 *vop2, u32 cfg)
 	 * Spin until the previous layer configuration is done.
 	 */
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_layer_cfg, vop2, atv_layer_cfg,
-					atv_layer_cfg == cfg, 0, 50 * 1000);
+					atv_layer_cfg == cfg, 10, 50 * 1000);
 	if (ret)
 		DRM_DEV_ERROR(vop2->dev, "wait layer cfg done timeout: 0x%x--0x%x\n",
 			      atv_layer_cfg, cfg);
-- 
2.43.0


