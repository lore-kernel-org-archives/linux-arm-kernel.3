Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0459F513FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 05:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIGx+bm7D7M2fSBS8BljRux0UVkM/ACTzRGQGSiP1Lg=; b=hZo2vb04fvQCBE7vq9G0adugmW
	SckcdACBZESuywe8RD8dt9CA8bplhd+scH4RcqY93NvW6r71eIM/Ah3R/qMMVasOYgr6+YD5rmbIr
	YgJ/vV83X7FoZi4mdhVXyAMvhTICvjglR75CGRvTPRZPkPPJDeMdHL+ADawPRhS41kB3aKm20cGJv
	9vsO4mwu+vg3vrb9qX9W+M4xU41ZfEFXsv/dDmJOJCtJSgwA0CO1fkQWDRS2cjLP2b8DWZRz/xawI
	+58cet2RRLTZq9vmNifDZWRJB5qE3+D+5+CKRu6dQ+U4xw6BintFm7zbf5hQcpON1FSuQ357ZQeJ+
	++7T2YCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOA7-000000033qd-1OTZ;
	Fri, 06 Mar 2026 05:55:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOA6-000000033qX-1vow
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 05:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CB6660126;
	Fri,  6 Mar 2026 05:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45F5C4CEF7;
	Fri,  6 Mar 2026 05:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772776545;
	bh=u9n47FJlOV4YmotAXSe6JiDOvgFEjn3GBPGgBNYT3eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bK1nUrOQVjiI+eAqKuqGQtkV5FTbGa0MoWrSh8bJ6NQBvN12mXKDqDzT+LJdI3wKQ
	 MYYS/LOvXL5PI7x48iNAO8leOoyVCMZd2D0wX1Z6CC9cn6hzq2QEdK/mnjdPoi8rzb
	 zaBO+boiRq93THg2TPj707RaoI4aWEYiScfmxRGLKgFZOgWoczZ9S8jn/UEQE2J6OS
	 wbrmtSDBUNwBQP1tJ68IcGsEpzUTFDR50lAKXZqJtayIU8gWdBT4T8v7Fedl6EFwRz
	 RNJRcx1vBDpNqrLWu0d2bTaxlaWC4ApmYjmMm53i7dpI2Yn3FuD4T7DzpxFHlGe/JT
	 rZzccBL2ZN5iw==
Date: Thu, 5 Mar 2026 21:54:48 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	catalin.marinas@arm.com, will@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 1/1] crypto: arm64/aes-neonbs - Move key expansion off
 the stack
Message-ID: <20260306055448.GA304682@sol>
References: <20260305183229.150599-1-yphbchou0911@gmail.com>
 <20260305183229.150599-2-yphbchou0911@gmail.com>
 <20260305193847.GG2796@quark>
 <aapqOeRMJDmYc4lc@eric-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aapqOeRMJDmYc4lc@eric-acer>
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

On Fri, Mar 06, 2026 at 01:46:33PM +0800, Cheng-Yang Chou wrote:
> Hi Eric,
> 
> On Thu, Mar 05, 2026 at 11:38:47AM -0800, Eric Biggers wrote:
> > Instead of memzero_explicit() followed by kfree(), just use
> > kfree_sensitive().
> > 
> > Also, single patches should not have a cover letter.  Just send a single
> > patch email with all the details in the patch itself.
> > 
> > As for the actual change, I guess it's okay for now.  Ideally we'd
> > refactor the aes-bs key preparation to not need temporary space.
> 
> Thanks for the feedback.
> I'll send a v2 to address your comments.
> 
> The arm implementation also allocates struct crypto_aes_ctx on the
> stack in aesbs_setkey(). Should I include a fix for it as well?
> Note that I can only test on arm64.
> 
> Also, I'd be happy to help with the refactoring if you can point me
> in the right direction.

arm doesn't store the kernel-mode NEON context on the stack, so a
similar change shouldn't be needed there.  This issue showed up only
because arm64 started doing that, which made the stack memory used by
aesbs_setkey() exceed ~1000 bytes due to the crypto_aes_ctx and the
kernel-mode NEON context each using about 500.

- Eric

