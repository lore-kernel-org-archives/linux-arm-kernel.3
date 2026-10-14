Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D0CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sanjYJyBPAwiVfdmEEOUWD9Yo7/YSBsJ6XXqY86U3I=; b=of+86IcPV6JJ78yAJHldAqJfBi
	FEWpzFZtFePqJUlP+KtqMpIuJPoTBzZrEeRG/6TjH/jFze8wgiGICqd2xUnU02REP1dT12E5BImCE
	+/kOVm3H2+ZF4a0jOOZpuGzAwiHTWNE6C8a4R/hUw8UeIUUip6sdVw2+mdMwBWzFnL4dMoZR5pe4n
	faLt59qvWA+/U0cF3k7dg4K8U/R5zgCIChEQekakyIf6OvwpaCfq+ldusMIPd69Zqft4wjqEshKvN
	bT1iYXstbO4Jt3E6vXbrlSymvQV9+AzYa6ELYekzoB8L1viErH2hjgM+pdnAI0xZDVE/wy6lqtsA0
	XMR36SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0v7-0000000Fqxq-3HqD;
	Wed, 14 Oct 2026 15:29:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0v7-0000000Fqxf-1Ba7;
	Wed, 14 Oct 2026 15:29:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B80EF60229;
	Wed, 14 Oct 2026 15:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914221F000C4;
	Wed, 14 Oct 2026 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791991772;
	bh=3sanjYJyBPAwiVfdmEEOUWD9Yo7/YSBsJ6XXqY86U3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eC3qXpQeI1FDby6KhL6WASkbwH465uGmxsZwNb1149OeMo6ECaRIpO4DB987bHW1e
	 gAcWWVWcu4fGAQmC/1mKftLXSBHsjhkS+Go9IQHBIZ8+NV/YXotfm7ihpI7al0sYIl
	 2MMi8HEYE8pvvrRL2Pwgx5wCL7H/PusdIjSnFxT8b1S2c0rS8sDcq2GXpANfGNb5Nl
	 EyL8TyJr7MvR917T6qcKB2PFKCLD8QsrJIZ0B2NAvP8pftDjQgRc3w77F/3MNmyso1
	 QF6I1PxSoouetFdQnMkL4PhLqEpGxBqPLWFHXHevSgquZaPRkf90UbB31jYtSkF6ru
	 ojAjGwOPiYvMg==
Date: Wed, 14 Oct 2026 17:29:09 +0200
From: Eric Biggers <ebiggers@kernel.org>
To: vladimir@genproof.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH 0/5] lib/crypto: Handle large lengths in poly1305 and
 chacha20poly1305
Message-ID: <20261014152909.GA322435@quark>
References: <20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com>
 <20261013173508.GB3830@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013173508.GB3830@quark>
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

On Tue, Oct 13, 2026 at 07:35:08PM +0200, Eric Biggers wrote:
> Thanks!  Patches 1-3 look good.  I'm less sure about patches 4-5, since
> they go through some trouble to work around (some implementations of)
> poly1305_blocks() and chacha_crypt_arch() not taking size_t.  Wouldn't
> it make sense to convert those to size_t at the same time?

I think we should just get this out of the way by converting each
algorithm entirely to size_t.  The series
https://lore.kernel.org/r/20261014152604.323310-1-ebiggers@kernel.org
does this.

- Eric

