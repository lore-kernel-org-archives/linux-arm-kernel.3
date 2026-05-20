Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC9CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NRRFIhxrKYarQ5J6RYefRdsOL+TF/F8aLINPvbW7QbI=; b=jD82XVL4it0rn5U92oDQUZdP+q
	jFMGhcgCWqxTHVRahWhAgTiKI7ly/8NTVy2RBlkDEBXJvS+ylWdnajUJNgDAb8lrY5+aTNEeyvDkD
	SO8+RbJvmZV/TqIkLQ7f/Sq/2/kMbWjczYUOmNjCKFWEz/2W1cjt2G4aciXOXNMJ2A/VvbedexS2O
	2E31KSlolFEBnE+xhKgOx0SXbs2SwsREMZKtwzIxT0fG4ina/VWXGJKAnM2AiWVcg8KV/WXD4hdkM
	0+5r0D5OaAhB2+gLzG/ukgbCb1VNvSKHjExszgWT/e9k9Kyc/rUreF/7X33q4mQEBpimwrWRMGZU4
	TdY3ViCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlA6-00000005NOn-2aG6;
	Wed, 20 May 2026 17:56:54 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlA4-00000005NNk-07da
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=HiINtu7xk5Hd
	/gfZP1vBv9F2KUFICGVhIjDayIdomb4=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=WaH1xHxBHC3lzlXHrot3Q02lvc2OiIAMSPLittTbKOFXfiQpzHtE
	NWyGd/6KSAKnY1nfXoBvEAyb6pxWAFy7SwQRZc8BBlZudOXJBhOikSQUpiv7Fg2H6rfa+Q
	jqp/b6tlKPjbbY/zShQkkVowswr94Tm6XKmNJy4egklJ86yX5SLScB7kwVRnEisgyJi3Oo
	IDFmQIQzrPA630p1wru4NghyUHyoYgBnC/h1qz9Xjdvu93XwIzvMEpgQ5RRHUwNXtLujgZ
	zQRXCTmtmU7aUZheIEgKmvXBmyzSBLANFjtTVostzcb0/JQl9L83nDGq033B3z/IH7/aPU
	KiW2wFLyhw==
Received: from cachy-ak (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id de9eb2c3 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Wed, 20 May 2026 17:56:47 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MOXA ART SOC),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: moxart: fix refcount leak
Date: Wed, 20 May 2026 19:55:50 +0200
Message-ID: <20260520175552.537603-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_105652_429796_C7E46AFF 
X-CRM114-Status: UNSURE (   9.15  )
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

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.
The values here are used only for error checking,
but weren't cleaned up until now.

Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/clk-moxart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 3786a0153ad1..7e191b1481bb 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
 		pr_err("%pOF: of_clk_get failed\n", node);
 		return;
 	}
+	clk_put(ref_clk);
 
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
 	if (IS_ERR(hw)) {
@@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 		pr_err("%pOF: of_clk_get failed\n", node);
 		return;
 	}
+	clk_put(pll_clk);
 
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, 1, div);
 	if (IS_ERR(hw)) {
-- 
2.54.0


