Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C1C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX2Z/ghbqoiDL8R4EHfOY6Ljk2Z/hUoJeJlxXuHtQv0=; b=DwVpqNcK2ymutb9N2E9ENJHuH7
	UEhfOFfAWrFAid6V+kCjSjK+WeUJgPPyRweIvo1WM2dqnVBpEB8BhYR7NWvH5cLIuLmPn6XQZnD7b
	WlVeFJvwFvpUNLDupexs5BhdrnsGb7EaeRVGGhV1Ek//eqn+udizgvoa26zx9rr7rphklCvyAQLb6
	ZLO9OzXKUrLUnw5ma5Urfl4ahKjW/qtXPx72inE+U2wUaycffFD/CJU4Ml/S/HiQ2e5yRlog+x0yG
	eCtiHZGjwKgFo1Vkk6qTHOA+npnmrr2tQJcE7zg9lAykLX74L+g3/0ty/NrEIghICfFRuonEM7EW3
	hW4JuNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug2qL-0000000CoSc-3Zln;
	Sun, 27 Jul 2025 14:59:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug2Z6-0000000CmqG-3Lcf;
	Sun, 27 Jul 2025 14:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C45E1600B0;
	Sun, 27 Jul 2025 14:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2199CC4CEEB;
	Sun, 27 Jul 2025 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753627287;
	bh=L5gHcIa5VuUBeimB79zIuxICWFJ1hsqKpyHcNulLv0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AQ+ooKCVtyXbcyJQYA7+Ts2sK3OQBfzkM6btbgdlMXyeHXTdA+cMZvyjrmXmw6xYm
	 2Ytkp+BQYxXvAtwle/0b5Xxq6PYVXkAH7u2clGmUEkk2K+Ete2+N6ZMvItSzSIYKc8
	 1EzKb10yFZ+zNST0kNhCYvfDBG1o5uF9a0dw/MOh7OzVRmeD4TTFg9UeTheQAYQ4YZ
	 ow8PlIrGEsQ/jNve8J0Y8C4Yl7KkXQAb10aTzfooo334aTTAsVH+cRf0KlH+S0MPdp
	 fRxyte26mAvacnEtLf8L+Z6njsKt6Sl7ZM811OKnPXjN19kU+dfHdb1ODwvY2nkwp2
	 AISosRQ2npiqw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 27 Jul 2025 16:40:51 +0200
Subject: [PATCH net-next v6 6/7] net: airoha: npu: Enable core 3 for WiFi
 offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-airoha-en7581-wlan-offlaod-v6-6-6afad96ac176@kernel.org>
References: <20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org>
In-Reply-To: <20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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
index 6ad8715f3b71ef217a6097f135fe2d6995be7f8c..63e6366431e3097df7638a06a1d525af801061d9 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -715,8 +715,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	usleep_range(1000, 2000);
 
 	/* enable NPU cores */
-	/* do not start core3 since it is used for WiFi offloading */
-	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
+	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xff);
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 

-- 
2.50.1


