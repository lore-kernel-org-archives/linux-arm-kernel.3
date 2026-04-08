Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD62E10F9951
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uTfYgsa06Ay2axWJBUow1ftnzYOENBYQ2oa1xejaTn8=; b=LBi2RhlQ6MaoTASQLLz0AO92fO
	pIIBIFTUD7Gr1mt86UvuUcbupdqwRh7+gXGamWOuU/Q3yP6DSgFbPKvBZwQPIDq9Gux2c2lJ4SYz6
	dXWT/0GSG2REdbkEIXXK8BBT02eN4XHqflN6+LAsT4LyrQcyxjB+LASKUD1VIMPFutFIKkmGiY2YJ
	bofU+vfXYNj91K1kjdhpbSSLYK023IcEx5yLlkFlzIm2ld13EcU0EwZmBYF5ic1fqyX7MbMwQJYhz
	cNXsqGhWvow+H2G7W4F0yKNv+IwC18pTwaiDikObHfy40tGo5SECyT+JL68tzQgnaB/RE3D5e4g5E
	41zrYGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUrU-000000093f8-38KX;
	Wed, 08 Apr 2026 15:30:36 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAUrQ-000000093eb-3i8v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 15:30:34 +0000
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAntwqVdNZprBT1DA--.63068S2;
	Wed, 08 Apr 2026 23:30:29 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] interconnect: imx: fix use-after-free in imx_icc_node_init_qos()
Date: Wed,  8 Apr 2026 15:30:22 +0000
Message-Id: <20260408153022.401123-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAAntwqVdNZprBT1DA--.63068S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur45WFyUuw4UuFWUXry5Jwb_yoW8Zw1fpF
	W5GFWakry7WF4Ig3yvyw1q9Fyay342krZYgrW8G39Ig3s5tryrXry0y34rC3WrGryxAryF
	yrWUtw1j9a15CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW5WwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3HUDUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkLA2nWbuALQwAAs-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_083033_290976_457BB1E9 
X-CRM114-Status: GOOD (  11.54  )
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

The function imx_icc_node_init_qos() manually manages the reference count
of struct device_node *dn using of_node_put(). However, some error paths
use dn after the put, leading to use-after-free. Convert to automatic
cleanup using __free(device_node) to ensure the reference is always
released when dn goes out of scope.

Fixes: f0d8048525d7 ("interconnect: Add imx core driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Use auto cheanup to fix the problem.
---
 drivers/interconnect/imx/imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/interconnect/imx/imx.c b/drivers/interconnect/imx/imx.c
index 9511f80cf041..e5fcdcb88cfb 100644
--- a/drivers/interconnect/imx/imx.c
+++ b/drivers/interconnect/imx/imx.c
@@ -120,7 +120,8 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
 	struct imx_icc_node *node_data = node->data;
 	const struct imx_icc_node_adj_desc *adj = node_data->desc->adj;
 	struct device *dev = provider->dev;
-	struct device_node *dn = NULL;
+	struct device_node *__free(device_nod) dn = of_parse_phandle(dev->of_node,
+			adj->phandle_name, 0);
 	struct platform_device *pdev;
 
 	if (adj->main_noc) {
@@ -128,7 +129,6 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
 		dev_dbg(dev, "icc node %s[%d] is main noc itself\n",
 			node->name, node->id);
 	} else {
-		dn = of_parse_phandle(dev->of_node, adj->phandle_name, 0);
 		if (!dn) {
 			dev_warn(dev, "Failed to parse %s\n",
 				 adj->phandle_name);
@@ -138,12 +138,10 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
 		if (!of_device_is_available(dn)) {
 			dev_warn(dev, "Missing property %s, skip scaling %s\n",
 				 adj->phandle_name, node->name);
-			of_node_put(dn);
 			return 0;
 		}
 
 		pdev = of_find_device_by_node(dn);
-		of_node_put(dn);
 		if (!pdev) {
 			dev_warn(dev, "node %s[%d] missing device for %pOF\n",
 				 node->name, node->id, dn);
-- 
2.34.1


