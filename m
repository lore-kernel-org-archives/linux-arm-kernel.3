Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E86FD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 15:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tflfusIQIkPYU4M0eDm7R9yz7A25NeFR7a/iVtAC7EQ=; b=mJZSWXDsxNcHhjn4uXhFFKbqsr
	zCqJ+z1JZ0/EnSnhZMx+O5rbry++CgiAeSPzLFe5PkDakwUauq3cw6lukp62fPhFq/a4QN+nbLRA4
	na9LXy2exNEqqcXxn5Y4nYCvuzyLTGgWH/57OzXfVatm91TNjButj7yiMhhSRSGgyIkSoHBWD0Yom
	9XMpciPqsCwwnIYiCyQyYnUqY6tR1UiUvtdxVM0j8w1piQIGEdoy4U3p0V8+ULOxMo7HhpS4YDJ5Z
	FP4BR2kzycgxwrK6G4KBJ4oQB1RCgSAqLJ0j2XPxtsNCr69Rsc0x3XkVhtxLS/kYWLcT0Bj9UVSJs
	eNnp77lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwj81-0000000Bcrb-1vfA;
	Sun, 01 Mar 2026 15:54:45 +0000
Received: from smtpo67.poczta.onet.pl ([141.105.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwj7z-0000000Bcq0-0riD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 15:54:44 +0000
Received: from laptop-olek.lan (83.24.116.171.ipv4.supernova.orange.pl [83.24.116.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: aleksaander@onet.pl)
	by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4fP67n5s3xz1yNh;
	Sun,  1 Mar 2026 16:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onet.pl; s=2011;
	t=1772380475; bh=tflfusIQIkPYU4M0eDm7R9yz7A25NeFR7a/iVtAC7EQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjrNZH9g8MUhWOQQDzs1FWOI4wMYXrExoQDaguAp3F7gLAFDp04SmADRwMR5gHEdj
	 C/BXcAxLDjcADsOU2cEqO765AzMeOln2QeVjKGzvZvZVxWFGbICNH/BFTSoCyAzc8P
	 Sr5H4RRqRCIddHGjbRt5sSm5qdjrMkRm9MTENKFs=
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
Subject: [PATCH 4/5] crypto: testmgr - Add test vectors for authenc(hmac(sha384),rfc3686(ctr(aes)))
Date: Sun,  1 Mar 2026 16:53:41 +0100
Message-ID: <20260301155351.5840-4-aleksaander@onet.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301155351.5840-1-aleksaander@onet.pl>
References: <20260301155351.5840-1-aleksaander@onet.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_075443_564833_795C4C1A 
X-CRM114-Status: GOOD (  12.64  )
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
vectors and adding HMAC(SHA384) computed with software implementation.
Then, the results were double-checked on Mediatek MT7986 (safexcel).
Platform pass self-tests.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 crypto/testmgr.c |   6 +-
 crypto/testmgr.h | 263 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 268 insertions(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index fcc53b5db653..ae969d196cf0 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4246,8 +4246,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		}
 	}, {
 		.alg = "authenc(hmac(sha384),rfc3686(ctr(aes)))",
-		.test = alg_test_null,
+		.generic_driver = "authenc(hmac-sha384-lib,rfc3686(ctr(aes-generic)))",
+		.test = alg_test_aead,
 		.fips_allowed = 1,
+		.suite = {
+			.aead = __VECS(hmac_sha384_aes_ctr_rfc3686_tv_temp)
+		}
 	}, {
 		.alg = "authenc(hmac(sha512),cbc(aes))",
 		.generic_driver = "authenc(hmac-sha512-lib,cbc(aes-lib))",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 9617a76df3db..7fa97fe5fd68 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -16489,6 +16489,269 @@ static const struct aead_testvec hmac_sha384_aes_cbc_tv_temp[] = {
 	},
 };
 
+static const struct aead_testvec hmac_sha384_aes_ctr_rfc3686_tv_temp[] = {
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
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\xae\x68\x52\xf8\x12\x10\x67\xcc"
+			  "\x4b\xf7\xa5\x76\x55\x77\xf3\x9e"
+			  "\x00\x00\x00\x30",
+		.klen	= 8 + 48 + 20,
+		.iv	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.assoc	= "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\xe4\x09\x5d\x4f\xb7\xa7\xb3\x79"
+			  "\x2d\x61\x75\xa3\x26\x13\x11\xb8"
+			  "\x45\x51\x59\x72\x16\xd3\xc6\x15"
+			  "\x25\x1e\xe8\x92\x2e\x47\x52\xcc"
+			  "\x91\x9c\x24\xef\x11\xb2\x53\x00"
+			  "\x10\x20\x43\x06\xe2\x35\x88\x9e"
+			  "\x18\x32\x5a\x79\x7d\x73\x7e\x89"
+			  "\xfe\xa1\xda\xa4\x86\xc4\x2a\x04",
+		.clen	= 16 + 48,
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
+			  "\x40\x41\x42\x43\x44\x45\x46\x47"
+			  "\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f"
+			  "\x7e\x24\x06\x78\x17\xfa\xe0\xd7"
+			  "\x43\xd6\xce\x1f\x32\x53\x91\x63"
+			  "\x00\x6c\xb6\xdb",
+		.klen	= 8 + 48 + 20,
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
+			  "\x83\x65\x32\x1e\x6b\x60\xe6\x4a"
+			  "\xe2\xab\x52\x2b\xa6\x70\x3a\xfa"
+			  "\xd2\xec\x83\xe4\x31\x0c\x28\x40"
+			  "\x9b\x5e\x18\xa4\xdc\x48\xb8\x56"
+			  "\x33\xab\x7f\x2b\xaf\xe4\x3a\xe3"
+			  "\x8a\x61\xf6\x22\xb4\x6b\xfe\x7d",
+		.clen	= 32 + 48,
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
+			  "\x33\x44\x55\x66\x77\x88\x99\xaa"
+			  "\xbb\xcc\xdd\xee\xff\x11\x22\x33"
+			  "\x76\x91\xbe\x03\x5e\x50\x20\xa8"
+			  "\xac\x6e\x61\x85\x29\xf9\xa0\xdc"
+			  "\x00\xe0\x01\x7b",
+		.klen	= 8 + 48 + 20,
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
+			  "\x4a\xaa\xad\x3b\x3b\xb6\x9a\xba"
+			  "\xa1\x7b\xc6\xce\x96\xc3\xff\x67"
+			  "\xf3\x0c\x33\x57\xf0\x51\x24\x08"
+			  "\xed\x4f\x6a\x9c\x22\x42\xbd\x18"
+			  "\x97\x74\x68\x36\x00\xf1\x69\x3a"
+			  "\x18\x77\x40\xf0\x56\xba\xba\xe0",
+		.clen	= 36 + 48,
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
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x16\xaf\x5b\x14\x5f\xc9\xf5\x79"
+			  "\xc1\x75\xf9\x3e\x3b\xfb\x0e\xed"
+			  "\x86\x3d\x06\xcc\xfd\xb7\x85\x15"
+			  "\x00\x00\x00\x48",
+		.klen	= 8 + 48 + 28,
+		.iv	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.assoc	= "\x36\x73\x3c\x14\x7d\x6d\x93\xcb",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x4b\x55\x38\x4f\xe2\x59\xc9\xc8"
+			  "\x4e\x79\x35\xa0\x03\xcb\xe9\x28"
+			  "\x36\xd6\xc7\x55\xac\xb6\x0b\x14"
+			  "\x95\x71\xf9\x86\x30\xe3\x96\xc3"
+			  "\x76\x85\x6d\xa5\x06\xed\x6f\x34"
+			  "\xcc\x1f\xcc\x2d\x88\x06\xb0\x1d"
+			  "\xbe\xd9\xa2\xd3\x64\xf1\x33\x03"
+			  "\x13\x50\x8f\xae\x61\x2d\x82\xb8",
+		.clen	= 16 + 48,
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
+			  "\x40\x41\x42\x43\x44\x45\x46\x47"
+			  "\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f"
+			  "\x7c\x5c\xb2\x40\x1b\x3d\xc3\x3c"
+			  "\x19\xe7\x34\x08\x19\xe0\xf6\x9c"
+			  "\x67\x8c\x3d\xb8\xe6\xf6\xa9\x1a"
+			  "\x00\x96\xb0\x3b",
+		.klen	= 8 + 48 + 28,
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
+			  "\x80\x12\x67\x22\xf2\x4d\x9b\xbf"
+			  "\xdc\x38\xd3\xaa\x12\xc0\x58\x1a"
+			  "\x9a\x62\x6e\x42\x3d\x44\x63\xdd"
+			  "\xee\x7e\xe3\xa3\xdf\x2a\x65\x05"
+			  "\xd0\xc1\xd2\x54\x55\x35\x5c\xc7"
+			  "\xb0\xb5\xb1\x36\xe0\x0b\xaf\x72",
+		.clen	= 32 + 48,
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
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00"
+			  "\x77\x6b\xef\xf2\x85\x1d\xb0\x6f"
+			  "\x4c\x8a\x05\x42\xc8\x69\x6f\x6c"
+			  "\x6a\x81\xaf\x1e\xec\x96\xb4\xd3"
+			  "\x7f\xc1\xd6\x89\xe6\xc1\xc1\x04"
+			  "\x00\x00\x00\x60",
+		.klen	= 8 + 48 + 36,
+		.iv	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.assoc	= "\xdb\x56\x72\xc9\x7a\xa8\xf0\xb2",
+		.alen	= 8,
+		.ptext	= "Single block msg",
+		.plen	= 16,
+		.ctext	= "\x14\x5a\xd0\x1d\xbf\x82\x4e\xc7"
+			  "\x56\x08\x63\xdc\x71\xe3\xe0\xc0"
+			  "\xb1\x7b\xb1\xec\xca\x94\x55\xc4"
+			  "\x3f\x2b\xb1\x70\x04\x91\xf5\x9d"
+			  "\x1a\xc0\xe1\x2a\x93\x5f\x96\x2a"
+			  "\x12\x85\x38\x36\xe1\xb2\xe9\xf0"
+			  "\xf2\x6e\x5d\x81\xcc\x49\x07\x9c"
+			  "\x5b\x88\xc8\xcc\xc4\x21\x4f\x32",
+		.clen	= 16 + 48,
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
+			  "\x40\x41\x42\x43\x44\x45\x46\x47"
+			  "\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f"
+			  "\xf6\xd6\x6d\x6b\xd5\x2d\x59\xbb"
+			  "\x07\x96\x36\x58\x79\xef\xf8\x86"
+			  "\xc6\x6d\xd5\x1a\x5b\x6a\x99\x74"
+			  "\x4b\x50\x59\x0c\x87\xa2\x38\x84"
+			  "\x00\xfa\xac\x24",
+		.klen	= 8 + 48 + 36,
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
+			  "\xd6\x96\xbb\x12\x39\xc4\x4d\xe2"
+			  "\x4c\x02\xe7\x1f\xdc\xb2\xb1\x57"
+			  "\x38\x0d\xdd\x13\xb3\x89\x57\x9e"
+			  "\x1f\xb5\x48\x32\xc4\xd3\x9d\x1f"
+			  "\x68\xab\x8d\xc6\xa8\x05\x3a\xc2"
+			  "\x87\xaf\x23\xb3\xe4\x1b\xde\xb3",
+		.clen	= 32 + 48,
+	},
+};
+
 static const struct aead_testvec hmac_sha512_aes_cbc_tv_temp[] = {
 	{ /* RFC 3602 Case 1 */
 #ifdef __LITTLE_ENDIAN
-- 
2.47.3


