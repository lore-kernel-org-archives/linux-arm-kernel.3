Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9339CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXrk3maW/kVjpHXzMbzrhVPMUli2gn2TlRN4WQMNS40=; b=zeopenJ/DobNab5IbC6OSzHJ7+
	a0F1qbk84tzMzNoCb/GNcQ+menjUSl9IXbsTqLb7yD8k2jAnTdQ66kouo8TJyulPcSbQMn288mHl4
	kY8/j1n3Ww8mB2ZkOxC00sc3z/AljHhqK571Dkl3khnCsovEhngy4NjxEVINwJEP+LWGh90A6XsKs
	rzyLNIawCA14L08fX9GGywMHExVVR3VTMEpvpsTV6SV/TL+yfr7soxHdGcRQIOH3Ly3O8dJsFtPr8
	px517AzjkQAMsIFNszHs9ogAI/Et9Gqge2DN20gfBz6l2bXb0+cAYwhr9ws2fN5jkDnXGvXfFiAEN
	+pgz0qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlf2-000000033ip-3Y0L;
	Mon, 08 Sep 2025 23:52:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgKe-00000001RHS-3MDs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2525644AE4;
	Mon,  8 Sep 2025 18:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6C8C4CEF9;
	Mon,  8 Sep 2025 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757355071;
	bh=e0tQSO9pJI2jVvlvL9W4OBbAj83puHTjG+o0KV+3bdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XGfuiBknyZewEytJ/+sWeCVFnZqN99cWs8KQAMSWVX2/XB7wV2n64s5ROdA62JhqR
	 KKtEEZ/ZLQQpfU6N8wJpYtSca+N88owhvtfBytXnInqufA4EK/og1+MmVdTz8WH7d9
	 5kXTctapjv6J0Bs7F7vdvegV6PAnddgqiEcYjT2/1mHbh8ftEuBK/JXmSEGzF/470O
	 sQpaJpjCeD9YUKES5Na8l69N/gSoFIm3ZoLdxmRW1Csa6uCUxCknH4OZcxOhSc44/9
	 9T4PIJZDmP648eKZWZtuP2EXiTsTkssAkmRzGI7DHrXgXKv0xx4lWLz7FDAJVXPybM
	 X5OEvD5qwQZkQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 342895FEF5; Tue, 09 Sep 2025 02:11:08 +0800 (CST)
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
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH net-next v4 03/10] soc: sunxi: sram: add entry for a523
Date: Tue,  9 Sep 2025 02:10:52 +0800
Message-Id: <20250908181059.1785605-4-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250908181059.1785605-1-wens@kernel.org>
References: <20250908181059.1785605-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_111112_860043_77567264 
X-CRM114-Status: GOOD (  12.57  )
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
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


