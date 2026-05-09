Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3F5CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIg7jH6l469fjJ3LU/wSfvIfeolPJim4znYYu484JlI=; b=vdNsgdiX4hQPnaLUqQCV08rVbk
	A2SczDBYibIF293RFscUxPzA2JOvO2Nf3pLWcky39L3xt+ZaOQp6/cZvcUWxqGU8PYtZhN8kCdSEl
	i8uYDkNHDlpiNBCs4MBCvJPDHcAmU51QC9SVNxa5n2irFE4PpDnKy3bHlZm6cQ9Y4VhSP2HEofUrN
	HILY6HFklnGfMLb2nxdoGOqAT87hwOf7PgNZPt3zYjhZnRod2wk+BcQHXsAhg9QEYwHVh/bVixmiE
	ZSAk+JxEL0R2qVDudGH4mYgdsa8bfA/NjVvZW/Oq78fI2fEWYw67UQ5tZRFvZzwGDGpWW4AgpweoE
	d2u89KEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd8B-00000008aMw-2w1x;
	Sat, 09 May 2026 08:33:51 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd88-00000008aKZ-1wbQ;
	Sat, 09 May 2026 08:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=fIg7jH6l469fjJ3LU/wSfvIfeolPJim4znYYu484JlI=;
	b=FwIfTZ8qDxN8sJoicgyWnyIctN5s0yR8cQu3cxsmST0LVTZyOWlHc3r5VI8zkE
	wR/+6RKKYdbGvF9J7kE+fMOXSbqWrxfsxC5rVOyCXA4sHB8CHL9M9xJQcSTSE4D7
	E32NRifoFhJwnvqMqM0NlcQhaKVylsV8+6orgaQu/KXBM=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wB3LZNd8f5pUxZsAQ--.35506S2;
	Sat, 09 May 2026 16:33:33 +0800 (CST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] drm/rockchip: Fix of_node reference leak in rockchip_drm_encoder_set_crtc_endpoint_id()
Message-ID: <177831561279.322716.8618557593387718298@163.com>
Date: Sat, 09 May 2026 16:33:32 +0800
In-Reply-To: <177831560568.322716.7926332149561323511@163.com>
References: <177831560568.322716.7926332149561323511@163.com>
X-CM-TRANSID: _____wB3LZNd8f5pUxZsAQ--.35506S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF4UWr18Xry5ZFW3Zw17trb_yoW8Ar13pa
	n3Gr9Yvr48GrWfWr10yr47ArySkws2va17CF97C3W3Zan3ArnYyw1fKF1vgr15ArWxuFyj
	yrs7Ga4j9F17urUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjnQUUUUUU=
X-Originating-IP: [42.63.126.112]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7x2tAWn+8V1hpgAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_013348_925214_AB9833B9 
X-CRM114-Status: GOOD (  11.34  )
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

The function rockchip_drm_encoder_set_crtc_endpoint_id() acquires device
tree node references via of_graph_get_endpoint_by_regs() and
of_graph_get_remote_endpoint(), but never releases them. This happens on
all exit paths, including the success path.

This leads to reference count leaks that accumulate during encoder probe.
In deferred probe scenarios or module reload, the leaked references can
cause of_node_get() to eventually return -ENOMEM, breaking subsequent
device tree parsing.

Fix by adding the corresponding of_node_put() calls for both 'en' and
'ren', and use a unified error path to avoid duplication.

Signed-off-by: Jiaqi <shijiaqi_develop@163.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 14 +++++++++----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 8afabe2118a9..1234567890ab 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -278,18 +278,22 @@ int rockchip_drm_encoder_set_crtc_endpoint_id(struct rockchip_encoder *rkencoder,
 {
 	struct of_endpoint ep;
 	struct device_node *en, *ren;
 	int ret;

 	en = of_graph_get_endpoint_by_regs(np, port, reg);
 	if (!en)
 		return -ENOENT;

 	ren = of_graph_get_remote_endpoint(en);
 	if (!ren)
-		return -ENOENT;
+		goto err_put_en;

 	ret = of_graph_parse_endpoint(ren, &ep);
 	if (ret)
-		return ret;
+		goto err_put_ren;

 	rkencoder->crtc_endpoint_id = ep.id;

-	return 0;
+err_put_ren:
+	of_node_put(ren);
+err_put_en:
+	of_node_put(en);
+	return ret;
 }

 /*
--
2.40.0


