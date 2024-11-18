Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0018D43FE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAd/+tR/6amb3iC4y9aIm0hPICd8LWcv5HI4xQzRV/c=; b=PrOh+sVleKTfPbFlyi0NX+BRDe
	1xfZydnjIoGu6d/vOXFTzgtSdiqSLYMzA79n26t/XUX8M1vtlB2nFvoaOEziQVgaO7rlKO63Qlvdx
	rZINb/REw024KnWCJZ8v0uhE6bpXcaS8PLh+GX4pobAfbRBYHz9PsLJNr7m8jU/vlok5Ef7xvJzBj
	/ruZcNhm8hwA8Ln+hTQ1mEaqv/ZlVc2djm6SYi5ds1SVtUnzeMc/BbDuHtvcPcfGNYOPvlTWRBz0c
	3yGOTSEOyMDahEako4N5xVE6zJl4rGReG+F+NfF7sgCnmTgp1dDb5cloSEcbEjrTV+QlVkYj0Jyak
	dgGew2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwEb-00000008eZW-36S7;
	Mon, 18 Nov 2024 07:31:45 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwCo-00000008e4p-1Diq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 07:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=aAd/+tR/6amb3iC4y9aIm0hPICd8LWcv5HI4xQzRV/c=; b=WOVk2p
	dUoujkGOyrKFrqsvR767kNsLYhPt+wyZFiZbpLM9wjTE6mQGSaWnJo9tUvK8W8xj
	5BW/0k+Muhwq21b/HjtmDzce+eyKIdLGm6LTdGu0/vAX27RV9e6vpg0JJs85EbJM
	qcoFSkfXzTMXlTcvCRLEvqMfGj9PB/M8S5265ESzDZG+av0P0Hhgv71gew7yE9Pf
	Oucie6QaZ5XnM/7DpUa1qIqq3rv0WiQ6SsIUHCT4kkY8OHcnD32C/vSmfoO3xk8w
	lqyryIpg2WwKcZeQZ6pKUh1g7pEw99qaK7E+DzEsXFGu9ZWb0mKx1fMeLPcv1O2q
	9uxbre/f6DNFc62Q==
Received: (qmail 112434 invoked from network); 18 Nov 2024 08:29:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:38 +0100
X-UD-Smtp-Session: l3s3148p1@0+IT4Son8tUujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 06/15] Input: sun4i-lradc-keys - don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:05 +0100
Message-Id: <20241118072917.3853-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_232954_609083_3CD72FA9 
X-CRM114-Status: UNSURE (   9.50  )
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
 drivers/input/keyboard/sun4i-lradc-keys.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index f304cab0ebdb..9a4fdef2650e 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -24,7 +24,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_wakeirq.h>
-#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
-- 
2.39.2


