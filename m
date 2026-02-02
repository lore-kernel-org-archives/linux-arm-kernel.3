Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB16E7FDDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E59rNrBYzexqfJ4Ee3MuNmQDMUwEB8UQnYqyGey+0cM=; b=FcGFuy68hy7zw+9nievpn+Rb+S
	1z2DQrTEzpsqpDIO6be8XQwCTLmR4PSxOh47L/MELTe3uZPfIoi8fFUsZCOCEEuknkOgGBX+WtHUR
	fKBf9S/8tKBR0kh1tq4VXb30nrqVI5pu5Yl1CdJIEZpFEIVzHrHNQYCUfBuiTXLjt8ebTtwstDLy+
	chfECEJW0jeNQHBGCzPiGjiGB5j6SKq4cpXc89v6P7l6c7Si4yCXubNj1s8t3gAfgJQHzGiRKzptg
	Uhi6D/1uYOMaJzk8M3imrLSIWYFDtwNIIrmSNP2FeARiR2b6ZIGctSn2b/XgKIujpBQa9eSfGa3qY
	EMOkNaqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0g2-00000005ccQ-14Df;
	Mon, 02 Feb 2026 20:37:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0fy-00000005cYt-1gJ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 20:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD526444CD;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D10DC19425;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770064656;
	bh=EQnetrtHFK2rEBzsiSIHup8oVhTEzY0ph1INzOphpyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mVs0lrsT6Q8iv11/hUkqq8F6pK1qito6+AOxXu6XThaE+hX3IUVzmqFrFz5MlxpBe
	 58RBCk38RWthf7aDeq/tUgPjld8mTooLO3viTeIklH3GTgjZLygIqzm6xV4LharqCg
	 O8C71UPsWbmoKkivbdTdjlDboJBVxnywBOJfD1Zl2zekvbEI4vfmA+/MPKxvhNabq3
	 7mi183bXvrdyp9wVNU1iZEJdSUFOfZAsqx9IbRlNU2ln3JuKYQw9mp4GXfMFSHgRJC
	 bewWHGv7LOhbRCdWdhQOr/beiMoGOhpDTI6mfrDDWrc+R4OE4BBoAqASmxOvfGg1+p
	 AoIhgHc7k1cGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E3CE7FDD3;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 02 Feb 2026 20:37:23 +0000
Subject: [PATCH v9 6/7] i2c: xiic: use numbered adapter registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
In-Reply-To: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770064654; l=1108;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=RLQIf1A/Hfhfj6sGMEhyze1brD6x3yYtifNZ+L92dP4=;
 b=Pv2jgLeasoQVQ/mHZBmVLZKipUHNjCA59kwN3eQa9PgZN51zKu0N7s+U/mc0h0C5qL+qQZ+/7
 AxI21/tBr1hBWozpraAV4N1nqfZ5knMK4UZ1RMS6mAqM7yaxWPfX/gz
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_123738_492467_03D5ABEC 
X-CRM114-Status: GOOD (  10.62  )
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

Use i2c_add_numbered_adapter() to allow platform devices to specify
fixed bus numbers when needed.

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



