Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E96C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=r/BRgULQpLgk5YaJQHiFfQ2T48zm7WZ1sUrce8geWiQ=; b=QQ2X179zs0liXR
	aTTVtoTroWBciwqnY9fw/b+Uma2jE+6MG8KteDCbXXzfbxwmMoQQoWYWgtwFicXzaejCrbG3zMF9c
	Go8iy8tEcSiG3DbVbldaPj4gBhILhWv5upqc48yslh0oP2FfA/k4T/UhFwyqWs+oGyC5AtRgybSO2
	JEfJ8/SamxIFl6bpggknxdT4f2lDFvd0wLsK2OfubOpvUlxPCAJQwCAaQyrTRs1Ctg8GRU8GhWJ7D
	hVxFpUE6qGH0uDnk2YfEGTQqDINYMjBSh0P6AQNK8hRBaHWfJSNNk2SNKn6aSy5KgTfbMwe4u3/O3
	/RlemVEbUdH0r4zqYV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8d9P-00000001t6U-0oHj;
	Sat, 26 Apr 2025 10:52:51 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8d7V-00000001svw-3STg;
	Sat, 26 Apr 2025 10:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r/BRgULQpLgk5YaJQHiFfQ2T48zm7WZ1sUrce8geWiQ=; b=FQPHHqJJ4Yp8xo1uAdrbIDyO/e
	+BeauuZagD3c6w+tzPWasqnF44Xz1u41rfxeZt31BrsWb4sbITdmFC5S4/OrY8vhIvTZ/a5BNLm33
	ZkQr1v5nqim7o3ovlQFYoK0XcuQ3ntQUG6T5hc7E23aM0Igezsg2g1BRcr1VXpv1uiU1P5G9RMIsY
	Z0BBvdThrLHvb9tbmeMgnNIMXxWEI/MvsANPU2DsWSqlTcfSIt+mlLeo5b6AJh4I6ZEq1l0nSLHaN
	hTnppKLHw5w4hLDrM6g2raOMJ8TIQa14U85c3jGYzRtS02nib6cJdDcxF0CYxwfHa5ahLdr03R7Mb
	0oUSHsgA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8d7L-001CiC-1a;
	Sat, 26 Apr 2025 18:50:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Apr 2025 18:50:43 +0800
Date: Sat, 26 Apr 2025 18:50:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <aAy6g3nblKtRj1l3@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426065041.1551914-12-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_035053_859150_3B284E77 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
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

Eric Biggers <ebiggers@kernel.org> wrote:
>
> +void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
> +                       const u8 *data, size_t nblocks)
> +{
> +       if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
> +               kernel_fpu_begin();
> +               static_call(sha256_blocks_x86)(state, data, nblocks);
> +               kernel_fpu_end();
> +       } else {
> +               sha256_blocks_generic(state, data, nblocks);
> +       }

Why did you restore the SIMD fallback path? Please provide a real
use-case for doing SHA2 in a hardirq or I'll just remove it again.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

