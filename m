Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FE5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08VdG4udULNeeqwqKevnwBUl3foigbG9+JAc/3kbzIY=; b=WU0ctb/NoRej6uiZ4pthMyJJjU
	i5nnO51slExi8O7Cz23WNw7Qa/EI7pPAfxorhJWDgaxlp7vmpQUhgL31TEJROsnxllSah/gH9d4hI
	EHoITxeyZ0T+96LHg/d5nrgUUe4ucJQQvhaAogHTc0t40s0diu28flyrxSNxTvd4QXSPg/h/bIoj8
	CB7IQ4coRcZejghHpG457c7+ZGehn/EabHzbUTMudCBaHTNA9tVDEbQr7V+YxnOTVR8sP0oPlHVXu
	Kz62XiUZR4aMeeHd9sC6DYv0itczTirMgF7WN0YXa1sZSzV2pCYtGMF+Mm98MKCH0DitYrKkJFo3Q
	qznnbxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks3-0000000Cpey-0vng;
	Mon, 06 Jul 2026 15:04:31 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgks1-0000000Cpdk-1f1h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:04:30 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783350266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08VdG4udULNeeqwqKevnwBUl3foigbG9+JAc/3kbzIY=;
	b=PDfBzBJVr/NT3u5/jdEu4k+xyKsN3JEifzbluzANOAwmGRhpwsURnBGwtjtYXL5pLKIQgJ
	sZHi5IPp4c78HXjyJZxVjHdv4ryJJkE4nzTkK7jsuqN196hgyBHeX8n7NXgIvG8wGRDHDV
	mpzzVakBDcaBUynM/20/cTu6erhcC2Q=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] crypto: atmel-tdes - use __get_free_page in buff_init
Date: Mon,  6 Jul 2026 17:04:06 +0200
Message-ID: <20260706150404.382209-6-thorsten.blum@linux.dev>
In-Reply-To: <20260706150404.382209-5-thorsten.blum@linux.dev>
References: <20260706150404.382209-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=796; i=thorsten.blum@linux.dev; h=from:subject; bh=a+Olt+ci13rqSPS4SJgJk85PDpEKmzQRJHhJh3LQqZQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFneh594p5wsixb/vbFsXUWdqv8jbZPLL951/zbVYnL8z MG0pnB7RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExklzXDH95oz1ldhdXKVUVq vZs/PZgx6/M2NYcw15mKM1w23JofnsnIcEfncG/ZkVdKE5lu1V38vumlWPnvtHIVa/+g+atZ5Zj qOAE=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080429_584214_7AD8C7D6 
X-CRM114-Status: GOOD (  10.00  )
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

Replace __get_free_pages(..., 0) with __get_free_page().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-tdes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index d9cc4f657481..32f0acae46e3 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -313,8 +313,8 @@ static int atmel_tdes_buff_init(struct atmel_tdes_dev *dd)
 {
 	int err = -ENOMEM;
 
-	dd->buf_in = (void *)__get_free_pages(GFP_KERNEL, 0);
-	dd->buf_out = (void *)__get_free_pages(GFP_KERNEL, 0);
+	dd->buf_in = (void *)__get_free_page(GFP_KERNEL);
+	dd->buf_out = (void *)__get_free_page(GFP_KERNEL);
 	dd->buflen = PAGE_SIZE;
 	dd->buflen &= ~(DES_BLOCK_SIZE - 1);
 

