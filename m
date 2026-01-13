Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D3DD29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFWXdY9rCZz2lP+ZMby/RBKAdIIg9yorRhqsIWhW4r4=; b=01avh/De/8l1DNi1aqkC4BGRKu
	EFdPEYsp1nMbE21QDGHre/oNvHaV2wiHgdelTUGPJY1YzBbT1CHeh+a82Xprr19tj5BmWdhJUzT3v
	t+3/bH+Xuic/zJ9bMMC7RhXZCj0+iFprVb5Xxs+JavIgcczKDwDeCnIH0F1mpTsN6yamINiu131X3
	rNfldhG4IFJjbdpt+FiLKF4XvwKuX1xw5ubOWbgTHdrARW6XSwzSWa+aOoN1toigf/hyAql7VBEQM
	MJFeV99nmuAWK+VuIEUvqsUAwqFSXzo+pjF1UwdUw3V+8fo7Y8XeQ5mGslwJovyEaYf3llFwnsXlQ
	AN6QF2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNY-00000006nxl-2rsy;
	Tue, 13 Jan 2026 09:07:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNW-00000006nua-3mTG;
	Tue, 13 Jan 2026 09:07:56 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37F462E0;
	Tue, 13 Jan 2026 10:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295247;
	bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RdgR5R+ia87a0N8L0nDCfg9aHft7I1PYvzp9NPCaP2rxuMFsw6hLpNrMXsuEag7ox
	 KOdWVcHUF50L0CpBJ4YEkiWPNp4A3pFZx/I90FCQhHsaWHGkPNomAg0N95Fy5fotjR
	 fIT53FKmyEJO8nUw3UxQAe+8tQED8ZRd1EIWl5Io=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:24 +0530
Subject: [PATCH 04/10] platform/raspberrypi: vchiq: Add helpers for vchiq
 driver data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-4-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, 
 Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2sCGzoSzlhrxwPHsDW8b9Ti5c4ohWUGul3MmOV8ix28=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtGmZOjclOCJK85U9Q+xLbI3zQbMCWvKU34L
 xfgBhq4mq+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLRgAKCRBD3pH5JJpx
 RVwxD/9NI1SbAADbi6B5DofPysMgqbZqohGe5vEtV93olv8Ghr9B7MsHWK/yFXpgCjg7yroiEKT
 8PcTJ8/WwnMCo2iWOZrnXUt28RSqw0LsQ2p/hn4H/koebZRGlk/W61yMu6oDY8sACl4GTbPnn+w
 M0NwGv4C1WUQ7G66mGdYiHPg+FpKmpGU4vsD8/8ONlN4hyLMq1B0A37s+oGHNbCop07cr3TDPrd
 RY6cbV1iQhj2cCosVfmiwXsQXiTKlrUr4HjLEoeTRoY2FNfeajurFGUesNL2J4Ra07yVz4lWBBt
 FTHQx504z5nJYT5lIDhdmA7DdaWqGu/nFomBgeeyL79bs23VrXeuhn1I0U32C8XFBf3wUm2roJQ
 GQmWOu5caxlD2WF/jqhrdnOa1sfZar+g7da2X/Nn08RHuujaSG+OykLG4xdWmYnSdThZIvZpQju
 WZaU/RI3TLBoeF9LSJAcTJBRtJYjGvnhLGuUiP/N0P12yX1cMQu4+ENyKq0IenS5qX6rtG4wqfP
 Z3vKtY/Peg+vdajJ0bkfPgLV0OpDoGghTGRwi81rQ8v52gusaxZuLiTAVMex1IUmLrOKvR8iwpr
 5LmqPaQ8wcpg2AlXBxzHHHYY+W9va3YrAh1zdB/7x2K6saFC73cDjG4LO7jVoosoZDoFRf2tWZ2
 OOx5jNNB1Jyy5jg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010755_085456_55A6AEDE 
X-CRM114-Status: UNSURE (   8.26  )
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

Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
respectively.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspberrypi/vchiq_bus.h
index 9de179b39f85e5e94c1e948030fccf0c52a00fcd..6eff6b0bf5995683ef0468bc811334b7ff4f8c19 100644
--- a/include/linux/raspberrypi/vchiq_bus.h
+++ b/include/linux/raspberrypi/vchiq_bus.h
@@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(struct device_driver *d)
 	return container_of(d, struct vchiq_driver, driver);
 }
 
+static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
+{
+	return dev_get_drvdata(&device->dev);
+}
+
+static inline void vchiq_set_drvdata(struct vchiq_device *device, void *data)
+{
+	dev_set_drvdata(&device->dev, data);
+}
+
 extern const struct bus_type vchiq_bus_type;
 
 struct vchiq_device *

-- 
2.52.0


