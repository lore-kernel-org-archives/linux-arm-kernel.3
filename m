Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A355CC2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4CPf2ZJynm0JU5P5TMioqoG4hO+NATA51L2XquL3Tw=; b=QmTGla6ziXJyDf7aujvgoq1VVK
	PEmVyj7ZRRZKA0EsCdkR3Da3odBjarIUPDxwb9SKyp+SFSyQllRmKtIXakXva/6bsCd8Z08n05mxu
	pqQYzOhQFzPzxDEaxYCNlld/GGxdINf+6qu7/rwqZXkuhVjdHyulpi2kqMn5zlp6AMcuX6/DDLEmo
	nIy27Ch5dkU+ZaifDjm8ysB2gcQdIm1u+RNFDIq82q3njY9B//Y0tzaCuv3vjz0tjfbIt1PHHVS+F
	fuP9viaK8OppHx1im/CmGEe5OcS0Yym1W0DWW4vmsaFIdAYkWZvovRm6BOBQdWJz5zhVuTML4UcR0
	dZniRt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccxC-0000000AlED-2E8l;
	Mon, 05 Jan 2026 05:16:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvp-0000000Aj5N-0E5k;
	Mon, 05 Jan 2026 05:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E3E4E44345;
	Mon,  5 Jan 2026 05:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DBAC19425;
	Mon,  5 Jan 2026 05:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590104;
	bh=QrYuLwUNu/mVSc/Yo9MLheYVuGpn5hYaMt0fTaKLTGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G3G0Bk0G56Ktu3wG+6a9uAZH1lAOba80s4ElWn2pJFGgFmNV/Cvh+Z4L4klecwAfJ
	 4A4jYZkIX5u/TAbMBp2/t6kvMz1vfkfl6kK8wTbdYEMZzD48byZukOJjTQls80D1Xy
	 4WkndmU3Qn4EkS0p+n03CEKYzEJ0P2Wu+x5eAaKoh0QJtMhWu243+nRHSrwnSBLnET
	 /USJVwZLIvP7OD84paOmDdk+WrENSjRQUTX3tIVS55nIybRN4WLxj52YLt7MKHOYg9
	 LR99hxKJTTahowUoQL9JPYKxznndT0rryjV8qUaCJhK4rY0IHuWnAW46qVo1Gxtx6a
	 1WQW7lG89tSYQ==
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
Subject: [PATCH 21/36] net: phy: mscc: macsec: Use new AES library API
Date: Sun,  4 Jan 2026 21:12:54 -0800
Message-ID: <20260105051311.1607207-22-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211505_272795_F9121B10 
X-CRM114-Status: GOOD (  10.74  )
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/phy/mscc/mscc_macsec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_macsec.c b/drivers/net/phy/mscc/mscc_macsec.c
index 4f39ba63a9a9..bcb7f5a4a8fd 100644
--- a/drivers/net/phy/mscc/mscc_macsec.c
+++ b/drivers/net/phy/mscc/mscc_macsec.c
@@ -502,19 +502,19 @@ static u32 vsc8584_macsec_flow_context_id(struct macsec_flow *flow)
 
 /* Derive the AES key to get a key for the hash autentication */
 static int vsc8584_macsec_derive_key(const u8 *key, u16 key_len, u8 hkey[16])
 {
 	const u8 input[AES_BLOCK_SIZE] = {0};
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	int ret;
 
-	ret = aes_expandkey(&ctx, key, key_len);
+	ret = aes_prepareenckey(&aes, key, key_len);
 	if (ret)
 		return ret;
 
-	aes_encrypt(&ctx, hkey, input);
-	memzero_explicit(&ctx, sizeof(ctx));
+	aes_encrypt_new(&aes, hkey, input);
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 static int vsc8584_macsec_transformation(struct phy_device *phydev,
 					 struct macsec_flow *flow,
-- 
2.52.0


