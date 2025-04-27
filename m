Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EC4C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8B83JaeVQLHgFCWXWffwqUb0JmXK1uEo4GZHcdcva+Y=; b=Ug7u07cPjfGQMPDEki3xrCN3SY
	VOlv3qsIg7dy4yqdWeJo/IyDv0ipZnBnEW+zfx6TNJHz4RZmKV5r4AD/5w1vuJz+U1n9cEXwZDIiO
	QJF+3az8C5RkitSOvl3wa9BI6BAPZqCm4ae5L8udr59RAJwJW+kd68frVYe+0e7OJYoCxOrYN9GDX
	j8V2pKoF6c8dyw+T7WdcPqT9GHlck8RrhLaTjHLXFJ5oIFe9Y/qJvafep7T2nPjpZLDOTE8n6ALJP
	9OBfKDPVmlxYjuvKuiuCS7/6AJU6mnhw41ZrFyL20yVBA260j5l/WUVvUx9PEeTbreTppbHi1VtSa
	IlSJ60Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91MN-00000003Vyy-3saf;
	Sun, 27 Apr 2025 12:43:51 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u91KP-00000003VZQ-2fNd;
	Sun, 27 Apr 2025 12:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=8B83JaeVQLHgFCWXWffwqUb0JmXK1uEo4GZHcdcva+Y=; b=LB/WZAlfGOzyKCTr/sq7hB3Rdp
	87DGEL/SX99F82X/5S3CEt+KMPNil4eQ5XKn9HKMnUxA4cfDf2PrRlmreWsvqfNqxji0Ahm+IqUQd
	wXdO33aEhGmFBOIXuWpE+8bZioYkuicGAN5B/jPJ2fK2P8K9cQiDFC/DlSxp1X3SHny4nVm15XAer
	aSB48aWcfnwfs22dSqJc1WnuG99u9FTL86VXIeZNZAw4NPoARt7CX+u2bzA4RtU1Kraqbddk4uCU/
	yAMqvxfq3a/ZkqN2tSwmIOwRD7TQsIjCpK6QaSzQIFGD7u7OUwRc33CrLVfbIPdhLP99OmnTsWDY/
	Uek3AdhQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u91KE-001OSo-2c;
	Sun, 27 Apr 2025 20:41:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 20:41:38 +0800
Date: Sun, 27 Apr 2025 20:41:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <aA4mAlozk3RvxvTe@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427123514.GA1161@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_054149_676875_26796AD6 
X-CRM114-Status: GOOD (  10.27  )
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

On Sun, Apr 27, 2025 at 05:35:14AM -0700, Eric Biggers wrote:
>
> Well, barely a day and you've already ruined my patch series.  Now instead of a
> clean design where the crypto_shash API is built on top of the normal library
> API (sha256_update() etc.), there's now a special low-level API
> "sha256_choose_blocks()" just for shash that it's built on top of instead, for
> no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
> macro that doesn't work with size_t, and putting my name on your broken code
> that uses it.

Your design is unacceptable because you're forcing the partial block
handling on shash where it's not needed, just as you're forcing the
hardirq support on everything.

I'll take your point about size_t and update the BLOCK_HASH helper.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

