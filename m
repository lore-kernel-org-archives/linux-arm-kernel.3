Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ADCFD877E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQGyNX2rBt2iB+b2evCGTpRYh6fL1wdoBxj7sBrXcG4=; b=GJs+PJvI2uZPxve7GGygggPnz7
	L8G6SADEsqUMejeBdrrWTag+pCSjeLxrYePVJ+eEuLahKNXjrEHID/YybNsE/U7AMFQxGeiicFK7N
	VWf6aU1Lr8IcSwSKhVNXPk+MLMV+Fl+7h3yBLi5ymCVERWK0KTRQ+kFS9P9oNCU3w4uw17Uqren14
	+J8sAzDrRmYk/zouTT0cMTyQvWmaNCjFDVmaNiZrqJfLGYMSdcZN63WnCkFG3ylkpwSK2mF6X3OMa
	3F234m43XT2mE/nUNrIYuyVBbMPQYCVDTFRRq3bByQhQJwNrAQ41WcHIl+lPgNo5Q/6lHMSGAp4CZ
	VkBSO+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VSP-00000006cPu-1Me2;
	Tue, 17 Mar 2026 14:31:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VSM-00000006cPU-3Puq;
	Tue, 17 Mar 2026 14:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773757895;
	bh=rM6Cq3+ZUiC+AZdFn8pQ1HrieI0QVdQPA7j0GTmtziQ=;
	h=From:Date:Subject:To:Cc:From;
	b=f7s6+i5qeAAhNNBIIP95or8sqqZR8VV6EGDPuK8gMGdnGKIYgdrqCGWQYS9HIzSaN
	 2wZBja0TR0tFI7I0+c8Cs2VS5tokSz/B/ra35kideju+jeOk02YJDVLZmOYn4rWfxV
	 jjSxMPbKSziXYWH6huiEGpbfo6DIVvjfCY/JUbiRSGTlY7Kc+p2/I3jDtH89p4Js9T
	 w6rU1fz7iUXCY+ZNNwPLEyY0frIzXfaMkj3SVOv/9fy79bjshbBXszs771K1Xs/Ebt
	 XnoE8osfJw38Qr4L0gugLufChcL5L0w0B/UXDTQ+7/iqlJ4Xj3CxlV409IZqwNW6Ok
	 +8O06/Znl5KJQ==
Received: from jupiter.universe (dyndsl-091-248-085-025.ewe-ip-backbone.de [91.248.85.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE84517E0E3F;
	Tue, 17 Mar 2026 15:31:35 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 4D43348002A; Tue, 17 Mar 2026 15:31:35 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 17 Mar 2026 15:31:30 +0100
Subject: [PATCH] thermal/drivers/rockchip: Shut up eFuse prober defer
 warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rockchip-thermal-trim-warning-v1-1-01bc4bda75e9@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMFluWkC/x3MwQpAQBAA0F/RnE2tJcqvyGFaw05YmhVK/t3m+
 C7vgcgqHKHNHlA+JcoWEoo8A+cpTIwyJIM1tjZl0aBubnZedjw860oLHiorXqRBwoRuMKaxRHa
 sakjHrjzK/f9d/74fe+Y/z28AAAA=
X-Change-ID: 20260317-rockchip-thermal-trim-warning-cd0072aa2f46
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=rM6Cq3+ZUiC+AZdFn8pQ1HrieI0QVdQPA7j0GTmtziQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm5ZcfOlHQ7B7RY9QNFeSFEmZIw2HGpVt8dv
 mD4+j/mpmTEmYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuWXHAAoJENju1/PI
 O/qaA5UP/1gX3O/UsiG5YGu6U32IAcf1ROmf2gS3hTr4Qy5C2UMVBC7FyJuV3Yhwotm+tZ1FedJ
 pTWqekZXX90khjfN1dAct8DmQmL4NEc8O60f7g9q79Hu1D2nTOBOJBvmmWE6esZJAE+tx1q65Uw
 MA47NDvMaki1BpkU/rA8rzAsYiEdZpmOYQMCYZN5wkb6Ida/Khc8gZxDum1qVSIAlmcGyphmfN5
 Kj/oV7weqc3RTJKvb45VwRYrll4RKQ7gEUN8Sjq1XAUtdKql3bbSIJywX4atWfRPpCW5y81V0/S
 GI+iDnZf5u22N44RLZskYy+DA/UxR7RwKEGO9/rQ2zwI+TTRGsEi9q1/0mIsbUdoIlK1W9VQSDm
 6GWiMBIvMSyFHDcGJC+upkL8eBX7AKlBCGWF3FqJdjnPzpcgx8uxa5VQkryAJPx8wua5YwsHv1w
 dvGb0iz8dPzZph2NnL7MmQOZcxfXqdve/9oJce3FLPgXLBhvD/CbvsfEIaKLiObDl174lSqybff
 Vn6YT3C5iS2Y7ecuwLHcW1TE1qAUchL/tGxR8wLaSqSchzSZyOXb2RLBQxM2MppiwzpJspxw7tM
 sWCClZLrjhReq0cf3qCvxrgbQON1ubEtTtCwX+7Uvjd3bA4BuUFiZ6TbF0WXI+eaDvn5TLOqvJ0
 ML+Y/XnxAN06UQL8iX2QtsA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_073139_029169_6F6D8910 
X-CRM114-Status: UNSURE (   9.45  )
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

Shut up the following message printed at error level on ArmSom Sige5:

rockchip-thermal 2ae70000.tsadc: failed reading trim of sensor 0: -EPROBE_DEFER

Fixes: ae332ec0009d ("thermal/drivers/rockchip: Support reading trim values from OTP")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/thermal/rockchip_thermal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index c49ddf70f86e..2a40339de0d0 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -1638,8 +1638,7 @@ rockchip_thermal_register_sensor(struct platform_device *pdev,
 	if (tsadc->get_trim_code && sensor->of_node) {
 		error = rockchip_get_efuse_value(sensor->of_node, "trim", &trim);
 		if (error < 0 && error != -ENOENT) {
-			dev_err(dev, "failed reading trim of sensor %d: %pe\n",
-				id, ERR_PTR(error));
+			dev_err_probe(dev, error, "failed reading trim of sensor %d\n", id);
 			return error;
 		}
 		if (trim) {

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260317-rockchip-thermal-trim-warning-cd0072aa2f46

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


