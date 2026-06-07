Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8FFCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 23:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1bWzrJN0ChypimqdCHObkyXrI5qabUub5M0dgvSei8=; b=fWssuTveH7ll7nDld7uKsADoC9
	ukJtsPybdLldhFEff8DwXg9tLwHoRulu7jPlMR1VqkYiw23idHY9EhFgiu/KvQvLUM2q6/mokN9Um
	r8wCCWOJfxqq3YOGADVchpymaHcyeMtZQiw8oSvDOQtXUfcCVOenTOq3gD1npDTNTHl7Da49cxSKM
	rCtyP1qeOwNf+Tb3QRLcuAdxJzlveWdJOcyITUshOoutHrJS1EPTvkLqGnp3yiESeOXWClAbo5e9L
	fY20ZFtjV4YYxSdr11epglVkmjlOAgIRuzoOJd+nB6YZxkZSbidSMQ7pELXJzJvmPItoHt6sn48pU
	/yA63Shg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWMYb-00000002asP-2Pb4;
	Sun, 07 Jun 2026 23:05:29 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWMYW-00000002apq-3G3c;
	Sun, 07 Jun 2026 23:05:26 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2C9FF2763D;
	Mon,  8 Jun 2026 01:05:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id annWcSptkWLZ; Mon,  8 Jun 2026 01:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1780873519; bh=9KdW77VqNR0noyJraGKncMh9TbDUKb8mBPe4vbpDVjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YXhOGjDyM6n2YKjLbZ4dIqumOAWBzKD4nZjQLzdPu6SKKeLX0XRFNPyi5lFRDr0Wf
	 YMBAcUHph1W3ivcIbgQ2pOX5G4lx3C3Jra7xb7obCmMWDZJHrO4xsScU4LSS7/+2gA
	 /qL/Gc5OEvXSsc3gvDGyPUM05CoEq0640SQzNoDuhsCjUA7krNZ05k5OSG3M1zilQa
	 iY12+x9x1DZi8/2M2z5CFQXFJLqB8Z6/SBxCS+HIvJr4CbcU9+IswWA6gBAAVt7fHh
	 WpE4Cn72pga5vADXEYHhC3b+7dkqX66XJnsnGaVEbppXrU0mEcgfE3QwnrTK3CsRaj
	 GaJuSuHfJfJpw==
From: Marco Scardovi <scardracs@disroot.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] gpio: rockchip: use platform_get_irq() to retrieve interrupt
Date: Mon,  8 Jun 2026 01:05:04 +0200
Message-ID: <20260607230504.35392-4-scardracs@disroot.org>
In-Reply-To: <20260607230504.35392-1-scardracs@disroot.org>
References: <20260607230504.35392-1-scardracs@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_160525_226119_CFDBEDEA 
X-CRM114-Status: GOOD (  10.40  )
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

The driver currently uses irq_of_parse_and_map() to parse and map the
GPIO bank interrupt from the device tree node. Since the bank device is
represented by a platform_device, use the standard platform_get_irq()
API instead. This integrates cleanly with the platform device framework
and ensures proper error propagation (such as -EPROBE_DEFER).

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/gpio/gpio-rockchip.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 8647d006d103..77b239a9a601 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -654,9 +654,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	if (IS_ERR(bank->reg_base))
 		return PTR_ERR(bank->reg_base);
 
-	bank->irq = irq_of_parse_and_map(bank->of_node, 0);
-	if (!bank->irq)
-		return -EINVAL;
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+	bank->irq = ret;
 
 	bank->clk = devm_clk_get_enabled(bank->dev, NULL);
 	if (IS_ERR(bank->clk))
-- 
2.54.0


