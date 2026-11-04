Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41199606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dD8zyQLA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gndPHB8K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/f5A3hR3Bm+usn2244B9GDUzSk90oqC+oGYIPpnfKec=; b=dD8zyQLAnMn9+tXoiYvjeJzHVi
	l5LEYTZmqsFI6yvRvnQAEBvH4Ze0Y5yxInrqnOE3LVkQO+NpvoOEHP5X60ltEy98wGAFPdefXKzr/
	FTUxZsvSr2eF/Y9lEY3qC0ixP0bbFAvFbxYVVtlNwj0siV5fOjNSUEjgStJjOUjaQgscM7lfPEDEJ
	doR6Oh2VjnkhATSujzPgMcQFnH+SerZaMxLZufn1BJCT9a++x7LiUhA5t0cneBUjXYGhi3a0d2LOV
	6zA5Ica7nc7q9NSC9kGh2wTzg6xIs+lNkx5S8I1BDqpA4FMHA/5ipcqbIOcXxWgyDSlnzO1SJhDUN
	+8w+Xq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZpm-00000005Gdv-2f1R;
	Wed, 04 Nov 2026 12:11:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZpl-00000005Gdh-31GT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:11:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3121343436;
	Wed,  4 Nov 2026 12:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1BF1F000C1;
	Wed,  4 Nov 2026 12:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794277;
	bh=/f5A3hR3Bm+usn2244B9GDUzSk90oqC+oGYIPpnfKec=;
	h=From:To:Cc:Subject:Date;
	b=gndPHB8KuXtUVdAEjeHq+VK7vBVz5TBIJ0SP2svlUxclb5ES5qbzqlmr2ZqCGq+lS
	 s8rNm70hl3s/OP6OBzTapLtBZcR1GLxIJ3+t5QnuavyviANZ9uqbxgW1KUwAugygoc
	 EeI9K++Clc5XJVybgyEMJNCUQcvRZ0hmmp4bdqNJ7c3d11Wggq21aEaCulOdrILlev
	 +IsUrOB4GY9Scq5tV2ler70t0aXDIskR6k4Ja8/ipzPaj14bpUU4IIEJ/BIuNvMcGF
	 EvDJDODLhWn05YDlm1tVq4nNOpEm63CDOrVUZRRnyU3p03f2wJT4s4GKrIW7o/b4HN
	 Q5L0kmWVX3/5A==
From: Michael Walle <mwalle@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Carlos Song <carlos.song@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 1/2] i2c: imx-lpi2c: fix SMBus block read with PEC
Date: Wed,  4 Nov 2026 13:10:35 +0100
Message-ID: <20261104121108.659820-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If PEC is enabled, the I2C core sets msgs->len to 2 instead of 1. The
length calculation for the second receive command assumes it's always
1. This will lead to a short read and eventually a timeout because the
PEC byte is never received.

Take msgs->len into account when calculating the remaining bytes.

This was tested on a board which uses an IPMI SSIF BMC.

Fixes: efdc383d1cc2 ("i2c: imx-lpi2c: fix SMBus block read NACK after byte count")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 7302464c371a..f57e800ac3b5 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -563,7 +563,7 @@ static unsigned int lpi2c_SMBus_block_read_length_byte(struct lpi2c_imx_struct *
 static int lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
 			       struct i2c_msg *msgs)
 {
-	unsigned int temp, val, block_len;
+	unsigned int temp, val, block_len, remaining;
 	int ret;
 
 	lpi2c_imx->rx_buf = msgs->buf;
@@ -612,9 +612,13 @@ static int lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
 		 * keep MTDR non-empty and ensuring continuous ACKs. Only update command register
 		 * here. All block bytes will be read out at IRQ handler or lpi2c_imx_read_atomic()
 		 * function.
+		 *
+		 * msgs->len is 1 - or if PEC enabled msgs->len is 2. Two bytes
+		 * have already been requested.
 		 */
-		if (block_len > 1)
-			writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
+		remaining = msgs->len + block_len - 2;
+		if (remaining)
+			writel((RECV_DATA << 8) | (remaining - 1), lpi2c_imx->base + LPI2C_MTDR);
 
 		lpi2c_imx->msglen += block_len;
 		msgs->len += block_len;
-- 
2.47.3


