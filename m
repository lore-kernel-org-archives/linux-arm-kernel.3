Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2397CC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f79L+DiN/kVWvLcPhWJdWE0/iBdlzpiqIiCbIRhBLEs=; b=b1uKDSBvQYBq4X1SCwO8LNvafh
	ypf/z8mUy3eIlZCoaPpcM/Q/XbiAEriFtrNiJjIAvVGyT/CPcd/SC4m+y385pRSZV/b9qNQ30BkdO
	KyiRQm6wlpJqmtlSs8S7GOkch/0RoOe5oVCHw5xkdJ/SJR2EHQlUIQBiY/tSRmXTI9nAaUX2mom7n
	6PhTp9EkTwhnTBCHHWzg8BcWs9ORfegjsqTpkNaR4mlyiVsOVfxxZkxdM9aERwDBYLePOPQquTX74
	9iC+hhYzNBai9I4RKKFUtaZCXOrErdzVW8PpHI3JKlbnGd8V72iXZQvEFSaqw5sLp6Guu7FO2LqiY
	PQUaQSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NAh-00000005PPi-3r9N;
	Tue, 15 Sep 2026 07:01:39 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NAd-00000005PPH-3rDC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:01:38 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABnaTdL7ahq9KLIBw--.59459S2;
	Tue, 15 Sep 2026 15:01:31 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: bmasney@redhat.com
Cc: linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] clk: versatile: clk-icst: Fix node reference leak in of_syscon_icst_setup()
Date: Tue, 15 Sep 2026 07:01:03 +0000
Message-Id: <20260915070103.1733176-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABnaTdL7ahq9KLIBw--.59459S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1xKF1fAFy5Aw43ZryfXrb_yoW8Wr43pr
	ZF9rZ0yr48Kr1Ut3y8trWDuFyFvan7GFWrCa4xKan7ZrZ5JFy5JrWUWa4UuF4UAF95uayr
	tr4qk3yxZr4UJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VU11rW7
	UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRULA2qowd2jhwAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_000136_330147_3DF81B0E 
X-CRM114-Status: UNSURE (   8.89  )
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

of_get_parent() takes a reference on the syscon parent node. The
reference is intentionally kept on the success path, but the error paths
return without dropping it, leaking the node reference. Release the
reference before returning on the error paths.

Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clk/versatile/clk-icst.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 6bd3db54dd22..8c84377f3ec1 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -516,16 +516,19 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 	map = syscon_node_to_regmap(parent);
 	if (IS_ERR(map)) {
 		pr_err("no regmap for syscon ICST clock parent\n");
+		of_node_put(parent);
 		return;
 	}
 
 	if (of_property_read_u32(np, "reg", &icst_desc.vco_offset) &&
 	    of_property_read_u32(np, "vco-offset", &icst_desc.vco_offset)) {
 		pr_err("no VCO register offset for ICST clock\n");
+		of_node_put(parent);
 		return;
 	}
 	if (of_property_read_u32(np, "lock-offset", &icst_desc.lock_offset)) {
 		pr_err("no lock register offset for ICST clock\n");
+		of_node_put(parent);
 		return;
 	}
 
@@ -552,6 +555,7 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 		ctype = ICST_INTEGRATOR_CP_CM_MEM;
 	} else {
 		pr_err("unknown ICST clock %pOF\n", np);
+		of_node_put(parent);
 		return;
 	}
 
-- 
2.34.1


