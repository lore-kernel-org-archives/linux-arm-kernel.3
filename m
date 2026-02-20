Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4607AC55AB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XPeIw7v04h3XB7z1p+iLdmX/CwyJGydUSf5l09KjUDs=; b=2c+sgItq9k+okFNOELJvK8/JRt
	SFRD1irfb2bpeazPyB01BrScdeB5UhWLky2+Lxro/WWOGBA5srI1s9hlEpP5eDZN0d0c4iszr0OXh
	K40XLL7qiRdvD+9XzTVZUKOojLnlgn21Iokg2ksaT7ufwUUHQj8lgR23uAZ46Kl/FB6/JQAZ60iwc
	qpFnI/0LRIFUcMvdeWfGpr7sbf+AsmR0HwZC3nC/ZC8hLYqTHAzcynrh9GdxQfSzrGG5KEGv64WZe
	sfW+gvut3pKOJnOr4VrzbXoEsnERgRj+Hxsl78bvDfeZS2e0Lrp47u7xZV6wQcF77ccpYptHX/xzY
	OHJ6ZYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQXO-0000000EXeZ-2qi6;
	Fri, 20 Feb 2026 13:27:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQXM-0000000EXeD-0Uyn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:27:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so23275715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771594034; x=1772198834; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XPeIw7v04h3XB7z1p+iLdmX/CwyJGydUSf5l09KjUDs=;
        b=E2tulUK/XU3l7FX1zRgrhi0/gctRsHFreKaaowRZe0Ma7fGwTDvfEhCQlYjwZrOTqQ
         Jqncl+o5a9UhG3UD127B6IYBS/yNzyiwIwL/Eg+wFb7Mbu47LNhS/7gExb7dqFqPt4G/
         RaJNVVXN0dCAF+P1LlV0jrleJhGYhy5revxh3pk+FCWWGvGgIL9XO14FvKbvImB2q5qA
         FwFJLCwLbd2+NkhCy9m6Ek6OSwGlQEMqfhK3Liee8hxbXrTNI8QC+RC+pt0gGit7Xftk
         y0Vv6lNiU7nF8md6pMUEEsQEqsiD2PmGevUtin22I3EzaYIDMNEam/D77JQd4UtOCL7G
         Am/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771594034; x=1772198834;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPeIw7v04h3XB7z1p+iLdmX/CwyJGydUSf5l09KjUDs=;
        b=knERO+1woDqu4HNs8GLA5c5dQGuzho8eDSIgAzhYMAmBt1llZCI/usW5hsub/d7543
         PLnZ+3OPA4tdsCfBqaKNsIJaHmNkeIOgAawl+JGMWjczuRRABUaTPR878z7RW61x+Cj5
         /GdxgQ34NmUCnlzigFpuPuYFs9QhLFKkjpLV3kERlgFuXhuFtRLq7r4RLHhAdKYUQ7CX
         UO9vgv8XRLV6wTLngU/pHMZ/EI8r3q9ncOx36l/+vf32CoLVG3ZVPFsyePsHP0T22O2F
         2B4LWIdL1m/RAvXug4ZfgmFpMtUTHmTJwTRvi8ix4Vv03NhTlffgc7xNPFaqYJk2W84q
         blMw==
X-Forwarded-Encrypted: i=1; AJvYcCVZDo33ehSNHtLD7+TkNpdwipAWJJaBaTMglwWusLYRPlO+2BZN7eeKGLsIrS7QC38s9wJazLXEFnsruFb++5rI@lists.infradead.org
X-Gm-Message-State: AOJu0YzOV7IOh0MWe9mYp+/goyhCtp7P9fG7kLfwz9g6P7CrVXtFscyk
	eFjfy+ATd2iI+tAE8JMkAUXRToU9ipKHTDOxqDtdsAxVD2m0sfH6OcNy
X-Gm-Gg: AZuq6aIzd6bezf62WNM+de70RCrxK0hBGfnVyJP9y4NzwHlvXKl+yxehInZxiVu/6qn
	HG/r/AAgOreKUBogPaW4ELnPRE0YuzHx2uzKkaFebdaH0x5KA2fosJ+e2g1Mqr0wBpGW5tvXcwN
	4VQ8OssnCiTghX1LD/+C3vi5JaNFndGEfX04n/IgO/aq7K6JtEpsXcWMZeGyExe0iLEWxU+0qvC
	b0yf9w++VbIJ7qN2Am++mR5Dow6oaWIXTTjzZPJp+I7qbp43zydMvww/LJo78qZ0x/qTJQ3xqrq
	TmgDsd98a/CyEjL/ez9jBjt/aeYae9XD8AxA1ys3HfKN4vqezFslqpfPdeftSg5vRMiex0eRN35
	vKsK0erIOKNmBgd9Wv07oliOs7YXm4webV6qJIpiptmQZbS2hBNs5NXVtN4kz9gWfiKXOEaesyk
	zC9qjJ6/DXsdt5h/JgL0PP4DUIhfrkP4CIb8OCJjANRU+PNeIdGQRZqhGnaKo81/w=
X-Received: by 2002:a05:600c:46cd:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-48398a550dcmr142793575e9.10.1771594033629;
        Fri, 20 Feb 2026 05:27:13 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483a3dea9aasm25882215e9.1.2026.02.20.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 05:27:13 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 20 Feb 2026 14:27:02 +0100
Subject: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIACVhmGkC/x3MTQqEMAxA4atI1gZq5gfqVcSFtBkbGNqSgjhI7
 26Y5YOPd0FjFW4wDxcoH9KkZItpHCCkLe+MEq2BHL0dkUNOQbCoMYxaKtb0Q4PxK3nH6B9hegV
 P7klgi6r8kfO/X9beb7GjdPVuAAAA
X-Change-ID: 20260220-ehci-orion-drop-phy-handling-d93c15c92042
To: Alan Stern <stern@rowland.harvard.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_052716_235325_6D02E55F 
X-CRM114-Status: GOOD (  16.13  )
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

Since the USB core code handles the generic USB PHYs automatically, the
optional PHY handling code has been removed from the 'ehci-orion' driver
entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
initialization"). However, the devm_phy_optional_get() call has been kept
so the driver still gets the PHY even though it is not used for anything
in the driver.

Drop the remaining code, and also remove the 'phy' member of the
'orion_ehci_hcd' structure to simplify the code.

Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/usb/host/ehci-orion.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 34abff8669f8bf096f4547b6ce0977eb130b3c8d..eaaa49712a8c64928771eb317165091480245d0f 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -12,7 +12,6 @@
 #include <linux/clk.h>
 #include <linux/platform_data/usb-ehci-orion.h>
 #include <linux/of.h>
-#include <linux/phy/phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/io.h>
@@ -60,7 +59,6 @@
 
 struct orion_ehci_hcd {
 	struct clk *clk;
-	struct phy *phy;
 };
 
 static struct hc_driver __read_mostly ehci_orion_hc_driver;
@@ -276,13 +274,6 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 			goto err_put_hcd;
 	}
 
-	priv->phy = devm_phy_optional_get(&pdev->dev, "usb");
-	if (IS_ERR(priv->phy)) {
-		err = PTR_ERR(priv->phy);
-		if (err != -ENOSYS)
-			goto err_dis_clk;
-	}
-
 	/*
 	 * (Re-)program MBUS remapping windows if we are asked to.
 	 */

---
base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
change-id: 20260220-ehci-orion-drop-phy-handling-d93c15c92042

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


