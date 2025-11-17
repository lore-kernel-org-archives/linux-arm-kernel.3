Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7231ACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EKOO8XcxSZ0+vg9AvoUfk3Tgt5QFmAZQ9PUVXdNHUKA=; b=sHr1bzbII3nLqHlYgz4a+a9QE4
	mDSN5vGdjjz0W+DAXCo+hVeOcG6MUxLmvZo8So2R2vk6L4n9fxrAArDSvxajaFwP+Q+dkj9Ie+fG3
	Krr527/gGUvHmwnGqxZz9UQJrbSiUnj+j0puiiKjPqJ7CNSHwJQCPE0ibmQyrDFt6oueZimqIiWy3
	GVGNOZMVkzIa1/WW4a6BDEmPwIy8s1BTv69nsbHTAA7Zv+zGomyac2o+ZlN0JG6T7Lo0vvRzmWZVy
	FjcqBjQYcYNrtPN4J1Ja8efXbK/ktyY5zIDnka1HdVrs80YX8u1YYCdZGbB7Cb/ePhRWEY8PvZg4D
	9hVoCzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxg3-0000000G06l-2f1V;
	Mon, 17 Nov 2025 11:45:47 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxg0-0000000G043-22lr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:45:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763379935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EKOO8XcxSZ0+vg9AvoUfk3Tgt5QFmAZQ9PUVXdNHUKA=;
	b=wRBTKJNqHgHPZEHOiePGSbwWQP7B3UZy9nbCHlkHQGtRIVWN5j5KQCDZrMcAsYodE4/9q8
	ZfKpdU4KCBZMtTorUqxKnspgQ8WNYEzLcp3coYVcjmw+KEECZeIYAE9mVWgG1jP3YghSqa
	ywghcSpqlzL357FRpM4kH4Ps/QAglqM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: testmgr - Add missing DES weak and semi-weak key tests
Date: Mon, 17 Nov 2025 12:44:26 +0100
Message-ID: <20251117114426.99713-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_034544_897586_EB505C6C 
X-CRM114-Status: GOOD (  10.47  )
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

Ever since commit da7f033ddc9f ("crypto: cryptomgr - Add test
infrastructure"), the DES test suite has tested only one of the four
weak keys and none of the twelve semi-weak keys.

DES has four weak keys and twelve semi-weak keys, and the kernel's DES
implementation correctly detects and rejects all of these keys when the
CRYPTO_TFM_REQ_FORBID_WEAK_KEYS flag is set. However, only a single weak
key was being tested. Add tests for all 16 weak and semi-weak keys.

While DES is deprecated, it is still used in some legacy protocols, and
weak/semi-weak key detection should be tested accordingly.

Tested on arm64 with cryptographic self-tests.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/testmgr.h | 120 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 268231227282..bd8dbd9b7fc7 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -9023,6 +9023,126 @@ static const struct cipher_testvec des_tv_template[] = {
 		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
 		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
 		.len	= 8,
+	}, { /* Weak key */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\xe0\xe0\xe0\xf1\xf1\xf1\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Weak key */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\x1f\x1f\x1f\x0e\x0e\x0e\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Weak key */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 1a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x01\xfe\x01\xfe\x01\xfe\x01\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 1b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\x01\xfe\x01\xfe\x01\xfe\x01",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 2a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\xe0\x1f\xe0\x0e\xf1\x0e\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 2b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\x1f\xe0\x1f\xf1\x0e\xf1\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 3a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x01\xe0\x01\xe0\x01\xf1\x01\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 3b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\x01\xe0\x01\xf1\x01\xf1\x01",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 4a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\xfe\x1f\xfe\x0e\xfe\x0e\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 4b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\x1f\xfe\x1f\xfe\x0e\xfe\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 5a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x01\x1f\x01\x1f\x01\x0e\x01\x0e",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 5b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\x1f\x01\x1f\x01\x0e\x01\x0e\x01",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 6a */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xe0\xfe\xe0\xfe\xf1\xfe\xf1\xfe",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
+	}, { /* Semi-weak key pair 6b */
+		.setkey_error = -EINVAL,
+		.wk	= 1,
+		.key	= "\xfe\xe0\xfe\xe0\xfe\xf1\xfe\xf1",
+		.klen	= 8,
+		.ptext	= "\x01\x23\x45\x67\x89\xab\xcd\xe7",
+		.ctext	= "\xc9\x57\x44\x25\x6a\x5e\xd3\x1d",
+		.len	= 8,
 	}, { /* Two blocks -- for testing encryption across pages */
 		.key	= "\x01\x23\x45\x67\x89\xab\xcd\xef",
 		.klen	= 8,
-- 
2.51.1


