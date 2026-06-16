Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858FDCD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+A4mUvJbAxqYGqhR2zz9wk5RNSEo4OH7kiEDPeIKYLU=; b=AIp+dz+hIReTRT7Hm/lDVe7ly5
	5g0atUHPLDpJmMRgCWIyVW5NyatfI+9bU9N8rmvhhWVHuh5AOv0uTelJJ2ZLOCfc3W8yZEY240p9h
	hQP2sdlY0tLfcL8oB0i7EqeFjd8gA3iGLaDDAQy7x7ZEh0N046JYjv0HC/JWottU12zj7PmOUM2bU
	bXxAALA6btCvQ3x+C9aoqlwTQJtlGLlpAsQ5hpu+Mki/XgX2D8L0ZOOI+V0Hxodv8GZ7jdxGPX8c0
	URF8JAmw+fvrcbRbGcd0L0BDfYwzTD4NFdZCTMzNToPxRfiX6rml8P/cZ+/QTzcFtX4eQXpyZfRcE
	9rc8i9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSvu-0000000FlID-2FZw;
	Tue, 16 Jun 2026 12:30:22 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSvq-0000000FlH6-2lV9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 12:30:21 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADXYQXRQTFqayHBEw--.14646S2;
	Tue, 16 Jun 2026 20:30:10 +0800 (CST)
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
Subject: [PATCH v2] clk: mvebu: ap-cpu: fix missing clk_put() in ap_cpu_clock_probe()
Date: Tue, 16 Jun 2026 12:29:36 +0000
Message-Id: <20260616122936.1669366-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADXYQXRQTFqayHBEw--.14646S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWrKr1rWFW8Xw1xWF1ftFb_yoW5GFW8pF
	18GF9Ykw47GrWj9ay7tF4DuryrWw1xtFy5Aw40yasak3Z3JF1UGr10ka95ZF1UurW8X34a
	qF4UG3WUuF1DZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JjjLvNUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwAA2oxFfyguwAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_053019_299013_9E854307 
X-CRM114-Status: GOOD (  13.59  )
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

Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
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


