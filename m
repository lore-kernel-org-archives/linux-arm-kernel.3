Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E5DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fjXzCKkc9E0Mj0EQ+SFntyn+oA0UyS6dkYnBIIttEM0=; b=RKcr/Ucpb9z6t8VFvxW86fikzX
	9+O69BFx/6XMU6NfckjyYlK5kchFCbDnaj4qL5sr1Aj1XeXVu4hU+JAmBJPFYx7QlwYlP7YYj6LaI
	ng//J/q7eaBXkeFpZbkendkJpJcBp9hDPZWvPE/RW1JbXEOkqENdf1NkH8CoirMwYUOXiDQoZ3u35
	9rSNK3xd510NkP8n9e9jr7QXzJPaJuVhT4nMXE820yNH5cO68jC9eu3p6OG0QeMt/qzbqP0crEE+b
	WeSBLCF0GveTtBRTLxrXu7URPGCpOFRx1wZrNJMpsqVgagF9f5HZx7KEnZVFb6Q02lK43+PkETwtE
	h3nhnwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szh-00000006Zkl-0T4Z;
	Thu, 09 Oct 2025 15:55:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6szd-00000006ZhY-41FG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025350; x=1791561350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=186aunkFZ+DaR7NwbVBgBmpyszUiuZDCagnLEubuYVI=;
  b=tceG3tzJj96pEpB8EmvtnbZMozJx61OCL4l9FtRHmwRu1uyvuAytPC0o
   kiNHPtUtGAl2netaaqwVj6ntc5VSYEyh3zM1LMsogg+7wNN65PtM8GbbZ
   Gm7JayAsPPtpCNuCeFxMnfyD3Iz2hBtneJKhpt8sybfNEfWTy3igfsGGv
   FmvylRnNk4mB6fh97Qz8VBmlMhKoE72/4iMN8NVXZvIbb3oinMDzY+8Bb
   v5leIJzW8AmK1zOT9XLpXdpbqhU5ezcvKfmuS/dvHHi7kqyALsAx36YwN
   p21vs1elR4mlAufQ8YLU3ze939kr9XW5XVvWbdStFckI45IvSA5w+aQUS
   A==;
X-CSE-ConnectionGUID: BY5Dt4iOTF6lw0TCi1Tv9Q==
X-CSE-MsgGUID: gRBAh4qzTtiU7k10zAP/nw==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="48057947"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:55:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:55:22 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:55:14 -0700
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
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 15/18] media: microchip-isc: decouple histogram cycling from AWB mode
Date: Thu, 9 Oct 2025 21:22:48 +0530
Message-ID: <20251009155251.102472-16-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085550_060354_BAD55D4B 
X-CRM114-Status: GOOD (  11.73  )
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

Fix histogram cycling stopping after first channel when AWB is disabled.
Now the histogram cycling will continue even when AWB is disabled,
enabling hardware histogram data export to userspace.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index e9f14de7ae32..cafd05244db2 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1509,7 +1509,7 @@ static void isc_awb_work(struct work_struct *w)
 	mutex_unlock(&isc->awb_mutex);
 
 	/* if awb has been disabled, we don't need to start another histogram */
-	if (ctrls->awb)
+	if (ctrls->hist_stat == HIST_ENABLED)
 		regmap_write(regmap, ISC_CTRLEN, ISC_CTRL_HISREQ);
 
 	pm_runtime_put_sync(isc->dev);
-- 
2.34.1


