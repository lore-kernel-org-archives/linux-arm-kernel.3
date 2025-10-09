Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DF7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCD4rPUvnkCebMeaEapJBrU0tinuybIbsQmhBGOZhOw=; b=tqi470EMjjV/J8FGaYf+bgtEle
	dnmepKkQ1lzK08OKfVHmZ1JRxxxQoU2pkJmijuJsu+7qm+tc7sABqlJ7cgpkaac31kQWtMtWNWV81
	ztKAPvfS/R4ltMaaig/X/5Y54yRliR8nmi8JO4S286G9RF6jmPFn4VHPSC3YX96hunP5jyQ2dsYOZ
	q2yFnL66nRNTxuD3LUTkDJ3e83CP3a3gogx30FuAhgnQ/WPN5Wsj9PCC76fCn32luE/CIC4nVV3hJ
	RAJoAaAFZ4ZKuNOQu/lqMOgcOeJE2V5NvNRCyXeHeFw+yiW/6IvfOTwGejUuM+TKLhh9yebbMTq7t
	oVNcg3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szj-00000006ZnB-191R;
	Thu, 09 Oct 2025 15:55:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szf-00000006ZhY-15o9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025351; x=1791561351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NmHYnwZO3k1u6RXbCftGuTbVjS2S07lpsShuIUYK9b0=;
  b=MklNDhUiAXlDWkg1U5EDOfYbHPQxYJCkC2Dfpk5CZHi8zoXIDPw74Won
   W+XQAhKKLVuGEB0FkXLxChJ5K57+45fQo9ToiCIrS2LjNcn4R78OlgEXu
   4+vQ4dWA5BhXNTJjwWV8ykYuHHyDxWbK3s3Q03FZuvJ7JqMwwNSZi7r73
   WIQYIzi4nQ6y1RJck2emoxi50CzxdVmnx8vBEhywtI6ZtwkUu7WpBvo6H
   S+aWByE9WhX11IRxV5XcMHQPmA4dOC1U6t/L0ClQYe2j5YxE3vHZ0zj3n
   lr/4XBMEEmgkStiIqFrDROAAB+4pEjDW2SoDZitk5Fe+O7OPMnAELrwfe
   w==;
X-CSE-ConnectionGUID: BY5Dt4iOTF6lw0TCi1Tv9Q==
X-CSE-MsgGUID: /RvSuAcuQFKg0QDO0OH5Pg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057949"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:31 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:55:22 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 16/18] media: microchip-isc: enable userspace histogram statistics export
Date: Thu, 9 Oct 2025 21:22:49 +0530
Message-ID: <20251009155251.102472-17-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085551_363539_8B0ADCCA 
X-CRM114-Status: GOOD (  12.43  )
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

From: Balakrishnan Sambath <balakrishnan.s@microchip.com>

Export raw histogram data to userspace only when all 4 Bayer channels
are ready and userspace has active listeners. Also continue AWB work as
long as userspace listeners are active.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index cafd05244db2..6c937a20fce0 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1450,6 +1450,15 @@ static void isc_awb_work(struct work_struct *w)
 	if (hist_id != ISC_HIS_CFG_MODE_B) {
 		hist_id++;
 	} else {
+		/* All 4 channels processed - notify userspace */
+		if (isc_stats_active(&isc->stats))
+			isc_stats_isr(&isc->stats);
+		else
+			dev_info(isc->dev, "No active userspace listeners\n");
+	}
+
+	/* Continue with AWB processing only if AWB is enabled */
+	if (ctrls->awb != ISC_WB_NONE) {
 		isc_wb_update(ctrls);
 		hist_id = ISC_HIS_CFG_MODE_GR;
 	}
@@ -1499,7 +1508,7 @@ static void isc_awb_work(struct work_struct *w)
 	mutex_lock(&isc->awb_mutex);
 
 	/* streaming is not active anymore */
-	if (isc->stop) {
+	if (isc->stop && !isc_stats_active(&isc->stats)) {
 		mutex_unlock(&isc->awb_mutex);
 		return;
 	}
-- 
2.34.1


