Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCDED3E78C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E93S7Q8y++FOL3m/D0GbV+rHXdW8GgCuYU8lejTM1Gw=; b=nSgzM/GrWp/WfhnOqsdQxVW2go
	vw+cbSEbCvShzJQ3WTvXohhDtA2ClzYVs739ASP8fNjAlhIkVrWbrpHveLuIhzIUu1HJqF0emp5Yz
	5bnjui/VnJ+eLv/w6rSlmdZbaF1dYJJzEHO3268OY1eyV+KUbYy/lDiC3kwJYttf/u4TLnp9teOC/
	hcZFZFvlwYnxfe++Q3mMllo03OinkvWqAkg1plCFnICw5Mud3Yko/xUKOrbGLDBhim04fV2rr7Sft
	+t2ecFOejx70dcIzb5/0psBkpI7gLiKBrXIdH7cfsiTqeUQWAMgyjzo/whqoPKJAQAdlXR27aV8uZ
	bSbbSW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cJd-00000002X1p-3mY1;
	Wed, 06 Nov 2024 09:27:05 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bx3-00000002OUf-0eGc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:03:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4815C000C;
	Wed,  6 Nov 2024 09:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E93S7Q8y++FOL3m/D0GbV+rHXdW8GgCuYU8lejTM1Gw=;
	b=GzRhmvhDYab6e+aCvOAiscJ14yt1FYl8jh7MKLtr4A4vMqEZOHzd0P8TdQn6hOnAyQuYbf
	hQnynd8cO05pDbs8uNL+GptssVm1mvRJbKcXtGWAEe7qmBqnymwkcCTPqNM2PDIa99+ZWO
	uMs6xRvQnebX+7JxKrDlm6SHHRIECJJtO5Q9ePjtPjsaCA7d48br78MNm4j9w9cPKkTLzu
	taNlpdcAE5Rxfs79B6Fae5yrpit0C7nurQMyDs2yPYhuTOswLbwzo3h2MZH5XAZXyFqXBk
	wiSdvDBZp0SioSFlTzsKTCqGtkoiFXGIYLT1wGOzxi5D5yrh9mWqg5/h+LRy8Q==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 9/9] net: stmmac: dwmac_socfpga: This platform has GMAC
Date: Wed,  6 Nov 2024 10:03:30 +0100
Message-ID: <20241106090331.56519-10-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010345_351836_EBB4C0EA 
X-CRM114-Status: UNSURE (   9.09  )
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

Indicate that dwmac_socfpga has a gmac. This will make sure that
gmac-specific interrupt processing is done, including timestamp
interrupt handling. Without this, the external snapshot interrupt is
never ack'd and we have an interrupt storm on external snapshot event.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 0745117d5872..248b30d7b864 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -485,6 +485,7 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
 	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
 	plat_dat->select_pcs = socfpga_dwmac_select_pcs;
+	plat_dat->has_gmac = true;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.47.0


