Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668B0CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LYJooa3CPyiL/YqvqFJbpYPNVK38FpDeFlhZ7s1lavw=; b=Qw36rTbiEF6RY7KnKxq4WTd20N
	ZhEnnecOssZURNajGdydZktmO7GS3mP82s8z5JWU++WlmNXkwRyv/V6ifXK/zA4BAab3IgxSgquSh
	8z27CNcqCqvXMMGdstyPzE2Q89COT3L+V0XKrgndFjaQzGQJ9x8B9iBh0Wvl0QrkuG0RIkuw/c3f8
	dUbFOPzkOnhMh1WLmlxIdDOxReCAwB4FV7i4de8/EA0POPT+kGserU44GfBB84ZJt/FulK2scLu6Z
	FwYJX4Zwds8dydsYOofV2YiaPONzAdvJVomvLtwcBNeyvW2ZNfm/ZYyTUqM3/p40C4JQgU6nZTz0k
	jBlyOrYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9seO-000000096IP-0Ga0;
	Fri, 17 Oct 2025 22:10:16 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9seL-000000096Gs-2Q4a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 22:10:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760738999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LYJooa3CPyiL/YqvqFJbpYPNVK38FpDeFlhZ7s1lavw=;
	b=QWxmnxob+fxd6kyXR2Yyd0g0hFnFRzfunZcrA+AKQkwUTkBDME5O8A/pj0nE4ZsRt27jKM
	DP8XgrreoLrKjZRe/qPI99FtJ4fCZcCA+gxdKH6t7Uinqykmb2uBcwX5DjLbUelJLvNZgv
	o7Avg4oA0CpZsrCge2SOt7JJ91SHbjM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND wireless-next] wifi: mt76: connac: Replace memcpy + hard-coded size with strscpy
Date: Sat, 18 Oct 2025 00:09:14 +0200
Message-ID: <20251017220913.167923-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_151013_752973_725A8BF7 
X-CRM114-Status: UNSURE (   8.42  )
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

Use strscpy() to copy the string into the fixed-size buffer 'req.data'
instead of hardcoding the number of bytes to copy. This improves
maintainability and ensures the buffer is always NUL-terminated.

No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fc3e6728fcfb..8fc3ecfc27a0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2020 MediaTek Inc. */
 
 #include <linux/firmware.h>
+#include <linux/string.h>
 #include "mt76_connac2_mac.h"
 #include "mt76_connac_mcu.h"
 
@@ -1974,7 +1975,7 @@ int mt76_connac_mcu_chip_config(struct mt76_dev *dev)
 		.resp_type = 0,
 	};
 
-	memcpy(req.data, "assert", 7);
+	strscpy(req.data, "assert");
 
 	return mt76_mcu_send_msg(dev, MCU_CE_CMD(CHIP_CONFIG),
 				 &req, sizeof(req), false);
-- 
2.51.0


