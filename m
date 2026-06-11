Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3A3CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4IEYPeJLO0t9DaZJvm8UdXCFj3OVpL5b6N7+5vqSmAM=; b=b62LA5dR1kQ4ePzHM7p5hj6amP
	LlEs0ECKjEoaFq0I+ykSxLakfvs9gUQqhe0Mdqmiov6SGc9Z6Ph1yXe4eCPj11eL6AmVjuW7vBPpn
	ICcvHtmYOsLTWcYWgD2VRGrsvC4XuUtP3CUCG7PPiLUxiOosxQdk0j+44KtAg/RvxPmJyk5VIkfws
	Y5LF1G7hM6TR/H4d6qtOto4q93vGPSylMIbFJCJkG9Wg3wRRmTLbk++icGKFayKsnKmy+VonMuZVv
	5ed7czffkkF4cNmKxHAukgjUtHLqAw0bqwFOoQspMTcbtcn4il5VjbaX+ReIumJHHnHII+r+LzfIo
	Ou6nsShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXn4w-0000000A68f-1ZgR;
	Thu, 11 Jun 2026 21:36:46 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXn4s-0000000A68A-440u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 21:36:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781213796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4IEYPeJLO0t9DaZJvm8UdXCFj3OVpL5b6N7+5vqSmAM=;
	b=CnfkFdczXxEtBWpFsK09nkHE+qs7/SNLcVWSFr7Qyk68N+85DMXki4safyWUeTckt7e5eY
	QuNVPLYSv1SxSWhWRl8dpJEzWNb3yIqNL+JfN3uD1sBvVWbb2Ua7IQxsrFDA9isR0NoxIq
	fJ9cxPql9SHb/zQkl026p23CWsnnVBk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-ecc - reject hardware ECDH without a public key
Date: Thu, 11 Jun 2026 23:36:17 +0200
Message-ID: <20260611213617.463552-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198; i=thorsten.blum@linux.dev; h=from:subject; bh=t3+XshRL09d6biiCDeS6+8HgJOqrtebPzUOHS7SPm6k=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnaWoFBFQuVMq/xcyz+nMKspOjcrf85xeLnmvo3/ktv8 pYs93vbUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABP5L8jwT/fdO3/5j8vut/Xa /b88/dvMVQxVZp1LH7e8UTu3JXri/qmMDL9t9Ld3C6TUrLuiJy8ttMm5cf52Bs6F2+ZvNhVZtsd cnhkA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_143643_912126_6A00B9EF 
X-CRM114-Status: UNSURE (   9.76  )
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

The hardware ECDH path in atmel_ecdh_compute_shared_secret() uses the
private key stored in the device. However, the public key is cached only
after atmel_ecdh_set_secret() successfully generated that private key
for the current tfm.

atmel_ecdh_generate_public_key() already rejects requests when no public
key is cached. Add the same check to atmel_ecdh_compute_shared_secret()
to prevent the device from using a private key that was not generated
for the current tfm.

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC driver")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/crypto/atmel-ecc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 93f219558c2f..542c8cc13a0f 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -173,6 +173,9 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
 		return crypto_kpp_compute_shared_secret(req);
 	}
 
+	if (!ctx->public_key)
+		return -EINVAL;
+
 	/* must have exactly two points to be on the curve */
 	if (req->src_len != ATMEL_ECC_PUBKEY_SIZE)
 		return -EINVAL;

