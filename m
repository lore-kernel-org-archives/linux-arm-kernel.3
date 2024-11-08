Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F19CD64060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUQbloIIgqftf1hE67aXiX96cbaR3hsl/0WOwQ+RnH8=; b=dIq58gfjoo8Uq4Z52K0tOU7BIp
	aiPFmr+u6IiR6ZxcIzKjp6TNy1HeawNKn1iwDrYthuabh5g9Pu0okHZHC6E7MPMRrYarzEVsuXHhU
	xfZy41o4ebT8oC/MxN1zF63DkncK74epFHpqFn2DTiOI1Nf33/N26V+qPjOWr2ns/o2A9rs0VcU2N
	wZ+Nuttc7wYuTlf2JLX3qmXLtR6UbE0E2u/yHbExmh1cytreADGTrcSthCBwz2PRnftQ5w2xSuBG1
	3E7OBLlNgtKYyxZdnr1gqsShkJBW5Vlu0MWCNeP4xCnTmbe7ttMfDcw4xByCF3WuUvZrb7jaeYUKp
	8qCfYD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtq-0000000BDIy-2njO;
	Fri, 08 Nov 2024 16:31:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qvd-0000000B1i4-2pzS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90F365C5C78
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Nov 2024 15:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F9CC4CECD;
	Fri,  8 Nov 2024 15:29:39 +0000 (UTC)
Date: Fri, 8 Nov 2024 15:29:37 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix build with stricter assemblers
Message-ID: <Zy4uYZVkIR8ntUIV@arm.com>
References: <20241108-arm64-selftest-asm-error-v1-1-7ce27b42a677@kernel.org>
 <Zy4t-tHV18D6BrXJ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy4t-tHV18D6BrXJ@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_072941_813301_6FED7CF1 
X-CRM114-Status: GOOD (  23.55  )
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

On Fri, Nov 08, 2024 at 03:27:58PM +0000, Catalin Marinas wrote:
> On Fri, Nov 08, 2024 at 03:20:46PM +0000, Mark Brown wrote:
> > While some assemblers (including the LLVM assembler I mostly use) will
> > happily accept SMSTART as an instruction by default others, specifically
> > gas, require that any architecture extensions be explicitly enabled.
> > The assembler SME test programs use manually encoded helpers for the new
> > instructions but no SMSTART helper is defined, only SM and ZA specific
> > variants.  Unfortunately the irritators that were just added use plain
> > SMSTART so on stricter assemblers these fail to build:
> > 
> > za-test.S:160: Error: selected processor does not support `smstart'
> > 
> > Switch to using SMSTART ZA via the manually encoded smstart_za macro we
> > already have defined.
> > 
> > Fixes: d65f27d240bb ("kselftest/arm64: Implement irritators for ZA and ZT")
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> > ---
> >  tools/testing/selftests/arm64/fp/za-test.S | 2 +-
> >  tools/testing/selftests/arm64/fp/zt-test.S | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
> > index 95fdc1c1f228221bc812087a528e4b7c99767bba..9c33e13e9dc4a6f084649fe7d0fb838d9171e3aa 100644
> > --- a/tools/testing/selftests/arm64/fp/za-test.S
> > +++ b/tools/testing/selftests/arm64/fp/za-test.S
> > @@ -157,7 +157,7 @@ function irritator_handler
> >  
> >  	// This will reset ZA to all bits 0
> >  	smstop
> > -	smstart
> > +	smstart_za
> 
> And is smstop ok for assemblers? I think I got the error first on
> smstop with my toolchain.

Ah, we already have a macro for that. Let me check the error I got,
maybe I got confused (with the multitude of other warnings ;)).

-- 
Catalin

