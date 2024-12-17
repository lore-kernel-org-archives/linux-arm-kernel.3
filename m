Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4710E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aL3MzBItx+jGyEvKKy/4vBele7OAuHh5ZkL6gMAYLEs=; b=R8aJkS0fOUeQqbs1MpNR/Q5PnQ
	qdJdwvkKi64qUYY+2rDvDNYqr/BoCkn9WfEHDc5OmeiTmwWzJBjtKFIiXOlqzy3+wW8sHQtoQV5nZ
	hesU6SodMoJUxLi+Lv9ExXmjIps2rq2BpxGNOTU9kTY2BwubMqeHGcU3yO5ADXFqb2fEVz+/S8sFL
	KyMMExD+lfi9ob/XbdkFG0CFuqA+y5G9YGJqUW+IT2dQdpeMUyArKY+UL1FRyVGUsLJ1mq5A44nX7
	erbi4RCz66ZmnQ/g6Qo6dYMFaYLZP3VFBfmrFhdUcrPrGMDa1tCh/99auLacai0qDMcRxJFXEeiqk
	clLZUk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfQ1-0000000EupD-2cvT;
	Tue, 17 Dec 2024 21:47:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNfKz-0000000Etxp-0AqK;
	Tue, 17 Dec 2024 21:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734471759;
	bh=ysF7xo/3hIsbR7jhMLjJuhC4kEcU9qe1dpoxk58hyxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Sh6r9RnXFtGaw3exnOgkDIXkqh9usYDZUNB5KbX8Xvd4uuyIQhEZbqfJ4KK8gmTiH
	 bWT71VNRKS0HfbkoD8GDW+B+512YfRvWXzzdBNy6hgO3MBoS4+ZcuNd+qKC6q1wJRd
	 i/ZfZZxuUR+yZXG+5wsga0sLGgRGcuH4fxxAz6bfUoSvB2//farkEJ6ZrOdffp4zLp
	 SS6pVMunKwIGFG28+63MArojj236eN+HZpp5MEL230Xu/sTfj89f8/Fph84eaK1WOT
	 /1eVKvxb6WXqhmDbNQqRt+ZsEGB3F19jQMIQlCA5T+ZgdDSRHo3Aas3YA4BhXOgPf4
	 88W5RAI4HP6Kw==
Received: from localhost (unknown [84.232.140.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6027B17E381E;
	Tue, 17 Dec 2024 22:42:39 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 17 Dec 2024 23:41:53 +0200
Subject: [PATCH v5 3/3] clk: Drop obsolete devm_clk_bulk_get_all_enable()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-clk_bulk_ena_fix-v5-3-aafbbb245155@collabora.com>
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
In-Reply-To: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_134241_258583_3E04AE4F 
X-CRM114-Status: UNSURE (   9.82  )
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

Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
clocks") added devm_clk_bulk_get_all_enable() function, but missed to
return the number of clocks stored in the clk_bulk_data table referenced
by the clks argument.  Without knowing the number, it's not possible to
iterate these clocks when needed, hence the argument is useless and
could have been simply removed.

A new helper devm_clk_bulk_get_all_enabled() has been introduced, which
is consistent with devm_clk_bulk_get_all() in terms of the returned
value.

Drop the obsolete function since all users switched to the new helper.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/clk.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 1dcee6d701e439f35effd86ca3ee3b47a9839bd0..b607482ca77e987b9344c38f25ebb5c8d35c1d39 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -1138,15 +1138,6 @@ static inline void clk_restore_context(void) {}
 
 #endif
 
-/* Deprecated. Use devm_clk_bulk_get_all_enabled() */
-static inline int __must_check
-devm_clk_bulk_get_all_enable(struct device *dev, struct clk_bulk_data **clks)
-{
-	int ret = devm_clk_bulk_get_all_enabled(dev, clks);
-
-	return ret > 0 ? 0 : ret;
-}
-
 /* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
 static inline int clk_prepare_enable(struct clk *clk)
 {

-- 
2.47.0


