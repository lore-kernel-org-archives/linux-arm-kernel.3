Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0129DC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 02:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCSGe0hd9nC0wheXB+gSEHvBf5j2sNZqM+duHcgxviI=; b=bBLW+U6wQ0DpUFghb9c7pz2Xyh
	y8lkSlWA3fRq4g+oKrQmfFlGrqBsep3bQlWzodZ3GvCZAEN2LX+ZCmCn4SA5S1yXScu2yf1xowHKq
	jrUTu5nG934dl7cV2zkEBnGtPbjYODSy6fmupZyIKjNdej33hj/zLTo/ES3qk3r23hpNgaGp8st+u
	0XpfjOaHXKpHSFqNqKR1GlISvR9ngNBIZi3suJnPL+RjtbgJRKNOG7i33+xP0TX/baIq91uKOhtqD
	l9YXlj9dohX1roChY5p3V0KobvMJ+xskKHfSZMA3woegBhE4RQz7SvjsuslagWFtteDp0EavJR72T
	oWf7Kb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rTy-00000002lrf-3mR7;
	Sun, 27 Apr 2025 02:11:02 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rS2-00000002lhr-3xSo;
	Sun, 27 Apr 2025 02:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mCSGe0hd9nC0wheXB+gSEHvBf5j2sNZqM+duHcgxviI=; b=bL/C1Qcvgn5BWiPkJ27+dJ7Es8
	wwSoSEMzq4YcvjJsWSmMepkvcU0C+LR+JcK4d4+iSMjdzlqhOGHE3AF2kMOhQHHx5zatXSJemRQUa
	+4h6wO0WkFQUX9WdKq6GRaJ9/mZ17PlsiqC0wdJhCc9trhF25UN90ckF1QyCHeZRx0n89B0uSwkLG
	uUSof0rmZhN5waLKmnv8FlDyjrKsMtYRIDRqFgglTsQWEPgcKsVVxKbPbA5yOE0L7Ivk2Ohmjs+Gm
	LWKBoqlKkfHG+z5IZWuBDTy+jUSYT0zXWKQ2YQGCxsKc4gNCr1zLOsKj79gKZojc877uD54ab34ip
	84RfoZpA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8rRz-001Jud-1b;
	Sun, 27 Apr 2025 10:09:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 10:08:59 +0800
Date: Sun, 27 Apr 2025 10:08:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <aA2Ru1SHXRB-ZAc3@gondor.apana.org.au>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
 <20250427015041.GF68006@quark>
 <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
 <20250427020550.GG68006@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427020550.GG68006@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_190902_980255_8961FC60 
X-CRM114-Status: UNSURE (   7.52  )
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

On Sat, Apr 26, 2025 at 07:05:50PM -0700, Eric Biggers wrote:
>
> Why?  And how is that relevant here, when the export format should just be

Because I want to be able to fall back from an ahash to shash in
the middle of a hash, i.e., I need to be able to export from the
ahash, import it into an shash, and then continue hashing.

> struct sha256_state, as it was before?

Because I've already changed the shash export format to use a
generic partial buffer for all algorithms and it's not the same
as struct sha256_state.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

