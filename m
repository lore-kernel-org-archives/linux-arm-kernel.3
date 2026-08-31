Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8839CC624CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ddNYRlzvjA+IbHZuoSgXjNf2dnTqeGfZr/H4aIQxfQ=; b=itNv4wihitR0WZQY4vAdgRKE3C
	eU3QjL8RzZ/nV9TpepLzZUZ+EhwOZUkR+qshgkJZArPHa4I8KiXDjZuPD7DMYo7fxsQDGdUgesQ4Y
	i4YwZQkP6WW9zcOtZ+YWUmDCssiq7JcE7AyQW5l/qC3hyzfKR2k9KZnVpvTKqr+wcwyvZiWKfQyIc
	8RTTkylCblY2R5XQ7rCd0m1YgORczay+FQfFGk4uX+VNxSxfHAfj8hePzf5qgbEhRasmsjRpm5/Yz
	HozHWRnt7wcbB4fKDtkvW8K2kaO22vR3MUr7fiek1O0hDe9pXGfo6w1CpDISk0wYrtrXgUwgUKB1a
	2ymJ+AMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Pj-00000009YGo-1htg;
	Mon, 31 Aug 2026 13:51:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12Pa-00000009YAT-3se8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA076429EB;
	Mon, 31 Aug 2026 13:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECD01F00A3E;
	Mon, 31 Aug 2026 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184258;
	bh=1ddNYRlzvjA+IbHZuoSgXjNf2dnTqeGfZr/H4aIQxfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UEN75hpmcR7pzwb8hhUbCWR2yuaOBCanKQk5ea1zbhxojJ2YJrZAl51wAx4Gj4AbI
	 RhZRto428ZpdTi0Uxs95y23wEDthfAOFMdFiY2br6TLO6A0S2qkChGi2fyH7eyDC27
	 8vcE/fexAF17ilHe5pAmKUwBjjsE/o42Iqb5k1ykkWVtTibfLsOj7kLC5HJpLrUMVG
	 zN8XPc1HcgJFa26Ev3QCnhH21183tvWOYAQTqu9FILo3L/KwEl/hJye+Evj0bLGTfo
	 DWNFVK5Kd0y0Cwf5ABOto1lGxUzLvrpSHWIWp0VNDpU4NSoNdxTxDmgCqAjDVKer5I
	 Wv779qxeMupRQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] crypto: testmgr - allow authenc(hmac(sha{256,384}),cts(cbc(aes))) in FIPS mode
Date: Mon, 31 Aug 2026 09:30:14 -0400
Message-ID: <20260831133314.4125787-586-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
Content-Type: text/plain; charset=UTF-8
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

From: Ilya Dryomov <idryomov@gmail.com>

[ Upstream commit 6b7e97752854b1f7bccc41864428ea3b55c53cde ]

hmac(sha256), hmac(sha384) and cts(cbc(aes)) algorithms have been
marked as FIPS allowed for years.  Mark the respective authenc()
constructions per RFC 8009 ("AES Encryption with HMAC-SHA2 for
Kerberos 5") as such as well.

SP 800-57 Part 3 Rev. 1 from Jan 2015 [1] links the draft of what
became RFC 8009 in Oct 2016 as approved in section 6.3 Procurement
Guidance (item/recommendation 3).

[1] https://csrc.nist.gov/pubs/sp/800/57/pt3/r1/final

Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The background git searches finished and match what we already had:

- **Subject search** — No commit with “allow authenc” in this tree.
  Related hits are krb5/CTS/RFC 8009 work (`d1775a177f7f3`, SUNRPC RFC
  8009 KUnit tests, etc.).
- **Krb5 test vectors** — Added in `1b80b6f446ed2` (“crypto/krb5: Test
  manager data”), committed **2025-03-02**. That’s when the two
  `authenc(...,cts(cbc(aes)))` entries landed without `fips_allowed`.
- **Commit hash search** — Ilya Dryomov’s testmgr patch isn’t in 6.18.44
  yet; only his unrelated Ceph/RBD commits show up.

That supports the earlier **YES** verdict: the gap is in this tree, the
fix is a small metadata correction, and it unblocks RFC 8009 Kerberos
crypto in FIPS mode.

 crypto/testmgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 6a490aaa71b9a..9a4d75782a486 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4264,6 +4264,7 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha256),cts(cbc(aes)))",
 		.generic_driver = "authenc(hmac-sha256-lib,cts(cbc(aes-generic)))",
 		.test = alg_test_aead,
+		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(krb5_test_aes128_cts_hmac_sha256_128)
 		}
@@ -4293,6 +4294,7 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha384),cts(cbc(aes)))",
 		.generic_driver = "authenc(hmac-sha384-lib,cts(cbc(aes-generic)))",
 		.test = alg_test_aead,
+		.fips_allowed = 1,
 		.suite = {
 			.aead = __VECS(krb5_test_aes256_cts_hmac_sha384_192)
 		}
-- 
2.53.0


