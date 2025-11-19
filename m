Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DC4CF58F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w136j24X7Fu4g6LuKNt1puG0/UhUBiqTSovurpbLFnQ=; b=ZNNRpYq48lOkxq8iWMjXEVoLVG
	onPa7AZGNiI57duH5gzLY5XQSsoJTED01AloujZYEUvcpGWaZSWVOG3gMkI0JIiIZveSZlSY1Dk78
	gRQZZqwI1lijau4IxMWozWCIK/WX6BTVks2KstnXL3NtMSs2y921XKNAkjXmTovsBndqLtnlW3weX
	Z/oNBqAzhH6btEFi9HiR29zFJg/OpXuQnTGaxC7TyQ5GrwG1GEooOkEXaDQeCymPzjnYcvuekqrwV
	tHPG3UOxLq7kAzjy/kJ0P+IC444ZNy9sa8XZ5v2v+5dvX/psYHwm/fNEybN5RXI5dUdhmk8LM1Xr3
	10tALgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpRt-00000005fYJ-0QnH;
	Wed, 19 Nov 2025 21:10:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLpRq-00000005fXv-1wuO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 21:10:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46BEAFEC;
	Wed, 19 Nov 2025 13:10:32 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B66573F63F;
	Wed, 19 Nov 2025 13:10:38 -0800 (PST)
Date: Wed, 19 Nov 2025 21:10:36 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: ryan.roberts@arm.com, cl@gentwo.org, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <aR4yTL-F8yvIyTBH@arm.com>
References: <20251023215210.501168-1-yang@os.amperecomputing.com>
 <176357957114.2095636.13353317001365823131.b4-ty@arm.com>
 <76803fd4-7a7c-4018-b2cc-8e36cba60729@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76803fd4-7a7c-4018-b2cc-8e36cba60729@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_131042_568800_25FFBC9E 
X-CRM114-Status: GOOD (  19.85  )
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

On Wed, Nov 19, 2025 at 11:37:13AM -0800, Yang Shi wrote:
> On 11/19/25 11:12 AM, Catalin Marinas wrote:
> > From: Catalin Marinas <catalin.marinas@arm.com>
> > 
> > On Thu, 23 Oct 2025 14:52:10 -0700, Yang Shi wrote:
> > > Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> > > rodata=full"), the direct mapping may be split on some machines instead
> > > keeping static since boot. It makes more sense to show the direct mapping
> > > use in /proc/meminfo than before.
> > > This patch will make /proc/meminfo show the direct mapping use like the
> > > below (4K base page size):
> > > DirectMap4K:	   94792 kB
> > > DirectMap64K:	  134208 kB
> > > DirectMap2M:	 1173504 kB
> > > DirectMap32M:	 5636096 kB
> > > DirectMap1G:	529530880 kB
> > > 
> > > [...]
> > It matches Documentation/filesystems/proc.rst, so I'm fine to align
> > arm64 with it.
> 
> Yes, it does.
> 
> > 
> > Applied to arm64 (for-next/misc), thanks!
> > 
> > [1/1] arm64: mm: show direct mapping use in /proc/meminfo
> >        https://git.kernel.org/arm64/c/1102778cb023
> 
> Thanks for taking the patch. However, Ryan noticed some over-accounting
> problems and had some suggestions to code cleanup as well. I'm going to
> submit v3 to the mailing list soon.

Ah, yes, I forgot about that. If the change is small, can you submit a
fix instead? I tend not to rebase the for-next/* branches. Otherwise I
can revert and apply a new one.

Thanks.

-- 
Catalin

