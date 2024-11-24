Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCAFE668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QbMlQ9Alz2tmukooueJ3+QvxhXkeOb20m5whwSPsBE=; b=uUlEVAE7qPre+Aefb7eKbRJk/5
	ZPu+pHgfeApa1AT42cSmeT9UY1vZTXZit1JBCOy/LGKRHhUQ4hE3sfeA/jgebknANDRjNTaRi+zvf
	mpSz5r1IMzCNf/cY/Joa9n6iCtGyoDNOveRIVuUcvaCTiWn4EdhiaH1cwlEHKE/JAVEwJeidTtmRe
	1pWtpF4vWIz6FZKse3RmAslHw7qVEvSYIEapPodC8IIDGl7w0QfBiTjo7ywOyfb9baLTUJkVRMmdV
	tu91+LmPNky700ShfPBoI74bk/OnZRI/51tW8GsWWhNp3du1olKLxLX7S8ZEvoq4T/w07JM0ecUTy
	wTCkSO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC9c-00000005oA4-1YfZ;
	Sun, 24 Nov 2024 12:55:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC4M-00000005mdj-2zDc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0E5F5C5658;
	Sun, 24 Nov 2024 12:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BEBC4CED1;
	Sun, 24 Nov 2024 12:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452630;
	bh=wFEfmeTrQKkQ5fyvgPDxY6pRcnx986Z4n6OcWaXZVnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pnzvoY0rQNJeRan/Ul+pl9KPhUzI16iZh92TjmBJm9V1r4ARb40zO7xo6928awwlU
	 GlyTR2srSma4LipZxEsp6qH37uOLakHa/Vm8jKU6Xuw81ukGVZ4yA7Tu7oXcFzg33Z
	 YUwnwOzhMp3qslhY9fNtlvFcbGErTIOhBqv9Ebhit+/EG4WtX+CrC+rdJoEsbEOGC9
	 rYE2MP0PjQoVJ+kXw+v2h9B9oIh7SUvdgWHDGGCnBYcFlqbH7jW7s7TZlpRlU9NWgR
	 q4VfoNYFc/bw+5zSgLUyH3fmIBC+xEpiEPtaoSKXHXTF5zW0Mz8nZkBdP1HUkhExv7
	 6tXM4Bpk07uvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	quic_jjohnson@quicinc.com,
	neil.armstrong@linaro.org,
	arnd@arndb.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 17/23] soc: imx8m: Probe the SoC driver as platform driver
Date: Sun, 24 Nov 2024 07:48:28 -0500
Message-ID: <20241124124919.3338752-17-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124919.3338752-1-sashal@kernel.org>
References: <20241124124919.3338752-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_045030_843799_7A989BD7 
X-CRM114-Status: GOOD (  22.41  )
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

From: Marek Vasut <marex@denx.de>

[ Upstream commit 9cc832d37799dbea950c4c8a34721b02b8b5a8ff ]

With driver_async_probe=* on kernel command line, the following trace is
produced because on i.MX8M Plus hardware because the soc-imx8m.c driver
calls of_clk_get_by_name() which returns -EPROBE_DEFER because the clock
driver is not yet probed. This was not detected during regular testing
without driver_async_probe.

Convert the SoC code to platform driver and instantiate a platform device
in its current device_initcall() to probe the platform driver. Rework
.soc_revision callback to always return valid error code and return SoC
revision via parameter. This way, if anything in the .soc_revision callback
return -EPROBE_DEFER, it gets propagated to .probe and the .probe will get
retried later.

