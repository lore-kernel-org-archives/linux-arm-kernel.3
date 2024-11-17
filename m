Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A014D68BF9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F86dYHhTvuTsM0pNGR7yup3yM38zQaZLLpJ4MuMSPEk=; b=P7XpUpdnMtzy85rBnPhDQDzbkx
	UzqACOS1GcsRDGSkLqpBOQzvijrwtbz30uMUCgAfi/0Hu37iBZpnReAJvywdw3xsjB7QKR66MLwfk
	CbqkU2ADHt8ozG/V+Q6qHaluUiSo7SBMK+yLKR4v1/rX6hTkvBeJHkKCcydo9cBYZh2UdhO0YMMs2
	abDJuhtyQEycild8okaZSLmwoXhUPR1reTV0oF6UQd2VoTD1EjgfORjZZM/2nmeTs6j39x0IYFS1d
	oQVvnpCxjIqad64Q0Zv552RhwM7eaMEf/zAg3rw1T7th+C6DmOpuAc+Iopq9o8jgzdKeIBp3kSnk5
	FCk3GeUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCe1J-00000007GpY-1jtK;
	Sun, 17 Nov 2024 12:04:49 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCe0M-00000007Gc9-44nA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 12:03:52 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Ce0FtKvGCPqyaCe0GtWgzY; Sun, 17 Nov 2024 13:03:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731845028;
	bh=F86dYHhTvuTsM0pNGR7yup3yM38zQaZLLpJ4MuMSPEk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RA6qYfnMtS4P7V9Zq0yBEygn8/KuBN1SNPfWjxCqVfhLZr2rNX044LTOu2zPQvQsV
	 ZvajoS82pGIMDAyx0scSznzvcZWKoJ73xGGChp8RcKsmuW20UcjNTUo/3i0tR/k7Z5
	 eWkvkp2BvbuuL7WtJRdllnGUzVZae9YRrkAaPrwzXKIt33FNTpkDahi7Syo3sDlSmK
	 dwORZ6R37qho4XntvmGu2/2nam4cLTXbdVngwZKJ9Y1gsiGSW5rSOp85mhVTz9Rplw
	 WH8a65A3n3JA8zUBzgqHg9bK3e0LX73+iOB/XdAvowMObmzP4UelQd5M1rD4q/d6Tt
	 BjLBfdpEjZfFw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 17 Nov 2024 13:03:48 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()
Date: Sun, 17 Nov 2024 13:03:32 +0100
Message-ID: <f148d823acfb3326a115bd49a0eed60f2345f909.1731844995.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_040351_162039_A4B88FEB 
X-CRM114-Status: UNSURE (   9.81  )
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

chained_irq_enter(() should be paired with a corresponding
chained_irq_exit().

Here, if clk_enable() fails, a early return occurs and chained_irq_exit()
is not called.

Add a new label and a goto for fix it.

Fixes: f9c744747973 ("pinctrl: samsung: support a bus clock")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

Review with care, irq handling is sometimes tricky...
---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index b79c211c0374..ac6dc22b37c9 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -636,7 +636,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 		if (clk_enable(b->drvdata->pclk)) {
 			dev_err(b->gpio_chip.parent,
 				"unable to enable clock for pending IRQs\n");
-			return;
+			goto out;
 		}
 	}
 
@@ -652,6 +652,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 	if (eintd->nr_banks)
 		clk_disable(eintd->banks[0]->drvdata->pclk);
 
+out:
 	chained_irq_exit(chip, desc);
 }
 
-- 
2.47.0


