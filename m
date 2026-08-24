Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8EEC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:Subject:
	Content-Transfer-Encoding:Mime-Version:Message-Id:To:References:Date:From:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2ERPFIrOa+gDnsmMFvcRecBvtEZUGxg6dBSiPNWMUk=; b=iBIz9ZpL1IHGQdQheqXHm87u9y
	srSKPqCykdorJsSLoLD/bBy+lY6f685P6EJAIpcwbsXx46WI6RJVqoGdivK0OXkAHS/ML2Pcx6Px5
	IlOMDj3eo5t4XDhCy0/9pw78XHgmhUE5xKrAu2GCBnMN9dJaz881T8E2F+SeS4fhl6MIQzjhPK4d2
	g58BS1RGlbaxdL1FQAYWTOAhqErTB/GX1FqXiU4sTjNKYmWcHFdJgYmiEPG6bfkuyuGDUbmcP4D0g
	Ve3t0RTRrKtRswjaQXXg0gqa0KsHoEXeg3sbOhkXFEOLZx6Ciw39rLmXvzlVWgJqvUuEDi5hUXrWj
	0XKTEOQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRb-0000000HJYJ-1GuT;
	Mon, 24 Aug 2026 19:34:55 +0000
Received: from sg-2-1.ptr.blmpb.com ([71.18.227.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaRX-0000000HJWm-2Aw7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:34:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1787600082; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=G2ERPFIrOa+gDnsmMFvcRecBvtEZUGxg6dBSiPNWMUk=;
 b=xTIl7NjwTnuivp6bfW656TfpVRSSSTXptfLdk2s8Yba7gWvdY2s4jkDcDljDxMfgGnnbvQ
 FLUzyjET8n0yY5l3Z0FLEHJdmsLaFDDlQYv+TT50PCy4U1+Ge1X3j6UbX/izAJf+eAFjpL
 fhPo7LQF82pDRa+nhbOhJwFyQ4xY9fBLWc4HpC9DjyCYFEOMA4CjESS4DqSXpnBEaLeUvF
 CoLrCbX61D577fpcHOmvgDuLn87YSkvIYO8eGRz61ajHFR7ftwrDQLQkFBTAX5vOJs3vtO
 jbyG8OMKIc347W4bCZtmllBJIRCaDbtsXNejtYzbh6OQK54mMJpTUEceZH9DoQ==
Content-Type: text/plain; charset=UTF-8
From: "Shengzhuo Wei" <me@cherr.cc>
Date: Tue, 25 Aug 2026 03:34:31 +0800
X-Lms-Return-Path: <lba+26a8c9cd0+212099+lists.infradead.org+me@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.163]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 03:34:40 +0800
References: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
To: "Mirela Rabulea" <mirela.rabulea@nxp.com>, 
	"Mauro Carvalho Chehab" <mchehab@kernel.org>, 
	"Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, 
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, 
	"Fabio Estevam" <festevam@gmail.com>, 
	"Hans Verkuil" <hverkuil@kernel.org>, "Ming Qian" <ming.qian@nxp.com>, 
	"Nicolas Dufresne" <nicolas.dufresne@collabora.com>, 
	"Benjamin Gaignard" <benjamin.gaignard@collabora.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, 
	"Bin Liu" <bin.liu@mediatek.com>, 
	"Matthias Brugger" <matthias.bgg@gmail.com>, 
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, 
	"irui wang" <irui.wang@mediatek.com>, "kyrie wu" <kyrie.wu@mediatek.com>
Message-Id: <20260825-media-timeout-work-v1-2-ebfebbeb6c31@cherr.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Shengzhuo Wei <me@cherr.cc>
X-Mailer: b4 0.14.2
Subject: [PATCH 2/3] media: verisilicon: hantro: cancel watchdog work before m2m release
In-Reply-To: <20260825-media-timeout-work-v1-0-ebfebbeb6c31@cherr.cc>
Cc: <imx@lists.linux.dev>, <linux-media@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_123451_777119_5BB87624 
X-CRM114-Status: UNSURE (   6.93  )
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

Each job arms vpu->watchdog_work, cancelled only by the
job-completion path. If a job stalls, hantro_remove() drops the last
reference to vpu->m2m_dev via v4l2_m2m_put() with the watchdog still
pending, and hantro_watchdog() then dereferences the freed m2m_dev --
a use-after-free.

Drain the watchdog before the m2m device is released.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
Assisted-by: GLM:5.3
---
 drivers/media/platform/verisilicon/hantro_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640fb429b18d2f4fd64bc0c392cf600e..1b04b98371a48184f390a13791243fd00d6b80ef 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1284,6 +1284,7 @@ static void hantro_remove(struct platform_device *pdev)
 	hantro_remove_dec_func(vpu);
 	hantro_remove_enc_func(vpu);
 	media_device_cleanup(&vpu->mdev);
+	cancel_delayed_work_sync(&vpu->watchdog_work);
 	v4l2_m2m_put(vpu->m2m_dev);
 	v4l2_device_unregister(&vpu->v4l2_dev);
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);

-- 
2.47.3

