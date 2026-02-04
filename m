Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39385E83EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1M7MrpmOzEuLsBUmc5JOkFeY54+5xHaGc+qnJadiF8=; b=IV2x4AWzntnwSufkiJHz5jFcD2
	AI2BL4xtGW9Vq5tciRArO7eJfTmV8XqwTVpOXDjmD0QdbiNlLjSpEjVOkYCyn8xwmn/qeszvkMuw6
	oEDRZc8sd+chBssn4EI344PZvUTv+qBySTSNrsCWys3kD4D1Z3vajbdn9lnSQ3D7nmeNL/NCqj4YT
	vQOPt4rgpNxeV39ogMENpE/zr3X9XsCH2Q7pypbltFJCDF0V1MFERu4BQDGCuhJnrex2GZyrz2l0j
	JXixrrgY77Hfd4ZJcCrCB99iPUuZdnUnxHHQe+QoyW/I2nIcTQ5LFbrRciM4aXfECDXZroQktgBoO
	6vuiU1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWts-000000081wj-2xLD;
	Wed, 04 Feb 2026 07:02:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnWtr-000000081uy-27FD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 07:02:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2D4E60137;
	Wed,  4 Feb 2026 07:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2580C4AF0B;
	Wed,  4 Feb 2026 07:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770188526;
	bh=SgLmwwZ152akW02BJtaThcmesIM6AsNkaiZ4XeQDmjY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rgcNqFB2cQy9YhQbk9Hb6ubSDMHG9QsSC786tuid0J4sImjgh2In9a1qBiRj4w5GK
	 hFxUoGz6gDOzYuwsQVPt+OEv1TS8ZmIFxAKd3HFsTNCK5eZD6jeoTyMGRZzKg1nTJr
	 JZRLB2brY1f1ohbN1yBDf+hOG67D6ButbqjjXLSs3uPzYlgVNaPG1pryQO4LdpaUrq
	 qEkUWJJ6l118K71ilJxqpUEn8JKSBNu98vGtyqA3+B2Zkd99gHBHMhQcc7dlTBnnkB
	 gpcKui7F48oM3rpWf2dDuyqaPcypAu5d8ONvjopJy40gsdUXC7naJYftnKfmXFX4fT
	 zABvi/SL+chHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA83E83045;
	Wed,  4 Feb 2026 07:02:06 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Wed, 04 Feb 2026 07:02:03 +0000
Subject: [PATCH v10 6/7] i2c: xiic: use numbered adapter registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-i2c-xiic-v10-6-c2b996425235@nexthop.ai>
References: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
In-Reply-To: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770188524; l=1381;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=xL4GGvzfnOUyOBc311DCeHt6htrYyvg0WAmQadldh3s=;
 b=nvaPtX2WYKN5A3mJFxAnwPiuL2SSR134HGJkyiILe/FgenSTGKQb4DjMLd+niIVWcaCeyd3yP
 dzeDfcjeizUAzFaYnYmR9yFPCbzCnNYOBUIWbjMLg3plWekhMc906Pc
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Switch from i2c_add_adapter() to i2c_add_numbered_adapter() to enable
platforms to specify fixed I2C bus numbers via the platform device ID.

This allows systems to maintain consistent bus numbering across reboots.
On platforms where the device ID is PLATFORM_DEVID_NONE (the default),
the adapter falls back to dynamic allocation, preserving backward
compatibility.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index eeb8ba8e131e..2c0470452221 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1450,6 +1450,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
 	i2c->adap = xiic_adapter;
+	i2c->adap.nr = pdev->id;
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent = dev;
 	device_set_node(&i2c->adap.dev, dev_fwnode(dev));
@@ -1506,7 +1507,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
 
 	/* add i2c adapter to i2c tree */
-	ret = i2c_add_adapter(&i2c->adap);
+	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
 		return ret;

-- 
2.52.0



