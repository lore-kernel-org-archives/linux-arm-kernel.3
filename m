Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F2AFF4943
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 05:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tSHGUuVJ/5WFCvWsgyIsoRA6mn6RhnB2otk4Hy3a/8=; b=v98a8dLhY4D1Vg1Gsi8ZE0TH36
	cDn6H78FRe2FBKmVs/M3kiQqJRDWAUmYIx70jVYtpx3ZeWQ3kzudVdKjic0qptunX/Nd9LcfgDz3i
	MXzwukaSpmnfzH3H2qiJ6SeMrBNFW+FEl6IfQ9NRZcjFgRt/spViyYNDzFK/d9tu2oUsFSQ0BuOcE
	0izftu5YhI850L19AR68FcLys8Kusiro7RlLrbbno94QtmQiJ1MfljjLOSYi2Wemt4w/AskncEIQO
	3OxOlsYMOIZNrUG1LBKNep3JDpmTZS2B17hd6T63BctxhdWZjFaMO2esujWG1UOghqStyMCoVTyUg
	pyKeZuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75Eu-0000000Adww-1qJP;
	Mon, 30 Mar 2026 05:32:40 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w75Es-0000000AdwS-1U8H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 05:32:39 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B66A768B05; Mon, 30 Mar 2026 07:32:33 +0200 (CEST)
Date: Mon, 30 Mar 2026 07:32:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Ard Biesheuvel <ardb+git@google.com>,
	linux-raid@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 4/5] xor/arm64: Use shared NEON intrinsics
 implementation from 32-bit ARM
Message-ID: <20260330053233.GB4736@lst.de>
References: <20260327113047.4043492-7-ardb+git@google.com> <20260327113047.4043492-11-ardb+git@google.com> <20260327135051.GA739@lst.de> <cca6facc-6c37-48d0-81e6-f8568f36b91d@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca6facc-6c37-48d0-81e6-f8568f36b91d@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_223238_531819_4CC5CB7A 
X-CRM114-Status: GOOD (  24.24  )
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

On Fri, Mar 27, 2026 at 03:45:56PM +0100, Ard Biesheuvel wrote:
> On Fri, 27 Mar 2026, at 14:50, Christoph Hellwig wrote:
> > On Fri, Mar 27, 2026 at 12:30:52PM +0100, Ard Biesheuvel wrote:
> >> From: Ard Biesheuvel <ardb@kernel.org>
> >> 
> >> Tweak the arm64 code so that the pure NEON intrinsics implementation of
> >> XOR is shared between arm64 and ARM.
> >
> > Instead of hiding the implementation in a header, just split xor-neon.c
> > into two .c files, one of which could be built by arm32 as well.
> 
> That is what patch 3/5 does. This patch wires up that version into arm64, and drops the copy that has become redundant as a result.

Yeah, sorry - I misread the series a little.

> 
> > probably
> > in the arm/ instead of the arm64/ subdirectory, but we can also add a
> > new arm-common one if that's what the arm maintainers prefer.
> 
> Having the shared pure NEON version in arm/ is perfectly fine.

So here would be my preference:

 - keep all the arm/arm64 code in lib/raid/xor/arm
 - have the neon and EOR3 code in a single xor-neon.c file, with an
   ifdef CONFIG_ARM64 around the EOE3 routines

This avoid the including of .c files which is always a bit ugly.
But if there is a strong argument to prefer including of the .c file I
can live with that as well.

> 
> Building it as a separate compilation unit for arm64 should also be straight-forward, the only issue is that the 2-way NEON version needs to be shared with the EOR3 compilation unit.
> 
---end quoted text---

