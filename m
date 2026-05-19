Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E57CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8AvCFAjytS7gFv2yHIimSxwihVDaF3UN6+nXrafOlU=; b=UBvU2mtMIwWFY/aQVUTTiGr3NW
	F3PapTZf9+XyGmhT3HKBa5UZ9Sk28dDAL4LjDMogm1j8112hXxzllvh6QfMpEJ78+5VZtdSVqp/CX
	WI/8Pi8ocy3Puhb1KoxfnWpJLoDxMBnvMNL/TXcIcc/dHmYT5efHyoYSqmeqVtLMjkiGKwVOUXuZ6
	GR/Um+j8NOgUhfpknar5wyRaozOAINTNUxd2Kv5gmzGNIRrOBmKajU6kVegdKndy/HassFaQKoj4/
	h8HOfLiOapLo10nyHdck/FW9L7sukMwOwr2/NLbbjpGIKwekC4EdiUIvLTCOpb4Aa1kSHfCx740Zr
	xNxkUGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPImN-00000001Lcp-1uQH;
	Tue, 19 May 2026 11:38:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPImJ-00000001Lad-3qBa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:38:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BB8122FA;
	Tue, 19 May 2026 04:38:21 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0DD23F632;
	Tue, 19 May 2026 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779190706; bh=kTy64NwZWzmK6BE+dPKBFzD32V8uMDuVNvfL1ZKOH6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MEzeHgOGPundWZeOZ0r9uy3tdo1t+iu5Cp/CT+XfDIIv/9waGYf3yThm13UkIre3W
	 SQDDc8MrL0KfpOFKbMch4wDpOyBNY+mT1NoRknAGGQZLysFjO6Ks24tdCzIcnN2pYZ
	 ghnxICxe7M5qP5OYLguvus3lHVL1t5/uFt6mbcPQ=
From: Leonardo Bras <leo.bras@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	mark.rutland@arm.com,
	catalin.marinas@arm.com,
	kernel-team@meta.com,
	leitao@debian.org,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	puranjay@kernel.org,
	rmikey@meta.com,
	usama.arif@linux.dev
Subject: Re: [PATCH] arm64/daifflags: Make local_daif_*() helpers __always_inline
Date: Tue, 19 May 2026 12:38:16 +0100
Message-ID: <agxLqJWx5r6eltAs@devkitleo>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <agw98k7XVGNCR4RM@willie-the-truck>
References: <ae9f6_MSCMfgG8VT@J2N7QTR9R3.cambridge.arm.com> <20260427140125.1773574-2-leo.bras@arm.com> <agw98k7XVGNCR4RM@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_043828_095840_97E704AB 
X-CRM114-Status: GOOD (  13.91  )
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

On Tue, May 19, 2026 at 11:39:46AM +0100, Will Deacon wrote:
> On Mon, Apr 27, 2026 at 03:01:26PM +0100, Leonardo Bras wrote:
> > Make sure those helpers are always inlined and instrumentation safe.
> > 
> > Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> > ---
> >  arch/arm64/include/asm/daifflags.h | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> b4 really doesn't like this patch being a reply to another one, so I'm
> just replying to say that I've picked it up manually.
> 
> Cheers,
> 
> Will

Hi Will, 

Noted. I will avoid doing this in the future.

Thanks!
Leo

