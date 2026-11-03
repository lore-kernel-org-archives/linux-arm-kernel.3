Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA52606EE80
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mVKagHC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xWha5x+sclOSUOwxcjH9Fy7xQDjuXfr0A01pOAbZ1wc=; b=mVKagHC9tBSEtG3t5KeMkgcq8V
	C6XR/zdpGZ/IJkM36ynK6zPfFlg/t+KKaQl2eXKy2d533d3CLxUveHMNoXS++Q0SIHFhicvfp7wOB
	RsnJ7T/NixUuG/g6LaRT5s4VgLB8M3OVTN3Z7LfC8sj+az1dRNS169sVZSap5aGc24oCrdyITcLrh
	dTKLZCn2jzKAL3zlOWWxa8H2Em+7CkFtzl1IIR1PWxHFzO2g6siEN3NASf1eGNFCZeJXrJENdQZSn
	SyWav1th/WY8dW8pzcPsFhIheIz7RpT7eo5d/RfmOpOhN4wuFNkFC3qPNcDib7FTY50rTWUUQeOt7
	7IOk3SwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBOK-00000001sIS-07g5;
	Tue, 03 Nov 2026 10:05:20 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBOH-00000001sHN-2Up9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:05:19 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADH15jYselqC3s7AA--.5349S2;
	Tue, 03 Nov 2026 18:05:12 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Michal Simek <michal.simek@amd.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mmc: sdhci-of-arasan: Unregister all clock providers
Date: Tue,  3 Nov 2026 10:05:21 +0000
Message-Id: <20261103100521.1309763-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADH15jYselqC3s7AA--.5349S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF1UuF13Gry5Zw4xCrW8Crg_yoW8Aw17pa
	y5WFW5Ka4qyF4rurZ5tw4Uua4Yy34FyFW2vFW7KwsYq34Ygry8Cr12vFyjqFWDXry8C3Wa
	qr1DZr48Cr4UA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4U
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VU1K9aJ
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUAA2rpnIBhxwABsn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_020518_010614_3A308016 
X-CRM114-Status: GOOD (  12.29  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When #clock-cells is non-zero, sdhci_arasan_register_sdclk() registers
two clock providers for the same device node: one for the card clock and
one for the sample clock.  of_clk_add_provider() takes a reference to
the device node for each registration, but the unregister helper only
calls of_clk_del_provider() once.  The second device node reference is
therefore leaked and the sample clock provider remains registered after
the driver has been unbound.

Drop one provider for every clock that was registered.

Fixes: 07a14d1df454 ("mmc: sdhci-of-arasan: Add sampling clock for a phy to use")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mmc/host/sdhci-of-arasan.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 0ee22923ad56..dccd2980fdd6 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -1648,11 +1648,20 @@ sdhci_arasan_register_sampleclk(struct sdhci_arasan_data *sdhci_arasan,
 static void sdhci_arasan_unregister_sdclk(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
+	u32 num_clks = 0;
 
-	if (!of_property_present(np, "#clock-cells"))
+	if (of_property_read_u32(np, "#clock-cells", &num_clks) < 0)
 		return;
 
-	of_clk_del_provider(dev->of_node);
+	of_clk_del_provider(np);
+
+	/*
+	 * sdhci_arasan_register_sdclk() registers a second provider for the
+	 * sample clock when #clock-cells is non-zero, and each provider holds
+	 * its own reference to the device node.
+	 */
+	if (num_clks)
+		of_clk_del_provider(np);
 }
 
 /**
-- 
2.34.1


