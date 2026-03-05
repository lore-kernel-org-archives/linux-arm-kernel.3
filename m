Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D17F47CC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G5Gj/FdJXLAflQMWWZlCHZY2f41mFn+DjNy+2rUUMNc=; b=4XM/7f2jc9XR5IOvyd4FT0OGaR
	0mI5R7VpQddvv9JA8Q54hD7fF/DomQmYOeLRJVb8W3bsUuPIXfmZhQtOQRvLogsP5BDnrQ5tjEo0X
	9FXz66fzXtmZYBGLKfL9XmszMrWkAoIPkeAWcLYuraMJw3P/k1hGeBs+akQ9sf1/z1J2KbabzyHfS
	iJAF9S2LJgvMNha+Rt24t8BobDshpO0EkIyFqLKofVuG3Z5+5WMYUiij2VkTlFqCGNCBTXxRAvNIb
	1AQNaoxz2OAEGywuAcThu18bXE+I2p7JT9iVL1wOlDEgywRgtft9iOeXAjq99rPgLODznI6phRy9r
	dYoHsMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyF1x-00000002VT9-1kCv;
	Thu, 05 Mar 2026 20:10:45 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyF1u-00000002VSU-3E6U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 20:10:44 +0000
Received: (wp-smtpd smtp.wp.pl 46920 invoked from network); 5 Mar 2026 21:10:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772741438; bh=G5Gj/FdJXLAflQMWWZlCHZY2f41mFn+DjNy+2rUUMNc=;
          h=From:To:Cc:Subject;
          b=dbiWWkyLE5FpA77qWAeY/JbqFX+O4q3CMZ1A4CRCINjvclulTDBaIDTpe0qXvspb+
           DhA1wQRHdDueAVS2gyFVKzXsbHLOUgcvllpkUR7olFiwLG8eJeNQVuQn1dsV3ajsBF
           Tu10jHzPYnDrinLfZ52+dxQONs8knHF35NNbl9BvXvcBG95ns3J/FFoWK2KhOm9ILl
           QOsvxyRqTSL2RyyY2W4KbtcvP2ZH51bRzfqdII5qc1XLSH1ubAauEJeXWYYQT8FQwa
           lRdtsaUfsDxblBO57Cd4YyqI4Tcc2/WnXvwVsdfZBp4Qcp3CpK/TIGxvfoB3Ik11/W
           LxzYzE/gZWkdw==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 5 Mar 2026 21:10:38 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v2 1/5] crypto: testmgr - Add test vectors for authenc(hmac(sha1),rfc3686(ctr(aes)))
Date: Thu,  5 Mar 2026 21:08:20 +0100
Message-ID: <20260305201036.63280-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 952f8e22d526090698749299813a85c1
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [AMPx]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_121042_957534_30C38710 
X-CRM114-Status: GOOD (  11.40  )
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

Test vectors were generated starting from existing RFC3686(CTR(AES)) test
vectors and adding HMAC(SHA1) computed with software implementation.
Then, the results were double-checked on Mediatek MT7986 (safexcel).
Platform pass self-tests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v2:
- rename aes-generic -> aes-lib
---
 crypto/testmgr.c |   6 +-
 crypto/testmgr.h | 221 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 4985411dedae..abbaaafa2502 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4128,8 +4128,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		}
 	}, {
 		.alg = "authenc(hmac(sha1),rfc3686(ctr(aes)))",
-		.test = alg_test_null,
+		.generic_driver = "authenc(hmac-sha1-lib,rfc3686(ctr(aes-lib)))",
+		.test = alg_test_aead,
 		.fips_allowed = 1,
+		.suite = {
+			.aead = __VECS(hmac_sha1_aes_ctr_rfc3686_tv_temp)
+		}
 	}, {
 		.alg = "authenc(hmac(sha224),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha224-lib,cbc(aes-lib))",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 1c69c11c0cdb..4efc22899fec 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -14873,6 +14873,227 @@ static const struct aead_testvec hmac_sha1_aes_cbc_tv_temp[] = {
 	},
 };
 
