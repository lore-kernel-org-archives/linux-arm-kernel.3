Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FB0C83030
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 21:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDQYMxKAdt1jmxBlPZnQ5ycwIpR+5IaI6SIuWajrq7Q=; b=3bJ/j8/pZbqPT81mv1ju2UT0Bo
	eLBcqgIYKnhDPfCbQZFkxkZ06wyCxU9/0VXUc8M497KbGPZlBM/87BpelUN6tDqIPczIUxBoMCsf4
	XjOBEe0YnVVXSSQf7pZ5sRU4qstgZQ4ZtQbO7T2iN6he+cYPhhM+MbxzjPyPyyv8qr6bxZeDwqyFM
	kLP3zXodONnbnu8zFNdaEvDsNREU8qMTB/Yjyf7snjrxf8cm3kMb3DuvAxsT9vveQZNamC4uv1rrc
	k7V5FPIxDrHrP4calb33fIa980mlMrdNp6RkTJ96wJ+jcKXzLgK5cpaFmU6NBrZXuWMD3Jue6z+XQ
	N8CTqclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYAPG-0000000H1sP-1gK0;
	Sat, 05 Jul 2025 21:26:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYA9N-0000000H0fm-2Zuo;
	Sat, 05 Jul 2025 21:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E47F43EAA;
	Sat,  5 Jul 2025 21:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE14C4CEE7;
	Sat,  5 Jul 2025 21:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751749821;
	bh=cmXQhz3LP2Q2Jgn0thXqmV5cL87FTCYZGgqEsbiG/O0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BuyXZJjXiUJ/68ytbS+R0cS5t0ddINmA6SEnImJ2JYXPrcWZLC2c+IUWjbcm6jxBo
	 ICXN5v9Id++fVv/RgM6wyYfGwNh0RUU/pM+f+fiuIddztgJG8GkXxVrH75teaA0QDG
	 g6roqaUbrgYcO3XOqn1n5dKTqtEPPA/DVcYhlMjpltKP65C4jQQnm+ymgQjwH1QiX/
	 YGPoU2qi2Vkoz10gmPIlRbXM4z9Uy31aK456CIImWTR6JPJYc16ybqESwuWaXAEQXg
	 f5Wtima/zqJ0izC1h+oTZVSwDNcwTGNIKIbLakKkMkK3IqCWf2HTP/c/wVbQiqLLiV
	 uq1/dZM8OPA/A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 05 Jul 2025 23:09:50 +0200
Subject: [PATCH net-next v2 6/7] net: airoha: npu: Enable core 3 for WiFi
 offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-airoha-en7581-wlan-offlaod-v2-6-3cf32785e381@kernel.org>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
In-Reply-To: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_141021_675409_EC628BC5 
X-CRM114-Status: GOOD (  10.26  )
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

NPU core 3 is responsible for WiFi offloading so enable it during NPU
probe.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 8c31df5b760730814ccfaa9fffff6c6aa8742f01..cbd81394cfb6d512d131f1c805f5c15d95d08634 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -731,8 +731,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	usleep_range(1000, 2000);
 
 	/* enable NPU cores */
-	/* do not start core3 since it is used for WiFi offloading */
-	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
+	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xff);
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 

-- 
2.50.0


