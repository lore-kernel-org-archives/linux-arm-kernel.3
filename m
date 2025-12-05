Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B04D2CDE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng6LRrOkIoVRNAh8IoZPSEiOUnginp1vTZPMCD2DLPc=; b=bV5kOueXLsyDZIeASvm7Y/Nlqy
	hXT6QFgP8TRO3P5i4pG9fxxJgQar+UBSDu1wAWjHBJ5qb409TiXt/jmlgV/hNQLFC4JcwGNRSRFyd
	q+zgym0E8zGHLPLlNYmXLCUw18GEp2IhZqqapT1GWGiMnIuEktzLocTu3qlY5X6YajS2BbrtVzChH
	+QNUl3fVBKX8QpCluc9lgMD+wg+kZdoHI5chKqsBqUaEtE+eI7DHtYFhWI/uGgKhulLRYAcw3aWew
	9BoWoTERyKwoJn7a7X8K80BqeDep98Hv5pBivd7GJ0KReogVIqc7uGCnbmLZ7nx5YGClQPpc/HEQ2
	bRjJS4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRJb5-00000008oNF-3HtQ;
	Fri, 05 Dec 2025 00:22:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRJb3-00000008oMy-02qd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 00:22:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07A27601ED;
	Fri,  5 Dec 2025 00:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F5EC4CEFB;
	Fri,  5 Dec 2025 00:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764894171;
	bh=Mv/Yf5qUPtaJ+aXcJ/pliKz7h14XmR4v8kreCWxmRwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5rk6J6lTzRISrAwoAwJgTUZbMxT8I62mUOi5bcG93chxim95JlY5LgZux9mVWlRm
	 4RlWhPPOdn304R+xD5eDL4A+klPwg4VS/uDJrBwPDkmjFY1P09X5kG83NvGqehc/Vd
	 H3J2YotrvaHjoWF9M15As0+O+rKZAEAT7InUb/SoBPBNh0WdgeqOQQQ+JG79Xe8gG6
	 /tjafZLzdx+G/xSBlicYtCsBUqr/6etTZ/nfC0V6W7ToEYh1JEU1Z860vwEZFB4QZ/
	 ui6TZpELIRa4dYjvDEWR4z/8zmYUJQYcXvi7qmt/m90x1uQZMN0xa/ji7kJJbF+kSS
	 PpNhsE1DnVygw==
Date: Thu, 4 Dec 2025 17:22:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Christopher Covington <cov@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y RESEND] KVM: arm64: silence
 -Wuninitialized-const-pointer warning
Message-ID: <20251205002245.GA3463270@ax162>
References: <20251204-b4-clidr-unint-const-ptr-v1-1-95161315ad92@google.com>
 <2lse2swdqrovimdsakgtriadki2fsvikhuetjzxztoui5hpsai@6mmc64ugt22k>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2lse2swdqrovimdsakgtriadki2fsvikhuetjzxztoui5hpsai@6mmc64ugt22k>
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

On Thu, Dec 04, 2025 at 12:53:58PM -0800, Justin Stitt wrote:
> Quick correction:
> 
> On Thu, Dec 04, 2025 at 12:50:11PM -0800, Justin Stitt wrote:
> > A new warning in Clang 22 [1] complains that @clidr passed to
> > get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> > doesn't really care since it casts away the const-ness anyways.
> > 
> > Silence the warning by initializing the struct.
> > 
> > This patch won't apply to anything past v6.1 as this code section was
> > reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
> > configuration"). There is no upstream equivalent so this patch only
> > needs to be applied (stable only) to 6.1.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> > Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Resending this with Nathan's RB tag, an updated commit log and better
> > recipients from checkpatch.pl.
> 
> My usage of $ b4 trailers must've not been correct because this 6.1
> version didn't pick up Nathan's RB tag. Whoops! Hopefully whoever picks
> this up can add that for me :)

Looks like you resent the first iteration of this change [1] instead of
the second [2], hence why 'b4 trailers -u' did not work, since I never
reviewed the first iteration after Marc rejected it :)

Your 5.15 resend looks correct though.

[1]: https://lore.kernel.org/20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com/
[2]: https://lore.kernel.org/20250728-stable-disable-unit-ptr-warn-v1-1-958be9b66520@google.com/

Cheers,
Nathan

