Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30213CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 01:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DqR9DFPxLnepnx8hffUYkDuE30dHp2WUQGaD6wF2OA=; b=ZdbajWFx4Q7Blu5WyONi/LGhTD
	b7XAk8XmjrAPtlcPrWIpeSdivZRNpnm/cnXRnbbR6bJ8fXHPvQneiT7/UEdiYaGUT738PYeHdZYJY
	D8XTF3S6fhG59NTnTUyUgBssrO5okou5Qlvf29MPSAQHXUSJE82l1CvS+Ol3s0c5ZUI+G8N3E0zjL
	97r1Bvqp+S2QsgluSXZiT38SOuldNkKcSDNHzwpBIamdz9jv0+U1dNGqJq9FmWiduFZ1+ELRxDh2p
	XfsC6ppV7UzhmsaCu+PfxKaAJVkGUcXWvcLmOfNolJaOTTmiKpZ9Z0sQduGYwaqRgVJY2eMXPLVnQ
	U1Kp46bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfHm-0000000GSom-1qFY;
	Wed, 17 Jun 2026 01:41:46 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfHe-0000000GSoJ-3LZW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 01:41:45 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3mtNK+zFqFtz9AQ--.29079S2;
	Wed, 17 Jun 2026 09:41:30 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v3] clk: mvebu: ap-cpu: fix missing clk_put() in ap_cpu_clock_probe()
Date: Wed, 17 Jun 2026 01:41:26 +0000
Message-Id: <20260617014126.1716291-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3mtNK+zFqFtz9AQ--.29079S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWrKr1rWFW8Xw1xWr13twb_yoW5Gw13pF
	18GFyFkw47Gr4j9ay7tF4DuFyrWwn7tFy5Cw40yasak3Z3JFyUJr10ka95ZF1UurW8X34a
	qF4UJ3WUuF1UZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ec7CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxV
	W8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E
	6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU9o7NUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcBA2ox7QI3QAAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_184139_360784_DF75FB34 
X-CRM114-Status: GOOD (  13.28  )
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

The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
reference to the parent clock for each CPU cluster, but it never
releases it with clk_put().  The returned clk is used only to read
the parent's name via __clk_get_name(), and the reference is leaked
on every successful cluster initialization as well as on the error
path when devm_clk_hw_register() fails.

Rather than adding clk_put() calls, replace the of_clk_get() +
__clk_get_name() pattern with of_clk_get_parent_name(), which is
the intended API for this use case and handles the reference
counting internally.  This matches the pattern already used by the
sibling drivers clk-cpu.c and clk-corediv.c.

Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v3: Replace incorrect Fixes tag.
v2: Replace of_clk_get() + __clk_get_name() with of_clk_get_parent_name()
    as suggested by Brian Masney, instead of adding clk_put() calls.
    Also correct the Fixes: tag to point to the original commit that
    introduced the leak.
---
 drivers/clk/mvebu/ap-cpu-clk.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index a8175908e353..1cf63c7a0bc3 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -288,7 +288,6 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		char *clk_name = "cpu-cluster-0";
 		struct clk_init_data init;
 		const char *parent_name;
-		struct clk *parent;
 		u64 cpu;
 
 		cpu = of_get_cpu_hwid(dn, 0);
@@ -304,13 +303,12 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		if (ap_cpu_data->hws[cluster_index])
 			continue;
 
-		parent = of_clk_get(np, cluster_index);
-		if (IS_ERR(parent)) {
-			dev_err(dev, "Could not get the clock parent\n");
+		parent_name = of_clk_get_parent_name(np, cluster_index);
+		if (!parent_name) {
+			dev_err(dev, "Could not get the clock parent name\n");
 			of_node_put(dn);
 			return -EINVAL;
 		}
-		parent_name =  __clk_get_name(parent);
 		clk_name[12] += cluster_index;
 		ap_cpu_clk[cluster_index].clk_name =
 			ap_cp_unique_name(dev, np->parent, clk_name);
@@ -328,11 +326,9 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		ret = devm_clk_hw_register(dev, &ap_cpu_clk[cluster_index].hw);
 		if (ret) {
 			of_node_put(dn);
-			clk_put(parent);
 			return ret;
 		}
 		ap_cpu_data->hws[cluster_index] = &ap_cpu_clk[cluster_index].hw;
-		clk_put(parent);
 	}
 
 	ap_cpu_data->num = cluster_index + 1;
-- 
2.34.1


