Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8EEE7AD44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNfdrS+biCdncifQkWg/99TWg0VOonW54vqEzYwxc7k=; b=00n3smuhanRjNV2Gu4M0UjRIsc
	i2OFvFe6GJoKJIgVhg1D7Bdv5K7wTUI03sCCOltcJFPM8ap09rBvMNcf60Seu8U0JjAu3MGbfGUHx
	ERYXRw/BN9zagjENXSXDZ4Qr2yyDth+ttiZoZ1xo/ifeKliIKhmCE5E/wGkLtOYbMD9ZBoiBoq+k6
	5o+NQPyn93nsVc+5eTEsP1nNPvIvJA+6GRyAVwdAjIj6bcmmGGrsvrYq13VIWOVuKyTmd2PJBBE9L
	O80+RJ7RDv9Edw6Ycfry6+UIwB9X5gtGIjkbDGAUCPX4t0utUbV8dHNPvwqRN5+22HsQqrP61OLMl
	PatfFlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYmP1-00000000Tf4-0RvI;
	Thu, 25 Dec 2025 14:33:20 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYmOw-00000000Tds-2TeY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 14:33:17 +0000
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAAXMNciS01pfPn4AQ--.15897S2;
	Thu, 25 Dec 2025 22:33:06 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: nm@ti.com,
	ssantosh@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] soc: ti: pruss: fix double free in pruss_clk_mux_setup()
Date: Thu, 25 Dec 2025 14:32:56 +0000
Message-Id: <20251225143256.2363630-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAXMNciS01pfPn4AQ--.15897S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4DtryrJF48Zr48JFy7Wrg_yoWkWrgEgr
	4rWFW3Xw4UGF47Gry7Jr48Zrna93ZF9F1xCan2vFy3AFyDArn8tF45ZFnrCr9rZrW8Ga47
	Gw1kZ3W8try7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26F8l6FkdMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1lc2xSY4AK67AK6ry5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
	uYvjfUUYFADUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsHA2lM61TPgQAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_063315_068763_80C22CA1 
X-CRM114-Status: UNSURE (   9.50  )
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

In the pruss_clk_mux_setup(), the devm_add_action_or_reset() indirectly
calls pruss_of_free_clk_provider(), which calls of_node_put(clk_mux_np)
on the error path. However, after the devm_add_action_or_reset()
returns, the of_node_put(clk_mux_np) is called again, causing a double
free.

Fix by using a separate label to avoid the duplicate of_node_put().

Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/soc/ti/pruss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index d7634bf5413a..c16d96bebe3f 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -368,13 +368,14 @@ static int pruss_clk_mux_setup(struct pruss *pruss, struct clk *clk_mux,
 				       clk_mux_np);
 	if (ret) {
 		dev_err(dev, "failed to add clkmux free action %d", ret);
-		goto put_clk_mux_np;
+		goto ret_error;
 	}
 
 	return 0;
 
 put_clk_mux_np:
 	of_node_put(clk_mux_np);
+ret_error:
 	return ret;
 }
 
-- 
2.34.1


