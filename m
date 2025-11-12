Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37305CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFpG+YXKofa49FeP7jAoUUT9+RlY8OI+4nxbVsD7De0=; b=jb1yEY2Hm312azfT3UJAkGuOwZ
	MCdSpYhWwfyqoRCuSo206QOWGnKBnriSSoj7aMqrzzuhtWziCo5jQUSjaEpjZp5zMSEiHAQaZGacG
	uRBw1k5oFJ+6XBGslG0nI18V4VbaUJy38KSjYAmPtvzV+ermInxGCBkH7zIDAEU0eMSmWTi0Hunwe
	41x/xpXR8h8zzUtaQ6tie92R0G46/gicQZ/Km54omZh6mRiJWhpUPR6uUr/IqwBCxHh0yUgV6cLz6
	qibZYLmdj40C2imHfgD44RHD5wlLXjrOX44RPr+QLa31GXPh/YaRNum0+bsMNK9Hm/PVyPi/M4dMD
	mV1pYEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBfc-00000008uuT-31xX;
	Wed, 12 Nov 2025 14:18:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBfZ-00000008uu8-1oF2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:17:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38B4D1515;
	Wed, 12 Nov 2025 06:17:48 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9D563F5A1;
	Wed, 12 Nov 2025 06:17:52 -0800 (PST)
Date: Wed, 12 Nov 2025 14:17:49 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Chenghai Huang <huangchenghai2@huawei.com>, arnd@arndb.de,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	anshuman.khandual@arm.com, ryan.roberts@arm.com,
	andriy.shevchenko@linux.intel.com, herbert@gondor.apana.org.au,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-api@vger.kernel.org, fanghao11@huawei.com,
	shenyang39@huawei.com, liulongfang@huawei.com, qianweili@huawei.com
Subject: Re: [PATCH RFC 4/4] arm64/io: Add {__raw_read|__raw_write}128 support
Message-ID: <aRSXDTT44_3iutEg@J2N7QTR9R3>
References: <20251112015846.1842207-1-huangchenghai2@huawei.com>
 <20251112015846.1842207-5-huangchenghai2@huawei.com>
 <aRR9UesvUCFLdVoW@J2N7QTR9R3>
 <20251112140157.24ff4f2e@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112140157.24ff4f2e@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_061757_545340_72677DE4 
X-CRM114-Status: GOOD (  21.34  )
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

On Wed, Nov 12, 2025 at 02:01:57PM +0000, David Laight wrote:
> On Wed, 12 Nov 2025 12:28:01 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > On Wed, Nov 12, 2025 at 09:58:46AM +0800, Chenghai Huang wrote:
> > > From: Weili Qian <qianweili@huawei.com>
> > > 
> > > Starting from ARMv8.4, stp and ldp instructions become atomic.  
> > 
> > That's not true for accesses to Device memory types.
> > 
> > Per ARM DDI 0487, L.b, section B2.2.1.1 ("Changes to single-copy atomicity in
> > Armv8.4"):
> > 
> >   If FEAT_LSE2 is implemented, LDP, LDNP, and STP instructions that load
> >   or store two 64-bit registers are single-copy atomic when all of the
> >   following conditions are true:
> >   • The overall memory access is aligned to 16 bytes.
> >   • Accesses are to Inner Write-Back, Outer Write-Back Normal cacheable memory.
> > 
> > IIUC when used for Device memory types, those can be split, and a part
> > of the access could be replayed multiple times (e.g. due to an
> > intetrupt).
> 
> That can't be right.

For better or worse, the architecture permits this, and I understand
that there are implementations on which this can happen.

> IO accesses can reference hardware FIFO so must only happen once.

This has nothing to do with the endpoint, and so any FIFO in the
endpoint is immaterial.

I agree that we want to ensure that the accesses only happen once, which
is why I have raised that it is unsound to use LDP/LDNP/STP in this way.

> (Or is 'Device memory' something different from 'Device register'?

I specifically said "Device memory type", which is an attribute that the
MMU associates with a VA, and determines how the MMU (and memory system
as a whole) treats accesses to that VA.

You can find the architecture documentation I referenced at:

  https://developer.arm.com/documentation/ddi0487/lb/

> I'm also not sure that the bus cycles could get split by an interrupt,
> that would require a mid-instruction interrupt - very unlikely.

There are various reasons why an implementation might split the accesses
made by a single instruction, and why an interrupt (or other event)
might occur between accesses and cause a replay of some of the
constituent accesses. This has nothing to do with splitting bus cycles.

Mark.

