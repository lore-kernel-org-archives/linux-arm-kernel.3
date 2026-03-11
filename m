Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B7FD88D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 02:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9f/NPNUnA8wcieHoMwt6iGWiyD3QsUUnDTus3MDL7Y=; b=Ns00wtpQR/ixR9QTwIAcaW4bZn
	ncAEjUsylSb1lNOoCCMNXdSXkpBVrDjBcIxS2L+TxyqXhmG0YmwIJW5AbpgQAKxVhTKvtVv8TQGTm
	N6UdjU2XcnNCAvxuqoJD+c0Ji+0JDLxSZqdb3bBZVJL+nXELhwOrLGRv9OHdZDGIszEaCqcQffRtb
	ovF6V72hyh6gvbZplhCIpfEEU/gEgsZIRDWAuUv2KckYPUmmtroxN9DW8/k8M7CaUKcI7WprO4b5D
	pFbyzvHIbLRf21oKi8CqEuCLTnL7pfOx+gASQlE+rDm7WpIZlNuh630abi9ft9k+H2dofFoX8T4Uz
	gUPyuRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w090m-0000000AXDT-0UWS;
	Wed, 11 Mar 2026 02:09:24 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w090i-0000000AX9h-2bur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 02:09:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773194922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T9f/NPNUnA8wcieHoMwt6iGWiyD3QsUUnDTus3MDL7Y=;
	b=gUKioZh+4Jvw0/Iw+sLJF9tyZm+zYGd9qYPoanXP8n7soOYeOBpIhWtADOc2ujewBJurMc
	2O0tOlqunO3vw6b7VDZpIiRs2v3N5px5LqkaMVpn/XuWJtMEz8olT3J7ykzYCpUv4pMFNE
	PN9y76lAAm8GUfn0QHKNKBN5JQ54eYs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-aes - Fix 3-page memory leak in atmel_aes_buff_cleanup
Date: Wed, 11 Mar 2026 03:07:35 +0100
Message-ID: <20260311020733.250288-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=thorsten.blum@linux.dev; h=from:subject; bh=Q5cFX2k6bHPxzmFwA1jZZP2sbUYKylqyAiNpZjCoMM4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJkbzqUKhj15ssTH/p5yVPAMFmUvWem/ayZN9d3q6B3YZ uMoec20o5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACZiYcPwh08kfmn/Dd0kES32 PX/LDjYL7ihJ4qxcJyY2e8URS+m/3owM56+nOv77sNJ0/77WGUKnt/Yt+/Di5IGA5S7cHYs2P/7 dww8A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_190920_867034_9582F76C 
X-CRM114-Status: GOOD (  10.53  )
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

atmel_aes_buff_init() allocates 4 pages using __get_free_pages() with
ATMEL_AES_BUFFER_ORDER, but atmel_aes_buff_cleanup() frees only the
first page using free_page(), leaking the remaining 3 pages. Use
free_pages() with ATMEL_AES_BUFFER_ORDER to fix the memory leak.

Fixes: bbe628ed897d ("crypto: atmel-aes - improve performances of data transfer")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-aes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index bc0c40f10944..9b0cb97055dc 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -2131,7 +2131,7 @@ static int atmel_aes_buff_init(struct atmel_aes_dev *dd)
 
 static void atmel_aes_buff_cleanup(struct atmel_aes_dev *dd)
 {
-	free_page((unsigned long)dd->buf);
+	free_pages((unsigned long)dd->buf, ATMEL_AES_BUFFER_ORDER);
 }
 
 static int atmel_aes_dma_init(struct atmel_aes_dev *dd)

