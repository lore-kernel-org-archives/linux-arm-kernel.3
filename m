Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6520CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnzIFlLWauvFdrFL/nEuymma/9XIyB0rDJHsiXxQNgw=; b=4CYQPe9Q6foDU5RksnD9mi4g28
	WUlK4URlnR3qllSab8APjlv/+pAHObdXBjYcZHSUOMht91nsNYDn61J8XKY1zKm6pZ4ybCsnknHWb
	LWTxmIKeLv+CZOOO7Ivxd22CQddCJurKEechvYr9EGwGgxZ0P15nas9W7KNaWvoSH6yW5qExGHxMx
	TooGTFmHpO88o31La/mwE42aW7YyyFVP7JZSKmUFRnv2fTOFSDm6QMz77rhJMRfR9t5rdsxDBGWLC
	4HIg6KDD5VutS82nQblxS/sdm6RTQPcIaxQ41sJfNdtHZ9X6qhsDy0jlCSiRk6IYG1E2R12DG1w3C
	0iYTxukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9a-0000000BZPg-1gAJ;
	Mon, 20 Oct 2025 00:53:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9X-0000000BZNU-1EgS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 067BA45804;
	Mon, 20 Oct 2025 00:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D195C116D0;
	Mon, 20 Oct 2025 00:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921614;
	bh=OaQGEhSD9l9BZYpyT3Hv3bwzyb+UiSiWBVKTKVVAllo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YX5RdWElee1yHQDh5fsUq6GWg1Nyxlvce5OuFgBg/ky8IQPLykEwhhWoLE5IhtVLg
	 5hLsqTrpveFOqYKjfgsyqajSVX2R/iWNoP7ETZfTawxlkIOYRQEqDeFlE91g8WqR8V
	 FJf9Kkm2JL3ouQz6OUTors7MU11lcrhzYH9QJzGpX5MftLgDDcKm1KD19dbzTMNrBR
	 FED8CKqORxuobkwstChIcHDajbNukiay28cUsmaON2H8ZqaxUQIZY4gn2Mr9Ra4ZAF
	 gVUe+9uzBP1ALLonpQfDnX7eAAZtnz8zsKJwghxufKpKsurRq7j/84rXSrR1QuxX03
	 35s6H2ghg/ytQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/17] lib/crypto: sha3: Use appropriate conversions in sha3_keccakf_generic()
Date: Sun, 19 Oct 2025 17:50:28 -0700
Message-ID: <20251020005038.661542-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_175335_562655_38A0413C 
X-CRM114-Status: GOOD (  11.27  )
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

For converting from little endian to CPU endian, use le64_to_cpus().
For converting from CPU endian to little endian, use cpu_to_le64s().

No functional change, but this makes the code clearer.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index 2c292b0b3db34..8f08e7b8f4521 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -168,16 +168,16 @@ static void sha3_keccakf_rounds_generic(struct sha3_state *state)
  * loops are no-ops on LE machines and will be optimised away.
  */
 static void sha3_keccakf_generic(struct sha3_state *state)
 {
 	for (int  i = 0; i < ARRAY_SIZE(state->st); i++)
-		cpu_to_le64s(&state->st[i]);
+		le64_to_cpus(&state->st[i]);
 
 	sha3_keccakf_rounds_generic(state);
 
 	for (int  i = 0; i < ARRAY_SIZE(state->st); i++)
-		le64_to_cpus(&state->st[i]);
+		cpu_to_le64s(&state->st[i]);
 }
 
 static void sha3_absorb_block_generic(struct sha3_ctx *ctx, const u8 *data)
 {
 	struct sha3_state *state = &ctx->state;
-- 
2.51.1.dirty


