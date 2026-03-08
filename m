Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A0EA852F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 23:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iTPXCABkEggbDIGuCh1IV5kp7+i1+yPmZYrmuxmytjM=; b=Nz9tB35QH0gg2OheXrGSAlWKmz
	k5iGsQYm+YWcEmGR7Uq5jhhhvgdDLficJylP+DgQJQ1GpBmnnv1d5UJAopg0jtYc8ngF9vw1+Qu4k
	+USkKbmcKomqJM/uaNume4N2erdh+BjAy+Q3U6NJtN1iMl3dpGxyyrU/CC775qYbfxENQDaakhrND
	pTvUoUlOMzGvRrVyFGczw2LdCtWD1g+jPfrDYScvVeZs3UQSXEPHvqyb9cjqlYJPQDcHpwblkG5q2
	DKN/Rgo7/BSNIGIulfuCvm0d4YD4FjrV4ka6HXvTdLfudim4/fmkd4oJ2oX2YkATR/SdeHO/0s3cl
	lgoDGoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNUs-00000006REn-2ikG;
	Sun, 08 Mar 2026 23:25:18 +0000
Received: from mta1.migadu.com ([2001:41d0:203:375::] helo=out-182.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNUp-00000006REP-0RtL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 23:25:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773012309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iTPXCABkEggbDIGuCh1IV5kp7+i1+yPmZYrmuxmytjM=;
	b=JP3dI2psjPagAtQyZKtKh9NlHT+UdTW+78Qf2AuEq/Jj+EKOI7vuKDqm6YBouy9JeoXw6L
	IOA+OYn6Zc8CuKBA+KXfyLT3NeLSCF2z56RHuO7jdibraqj2PWFTn+clBvAs224baB08aa
	7lt/NXJxE1NZ0o04cQbhgoMXbHZPg80=
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
Subject: [PATCH] crypto: atmel - use list_first_entry_or_null to simplify find_dev
Date: Mon,  9 Mar 2026 00:22:32 +0100
Message-ID: <20260308232230.544209-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=thorsten.blum@linux.dev; h=from:subject; bh=nqj4YND/KgmZUOiN5flyhdGVD/KL8lrlWmefXh7ljAE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnrWLZpnpZjmmTkv8DIx1zd4mvWNbbsk3pyByf81Xwfz uSq9yW6o5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACZi0srIcNJfccokhXIX8YU+ 18zM7i9WLHp4/3DDPVn7gPNPJD6rtjMyfKqSdl9XPf1ltbyRlopxSOnmKQpJXwTF3365PZdx7Ts vfgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_162515_451881_BFC9A9F3 
X-CRM114-Status: GOOD (  10.01  )
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

Use list_first_entry_or_null() to simplify atmel_sha_find_dev() and
remove the now-unused local variable 'struct atmel_sha_dev *tmp'.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-sha.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 1f1341a16c42..002b62902553 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -404,20 +404,13 @@ static void atmel_sha_fill_padding(struct atmel_sha_reqctx *ctx, int length)
 
 static struct atmel_sha_dev *atmel_sha_find_dev(struct atmel_sha_ctx *tctx)
 {
-	struct atmel_sha_dev *dd = NULL;
-	struct atmel_sha_dev *tmp;
+	struct atmel_sha_dev *dd;
 
 	spin_lock_bh(&atmel_sha.lock);
-	if (!tctx->dd) {
-		list_for_each_entry(tmp, &atmel_sha.dev_list, list) {
-			dd = tmp;
-			break;
-		}
-		tctx->dd = dd;
-	} else {
-		dd = tctx->dd;
-	}
-
+	if (!tctx->dd)
+		tctx->dd = list_first_entry_or_null(&atmel_sha.dev_list,
+						    struct atmel_sha_dev, list);
+	dd = tctx->dd;
 	spin_unlock_bh(&atmel_sha.lock);
 
 	return dd;

