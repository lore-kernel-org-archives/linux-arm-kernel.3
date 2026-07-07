Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F41BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lgwdnEn24PopOzdpstGeWRcgCfBKK0UG6WHCBzKOg0=; b=pisQu8bm8RaaGOSVzv3XxLFi6D
	taEPUaXAvzpXsuSt1pqlLur/GnWk4+vbKiX3GRDz9kNST8QYZQyVGq0mQNGzOo7jboJN6pD0RPbf+
	TD+VITsFe+xXNs+fThCoBRTqkaGrcrN8LLHrjZX9CQO/pca/MIbY6x77aWoYcSPWjudzS1ykoIZrs
	o6VoVzLTtUFIDAcNFUOdiSmgN3eFaKKCst5oHP/aB81jos7v/8QvyU7zc8Vj6DNENVWS8Duk330xI
	VM/7N9tHlp+JAMtmUBQbSWmlR5q5rPwtW/BIZy2ipzvUDyZXv4GjagRzmVp9qoPLWWXP4jP9DfI1M
	0ExAamew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9qh-0000000FaAD-3Yw6;
	Tue, 07 Jul 2026 17:44:47 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9qd-0000000Fa6s-2qXE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:44:45 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174441euoutp02a81b21a23b683cba852c2648bcf19372~AEvGoGO0A2060220602euoutp02g
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:44:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707174441euoutp02a81b21a23b683cba852c2648bcf19372~AEvGoGO0A2060220602euoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446281;
	bh=6lgwdnEn24PopOzdpstGeWRcgCfBKK0UG6WHCBzKOg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JRJUnV2Ixx+tyiPVvh9zBM9GyPlnmwK4y0hzqJra042KHeaI7QgHpe8dWpcEoUCP6
	 3uaxgKg5NgcJPkMSpIvlHnsZ6tn3PmyACROFuWTqQJNl1qN74WK37SlNuRSbrfUgZF
	 iEUgfV1q8A4uDB6tJO/TKmUSxmJTXnNd4w5ve17w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056~AEvEpANIX0453604536eucas1p1a;
	Tue,  7 Jul 2026 17:44:39 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174438eusmtip2b15724d2727fe1b8344eee30956fb692~AEvDi9bfW1215712157eusmtip2g;
	Tue,  7 Jul 2026 17:44:38 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net 2/2] net/stmmac: Verify provided DTS AXI setup
Date: Tue,  7 Jul 2026 19:44:31 +0200
Message-Id: <20260707174431.1264520-3-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707174431.1264520-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056
X-EPHeader: CA
X-CMS-RootMailID: 20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
	<CGME20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104443_988088_77672479 
X-CRM114-Status: GOOD (  17.93  )
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

During parsing of AXI setup, there are few issues:
- 'axi_blen' array is uninitialized value on stack without zero-init stack
  configured. This can result in random AXI burst length config if
  DTS config provides shorter array than AXI_BLEN.
  Fix this by initializing it to zero, which allows to provide shorter configs,
  which sometimes happens where only one value is used.

- stmmac_axi_blen_to_mask() is executed regardless of return of
  of_property_read_u32_array(). This is not issue after axi_blen is
  initialized to zero, as zero blen values are skipped in
  stmmac_axi_blen_to_mask(), but that would be useless operation.
  Fix it by checking return value of of_property_read_u32_array() and
  parse any legit config.

- In case of failed memory allocation for AXI and error, there is no handling
  of that. Fix it by checking if AXI config is error and return if so,
  as this can only lack of memory. No AXI config, although is probably
  wrong in most cases, is not treated as error, as generic config is mostly
  provided in drivers.

Fixes: afea03656add ("stmmac: rework DMA bus setting and introduce new platform AXI structure")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 9112cd69b9b1..0acc61a98292 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -95,7 +95,7 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct stmmac_axi *axi;
-	u32 axi_blen[AXI_BLEN];
+	u32 axi_blen[AXI_BLEN] = { 0 };
 
 	np = of_parse_phandle(pdev->dev.of_node, "snps,axi-config", 0);
 	if (!np)
@@ -115,8 +115,8 @@ static struct stmmac_axi *stmmac_axi_setup(struct platform_device *pdev)
 		axi->axi_wr_osr_lmt = 1;
 	if (of_property_read_u32(np, "snps,rd_osr_lmt", &axi->axi_rd_osr_lmt))
 		axi->axi_rd_osr_lmt = 1;
-	of_property_read_u32_array(np, "snps,blen", axi_blen, AXI_BLEN);
-	stmmac_axi_blen_to_mask(&axi->axi_blen_regval, axi_blen, AXI_BLEN);
+	if (!of_property_read_u32_array(np, "snps,blen", axi_blen, AXI_BLEN))
+		stmmac_axi_blen_to_mask(&axi->axi_blen_regval, axi_blen, AXI_BLEN);
 	of_node_put(np);
 
 	return axi;
@@ -580,6 +580,10 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	of_property_read_u32(np, "snps,ps-speed", &plat->mac_port_sel_speed);
 
 	plat->axi = stmmac_axi_setup(pdev);
+	if (IS_ERR(plat->axi)) {
+		ret = plat->axi;
+		goto error_put_mdio;
+	}
 
 	rc = stmmac_mtl_setup(pdev, plat);
 	if (rc) {
-- 
2.34.1


