Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DADCCD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 03:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoA5fcjHiDIQMSYoJiUkvrtob6g82mV1RciuPYwaVxw=; b=eF9GHjNCu9G2/XEXlhpL2RXPT4
	NBlc87VUIHvzoHTkw1W6DeU/kpyWBpsRe0Bqa1Sat/MXaoFZIOpoUdpYIXqzZGzwNsfZZk+kxrtVj
	pYYhd1AriJ1Sa6zZyEtnLuogmpA6ifP/54CU4wIpz56yIt5SzSWZ7J9qS0iid5/C371+crCsx1lxb
	l38OFULOtLSpYU8Lrx20TTN85bKYyLD2WNAuIDSD4GoumPGE+G67zo55NHvWADSUPEguJojmBAQ6i
	St2D0RPwknU6O2vYOWYYC74y80GoobiVRskdrMooiLAgUMdVYpm26KUxJttO9CqaJ5KAufNpI8kax
	Qr9JDppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKVJ-0000000F9F3-3ndE;
	Tue, 16 Jun 2026 03:30:21 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZKVE-0000000F9CX-1LtI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 03:30:17 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Jun
 2026 11:30:02 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Jun 2026 11:30:02 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 16 Jun 2026 11:30:02 +0800
Subject: [PATCH 2/2] pinctrl: aspeed: Split TRST out of the AST2700 SoC1
 JTAGM1 group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260616-pinctrl-fix-v1-2-621036e45c7c@aspeedtech.com>
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
In-Reply-To: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij
	<linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>
CC: <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Billy Tsai" <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781580602; l=1914;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=3g5Xwg8h1zZKhm3yigBW7k/XgEh1YvhsBXpVJn3jjYc=;
 b=8/rgiPAyR99n1WV2vAnALgdaOrGtS/4Pyejknog3mNZ6wbRX5G6acnNUpKvpkyOieYdOYck9k
 mkV47AQIGOhCU3adl3tEKUMaH7IRepbeciaAkhCja6uYFwxUU0eA1qV
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_203016_364360_33C4B1AF 
X-CRM114-Status: GOOD (  10.93  )
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

The JTAGM1 group includes the D12 ball carrying the TRST signal, but
TRST is optional for a JTAG master and the ball may be needed for other
functions on designs that do not wire it. With TRST embedded in the
group, such designs cannot use the JTAG master at all.

Move D12 into a new JTAGM1TRST group under the same JTAGM1 function so
TRST is muxed only when a board requests it. Boards that do use TRST
now need to select both the JTAGM1 and JTAGM1TRST groups.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
index 50027d69c342..f8b4066699ce 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c
@@ -1018,7 +1018,8 @@ PIN_GROUP(I3C6, AA22, AB20);
 PIN_GROUP(I3C7, AF18, AE19);
 PIN_GROUP(I3C8, AD20, AC20);
 PIN_GROUP(I3C9, AA21, AB21);
-PIN_GROUP(JTAGM1, D12, F10, E11, F11, F13);
+PIN_GROUP(JTAGM1, F10, E11, F11, F13);
+PIN_GROUP(JTAGM1TRST, D12);
 PIN_GROUP(LPC0, AF26, AF25, B16, D14, B15, B14, C17, B13, E14, C15);
 PIN_GROUP(LPC1, C16, C14, C11, D9, F14, D10, C12, C13, AE16, AE17);
 PIN_GROUP(LTPI, U25, U26, Y26, AA24);
@@ -1263,6 +1264,7 @@ static const struct pingroup aspeed_g7_soc1_groups[] = {
 	GROUP(I3C8),
 	GROUP(I3C9),
 	GROUP(JTAGM1),
+	GROUP(JTAGM1TRST),
 	GROUP(LPC0),
 	GROUP(LPC1),
 	GROUP(LTPI),
@@ -1528,7 +1530,7 @@ static const struct aspeed_g7_soc1_function aspeed_g7_soc1_functions[] = {
 	FUNC(I3C7, (1), "I3C7"),
 	FUNC(I3C8, (1), "I3C8"),
 	FUNC(I3C9, (1), "I3C9"),
-	FUNC(JTAGM1, (1), "JTAGM1"),
+	FUNC(JTAGM1, (1, 1), "JTAGM1", "JTAGM1TRST"),
 	FUNC(LPC0, (2), "LPC0"),
 	FUNC(LPC1, (2), "LPC1"),
 	FUNC(LTPI, (2), "LTPI"),

-- 
2.34.1


