Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A291073CBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LqZnsz7wcqTyhp78mNFKi+0Adfefk/BvJL3db1qKzPo=; b=Kb9TpPXkbFSiwFPYebb11ai9fn
	4xawrCVyEqdTDhkR28OpEXEQnHRG8QtC5x1j9EWwS+Vg9GkLUuLqmnpMk6za+Zlv9H79mFVWJkdm6
	hxGhnKcxOqwKVqqrKKTQU2IylTrWZSq5QsWo0HZo4xtKMdEh8+FUVROK+lQqiI7qUGp0s/hUIQbS4
	sBPncJ0+0XWtUcVXGF6a5Xex1eykOUyo2DZtOu4wCqgt1jc8enDhBN0Ci23ZPgkmO6HTxc9p9equC
	MToufnaaG/UUobdgkMsaGufkVkcNaDPqJc5VX2P1mWjF3wGani9NnGuxMN+coNKVZUP1+D9x852mB
	qLEB1KfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATcz-00000008ykd-3cnq;
	Wed, 08 Apr 2026 14:11:33 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATcw-00000008yjr-0tAt;
	Wed, 08 Apr 2026 14:11:32 +0000
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACXKAwLYtZprHbzDA--.2435S2;
	Wed, 08 Apr 2026 22:11:23 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: nfraprado@collabora.com,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Adam Ford <aford173@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] pmdomain: mediatek: fix use-after-free in scpsys_get_bus_protection_legacy()
Date: Wed,  8 Apr 2026 14:11:21 +0000
Message-Id: <20260408141121.386522-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXKAwLYtZprHbzDA--.2435S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1kuF4rZFyxGFyfZFWfAFb_yoW8Zw1fpF
	W5Ka4YvrWUJr18GFW0krW8uayayrykK395Cws7GwsFv3Z8Xr1kGrySva4Yqr9YkrZYkanr
	A3W7tryUA3W8AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW5XwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUPR6wUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwLA2nWHcDczgAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_071130_613624_7474BC22 
X-CRM114-Status: GOOD (  12.56  )
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

In scpsys_get_bus_protection_legacy(), of_find_node_with_property()
returns a device node with its reference count incremented. The function
then calls of_node_put(node) before checking whether
syscon_regmap_lookup_by_phandle() returns an error. If an error occurs,
dev_err_probe() dereferences the node pointer to print diagnostic
information, but the node memory may have already been freed due to the
earlier of_node_put(), leading to a use-after-free vulnerability.

Fix this by moving the of_node_put() call after the error check, ensuring
the node is still valid when accessed in the error path.

Fixes: c29345fa5f66 ("pmdomain: mediatek: Refactor bus protection regmaps retrieval")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index e2800aa1bc59..d3b36f32417c 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -993,6 +993,7 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 	struct device_node *node, *smi_np;
 	int num_regmaps = 0, i, j;
 	struct regmap *regmap[3];
+	int ret = 0;
 
 	/*
 	 * Legacy code retrieves a maximum of three bus protection handles:
@@ -1043,11 +1044,14 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
 	if (node) {
 		regmap[2] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
 		num_regmaps++;
-		of_node_put(node);
-		if (IS_ERR(regmap[2]))
-			return dev_err_probe(dev, PTR_ERR(regmap[2]),
+		if (IS_ERR(regmap[2])) {
+			ret = dev_err_probe(dev, PTR_ERR(regmap[2]),
 					     "%pOF: failed to get infracfg regmap\n",
 					     node);
+			of_node_put(node);
+			return ret;
+		}
+		of_node_put(node);
 	} else {
 		regmap[2] = NULL;
 	}
-- 
2.34.1


