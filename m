Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C53CC678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VVrPc5VfUc4kUlnn3a4kFgKuoqeB40HZmusQIafJ0Jw=; b=10tKl34Kt3UlvGJERQb6JQjl7S
	rD5wm3BEzjXsUHR5DjIoyO0kqZMswGUU8fwqeHXXlQggMHz7hrxwFUF4Ypnn4x0wWQYFlB5r5kW6S
	GQU/x4V8NJZAIdFEu1Q3WemC/siZfqTmw/QHIIChQuzz48sr3vuKrLRKElg8MVscf6AwNzn06Qw9L
	tnvNHpyFv7xpe966pcPEncNb/NAU60MzkT00Rr4N6jA+xwKMBXw6uBYhli3A3lsNurL12oe/UAPY9
	NlUcorIKO3n5LUXouDItvic7bhXFFAmqMXlxdAC9JXwq1UFp1La9yjsKYwN9djd9u+4pjHw2ELDz5
	MH/0Kkrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwem-00000006Xvk-1MTO;
	Tue, 10 Jun 2025 10:56:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvLp-00000006LnJ-37Cd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1915960007;
	Tue, 10 Jun 2025 09:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0275C4CEF2;
	Tue, 10 Jun 2025 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547980;
	bh=fQ3YU3S3K3ivEsEdGjJAl8Hbmyr8jXeJ3oVd0bc1t4c=;
	h=From:To:Cc:Subject:Date:From;
	b=OOQ4t51xOrl2MR9zgyKltjt8xczIDYR5Nszf6WA7xXdzs4uRcv6qQcpMD3+Hd/6Mq
	 mToGH3k8Pscs8UM74vbCjPK38LWLhlOBYPyvHrKv2ZRsfx0QAD8VH3IitkoKXOUCCW
	 909llaiuo5FQB35n1ZXLYra6ufiBoQfdWTktXSDRheltD4B0M3TeqYi7T4v3C6I1gA
	 F88+rq7jNcEVgaVcfG1oK9rs55ZuN7OCSdxo4YuRRphGINTSojY8H8LaROGxvbtB8x
	 wmK3WdJeHhYEKWl1iKMmvkeIwWuGGNDuzPmXg5kXoAEzRX36Qk9gJXKxbkPtYy+FwO
	 ndLtwxuJf7riQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Russell King <linux@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@google.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: crypto: work around gcc-15 warning
Date: Tue, 10 Jun 2025 11:32:52 +0200
Message-Id: <20250610093256.2645686-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

I get a very rare -Wstringop-overread warning with gcc-15 for one function
in aesbs_ctr_encrypt():

arch/arm/crypto/aes-neonbs-glue.c: In function 'ctr_encrypt':
arch/arm/crypto/aes-neonbs-glue.c:212:1446: error: '__builtin_memcpy' offset [17, 2147483647] is out of the bounds [0, 16] of object 'buf' with type 'u8[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds=]
  212 |                         src = dst = memcpy(buf + sizeof(buf) - bytes,
arch/arm/crypto/aes-neonbs-glue.c: In function 'ctr_encrypt':
arch/arm/crypto/aes-neonbs-glue.c:218:17: error: 'aesbs_ctr_encrypt' reading 1 byte from a region of size 0 [-Werror=stringop-overread]
  218 |                 aesbs_ctr_encrypt(dst, src, ctx->rk, ctx->rounds, bytes, walk.iv);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 2 of type 'const u8[0]' {aka 'const unsigned char[]'}
arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 3 of type 'const u8[0]' {aka 'const unsigned char[]'}
arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 6 of type 'u8[0]' {aka 'unsigned char[]'}
arch/arm/crypto/aes-neonbs-glue.c:36:17: note: in a call to function 'aesbs_ctr_encrypt'
   36 | asmlinkage void aesbs_ctr_encrypt(u8 out[], u8 const in[], u8 const rk[],

This could happen in theory if walk.nbytes is larger than INT_MAX and gets
converted to a negative local variable.

Keep the type unsigned like the orignal nbytes to be sure there is no
integer overflow.

Fixes: c8bf850e991a ("crypto: arm/aes-neonbs-ctr - deal with non-multiples of AES block size")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/crypto/aes-neonbs-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/crypto/aes-neonbs-glue.c b/arch/arm/crypto/aes-neonbs-glue.c
index c60104dc1585..df5afe601e4a 100644
--- a/arch/arm/crypto/aes-neonbs-glue.c
+++ b/arch/arm/crypto/aes-neonbs-glue.c
@@ -206,7 +206,7 @@ static int ctr_encrypt(struct skcipher_request *req)
 	while (walk.nbytes > 0) {
 		const u8 *src = walk.src.virt.addr;
 		u8 *dst = walk.dst.virt.addr;
-		int bytes = walk.nbytes;
+		unsigned int bytes = walk.nbytes;
 
 		if (unlikely(bytes < AES_BLOCK_SIZE))
 			src = dst = memcpy(buf + sizeof(buf) - bytes,
-- 
2.39.5


