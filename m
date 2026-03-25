Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D0D109C029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z40Mi8u8il1jDYcIoOZ5AUNABNvjNOtuGBGwSykKX0E=; b=Gvd8MIdRKDxf2hDHf/GkZKo0aO
	PjCw+xWZVKcZSNSoiT+tQPtqy51WEa2GKz9IuvTd/yKfUCaNuoTdAJp26xzxkeMHTb0JEbrhGtQ/5
	56t662Czh8W95TaBhbRNpq4QQgQsj2JK8bHPQezOhX4fl8SM/4uyGWtur0i8A4zRM2GhgThtHwtAQ
	NQaUH7PuyRZz9W8M/lKoC46FP9l4rK5BOIcbm7ZvZGPxG1e0M6ln0JuKThoXZnjyMNPpG5w5ngrsH
	H4Lgv1bRC66UfZlhTPg2GHzDjD80v5QJMwVGsitJF2F/qbeB+yl89zqBInY/wX/lNQz8mkMTUgYey
	aTvqcH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Pat-00000003hJR-1NAw;
	Wed, 25 Mar 2026 14:52:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZk-00000003fhV-0GHH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Mar 2026 14:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=z40Mi8u8il1jDYcIoOZ5AUNABNvjNOtuGBGwSykKX0E=; b=QUOmn/qAAWHq4TvbT5P2knGBTf
	lNN4SdLCvfXXT0hHlf65skRh5dm7VTi9zkyzDX6b09fyOuFNdGRFyzVJxblTGG3e94mmVXUXMHVoB
	WvztMaz/jH2JR9crQMjG1GycwB48XStLpKCoGUmNJG7t4NQXxRE+ysoRffPHKd1XoK49GDpX7+7hr
	r8+6VWh3+aZdjoZ9EVTzraTverjYR56sXRC0v8Ea8GvEcR0Pt0OTqULwXCmU1EVt2ag9QKZ05GBAG
	rqDVJZ1ILbSICmv9Rb1FMkWAP4bmuzZJusbaGlNipDvIgHNtD7GX7F94jRjm2VE8BGCdANIbPxsdf
	pZxA7gqA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PZb-00000006OYP-3zlF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:51:13 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w5PZV-00050C-BP; Wed, 25 Mar 2026 15:51:01 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 25 Mar 2026 15:50:48 +0100
Subject: [PATCH v4 17/27] media: rockchip: rga: use card type to specify
 rga type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-spu-rga3-v4-17-e90ec1c61354@pengutronix.de>
References: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
In-Reply-To: <20260325-spu-rga3-v4-0-e90ec1c61354@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, nicolas@ndufresne.ca, 
 sebastian.reichel@collabora.com, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_145108_106499_38C75ABD 
X-CRM114-Status: GOOD (  14.62  )
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

In preparation of the RGA3 support add a filed to the rga_hw struct
to specify the desired card type value. This allows the user to
differentiate the RGA2 and RGA3 video device nodes.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 1 +
 drivers/media/platform/rockchip/rga/rga.c    | 4 +++-
 drivers/media/platform/rockchip/rga/rga.h    | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 7a4070665fed7..f6070508b1475 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -577,6 +577,7 @@ static struct rga_fmt formats[] = {
 };
 
 const struct rga_hw rga2_hw = {
+	.card_type = "rga2",
 	.formats = formats,
 	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 75d05c86b1c00..421a70558c3c7 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -306,8 +306,10 @@ static const struct v4l2_file_operations rga_fops = {
 static int
 vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 {
+	struct rockchip_rga *rga = video_drvdata(file);
+
 	strscpy(cap->driver, RGA_NAME, sizeof(cap->driver));
-	strscpy(cap->card, "rockchip-rga", sizeof(cap->card));
+	strscpy(cap->card, rga->hw->card_type, sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:rga", sizeof(cap->bus_info));
 
 	return 0;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index 454af283b1694..dc6f90b843c32 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -145,6 +145,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 };
 
 struct rga_hw {
+	const char *card_type;
 	struct rga_fmt *formats;
 	u32 num_formats;
 	size_t cmdbuf_size;

-- 
2.53.0


