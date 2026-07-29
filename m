Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AB2C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48FUnn8E6F/706c6uJafd2FyPoPe0S+UU6ChQIIVEBI=; b=1Lh9H7lvf4Txec99wgArsF4Voz
	/tgDEoCV9PDPCLwL4vrvu6ZPCKiupsyjloXrSbphijh8PuM/u1XLgIDVPwPdumzTrSKsa1rr+jLN7
	q45akWA6QD8LbaaoEBzP0j+JEMEOmCy+YJAYFzCn1KpO3SyAO+VsFR22b3D6fv4vuHPsNu0jEIL8P
	ZmUHbi0GkHRHgv4Tid0YMyJz78ygPemXoSg1dF3kSc3CZ77LW09tVIyZ3qYOsKg//Bx8ttAHjSFGK
	NQhVGTGPEXrqXszRU4zhQ5Igilqd/g7Ea/E6k+qPQr0ARZAYI9SyE8nW0NCwn/fzSzH58kv7go36V
	8lJjtROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18f-00000007Seq-1Y1T;
	Wed, 29 Jul 2026 10:03:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18L-00000007S9O-2ozO;
	Wed, 29 Jul 2026 10:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=48FUnn8E6F/706c6uJafd2FyPoPe0S+UU6ChQIIVEBI=; b=JkHvt4CVkQ0DiAu5XPly4JTIaA
	CFYLd1xSR4y+tecQcZzWQlk7jIE9tBufpym5tH4aKyjwADPXnFU+YSPbCZe6l4MIqPWQRc6TB+bK0
	QQLJZ99jasfeRiYNp7jPg1JSdPsdxfUJAmXQCemLdhReNsaSUEu6gwczzKV2sZsKfAUhJerlBS3lw
	4NqH+UoOrCrzjcDLPmkXl6n0bkrSZB+4jDKkT1cFh66XPZn4mk9mY1mC3Hq8eL/QfJemLMl5THzyC
	5OZkI1FmyHv38xU8pOuJFzRVPc+bmJoubqFoDwLcK8IE+jFDYvh/DFfpCiN/RfstD6FFGnuBb2w6Y
	x0NKMzSw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp18I-00000005eRQ-32Rt;
	Wed, 29 Jul 2026 10:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319405;
	bh=0Ll+/SLFb8txIVve2YQ50ZAHjghMkBWQteo5ybOHIp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XPHD+ZO1IU+crR/nmIlYB2gL1EWTjVQqzdu3t9itaIC5QBQJleNgPpKt1uvdgtAVG
	 5F0IH1lrpcZzodV2Eqr1yy5mTBA8MupXMDs8zQf2w5ZNkBA9CbGxbKbMg8WU4rS5bt
	 rhKz6DBMnGINMU+cEwrCqoSLIKmqR0en4Jtu1aUzJh+e3+5W7Wx1FpKDxS1PusjBf/
	 k38ALuJr2KE8vKXyS0FChw6BMo5ZDchvm4j3G+gaSB25ZWDI6HSnDugEERs8RstmFK
	 gZmQH2G3TcX2whZuwgk6NXLHGU97Y9SZ1V+jBnOqRYHNaQWHtEMkVRZflPEhNFLpwB
	 0BBgyH35djEpA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 295EA17E0682;
	Wed, 29 Jul 2026 12:03:24 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:57 +0200
Subject: [PATCH v4 13/24] clk: mediatek: pllfh: Add configurable clock ops
 to mtk_pllfh_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-13-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=1909;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=0Ll+/SLFb8txIVve2YQ50ZAHjghMkBWQteo5ybOHIp4=;
 b=77MhgRhlTQpzt4t6O+sr+dAbmV+1CQ/GMTzzjqoj7JqqMpI1ei5ey+P0EDUrtIxmOoRSE8QDc
 ETA1EQlipzWB3IMHCwCY2IaXJHLw6VuQ0ZzWRuNg1fyjmHcz1X8JNUB
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_110327_055351_787CC6DC 
X-CRM114-Status: GOOD (  15.41  )
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

Currently, the mtk_clk_register_pllfh functions always registers the
default PLL clock operation set (mtk_pllfh_ops). This does not allow
use a custom one, for SoC such as MT8189, that needs different
set with support for set/clr enable.

Add a new field for the ops to register in mtk_pllfh_data structure
and use this new field to either register it when not null or the
default ops otherwise.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 5 +++--
 drivers/clk/mediatek/clk-pllfh.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index aa95cd9197b3..4878ac6da7da 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -153,6 +153,8 @@ static struct clk_hw *
 mtk_clk_register_pllfh(struct device *dev, const struct mtk_pll_data *pll_data,
 		       struct mtk_pllfh_data *pllfh_data, void __iomem *base)
 {
+	const struct clk_ops *pllfh_ops = pllfh_data->data.ops ?
+					  pllfh_data->data.ops : &mtk_pllfh_ops;
 	struct clk_hw *hw;
 	struct mtk_fh *fh;
 	int ret;
@@ -169,8 +171,7 @@ mtk_clk_register_pllfh(struct device *dev, const struct mtk_pll_data *pll_data,
 
 	fh->clk_pll.dev = dev;
 
-	hw = mtk_clk_register_pll_ops(&fh->clk_pll, pll_data, base,
-				      &mtk_pllfh_ops);
+	hw = mtk_clk_register_pll_ops(&fh->clk_pll, pll_data, base, pllfh_ops);
 
 	if (IS_ERR(hw))
 		goto out;
diff --git a/drivers/clk/mediatek/clk-pllfh.h b/drivers/clk/mediatek/clk-pllfh.h
index a4f337acad71..d32bfe194ec4 100644
--- a/drivers/clk/mediatek/clk-pllfh.h
+++ b/drivers/clk/mediatek/clk-pllfh.h
@@ -34,6 +34,7 @@ struct fh_pll_data {
 	u32 updnlmt_shft;
 	u32 msk_frddsx_dys;
 	u32 msk_frddsx_dts;
+	const struct clk_ops *ops;
 };
 
 struct mtk_pllfh_data {

-- 
2.55.0


