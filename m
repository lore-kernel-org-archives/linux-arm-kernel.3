Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E2CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oku1OsFTkz/V1UUP2hTCl6tDvJbosCQPUl1pAbVqUMk=; b=18WoHURZpo2kG4p9xAYt53u6jJ
	FT849zNLz01g8TWpiRpp0ErgTWUBgfiIAse1F10t0Uui+lJ9D3bgmIBD+WBPcxm7sr18lVwPIiKeL
	Tj4a9I7Cdpj19/JgQNyzyQHvIZB5rKM7mT04o/pBoJ/tJKBPPlMv7uuHGVUl44LVIc7b9tC1RQCHi
	nWLXXtUaLcfhXiB739y0v2y0zB4rIHMCb7tIsyp04usdTy5vozDYlzOtZa1Cho+HWyvGfcQpQ/BTY
	mnn0Zc3gZHRgQLdOCwyNdBU+77tw9y9Td1ppPA9Be8pY1jVDeRx/AeDANsp+dOgxZnZd+D6WuRhCZ
	56D0ZyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M23-00000005Iow-3Y1K;
	Tue, 15 Sep 2026 05:48:39 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M20-00000005ImC-0Dx5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 05:48:38 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnu+8x3Khq2iAKCA--.40502S2;
	Tue, 15 Sep 2026 13:48:33 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: daniel.lezcano@kernel.org
Cc: lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patrice.chotard@foss.st.com,
	tglx@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] clocksource/drivers/st_lpc: Fix clock reference leaks
Date: Tue, 15 Sep 2026 05:48:04 +0000
Message-Id: <20260915054804.1729741-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADnu+8x3Khq2iAKCA--.40502S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rKrW3uw45tw18CFWkCrg_yoW8JF4kpr
	1kKw4rAr1Uu3yIgrs0qrWvyr9Y9ayqkFy3G3y3K3ZrZr45GFW5uayfXayIvF4DArWxCw47
	t3W5AFZ5ZF1DuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmeH
	gUUUUU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAILA2qowzNWfwABsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_224836_506368_0ECC0E68 
X-CRM114-Status: UNSURE (   9.39  )
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

st_clksrc_setup_clk() obtains the LPC clock with of_clk_get() but
leaks the consumer reference on two error paths: the
clk_prepare_enable() failure path returns without any release, and the
clk_get_rate() == 0 path only does clk_disable_unprepare() without
clk_put().

Add the missing clk_put() calls, mirroring the release already done in
st_clksrc_of_register() error handling.

Fixes: 70bef01c0f1c ("clocksource: sti: Provide support for the ST LPC Clocksource IP")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/clksrc_st_lpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/clksrc_st_lpc.c b/drivers/clocksource/clksrc_st_lpc.c
index 419a886876e4..574b966eeb34 100644
--- a/drivers/clocksource/clksrc_st_lpc.c
+++ b/drivers/clocksource/clksrc_st_lpc.c
@@ -74,12 +74,14 @@ static int __init st_clksrc_setup_clk(struct device_node *np)
 
 	if (clk_prepare_enable(clk)) {
 		pr_err("clksrc-st-lpc: Failed to enable LPC clock\n");
+		clk_put(clk);
 		return -EINVAL;
 	}
 
 	if (!clk_get_rate(clk)) {
 		pr_err("clksrc-st-lpc: Failed to get LPC clock rate\n");
 		clk_disable_unprepare(clk);
+		clk_put(clk);
 		return -EINVAL;
 	}
 
-- 
2.34.1


