Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14B6D2FEDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipvsN6agBmIJCbKUmVOyob0QT6+ZD9BQzADrTsDBtA0=; b=kSZLwU64pEONgxm1Cw8g9wV32T
	o7c3WJl6GFvx9gd2l8AoeBWfNGwzw0encEbfy+gN006JDFyAcqyOC8toLXQqTsFe4DAfS8Ejh1ARy
	h98OW9HXX6lJNeoRcyrefYcuN4+XhU5twKbPottOvTjCJqiYrGgZaFXutDyf0Irj0Lg5bQInNIAwO
	u9NjNQ8EKyDbARvkP2uESdZIEVHDxfh9PrFqXDAyDjxX7a9II/O/wNl2qyJ8Y3WrFT+GFRGwNvQgn
	ape7kgf6YxI1I3QioKNR99B1Our4lP3Rz0h2oHtDdCM+vqjyCVeqDTuDWzyXUKkZf9ymGa1GO/QCO
	wjNkaMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEe-0000000F2Qz-2dzi;
	Tue, 27 Jan 2026 21:04:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEP-0000000F2ML-29Sl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 21:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=ipvsN6agBmIJCbKUmVOyob0QT6+ZD9BQzADrTsDBtA0=; b=O4wxCL8OiWWZlEJvYKv5n+BCKX
	xjw/dA9oX12W7umMoZXuSc777+rPy8J3FFeVe2RXcvFCoVdaif1X5c8hfoYE2qrCA24ifmBWxyYFT
	d5EoiZoj10iDaqTR9QP21HD/DudyQatoA5pi9Fv6/yGxx+KbxxHObdn4r4DaRQ6EIBnUFgDobBZT/
	GeL+YBR3V8oLEQ1v4KtLpNKcHkoItX2CbIRT+HrDhpqBJHWbdmuoWDpxnv8nStE8w0SvfR2N4bcgO
	kNXDh0vo0LwjkLeE2oUqUPuumeW6FKq5wL9djtcUsdXYV5D/pJpeh5A9Q7oUOF513I2mcH4sKgo0q
	KqcRDfig==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqEL-00000007cG8-3IgR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1638744541;
	Tue, 27 Jan 2026 21:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0B74C2BC86;
	Tue, 27 Jan 2026 21:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769547845;
	bh=ej605a6zZQZZe+X66wSrKgUfMRVc5y1sH/aNDWf2N4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=f25Meu4nr+5YbAu4+qzKe8WUc1TowwvU+G6BBXoUovPmHcU/LPbnZ4tCzhZ5JpnBY
	 V0VpEfsPWUWMOBwAQFmIR6CJqOa4eGzKCljqx2p+3amsci2W9Zf7y6hzE74Jt9/DPJ
	 QGaB7C3kMaL8S8eTL7hT5/yKfREPISNd8O7YtmX4sVz1Zdr+8ij3ftyhwOPB6Ki3N3
	 TV+cLJBOQs1TmsmPWW9MUsVxGJnswb0Bsi0PxMHwBUIbZVVwT7O//+6VYfg7JPJuNV
	 tefCmjWfdAUTsuDzuWRx9MukPNI9VXv4Hsx4xESQVTcu6lmvuEDZdVGGJ/xFB/MygV
	 bDlqbjrhEeVbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95FBD2FED9;
	Tue, 27 Jan 2026 21:04:04 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Tue, 27 Jan 2026 21:03:58 +0000
Subject: [PATCH v6 4/7] i2c: xiic: remove duplicate error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-i2c-xiic-v6-4-e82e2f6f657c@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769547843; l=855;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=Qad9qP9qV5p3BTdOEhFWMpn1MKAqkOhCBKD6rPKS91w=;
 b=ThzdzrdD6qPaVI7taYTjp+E/HSOKbCSYkPxLortCjGK6CmUoYpzD3fy8kMQzm7PAsyZdrdBhX
 JnuCOlzBG7yBNneuRnAhm1sUftr4ZhPT4xj9Pl26/gyeB02DvulZL3w
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_210410_283274_4D336F3D 
X-CRM114-Status: GOOD (  10.45  )
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

The devm_request_threaded_irq() already prints an error message. Remove
the duplicate.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 973463a3a7f9..95242d39f554 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1491,11 +1491,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
-
-	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	i2c->singlemaster =
 		of_property_read_bool(pdev->dev.of_node, "single-master");

-- 
2.52.0



