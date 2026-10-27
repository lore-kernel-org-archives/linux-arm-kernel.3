Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 02:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eSIo1piF;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=p3eNu3YW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/r7sbHgOMl6flEmwGOSI95NWBozhJ6tRqgN4OdIa9Ik=; b=eSIo1piF8dBB/EvqaFo2gYQ+Hq
	NnHdu/j9ornwCIfm4oil3+o94tmAzJKcfV/rLruEs7xZuZmHwuX8LtFYSkNJpJx2BUGRE8qG3cVSH
	t9yxib21tQGYKsHuobR0yDbHeI8YQKGBMDLMjg5OSwqp+AaSTU8d1TR5M+1pr64bV2MGpI5/iSfIz
	5KK6TF+wKZKxaNSZRpDJNjB2pZJJGKkD+kocW5OeQbqizsb2auKTu+R8EThoYQ4/txDiuDltV2hBz
	CK1PIpqVfTvOBwoUsVfasAfZOgXdTJsp6yDOkfE38iLDhjUdGOJI8C/zjv4yYKJg3iNFpkDgkuIXc
	+sG3Xg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLX7H-00000003eXr-1zEQ;
	Tue, 27 Oct 2026 02:40:47 +0000
Received: from out28-172.mail.aliyun.com ([115.124.28.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLX78-00000003eUo-0Y0z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 02:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793068831; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=/r7sbHgOMl6flEmwGOSI95NWBozhJ6tRqgN4OdIa9Ik=;
	b=p3eNu3YWtyhRp3dzlzEb17w3kwRlR55eeQsrNWXMaRdHL6WvfUztEbB+JqNTtgPY/FDSxQA66nsQBybm2xzBlZekMF0UV+/DYlWCpitr/hLr+qzs9vA+NcgQZUIv+3KnG0DwaGra7tW79zgcKOXii4+Lc1tl1fNvSinoCVBbP1Q=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07439248|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.011536-0.00151875-0.986945;FP=14732518330469582032|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037033194;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jqKXZaa_1793068829;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jqKXZaa_1793068829 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 10:40:30 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: gregkh@linuxfoundation.org
Cc: neal_liu@aspeedtech.com,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	zhugl3@xiaopeng.com,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: aspeed_udc: fix u16 truncation of descriptor lengths
Date: Tue, 27 Oct 2026 10:40:13 +0800
Message-ID: <20261027024029.1310175-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_194038_385614_9FDBD059 
X-CRM114-Status: GOOD (  13.64  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ast_udc_epn_kick_desc() computes tx_len as u32 bounded by
AST_EP_DMA_DESC_MAX_LEN * AST_UDC_DESCS_COUNT (7680 * 256, roughly
1.88 MB) and hands it to ast_dma_descriptor_setup(), whose tx_len
parameter is u16.  The length is truncated to the low 16 bits before
the descriptor list is built, so a descriptor-mode IN request larger
than 64 KB is described -- and therefore transferred -- as only
tx_len % 64 KB bytes.

The caller still accounts the full, untruncated length:

	req->actual_dma_length += tx_len;

so req->actual_dma_length never equals req->req.actual and the "more
requests" check in ast_udc_epn_handle_desc() never kicks the next
stage.  The request never completes and the endpoint queue stops
draining.

The same handler accumulates the per-descriptor transfer lengths of a
stage into a u16 total_len.  Each descriptor carries up to 8191 bytes
(EP_DESC1_IN_LEN mask 0x1fff) and up to AST_UDC_DESCS_COUNT (256)
descriptors are walked, so once the truncation above is fixed the sum
can exceed the u16 range: a full stage covers 7680 * 256 bytes, which
wraps modulo 64 KB to a value smaller than ep->ep.maxpacket.  The
short-packet check then believes the stage was short, completes the
request before the whole transfer has finished, and adds a length to
req->req.actual that does not match what was really moved.

Widen both the tx_len parameter and the total_len accumulator to u32.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Cc: stable@vger.kernel.org
Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 54f81e668009..f8c58158bd51 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -472,7 +472,7 @@ static void ast_udc_ep_free_request(struct usb_ep *_ep,
 }
 
 static int ast_dma_descriptor_setup(struct ast_udc_ep *ep, u32 dma_buf,
-				    u16 tx_len, struct ast_udc_request *req)
+				    u32 tx_len, struct ast_udc_request *req)
 {
 	struct ast_udc_dev *udc = ep->udc;
 	struct device *dev = &udc->pdev->dev;
@@ -899,7 +899,7 @@ static void ast_udc_epn_handle_desc(struct ast_udc_dev *udc, u16 ep_num)
 	struct ast_udc_request *req;
 	u32 proc_sts, wr_ptr, rd_ptr;
 	u32 len_in_desc, ctrl;
-	u16 total_len = 0;
+	u32 total_len = 0;
 	int i;
 
 	if (list_empty(&ep->queue)) {
-- 
2.50.1


