Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9451CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yn6j07+LBxW3EcioHNLJu8FXv0cfT52p3HWMHOFuIBA=; b=3Z8IHrK1PKccvycmIu8Ak+019I
	u0/Rik6j7qiWm1ogRP3DlhHdyZ+a+pSHdegirCst19VgpnmlvyEVlwPcnAhVeIUy9f/+2HuhsHnb/
	D33QMCpPGhOSYCnsSyocutHlbvQ9CrGSzX/MyhTD+xLCua2azEyfXcZT30cgyIBsiUgEq2zPFKXWJ
	Z08RhzDofqXnREBTCy11XlTy8hA39AIMfo4VHMnkTuAPGx5AGxvw4Q61WULJrTgToOLfDaqs34yaG
	3CJl5j7Fl5DsxJEp/c48mS2ueIQY0LLX+MJTsTjjdSvbNOFQvHybOAx7BWUc6pHzmeLXuqMIqBLkm
	6tg7YHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuIP-00000005kpu-1xSv;
	Tue, 23 Jun 2026 06:07:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuIM-00000005kpV-1B8R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 06:07:40 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACnCt6mIjpqne_JFA--.53044S2;
	Tue, 23 Jun 2026 14:07:35 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mounika Botcha <mounika.botcha@amd.com>,
	Harsh Jain <h.jain@amd.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Michal Simek <michal.simek@amd.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] hwrng: xilinx-trng: propagate timeout before any data is read
Date: Tue, 23 Jun 2026 14:07:27 +0800
Message-ID: <20260623060728.18906-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACnCt6mIjpqne_JFA--.53044S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1Dtr4kCr4kGF4UArWxtFb_yoW5Zw17pr
	WrWa9IgrWUGFyxZFZxCa47XFn8uwn3CF4jka17tas7Zr93Xrn3Ja40vF9Yqry5KFWxZFsI
	qF43urWDC3Z3AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5iihUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_230738_720536_16B2151A 
X-CRM114-Status: GOOD (  15.72  )
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

xtrng_readblock32() polls for 16-byte chunks but returns the number of
bytes read even when the first poll times out. Its caller then treats a
zero return as a short successful read, and partial reads for full
32-byte blocks can make the tail copy use a fixed block offset rather
than the amount already produced.

Return the poll error when no data has been read, preserve partial
positive returns after some data is available, stop the generator on all
collection exits, and append tail bytes at the current output count.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/char/hw_random/xilinx-trng.c | 32 +++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/drivers/char/hw_random/xilinx-trng.c b/drivers/char/hw_random/xilinx-trng.c
index f615d5adddde..4a1a168bb46a 100644
--- a/drivers/char/hw_random/xilinx-trng.c
+++ b/drivers/char/hw_random/xilinx-trng.c
@@ -87,8 +87,8 @@ static void xtrng_softreset(struct xilinx_rng *rng)
 	xtrng_readwrite32(rng->rng_base + TRNG_CTRL_OFFSET, TRNG_CTRL_PRNGSRST_MASK, 0);
 }
 
-/* Return no. of bytes read */
-static size_t xtrng_readblock32(void __iomem *rng_base, __be32 *buf, int blocks32, bool wait)
+/* Return no. of bytes read or a negative error before any data is read. */
+static int xtrng_readblock32(void __iomem *rng_base, __be32 *buf, int blocks32, bool wait)
 {
 	int read = 0, ret;
 	int timeout = 1;
@@ -103,8 +103,11 @@ static size_t xtrng_readblock32(void __iomem *rng_base, __be32 *buf, int blocks3
 		ret = readl_poll_timeout(rng_base + TRNG_STATUS_OFFSET, val,
 					 (val & TRNG_STATUS_QCNT_MASK) ==
 					 TRNG_STATUS_QCNT_16_BYTES, !!wait, timeout);
-		if (ret)
+		if (ret) {
+			if (!read)
+				return ret;
 			break;
+		}
 
 		for (idx = 0; idx < TRNG_READ_4_WORD; idx++) {
 			*(buf + read) = cpu_to_be32(ioread32(rng_base + TRNG_CORE_OUTPUT_OFFSET));
@@ -119,27 +122,40 @@ static int xtrng_collect_random_data(struct xilinx_rng *rng, u8 *rand_gen_buf,
 {
 	u8 randbuf[TRNG_SEC_STRENGTH_BYTES];
 	int byteleft, blocks, count = 0;
+	int full_blocks_bytes;
 	int ret;
 
 	byteleft = no_of_random_bytes & (TRNG_SEC_STRENGTH_BYTES - 1);
 	blocks = no_of_random_bytes >> TRNG_SEC_STRENGTH_SHIFT;
+	full_blocks_bytes = blocks * TRNG_SEC_STRENGTH_BYTES;
 	xtrng_readwrite32(rng->rng_base + TRNG_CTRL_OFFSET, TRNG_CTRL_PRNGSTART_MASK,
 			  TRNG_CTRL_PRNGSTART_MASK);
 	if (blocks) {
 		ret = xtrng_readblock32(rng->rng_base, (__be32 *)rand_gen_buf, blocks, wait);
-		if (!ret)
-			return 0;
+		if (ret <= 0) {
+			count = ret;
+			goto out_stop;
+		}
 		count += ret;
+		if (ret < full_blocks_bytes)
+			goto out_stop;
 	}
 
 	if (byteleft) {
 		ret = xtrng_readblock32(rng->rng_base, (__be32 *)randbuf, 1, wait);
+		if (ret < 0) {
+			if (!count)
+				count = ret;
+			goto out_stop;
+		}
 		if (!ret)
-			return count;
-		memcpy(rand_gen_buf + (blocks * TRNG_SEC_STRENGTH_BYTES), randbuf, byteleft);
-		count += byteleft;
+			goto out_stop;
+		ret = min(ret, no_of_random_bytes - count);
+		memcpy(rand_gen_buf + count, randbuf, ret);
+		count += ret;
 	}
 
+out_stop:
 	xtrng_readwrite32(rng->rng_base + TRNG_CTRL_OFFSET,
 			  TRNG_CTRL_PRNGMODE_MASK | TRNG_CTRL_PRNGSTART_MASK, 0U);
 
-- 
2.50.1 (Apple Git-155)


