Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69754C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHOomXa8scx/CRbimDArT+ltvBBBfYbsevo1M7FG8J8=; b=b5A6Laghz7nPKJPaBZHSCW+lF8
	yzvlPKMLbgJg1//hr9tyts6uQHZacyXwMmbjxYuR3Li2de/cys6L0n+/HVXHj1HmDirGpXDQl3HnE
	kM82YVbd4WGWuM1WsEFr+gIX92kSSzt71GfiG5PtbLwjM0oV7lNyMAoplAvowZv2icIY4F3Iy3JwU
	c6MfYCtKARBCbaoU9r0M7WDuba36iCihVgbErCA6KOPigcxGF2sea+7v3xCMFGr7awu0l6PsH7sE/
	91nJeqrklBmJZvPkQEvW4gAThjccs49xf6jdQT+rPeT1472bhkPkLbCGrjdzL/KKLQnlv/EuG9DFt
	N1B7qghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eHQ-0000000ENpN-1sqy;
	Thu, 10 Sep 2026 12:53:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eHN-0000000ENoE-2rxP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:53:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6021B153B;
	Thu, 10 Sep 2026 05:53:20 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E68303F7B4;
	Thu, 10 Sep 2026 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789044804; bh=guLDhJ6ZyKq8+hcs+PxAXVS1CrsGCXfmslmq82z2LuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NsFi2PfvyLst+INRWtF2yNw0Omd4UwkceAxkwK5wIm59I/pNOA42pZ29ILrJ1dUBW
	 sMeXXpzg0BjgT5HtTQByXqrn53rtnxBwG4dMGTYsv/ed4APaFU4mf4eehAX7SNVw4C
	 S/IZx7MJ8g/DM8eMZ5IfOjS3FCQf3VeoehWuCebk=
Message-ID: <a219c25b-bc19-4a48-ba0e-dc50ad36f3b2@arm.com>
Date: Thu, 10 Sep 2026 13:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dma-mapping: split cache maintenance at highmem
 boundary
To: Karl Mehltretter <kmehltretter@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre
 <npitre@baylibre.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260909064443.90544-1-kmehltretter@gmail.com>
 <ff220a24-edae-4b75-9873-1a58f5948a01@app.fastmail.com>
 <aqJJ5fQ60Nm6xf5G@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aqJJ5fQ60Nm6xf5G@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_055325_763804_32CDDE61 
X-CRM114-Status: GOOD (  23.34  )
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

On 10/09/2026 7:24 am, Karl Mehltretter wrote:
> On Wed, Sep 09, 2026 at 09:24:23AM +0100, Arnd Bergmann wrote:
>> I can see how the fix addresses the problem, but I don't yet see
>> how you can arrive in this situation. What type of memory allocation
>> can produce a physically contiguous page range from multiple
>> zones?
>>
> 
> Hi Arnd,
> 
> You're right that a buddy allocation cannot span zones. I found this issue
> during code review while investigating another ARM DMA issue. I plan to
> post a patch for that soon.
> 
> My Pi test deliberately reserved the last lowmem and first highmem pages
> in DT. It confirms the crash with a crossing SG entry, but I have not
> found an ordinary workload that creates one. I should have made that
> clear in the changelog.
> 
> In a follow-up QEMU test, sg_alloc_table_from_pages() merged the reserved
> pair into one 8192-byte entry. It checks that the pages are physically
> adjacent but does not check page_zone().
> 
> I also searched a bit for a real-world example. Rockchip's vendor 4.4
> boot-logo code looks like a possible case: it builds an SG table from
> firmware-reserved pages and calls dma_map_sg() when no display IOMMU is
> used. Product logs show the boot-logo feature in use, but I found no
> record of its reserved memory crossing the lowmem/highmem boundary.
> Such a crossing seems unlikely.

That is completely bogus to begin with though. Calling dma_map_* on 
reserved non-kernel memory is liable to blow up in various ways anyway 
(e.g. in sparsemem page_to_pfn/pfn_to_page) - what's the justification 
for being more lenient towards one particular corner of invalid usage?

Thanks,
Robin.

> I still think the change is worthwhile. For v2, I will update the
> changelog to make the test setup and its limits clear. I may also drop the
> Cc: stable tag.
> 
> Thanks,
> Karl


