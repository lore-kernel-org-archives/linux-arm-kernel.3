Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A03CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 03:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vSjirDMcIwt2DpAHpPxl8O3FqT6wTGihXYmQLv4yGY4=; b=g9xwfqiRN3nfZGX+waqrCXOjlS
	S//XfwXDcVh6SQLxAzHgN+uT7S90Y4n+J24KRWVhUZCJ60cDeeZmxwUMDwLcqYVkMyXxuxclUtEv1
	gvbgUNjeDsYFaUuA3C93tbxupMcGC2GN7ZP+vPGZOgjRVHQao7U59hH0Dzct27w3qvTlGwNtsW56Q
	XN4NsrxdvArIRyFDyUh32dDaEucC459Ai5Mww+MdprcU+QoIYdkoZNyPH4Q1mWKAE2oFd1XDFA9mF
	D4i4hmiTK2JSjxPYK2pQ0PSjFNebMHMfVlkcTOt4zyRAQlGQmGE72f1GcEfGnDGWa9NJb0MfYHgEF
	s8u0JHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqMe-0000000Ennn-3C9p;
	Thu, 06 Nov 2025 03:08:44 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGqMa-0000000EnnF-1XEO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 03:08:42 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowADXQWwwEQxpWgyhAQ--.7059S2;
	Thu, 06 Nov 2025 11:08:33 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] soc: imx93: fix missing clock disable in remove path
Date: Thu,  6 Nov 2025 11:08:22 +0800
Message-ID: <20251106030822.1139-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADXQWwwEQxpWgyhAQ--.7059S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFyktFykJw4kCr17Cw48WFg_yoWkKFXEy3
	WUCr9agw43Ar4IvFn5tr1YvwnFqF9Fvrn0gFy0qF13CrWUA3WfZ3yYyr13XFy7Wrs7Aa4D
	AF18Ary7CryxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUe4SrUUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkSA2kL5JjfdwAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_190840_790434_1251EE8D 
X-CRM114-Status: GOOD (  10.60  )
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

The remove function never disables clocks that were enabled
in probe when the domain was initially on. The function
pm_genpd_remove() does not invoke the .power_off callback,
so clocks may remain prepared and enabled if the power domain
has not been powered off before removal.

Explicitly disable and unprepare the clocks in
imx93_pd_remove() to ensure proper resource cleanup.

Fixes: 0a0f7cc25d4a ("soc: imx: add i.MX93 SRC power domain driver")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pmdomain/imx/imx93-pd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index d68273330687..da5b7b81dd98 100644
--- a/drivers/pmdomain/imx/imx93-pd.c
+++ b/drivers/pmdomain/imx/imx93-pd.c
@@ -91,6 +91,8 @@ static void imx93_pd_remove(struct platform_device *pdev)
 
 	of_genpd_del_provider(np);
 	pm_genpd_remove(&domain->genpd);
+	if (!(readl(domain->addr + MIX_FUNC_STAT_OFF) & FUNC_STAT_ISO_STAT_MASK))
+		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
 }
 
 static int imx93_pd_probe(struct platform_device *pdev)
-- 
2.50.1.windows.1


