Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD87BFD006D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fxSWyNaY+ys++0b6b1GR6MR/HPq6aPMdC7QG2GBvLM=; b=1yrg1CUgoPD3pCYEfTf1A1FGkk
	Rz3OnPlYty5Ud/Fe8fI3q25QMKRTXhH4Vff8jfHfnDraPCLsokhPcUqbC1fZ8/ttMEx7/t0trkoCR
	F42vX2tabRczKatiNKfImJVKi9HXr6HcVaoenMmoc71F6sf2QdL0zCKmD2C724gwuxxQ3XFy68PHT
	7vSo0OQTHawgy3//IouZMRb+SyBHhCL7bYWHjQ0eU/tvq8GiMbT7Xfe0KoIpAseJaGQ5dO5fL8Dfe
	+/d20bMdxed1czHLWCX8mqLcV7BVOXcoe7V7j9Cw49qX/eGgQQn9owWMoPgBFAbq4QULHl9U41IZl
	FKkn9Y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwj7v-0000000BcoT-2m2S;
	Sun, 01 Mar 2026 15:54:39 +0000
Received: from smtpo67.poczta.onet.pl ([141.105.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwj7r-0000000BcnB-3htd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 15:54:37 +0000
Received: from laptop-olek.lan (83.24.116.171.ipv4.supernova.orange.pl [83.24.116.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: aleksaander@onet.pl)
	by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4fP67f3WDgz1yJ4;
	Sun,  1 Mar 2026 16:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onet.pl; s=2011;
	t=1772380468; bh=8fxSWyNaY+ys++0b6b1GR6MR/HPq6aPMdC7QG2GBvLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Chi0gwz/A0aINqGgfC+tpec2GgI7To1Ayagv5YR07Z3SL7Nnmjj2pFahVr9vGEPFB
	 dHXegIp0ONKHFRjrnFSJtYu/JNB8J2QJizG6OSasSo3EU2yDTuw0iGL8PhKOA0Euwn
	 W6PFPeduRK953H9Ls8HLYGULUnGfzaqMPd5yOohs=
From: Aleksander Jan Bajkowski <aleksaander@onet.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH 3/5] crypto: testmgr - Add test vectors for authenc(hmac(sha256),rfc3686(ctr(aes)))
Date: Sun,  1 Mar 2026 16:53:40 +0100
Message-ID: <20260301155351.5840-3-aleksaander@onet.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301155351.5840-1-aleksaander@onet.pl>
References: <20260301155351.5840-1-aleksaander@onet.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_075436_244006_A6F144F6 
X-CRM114-Status: GOOD (  12.44  )
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

From: Aleksander Jan Bajkowski <olek2@wp.pl>

Test vectors were generated starting from existing RFC3686(CTR(AES)) test
vectors and adding HMAC(SHA256) computed with software implementation.
Then, the results were double-checked on Mediatek MT7986 (safexcel).
Platform pass self-tests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c |   6 +-
 crypto/testmgr.h | 235 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 240 insertions(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index b64a8b58b3fc..fcc53b5db653 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4206,8 +4206,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		}
 	}, {
 		.alg = "authenc(hmac(sha256),rfc3686(ctr(aes)))",
-		.test = alg_test_null,
+		.generic_driver = "authenc(hmac-sha256-lib,rfc3686(ctr(aes-generic)))",
+		.test = alg_test_aead,
 		.fips_allowed = 1,
+		.suite = {
+			.aead = __VECS(hmac_sha256_aes_ctr_rfc3686_tv_temp)
+		}
 	}, {
 		.alg = "authenc(hmac(sha384),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha384-lib,cbc(aes-generic))",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 42fa8d4b49ff..9617a76df3db 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -15943,6 +15943,241 @@ static const struct aead_testvec hmac_sha256_aes_cbc_tv_temp[] = {
 	},
 };
 
+static const struct aead_testvec hmac_sha256_aes_ctr_rfc3686_tv_temp[] = {
+	{ /* RFC 3686 Case 1 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x14"	/* enc key length */
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\xae\x68\x52\xf8\x12\x10\x67\xcc"
+			  "\x4b\xf7\xa5\x76\x55\x77\xf3\x9e"
+			  "\x00\x00\x00\x30",
+		.klen	= 8 + 32 + 20,
+		.iv	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.assoc	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\xe4\x09\x5d\x4f\xb7\xa7\xb3\x79"
+			  "\x2d\x61\x75\xa3\x26\x13\x11\xb8"
+			  "\x9b\xa2\x34\x62\xe5\xb3\xe8\x2d"
+			  "\x6d\xdb\x93\x64\xa5\x08\x2e\x77"
+			  "\x72\x1f\x21\x94\xc7\xbe\x14\xa6"
+			  "\xcd\xea\x96\xa1\x29\x8f\x30\xc3",
+		.clen	= 16 + 32,
+	}, { /* RFC 3686 Case 2 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x14"	/* enc key length */
+			  "\x20\x21\x22\x23\x24\x25\x26\x27"
+			  "\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f"
+			  "\x30\x31\x32\x33\x34\x35\x36\x37"
+			  "\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f"
+			  "\x7e\x24\x06\x78\x17\xfa\xe0\xd7"
+			  "\x43\xd6\xce\x1f\x32\x53\x91\x63"
+			  "\x00\x6c\xb6\xdb",
+		.klen	= 8 + 32 + 20,
+		.iv	= "\xc0\x54\x3b\x59\xda\x48\xd9\x0b",
+		.assoc	= "\xc0\x54\x3b\x59\xda\x48\xd9\x0b",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f",
+		.plen	= 32,
+		.ctext	= "\x51\x04\xa1\x06\x16\x8a\x72\xd9"
+			  "\x79\x0d\x41\xee\x8e\xda\xd3\x88"
+			  "\xeb\x2e\x1e\xfc\x46\xda\x57\xc8"
+			  "\xfc\xe6\x30\xdf\x91\x41\xbe\x28"
+			  "\x22\xf7\x95\xa8\xbb\xcd\x19\xf4"
+			  "\x58\x16\x54\x28\x2b\xf4\x52\xe7"
+			  "\x5c\x6c\xe1\x44\x0b\xd5\x10\x6e"
+			  "\xe1\xf7\x04\xc4\x2c\xab\x93\xdd",
+		.clen	= 32 + 32,
+	}, { /* RFC 3686 Case 3 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x14"	/* enc key length */
+			  "\x11\x22\x33\x44\x55\x66\x77\x88"
+			  "\x99\xaa\xbb\xcc\xdd\xee\xff\x11"
+			  "\x22\x33\x44\x55\x66\x77\x88\x99"
+			  "\xaa\xbb\xcc\xdd\xee\xff\x11\x22"
+			  "\x76\x91\xbe\x03\x5e\x50\x20\xa8"
+			  "\xac\x6e\x61\x85\x29\xf9\xa0\xdc"
+			  "\x00\xe0\x01\x7b",
+		.klen	= 8 + 32 + 20,
+		.iv	= "\x27\x77\x7f\x3f\x4a\x17\x86\xf0",
+		.assoc	= "\x27\x77\x7f\x3f\x4a\x17\x86\xf0",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f"
+			  "\x20\x21\x22\x23",
+		.plen	= 36,
+		.ctext	= "\xc1\xcf\x48\xa8\x9f\x2f\xfd\xd9"
+			  "\xcf\x46\x52\xe9\xef\xdb\x72\xd7"
+			  "\x45\x40\xa4\x2b\xde\x6d\x78\x36"
+			  "\xd5\x9a\x5c\xea\xae\xf3\x10\x53"
+			  "\x25\xb2\x07\x2f"
+			  "\x1d\x05\x5f\x77\x3b\x4f\x5c\x21"
+			  "\x29\xea\xf1\xa8\x71\x49\x7b\x0b"
+			  "\x66\x0d\xff\x18\x81\x63\xfc\xc3"
+			  "\x91\xb6\x38\xc8\xcd\x2d\x39\x83",
+		.clen	= 36 + 32,
+	}, { /* RFC 3686 Case 4 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x1c"	/* enc key length */
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x16\xaf\x5b\x14\x5f\xc9\xf5\x79"
+			  "\xc1\x75\xf9\x3e\x3b\xfb\x0e\xed"
+			  "\x86\x3d\x06\xcc\xfd\xb7\x85\x15"
+			  "\x00\x00\x00\x48",
+		.klen	= 8 + 32 + 28,
+		.iv	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.assoc	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x4b\x55\x38\x4f\xe2\x59\xc9\xc8"
+			  "\x4e\x79\x35\xa0\x03\xcb\xe9\x28"
+			  "\x8d\x03\x77\xb2\x1c\xc9\xe0\xac"
+			  "\xde\x69\xbe\x8a\xef\x5b\x13\x74"
+			  "\x1d\x39\xbc\xdc\x95\xa4\xbf\xc3"
+			  "\xd5\xc6\xd1\xda\xda\x3b\xca\x78",
+		.clen	= 16 + 32,
+	}, { /* RFC 3686 Case 5 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x1c"	/* enc key length */
+			  "\x20\x21\x22\x23\x24\x25\x26\x27"
+			  "\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f"
+			  "\x30\x31\x32\x33\x34\x35\x36\x37"
+			  "\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f"
+			  "\x7c\x5c\xb2\x40\x1b\x3d\xc3\x3c"
+			  "\x19\xe7\x34\x08\x19\xe0\xf6\x9c"
+			  "\x67\x8c\x3d\xb8\xe6\xf6\xa9\x1a"
+			  "\x00\x96\xb0\x3b",
+		.klen	= 8 + 32 + 28,
+		.iv	= "\x02\x0c\x6e\xad\xc2\xcb\x50\x0d",
+		.assoc	= "\x02\x0c\x6e\xad\xc2\xcb\x50\x0d",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f",
+		.plen	= 32,
+		.ctext	= "\x45\x32\x43\xfc\x60\x9b\x23\x32"
+			  "\x7e\xdf\xaa\xfa\x71\x31\xcd\x9f"
+			  "\x84\x90\x70\x1c\x5a\xd4\xa7\x9c"
+			  "\xfc\x1f\xe0\xff\x42\xf4\xfb\x00"
+			  "\x34\x06\x2b\x3d\xf1\xa8\x3d\xf1"
+			  "\xa6\x5e\x5c\x1a\xdb\x0c\xb5\x1e"
+			  "\x8f\xdb\xf4\xca\x7d\x09\x5e\x81"
+			  "\xdb\x32\x07\x4a\x1d\x1c\x6d\x83",
+		.clen	= 32 + 32,
+	}, { /* RFC 3686 Case 7 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x24"	/* enc key length */
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x77\x6b\xef\xf2\x85\x1d\xb0\x6f"
+			  "\x4c\x8a\x05\x42\xc8\x69\x6f\x6c"
+			  "\x6a\x81\xaf\x1e\xec\x96\xb4\xd3"
+			  "\x7f\xc1\xd6\x89\xe6\xc1\xc1\x04"
+			  "\x00\x00\x00\x60",
+		.klen	= 8 + 32 + 36,
+		.iv	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.assoc	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x14\x5a\xd0\x1d\xbf\x82\x4e\xc7"
+			  "\x56\x08\x63\xdc\x71\xe3\xe0\xc0"
+			  "\xc3\xb4\x5f\xb0\xbf\xf5\x1b\xff"
+			  "\x7c\xf1\x79\x00\x63\x50\xdd\x77"
+			  "\xc0\x4a\xba\xcd\xdc\x47\x05\x2a"
+			  "\x5d\x85\x2d\x83\x44\xca\x79\x2c",
+		.clen	= 16 + 32,
+	}, { /* RFC 3686 Case 8 */
+#ifdef __LITTLE_ENDIAN
+		.key    = "\x08\x00"		/* rta length */
+			  "\x01\x00"		/* rta type */
+#else
+		.key    = "\x00\x08"		/* rta length */
+			  "\x00\x01"		/* rta type */
+#endif
+			  "\x00\x00\x00\x24"	/* enc key length */
+			  "\x20\x21\x22\x23\x24\x25\x26\x27"
+			  "\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f"
+			  "\x30\x31\x32\x33\x34\x35\x36\x37"
+			  "\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f"
+			  "\xf6\xd6\x6d\x6b\xd5\x2d\x59\xbb"
+			  "\x07\x96\x36\x58\x79\xef\xf8\x86"
+			  "\xc6\x6d\xd5\x1a\x5b\x6a\x99\x74"
+			  "\x4b\x50\x59\x0c\x87\xa2\x38\x84"
+			  "\x00\xfa\xac\x24",
+		.klen	= 8 + 32 + 36,
+		.iv	= "\xc1\x58\x5e\xf1\x5a\x43\xd8\x75",
+		.assoc	= "\xc1\x58\x5e\xf1\x5a\x43\xd8\x75",
+		.alen	= 8,
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f",
+		.plen	= 32,
+		.ctext	= "\xf0\x5e\x23\x1b\x38\x94\x61\x2c"
+			  "\x49\xee\x00\x0b\x80\x4e\xb2\xa9"
+			  "\xb8\x30\x6b\x50\x8f\x83\x9d\x6a"
+			  "\x55\x30\x83\x1d\x93\x44\xaf\x1c"
+			  "\xc8\x59\x5d\xe1\xba\xac\x13\x82"
+			  "\xfd\x21\x7c\x8c\x23\x31\x04\x02"
+			  "\x9e\x69\x5b\x57\xa8\x13\xe7\x21"
+			  "\x60\x0c\x24\xc2\x80\x4a\x93\x6e",
+		.clen	= 32 + 32,
+	},
+};
+
 static const struct aead_testvec hmac_sha384_aes_cbc_tv_temp[] = {
 	{ /* RFC 3602 Case 1 */
 #ifdef __LITTLE_ENDIAN
-- 
2.47.3


