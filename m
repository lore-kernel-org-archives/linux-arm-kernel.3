Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D25C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=4DL/sF/lt2pNiX8ONAJ2XcdbRYc1bavHnLJcYfQuHkk=; b=2h0n+sDqOGDoSy
	758zbSCnO1IXSGlpcDr4J3xG0V4e5A2egGkWiXscoBrgRcMCsI8Iewm7eeWMlj+7jrTRwUcyLMe0J
	eird8eXy02tIp2HXileJuRUBxclNw9ydlw+RqP6UeD5zdpD7KOMKmtP74gWoj+WLegYWnIZpNvQkQ
	cSkyixa0Wj8j62t08MCMsi6IS1szM2JBvgCshXU4fbrPy4w9fflUYUTgJWp3ftDhsjiWHFo2PhLS5
	Et7Ni6wV5FCqzcpd13YYGTVDaQE5hxV0JCWV+1VxktFwFkjBGMAwVvCeOivZLjmTM4SjRPKHZNSCW
	rH8jH55hVArIlpm5j6ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCqFP-0000000H6tI-2W6p;
	Thu, 08 May 2025 01:40:27 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCqDQ-0000000H6l7-2O1C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 01:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4DL/sF/lt2pNiX8ONAJ2XcdbRYc1bavHnLJcYfQuHkk=; b=gf2rSIyz9WcP2bFqZL7t3uNG+Z
	c6TTJrWMne4uXHNVhWZk30iXSan9bFG11+cVdflTGhLm/OPIjfXwgncUOQCcKOGSnagPmWWEhPlgl
	bmKygmVA9yXZZit0J5BxKF4MGWkY4afGm4vB9ke+0DG5piMdbb5RPiGOX1+81Rn94UHDCO+2dQlAa
	8fmmTKBjI+0KfqlXxR197sLV3WYy8ERRp9/eHgUtdFcn5TaWQ037vAnUaKc3Raqh/l+vVSMzu3XZH
	UXs5ax9AJ4o7b/3ZG2lHKmm4GcnqjkUfh82Rl7L0ygN9IihRlhu5ntn3wCPkv3OtZI2EibS+XxeSQ
	v8iHgPxw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCqDJ-004Pex-1y;
	Thu, 08 May 2025 09:38:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 09:38:17 +0800
Date: Thu, 8 May 2025 09:38:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ardb@kernel.org, linux@leemhuis.info, lkp@intel.com
Subject: Re: [PATCH] crypto: arm64/sha256 - fix build when
 CONFIG_PREEMPT_VOLUNTARY=y
Message-ID: <aBwLCXZ83PahQoa_@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507170901.151548-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_183824_607686_7DF33BFA 
X-CRM114-Status: GOOD (  11.53  )
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
> From: Eric Biggers <ebiggers@google.com>
> 
> Fix the build of sha256-ce.S when CONFIG_PREEMPT_VOLUNTARY=y by passing
> the correct label to the cond_yield macro.  Also adjust the code to
> execute only one branch instruction when CONFIG_PREEMPT_VOLUNTARY=n.
> 
> Fixes: 6e36be511d28 ("crypto: arm64/sha256 - implement library instead of shash")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505071811.yYpLUbav-lkp@intel.com/
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> arch/arm64/lib/crypto/sha256-ce.S | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

