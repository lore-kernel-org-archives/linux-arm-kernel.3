Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4666CCD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGzVeCnwUToqTdNPKFMqBzJD7dYwP371VmL4b2+7AgI=; b=iiyrtAKyOu4sHHl9PeC/lhBgF8
	YU2BMKCZ3whbdFzfKzKPj2QFDQst34LLqkBWYfWwlnrTypIQodPbQdIuTd46fruB3rQej7hNom56l
	UoEWPfXRATgE0J0KiRbt+1Km8xx52egGIQZWAunTlbTRad6njBPfxOorWFAMfJ15zsnP81Js6I0mV
	jV3X8RWXhGrK3fH5AWCJQ6tdR3QgNEw+LJSqD7jthqKQuIFyQPXbze8yotyNaSwsnv1iaMGAYC1SX
	rauJKxbdDOto2V8HhxjVJeKYWtOLPdGDKgRFndPIcf45i6xrMhqAU2BLTPLh6DPzc8M+oQ6/vV7AL
	+pAkbYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Mp-0000000EAkV-0mk2;
	Mon, 15 Jun 2026 12:24:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6Mo-0000000EAkO-29mV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08E6443C5E;
	Mon, 15 Jun 2026 12:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8A06C2BCB4;
	Mon, 15 Jun 2026 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781526277;
	bh=U/229aDPygbK2f1IV17WG591ys3SZgvnwqf40Huk/S4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cgOIGL66GyRBFJh3ulPaHZzu78hTw6TEYU6zpzYlFLH+jneSK4MkPh947qRSB2FGU
	 +WI1F1oaqYUC1AXk75ofb4AqueS8n/7AuTWsiu7Ys+ZgvxhUpo8Q//2m1I2OrzI7Rc
	 dHjMfDCaSvuYsFHQ9OZStUb+IFsXB/ADwF60Cn7OY9MLpESB/VOxfmqXUUQ+ceAVM8
	 7Wie0pC5LqdHPaBp0/jUo3FmOkrpwbCDEbt0cuOokWSzHnA79+6gmC19vmMQ/+eVdv
	 FcWoVe1rY+N7YWSKbM9oSG/AqaQ+BT28p99z23QdNjRa7mm9n3Dg0kCdaUACxRAjs3
	 alhzsG5fgAY+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CC8CD98DE;
	Mon, 15 Jun 2026 12:24:37 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Mon, 15 Jun 2026 20:24:17 +0800
Subject: [PATCH] net: stmmac: loongson1: Use dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-dwmac-loongson1-v1-1-cbcf5bc01d9b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPDuL2oC/x3MQQqAIBBA0avIrBPUSKirRIvS0QZKQ6EC8e5Jy
 7f4v0DGRJhhYgUS3pQphgbZMTD7Gjxyss2ghNJCC8Xtc66GHzEGn2OQfEC5jdaZ3mgFrboSOnr
 /47zU+gHKAVm4YQAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526276; l=1168;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=2fl2OBxWH3wOcozENxrt6hZZsu8wzA6vdfleIZixEow=;
 b=/xcmeOq0CIVKL1BbVMNLoT/ceXxJcS0hTcnCvEZ6XK0jr4a/anBT54fyJswBJHk++djVHtRXn
 tJKVWnD0mutDflarcg2J1w0kDRCds4G4jYe4E9akQGFn9N6xspemEK7
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
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
Reply-To: keguang.zhang@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Keguang Zhang <keguang.zhang@gmail.com>

Use dev_err_probe() for the missing match data case to simplify
error handling.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index de9aba756aac..ec34adb63f61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -176,10 +176,8 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 				     "Unable to find syscon\n");
 
 	data = of_device_get_match_data(&pdev->dev);
-	if (!data) {
-		dev_err(&pdev->dev, "No of match data provided\n");
-		return -EINVAL;
-	}
+	if (!data)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No of match data provided\n");
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
 	if (!dwmac)

---
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260602-dwmac-loongson1-5e1b9dfc3c62

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