"
------------[ cut here ]------------
WARNING: CPU: 1 PID: 1 at drivers/soc/imx/soc-imx8m.c:115 imx8mm_soc_revision+0xdc/0x180
CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-next-20240924-00002-g2062bb554dea #603
Hardware name: DH electronics i.MX8M Plus DHCOM Premium Developer Kit (3) (DT)
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : imx8mm_soc_revision+0xdc/0x180
lr : imx8mm_soc_revision+0xd0/0x180
sp : ffff8000821fbcc0
x29: ffff8000821fbce0 x28: 0000000000000000 x27: ffff800081810120
x26: ffff8000818a9970 x25: 0000000000000006 x24: 0000000000824311
x23: ffff8000817f42c8 x22: ffff0000df8be210 x21: fffffffffffffdfb
x20: ffff800082780000 x19: 0000000000000001 x18: ffffffffffffffff
x17: ffff800081fff418 x16: ffff8000823e1000 x15: ffff0000c03b65e8
x14: ffff0000c00051b0 x13: ffff800082790000 x12: 0000000000000801
x11: ffff80008278ffff x10: ffff80008209d3a6 x9 : ffff80008062e95c
x8 : ffff8000821fb9a0 x7 : 0000000000000000 x6 : 00000000000080e3
x5 : ffff0000df8c03d8 x4 : 0000000000000000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : fffffffffffffdfb x0 : fffffffffffffdfb
Call trace:
 imx8mm_soc_revision+0xdc/0x180
 imx8_soc_init+0xb0/0x1e0
 do_one_initcall+0x94/0x1a8
 kernel_init_freeable+0x240/0x2a8
 kernel_init+0x28/0x140
 ret_from_fork+0x10/0x20
---[ end trace 0000000000000000 ]---
SoC: i.MX8MP revision 1.1
"

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/imx/soc-imx8m.c | 107 ++++++++++++++++++++++++++++--------
 1 file changed, 85 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index fe111bae38c8e..5ea8887828c06 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -30,7 +30,7 @@
 
 struct imx8_soc_data {
 	char *name;
-	u32 (*soc_revision)(void);
+	int (*soc_revision)(u32 *socrev);
 };
 
 static u64 soc_uid;
@@ -51,24 +51,29 @@ static u32 imx8mq_soc_revision_from_atf(void)
 static inline u32 imx8mq_soc_revision_from_atf(void) { return 0; };
 #endif
 
-static u32 __init imx8mq_soc_revision(void)
+static int imx8mq_soc_revision(u32 *socrev)
 {
 	struct device_node *np;
 	void __iomem *ocotp_base;
 	u32 magic;
 	u32 rev;
 	struct clk *clk;
+	int ret;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mq-ocotp");
 	if (!np)
-		return 0;
+		return -EINVAL;
 
 	ocotp_base = of_iomap(np, 0);
-	WARN_ON(!ocotp_base);
+	if (!ocotp_base) {
+		ret = -EINVAL;
+		goto err_iomap;
+	}
+
 	clk = of_clk_get_by_name(np, NULL);
 	if (IS_ERR(clk)) {
-		WARN_ON(IS_ERR(clk));
-		return 0;
+		ret = PTR_ERR(clk);
+		goto err_clk;
 	}
 
 	clk_prepare_enable(clk);
@@ -88,32 +93,45 @@ static u32 __init imx8mq_soc_revision(void)
 	soc_uid <<= 32;
 	soc_uid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW);
 
+	*socrev = rev;
+
 	clk_disable_unprepare(clk);
 	clk_put(clk);
 	iounmap(ocotp_base);
 	of_node_put(np);
 
-	return rev;
+	return 0;
+
+err_clk:
+	iounmap(ocotp_base);
+err_iomap:
+	of_node_put(np);
+	return ret;
 }
 
