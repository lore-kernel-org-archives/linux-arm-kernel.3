Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6D2C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee+aIEbx0Uoz73M7xvQb4aORnr+guJuf8bM3GRunjkY=; b=TP71DCCKSJjGpaINXrqW8uP+Wh
	h7/8wxryjGl+kcBQCM0H7ylDrR6jAh6X0C5DP6RTrMR2UDfxnLysfuYcONOf6aAwAaOjEynRPYrua
	wreaeBx4KVcGIT5tj1TJ2l4VQACj+dIuY/dlTsigAG0Zj9EnW5tl1MGdtJlCHIwN/IBUq5M7BwjuQ
	3CZZHYNFpEPrJ3C3j83ZlUgX7HwpvRu4E6AGnOwzFpuIlVsxqjjaymQLa0M0JS3JFUfn2BfilX5Pm
	a4pNRbLD/ndPfYdVNd+NsBnnBaXfwFkEywAl0lfXrm1mCBAKUom5LsrcrEfeO12eK/wmKZSGTkbgy
	Bj/wi0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLCA-00000000sRc-22TH;
	Tue, 04 Feb 2025 15:50:38 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKz4-00000000qKL-0Alb;
	Tue, 04 Feb 2025 15:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738683404; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TruEShvCeSHdknqE2cfbwhaTTig5fKKWLc8uPb8qMY4tpNWEKIa+EUCEHc3skaB8ISWYoNQJr5+5ZBsdFvib/2HUejN+JNTFmfhJ24YhjzW+cClBeCyYfYxa0uFhtsbviearCG3uFFynS8wCwLB6ZILIi15dSZo28Qr9LBWxnNM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738683404; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ee+aIEbx0Uoz73M7xvQb4aORnr+guJuf8bM3GRunjkY=; 
	b=jgZdxD4Hu3jlizBylhq+Sb5yd7e/OxrnCHArwBbmvRfDE191dq4gCakLBCLoaLhCbRWUZvp7Tt2Osq6wHEmXR34Cbk6BzVAHFCXsLOU38hrD2b5U0qsl4CmehJ/fwIwzWL9CExnHLxm8nn/pyE9Z2+2LTfkQfpAAgd4ZzlrX58s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738683404;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ee+aIEbx0Uoz73M7xvQb4aORnr+guJuf8bM3GRunjkY=;
	b=IimQtL+ZEWbMj2SBAAlLGCUuG/5v9wS9pE+7QEmkTwvqkFo0rIGWnDGy4XKuP71G
	ugoroqv0C9r8hU5WodBkO4gGbee4JalGujWSKhL66oWIjqeWj5c8vxcuBqCeXQULR85
	oqmTsPLNzutcCMrPXLRDWYrLMXGVevWM/u3zugso=
Received: by mx.zohomail.com with SMTPS id 1738683398844646.1655143013911;
	Tue, 4 Feb 2025 07:36:38 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 04 Feb 2025 16:35:49 +0100
Subject: [PATCH v2 4/7] hwrng: rockchip: eliminate some unnecessary
 dereferences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-rk3588-trng-submission-v2-4-608172b6fd91@collabora.com>
References: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
In-Reply-To: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_073706_147282_8D1E7C9F 
X-CRM114-Status: GOOD (  12.20  )
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

Despite assigning a temporary variable the value of &pdev->dev early on
in the probe function, the probe function then continues to use this
construct when it could just use the local dev variable instead.

Simplify this by using the local dev variable directly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/char/hw_random/rockchip-rng.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/rockchip-rng.c b/drivers/char/hw_random/rockchip-rng.c
index b1b510087e5862b3b2ed97cefbf10620bcf9b020..082daea27e937e147195070454f9511a71c8c67e 100644
--- a/drivers/char/hw_random/rockchip-rng.c
+++ b/drivers/char/hw_random/rockchip-rng.c
@@ -148,7 +148,7 @@ static int rk_rng_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, rk_rng->clk_num,
 				     "Failed to get clks property\n");
 
-	rst = devm_reset_control_array_get_exclusive(&pdev->dev);
+	rst = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(rst))
 		return dev_err_probe(dev, PTR_ERR(rst), "Failed to get reset property\n");
 
@@ -171,11 +171,11 @@ static int rk_rng_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Runtime pm activation failed.\n");
+		return dev_err_probe(dev, ret, "Runtime pm activation failed.\n");
 
 	ret = devm_hwrng_register(dev, &rk_rng->rng);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "Failed to register Rockchip hwrng\n");
+		return dev_err_probe(dev, ret, "Failed to register Rockchip hwrng\n");
 
 	return 0;
 }

-- 
2.48.1


