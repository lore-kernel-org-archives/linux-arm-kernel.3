Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8C7C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEwsdur20LSofxZDmcsOr/hF/qpdbbn5fC0aEn6rItE=; b=hUvzPuWOZHMhyVIwRUeijK8m2z
	re16b2EF3UDWEQEUbYrhXnVu4ZEINFDJmOBRArBbz9DAzH8D61+1aa1aMyfgZyKWi7FFbK9dZliH3
	DTtXXhGM6+aX7klLY+kkqjnYxAJEBsscM2+RV7nEDRcgDNxy1DhR0jQBQF0DSJ29Hl2QuPyVM9OVY
	rvuanRDaszkEdYqsOa4OeSvD/3HPLcm8MRhYvELdrEZM9skh1DrBuBVKMNAQlaJ/YJkkl6uHhZl2m
	NxFV3JejZ6MGFDpzeCig4JXlp56D316aqIgfu2RXyvQfwc7yckKLD/ezent+oPIOjOsujgKjyhTIF
	6NVIeqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYlK-0000000B3vy-48xT;
	Thu, 13 Feb 2025 12:56:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXec-0000000AuDT-1RYd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DF015C5553;
	Thu, 13 Feb 2025 11:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E026C4CEE7;
	Thu, 13 Feb 2025 11:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739447110;
	bh=mOOLLj+OAy5y5nKK1dSt8RN8ouLFYKPIqvCP4TBrOv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMG7NNJFwxt/ZZSSaYrBF1pZzHuNU8g/iOuIMkgoOhoGsEl6FOH9szsYcntNMZCZI
	 lYVR9QILZyWjlvs937vrDA73/FOwFRrqhIfL2pjgcDlyPRuvgaa7hgLqwwYjPJwkcB
	 s6ju/uZy0wn9eyhjwRzrAP6I0DfHXiAWyeXOnCf2WLzlgj8+hA1usc2SrE7uGikWDz
	 vCb/a+1OYPjr4/9o/GJgd3LGYHXLnbFax6R+6BTLFsZ8Zh54HP+2VoFZKNeXNHVLsc
	 jf47WrCUnGAhvRFcTbOgfDS0gNpWWaGQjqyGMY02zyHAXY4lcY5CssrwgTqzsK7836
	 VTivT3D76IP2w==
Date: Thu, 13 Feb 2025 11:45:04 +0000
From: Will Deacon <will@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Zheng Zengkai <zhengzengkai@huawei.com>
Subject: Re: [PATCH] ACPI: GTDT: Relax sanity checking on Platform Timers
 array count
Message-ID: <20250213114503.GA11508@willie-the-truck>
References: <20250128001749.3132656-1-oliver.upton@linux.dev>
 <Z5i2j9gFB2iyN9g4@lpieralisi>
 <Z5lBMBY7XoFJmpGM@linux.dev>
 <Z6x4987CJ0zgmw3s@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6x4987CJ0zgmw3s@lpieralisi>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_034514_438938_71073D24 
X-CRM114-Status: GOOD (  18.07  )
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

On Wed, Feb 12, 2025 at 11:33:27AM +0100, Lorenzo Pieralisi wrote:
> > > I think this should be fine as things stand (but see above).
> > > 
> > > It is used in:
> > > 
> > > gtdt_sbsa_gwdt_init() - just to check if there are platform timers entries
> > > 
> > > arch_timer_mem_acpi_init() - to create a temporary array to init arch mem timer
> > > 			     entries (the array is oversized because it
> > > 			     includes watchdog entries in the count)
> > > 
> > > In both cases taking the
> > > 
> > > min(cnt, gtdt->platform_timer_count);
> > > 
> > > should work AFAICS
> > 
> > It was probably worth noting in the changelog that I did this to
> > gracefully handle the reverse of this issue where we could dereference
> > platform timer entries that are within the bounds of the GTDT but exceed
> > gtdt->platform_timer_count.
> 
> Hi Oliver,
> 
> I was about to ask Catalin/Will to pick this up, don't know if you have
> time to update the changelog and send a v2 - a Link: to this thread will
> be added anyway.

I'll pick it up with the Link: tag, no need to resend.

Thanks, both!

Will

