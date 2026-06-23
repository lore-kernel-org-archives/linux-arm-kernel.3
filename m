Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E927CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lpLs5RBqSzuOkyWVoz3Q+7zPJQwzGjMgaYi4wjW5mXw=; b=iY3I5Bfx2KHtEJtVtWCQP4xcaK
	zU3zpmnjY2eiORl9CVHZ/xFU2HZHb/bgOo+vPpAexORyhbY1cVuATR7ys2Z72d5EfwmDvRnw5mT2I
	Fm20B5q3cEc69UWNMzs95ToplvxLjbF+ZHyzgFaE8LWrcnj9zFuhD+p1oNNd7TZ/CB5p0BuBov17M
	poRAz6PHltbtKbBPclpb/76nbw5n5K9rqx4eLQdGFKZY/IqxQwX8xIorbOMszulElIaO1QY3feQBs
	BZd1TaAfgJBsQrcsTUocnL431EDJIC4lE+MT5m4VBUGUDs7rY/fiVPKyoRN4kEH/UIVdnpqi8vu++
	M+R3pyrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1bG-00000006NgB-07PI;
	Tue, 23 Jun 2026 13:55:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc1bD-00000006Nfc-0S0P;
	Tue, 23 Jun 2026 13:55:36 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACX99pQkDpq_TTYFA--.34224S2;
	Tue, 23 Jun 2026 21:55:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Heiko Stuebner <heiko@sntech.de>,
	John Keeping <john@keeping.me.uk>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: rockchip: fail ahash requests on HASH idle timeout
Date: Tue, 23 Jun 2026 21:55:28 +0800
Message-ID: <20260623135528.46115-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACX99pQkDpq_TTYFA--.34224S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4DCFWDCFWDGr1kCr1kGrg_yoW8Gw15pF
	43K39FyrykCr4qgF9Yywn0yFZ5XasIvay3ArZ7G3y5Zw1Sy34kXryxCFy0vF1jvF93Aa1j
	yFs7A345Gr1UWrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU5iihUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_065535_520333_50CAD918 
X-CRM114-Status: GOOD (  11.56  )
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

rk_hash_run() waits for RK_CRYPTO_HASH_STS to become idle after the
final DMA transfer, but ignores the poll result. If the hash engine
never becomes idle, the driver still reads the digest registers and
finalizes the request with the previous success value.

Store the poll result and finalize the request with the timeout error
before reading the digest registers.

Fixes: 37bc22159c45 ("crypto: rockchip - use read_poll_timeout")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index b9f5a8b42..d3482619a 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -324,7 +324,12 @@ static int rk_hash_run(struct crypto_engine *engine, void *breq)
 	 * efficiency, and make it response quickly when dma
 	 * complete.
 	 */
-	readl_poll_timeout(rkc->reg + RK_CRYPTO_HASH_STS, v, v == 0, 10, 1000);
+	err = readl_poll_timeout(rkc->reg + RK_CRYPTO_HASH_STS, v,
+				 v == 0, 10, 1000);
+	if (err) {
+		dev_err(rkc->dev, "HASH idle timeout\n");
+		goto theend;
+	}
 
 	for (i = 0; i < crypto_ahash_digestsize(tfm) / 4; i++) {
 		v = readl(rkc->reg + RK_CRYPTO_HASH_DOUT_0 + i * 4);
-- 
2.50.1 (Apple Git-155)


