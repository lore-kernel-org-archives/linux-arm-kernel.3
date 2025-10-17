Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FA8CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QynEwBnFSwb+tUKozhzpVwPvuygrgvSu11uy4wZSGQ4=; b=vFa2usOO7S19zUDsqFqUkCSPWb
	WN6zGh9qLCV3VcXTULjUanGrwRA8/9FhDKKkW8ibBkIr+6YU+lum89AF2PywBIyp0YVhORvqWtDxi
	hXJRtrVa9AxLU3EfJ5d6T3Y3TobqrgZ8SulVuhR+5eM32KER32ZLjXCIhcOcFKvNs/qzwW6cS+yAP
	duWulFVcl4qdWEoyIk3CcCfodtkMfreNr6kBbOxAybAsG4ICbwjS6pZ8sD5WGRmbotBcKL9Co7En6
	8W1Y+YFhEKpjmEZx7cNy9oXtT1aKvBB35u3YeTm8Ukcp4iaqhGxEUJL9SfC4iNnGYCa5HRRl+cNYy
	aIKaWp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nt9-00000008Xed-06gR;
	Fri, 17 Oct 2025 17:05:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nt7-00000008XeI-1CNQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:05:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2CB960532;
	Fri, 17 Oct 2025 17:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CE3C4CEE7;
	Fri, 17 Oct 2025 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760720708;
	bh=ZzqvD5CR8Z19/7B84GmUXyMCiquP30hbhl+Hs/ZEsP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDxL0QfDK4x7YqA+7gEMgd/gRq0/xeuBwqPC4chpeMImVSMF/zD8eFv23kh4oCF/c
	 es1UfR6MRAnT64y6sLzk2Dbd9Lh+3w067LmpqM9NRxhOmsMjE2Esi9dms3f/uI21h3
	 tAaIX/0WBfkzLVUyYTzpSe4DUu1M3pe5M3bEyHKLKPYp9zk00CPlNgM/1Z1iZVZA63
	 NbRch/mX3EoOoSVtdvSVe1DynZqNQWs1hv7LQ1ABZtuczQmZmGdRElIS5wjLo2vjjv
	 5VBtLJebljSBvIHi2gM8H6/XTbiexK5uBQLR6qq9CyMLD0r1gsGykbuokaavqReClC
	 o1aLmKdRKxhag==
Date: Fri, 17 Oct 2025 10:03:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 02/21] crypto/arm64: sm4-ce-ccm - Avoid pointless
 yield of the NEON unit
Message-ID: <20251017170335.GC1566@sol>
References: <20251008154533.3089255-23-ardb+git@google.com>
 <20251008154533.3089255-25-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008154533.3089255-25-ardb+git@google.com>
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

On Wed, Oct 08, 2025 at 05:45:36PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Kernel mode NEON sections are now preemptible on arm64, and so there is
> no need to yield it when calling APIs that may sleep.
> 
> Also, move the calls to kernel_neon_end() to the same scope as
> kernel_neon_begin(). This is needed for a subsequent change where a
> stack buffer is allocated transparently and passed to
> kernel_neon_begin().
> 
> Acked-by: Eric Biggers <ebiggers@kernel.org>
> [ardb: Simplify convoluted logic]
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Eric Biggers <ebiggers@kernel.org>

- Eric

