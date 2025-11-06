Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3788FCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzefC1DKEFUb+BXloDfVI3cl7hxdIo0ixUArlO+xlwo=; b=UgEi3ZJ2db4nPJnRCBeHZpFLQU
	iiMEcv72drjUgUCh6XvsBVaf13Zg0s6vgugmCtBZAGA5BpgAh64Pd6JVlFyyoHzWy7B+FEt7ywser
	Ox9aiRqzL2ZlsdaTpqW1Wi8hND9zCPmyH2cf/Ovbv35vkQx7kaulsHFvQjwlKufrsDTkJdPp1kfuI
	YpZW99yC/bI+pR4b3FWih04jgrL0Fh4TFhKRDgC+5yx+g9W9wOoj5D1+mGncz21MPyOQGXxkWLnfa
	qctLV8wkw+HpoKxFrXSA95r2/lZG+ZlHj1pHQ/dVqJcXuP+64Z3qjlIDH2hfbsdNfuSpu/+kdXJyN
	1MaWSqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Xz-0000000Feb2-16j0;
	Thu, 06 Nov 2025 14:01:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0Xv-0000000FeaV-49L8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:01:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 012581596;
	Thu,  6 Nov 2025 06:00:55 -0800 (PST)
Received: from arm.com (RQ4T19M611-5.cambridge.arm.com [10.1.31.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 188DB3F66E;
	Thu,  6 Nov 2025 06:01:01 -0800 (PST)
Date: Thu, 6 Nov 2025 14:00:59 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: paulmck@kernel.org, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <aQyqGxJVIybi7mJS@arm.com>
References: <aQuimp4CRywdy97S@arm.com>
 <mhng-28F4A0BA-47EC-49AD-90A5-73EA7D029CA3@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-28F4A0BA-47EC-49AD-90A5-73EA7D029CA3@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_060104_077206_50A94075 
X-CRM114-Status: GOOD (  16.64  )
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

On Wed, Nov 05, 2025 at 01:13:10PM -0800, Palmer Dabbelt wrote:
> I ran a bunch of cases with those:
[...]
> Which I'm interpreting to say the following:
> 
> * LL/SC is pretty good for the common cases, but gets really bad under  the
> pathological cases.  It still seems always slower that LDADD.
> * STADD has latency that blocks other STADDs, but not other CPU-local  work.
> I'd bet there's a bunch of interactions with caches and memory  ordering
> here, but those would all juts make STADD look worse so I'm  just ignoring
> them.
> * LDADD is better than STADD even under pathologically highly contended
> cases.  I was actually kind of surprised about this one, I thought the  far
> atomics would be better there.
> * The prefetches help STADD, but they don't seem to make it better that
> LDADD in any case.
> * The LDADD latency also happens concurrently with other CPU operations
> like the STADD latency does.  It has less latency to hide, so the  latency
> starts to go up with less extra work, but it's never worse  that STADD.
> 
> So I think at least on this system, LDADD is just always better.

Thanks for this, very useful. I guess that's expected in the light of I
learnt from the other Arm engineers in the past couple of days.

-- 
Catalin

