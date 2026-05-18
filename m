Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A85DCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veob9HtXLn7SLcfakh9ZP6AYYUe0rJwsRCdIHigOn0Y=; b=jPfkeXb+zqNceKzGHeouV51q/C
	7UhHYNDX6wjyLjCdhNy1YtEJRdaHDeWWB9uhk/UvyC5LyjdNmTl4LErNllJIV03dSbdHR5DSlfKEt
	NyykaoKiS1A+FcFD/k/tFs1HVNIxwFBsir7PSSVNJNUdIIhq1gMmACKUdNmRYuvJIh8X/a7IXBCiS
	EViKcHVltqb9LtuGAP0+HEyWg5OE/aER2Xl/8EEswfCh+a9DdsIDLdzbu/OvKKNHk38bdyvgMPUl6
	JWehFpXZbufvx40DQlZfabkYXbLI8/Hp9QLuF364cW9U8hBYf+Qd7V7lSqMwnEmjcctfuvht4NU5H
	qmNcDxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2NU-0000000GWB1-1dXu;
	Mon, 18 May 2026 18:07:44 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2NN-0000000GW4P-3sve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127657; bh=veob9HtXLn7SLcfakh9ZP6AYYUe0rJwsRCdIHigOn0Y=;
 b=AF82325CHC8OGaTcwZx889/rcUh1swV1Pg6uHxRzKh6fN1/hJkRwhJ1kau1AiSqZlWnoHgVWi
 jlr3KmzH9ekIDZJoEe24Ea44n3ljuvHLrRT8jCRVSeMBkKzN/+RgyM6juu1gmZiGxBUO68fv8N6
 NFlmLxufRQ5gsokkAiK9seWwltTHMmg6NQl0Ru7QwWSM7jcpDpUteXsQQnFw/+SS9KcNelbYv1W
 7gt3smVQAeGbll9pSM16kcxTUopQOro4Zt+zGQouBxAaYbcPeuutlpPdysUtqfKb39SNSSbOP8c
 khSyUQBSllXlWyNePniWUjee/t/qP27OMkKqL0fBAPAg==
X-Forward-Email-ID: 6a0b5566b74b0ebd362ee07b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v4 2/2] phy: rockchip: inno-hdmi: Remove deprecated way to configure TMDS rate
Date: Mon, 18 May 2026 18:07:21 +0000
Message-ID: <20260518180722.2480799-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180722.2480799-1-jonas@kwiboo.se>
References: <20260518180722.2480799-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110737_972142_50C23BE2 
X-CRM114-Status: GOOD (  12.11  )
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

The TMDS character rate of this PHY is configured using PHY bus width
in downstream vendor kernel and out-of-tree patches, however no in-tree
consumer of this PHY has ever called phy_set_bus_width() to change the
TMDS character rate as currently only 8-bit RGB output is supported by
the HDMI display driver.

The series "Split Generic PHY consumer and provider" clarifies that
phy_set_bus_width() is intended as a provider-only function.

Remove the deprecated unused fallback way to configure TMDS character
rate now that this HDMI PHY support using phy_configure() to configure
the TMDS character rate.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: No change
v3: No change
v2: New patch, split from original patch
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 1c43ea700f0e..c3d257a0f4a6 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -555,24 +555,10 @@ static inline void inno_update_bits(struct inno_hdmi_phy *inno, u8 reg,
 static unsigned long inno_hdmi_phy_get_tmdsclk(struct inno_hdmi_phy *inno,
 					       unsigned long rate)
 {
-	int bus_width;
-
 	if (inno->opts_tmds_char_rate)
 		return inno->opts_tmds_char_rate;
 
-	bus_width = phy_get_bus_width(inno->phy);
-
-	switch (bus_width) {
-	case 4:
-	case 5:
-	case 6:
-	case 10:
-	case 12:
-	case 16:
-		return (u64)rate * bus_width / 8;
-	default:
-		return rate;
-	}
+	return rate;
 }
 
 static irqreturn_t inno_hdmi_phy_rk3328_hardirq(int irq, void *dev_id)
@@ -1452,7 +1438,6 @@ static int inno_hdmi_phy_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(inno->phy, inno);
 	phy_set_mode_ext(inno->phy, PHY_MODE_HDMI, PHY_HDMI_MODE_TMDS);
-	phy_set_bus_width(inno->phy, 8);
 
 	if (inno->plat_data->ops->init) {
 		ret = inno->plat_data->ops->init(inno);
-- 
2.54.0


