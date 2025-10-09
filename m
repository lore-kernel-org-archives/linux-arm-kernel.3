Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136BCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRcfuNiAWQPcqMj69WmZyQZ7Shwx4Jwb3Kml5oQ7GSY=; b=sX0Pv0iLCEjwrorkHDw0aPYIpb
	nfJ98SoRd596t5lfOtd8uBwI7kTxC9YYp8EzNr7xKHewxuXncK5Hus7pkLtYHHTRPrF166SSX8TOY
	AVRKYQiWPGHh7L5U/so9MJ58k6iBGPXtuqmDfi1qX0cc3Kir5CDiuRC+hRBc0rVnp0UirmnR6rQSV
	LZlDNXxt7OkoqkICLBm0oUk+2VolR/SP2toqRnMLE7Vwt5flKHBk0ylwyVoMs8qIXM4z9443V91gw
	va/eKRAH9jZFdn1cGEk8VAsU5rc3Uqoi0wjEfYmJvDEOjV53T8vzQD9+WhhdOn3Bh3bmRgp+fPueT
	aT1yDh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sye-00000006YyR-1NS3;
	Thu, 09 Oct 2025 15:54:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6syZ-00000006YsZ-1dNl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025283; x=1791561283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DYH/BgNF8fj6OXrTHIEeZty0YWNPAzxdxzDlmcpIhk=;
  b=KxDv0UMv30tgzOta5Oo2/21fJHpRmKLwhZ2zl2kd3aTNZRq1jSOgEp59
   3V0+TGXhjyH9bm5XySfG+WvW4838MlSCZEhatm31SzBaTF64l6cIaXinL
   G8v/0/Ay23Hqvlh5gKHLONB4qx4EJVPwzSKaCst/TSIMz+iZElp2tnq+I
   oPNvd9QhBmxltpkK0n3cpQBpnHoXN4/2j+S+zfV6vdt6txRGKwejipfBL
   G44G3PrTtcxnQjSH2u8f9carzrq0jRrddhkgfWHwZBx0/EP5M8IVf3tmm
   TGxtKR0jkAwUIIcnegI8qlxBxIyGutUNPAPJGMgXri1B8DqsVjmIzilLy
   g==;
X-CSE-ConnectionGUID: /X4p8s51R2m1uwZxUki7lw==
X-CSE-MsgGUID: 7ZYvUhveRQOgT/nHVgq2lg==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="214905338"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:40 -0700
Received: from chn-vm-ex2.mchp-main.com (10.10.87.31) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.20; Thu, 9 Oct 2025 08:54:31 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:23 -0700
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
Subject: [PATCH 09/18] media: microchip-isc: Register and unregister statistics device
Date: Thu, 9 Oct 2025 21:22:42 +0530
Message-ID: <20251009155251.102472-10-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085443_520387_247E3E04 
X-CRM114-Status: GOOD (  11.51  )
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

Register the statistics sub-device during async complete and ensure
proper cleanup for the same in isc_mc_cleanup().

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/media/platform/microchip/microchip-isc-base.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index cd379f95fc1c..5b49b6ff5ae9 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1912,6 +1912,13 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 		goto isc_async_complete_err;
 	}
 
+	/* Register statistics device */
+	ret = isc_stats_register(isc);
+	if (ret) {
+		dev_err(isc->dev, "Failed to register stats device: %d\n", ret);
+		goto isc_async_complete_unregister_device;
+	}
+
 	ret = isc_scaler_link(isc);
 	if (ret < 0)
 		goto isc_async_complete_unregister_device;
@@ -2036,6 +2043,7 @@ void isc_mc_cleanup(struct isc_device *isc)
 {
 	media_entity_cleanup(&isc->video_dev.entity);
 	media_device_cleanup(&isc->mdev);
+	isc_stats_unregister(isc);
 }
 EXPORT_SYMBOL_GPL(isc_mc_cleanup);
 
-- 
2.34.1


