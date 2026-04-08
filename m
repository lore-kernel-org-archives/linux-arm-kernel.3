Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5DC105D996
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 03:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J1rio4jcyJvEolnEjcPFOLE3Y0pgPcfNLeZtqm1Y2uY=; b=cbP9hEg/vaMTrZkPKz645nI4yl
	pXQtJ9wFx4tusk3AtD1sHIPmv1Ew2XAQBO4o8FbSRnpv30DEWnlVdOiOQqEbzLUbYU2EYfsaQSTLh
	uKXRo01FuvwFLXvn82jtnlQx5SzrY0H1pRV4IfRglTvdYi/VE2FJrrCHZmte/LJWtHxA7TFN1LmHj
	caAVKJ1p1KETogmNMeDUjEbTjtu/HZcrJCWPRz7ELr+cpgVWwLy63BpqpMlYAVqrQgLBurL0yrBxJ
	5dxVoXi4xFF/IPJ6hv62OqAVal3v5xHSTp0SpoVzxzBYppVz90vnmrYaWaSNLmmSUIpfUFENuMTgW
	M2Nyu6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJJc-00000008B8G-3CCx;
	Wed, 08 Apr 2026 03:10:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAJJZ-00000008B7q-0Xij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 03:10:51 +0000
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACXQm4yx9Vp3iqWDA--.31904S2;
	Wed, 08 Apr 2026 11:10:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] interconnect: imx: fix use-after-free in imx_icc_node_init_qos()
Date: Wed,  8 Apr 2026 03:10:04 +0000
Message-Id: <20260408031004.309483-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXQm4yx9Vp3iqWDA--.31904S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1UZr4rGr18Cw4kWrW8tFb_yoWkJwc_uF
	18uFZrXF48CF40gwsIyr1fZFyqyw1I9ws3ZF1jqF93t34qvrsxXrsIqw4DZ3y8Xr4Ut34U
	Grn0vFn8Zry7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-a9-UUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwLA2nVmXqrYwAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_201049_567213_38600B81 
X-CRM114-Status: UNSURE (   8.66  )
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

Move of_node_put(dn) after the last use of dn, and add a missing put
in the error path to avoid both use-after-free and reference leak.

Fixes: f0d8048525d7 ("interconnect: Add imx core driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/interconnect/imx/imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/interconnect/imx/imx.c b/drivers/interconnect/imx/imx.c
index 9511f80cf041..75431b5ccef8 100644
--- a/drivers/interconnect/imx/imx.c
+++ b/drivers/interconnect/imx/imx.c
@@ -143,15 +143,16 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
 		}
 
 		pdev = of_find_device_by_node(dn);
-		of_node_put(dn);
 		if (!pdev) {
 			dev_warn(dev, "node %s[%d] missing device for %pOF\n",
 				 node->name, node->id, dn);
+			of_node_put(dn);
 			return -EPROBE_DEFER;
 		}
 		node_data->qos_dev = &pdev->dev;
 		dev_dbg(dev, "node %s[%d] has device node %pOF\n",
 			node->name, node->id, dn);
+		of_node_put(dn);
 	}
 
 	return dev_pm_qos_add_request(node_data->qos_dev,
-- 
2.34.1