+static const struct aead_testvec hmac_sha1_aes_ctr_rfc3686_tv_temp[] = {
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
+			  "\x00\x00\x00\x00"
+			  "\xae\x68\x52\xf8\x12\x10\x67\xcc"
+			  "\x4b\xf7\xa5\x76\x55\x77\xf3\x9e"
+			  "\x00\x00\x00\x30",
+		.klen	= 8 + 20 + 20,
+		.iv	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.assoc	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\xe4\x09\x5d\x4f\xb7\xa7\xb3\x79"
+			  "\x2d\x61\x75\xa3\x26\x13\x11\xb8"
+			  "\x70\xdc\x6b\x62\x43\xa1\x2f\x08"
+			  "\xf1\xec\x93\x7d\x69\xb2\x8e\x1f"
+			  "\x0a\x97\x39\x86",
+		.clen	= 16 + 20,
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
+			  "\x30\x31\x32\x33"
+			  "\x7e\x24\x06\x78\x17\xfa\xe0\xd7"
+			  "\x43\xd6\xce\x1f\x32\x53\x91\x63"
+			  "\x00\x6c\xb6\xdb",
+		.klen	= 8 + 20 + 20,
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
+			  "\x6b\x7b\x4d\x39\x36\x1c\x12\x5f"
+			  "\x72\xd2\x88\xb2\x26\xa6\xa6\xb5"
+			  "\x1d\x3a\x49\xa6",
+		.clen	= 32 + 20,
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
+			  "\x22\x33\x44\x55"
+			  "\x76\x91\xbe\x03\x5e\x50\x20\xa8"
+			  "\xac\x6e\x61\x85\x29\xf9\xa0\xdc"
+			  "\x00\xe0\x01\x7b",
+		.klen	= 8 + 20 + 20,
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
+			  "\x2c\x86\xa0\x90\x8e\xc1\x02\x1d"
+			  "\x51\xdc\xd6\x21\xc7\x30\xcc\x32"
+			  "\x38\x55\x47\x64",
+		.clen	= 36 + 20,
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
+			  "\x00\x00\x00\x00"
+			  "\x16\xaf\x5b\x14\x5f\xc9\xf5\x79"
+			  "\xc1\x75\xf9\x3e\x3b\xfb\x0e\xed"
+			  "\x86\x3d\x06\xcc\xfd\xb7\x85\x15"
+			  "\x00\x00\x00\x48",
+		.klen	= 8 + 20 + 28,
+		.iv	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.assoc	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x4b\x55\x38\x4f\xe2\x59\xc9\xc8"
+			  "\x4e\x79\x35\xa0\x03\xcb\xe9\x28"
+			  "\xe9\x4e\x49\xf0\x6b\x8d\x58\x2b"
+			  "\x26\x7f\xf3\xab\xeb\x2f\x74\x2f"
+			  "\x45\x43\x64\xc1",
+		.clen	= 16 + 20,
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
+			  "\x30\x31\x32\x33"
+			  "\x7c\x5c\xb2\x40\x1b\x3d\xc3\x3c"
+			  "\x19\xe7\x34\x08\x19\xe0\xf6\x9c"
+			  "\x67\x8c\x3d\xb8\xe6\xf6\xa9\x1a"
+			  "\x00\x96\xb0\x3b",
+		.klen	= 8 + 20 + 28,
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
+			  "\xab\xc4\xfa\x6d\x20\xe1\xce\x72"
+			  "\x0e\x92\x4e\x97\xaa\x4d\x30\x84"
+			  "\xb6\xd8\x4d\x3b",
+		.clen	= 32 + 20,
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
+			  "\x00\x00\x00\x00"
+			  "\x77\x6b\xef\xf2\x85\x1d\xb0\x6f"
+			  "\x4c\x8a\x05\x42\xc8\x69\x6f\x6c"
+			  "\x6a\x81\xaf\x1e\xec\x96\xb4\xd3"
+			  "\x7f\xc1\xd6\x89\xe6\xc1\xc1\x04"
+			  "\x00\x00\x00\x60",
+		.klen	= 8 + 20 + 36,
+		.iv	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.assoc	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x14\x5a\xd0\x1d\xbf\x82\x4e\xc7"
+			  "\x56\x08\x63\xdc\x71\xe3\xe0\xc0"
+			  "\x3d\x6c\x23\x27\xda\x0e\x7f\x29"
+			  "\xfd\x8d\x3c\x1b\xf7\x7a\x63\xd9"
+			  "\x7e\x0f\xe9\xf6",
+		.clen	= 16 + 20,
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
+			  "\x30\x31\x32\x33"
+			  "\xf6\xd6\x6d\x6b\xd5\x2d\x59\xbb"
+			  "\x07\x96\x36\x58\x79\xef\xf8\x86"
+			  "\xc6\x6d\xd5\x1a\x5b\x6a\x99\x74"
+			  "\x4b\x50\x59\x0c\x87\xa2\x38\x84"
+			  "\x00\xfa\xac\x24",
+		.klen	= 8 + 20 + 36,
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
+			  "\xe7\xee\x22\xa4\xdd\xbf\x5d\x44"
+			  "\x3b\x43\x1c\x69\x55\x11\xd5\xad"
+			  "\x14\x5f\x44\xa6",
+		.clen	= 32 + 20,
+	},
+};
+
 static const struct aead_testvec hmac_sha1_ecb_cipher_null_tv_temp[] = {
 	{ /* Input data from RFC 2410 Case 1 */
 #ifdef __LITTLE_ENDIAN
-- 
2.47.3


