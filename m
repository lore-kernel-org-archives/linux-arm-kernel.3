Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D81CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLio9+kRidAJSxQFMSKUYxTYuLWpQl8YXGU2NG6RQaM=; b=UBmRyG/SsaH1/JR04E7OrHfMuN
	Y0ZHmLgJd8QljcnQYFexvm8+nCsX8pEkqVVUQJAP/PrKPVbrqpWkE0zms7BUmPnt5b+3RHk7NfV0i
	a9h+I4iV9hlO4DUAjPYeRmxl3zyhIyJ4fFgJM72RyHGenS+IbG2bV4rUQ2pOc8YeA08PxYaIt2xzr
	/DY0cyMPCRazZNj9JB1srIxs+S8rzdnVSwxfacnZibFI4mNgPk4Z+Cb4H8O5iNXzC90IGxX7Zld7L
	jFbo+k3ypS+it5JF2EYKy52Ng1k2DKKWwli6e5bjNh5bLHCrWKU933IEXrf5KyRJ+rnGrNoiGEqsW
	3ubK47BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssJ-00000006yro-1UPl;
	Fri, 29 May 2026 08:47:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssF-00000006ynL-0MZY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:24 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B84C4227C;
	Fri, 29 May 2026 10:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044421;
	bh=7Kq5ctr2zF2W69THhXrq0QBJ23m1uyPy7zIOXMhkLEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eZG/ZNXAfl7bnNiUPEgcQ0ECSqyzMg1KefvVWDy/S5Yhldonitv6OpWPxg/zU6YYi
	 +sJ1QWHDgGummTUEkyLrvmOHnRwb9a8mSofP4HOAjvYUz6XiwgXf8xRRs9DZLpmBwV
	 wCIbqegY06sWRbAF6dplT3NZrvjZCpjU1nwt5BbM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:36 +0300
Subject: [PATCH v3 06/15] drm/tidss: Remove extra pm_runtime_mark_last_busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-6-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=754;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=7Kq5ctr2zF2W69THhXrq0QBJ23m1uyPy7zIOXMhkLEE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKNTJ4fTgJ5gD/d+Zr5V6tnn1Mr+F1HwSqe4
 QuiwdQdRvKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjQAKCRD6PaqMvJYe
 9QRRD/9CAsn+XdBkkLHKZTZ410UIFK74/ErvcBkGDuPyqCcRJw8lEwRIB2cNUu7u6mEB9sDtW0C
 xuESrqQ+hzuHmupiDo/V01e+rZ3LwreY3TcmKmZHOIiVzSH79P6KWXhh4Q03vaDHnr8CBb8lvIb
 3ZQV+G1egX+6Fa0fAuS2eqS+DRWsye6NZIoHL9im4imGuFFu0D0r74zHRUeU6etI4e3resDHdk/
 breUxZVu8Wj1/uASTHkbQGabWRHRuv6cNiPAogQiKTBMGncaZRjwfLGupOWTua8ZhTBFxmRUCwy
 D9NPI9IuSQmHkMsj4D+jN20g1MM21mHvRA7U6TTz/qhq3PmqdwgKT1UGxwZgfD3PiHbc/dibE/6
 2mISeUOu9Ft7ZG8PXAmf04loDnoUrjs9waX3sexBgxhztSuHq0zxBIVHKg7MfUacnkthtONFRWl
 6DP3jH8NE/4u3Vomli/FsrK4C5Wi03pswEQSNiVcDFtBGyCAglufJJJH0kPOoWgxydCkg8ZqOch
 bAxmwLFdvioYvGSEFu81gJuZ1hr3rHVmlus1XHE0yoXBuCwVoT9uhT3711jI+h0h4vQ1gnP/ssJ
 rSXWxJl0W7fk95U8l8sJ4D0lja3udsJ6rttF/McDkDrHZndtKvNWyFI/EHACOAP5o4YaDtVuw48
 cBuPpWpSU4dcLZQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014723_274693_D87BB90E 
X-CRM114-Status: UNSURE (   8.20  )
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

pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy(), so no
need to call pm_runtime_mark_last_busy() explicitly in the driver.

Tested-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 1c8cc18bc53c..5cb3e746aeb3 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -42,8 +42,6 @@ void tidss_runtime_put(struct tidss_device *tidss)
 {
 	int r;
 
-	pm_runtime_mark_last_busy(tidss->dev);
-
 	r = pm_runtime_put_autosuspend(tidss->dev);
 	WARN_ON(r < 0);
 }

-- 
2.43.0


