Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F89D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TZLTOkfm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6/6xUUOjwtL1FwuXpKSTtDVBiayCB2HCPjgP1T7L0+g=; b=TZLTOkfm4XRIXdz3cqCXevDUwp
	JPm7XYy1ETsq/F/o1izDQh5vkN9gczzhtTADlOR3SL5wCliziRLH2wIkf57xiImq8HPBMyI8IbGsa
	Xsl8F07mPpQ5VEU/FJUrLYpQQVLfKSsRL3nUtUGrC8SdKMcOrOmgdmskSUPF0Zot/nI0fiY9nEzuk
	eQhimTH1dOxXzrmvjd9T7+xxmui5F0/U330IPGLSs3f9PXAqbODaUn6+19ad+9WVLXLm0B9hLPEYt
	ezkTWuD6EF6MGHkzEsN/XrnMOkbB/HCBS28RHOQTniWD+0B2+I82VC5BemSqfxVLKAfE9BXLxzU76
	Lc1yBoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO81k-00000001FQO-0eZi;
	Tue, 03 Nov 2026 06:29:48 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO81h-00000001FPp-24cF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 06:29:47 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACXoZJNf+lqD145AA--.419S2;
	Tue, 03 Nov 2026 14:29:33 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: clabbe@baylibre.com,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	linusw@kernel.org,
	kaloz@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: ixp4xx - Free the fallback cipher if context initialization fails
Date: Tue,  3 Nov 2026 06:29:42 +0000
Message-Id: <20261103062942.1021598-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXoZJNf+lqD145AA--.419S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw17Gw43Wr43tw1kAFW7CFg_yoW8CF4rpF
	WrCrWkKrWDJF17Ca4xJFWrCFyfJ3yrAayakw48G340kFn3urZ5GFW2yr4jkrZ5JFyrGFyx
	AF4vvryUJwnrXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUogAwDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUAA2rpWfV5NwAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_222945_928090_371C953B 
X-CRM114-Status: GOOD (  11.10  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_tfm_ablk() allocates a fallback skcipher before calling init_tfm().
If allocating either security association context fails, init_tfm()
returns an error and the fallback is left allocated. The crypto core
does not call the algorithm exit callback after a failed initialization,
so exit_tfm_ablk() cannot release it.

Free the fallback cipher when init_tfm() fails. The security association
contexts are already unwound by init_tfm().

Fixes: dfb098d692ea ("crypto: ixp4xx - fallback when having more than one SG")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
index 33e8e887a415..6af50a01c96f 100644
--- a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
+++ b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
@@ -635,6 +635,7 @@ static int init_tfm_ablk(struct crypto_skcipher *tfm)
 	struct crypto_tfm *ctfm = crypto_skcipher_tfm(tfm);
 	struct ixp_ctx *ctx = crypto_tfm_ctx(ctfm);
 	const char *name = crypto_tfm_alg_name(ctfm);
+	int ret;
 
 	ctx->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(ctx->fallback_tfm)) {
@@ -649,7 +650,11 @@ static int init_tfm_ablk(struct crypto_skcipher *tfm)
 		 );
 
 	crypto_skcipher_set_reqsize(tfm, sizeof(struct ablk_ctx) + crypto_skcipher_reqsize(ctx->fallback_tfm));
-	return init_tfm(crypto_skcipher_tfm(tfm));
+	ret = init_tfm(crypto_skcipher_tfm(tfm));
+	if (ret)
+		crypto_free_skcipher(ctx->fallback_tfm);
+
+	return ret;
 }
 
 static int init_tfm_aead(struct crypto_aead *tfm)
-- 
2.34.1


