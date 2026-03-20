Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1571109318E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izBpg3f4YsX+0N/YH8T17Ma2BiNyBCvm7Snr6+pnP1s=; b=Gr26M/g1StgTNGTqWpgGkyL4zK
	toqJitofvg+pVYTtA3q0oQKC0P/WzYZ3oka59TwCRrVSgaLIm9dFyXbrWHEw3p8HinqQ53HTORh9q
	a/tbnrnw3IodeKuaPUmJloqmcylKVGnThP57MeHErxIOSi6zg5eNSWEnT9f0J/sO32FcdeDeY/Glk
	uLmSSAjDgeTXez0rYqFaH1ZgmTfXLYsTNNu+Q68Ojvo21ebOaZ5jYhvMnJPmtw9Rzve+Z0PFXEp4c
	eDQQTYr9f5UuDMmJkUmmzcfBUc0GmPUrmZ2+xq4todCtW84cWmzjoC8fVwdHJIpUgHbMbtOpeS3rb
	qXMJg+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VYG-0000000CPc7-3WLz;
	Fri, 20 Mar 2026 08:49:52 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VYF-0000000CPaS-0Zn5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:49:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773996588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=izBpg3f4YsX+0N/YH8T17Ma2BiNyBCvm7Snr6+pnP1s=;
	b=a6B8WhbCKhlkLZh25B+fJjUtDE+V8ipFSZHjbFSa9r9aV1THdd8ZfgOXQEW/TkU81tEbTK
	nUiuJzojPI6m77qrVliMsB6Gv6mxGyT+xhYB8K8Ct+mdxq8v/1wDKUmYjpO03K9fzcmQD1
	/PGidZXC+LvLp30mGIaS9Be1fSQ8GpE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Maxime=20M=C3=A9r=C3=A9?= <maxime.mere@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] crypto: stm32 - use list_first_entry_or_null to simplify cryp_find_dev
Date: Fri, 20 Mar 2026 09:49:14 +0100
Message-ID: <20260320084914.7180-4-thorsten.blum@linux.dev>
In-Reply-To: <20260320084914.7180-3-thorsten.blum@linux.dev>
References: <20260320084914.7180-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=thorsten.blum@linux.dev; h=from:subject; bh=fS46rTjiGgSzi3MWcwcXeXN0mlGqe7jt3cqh8IomgFk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJl7uYRvdnaf6P13MGC5mZTXtuU8Nc1+4ffmGp9k0f7Ep cxpcfF0RykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExkmRAjw1edX79VZN9LTwt8 PNfnxL534ucuMNledLWqFPI+sV7nuD0jw76v8x3OP13QstZjSl2moWvhoVAX90W8d/dcffy1vG0 yKxcA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014951_327090_16603728 
X-CRM114-Status: GOOD (  10.58  )
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

Use list_first_entry_or_null() to simplify stm32_cryp_find_dev() and
remove the now-unused local variable 'struct stm32_cryp *tmp'.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/stm32/stm32-cryp.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 3c9b3f679461..b79877099942 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -361,19 +361,13 @@ static int stm32_cryp_it_start(struct stm32_cryp *cryp);
 
 static struct stm32_cryp *stm32_cryp_find_dev(struct stm32_cryp_ctx *ctx)
 {
-	struct stm32_cryp *tmp, *cryp = NULL;
+	struct stm32_cryp *cryp;
 
 	spin_lock_bh(&cryp_list.lock);
-	if (!ctx->cryp) {
-		list_for_each_entry(tmp, &cryp_list.dev_list, list) {
-			cryp = tmp;
-			break;
-		}
-		ctx->cryp = cryp;
-	} else {
-		cryp = ctx->cryp;
-	}
-
+	if (!ctx->cryp)
+		ctx->cryp = list_first_entry_or_null(&cryp_list.dev_list,
+						     struct stm32_cryp, list);
+	cryp = ctx->cryp;
 	spin_unlock_bh(&cryp_list.lock);
 
 	return cryp;

