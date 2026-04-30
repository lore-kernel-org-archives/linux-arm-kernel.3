Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E26CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCfiPQKy7ydNIZx9BuCZLKIgIDMxYJ5OZgWqt3I9gXo=; b=MKbPfJPZyfKpyqPDvynDzVJcY5
	N2KRkZ7bWFhqUJYO8WJ3AksMxpjrKwQwFCbY+ejXdXIu/fIzSZUXH1uv0yEJF1D4vh9AQgVqXu6X1
	N/p13JNjFr8hBWs0mgSeAnyaHEO/T88Zzj4LwgBNV0qdw5vqmH9XTI+1+toPs2fE8ixvmE+/p7pFq
	/m2DrD+fH4LRhbrmUtu98HxrBgjinz5tTSWyLXsFESnoAz3SOO63txeyJ7WfiLaLd+/NcV8DiyOeF
	OdXeg24itcj/baS/UHBxelczZ0UD5sVdpnSJW4aq3Lqkx80XWMAH5n2/torFC4Xml2S9clcfBZyEj
	bCxAKcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkF-00000005gLP-2GVH;
	Thu, 30 Apr 2026 15:56:07 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk0-00000005g9y-1fQ9;
	Thu, 30 Apr 2026 15:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=iC
	fiPQKy7ydNIZx9BuCZLKIgIDMxYJ5OZgWqt3I9gXo=; b=aTp0iwLMbQ8BW0a3fa
	5ijjRQ2+ANinIhkuERPsyFJ7wb9M0GHuDlAm+TqB5gvTASOB1VeTQ01lGdMnTY0u
	8Tclt/2qSSXkucmph7jZ6d+gNrIfJ567rOQBoAffA++zFvjEaGZn2XyIPWqJXaGF
	BbqJS0EklPLKkxIhxgBkqjzck=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S11;
	Thu, 30 Apr 2026 23:55:10 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: broonie@kernel.org,
	sunny.luo@amlogic.com,
	xianwei.zhao@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	lhjeff911@gmail.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 09/10] spi: sunplus-sp7021: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:55 +0800
Message-Id: <20260430155456.36998-10-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S11
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17tw4kXF48WrykWFy7Awb_yoWfCrg_Cr
	48Gr42yr4qkrZFyF4rKryfAryq9a95ur109FnFvrWfJrWDCr13Wrs7Ary5ZF15Aw45AF4a
	grZrJ347Zr9xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNa9atUUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxB5N8Gnze15lHwAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085552_900577_D3080E4E 
X-CRM114-Status: UNSURE (   7.86  )
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

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/spi/spi-sunplus-sp7021.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-sunplus-sp7021.c b/drivers/spi/spi-sunplus-sp7021.c
index 35601212fb78..c1870322d976 100644
--- a/drivers/spi/spi-sunplus-sp7021.c
+++ b/drivers/spi/spi-sunplus-sp7021.c
@@ -290,8 +290,7 @@ static void sp7021_spi_setup_clk(struct spi_controller *ctlr, struct spi_transfe
 	div = max(2U, clk_rate / xfer->speed_hz);
 
 	clk_sel = (div / 2) - 1;
-	pspim->xfer_conf &= ~SP7021_CLK_MASK;
-	pspim->xfer_conf |= FIELD_PREP(SP7021_CLK_MASK, clk_sel);
+	FIELD_MODIFY(SP7021_CLK_MASK, &pspim->xfer_conf, clk_sel);
 	writel(pspim->xfer_conf, pspim->m_base + SP7021_SPI_CONFIG_REG);
 }
 
-- 
2.34.1


