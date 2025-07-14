Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09234C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10eEJt4VrkRyjA5xHwdfsVDrBgIl/YTas7olJiuwauQ=; b=ULE0O/t/p4Ec00OycAOxuwDtZp
	sVoBV6Lay5cfzpKCvib4kRQrj28/XtUoXVfDrgfAm5mfr/Aww1SRR7ekvle6n8+ZYco2eak3uS3Zo
	T8Pv4bKAnK7mD69rgUs2JgFzLhNwGzzGe/FgGsWvEcIuQOH8CBMCOyvOQ1a1JiKGz5jM2yr5BXCdh
	JXssRSKbjRuHIe5Qul2zuWFcqxqNPwvwrTk+qJR1HiFVtkfwFz+IX/EZb3OQnky3FzJ+olVt98Cm2
	LsnE/yLj8+K8skCupWomwBY6XEVeZLkzSbGGLpu7kSy/5Xs+QVsqR/W8UI2BXsU077z6mBMtQRB/+
	ewj+TbLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMqI-00000002wSj-0bNg;
	Mon, 14 Jul 2025 17:19:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL3y-00000002f8c-0FwQ;
	Mon, 14 Jul 2025 15:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B8D45C53B8;
	Mon, 14 Jul 2025 15:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4513C4CEF0;
	Mon, 14 Jul 2025 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506753;
	bh=bbMe/p4KUpOOmlbJ3xxcrOUiZhOzHwySeN2cBLuyzhA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g01BXMwrgQd6mwhI73riHLWSc+SE96+kW2siwLWnsVQPymldCYCyWecINtcyQbI4L
	 Vl+k+cMMDb6tO1AOO0BhTh0XoNeULmgo2mcGnUVn/GMjykkw+HT7N5XWHdQBBoKtTY
	 T49m3w9MwixbdIr0dQ63QjRWr8VK2UyrxytSSjyodYTUm/27rkdYkpEcjBrW3sreg2
	 HeCrBZo1YWfh9d0X7Ri4fbEm8WANxSpyYm/YFc1HFdrRh4Ah5ueeHFTMmX+a+XPQEM
	 cZWDoN0TzyxxBJniZYkFf30bQzbmvoeRRLa+jHKRMZ/NRBQI6mzq+BVQeOeBCKAa5x
	 2qpowKKEGi3Rw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 14 Jul 2025 17:25:19 +0200
Subject: [PATCH net-next v3 6/7] net: airoha: npu: Enable core 3 for WiFi
 offloading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-airoha-en7581-wlan-offlaod-v3-6-80abf6aae9e4@kernel.org>
References: <20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org>
In-Reply-To: <20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_082554_144777_2DA1A6A0 
X-CRM114-Status: GOOD (  10.44  )
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
index 68ddc940f675b42599bd2c0245dc715bb56edb32..90000496b6a234897d4f208ab78d54af14be4aac 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -724,8 +724,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	usleep_range(1000, 2000);
 
 	/* enable NPU cores */
-	/* do not start core3 since it is used for WiFi offloading */
-	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xf7);
+	regmap_write(npu->regmap, REG_CR_BOOT_CONFIG, 0xff);
 	regmap_write(npu->regmap, REG_CR_BOOT_TRIGGER, 0x1);
 	msleep(100);
 

-- 
2.50.1


