Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7377BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqla7ficwpqsZSj44oKsLgDdUFGggieJu4U//EgjgW0=; b=eO6G6axlZWaBqD+UXMsZvaRFb3
	9h89B7J+h0LR2He5M6/kCZoRt1rsvbrQCScuJtTvvZB8jEvKjPmA0udB8oJDw0Bjs1yryjkVb0a7k
	/DQLyVo5PRZz7iwz57GMyM7+8RRCIxt4SIqtpudwiWcwPvmqZAPIW92Y7o901xy4zKIvu2hf1+4ww
	EMjlz/uBQlwkVjrtTMF1srSouOxep4o+yUo+A4fB9aQ86ZJkNDGDvt2gT0JMzuenuIHvkUr8WqIOF
	ed9OJKOXgltLJkTjUFFLUgraFcMWjN0tl5ZKut8HzM2DVjhk0KQhkYZfE87R+yErI1nWfrGDVHEXC
	foJ4rL5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowc-0000000EXfa-24Y4;
	Thu, 12 Jun 2025 20:54:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjNe-0000000Di4l-2ybv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03C8662A07;
	Thu, 12 Jun 2025 14:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5474DC4CEEA;
	Thu, 12 Jun 2025 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749740293;
	bh=MEQ00cN8fGMKpGx5TTT2lBG5uw4fLGW1FJZZt7d8B0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyhEhweNRZcVd2K4arWld8S0SFJue+WF4/91t2dHUDMg0/cbg2Tvu9EtE4Iu1hzNb
	 7jOB/+bthFWk32dO1y/vdiyWb8jsdhiDa0Ex9SMs3hpmjcn2jk/9OllCxRuXZnHdXF
	 yxkaJpCWCTh8DQVAXTlnr5El/O0Xg5/pCNbCUm4GJTIwvrL9kp8Ya9Ov0hfJgsUvOy
	 LL1bg3cEte3Pq/tJ4GVaS4w7m31nGTN+aldUzZcbCJR0xesh8gmDJIdIwGNA1BSAIL
	 7l6J7d3JBj9VD7KEZqtj6M6C4gp60RJhapMQrsgcUrHG0oTYOtdm90twWZX3SKWjG3
	 s2TGt9tLDstZw==
Date: Thu, 12 Jun 2025 15:58:08 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH] arm64/ptdump: Ensure memory hotplug is prevented during
 ptdump_check_wx()
Message-ID: <20250612145808.GA12912@willie-the-truck>
References: <20250609041214.285664-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609041214.285664-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Jun 09, 2025 at 05:12:14AM +0100, Anshuman Khandual wrote:
> The arm64 page table dump code can race with concurrent modification of the
> kernel page tables. When a leaf entries are modified concurrently, the dump
> code may log stale or inconsistent information for a VA range, but this is
> otherwise not harmful.
> 
> When intermediate levels of table are freed, the dump code will continue to
> use memory which has been freed and potentially reallocated for another
> purpose. In such cases, the dump code may dereference bogus addresses,
> leading to a number of potential problems.
> 
> This problem was fixed for ptdump_show() earlier via commit 'bf2b59f60ee1
> ("arm64/mm: Hold memory hotplug lock while walking for kernel page table
> dump")' but a same was missed for ptdump_check_wx() which faced the race
> condition as well. Let's just take the memory hotplug lock while executing
> ptdump_check_wx().

How do other architectures (e.g. x86) handle this? I don't see any usage
of {get,put}_online_mems() over there. Should this be moved into the core
code?

Will

