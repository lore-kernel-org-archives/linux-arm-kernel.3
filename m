Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CC1E7FDD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 01:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69eMcYIoXRFleYg/vueTarbTtX1PTyvJiqoYMwd9bHE=; b=kO/oCATdPXp7/qXAmebY0DFolH
	8GAMBHn37devdWc/u+21AN+0KJN8v7O0AYj8PfG2jJfl156cpGNZ5ThtQYVzyXNc3pILYpGkm2Dp+
	XE+yjIiG6yp1gNotlIfYqzkkJ0NqOuWdbS31DuzKh192ddejolRQHBG5b7mFsZcNeYec80dTjVA2W
	ZzTkA1SR/H+qUFNeHavbF9HurNS6Um6Fjn0PRe8SSwCknHs8yVeCkpp750aYCE5gJbr10AyVpZadT
	lLqyaDLo20C/xFyOnl5YIRjci1MeYjpfAwsS/ZKCCflzmJ684qniA0XsVixjovXkD7bx4DQjbDYO9
	NiMSEWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5dV-00000005sAo-29eN;
	Tue, 03 Feb 2026 01:55:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5dS-00000005s9t-1iEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 01:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF75A44356;
	Tue,  3 Feb 2026 01:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F240C19422;
	Tue,  3 Feb 2026 01:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770083719;
	bh=IW/+JrbrQIvK+EQCG3nXnsBAjmMT2tbO68ByxNyFyHE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Kgr9chCvLZbhou3vdF+YfiY0wLnGvAmYNw7iYWGQxhJeF3uiypF6+exd4Vvr238DE
	 RvBEVin4n0y1SAw52je39GyouY/vJL0KHf56mDuNgkIXAb71bn/J9YkKSLHhXc6Cdm
	 /0nj96exxUZUL4J3kegOwRiVs3Yww68NORr/lp8C9FnFoQeatosTaBciX9kFv9y9fE
	 3AxDFKu4tovrwXvv0920eECgX2qeo2y+ZC504cwD2lwWZ+loD7I5cB6ctPvpqAR3uZ
	 BFAYbgonlAp7ZH8XysmlCgD8lvOJ47odx2ee0rd1iQGUCIf/ZZ7l2HZjfMen/ouXwW
	 n4Gogqqnnqr3w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBE3E7FDD6;
	Tue,  3 Feb 2026 01:55:19 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Tue, 03 Feb 2026 01:55:12 +0000
Subject: [PATCH v4] spi: xilinx: use device property accessors.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAH9VgWkC/03OQQ6DIBCF4asY1sXAqJR21Xs0LkDHMklFA9bYG
 O9eNF24/Bfvy1tZxEAY2T1bWcCZIg0+RXnJWOOMfyGnNjUDAUpIqXkciS/0Jr9wabUu28qqSt5
 YGowBO1oO7Fmn7sLQ88kFNGfiKiTIQuWgKgDBJTe2/YRgXG/8w+MyuWHMDe2gozgN4Xucm4ud/
 SMA5x9zkRTdoAGBGjphz0y9bdsPsT+ax+YAAAA=
X-Change-ID: 20260118-spi-xilinx-1b884d5b6519
To: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770083719; l=1424;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=JnhvafHbNCA383rSJUeixD1NuH8QF2CYjO1pAgK3Pbs=;
 b=4kZg1Y5eIQ5AUsqkxYCepuzdNSwUt5ZgPJLeCt7hsoG5JfExAcj+26GBMPshRjiD0GsWqGkjc
 OOf6cP+lKA7DoDZkCl5vICaChIHBevWJvMGBxn2578x8A+B0y0Ucs/B
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_175522_544111_171C7374 
X-CRM114-Status: GOOD (  11.38  )
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

Switch to device property accessors.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Switch to generic device property accessors.

2.52.0

base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
---
Changes in v4:
- Removed patches making the irq optional.
- Link to v3: https://lore.kernel.org/r/20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai
---
 drivers/spi/spi-xilinx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c86dc56f38b4..c4b70e95b695 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 		bits_per_word = pdata->bits_per_word;
 		force_irq = pdata->force_irq;
 	} else {
-		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
-					  &num_cs);
-		ret = of_property_read_u32(pdev->dev.of_node,
-					   "xlnx,num-transfer-bits",
-					   &bits_per_word);
+		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
+					 &num_cs);
+		ret = device_property_read_u32(&pdev->dev,
+					       "xlnx,num-transfer-bits",
+					       &bits_per_word);
 		if (ret)
 			bits_per_word = 8;
 	}

---
base-commit: 944aacb68baf7624ab8d277d0ebf07f025ca137c
change-id: 20260118-spi-xilinx-1b884d5b6519

Best regards,
-- 
Abdurrahman Hussain <abdurrahman@nexthop.ai>



