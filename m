Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F858CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+iq62HFxyj5Rk03fEh0Yc1aHGYN18NHiPcDWtnA33Y=; b=Dh20mlwNwWrp27ZwtLInx3H5HZ
	gDmxGDK2krba8wA3BhDzJHATe0EoX54kqYVB5Ba9/5E3cAYHrISXjJcZ6pUBS6Hksrrjk03A/Od0L
	xPPayh2TCDomk5SlyvhSJx6BeQVHs8v7nGrdDz+EDcteiev11HGzE24PVm16CWRFwacLUwn6oBSPa
	/7wiKxAsKf6AmfTGpv6yxAp/7Q9VnFd8Ix4IlpcEfUI7RoIq37ZiPzKyIsAY5Pdvt8ItzsXVQ3Eod
	AehUGqQp6tBjx11oP759Q6wCVd818y/6sJmAZ3vHtA1nWuXMTYiFlAC3K0xer7c0h3+f4KjzfIWnQ
	IA1UAhMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDt4-00000000kuR-20Ni;
	Thu, 21 Aug 2025 22:36:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OW-0000000HQWi-32Z1;
	Thu, 21 Aug 2025 15:40:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 18C8A5C620E;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8331DC2BCC6;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790803;
	bh=u2Zlown9pUIPvBVQ1qtJSypKTJVZhbvstB3kFMzlXCw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MDjma5PlcPXJukWpzqbopxJIXlKc+1sJTmY+KdVF5NtqFaDpZbTE2n/jmuvORoOlN
	 pEJ0sl/ZxPEr0wCLW+Lsch4UNpLs+6fpMAQfj4rTOeEcAKcckkR06VualeOYRckmh7
	 Je+UBD70iOrX2DQEwCVy04oa3C2pvjitG2kHSseuMGgl/758unyTM0AFSqSXThhXTm
	 aDc/KjsjTRIB++p6G9maIUgYb2GHASyEpYMrM9++HL8GfwVl96iLJBkT1aO/bL0WW2
	 pUorPHYsmKACLRfIaOdGd6f1tF0QMk3igXIaybiC5YmkgzmFjDB3SpzPdS76wVRMal
	 aSWLd4g/Q9uCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7955FCA0FE4;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:00 +0000
Subject: [PATCH RFC 08/22] usb: typec: tipd: Clear interrupts first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-8-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, stable@kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3328; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=u2Zlown9pUIPvBVQ1qtJSypKTJVZhbvstB3kFMzlXCw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy21UcmpxL7i2sEtzw42XBFc5fH+KqHnzpmLXbdvKFv
 5WzM/kOdJSyMIhxMMiKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAmcsae4Z/Z69Na55TV0t7p
 hvwxTFl0fb339oSpVx0jfoQ9n3twRsIpRoaWV3MWmYdOk/gWdKM9y/TQLLGNq65837CCiUk2vfT
 SqV4WAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084004_879886_267EC1BA 
X-CRM114-Status: GOOD (  13.14  )
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

Right now the interrupt handler first reads all updated status registers
and only then clears the interrupts. It's possible that a duplicate
interrupt for a changed register or plug state comes in after the
interrupts have been processed but before they have been cleared:

* plug is inserted, TPS_REG_INT_PLUG_EVENT is set
* TPS_REG_INT_EVENT1 is read
* tps6598x_handle_plug_event() has run and registered the plug
* plug is removed again, TPS_REG_INT_PLUG_EVENT is set (again)
* TPS_REG_INT_CLEAR1 is written, TPS_REG_INT_PLUG_EVENT is cleared

We then have no plug connected and no pending interrupt but the tipd
core still thinks there is a plug. It's possible to trigger this with
e.g. a slightly broken Type-C to USB A converter.

Fix this by first clearing the interrupts and only then reading the
updated registers.

Fixes: 45188f27b3d0 ("usb: typec: tipd: Add support for Apple CD321X")
Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
Cc: stable@kernel.org
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index dcf141ada07812295a6f07e41d77f95f98116010..1c80296c3b273e24ceacb3feff432c4f6e6835cc 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -545,24 +545,23 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	if (!event)
 		goto err_unlock;
 
+	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
+
 	if (!tps6598x_read_status(tps, &status))
-		goto err_clear_ints;
+		goto err_unlock;
 
 	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
 		if (!tps6598x_read_power_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
 		if (!tps6598x_read_data_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	/* Handle plug insert or removal */
 	if (event & APPLE_CD_REG_INT_PLUG_EVENT)
 		tps6598x_handle_plug_event(tps, status);
 
-err_clear_ints:
-	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
-
 err_unlock:
 	mutex_unlock(&tps->lock);
 
@@ -668,25 +667,24 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	if (!(event1[0] | event1[1] | event2[0] | event2[1]))
 		goto err_unlock;
 
+	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
+	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
+
 	if (!tps6598x_read_status(tps, &status))
-		goto err_clear_ints;
+		goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
 		if (!tps6598x_read_power_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
 		if (!tps6598x_read_data_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	/* Handle plug insert or removal */
 	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
 		tps6598x_handle_plug_event(tps, status);
 
-err_clear_ints:
-	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
-	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
-
 err_unlock:
 	mutex_unlock(&tps->lock);
 

-- 
2.34.1



