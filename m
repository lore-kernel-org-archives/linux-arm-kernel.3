Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D2606C5AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FGxkfoaz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CnTGAzsEPJVKC2tZ84EFt0Wg+eAK2QZrF0H1p9wbIEA=; b=FGxkfoazBE0yUa4dbNyBKX5BOH
	CEUcObQl2n16oHWqo0ZIqsNS9QyYD1m4XAmF7wcB8FDZ/yxhyyUI/u59KbrZTB8U2RJg09m012n3O
	JJpzHIhd4Bp69JaiBCZO8GoIISSJCa6stZMLKFNUM0RMpLxfobv4jXEjbaPd+3wx94LHOHpfozx5Z
	53iCi0kVkUQIJOmmXUIotMZRvllSv5CqKX2fjoCd2WKll/uKTRQ89mw2NCswuy5LqNr5otzJs7UnL
	Yx0TYMSFu61JXqSpEwlb0FGsVY1MAQdtCeMDx9qQdFs0pNHkDh1o+SMmrbdKwO/62ViGhvn3BZOvB
	K/gGlUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1f-000000024M9-0RTx;
	Tue, 03 Nov 2026 10:45:59 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC1c-000000024IE-2OPb;
	Tue, 03 Nov 2026 10:45:57 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xOC1V-0000000032l-3BX5;
	Tue, 03 Nov 2026 10:45:49 +0000
Date: Tue, 3 Nov 2026 10:45:47 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] media: rockchip: rkcif: raise the MIPI DMA write priority
Message-ID: <38f62ccfaf96bca1c79755cf393f89c6177fdd15.1793702189.git.daniel@makrotopia.org>
References: <cover.1793702189.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793702189.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024556_611849_D6DA2120 
X-CRM114-Status: GOOD (  13.73  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MIPI control register holds the DDR urgency controls of the write
FIFO: a pressure level and a hurry level, each with its enable, and the
FIFO water line above which they apply. The driver sets only the water
line enable bit.

Program the values the vendor driver uses, pressure and hurry at level
three from a quarter-full FIFO, so that the capture raises its priority
on the memory bus as the FIFO fills. The bit layout is the same on the
RK3568, RV1126 and RK3588.

Assisted-by: LLM
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../rockchip/rkcif/rkcif-capture-mipi.c       | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 0cef1cc35eedd..a00fe64a1a9d4 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -37,7 +37,12 @@
 #define RK3588_MIPI_CTRL0_CROP_EN     BIT(4)
 #define RK3588_MIPI_CTRL0_PARSE(type) ((type) << 1)
 
-#define RK3588_MIPI_CTRL_CAP_EN       BIT(0)
+#define RKCIF_MIPI_CTRL_PRESS_VALUE(x) ((x) << 13)
+#define RKCIF_MIPI_CTRL_PRESS_ENABLE BIT(12)
+#define RKCIF_MIPI_CTRL_HURRY_VALUE(x) ((x) << 5)
+#define RKCIF_MIPI_CTRL_HURRY_ENABLE BIT(4)
+#define RKCIF_MIPI_CTRL_WATER_LINE_25 (0x2 << 1)
+#define RKCIF_MIPI_CTRL_WATER_LINE_ENABLE BIT(0)
 
 #define RKCIF_MIPI_CTRL0_DT_ID(id)    ((id) << 10)
 #define RKCIF_MIPI_CTRL0_VC_ID(id)    ((id) << 8)
@@ -891,12 +896,13 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
 
-	/*
-	 * TODO: This bit has a different meaning on the RK3568, but it is
-	 * set there by default anyway. While correct, this is not exactly
-	 * nice and shall be reworked during the next refactoring.
-	 */
-	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RK3588_MIPI_CTRL_CAP_EN);
+	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL,
+			 RKCIF_MIPI_CTRL_PRESS_VALUE(3) |
+				 RKCIF_MIPI_CTRL_PRESS_ENABLE |
+				 RKCIF_MIPI_CTRL_HURRY_VALUE(3) |
+				 RKCIF_MIPI_CTRL_HURRY_ENABLE |
+				 RKCIF_MIPI_CTRL_WATER_LINE_25 |
+				 RKCIF_MIPI_CTRL_WATER_LINE_ENABLE);
 
 	return 0;
 }
-- 
2.56.0

