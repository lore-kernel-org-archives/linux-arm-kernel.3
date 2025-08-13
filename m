Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6807BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxOU5BqEnowXuyKmHs41c8c7RySK/7yzIpqPjsqWrqk=; b=xU5bmtH/tm6PHlYyqRQYiH1yMk
	OTq9/txE+FTRXuA2zH4hpRk1q7uF4aYu6LRTlrAaWkS5G3D1VKApWWUFaJBfHrjYM++d7K4IrCrXA
	Ty5WmTyfgy0c3fHlhaVWJUTEeeqqKsPQUa1fjsHVeimQ7+dZt3D+drA8o9aCCk/KEQuqtPlGw0D/Q
	p+5mw/YJ8jWSeuBuxPXtQaNy2jedXs7ARgY46BU+9GCFLYZQnX/aKVCVKgNZL3b+1tSF+XTsMVMvq
	LIE5WuC6sYkv4B67th09DbD5WTFY3uDI1sGzBZFMDwcSwit9eUrcCMBuvtzkx9noItzMauC5TyyFN
	mNdV152Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umD6h-0000000E8ZP-0SNT;
	Wed, 13 Aug 2025 15:09:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtO-0000000E4p6-1gob
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 14:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MxOU5BqEnowXuyKmHs41c8c7RySK/7yzIpqPjsqWrqk=; b=CDWLDNpk12EP8n3XX7IlQyWWSc
	QgaGPW/ZF8+/Rn3SoW4DzudeHEpvCRymkAaeiMbkCcb6RcesYASdVHohdx3U7rMAiOIa8PsFHyXmt
	g8xqL0i4Hx8soz9UAt1x1fIMu/1GSI9zZ9jDWbelg5h+Is0LhuQjsxKKf7rW+pC9xwp8iR9a+F07E
	0IKWX0LuMzFO12VZoJbKuHZ1dGcAjQKGu49xBwc3JNNQ/6SGVpz+Slbx7ISfqS6TnOfY1uG6WgPHa
	eus1E1b+CK95GHeh/CZa3iGDqoyKzLaljrFM+1df+27Z5PkVlGTDlSMAS7zQUyLbUyISbbYU1X1Xe
	yZpH9/Cw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtK-0000000G72O-3Z3g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 89C16A57D98;
	Wed, 13 Aug 2025 14:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FF2C4CEF7;
	Wed, 13 Aug 2025 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096947;
	bh=0IUVHkNpNiVd4dKfHNtccXkcqQYA1UMken7l+DdOKgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sx9Yd2EydQjztnnpSEbWNgnePm2SzoWEmawHNyY1iaTZyU0Q0m5Efl/ryspfKRvSz
	 5cO0hlFkGO46n6/ZE0k2WB0PJJ0cjfDqjCGqfJxccRDjwnCkR45t84zLTRthAVEJ5/
	 yMHXcjNoGE4NUgKcUjpEAiPQtCJPv+cHXzOsH9h03FqRmp7O7lO+xYEwsdPlxXsbe1
	 VsVFPVrsKPXhqPDykufgDRfZu+ooiDSW4/cEkokwazTTDObTiHmnpCfQpCgJRqS+py
	 yb8KiMse7KuH4OoHA2Z8clDZNddv8RqjA8EU5fDcLfP6YrW2ZLE0xcQRRwc6d5dzmh
	 2/yhI+JRjbbDA==
Received: by wens.tw (Postfix, from userid 1000)
	id 209F45FE68; Wed, 13 Aug 2025 22:55:45 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v2 03/10] soc: sunxi: sram: add entry for a523
Date: Wed, 13 Aug 2025 22:55:33 +0800
Message-Id: <20250813145540.2577789-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813145540.2577789-1-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_155551_128942_56D4EABF 
X-CRM114-Status: GOOD (  12.82  )
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

From: Chen-Yu Tsai <wens@csie.org>

The A523 has two Ethernet controllers. So in the system controller
address space, there are two registers for Ethernet clock delays,
one for each controller.

Add a new entry for the A523 system controller that allows access to
the second register.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 08e264ea0697..4f8d510b7e1e 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -320,6 +320,10 @@ static const struct sunxi_sramc_variant sun50i_h616_sramc_variant = {
 	.has_ths_offset = true,
 };
 
+static const struct sunxi_sramc_variant sun55i_a523_sramc_variant = {
+	.num_emac_clocks = 2,
+};
+
 #define SUNXI_SRAM_THS_OFFSET_REG	0x0
 #define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
 #define SUNXI_SYS_LDO_CTRL_REG		0x150
@@ -440,6 +444,10 @@ static const struct of_device_id sunxi_sram_dt_match[] = {
 		.compatible = "allwinner,sun50i-h616-system-control",
 		.data = &sun50i_h616_sramc_variant,
 	},
+	{
+		.compatible = "allwinner,sun55i-a523-system-control",
+		.data = &sun55i_a523_sramc_variant,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sunxi_sram_dt_match);
-- 
2.39.5


