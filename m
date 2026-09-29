Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23096C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dasai6+029pvmGcHPcV9e3g/wbYW2nmVd23Qohpfg+s=; b=k2z+qTDXP1RgsixWmCmTuHSTns
	ucuUMgl9lkIUlT/H+S0fVrYyKSSe2+3M5w8Gy2bcJGxaIhazwNtfgZoEFfVY1uugTvuwK2ulMRmWI
	N4L5DLKeJCVHPY9p3JxKboBUY+h+LoxGjICY84jXicxqHhDeA4xvCS4yag7sO0m2qBJI6QLHW08xz
	jLhhzn7Teuq39cD//82WVwszVBjhgKuarYEqzboRT6T47PpSxCSVp7YooQSZ9XvdFI3oEZ+gXskWg
	foRHFjq8J3fUdEEeb8Y5Z5/lkrKHZ+zVbU8eF995UzwA2NhD4aUMXtCkwcsP8yJsPcDrz9+Bgc6Op
	MMdVvIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRJ-00000002TKB-37G9;
	Tue, 29 Sep 2026 06:35:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQv-00000002T5l-0JzE;
	Tue, 29 Sep 2026 06:35:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDA41444EE;
	Tue, 29 Sep 2026 06:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6491F00898;
	Tue, 29 Sep 2026 06:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663720;
	bh=dasai6+029pvmGcHPcV9e3g/wbYW2nmVd23Qohpfg+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gcJlJ7KOAmSvzOgI9dVaGdH7J4xOZv/lsglJ0tf3Ph7JIDX5ZqqGaw6hP+vJbK7Ki
	 EH3vT92W3MSXwbtsa6eprz+VSJpI0QHsgGCI6114L4HuKA0iyELudzKjGcAairVJNf
	 Ae4IN1pM4VRlgqK31dyVxQft6JeZOGwblBtXVUNmIVx078e0PSt5YN1H4UE8Prmgbk
	 cEjeUHdMPlRtcQW6qOh3Y3ok3G6ZULiQdWme9ec4GriWqtpk90LO1Ywa16OsrbwhAD
	 p9ta0v5WbHSVb+Ozn5qh7YZOmsdN0SnsvEGQxWTh07/gGb7SHkJs5qCfydFKn+tz98
	 tQlHccr5Wm5fA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/20] pinctrl: berlin: use u16 instead of u8 for the offset
Date: Tue, 29 Sep 2026 14:14:07 +0800
Message-ID: <20260929061417.20733-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The u8 may not be enough for newer Synaptics SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/pinctrl/berlin/berlin.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index 231aab61d415..7e7096842eda 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -17,7 +17,7 @@ struct berlin_desc_function {
 
 struct berlin_desc_group {
 	const char			*name;
-	u8				offset;
+	u16				offset;
 	u8				bit_width;
 	u8				lsb;
 	struct berlin_desc_function	*functions;
-- 
2.53.0


