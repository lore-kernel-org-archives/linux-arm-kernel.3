Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E64EEA874
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFIaBSjFP4bB1QeWMGpy8nEX29RN95ysBojt5mv2hYk=; b=w7ksdr+1qLnx4SBzjoG8rXRcS2
	cJEKUKImyuOJohzFGYKRVVQnkuBjzn9miPwyPUpI8cwOCcJscICJ8VENXeXXgTf+zI/oKvWtILXnK
	qjfw37FocZtaO8oq4h1ynnocCvWlxvPiupzAB0uit23dYyBR2VaCmVGDtlTT0cQFokAFQoK7o2NJ8
	9ZgxwDH25wtG3GV5L4a5lH+HLYn+ROxSM72EaS/1pNDZeDEiflLiPgIFQS4aaZxC5y4Emk5Z10SoE
	hn1oVlM8mURySOEv6iIyMBFJ2DgJslYTqw/NQmMAcQYYBEWGxL13YE4LQ61nY7m02nfOr80hJM+5h
	q+BE7FeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqK-00000002les-2EMm;
	Fri, 13 Feb 2026 00:15:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqD-00000002lZ4-145z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 00:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31A7144708;
	Fri, 13 Feb 2026 00:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE593C2BC87;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941722;
	bh=ktFNFyYb0Uq2CP/YIDJw0JUiqxN5uUvfLEqzzvmbA3E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CAJLwPxyAGpEnyCJ9X50bSlJsJO3Nrm35GPhgvgTmZYRLKeuBlNlfJEyoBGdf9np2
	 Dgph9pWF1BoPcs5oNxn34F3caf9t4u2Vn4NT0bq3Rv7fV2tuFvzd8yF98pF6Tx/c/Q
	 ZN3E4fdpcAl3x5sOIO4Mnm9SBDWyHEbyQ1+nPTbVd4sPxXCBkgkxMFZtOf1FY9zXo9
	 PvI7bEyX4EON++iWHHC30Csd9x4NzbAoI7bubt3zM0nQFa+Jp34iFMoGg8Nhga3Lx2
	 L0geyFIzswShUKC8ksHIsiMnkRVxvXmXs+WyEul4MwySsn9TZnrUTevowrL3/Aa0OS
	 rCVlNvwb3N8FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C8CEEA870;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 13 Feb 2026 00:15:22 +0000
Subject: [PATCH v11 7/7] i2c: xiic: skip input clock setup on non-OF
 systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-xiic-v11-7-5d18aea11bde@nexthop.ai>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
In-Reply-To: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770941721; l=1203;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=QbeCuGkKnN5h5Ohu93cG+bcDU57NUhxnJ+h/cgz+Owg=;
 b=ahPuuoyzgNrgiZHMsSNPsEPM2zxawKhDjYIy/l9O0JPv/Ev49NxOdwFTn9/lny7oLo4UvcqxH
 zT4VbTBiRoXDz5uZTAcdIDQ6cpd7w4vE8i5UWT7nKLNyZeOyhqMxJ2t
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161525_326139_BCCE60C7 
X-CRM114-Status: GOOD (  11.79  )
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

Currently Linux does not implement ACPI ClockInput() resource to describe
clocks, unlike DT. However the xiic driver is happy if something
magically enables the clock before the driver probes, and does not
turn it off again. The clock should always be considered optional for
ACPI.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2ad75325154c..e5574f2d97bf 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1463,10 +1463,12 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
-				     "failed to enable input clock.\n");
+	if (is_of_node(dev_fwnode(dev))) {
+		i2c->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(i2c->clk))
+			return dev_err_probe(dev, PTR_ERR(i2c->clk),
+					"failed to enable input clock.\n");
+	}
 
 	i2c->dev = dev;
 

-- 
2.52.0



