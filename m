Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E593BD29DE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5s+0rDdp0xucx1mfaPO37Eu5HjJOMe4rckgTaeXS34k=; b=Zr/Y8eoRdFjwuGMzEQpleNDKFu
	1B0f3vjlWgMH2O+CKBrUSsXymLEFbn3TrR7n8Uex5/l0xNr/zkRJmVPIyTjGMS5FNUYi4CYdtVofP
	QW1SlPliybomU7JOz6yXuzJnmpI2CogkAbbOzpOunx9y8ZqwqrmEejJWRVlzUop5BcdYMg5oY+gK9
	DX0iLelQnQMXznfH8l3Bv4N4n3BUxeIKj6P782TT1aVitRYPXgZ6FW/H60G0C2bPb45TEI/AXuR+D
	E9pY5p0/rcl8YHuwFZer2hse3d82S3tsrCrrQM6nmZJoFp0aAFGKtmw0Ff9QCsl23h6CRE+D0jN9/
	0x4/uvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZor-00000006l0m-09l4;
	Tue, 13 Jan 2026 08:32:05 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZoo-00000006l00-0WKl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 08:32:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768293107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5s+0rDdp0xucx1mfaPO37Eu5HjJOMe4rckgTaeXS34k=;
	b=iEdkK8qBk9VWUL0M3zQikilw1NJeTx6un8VSq0b+VCtVm3MvKEX5LIcodzALPIFuXLDv+2
	epebbRxlV9Dm209cjSzVpO2vmX4U0cu+FTTMbarWYrxPKv+MnImQJ/XhUBxOAzvRWMCnYm
	b5e4YqOXYz3iswna0CMjRc475tuyAP0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
	Eric Biggers <ebiggers@google.com>,
	Colin Ian King <colin.i.king@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: stm32 - Replace min_t(size_t) with just min()
Date: Tue, 13 Jan 2026 09:31:28 +0100
Message-ID: <20260113083130.790316-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_003202_308490_DD8A1AF3 
X-CRM114-Status: UNSURE (   9.21  )
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

In most cases, min_t(size_t) and explicit casting are unnecessary
because the values ->hw_blocksize, ->payload_{in,out}, and ->header_in
are already of type 'size_t'. Use the simpler min() macro instead.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/stm32/stm32-cryp.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 5e82e8a1f71a..d206eddb67bf 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -21,6 +21,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -1922,20 +1923,19 @@ static void stm32_cryp_irq_read_data(struct stm32_cryp *cryp)
 	u32 block[AES_BLOCK_32];
 
 	readsl(cryp->regs + cryp->caps->dout, block, cryp->hw_blocksize / sizeof(u32));
-	memcpy_to_scatterwalk(&cryp->out_walk, block, min_t(size_t, cryp->hw_blocksize,
-							    cryp->payload_out));
-	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize,
-				   cryp->payload_out);
+	memcpy_to_scatterwalk(&cryp->out_walk, block, min(cryp->hw_blocksize,
+							  cryp->payload_out));
+	cryp->payload_out -= min(cryp->hw_blocksize, cryp->payload_out);
 }
 
 static void stm32_cryp_irq_write_block(struct stm32_cryp *cryp)
 {
 	u32 block[AES_BLOCK_32] = {0};
 
-	memcpy_from_scatterwalk(block, &cryp->in_walk, min_t(size_t, cryp->hw_blocksize,
-							     cryp->payload_in));
+	memcpy_from_scatterwalk(block, &cryp->in_walk, min(cryp->hw_blocksize,
+							   cryp->payload_in));
 	writesl(cryp->regs + cryp->caps->din, block, cryp->hw_blocksize / sizeof(u32));
-	cryp->payload_in -= min_t(size_t, cryp->hw_blocksize, cryp->payload_in);
+	cryp->payload_in -= min(cryp->hw_blocksize, cryp->payload_in);
 }
 
 static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
@@ -1980,10 +1980,9 @@ static void stm32_cryp_irq_write_gcm_padded_data(struct stm32_cryp *cryp)
 	 */
 	readsl(cryp->regs + cryp->caps->dout, block, cryp->hw_blocksize / sizeof(u32));
 
-	memcpy_to_scatterwalk(&cryp->out_walk, block, min_t(size_t, cryp->hw_blocksize,
-							    cryp->payload_out));
-	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize,
-				   cryp->payload_out);
+	memcpy_to_scatterwalk(&cryp->out_walk, block, min(cryp->hw_blocksize,
+							  cryp->payload_out));
+	cryp->payload_out -= min(cryp->hw_blocksize, cryp->payload_out);
 
 	/* d) change mode back to AES GCM */
 	cfg &= ~CR_ALGO_MASK;
@@ -2078,9 +2077,9 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 	 */
 	readsl(cryp->regs + cryp->caps->dout, block, cryp->hw_blocksize / sizeof(u32));
 
-	memcpy_to_scatterwalk(&cryp->out_walk, block, min_t(size_t, cryp->hw_blocksize,
-							    cryp->payload_out));
-	cryp->payload_out -= min_t(size_t, cryp->hw_blocksize, cryp->payload_out);
+	memcpy_to_scatterwalk(&cryp->out_walk, block, min(cryp->hw_blocksize,
+							  cryp->payload_out));
+	cryp->payload_out -= min(cryp->hw_blocksize, cryp->payload_out);
 
 	/* d) Load again CRYP_CSGCMCCMxR */
 	for (i = 0; i < ARRAY_SIZE(cstmp2); i++)
@@ -2158,7 +2157,7 @@ static void stm32_cryp_irq_write_gcmccm_header(struct stm32_cryp *cryp)
 	u32 block[AES_BLOCK_32] = {0};
 	size_t written;
 
-	written = min_t(size_t, AES_BLOCK_SIZE, cryp->header_in);
+	written = min(AES_BLOCK_SIZE, cryp->header_in);
 
 	memcpy_from_scatterwalk(block, &cryp->in_walk, written);
 
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


