Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D3CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxyKpGaevdX8qzFvWgJnjXddeL4fgWyDYB+tXskt0Mo=; b=n5RuW34FY0cfvX3hpPPIdWiaLr
	sse0b3OxiWPv/feQbBvdlIlsFElml+PWM5+2paLuwd84Bl83ufYyIWJrDSFYLAjsIGkFmdLaAxbdD
	hQJDK+G7j5OSBRfiQVNNLFZtzLfFdVej9/4doH9TEDwKKNj0ks+KJgvMkruid8++gEqJ7fMB0e2Lu
	J4uuiybQex6/ygeqkTW/riPsy46jJ2hmXE9Y2q6CK9CL2bqAGGQAfbJKRUkHhboGpMWdUcg8aEtUC
	8P2NBStROIgdCR34GzkDu8cGMO6b7Boo1tBdvZlMl4NUyO6dbLWu2bwM+hJTue1jrI3+ScE5FTtD7
	95csMTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc1j-00000008ycn-3nF1;
	Tue, 16 Sep 2025 20:11:47 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyc1g-00000008yb8-40Mw;
	Tue, 16 Sep 2025 20:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053302; bh=oxyKpGaevdX8qzFvWgJnjXd
	deL4fgWyDYB+tXskt0Mo=; b=D81tWIkXyJ82G+KN1ps5eQF2I4UGKqUNEoDzxjadAwW5e5TJxL
	xCb4/7ziZYL5KVp0obAVsahMsHbbgvfdK5P4bqwG2T2PDVktlNgSZd1Ly9ydyA5TIEd+2x6RWxu
	bgDOl7gvtwC2fBcg4dRfjDXx7sjoxVb0nTW3bZ8ooJwNJgEAbZ6c2Gp1mwrkccT6E5HKMWjhmAv
	HmbCw98BuG/QhUB+joM9SRJ6UQH9RGOkrHlnBV0oiEP03BHVI2MJVpNJr2Xu4g+Cun9N1OGxR1g
	i+P54a8bsCHN5PvI3OGd/aW1RdqTJKAZGNyn7arxXv3BAubYzGZ3+d1a7J+l58QylIA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758053302; bh=oxyKpGaevdX8qzFvWgJnjXd
	deL4fgWyDYB+tXskt0Mo=; b=vN3Lu7A/HWa/cz9tiEIR0Jnq+N4EnamrtRNsC56oqRgBpVEuW+
	EfAFWSOeXHo0Q0rl/0wPgy4PAUWRCkd3e/AQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Wed, 17 Sep 2025 03:07:21 +0700
Subject: [PATCH 04/25] rtc: Add timestamp for the end of 2127
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-4-74866def1fe3@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_131145_133597_0641B2CA 
X-CRM114-Status: UNSURE (   8.21  )
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

Some RTC (like MT2712 and RDA Micro) can handle until the end of
the year 2127.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 include/linux/rtc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/rtc.h b/include/linux/rtc.h
index 95da051fb155dab4c8ec72ccae7b8e12a117a7f1..ec5828ccc7449388da2ab8bc757030e6795ace30 100644
--- a/include/linux/rtc.h
+++ b/include/linux/rtc.h
@@ -175,6 +175,7 @@ struct rtc_device {
 #define RTC_TIMESTAMP_END_2063		2966371199LL /* 2063-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2079		3471292799LL /* 2079-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2099		4102444799LL /* 2099-12-31 23:59:59 */
+#define RTC_TIMESTAMP_END_2127		4985971199LL /* 2127-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_2199		7258118399LL /* 2199-12-31 23:59:59 */
 #define RTC_TIMESTAMP_END_9999		253402300799LL /* 9999-12-31 23:59:59 */
 

-- 
2.51.0

