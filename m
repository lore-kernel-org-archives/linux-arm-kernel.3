Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6B1C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipMLusvU7BnRzRTdTKY1oAgcz8H2nCFjKzbRLMEpEi0=; b=DbwowoCbcdcM5WrTGhUZcxZpZo
	ak116brudMaRmbUHaVsXoHQVgHiUTs+Apo+iHmGoXcRkh4Q+ridQxQ80T0cU4OmQW3ch7a8mlxo9s
	X0b6l4z5JvkUNTjT3ghG94w1eRGORnKiprJSRkDpw71XBNZIHKC7BZj26Uc+8VjgXzf+1tWw8w+AD
	NcCr3W1f2tszTtN/VkHmvAMX9fy8OO4bGCBZU7hhamEKjJkFAzEVsWVw3D8JuK0l3YYUC9LzH6KjY
	XWJFuumwWuFdpViuvywyVERhLmTUw5IPcQGdyGmOiPCLA1fgo9l3+klh2MNwwZl58JNkl+dJ8FmR4
	F525L0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEdi-00000002O9w-0tJy;
	Mon, 30 Jun 2025 13:33:42 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEXq-00000002N9d-41aD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:27:40 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bW6Nr3lz4z29dyB;
	Mon, 30 Jun 2025 21:25:48 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E36F1401E9;
	Mon, 30 Jun 2025 21:27:33 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 21:27:32 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
	<tianjia.zhang@linux.alibaba.com>, Dan Carpenter <dan.carpenter@linaro.org>
CC: <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>, Gu Bowen <gubowen5@huawei.com>
Subject: [PATCH RFC 4/4] crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
Date: Mon, 30 Jun 2025 21:39:34 +0800
Message-ID: <20250630133934.766646-5-gubowen5@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.33]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_062739_382569_7EDFDB64 
X-CRM114-Status: GOOD (  17.01  )
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

The digest is calculated during certificate parsing, but the public key of
the signing certificate need to be obtained before calculating the digest
to correctly calculate the Z value.

By attempting to obtain the public key before computing the digest, the
feasibility of doing so was tested and verified.

Signed-off-by: Gu Bowen <gubowen5@huawei.com>
---
 certs/system_keyring.c                   |  8 +++++++
 crypto/asymmetric_keys/public_key.c      |  7 ++++++
 crypto/asymmetric_keys/x509_public_key.c | 27 +++++++++++++++++++++++-
 include/keys/system_keyring.h            | 13 ++++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 9de610bf1f4b..adceb3f0928c 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -32,6 +32,14 @@ extern __initconst const u8 system_certificate_list[];
 extern __initconst const unsigned long system_certificate_list_size;
 extern __initconst const unsigned long module_cert_size;
 
+struct key *find_asymmetric_pub_key(const struct asymmetric_key_id *id_0,
+				    const struct asymmetric_key_id *id_1,
+				    const struct asymmetric_key_id *id_2)
+{
+	return find_asymmetric_key(builtin_trusted_keys, id_0,
+				   id_1, id_2, false);
+}
+
 /**
  * restrict_link_by_builtin_trusted - Restrict keyring addition by built-in CA
  * @dest_keyring: Keyring being linked to.
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index e5b177c8e842..ca0bb32e093a 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -134,6 +134,13 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME, "%s(%s)",
 			     encoding, pkey->pkey_algo);
 		return n >= CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
+	} else if (strcmp(pkey->pkey_algo, "sm2") == 0) {
+		if (strcmp(encoding, "raw") != 0)
+			return -EINVAL;
+		if (!hash_algo)
+			return -EINVAL;
+		if (strcmp(hash_algo, "sm3") != 0)
+			return -EINVAL;
 	} else if (strcmp(pkey->pkey_algo, "ecrdsa") == 0) {
 		if (strcmp(encoding, "raw") != 0)
 			return -EINVAL;
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 8409d7d36cb4..62bbc423d632 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -7,6 +7,7 @@
 
 #define pr_fmt(fmt) "X.509: "fmt
 #include <crypto/hash.h>
+#include <crypto/sm2.h>
 #include <keys/asymmetric-parser.h>
 #include <keys/asymmetric-subtype.h>
 #include <keys/system_keyring.h>
@@ -28,6 +29,8 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	struct shash_desc *desc;
 	size_t desc_size;
 	int ret;
+	struct key *key;
+	struct public_key *pkey;
 
 	pr_devel("==>%s()\n", __func__);
 
@@ -63,8 +66,30 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	desc->tfm = tfm;
 
-	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
+	if (strcmp(cert->pub->pkey_algo, "sm2") == 0) {
+		if (!sig->auth_ids[0] && !sig->auth_ids[1] && !sig->auth_ids[2])
+			return -ENOKEY;
+
+		key = find_asymmetric_pub_key(sig->auth_ids[0], sig->auth_ids[1],
+					      sig->auth_ids[2]);
+		if (IS_ERR(key))
+			pkey = cert->pub;
+		else
+			pkey = key->payload.data[asym_crypto];
+
+		ret = strcmp(sig->hash_algo, "sm3") != 0 ? -EINVAL :
+			crypto_shash_init(desc) ?:
+			sm2_compute_z_digest(desc, pkey->key,
+					     pkey->keylen, sig->digest) ?:
+			crypto_shash_init(desc) ?:
+			crypto_shash_update(desc, sig->digest,
+					    sig->digest_size) ?:
+			crypto_shash_finup(desc, cert->tbs, cert->tbs_size,
+					   sig->digest);
+	} else {
+		ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
 				  sig->digest);
+	}
 
 	if (ret < 0)
 		goto error_2;
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index a6c2897bcc63..21b466e5d2f3 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -10,6 +10,8 @@
 
 #include <linux/key.h>
 
+struct asymmetric_key_id;
+
 enum blacklist_hash_type {
 	/* TBSCertificate hash */
 	BLACKLIST_HASH_X509_TBS = 1,
@@ -19,6 +21,10 @@ enum blacklist_hash_type {
 
 #ifdef CONFIG_SYSTEM_TRUSTED_KEYRING
 
+extern struct key *find_asymmetric_pub_key(const struct asymmetric_key_id *id_0,
+					   const struct asymmetric_key_id *id_1,
+					   const struct asymmetric_key_id *id_2);
+
 extern int restrict_link_by_builtin_trusted(struct key *keyring,
 					    const struct key_type *type,
 					    const union key_payload *payload,
@@ -30,6 +36,13 @@ int restrict_link_by_digsig_builtin(struct key *dest_keyring,
 extern __init int load_module_cert(struct key *keyring);
 
 #else
+static inline struct key *find_asymmetric_pub_key(const struct asymmetric_key_id *id_0,
+						  const struct asymmetric_key_id *id_1,
+						  const struct asymmetric_key_id *id_2)
+{
+	return NULL;
+}
+
 #define restrict_link_by_builtin_trusted restrict_link_reject
 #define restrict_link_by_digsig_builtin restrict_link_reject
 
-- 
2.25.1


