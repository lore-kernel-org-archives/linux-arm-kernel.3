Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65344606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PiQ3Gz8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XOEYJGmIGDL8E6PA4Nkpk9qtz9s8zhGdrWi/akM3QSI=; b=PiQ3Gz8Piz0OOblH7kfG/72eDL
	jscBY6lIL1ZJZtlJfFpFUjLpI67+oW6uakhNr/jXEOTR3OikM29xb5g7HvSkjpRHVrwEi09uCyx5m
	ppR9c9j38bSiO81aAhwYZ9iB0MJ2HC1kdxgaGOzk97b1pumhlcRBAndDnCOc67uI6T6tqsRnBx2Sa
	0sul3/sLy2JKAwpDC4gAV4EThysFUHIe9NGVbU736e6YnPuSkuokFNdRFd5LAg2Hrr9meccnhlWbW
	sznBmAgkm+2zv56B1Vo2fLovTWUklrTBHLlDuxmjij7WwTvUJS4KJcHy6NfGWj7XV6b8D0MawcG6f
	NmlSnMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOATj-00000001gxz-0Zja;
	Tue, 03 Nov 2026 09:06:51 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOATf-00000001gwO-13Ov
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:06:49 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHGJkkpOlq2+k6AA--.1851S2;
	Tue, 03 Nov 2026 17:06:44 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Release clocks if enabling the bus clock fails
Date: Tue,  3 Nov 2026 09:06:53 +0000
Message-Id: <20261103090653.1208652-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHGJkkpOlq2+k6AA--.1851S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr48Zry8Aw1DCF1DJr43ZFb_yoW8WF1kpF
	Z7JFZ3AFy5Xw1vq34Ut3W5ZF90y3WfJFy7urZxC34rZwn8ta9rA348Ca4UZFWqyFWIyay5
	Zry8tFZ7AFWYvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr1j6rxdMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU8jQ6JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwAAA2rpnO4nhgAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_010647_680852_9EF6A965 
X-CRM114-Status: GOOD (  11.04  )
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

fimc_clk_get() acquires and prepares all of the FIMC clocks.  If the
subsequent clk_set_rate() or clk_enable() call on the bus clock fails,
fimc_probe() returns immediately without calling fimc_clk_put(), leaking
the clock references and leaving the clocks prepared.

Jump to a common cleanup label that releases the clocks on both failures.

Fixes: b71b56b264ae ("[media] s5p-fimc: Check return value of clk_enable/clk_set_rate")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/platform/samsung/exynos4-is/fimc-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index 57e573949e54..b36812ad25c0 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -977,11 +977,11 @@ static int fimc_probe(struct platform_device *pdev)
 
 	ret = clk_set_rate(fimc->clock[CLK_BUS], lclk_freq);
 	if (ret < 0)
-		return ret;
+		goto err_clk_put;
 
 	ret = clk_enable(fimc->clock[CLK_BUS]);
 	if (ret < 0)
-		return ret;
+		goto err_clk_put;
 
 	ret = devm_request_irq(dev, irq, fimc_irq_handler,
 			       0, dev_name(dev), fimc);
@@ -1012,6 +1012,7 @@ static int fimc_probe(struct platform_device *pdev)
 	fimc_unregister_capture_subdev(fimc);
 err_sclk:
 	clk_disable(fimc->clock[CLK_BUS]);
+err_clk_put:
 	fimc_clk_put(fimc);
 	return ret;
 }
-- 
2.34.1


