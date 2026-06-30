Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB71C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0edmQyMBBF2hDdlkMaDXaRUizb6MbyZ6wLi7kRGWNho=; b=fsNrLzJ3aE0XThm887BTPsCELR
	cjelI665rbNalPJy3YvcqJdwxfZxgsceuiuwUAb4i3vgNPhA7x00ZNc7wc5is1X1h4SKWN8hqM9AE
	ekGQeEhvP7G6BCRvVb/o5fofJxN3u05bFZwvb+J8AO2/vnzJIwv3VUhv297MX7AGgjAlll0ERKrxj
	+IHvV7XacvZqOtGtisbArqS+LL9rlYfAE0pyQ1VPtb8Ddfpry2KlaXBL7+XDqauByMcfCtN/xbLEl
	EePcWuCImT2m6f6MtyJ7wpiiOa3zPi+Yxsm42R4DwdYPaX/uEvPQko9kmmieHN3xLoRkKCs+h8lQN
	GsaWKrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webZ7-0000000HVQv-40hL;
	Tue, 30 Jun 2026 16:44:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webYx-0000000HVKp-36hi;
	Tue, 30 Jun 2026 16:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=0edmQyMBBF2hDdlkMaDXaRUizb6MbyZ6wLi7kRGWNho=; b=Py9ZKJSTYGWf14Y3hLq1HyDniJ
	eECGhrovt+szZmIU73s0cN7R7wEmF7A8Mw6oHb4/1kAfyNEZwfmh2VRkDSEf+yNcSAN0SSOf0EB/M
	FubDPVLZRBoRSpmkx+LdiP9BLF+yKSiIus3vRAZi+QDfo9Pltq21ZzklaYpJLuedFyi2PK98bvZrx
	pJ2irClMv7l3WxIQe8UAmHSjMNU7oI2ORD2nWsRVKHNTlLXei75fAFvbYC9QfYWgM2KjN3gTstVTg
	7a6dAXt04JhSeqeAtD/1Gm3AO8JuBIP9D0mYpPH9/ERET0CqwUnMFEsJHwYOP19uJcefSJdYpZe7V
	mq1LMRng==;
From: Heiko Stuebner <heiko@sntech.de>
To: mkl@pengutronix.de,
	mailhol@kernel.org
Cc: kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	shawn.lin@rock-chips.com,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 4/6] can: rockchip-canfd: enable erratum 5 on RK3588
Date: Tue, 30 Jun 2026 18:43:34 +0200
Message-ID: <20260630164336.3444550-5-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630164336.3444550-1-heiko@sntech.de>
References: <20260630164336.3444550-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_094355_780431_CF38C514 
X-CRM114-Status: GOOD (  11.96  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

Lowering the clock-frequency as described in the erratum, also
leads to empty RX-fifos immediately, indicating that the
erratum is also present on the RK3588 variant.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/net/can/rockchip/rockchip_canfd-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 105ca4d5cbef..f3c8b54a9f02 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -53,7 +53,7 @@ static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3568v3 = {
 static const struct rkcanfd_devtype_data rkcanfd_devtype_data_rk3588 = {
 	.model = RKCANFD_MODEL_RK3588,
 	.quirks =  /* Possible more Errata */
-		RKCANFD_QUIRK_RK3568_ERRATUM_6,
+		RKCANFD_QUIRK_RK3568_ERRATUM_5 | RKCANFD_QUIRK_RK3568_ERRATUM_6,
 		RKCANFD_QUIRK_CANFD_BROKEN,
 };
 
-- 
2.47.3


