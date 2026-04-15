Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E62F4198C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fUoVCq31af6XYyzexqFt5Aja7lKfBwRcK204Ab+AUAA=; b=gukK61UHFHuEy/xkQ3Gov5/KNJ
	zhy6eacc3c3Nzly7sCfRq2Lev4ZQt1r2aqP7no6rDH9V6DGEhzTyKqdwHetAGUsupy1PONgpEYEEg
	CH5nCQtkCyPDzMQMs9tHR0eEn0GKvhSf7PWylYIss0B/i+co+JaaXlfX5+DKsFmDxs/aQzZfMmama
	sGSgztjJy1QqhdK8Fh4rTKJkWaKgzAYgd6Anjb6TdT6dugLBvZtr7DoPYwqYkA+slY7Jpdy4GXFJu
	qg+oZIPeAuucL6Tv3cxPjXM3k42WKkn99ksMEtgn6SamYIiQD6swJfUDjIXWcXeMAdlgY+hJd+7Ca
	kg0ix0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxQb-00000000xnD-04wF;
	Wed, 15 Apr 2026 10:25:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxQX-00000000xmh-2phR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 10:24:59 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 15 Apr
 2026 18:24:46 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 15 Apr 2026 18:24:46 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 15 Apr 2026 18:24:42 +0800
Subject: [PATCH] gpio: aspeed: fix AST2700 debounce selector bit
 definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260415-gpio-fix-v1-1-b08a89b31e6f@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAGln32kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3fSCzHzdtMwKXUNzE1NTC+PU5DQDMyWg8oKiVKAw2Kjo2NpaADr
 KCulaAAAA
X-Change-ID: 20260415-gpio-fix-1745583ecf06
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776248686; l=1387;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=mm7hDoKN7iti+b5vLqDrPKkhJ+rkkywvY8n22UKL7Q4=;
 b=xltRCYSWnLbGHqjv3iCcpoxcxMICHhXNHsq8rZVGdgeOxVKQIMYm7j5TcRzziaAqE2G5qfqW0
 t13s1XuI2pMA6PQpU3uoagyImsMSbktSm1U/OoH2Ac9o2mabPBnwVlk
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_032457_741226_85D8CB78 
X-CRM114-Status: UNSURE (   9.79  )
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

The AST2700 datasheet defines reg_debounce_sel1 as the low bit and
reg_debounce_sel2 as the high bit. The current driver uses the AST2600
mapping instead, where sel1 is the high bit and sel2 is the low bit.

As a result, the debounce selector bits are programmed in reverse on
AST2700. Swap the G7 sel1/sel2 bit definitions so the driver matches the
hardware definition.

Fixes: b2e861bd1eaf ("gpio: aspeed: Support G7 Aspeed gpio controller")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9115e56a1626..98b5bfbc04a3 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -42,8 +42,8 @@
 #define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
 #define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
 #define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
-#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(7)
-#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(8)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(7)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(8)
 #define GPIO_G7_CTRL_INPUT_MASK BIT(9)
 #define GPIO_G7_CTRL_IRQ_STS BIT(12)
 #define GPIO_G7_CTRL_IN_DATA BIT(13)

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260415-gpio-fix-1745583ecf06

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


