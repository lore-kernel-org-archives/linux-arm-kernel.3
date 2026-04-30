Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D92CCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQxspS4wxPZq+kXv3CrA/ZYdLYAgARtNleYvId2CL8I=; b=oCEvRBTCMvHpo9d4JW7uTYEoqu
	vVDrytiHKmt6RWWTGMeyae69+/8Kk+cQfBbQebtxXskuz/nY66k9iRFjrjJfZnRmHiWAqeXRtSLD4
	+V6Lfheqx6z7wv38VOMS2MB410yt0H3LT7wIFXKNGQwhYpAvjRBsFW6hajYbTKBTFFyj/unWHC0DM
	yfiDOCQz7qNfwsiIHirBARKPQ4Z3z+5fx0ZYJAz+TNT0KHxVIeykKX0J151gmrFZL/HNOT3dTh7rD
	jcXi9/5JiFEeh9vGSt/xeJ6Ue6QUGg2F57nlBKoAVnkzgemhLJIm5h371nvp6VHDciTcCktneGJOZ
	2GAtxwsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITkI-00000005gPY-1Isf;
	Thu, 30 Apr 2026 15:56:10 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITk3-00000005g9t-2O3E;
	Thu, 30 Apr 2026 15:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HQ
	xspS4wxPZq+kXv3CrA/ZYdLYAgARtNleYvId2CL8I=; b=Eeena73NkuNk4UmjwI
	fXWJ8s/F7TmtJiTyAeJRiS7Hu1cvE/qAiLt+oLjCu4PP0Of0X9AGDalm3UUKqoqU
	SBMzo3CopvwST1ucWvHRqVzXJPk9NuPlKe7mX9gi3k4QVXA58gbIjMruGQFY+ton
	PoeU6sTJCLRPPgJIgnR8n51yM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXyu5Se_NpHedTCg--.49548S5;
	Thu, 30 Apr 2026 23:55:03 +0800 (CST)
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
Subject: [PATCH 03/10] spi: cadence-xspi: Use FIELD_MODIFY()
Date: Thu, 30 Apr 2026 23:54:49 +0800
Message-Id: <20260430155456.36998-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXyu5Se_NpHedTCg--.49548S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17Kr1UAw15ur1DtF43Wrg_yoWfZFb_C3
	Z5ZrWUKF4DKr1Ika13trs7Ja4qqw4Yvr4DuayvqF43tw4DJ3WYkryqvr9xCrW8ZF18CFWF
	9wn7Xa4vkr13AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNmhF7UUUUU==
X-Originating-IP: [240e:b8f:927e:5900:c497:d540:b00d:97f4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xdL7mnze1dOhAAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085556_418483_F90CF338 
X-CRM114-Status: UNSURE (   7.63  )
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
 drivers/spi/spi-cadence-xspi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 895b4b3276a5..32fa19ebf7a9 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -453,8 +453,7 @@ static bool cdns_mrvl_xspi_setup_clock(struct cdns_xspi_dev *cdns_xspi,
 		writel(clk_reg,
 		       cdns_xspi->auxbase + MRVL_XSPI_CLK_CTRL_AUX_REG);
 		clk_reg = FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
-		clk_reg &= ~MRVL_XSPI_CLK_DIV;
-		clk_reg |= FIELD_PREP(MRVL_XSPI_CLK_DIV, i);
+		FIELD_MODIFY(MRVL_XSPI_CLK_DIV, &clk_reg, i);
 		clk_reg |= MRVL_XSPI_CLK_ENABLE;
 		clk_reg |= MRVL_XSPI_IRQ_ENABLE;
 		update_clk = true;
-- 
2.34.1


