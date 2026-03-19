Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60631088E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 04:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEnr2NopqMDWcds5CIq4ox6OYGvRB6TDFfpi0spKFE4=; b=PK6tEexSo5Zw/q8oS7SxKgA9g4
	2PZGslI1QjCqHcGdkjkOZ4BIAhEa9AhGM8R0YAX6IsE1idYte91DdfeEW+tMo17o7S448nWegkDuf
	EyszowtCJtlOaPfB9VmtquTsXhh1APXd+x/3wGkYQBCqwKayo8FtTSs+7tevQ8rlxyrHwcvS58VRL
	bGMOCZYuBi+QPc8nemVeIKYygXHoBEuUyAU5/pl/83QU8hZdfXJjZ/2jcMLtk2/vzKN+h5/ZB3Om9
	0Kh0RE65B7a8BMGqAbCzrs6sZb6Zd/Qe4SSxnh2xNAS5rAqSWWXVa7dROLB9sTftoPU5jofmSYysS
	xPRhy+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34lK-00000009sjI-3dBa;
	Thu, 19 Mar 2026 04:13:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34lI-00000009siu-1RWz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 04:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9808A42AC4;
	Thu, 19 Mar 2026 04:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7CAC19425;
	Thu, 19 Mar 2026 04:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773893609;
	bh=Vl02CNpdjoEsmufTyLMcaK5uWzOZoAztEvYnENBOPSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tb/5PmZodgxaD3Wf7HkiIgGqUiihlp+AWi3cBI8kKg2S9kouJXXI+BU88wW3oYFiG
	 IEfSJwq2HwBZJkQ0oDaX3aofG0XLbEs3UgEk8ntyNNOb9UgCVoxQvK/G4j29xQ972n
	 U4KyYM5OIn71R1YZpqV3knvK1jB24PsO0q7qaWGs+locOdFPsKbrXMiMhwO4jCGSe5
	 aovReIH5wt2HbdeYVQJR7D0rLsiGC/lGlM/CxyD2XMXjCjbJctmgawnoIO1DY2K7PQ
	 n7FJG1mMtfBfoPkWu+jhXdTgKKB4342sj5rkjxw1ATxPvFw3hnT82NZPhji7U1Z5Ud
	 tSDUpliRnsTyw==
Date: Wed, 18 Mar 2026 21:13:27 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Joe Lawrence <joe.lawrence@redhat.com>, 
	Song Liu <song@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v2 00/12] objtool/arm64: Port klp-build to arm64
Message-ID: <ufevsyquxrz3lxsvg2oj3lzfh4nfzc7ttcn6nlpv2asvhent4m@jirpk7jq4nwd>
References: <cover.1773787568.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1773787568.git.jpoimboe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_211332_406423_8D74F252 
X-CRM114-Status: GOOD (  12.96  )
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

On Tue, Mar 17, 2026 at 03:51:00PM -0700, Josh Poimboeuf wrote:
> v2:
> - patches 1-2 were merged, rebase on tip/master
> - improve commit message for "objtool: Extricate checksum calculation from validate_branch()"
> - add review tags
> 
> v1: https://lore.kernel.org/cover.1772681234.git.jpoimboe@kernel.org
> 
> Port objtool and the klp-build tooling (for building livepatch modules)
> to arm64.
> 
> Note this doesn't bring all the objtool bells and whistles to arm64, nor
> any of the CFG reverse engineering.  This only adds the bare minimum
> needed for 'objtool --checksum'.
> 
> And note that objtool still doesn't get enabled at all for normal arm64
> kernel builds, so this doesn't affect any users other than those running
> klp-build directly.

The Sashiko AI thing found some bugs, so it might be wise to hold off on
any review or testing of this until I get v3 out.

-- 
Josh

