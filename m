Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82B1E7C6FD
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 02:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pgijbWjPYgFcHXkFP35WfeS7SMUgBYZQnYclfdSgBM=; b=h3iHZVY8HJXmmojV1ZV+AMaRLE
	DAgBr2FlDjRp+smo6tgfdw5IQx6EjOeWD6XE/n57FkIxkWvV0HSXMYbdJpcpJV9KXCpqLKCtgCri5
	0W/1lVAi6mbUc11pvnDQs4ePLo1yE4FYi9VEKdms2Ea7DkfaIybN0rdDAVv4IpEpPgu6Dy+WvB8JS
	qn1U4ess2f6P2lLimN8QSNa2OlW0oTQAKWFIM3mZqJOr1G+pXzWvP45OnomT0o2tSS1ykYDTt5Xn/
	VG+aUjORxzB9pB1I/o7pd5kHofVKefs1GXsCno7/k8v+y4+iN6QpqhGhMzSwl//6n2ArrBusOBLYl
	7MJ9qn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmNfF-00000003Cdb-242e;
	Sun, 01 Feb 2026 02:58:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmNeq-00000003CTX-08kt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 02:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5218C44548;
	Sun,  1 Feb 2026 02:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFAE3C2BCC6;
	Sun,  1 Feb 2026 02:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769914669;
	bh=A8qVLeDBMXcKbF5rH0cEPyooLb9F1EeK5SG34k1Wr1A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rPEzAQoYjOhxuo2tI2sSXAhWK9GFjL3Mg8ButKWsj3XSymKBe7nUI2g7s7ekjOULQ
	 9VM1tUoS68np+QJ825LsdoSwTakuXzk0qd6rrRHvneImZrAll5Eu8XAZ7EWJOf1f1Q
	 W2QRYEbLwQOOAmKedpH5P5/MSuapydbrs1xo/O9QjVDNNdqHs+UOPZmz4EwUP+nIuH
	 35ATfRPG1LeAl3k4bm1pIetksd94K2xfAWCGil2EotkIkOcSHIpTuUMojZ0NmoS9ZC
	 jxzSk7Tfi1eNtiehERYKMJHWYsz7TXObZoNzESQI9xoMOVQ8PsEhAJJzV6EdwTGnFw
	 v1xdO0fZDwDdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66A6E7C704;
	Sun,  1 Feb 2026 02:57:49 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Sun, 01 Feb 2026 02:57:50 +0000
Subject: [PATCH v8 6/6] i2c: xiic: skip input clock setup on non-OF systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-i2c-xiic-v8-6-deb2dd158d1a@nexthop.ai>
References: <20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai>
In-Reply-To: <20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769914669; l=1114;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=BKvE7ant0Fm54tZZqWG3GDfI7eCUIcrHxeGQX55zS9M=;
 b=TEcBXJVksU3Zrhk0vDfNaX378FepkQeslTyJbrsuCmswuXtaTlQ1OQ7tcRM1XwOa1NXgysa2p
 /WEFlYEWYnUDo+9bWHREcTsKuOpk5oDv+I/8FfMcjk+g8G1ccNvF5Hj
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_185752_103716_EDF1C3B9 
X-CRM114-Status: GOOD (  11.07  )
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

The xiic driver supports operation without explicit clock configuration
when clocks are not specified via firmware, such as when the ACPI tables
are missing the description of the clocks.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b8439b78d1ce..98befb46ac27 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1462,10 +1462,12 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
-				     "failed to enable input clock.\n");
+	if (is_of_node(dev_fwnode(dev))) {
+		i2c->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(i2c->clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+					"failed to enable input clock.\n");
+	}
 
 	i2c->dev = dev;
 

-- 
2.52.0



