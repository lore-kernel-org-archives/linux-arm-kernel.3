Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85ECE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46BxsCbI0FR4kHDgldgx1BMDqYZ8yBbbSq8sEnuUMJ8=; b=LF5KsGCCXW33DAXKdOE7xk5FTY
	Art4PBoS7TUGC3fN46+DtU5uOr1y2w9v8QFE/ua6mRLTvk6C5J6ADaOXHZ+45WTiHMcR3nWlfJJGO
	Unuokbm2VPXMCCdyO1clWE2BiT0LHooYViOk/tBd97GUaVH1xxNCV42U9KLUg5XYW05gkxqUb+0zc
	LircVh+zGB+W3chez041MZDq4C8OL/W1clhef8CuqjcnAFMDGxnGzGBf1pKFHHoydGccvdi50FNDc
	0lgTWVdMQTtPdI0fElFGflrinVqQP/fOt+kZyZ6hBSjM+F62eiMM9GbCeGhNLFJpH26YnnS2978vA
	8P+5ONCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwTF-0000000Cr6k-42wi;
	Thu, 09 Jan 2025 17:37:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwR5-0000000Cqms-1wVx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:35:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B7BF1515;
	Thu,  9 Jan 2025 09:35:37 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F70A3F673;
	Thu,  9 Jan 2025 09:35:07 -0800 (PST)
Date: Thu, 9 Jan 2025 17:35:00 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64/sme: Collected SME fixes
Message-ID: <Z4AIxM3fYh5WEw--@J2N7QTR9R3.cambridge.arm.com>
References: <20241204-arm64-sme-reenable-v2-0-bae87728251d@kernel.org>
 <20250108124957.GA9312@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108124957.GA9312@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_093511_544774_311D79F6 
X-CRM114-Status: GOOD (  19.73  )
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

On Wed, Jan 08, 2025 at 12:49:58PM +0000, Will Deacon wrote:
> On Wed, Dec 04, 2024 at 03:20:48PM +0000, Mark Brown wrote:
> > This series collects the various SME related fixes that were previously
> > posted separately.  These should address all the issues I am aware of so
> > a patch which reenables the SME configuration option is also included.
> > 
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> > ---
> > Changes in v2:
> > - Pull simplification of the signal restore code after the SME
> >   reenablement, it's not a fix but there's some code overlap.
> > - Comment updates.
> > - Link to v1: https://lore.kernel.org/r/20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org
> 
> Mark (R), are you happy with this? I know you were digging into some
> other issues in this area but I'm not sure whether they invalidate the
> fixes here or not.

Hi Will, sorry for the delay -- this has turned out to be more fractal
than I had hoped. :(

I think some of the fixes I'm working on are going to conflict with or
supersede portions of this series (e.g. portions of ptrace and signal
handling), and I'm aware of a couple more SME-specific issues that are
not addressed here.

I'll try to get that out in the next few days, and then look at this in
a bit more detail.

Rutland.

