Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE79FD5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 22:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T12vb7Rc3Wa5G+6wC9JGvIuv9pH1b5e1APDZD01uofc=; b=3a9aHY4fjosasWu3Kj1q/wN+IZ
	7QsSla4Vzc6KvRos5RF8uCbPToYTHSNZwPLRnFm4EFJZrYWsdkqPT10+4rNwm1l2QPio9YIvpU9Se
	PbtNpt4c6oIuvomkO/V3JGbg8WUc0GYPci8kgKB2xADKva+p6EF/3RcR4GbMwXev7fr1ssMok/fFl
	LmtoCas61PbMBUiRZndD9AuMO/fGD9iHNChDNedGhBfJhLel1WQ1b8924TsEa6JuFwWKUPq6K/0yt
	yuim0KQ285GLRSd7V56oPf/3XlZc9AWz8GuBO6wuSRvJEnp9x4UEuLzLcxlajtBJWDqVuVPo4USDW
	DZ1X4Ibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuO1-00000002mU5-1OFF;
	Sun, 14 Dec 2025 22:16:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUuNg-00000002mS5-0pKj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 22:16:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 773B444497;
	Sun, 14 Dec 2025 22:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56912C2BCB3;
	Sun, 14 Dec 2025 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765750553;
	bh=+dB1ubbQUZbbOBra3vCG6KF5yaKYR81O/ni3EMy7Nb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EJwZiL8/o8OAqNHR8DmIpjMQJmZS6GarMS4Dh7gOfFm84cO8ExZqijdqRoTaxFQ+N
	 zUkS8m0lWsuZ6MoMnByvAHLj3smihk0bdyZscRIKvklUQot/Ig9SSdHHiqP9UQsAYQ
	 fs4AMbK83DrtyqxpTsQ8ZOF1BirIzZnmaBt1u4JCMrqua5086jLVJCGo2WSzJj6meG
	 8d3gYkLQIdnHKz7MfXT5a14XDp8DEFPFjpLBd+RN/qziaJuWQpTazfaF+9iAPiykeW
	 cuZTT0EvzgXMlnAeN15MX85386AIAZtZNY2Nb+8oqqNJxzORlvf2Ka7arrTkLJNcCS
	 xGXIgwScvgxqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4810AD5B16F;
	Sun, 14 Dec 2025 22:15:53 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 14 Dec 2025 23:15:40 +0100
Subject: [PATCH RFC 4/4] stmmac: s32: enable multi irqs mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-dwmac_multi_irq-v1-4-36562ab0e9f7@oss.nxp.com>
References: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
In-Reply-To: <20251214-dwmac_multi_irq-v1-0-36562ab0e9f7@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765750551; l=1135;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=uKYPU0Ih9OcJADxPjnsSZTg/aiN/NSWTJ7b+174uNp0=;
 b=ccktjokTsHbY0A8sCrOp0tvellHMrF7o/nyJheYG8kgkcnDKKoYdHjDKtsJCQl7WUSZQnL3hC
 etvrjrpdbBbDMgbIUC/YcKNTWUWoFvuM3l4eTc66bLQcMfsxAg2TFRv
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_141604_872694_ACB7D6EF 
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Signalize support for multi irq mode.

From now, if yoused old DT node, without channel IRQs set,
the driver fails to init with the following error:

[4.925420] s32-dwmac 4033c000.ethernet eth0: stmmac_request_irq_multi_msi: alloc rx-0  MSI -6 (error: -22)

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..284e2067a00b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -2,7 +2,7 @@
 /*
  * NXP S32G/R GMAC glue layer
  *
- * Copyright 2019-2024 NXP
+ * Copyright 2019-2025 NXP
  *
  */
 
@@ -149,6 +149,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 	plat->core_type = DWMAC_CORE_GMAC4;
 	plat->pmt = 1;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
 	plat->rx_fifo_size = 20480;
 	plat->tx_fifo_size = 20480;
 

-- 
2.47.0



