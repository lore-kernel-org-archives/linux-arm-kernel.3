Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB48AD2FEDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVDRm6YS1G5c96CNLKcs6Ty6bvIwwE9kMosMH3bZsiA=; b=0whP0oMY5/VVAZ3/HX0wXilZUG
	kqM8sxEi5p/JncM8J2OmpkKQArvi7+sJlliY9bxb+pQb36vQEsj/qxK31bSggfJCqFCRpDoLn62GM
	gv4JSlVKtYbd9QuwoMQ3HizpjQ376O1xDcvaR7/9+ekE/xl4nZbdbXHYcPMqGGA2Y3qXVnALn0R2q
	7tuAD7t+qxtyXDQqJCQb/WADkBXTCors7+6meCa4aA8LBjEcynqCmfTCi7l3RBIlVVNbYvxofkDcV
	sqZgVkpZZ94LrCzebfKD+J345dri5WKHtdo0un82wOXBOq2Ph3+gI3UUop479NrZFibwl/VI2gwjx
	en6Pp7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEd-0000000F2Om-1ZTR;
	Tue, 27 Jan 2026 21:04:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEJ-0000000F2LI-0x3P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA82244467;
	Tue, 27 Jan 2026 21:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3F2FC2BCB0;
	Tue, 27 Jan 2026 21:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769547844;
	bh=bRJsBVhV2cTCTGqXXoRRmJ1NBnZdJqFem9P0ZfHUxu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NhcEuMeRBr9AO6D1JYMO064Q3vTHWgc7mLHuWxvsISIW+Vx5wqfKVdojFu38d/UuY
	 fLtO9LagFmLeHwhsUTGR6TPb0s+SnIO4WIhwpqnSYWupBPNYQanYRXnqFlFRV0DRex
	 Xnqp4l14h9sazkCyvFmWspRI+aPEs2yu3k0WFVPAd+XgAy8SAPrqVo+EJzxjNapjMc
	 c9ilocuOQePi0joqrzs+/edeRlHRoUmaukYue0xcEY8AUPgPIsZz1kh4hzkSIzd92K
	 jFCg0NffPDOEh5MnbgktlrNtwMN3YTNloq9MBFYYww4MhYviAzWjWQsEgNw9CezXGT
	 kCtEXXymy2u8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A29D2FEE6;
	Tue, 27 Jan 2026 21:04:04 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Tue, 27 Jan 2026 21:03:56 +0000
Subject: [PATCH v6 2/7] i2c: xiic: make the clock optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-i2c-xiic-v6-2-e82e2f6f657c@nexthop.ai>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
In-Reply-To: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769547843; l=1430;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=MFPKI1awSXPDHMhgBtmEFE5/b9Lhx4gVN3sZslxmYUc=;
 b=+FtBJZg8geOC7XQNZZg6dApeNX1NUbt+C210icp/0ttg9ATCBS02Ux5PPYQlE0WcbPTnx3R3t
 47XJchi0O30CWbi/IEzFJdUXMuB2GAQVBQWdfWu+bd+wOGA0X0BU8bW
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_130407_318841_ED94B47D 
X-CRM114-Status: GOOD (  12.62  )
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

The xiic driver is designed to operate without explicit clock configuration
when clocks are not specified in the firmware. This functionality is
already implemented in xiic_setclk(), which performs an early return when
either i2c_clk or input_clk are zero:

This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
returns zero, allowing the driver to rely on hardware-configured timing.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 28015d77599d..16202fb89271 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1423,6 +1423,7 @@ MODULE_DEVICE_TABLE(of, xiic_of_match);
 
 static int xiic_i2c_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct xiic_i2c *i2c;
 	struct xiic_i2c_platform_data *pdata;
 	const struct of_device_id *match;
@@ -1464,7 +1465,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");

-- 
2.52.0