-static void __init imx8mm_soc_uid(void)
+static int imx8mm_soc_uid(void)
 {
 	void __iomem *ocotp_base;
 	struct device_node *np;
 	struct clk *clk;
+	int ret = 0;
 	u32 offset = of_machine_is_compatible("fsl,imx8mp") ?
 		     IMX8MP_OCOTP_UID_OFFSET : 0;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mm-ocotp");
 	if (!np)
-		return;
+		return -EINVAL;
 
 	ocotp_base = of_iomap(np, 0);
-	WARN_ON(!ocotp_base);
+	if (!ocotp_base) {
+		ret = -EINVAL;
+		goto err_iomap;
+	}
+
 	clk = of_clk_get_by_name(np, NULL);
 	if (IS_ERR(clk)) {
-		WARN_ON(IS_ERR(clk));
-		return;
+		ret = PTR_ERR(clk);
+		goto err_clk;
 	}
 
 	clk_prepare_enable(clk);
@@ -124,31 +142,41 @@ static void __init imx8mm_soc_uid(void)
 
 	clk_disable_unprepare(clk);
 	clk_put(clk);
+
+err_clk:
 	iounmap(ocotp_base);
+err_iomap:
 	of_node_put(np);
+
+	return ret;
 }
 
-static u32 __init imx8mm_soc_revision(void)
+static int imx8mm_soc_revision(u32 *socrev)
 {
 	struct device_node *np;
 	void __iomem *anatop_base;
-	u32 rev;
+	int ret;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mm-anatop");
 	if (!np)
-		return 0;
+		return -EINVAL;
 
 	anatop_base = of_iomap(np, 0);
-	WARN_ON(!anatop_base);
+	if (!anatop_base) {
+		ret = -EINVAL;
+		goto err_iomap;
+	}
 
-	rev = readl_relaxed(anatop_base + ANADIG_DIGPROG_IMX8MM);
+	*socrev = readl_relaxed(anatop_base + ANADIG_DIGPROG_IMX8MM);
 
 	iounmap(anatop_base);
 	of_node_put(np);
 
-	imx8mm_soc_uid();
+	return imx8mm_soc_uid();
 
-	return rev;
+err_iomap:
+	of_node_put(np);
+	return ret;
 }
 
 static const struct imx8_soc_data imx8mq_soc_data = {
@@ -184,7 +212,7 @@ static __maybe_unused const struct of_device_id imx8_soc_match[] = {
 	kasprintf(GFP_KERNEL, "%d.%d", (soc_rev >> 4) & 0xf,  soc_rev & 0xf) : \
 	"unknown"
 
-static int __init imx8_soc_init(void)
+static int imx8m_soc_probe(struct platform_device *pdev)
 {
 	struct soc_device_attribute *soc_dev_attr;
 	struct soc_device *soc_dev;
@@ -212,8 +240,11 @@ static int __init imx8_soc_init(void)
 	data = id->data;
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
-		if (data->soc_revision)
-			soc_rev = data->soc_revision();
+		if (data->soc_revision) {
+			ret = data->soc_revision(&soc_rev);
+			if (ret)
+				goto free_soc;
+		}
 	}
 
 	soc_dev_attr->revision = imx8_revision(soc_rev);
@@ -251,6 +282,38 @@ static int __init imx8_soc_init(void)
 	kfree(soc_dev_attr);
 	return ret;
 }
+
+static struct platform_driver imx8m_soc_driver = {
+	.probe = imx8m_soc_probe,
+	.driver = {
+		.name = "imx8m-soc",
+	},
+};
+
+static int __init imx8_soc_init(void)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	/* No match means this is non-i.MX8M hardware, do nothing. */
+	if (!of_match_node(imx8_soc_match, of_root))
+		return 0;
+
+	ret = platform_driver_register(&imx8m_soc_driver);
+	if (ret) {
+		pr_err("Failed to register imx8m-soc platform driver: %d\n", ret);
+		return ret;
+	}
+
+	pdev = platform_device_register_simple("imx8m-soc", -1, NULL, 0);
+	if (IS_ERR(pdev)) {
+		pr_err("Failed to register imx8m-soc platform device: %ld\n", PTR_ERR(pdev));
+		platform_driver_unregister(&imx8m_soc_driver);
+		return PTR_ERR(pdev);
+	}
+
+	return 0;
+}
 device_initcall(imx8_soc_init);
 MODULE_DESCRIPTION("NXP i.MX8M SoC driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


