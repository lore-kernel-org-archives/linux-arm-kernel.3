Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E34AC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQWSXOJOdoeJ0NVtIOqvrylqJWUVc54xWOKat86BY00=; b=ndA9448w49ewXXzFBwmkgrkn1w
	0GSEh2sUdaKqNa2Jy29y+C6ZYIzj0ySdfwdNiFeEBy1oSKVifCmrrE48bsRObw7fmcnvIGoTpRGeO
	LwNYzNOKNnImuaKygLFMiXFVyAsIhbAPiDOPpFbs6A1RS8Oag/V4bQ1LwKpZ2QrSy8RKP70t1NLaM
	aUaeNpxRIqQ8Q2YhkwUYBBwZGDpsr5FyoJFNpebltO5DiBO411yz1z0//OyWhMRJIPJSMtpC/K+x9
	KXjIBLZgR26lsR/anFmTAQeXLkZRy1Dk/SAX5+K6fI7hnW/iyNuY2x56l7VW1TLWFKu5kMsYZMtC9
	DfzfUCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVWV-00000009xNG-1DVJ;
	Mon, 12 May 2025 15:56:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVDc-00000009u6J-1Z3P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:37:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69A1014BF;
	Mon, 12 May 2025 08:37:13 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE4AA3F63F;
	Mon, 12 May 2025 08:37:22 -0700 (PDT)
Date: Mon, 12 May 2025 16:36:25 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>, Will Deacon <will@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Message-ID: <aCIVec7zl3tIh73h@J2N7QTR9R3>
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_083728_452316_E4994B2D 
X-CRM114-Status: GOOD (  20.07  )
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

On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
> On 5/10/25 03:04, Sudeep Holla wrote:
> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> >> Cache geometry is exposed through the Cache Size ID register. There is
> >> one register for each cache, and they are selected through the Cache
> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
> >> CCSIDR changes to allow a larger number of sets and ways.
> >> 
> > 
> > Please refer
> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
> > 
> 
> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
> | in conjunction with set/way cache maintenance and are not guaranteed to
> | represent the actual microarchitectural features of a design.
> | 
> | The architecture explicitly states:
> | 
> | | You cannot make any inference about the actual sizes of caches based
> | | on these parameters.
> 
> However, on many cores (A53, A72, and surely others that I haven't
> checked) these *do* expose the actual microarchitectural features of the
> design. Maybe a whitelist would be suitable.

Then we have to maintain a whitelist forever, and running an old/distro
kernel on new HW won't give you useful values unless you provide
equivalent values in DT, in which case the kernel doesn't need to read
the registers anyway.

The architecture explcitly tells us not to use the values in this way,
and it's possible to place the values into DT when you know they're
meaningful.

I do not think we should resurrect the usage of these registers.

Mark.

