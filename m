Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40691093188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7Ypq/2sdtjtXxITYYiW9Wy8T7mWGhBOO/q+BwqcWKs=; b=2cU21yLf9+i7BmcrRHM8QibSYz
	D0V5CedNNOkqAoAMCjyNNZbMo8ypHUF67c/Ne6qJ+qIIxYb9oFFsK1smUYfBHvLn0LiN9vzr30K/g
	mGOl7du+hMIh1SMWwOiLeIiVPUgPaQwVZV+H/sCJ9uPSOo/G2ijE9kp2hnZdEXTRkr4NrK1a9vANa
	FbGchZmdMepBD592TrMmRO7tJG7nzeXj95OZMFuJu4W6vO57U1aPUYg6qkFYDa1gJCO2OT6F488/O
	T+MppyoLBI0XkLM+J64RTQ1S4QmRTwxxzJX0WYTxNbZ1TbsPrLIGpR41/bDwxy45GohEFH7xPTOg/
	brVlbO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VYB-0000000CPZJ-07op;
	Fri, 20 Mar 2026 08:49:47 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VY8-0000000CPXv-0w78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:49:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773996579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z7Ypq/2sdtjtXxITYYiW9Wy8T7mWGhBOO/q+BwqcWKs=;
	b=igP/iLuKjQb5/GqbtIEiStlLNTdSw1sdmJBmW4o+d9qOmvRrmBSnP+zsMUvY6ndY9pDmtt
	lMIEO4cR0aGZOQLAPMsf99nj6gR8WewWwaLB9s76fbgNNj0iUKO7Jx28EAqaigVd1sYPxV
	0jWpD2C457eFQhV8eqF9unouRQLz/yI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] crypto: stm32 - use list_first_entry_or_null to simplify hash_find_dev
Date: Fri, 20 Mar 2026 09:49:13 +0100
Message-ID: <20260320084914.7180-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=thorsten.blum@linux.dev; h=from:subject; bh=ahib7IbYp2cDCXT6vLdkvKmi5k8RioCG9oaxaS8HxBU=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJl7ubhEMrm+KV0QmBve+uPYg++nWuft8vd82rPT0k74f Ms9rYXSHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRyWcY/tmG7/wYGXHYUuD8 g+s2r5ZMYQyZdLPx9KQfG+4/r97lE2zK8E/lUdvNwOS/W2f//2h69O0ZzrNLDDyv+LqtLk9y6/b uy+cBAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014945_404178_0AAD7F85 
X-CRM114-Status: GOOD (  10.04  )
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

Use list_first_entry_or_null() to simplify stm32_hash_find_dev() and
remove the now-unused local variable 'struct stm32_hash_dev *tmp'.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/stm32/stm32-hash.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index d60147a7594e..dada5951082c 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -792,19 +792,13 @@ static int stm32_hash_dma_send(struct stm32_hash_dev *hdev)
 
 static struct stm32_hash_dev *stm32_hash_find_dev(struct stm32_hash_ctx *ctx)
 {
-	struct stm32_hash_dev *hdev = NULL, *tmp;
+	struct stm32_hash_dev *hdev;
 
 	spin_lock_bh(&stm32_hash.lock);
-	if (!ctx->hdev) {
-		list_for_each_entry(tmp, &stm32_hash.dev_list, list) {
-			hdev = tmp;
-			break;
-		}
-		ctx->hdev = hdev;
-	} else {
-		hdev = ctx->hdev;
-	}
-
+	if (!ctx->hdev)
+		ctx->hdev = list_first_entry_or_null(&stm32_hash.dev_list,
+						     struct stm32_hash_dev, list);
+	hdev = ctx->hdev;
 	spin_unlock_bh(&stm32_hash.lock);
 
 	return hdev;

