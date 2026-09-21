Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4445C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8d8aSajBEkSCl37xD/gvNgyYlF4ktU+N0lkXEg+W1fc=; b=i+Yl3VrhOS/sknnqQMu72wtIsD
	JqdjtEcUHuTR+Sv9saB/W5IArp35BwGX30q+qgNda/jxM+SpWABusqMNLrDDPpW7vB6H0r4xERWyj
	4QhkEwsgCFMT1Xp9T+tyWK0Yml+UzL2qN/FtvzXYKXcdtWj6QsL6qFuVff18zouR8QVmWpdGLN7DJ
	9x6y9VX4UeZ44dpSmGv95cE/OvQHYx5ZoIB9+xTXkiMeuVa6C2bT7rWoW8r+NvxOkW/s4ds+2NORD
	MEil33b+z+NGbtTHzc4KMd04ZqRJ/mqdwtMRT7pDHORjVpx5ucEzYxMPiCPXFkJkDcpLgwNOXzNK0
	ngueKpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XGA-000000010Ml-0P0T;
	Mon, 21 Sep 2026 06:12:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XG9-000000010Mc-21Eo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:12:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F40F543E04;
	Mon, 21 Sep 2026 06:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15861F00898;
	Mon, 21 Sep 2026 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789971132;
	bh=8d8aSajBEkSCl37xD/gvNgyYlF4ktU+N0lkXEg+W1fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MMAjv8vM2mDaJsflzjfBJuBLAQt8U0jHy6KOsNXKmRXJNosQTDBG64F4FwsDc4Z7H
	 KWZyCoaCfvu3pXljy5AO4AE8qvNBr5M78L+BCnWwVAB7ERLjbmzQTL8uKuS1K7oP3n
	 HvVN8d/PRDGmpo/zLf2UchKVcdJjNR8gM181hqThbxDMlU1hhbgajZo/Uf2m3tTpYV
	 Wfsrbll5YsR+z88ilrG2zVAoMiMxzLVzLtFNy7ooSC/M1XEEgMKgrFyVFZ8oalMIqb
	 B9FqTfz+YVoOJhX5Xw8dp6ZNH3yKywG3pT4W72fS/y34GY1swvaKu1Uz1UabP7DcqA
	 Dp1aFayQ2rh1A==
From: Thorsten Blum <blum@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] crypto: ixp4xx - use memcpy_and_pad() in register_chain_var()
Date: Mon, 21 Sep 2026 08:11:22 +0200
Message-ID: <20260921061120.29694-8-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921061120.29694-6-blum@kernel.org>
References: <20260921061120.29694-6-blum@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=blum@kernel.org; h=from:subject; bh=h+sNQCTo/Hc5R0bACKQJMuhh/sA+vBcP2g3X9L0Ib2o=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkbTq0wW3fgkt/vSrd731oUl23SNDp48e4XS33WZdq/r ktfeHTyUEcpC4MYF4OsmCLLg1k/ZviW1lRuMonYCTOHlQlkCAMXpwBMRDuJ4b8ny8LfKRWxB7Yp 2mS/m58cosG58lOXlt73ULtCbbEI20mMDMfzzU+4fGnk+Lg+iGNPrsCuWosDb89XPNqw/PwHvQ/ lZzkA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
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

Use memcpy_and_pad() instead of separate memcpy() and memset() calls to
simplify register_chain_var().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
index fdda04672454..33e8e887a415 100644
--- a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
+++ b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
@@ -707,8 +707,7 @@ static int register_chain_var(struct crypto_tfm *tfm, u8 xpad, u32 target,
 		return -EAGAIN;
 	}
 
-	memcpy(pad, key, key_len);
-	memset(pad + key_len, 0, HMAC_PAD_BLOCKLEN - key_len);
+	memcpy_and_pad(pad, HMAC_PAD_BLOCKLEN, key, key_len, 0);
 	for (i = 0; i < HMAC_PAD_BLOCKLEN; i++)
 		pad[i] ^= xpad;
 

