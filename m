Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF0CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SyW5BDjbbmigNhBIEQlI5kPn/+PoFEIgeknateLdwe4=; b=LaQggV2LzasXpqNQ02e7/oaPJ9
	omzRwK+w3f9qDNO6V1w+uFcD7TqM3j2YDmhhJFhU8YHbIEF9CWchbYiZ/t4VJOoKMZ90y2ATEIgUd
	i7NoGFncP9Fivek7jlZcJWaXyEP6qiZrq6x0XQdzx5CBTABW21SIaHx/XHr2lJo3/sLVR11EzuciU
	vOCDGb9yd156Xn/7Zderf+jOYaidKNzOmXUrOISnxqhAPtvcqgQqRx3TJ/SK7b8VqQ2sQgGmXlt92
	RbGoueakaW087x6MAExo+VpDI62fBcQbywMgfqaHDwojfGLjkOBTmEPIMJ2SiJIK1j4zUo0/HcMty
	IBAl+0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbNoX-0000000484Z-2lB0;
	Sun, 21 Jun 2026 19:26:41 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbNoV-0000000484F-2IGg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 19:26:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782069992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SyW5BDjbbmigNhBIEQlI5kPn/+PoFEIgeknateLdwe4=;
	b=A+/X6/gzL5DsFhYcVjNECqD+KhJW/fBatsdvl4pn75ovYj8zQv+UGoGeBcc6rC+dYKZt7q
	US1KlZRu0kr4Xh0w68gjTtp8o10XQ8RFA5lLOmZ+hrYzI9OPOfMlLvxbu4RwV2Rx/e++zV
	U5pyo4k3gooQ0UAzUc1PomZ+hBjomNM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: mxs-dcp - fix source scatterlist length access
Date: Sun, 21 Jun 2026 21:26:16 +0200
Message-ID: <20260621192615.277957-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=thorsten.blum@linux.dev; h=from:subject; bh=QLkT6UpBtXFAmC/EbtJYRlAe8jiyZbpGniPqrtKoJ60=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkWVtf/Cu5UfHHr5psQA8WX6k/jS97s97SteKueYCvQw Vf6q/9JRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEyk0Zjhr9TxwPL6Od9fHNC/ JRK9ceuRs/JzOpTnTmC0NsladWLWQzVGhubVJxLtTZfx7L59V6Ah7OsRx4mp7Fu9TkjfKL07d+2 EEG4A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_122639_885564_855D5C25 
X-CRM114-Status: UNSURE (   9.82  )
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

mxs_dcp_aes_block_crypt() uses sg_dma_len() without mapping the source
scatterlist with dma_map_sg() first. Therefore, sg_dma_len() is invalid
and could return zero or a stale DMA length, causing encryption and
decryption to process the wrong number of bytes when
CONFIG_NEED_SG_DMA_LENGTH=y.

Use the original scatterlist length instead.

Fixes: 15b59e7c3733 ("crypto: mxs - Add Freescale MXS DCP driver")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/mxs-dcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index 133ebc998236..595b2fd84667 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -353,7 +353,7 @@ static int mxs_dcp_aes_block_crypt(struct crypto_async_request *arq)
 
 	for_each_sg(req->src, src, sg_nents(req->src), i) {
 		src_buf = sg_virt(src);
-		len = sg_dma_len(src);
+		len = src->length;
 		tlen += len;
 		limit_hit = tlen > req->cryptlen;
 

