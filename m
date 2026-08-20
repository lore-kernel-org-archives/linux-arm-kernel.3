Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D56C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 06:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URdjco2vaIrL7tKiOpW03KbiC1VIMP80ns/Qnh28y7g=; b=DW2hY24rtdnN7b7wxCzEADAo1i
	fQdnbfcC7s7lq3/fAZBlpLwCRXm3VWv5cYFW2PkoK1DOptn9XuVWXgQ0bQ+PIFMgRUFULpgjWidIs
	Zsd2UyEQZ/muCB+uWaFIfuWaq9i6+twondjowX7/yt1gSEucHjDGs6uxvjAdSeugSWPmeMG7mB3U+
	uKeSWrFlP+D3Z6KypBxB/CNAiULb1elzAqnmwg0JxcJOqwV0ybMe3lZKeAC1W/h+LHE1SkgeXgnkE
	ZeM+hVr1qxOUpbfeiivGMM5x84ATC0pTAYjDpIkuxRe/xS3sLAFocwIMn7oQTejND0qgIgvLnUq3N
	izzLfLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwfM-0000000Az7M-3ACP;
	Thu, 20 Aug 2026 06:54:20 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwfJ-0000000Az6b-44nM;
	Thu, 20 Aug 2026 06:54:19 +0000
X-UUID: f2c233b09c6311f19a56ed5b684f684d-20260820
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:b9780b3d-5e7d-42fb-9092-b36d87beaf5d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:f21861d1efb1226bc0d257ed0eddec7f,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898|915,TC:nil,Content:0|15|50,EDM:5,I
	P:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2c233b09c6311f19a56ed5b684f684d-20260820
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1439272982; Thu, 20 Aug 2026 14:54:11 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] Input: raspberrypi-ts - reject out-of-range point counts and slot IDs
Date: Thu, 20 Aug 2026 14:53:40 +0800
Message-Id: <20260820065340.3765457-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_235418_325697_2357C7D0 
X-CRM114-Status: UNSURE (   8.91  )
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

rpi_ts_poll() copies a firmware snapshot and walks regs.point[] using
num_points. The array has RPI_TS_MAX_SUPPORTED_POINTS entries, and the
GPU is documented to report 0-10 points (99 invalidates the copy).

A corrupted count would index past that snapshot. Slot IDs are a 4-bit
field (0-15) while only 10 MT slots are allocated. Drop the whole frame
instead of clamping, so a bad report cannot update a subset of contacts.

Fixes: 0b9f28fed3f7 ("Input: add official Raspberry Pi's touchscreen driver")
Cc: stable@vger.kernel.org
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/input/touchscreen/raspberrypi-ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
index 841d39a449b3..bd63d95c094b 100644
--- a/drivers/input/touchscreen/raspberrypi-ts.c
+++ b/drivers/input/touchscreen/raspberrypi-ts.c
@@ -78,6 +78,7 @@ static void rpi_ts_poll(struct input_dev *input)
 		 ts->fw_regs_va + offsetof(struct rpi_ts_regs, num_points));
 
 	if (regs.num_points == RPI_TS_NPOINTS_REG_INVALIDATE ||
+	    regs.num_points > RPI_TS_MAX_SUPPORTED_POINTS ||
 	    (regs.num_points == 0 && ts->known_ids == 0))
 		return;
 
@@ -87,6 +88,9 @@ static void rpi_ts_poll(struct input_dev *input)
 		touchid = (regs.point[i].yh >> 4) & 0xf;
 		event_type = (regs.point[i].xh >> 6) & 0x03;
 
+		if (touchid >= RPI_TS_MAX_SUPPORTED_POINTS)
+			return;
+
 		modified_ids |= BIT(touchid);
 
 		if (event_type == RPI_TS_FTS_TOUCH_DOWN ||
-- 
2.25.1


