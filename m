Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF0E7FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Pyo6ef5RcCyEtcsdwmvB8O4C4smcfln1dAVL0iSCU=; b=2Vg4d2c456KZ2r2JKYOnoY9HG1
	9be+YnOI9jAAzj+poFnbp+7Fu4XyKDWOAoOZrjSKQoMy76PtzfHiIn1//y4WI5lDjGHcglL/1OA4+
	613qifibwVmKe3EorBk+4c6uAvUmdJY2BnQlQ5IegRvSHecSAC07TyBNZ3YMQPY1Q/DP5QSSN1oxe
	Ah0aCjfnXXyrDl9usJIX8PTzPSrlg4JBJiFpnacNLrCOAtsXGUDD07680rG/ptryp++/5gyshK9o7
	DcQMSyfnmMxviQGvVo3XasXxYMJ7c8ThRKu1ANpJlTbqdY74YEVinslc9nI9dnTypDjejX8MRchc5
	hYVkNrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0g2-00000005cdG-40nG;
	Mon, 02 Feb 2026 20:37:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn0fy-00000005cYu-1dKW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 20:37:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCFDD444A8;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2BDDC2BCAF;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770064656;
	bh=aIxdhfft82t0LR/tguShdCXtDz/e/UoBlZbo+TcBruU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=St01odn+LFAwYbWH3LbiGNi3o+cLVov3o26fCA5sA8v4cpazmtzXRzF2f5zXyZz8I
	 jGIHtxPKvFOJdddIJS5FH9uoXa2iw5lnFN7Qza1H0sB1jvh8EgqW+eIbszq3m+5mKd
	 QyYdqMxo0ZDzOGki3qA5sovLiuf6oP61HUeLG/rPLoJOeSjoOSEc0lfqhsDmXyCcT1
	 qqiuxCF1xMl0dgBtMxCQfurkYL0kWwpUkaYBk4LN+UGN148r1dQZtKOPN8gNpv96+x
	 JgvM4ooGiutEs22fVN3EofnHcMCAHQ79/7jpqvcz+xpchiLmBSV+zyoMpbiFgncwVJ
	 38EkKvhxWuVWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9C1E7FDD0;
	Mon,  2 Feb 2026 20:37:36 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 02 Feb 2026 20:37:24 +0000
Subject: [PATCH v9 7/7] i2c: xiic: skip input clock setup on non-OF systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-i2c-xiic-v9-7-ce4695f5267d@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770064654; l=1208;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=qAOgrbSGsxp0qSeRvLqeFzjiQ6yMVDZel5cRWAUzEco=;
 b=RvPUnGkIwT65/8Ukp0VGrxU1fvDeEccXellEgYK7PbZskP99R9ZlqKf/9m0bPPHIFsdSGi4uP
 AthFPKugAdRCbOREm48E4SZzQeeaoxdnyWVQUPfdPmUKm7w30zm8hkK
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_123738_487456_57CDFAA3 
X-CRM114-Status: GOOD (  11.83  )
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

Currently Linux does not implement ACPI ClockInput to describe clock
resources, unlike DT. However the xiic driver is happy if something
magically enables the clock before the driver probes, and does not
turn it off again. The clock should always be considered optional for
ACPI.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2c0470452221..017e33d4309c 100644
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
+			return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
+					"failed to enable input clock.\n");
+	}
 
 	i2c->dev = dev;
 

-- 
2.52.0



