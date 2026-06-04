Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3439CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 02:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ZG6h4uzW09lYQY3KtHrY96snIV1JD3jucaQeYkVHm0=; b=sZpywEPKcH3Bt3dMAngzph74B0
	UCVmv4lfUX/TZpPOZ50C9Q0zTDzcm63qMG1N+NMhl3DZMH+sxeVMvPzJHBarHhhOCCAnKfhoOLuML
	4RjagcQ1ecnmDEUkS8fLbb58JA27+O6eBK6YcaiNrC+K9JcpJiIQrZZVR27cnmdJVrw8HhKjeH451
	SbIGEopr7DSD18PWIjJx/vMKioRVb62u1eymeIdUjoJDP/PZRBjfcdkxK1U95o+UR/LtDf7oyyntN
	usyYIA6S0/ThSs29dopaDMPDh648fpbuGGgjikaN65Ny+A1C1ymiHpb7GfRSoOx0lRZOT379JKohR
	QAPLAGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyBH-0000000G4HT-2Rhe;
	Thu, 04 Jun 2026 02:51:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyBE-0000000G4Gj-0ua5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 02:51:38 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHKtMv6CBq7TqRAA--.9439S2;
	Thu, 04 Jun 2026 10:51:27 +0800 (CST)
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
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] clk: mvebu: ap-cpu: fix missing clk_put() in ap_cpu_clock_probe()
Date: Thu,  4 Jun 2026 02:51:15 +0000
Message-Id: <20260604025115.3763823-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHKtMv6CBq7TqRAA--.9439S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1rGw1DXry7XFWUAr1fZwb_yoW8Jw4fpr
	1UGFZYkr4UXr4UJay7Gan7Wa4rua1kXFW5Ca1vya4v93Z3JFy5Gr18A3yvqF18urW8W3y5
	tF4UJan8uF1DuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUrrWFUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBg0IA2ogubGxKQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_195136_654836_BF561020 
X-CRM114-Status: GOOD (  10.87  )
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

Add the missing clk_put() after the name has been extracted and
before returning on error to fix the leak.

Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clk/mvebu/ap-cpu-clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index 1e44ace7d951..a8175908e353 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -328,9 +328,11 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		ret = devm_clk_hw_register(dev, &ap_cpu_clk[cluster_index].hw);
 		if (ret) {
 			of_node_put(dn);
+			clk_put(parent);
 			return ret;
 		}
 		ap_cpu_data->hws[cluster_index] = &ap_cpu_clk[cluster_index].hw;
+		clk_put(parent);
 	}
 
 	ap_cpu_data->num = cluster_index + 1;
-- 
2.34.1


