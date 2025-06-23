Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8EEC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pK3yHQ00Ie28/bNXr2JxWFBovPz2NQMh4thf0IZUWY=; b=ZvU1b+0OAL7i8t6jSSVsB5QbMw
	k2kXxVb97HetJzS0OdCp3uA+on4YSj60wuDrPFw0vtgvxj1FIezhq0n9Dwc5wUmRYALRvH+bQNVda
	p5fioWM2U7oHFO3EQLDx++xqxxwJhLdLf1abcK7SERc8V68gMqXPMy/3XtjRQaIF9pO/X27fd+1zl
	aPEeOq8AfwexSil5NIvInmTL3ais3gHy6kioiN70QHP8nb4IID95GApLnEptv4F4GELrSp1q1fBa8
	ngQXqAQjDJCcp/2DL4nKiNr4AAtenZFW+Gtvfb4lsQG2gGSe+TEAHeuZRUeFdBTQn/Y8ZdQZVSP6Z
	TCqKFmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdQY-00000002AP0-1z79;
	Mon, 23 Jun 2025 09:25:22 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdJA-000000028rc-4C6n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3pK3yHQ00Ie28/bNXr2JxWFBovPz2NQMh4thf0IZUWY=; b=IZ1BofxImkLmpZME6FjqOE5Lpn
	eBW2+jfeMSoHh2n+DGmDVDK4RbIKW386I5MPn2XhG2Holx2+oJD+LXq0ZT9qAkG2XlhGMuMFYXNOU
	ligHE5OE1SC7GL7rf8PjD1zMCNs6p7Vwe7wXvguXkTi0iSEtPXLISHfLdELj807Xdlr/Z+2jlTfIS
	+vZjwspVnRAuSxHqMGti5JLiDhRTA8LbgZzrK9Wu0g/zsU6mD7pcV+a1PeSXmkHL6lKTdwpxPR8/U
	9yGBtyOAHn5jU9UY/ctFbKSVgSY/ST6wZ0xCNLPtIoe2NzbPrBjLBBprKUDmBvzOu58AHf/25lwrO
	qNLScgMA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uTd3P-000FT4-2Q;
	Mon, 23 Jun 2025 17:17:25 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 23 Jun 2025 17:17:24 +0800
Date: Mon, 23 Jun 2025 17:17:24 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Russell King <linux@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@google.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: crypto: work around gcc-15 warning
Message-ID: <aFkbpCBUr-ujNMCF@gondor.apana.org.au>
References: <20250610093256.2645686-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610093256.2645686-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_021745_038065_3DE00308 
X-CRM114-Status: GOOD (  16.67  )
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

On Tue, Jun 10, 2025 at 11:32:52AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I get a very rare -Wstringop-overread warning with gcc-15 for one function
> in aesbs_ctr_encrypt():
> 
> arch/arm/crypto/aes-neonbs-glue.c: In function 'ctr_encrypt':
> arch/arm/crypto/aes-neonbs-glue.c:212:1446: error: '__builtin_memcpy' offset [17, 2147483647] is out of the bounds [0, 16] of object 'buf' with type 'u8[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds=]
>   212 |                         src = dst = memcpy(buf + sizeof(buf) - bytes,
> arch/arm/crypto/aes-neonbs-glue.c: In function 'ctr_encrypt':
> arch/arm/crypto/aes-neonbs-glue.c:218:17: error: 'aesbs_ctr_encrypt' reading 1 byte from a region of size 0 [-Werror=stringop-overread]
>   218 |                 aesbs_ctr_encrypt(dst, src, ctx->rk, ctx->rounds, bytes, walk.iv);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 2 of type 'const u8[0]' {aka 'const unsigned char[]'}
> arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 3 of type 'const u8[0]' {aka 'const unsigned char[]'}
> arch/arm/crypto/aes-neonbs-glue.c:218:17: note: referencing argument 6 of type 'u8[0]' {aka 'unsigned char[]'}
> arch/arm/crypto/aes-neonbs-glue.c:36:17: note: in a call to function 'aesbs_ctr_encrypt'
>    36 | asmlinkage void aesbs_ctr_encrypt(u8 out[], u8 const in[], u8 const rk[],
> 
> This could happen in theory if walk.nbytes is larger than INT_MAX and gets
> converted to a negative local variable.
> 
> Keep the type unsigned like the orignal nbytes to be sure there is no
> integer overflow.
> 
> Fixes: c8bf850e991a ("crypto: arm/aes-neonbs-ctr - deal with non-multiples of AES block size")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/crypto/aes-neonbs-glue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

