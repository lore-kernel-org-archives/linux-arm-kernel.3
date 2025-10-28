Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B52CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxO1XeKCLT/t7i1gdcqmSLNWzL9WCMw8QRQvjEI7KIM=; b=oXILelpgn2ysPKsiMEsxng/xb3
	zvdTOqVXk1Dn+qSdWu9IvZHqaRq88r6shSyjFLk4y90SlasMn4TG+suXpPiFk47kTqeimZnYydu33
	k8+vKQRW0eadtCsM7Orhl6Xa+tPPHwQqhESkiPaK2OtDsun+t05HkiqRT6f8m2dXru0fgwDN2M/wh
	UoQ7bkZpBtf308jBNe1fDJxJ5LtpJY7qQ7o3W3KtDAZnojJZw5jFXVfRBdEteXvhtu8cV2dmQ8c44
	80Hb3qJtKaw0KZpedOwKlcN/YQwrmyDohiEw2Fpwjau7Z8wkordy3LM0OW73iOtk4Y3PyG8oaqJci
	QnK43XTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeek-0000000FUy1-0DIE;
	Tue, 28 Oct 2025 08:02:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeed-0000000FUth-4AyN;
	Tue, 28 Oct 2025 08:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761638525;
	bh=uYJ88TcbgM9QPWrzUv54FcbzxyyuyKhAl29xy9RbCKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IuoKOYlrPi8E/fUPKA268uWUrhWONZzmkSyuzY0CBY3PJa7OzGv4fFUnWiRQpVkNZ
	 kK6789gyBwTUVuESSxlUQ6cRtW993SunLMJ5Xkp1NMShfe1Yzrr2Yr/qKbtQZjLRX2
	 +Bzt7XBzqOdckQMazsYH5ED49UnninFVL2cNOd0akF439GmYeKrjrWTmu/9ugUocmd
	 0YUvFH+0BUXEVyWd/aONLAI1+RkmBUDNQhcpS2XmEL3RoM//4eoQTtFkzU1hzZWQ8T
	 sqG9qiQBMMAg5grCkbOLW0fPHQMgdoWTULdKcFFP/9DQmMacxQcZ26/RErYgwYzLHI
	 g5a5gT9WDt9lg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7F41417E1401;
	Tue, 28 Oct 2025 09:02:05 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Oct 2025 10:00:55 +0200
Subject: [PATCH RESEND 2/3] phy: rockchip: samsung-hdptx: Reduce ROPLL loop
 bandwidth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-phy-hdptx-fixes-v1-2-ecc642a59d94@collabora.com>
References: <20251028-phy-hdptx-fixes-v1-0-ecc642a59d94@collabora.com>
In-Reply-To: <20251028-phy-hdptx-fixes-v1-0-ecc642a59d94@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_010208_199103_31F499A7 
X-CRM114-Status: UNSURE (   8.99  )
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

Due to its relatively low frequency, a noise stemming from the 24MHz PLL
reference clock may traverse the low-pass loop filter of ROPLL, which
could potentially generate some HDMI flash artifacts.

Reduce ROPLL loop bandwidth in an attempt to mitigate the problem.

Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index aee03e8655f6..8ba9b53c2309 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -500,9 +500,7 @@ static const struct reg_sequence rk_hdtpx_common_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0043), 0x00),
 	REG_SEQ0(CMN_REG(0044), 0x46),
 	REG_SEQ0(CMN_REG(0045), 0x24),
-	REG_SEQ0(CMN_REG(0046), 0xff),
 	REG_SEQ0(CMN_REG(0047), 0x00),
-	REG_SEQ0(CMN_REG(0048), 0x44),
 	REG_SEQ0(CMN_REG(0049), 0xfa),
 	REG_SEQ0(CMN_REG(004a), 0x08),
 	REG_SEQ0(CMN_REG(004b), 0x00),
@@ -575,6 +573,8 @@ static const struct reg_sequence rk_hdtpx_tmds_cmn_init_seq[] = {
 	REG_SEQ0(CMN_REG(0034), 0x00),
 	REG_SEQ0(CMN_REG(003d), 0x40),
 	REG_SEQ0(CMN_REG(0042), 0x78),
+	REG_SEQ0(CMN_REG(0046), 0xdd),
+	REG_SEQ0(CMN_REG(0048), 0x11),
 	REG_SEQ0(CMN_REG(004e), 0x34),
 	REG_SEQ0(CMN_REG(005c), 0x25),
 	REG_SEQ0(CMN_REG(005e), 0x4f),

-- 
2.51.0


