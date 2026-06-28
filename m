Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B474C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CW5NmljKphCqYt/V6pSqhpsDQ9Bm2K9UPK6Z/UjT0uo=; b=fzcL40hBlJdxQ05pMvxsUXfpze
	DC9Rk3Mjlk1N5YZucZVoxhXjYnoqjl1WV3Vi/DY7/5buFaB2ks3cgMAO7GUo+Jc3JYOG4hTPKdd/1
	ttgDp6PmStebpssh5MbhadefmGy0FaBK6cA3T1oVMxP26SAAit9Vh6nw2FskUIOGPg2pfX3HDcUPY
	0Ho19A3+hxpzDj56d5ah+94U4SHz769BIhiR/v1fwRv5J8iBoL6Cz7nP1igfXbpqgGqN+a+l8bd/2
	HtdX4roM03tJ0ZoJd7uFqHVrGy2ZRjeORXbm6yzOkIu+DKyps/OWMDy//Layttt4oWekDGRJ3RUFn
	CFflirFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdp1w-0000000D6aI-3gTU;
	Sun, 28 Jun 2026 12:54:36 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdp1t-0000000D6Zn-1q6j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 12:54:36 +0000
Received: from localhost.localdomain (unknown [117.182.74.7])
	by APP-05 (Coremail) with SMTP id zQCowABn8QR_GUFqTy_FFQ--.33510S2;
	Sun, 28 Jun 2026 20:54:25 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: alim.akhtar@samsung.com,
	bmasney@redhat.com,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	Greg KH <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk/samsung: fix parent clock refcount leak in exynos_clkout_probe
Date: Sun, 28 Jun 2026 20:54:22 +0800
Message-Id: <20260628125422.45267-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABn8QR_GUFqTy_FFQ--.33510S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GrWxAFy3JrWkGrW3AF15twb_yoW8JrWfpF
	W7KwsIyF45Jr4jyF4Dta1UZF4S9a1Yva4jgry3C3WFqFn8JFy7Aay0ga4qv3WDJ3ykGrWS
	qr12kF48GFyjva7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-Originating-IP: [117.182.74.7]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwIMA2pAixHs6wAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_055433_860807_F4C4ADF9 
X-CRM114-Status: GOOD (  10.08  )
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

of_clk_get_by_name() acquires clock references stored in the local
parents[] array. All error paths correctly release these via the clks_put
label, but the success path returns 0 without releasing the parent
references. The references were only needed to obtain clock names for
registration and are permanently leaked after probe completes.

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Fixes: 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to module driver")
Cc: stable@vger.kernel.org
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Fix patch format based on reviewer feedback
---
 drivers/clk/samsung/clk-exynos-clkout.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5b21025338bd..71724b56de69 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -190,6 +190,10 @@ static int exynos_clkout_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_unreg;
 
+	for (i = 0; i < parent_count; ++i)
+		if (!IS_ERR(parents[i]))
+			clk_put(parents[i]);
+
 	return 0;
 
 err_clk_unreg:
-- 
2.39.5 (Apple Git-154)


