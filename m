Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780E5C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 12:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAyGOTxhOsTUzIyw+RIKcXPTMHIvQ0X4QU8qLsG97+c=; b=cyqpFg3OvCCJq/GhYDJAaHr/Vx
	wZ2MIJ23jvDi09oRbWlHMJhqnSEfVowFP3NEtlk2fJvsx8WYrGfJYvppcbtu7r3HHrTctAPH6zlzm
	W88Y4nbLLgK6eDYXgw1+6w7DdMJBb+07o14aJG7vwXKnaSz0TPovn3C54pqAjw6IdNxezfoo2KMh6
	gisxIza8G6oQgcwBn5FFU6NxNL0zxW9mab06i7KLE7QSMPFjc8SrUFMyKU/jAUI4lpnEYRKJlX1fk
	Rk8XXXGjtqDVoAIv1O6/C9LNYybA5tI3Q/LzgS5i9OUZt1Q4BK7HQ6UOybDft3lEp4l7tdjFHedQ4
	kC3nNG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGXN-0000000Cg5K-0Vzt;
	Tue, 05 Aug 2025 12:13:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGHk-0000000Cdfm-2cXc;
	Tue, 05 Aug 2025 11:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754395011;
	bh=jBClv5lGREd65CCDreNGe33Ns5EABFagpEUptp20jjo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DJy+8UEvGMVv/QCTPj/gcbJijEyo7UDPA4ZARkuEnNWwWfSjwxNKrzv9mGLAaCLIE
	 ukwBh5kgfbP2379yNFR6dw0LsFPWvSj8YtarlYiPFiD4IasquXu4H6M6nG8MeFIlId
	 wgevIum98Qv5qJS3YDGzdAMlcSKyafRJwL4pM599n/1Er6Cl0X4GhuC3IFzjw/6TlH
	 yWFHq1vDIVXUAuIbZVhyGgJpOZjRRGb5lyr8UWRgtkgbgcL7FTcVpkqiELLqJHQRaT
	 i/x3jkA4lIoCbXqzZtpXjkZJOS/mxwbahk8KrPh7/NnOIVR+GhPpDFTnpBLXHWNxJX
	 bQQA7ETVcENrw==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CB0B917E0DD0;
	Tue,  5 Aug 2025 13:56:50 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 05 Aug 2025 14:56:47 +0300
Subject: [PATCH v2 05/14] phy: rockchip: samsung-hdptx: Use usleep_range()
 instead of udelay()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-phy-hdptx-frl-v2-5-d118bd4b6e0b@collabora.com>
References: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
In-Reply-To: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_045652_845357_594F3239 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

rk_hdptx_dp_reset() is allowed to sleep, hence replace the busy waiting
with usleep_range(), to allow other threads to run.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 5605610465bc812737f773e0f6232cb6dbdc78a4..83ec892bd6760865fc9e361f4003c5bfbef55608 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1075,7 +1075,7 @@ static void rk_hdptx_dp_reset(struct rk_hdptx_phy *hdptx)
 	reset_control_assert(hdptx->rsts[RST_INIT].rstc);
 
 	reset_control_assert(hdptx->rsts[RST_APB].rstc);
-	udelay(10);
+	usleep_range(10, 15);
 	reset_control_deassert(hdptx->rsts[RST_APB].rstc);
 
 	regmap_update_bits(hdptx->regmap, LANE_REG(0301),

-- 
2.50.0


