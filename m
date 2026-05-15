Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40304CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DoOscPPbEq+IsrvoFBtYmGkOpWEY5ZhOZDh4BoQkSzU=; b=rUgzCrCviI0sqxODuYvZ96KhEz
	0gcDgjDjKY2oMLNxY6qWTvjzigWf2hR7Ka2hFu4LyELWX6w1Zvt095OCoGRl4UvpwZehyLkxMEyPV
	jQr4sZTsJs8r4EfIi82oQkrumuiZpU0pYO7PfbEuXpBptO7HqWxFrjQVqxgmE2BAc2JIxvHxVTx7A
	4zOqAJFVLGuY7mBxTpjODsHf98aXqndbRppctiR2CsKYTcoV+NI8U2iIR2O44F0+vFDbIw6JvWRtz
	uOLx3zUYgNgNZiGy7xdzb6HZqOPtr2xGt3KpP0w1zpRwaqfjlivsQEnnsSxxc7NTyr2yRLFmEdaj2
	GLZB2qoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzAv-00000009NNA-11qb;
	Fri, 15 May 2026 20:30:25 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNzAr-00000009NLF-1PqV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:30:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778877013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DoOscPPbEq+IsrvoFBtYmGkOpWEY5ZhOZDh4BoQkSzU=;
	b=PHc3J6vrb8NtBt640oarelPk5aRnfNS2YuFma4X7BqcLegm8HmkVQmONqcN7uluRBbnTgT
	SPC36gGi3Og8IOgyrxZI+mJxwE2PND5slfu8ydnErK1ei2j9u4zck4f0VHlCdPjASJ1vu5
	U6qbwP7vpGrN1lkEtCxKphJCWLu2cfI=
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
Subject: [PATCH] crypto: atmel-i2c - drop redundant void * callback cast in enqueue
Date: Fri, 15 May 2026 22:29:48 +0200
Message-ID: <20260515202946.725533-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=688; i=thorsten.blum@linux.dev; h=from:subject; bh=Q8X3Cfsu45fvncATKmw13bJFse7MnTZYaL27Q0//WKk=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnsTVa6UytjG7780pcP1KvOspV6bt5tUKh8dNK6X/uyC vQdavZ2lLIwiHExyIopsjyY9WOGb2lN5SaTiJ0wc1iZQIYwcHEKwEQsMxj+x91e0XTv37aLJ9mF KyaGHozx3v9i2f+qK8tumvy5scbi6TVGhsfl+kYHPNjqi97nMG1Q6d3m/0fEI+1B2DYFX+Z7C4r cuAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_133022_185991_AAA52A48 
X-CRM114-Status: UNSURE (   9.17  )
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

The callback already has the correct type - remove the redundant cast.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index 0e275dbdc8c5..ff19857894d0 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -294,7 +294,7 @@ void atmel_i2c_enqueue(struct atmel_i2c_work_data *work_data,
 				   void *areq, int status),
 		       void *areq)
 {
-	work_data->cbk = (void *)cbk;
+	work_data->cbk = cbk;
 	work_data->areq = areq;
 
 	INIT_WORK(&work_data->work, atmel_i2c_work_handler);

