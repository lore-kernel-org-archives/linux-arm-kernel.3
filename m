Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D59CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq1v9nvDyQEpo2Nac8BG5UT53xP8lyAgszlq+/e+jcQ=; b=yes7V8TarOWYhanHzWxNM5WISD
	ZoKFS4GX7ng6iVF15h0dJlMYINd8z6nochyv7Pi1AHPk38whWMX9dhlcv10BIio4Rolw/LmWTHPh2
	fImDKQ7xRm8X50TDd/kzvipQtrQDiLokkGBui+raDvLJzUxAj49tcRC25w+bBgHu/W1G5l6eCu6Xi
	VBqEtlXTjZR6H0O/4V8SyPiQLMMf3m3CuRhLgHlLDH2jNhZe/12MCSWvkyrUKj7hxZqJ89/RmYV1w
	6D9aXoaLeb9N0b6/KMSCYyoD1vbaVeW8aZSXZqucMz1UXrMfCqF965o+pLIE3e4Ga9fhdmP4SLz+2
	cVyaU6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tF-00000006kx1-21Yg;
	Fri, 29 Aug 2025 19:36:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us13S-00000006Bs1-1fxu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C383F6013F;
	Fri, 29 Aug 2025 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41363C4CEF0;
	Fri, 29 Aug 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756481417;
	bh=6nx14GaRznFcg4Y5SDC94Wpm0J9fdI27wEAhF+wvXJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0T2DGR2IVEMAKqGqQ5VCA1B4/cfeH+LX5Bv/iLLqRqpa5oz0O69d6Dcq3UkH2Sc0
	 tfh+Wcc6iyOJZe+nlU7bnYzT0OltR08atmAWd1OPxrJQeYw8Dc4LQ3nh+FU6bivD7s
	 jkYf/wERtmiE7E5wbYeJySB9Y4dQS58KIDgIjKiwxkQhkYRQm8yF9ZBD/zixxnjeXT
	 Hf/IcqbCi9zlfv5gbbhW5vcz/+IA8PbncxJnr2h7Qgu9zYuQsWo0ODgNoSyd1q/IMa
	 7qWnO2EyTRx1Qukps/BchlFCGLc+r2enm7LAdfvJvzneS0eDeUd5ZChPqdX97pKnPU
	 vtPnyoL+Dyo5g==
Date: Fri, 29 Aug 2025 08:29:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Honza Fikar <j.fikar@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/12] lib/crypto: blake2s: Always enable arch-optimized
 BLAKE2s code
Message-ID: <20250829152912.GA91803@sol>
References: <20250827151131.27733-1-ebiggers@kernel.org>
 <20250827151131.27733-10-ebiggers@kernel.org>
 <CAEH5pPY98CaSm+EXiuOzo6EuWzGu7rEQjGa3eojk18HP29Rs7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEH5pPY98CaSm+EXiuOzo6EuWzGu7rEQjGa3eojk18HP29Rs7w@mail.gmail.com>
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

On Fri, Aug 29, 2025 at 03:08:56PM +0200, Honza Fikar wrote:
> On Fri, Aug 29, 2025 at 2:54 PM Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > Currently, BLAKE2s support is always enabled ('obj-y'), since random.c
> > uses it.  Therefore, the arch-optimized BLAKE2s code, which exists for
> > ARM and x86_64, should be always enabled too.
> 
> Maybe a stupid question: what about ARM64? The current NEON
> implementation in kernel arch/arm/crypto/blake2s-core.S seems to be just
> for ARM.
> 
> While the upstream BLAKE2s with NEON is both for ARM and Aarch64 (ARM64):
> 
> https://github.com/BLAKE2/BLAKE2/blob/master/neon

There's no ARM64 optimized BLAKE2s code in the Linux kernel yet.  If
it's useful, someone would need to contribute it.

- Eric

