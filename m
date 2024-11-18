Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAA2D43FE3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 07:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIZipZXZzeXFxw5y+kIUydqWUv7lTVPzDgbO2oK3gn4=; b=33FS4Y0n0te/wISQGV0a35dEVS
	n83TRXW9fisnsXzyEYQMg+Azlm3nuMkje5JxwUYBi22nS+41WAk4//qJpYO0C9Kv4APMrmaEcC6dL
	dmc8F3VoltRS5q9wbRvdRlkJL1cQrMzt6HHMEvZVUFQidXxje8YJvHYmuxLw2xWRcPFiSdtofEZSx
	dcnpK0b0YUAMXcB4wEfz/INgsF7vXXxFM2YZeiKtZ7UapG+R27weU1ulmUT8WUz9w9VnR86FfQ6oT
	wHi3jn17+KVfQFqBOuENcK466uE/KJ7x4fzOcFdjQvIT0fnpKdL5I7VzAvNuPAXB9vTTTlNM1eXsn
	zAJ/Nyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwFW-00000008eoe-1tm9;
	Mon, 18 Nov 2024 07:32:42 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwCu-00000008e7S-0ySF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 07:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zIZipZXZzeXFxw5y+kIUydqWUv7lTVPzDgbO2oK3gn4=; b=HL+7WM
	opor2SYxeVA4JHlYVuMdXpQwfKmpXx66XE9fzBshiF7pdTI7uzGfcZOCMj14xc5d
	EJ25syDHUIg/rz0jua9qduEoJtilO0VUVE3UTSrzMSv+3jkUnHKFMM8wuaMMdeIc
	yPo/nXDLAi2MOjNNCw+LbiVljHiblxy4VJG4bUdGIdkvLHhFSaVZ/RH3yuspw3G5
	sETeD4Cbw0frHGY9f/U6OpZGOVPaP3umDHc3CXaep/Z2IXCsefCAWg7WRS735T+s
	DPoQiSJZ0nagChQx0dVA2ObWZI6ZF9fEnn8Uif+bB7hC0b1tYjlKNvIdxXU6eKJb
	AkhHEuEkszEnbnfw==
Received: (qmail 112572 invoked from network); 18 Nov 2024 08:29:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:43 +0100
X-UD-Smtp-Session: l3s3148p1@BLpV4SonsIYujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/15] rtc: brcmstb-waketimer: don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:12 +0100
Message-Id: <20241118072917.3853-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_233000_570325_8BD9C823 
X-CRM114-Status: UNSURE (   9.08  )
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

The header clearly states that it does not want to be included directly,
only via 'device.h'. 'platform_device.h' works equally well. Remove the
direct inclusion.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-brcmstb-waketimer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-brcmstb-waketimer.c b/drivers/rtc/rtc-brcmstb-waketimer.c
index 1a65a4e0dc00..6c7701b24ba5 100644
--- a/drivers/rtc/rtc-brcmstb-waketimer.c
+++ b/drivers/rtc/rtc-brcmstb-waketimer.c
@@ -17,7 +17,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
-#include <linux/pm_wakeup.h>
 #include <linux/reboot.h>
 #include <linux/rtc.h>
 #include <linux/stat.h>
-- 
2.39.2


