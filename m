Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D393C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a9ieoSI7GetS14iPecB62J1+6F1ia29ooBPoWTe60DU=; b=b3h11A6bd1m0wVw3VG2jZFeI2F
	Z2OT1BV1uA9vrTT/tps/ZYCv8QRP3QzU0UXKSXFhzYb8AOAU+3anTlbsy13xpo02wBopVN+Yzeoso
	qq2XEBByVXJ7cdEcxe/OQYSDFiQQiEf+5Y/+/URBawwFvc7TWewPkTtvrjyJOBKzJn/VeeoIZWQxn
	aDBVVBUioKyb1mPvDdHHzReSMf7p2tf/F03G6QxBayqOLQSRv6R96T78BNlAiI77GvGn8lTHXCnci
	PlZfe8oSMszTfkj+JnKsuNu/LDIb15mki6wpFrokpn1r+S/q+ZCl4QMgiJXEA2bb7zLF5ighxRynm
	t8G3p8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWoR-00000004WBV-4984;
	Tue, 01 Jul 2025 08:58:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWm3-00000004Vij-3Lv0;
	Tue, 01 Jul 2025 08:55:33 +0000
Received: from [192.168.1.60] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C497A7E0;
	Tue,  1 Jul 2025 10:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751360106;
	bh=bpUYSyg7FQSqalfiLvbpqYi9zHballtSu0yKxalold4=;
	h=From:Date:Subject:To:Cc:From;
	b=nN+kiD6yZxa3A5kEP9rRpCkA6c0lCYFnWJTbNQIpcgDa57LJTwlA/wMyEZQOB7iA2
	 U9ZcjqJ5lVe7XVUxsB6ihrNMIDSJU0LzSsddYwqbQ4gKiadF9b2ibNB9ywuR8VUMYl
	 Bfg8xiQi9P9tXzkJqxzEBEu8nEVOnx1Hc+/Ziyps=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 01 Jul 2025 10:55:05 +0200
Subject: [PATCH] media: pisp_be: Use clamp() and define max sizes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-pispbe-clamp-v1-1-31243db3439b@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAGiiY2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNj3YLM4oKkVN3knMTcAl2TJGNjA0PDFINUC1MloJaCotS0zAqwcdG
 xtbUAsSezGF4AAAA=
X-Change-ID: 20250623-pispbe-clamp-4b33011d0e85
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=bpUYSyg7FQSqalfiLvbpqYi9zHballtSu0yKxalold4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoY6J/2GyckB7PTepmFR9Z8KBIt+ohmQEHr0vtF
 636rRe1tgeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGOifwAKCRByNAaPFqFW
 PNf+D/9Q7XpnGWqW2Z/2gS0FAMzczkz9mx1p7mIuhqfnDUHB7C48ri0voT/7XctuGnbkAsfLr+O
 G4Yx5tLfV9yxG3HhIMPf4Ph8X3OMxILQJJrO3FQun7KWgNZhGY3QJKEAm3I7XMfhOlgkPz8bC8M
 aecrDBchSO3KOlk5Hwk9SQ2JuVlLDPlpczbrA6uVgWwFyxjO0lDIWCFtm40cPhfwrphr/IRgs1V
 P91dSY3MCumILB82OYa6wkOBY2OJ8JTxP3dgP9zfkGx/r+LChaaDx9W52ZcuYK5BW04zK7E7rGI
 ydpiYZTmait1JJDkEe7BSZLM5bNs5mCfcpLkJjFrxavUxiTWPvdhPw7LXFX4c9kwCmF2DFhe+cf
 lC7W5er3qVxbQzYJblU4qqjzvh4dvEUHvE+cqNhj+mpE+dRIVYEwBJexxIbUyNG3fJl4Psj1/7I
 fBmvWBQx6HUKdKCJdhApWz9+4+Yj4Up8eqrtP0+9XHOZ+4s5izodm+giPJJ7RAfKp01+6Azx+qa
 JYr0phCnRge2L6U9o6nUPTHeb1CB/+uYnF6xUm3n7uAPwT9xX6XY+7jEqQAaqwPpnVHEYev/OPZ
 DwZndwwSi6c3Ttqs61EYrrUcsd9jD6cWCAb11o2j+SyxZPcCYegWFeVlkPsPnHTbPNHPgtW67JA
 aelnvDpRJt7sLag==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_015532_186470_255D59AD 
X-CRM114-Status: UNSURE (   9.97  )
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

Use the clamp() from minmax.h and provide a define for the max size as
they will be used in sequent patches.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c  | 11 +++++++----
 include/uapi/linux/media/raspberrypi/pisp_be_config.h |  9 +++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 7596ae1f7de6671484d4d351015b234829f642d4..ac5840b4be478ccdd7da9d6d0745649e0c1b2b6f 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/lockdep.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -1114,10 +1115,12 @@ static void pispbe_try_format(struct v4l2_format *f, struct pispbe_node *node)
 	f->fmt.pix_mp.pixelformat = fmt->fourcc;
 	f->fmt.pix_mp.num_planes = fmt->num_planes;
 	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-	f->fmt.pix_mp.width = max(min(f->fmt.pix_mp.width, 65536u),
-				  PISP_BACK_END_MIN_TILE_WIDTH);
-	f->fmt.pix_mp.height = max(min(f->fmt.pix_mp.height, 65536u),
-				   PISP_BACK_END_MIN_TILE_HEIGHT);
+	f->fmt.pix_mp.width = clamp(f->fmt.pix_mp.width,
+				    PISP_BACK_END_MIN_TILE_WIDTH,
+				    PISP_BACK_END_MAX_TILE_WIDTH);
+	f->fmt.pix_mp.height = clamp(f->fmt.pix_mp.height,
+				     PISP_BACK_END_MIN_TILE_HEIGHT,
+				     PISP_BACK_END_MAX_TILE_HEIGHT);
 
 	/*
 	 * Fill in the actual colour space when the requested one was
diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
index cbeb714f4d61ad53162c0450f2303431a5958040..2ad3b90684d7be80776af75b5c5009f7b677f466 100644
--- a/include/uapi/linux/media/raspberrypi/pisp_be_config.h
+++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
@@ -21,10 +21,11 @@
 /* preferred byte alignment for outputs */
 #define PISP_BACK_END_OUTPUT_MAX_ALIGN 64u
 
-/* minimum allowed tile width anywhere in the pipeline */
-#define PISP_BACK_END_MIN_TILE_WIDTH 16u
-/* minimum allowed tile width anywhere in the pipeline */
-#define PISP_BACK_END_MIN_TILE_HEIGHT 16u
+/* minimum allowed tile sizes anywhere in the pipeline */
+#define PISP_BACK_END_MIN_TILE_WIDTH	16u
+#define PISP_BACK_END_MIN_TILE_HEIGHT	16u
+#define PISP_BACK_END_MAX_TILE_WIDTH	65536u
+#define PISP_BACK_END_MAX_TILE_HEIGHT	65536u
 
 #define PISP_BACK_END_NUM_OUTPUTS 2
 #define PISP_BACK_END_HOG_OUTPUT 1

---
base-commit: 35392e855abf7d02ad3b061cbc75c7c7c37f0577
change-id: 20250623-pispbe-clamp-4b33011d0e85

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


