Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D3DC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE/ik1wAzAwTyudQNL1qpPhVU7extNOPBrRt3K/rmXA=; b=NxVcasWip2qTF/DF9E6I5kBqYN
	NcZevBeeJorVizJPRTmiHhQh+5pkMzLb1f4KxECY00VP/aGICyCkbMAm4r+hEJViwjlf3jMkFS1ll
	5B0D4ZTmSKsnd+I3ppkc6/v61h7oacikOS+T15H8mmfW2B+xVrupTD7ux4PKLBk7sgj6NeqmlnQKc
	qTYH9gIsBiPk9rC96NfGpt+lW/WN2mVexuK7hcfXFRBdCnfw8OVVnv+WL+9420XT4CN/rTDd56DXq
	XZdfyCgU+Y/SN7c3OBGsvYYsCa+EAkvdzERockgEbeUN+7lE6y+hBbywbxdxxqWzEW6g3XyA5wYP4
	//vcaWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvo-0000000AjFY-2pyY;
	Mon, 05 Jan 2026 05:15:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvf-0000000Aj3K-2wNv;
	Mon, 05 Jan 2026 05:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D84D36011E;
	Mon,  5 Jan 2026 05:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5DAC116D0;
	Mon,  5 Jan 2026 05:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590094;
	bh=r+Qzw8crmbVQ6JrhV/JdglMrrXxEutC0ymCPwabmY4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ha2Mg2lmVEyVLJsqAxVeeF3Hs64jrH9zp2Xowl6MfoO/WjdTlOUp7UNsCTZkTJtfU
	 2AYsyz02/MC1BAUuUuoBZAAKn6CAkbwzdKIP9v/9RaFaVlsPUTBR1Woohd2oKK9FMO
	 5Rot1rQ1o2dNTQtuIt/afr1Uq6xrxjiZyQ+IT5GvmdQgtjAHrsK8GdwhELc8E7+eRv
	 9pHjeEyKHYLlQcEY3FNTJCSA4nzsOny+dsca1a4hl1RnrQpY5UnvlJGyvhEzgNgW8y
	 /GwmtZUqbDRE9WdmGEsKpgpkR36Z61nAyxx0OD8nadJY+jrz/URE7Bdw4del+ewJqI
	 vkYTEb2DdJScQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/36] crypto: aegis - Switch from crypto_ft_tab[] to aes_enc_tab[]
Date: Sun,  4 Jan 2026 21:12:40 -0800
Message-ID: <20260105051311.1607207-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

Instead of crypto_ft_tab[0] from aes_generic.c, use aes_enc_tab from
lib/crypto/aes.c.  These contain the same data, so the result is the
same.  This will allow aes_generic.c to eventually be removed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig | 2 +-
 crypto/aegis.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 12a87f7cf150..443fe8e016fd 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -764,11 +764,11 @@ endmenu
 menu "AEAD (authenticated encryption with associated data) ciphers"
 
 config CRYPTO_AEGIS128
 	tristate "AEGIS-128"
 	select CRYPTO_AEAD
-	select CRYPTO_AES  # for AES S-box tables
+	select CRYPTO_LIB_AES  # for AES S-box tables
 	help
 	  AEGIS-128 AEAD algorithm
 
 config CRYPTO_AEGIS128_SIMD
 	bool "AEGIS-128 (arm NEON, arm64 NEON)"
diff --git a/crypto/aegis.h b/crypto/aegis.h
index 6ef9c174c973..ffcf8e85ea69 100644
--- a/crypto/aegis.h
+++ b/crypto/aegis.h
@@ -60,11 +60,11 @@ static __always_inline void crypto_aegis_block_and(union aegis_block *dst,
 static __always_inline void crypto_aegis_aesenc(union aegis_block *dst,
 						const union aegis_block *src,
 						const union aegis_block *key)
 {
 	const u8  *s  = src->bytes;
-	const u32 *t = crypto_ft_tab[0];
+	const u32 *t = aes_enc_tab;
 	u32 d0, d1, d2, d3;
 
 	d0 = t[s[ 0]] ^ rol32(t[s[ 5]], 8) ^ rol32(t[s[10]], 16) ^ rol32(t[s[15]], 24);
 	d1 = t[s[ 4]] ^ rol32(t[s[ 9]], 8) ^ rol32(t[s[14]], 16) ^ rol32(t[s[ 3]], 24);
 	d2 = t[s[ 8]] ^ rol32(t[s[13]], 8) ^ rol32(t[s[ 2]], 16) ^ rol32(t[s[ 7]], 24);
-- 
2.52.0


