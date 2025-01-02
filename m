Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BB1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VV7qbmVczKDACG4vLoapYpXU+4wGY7af08Haj31hjg=; b=MGXr8xr3bHNF+6+Cli/CdDDz/t
	TMCX+1PJ0x0RYgr+2HbgDO/WVH72/A0rcnixCopLOJRiOEuxUu1AepnwM+LMf/Zarrqo1AWxON/35
	NFwMsOi0OipNhdDibDXDs+N9shDJBiyUojtGD7Rt37MKgDgZMV5riJdXq8P7+c1nyOpfHxBNvmaIE
	/TVa0il9RsjysKdHgN45WZ++gP0Xvu5Ja2pVicnvwqtTq1jsbz+P/zSKAvjTTEkzsjmEOcQlmrVq7
	MIEHyIf2bQEvizNfeMv5b3WQ2mmUgtafmd6rssdXk7VW/ejbxJ1PV8sMr1L3TYGdOtkszlo7+j0tY
	Sfv0XBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTK6O-0000000AKiL-1Z1N;
	Thu, 02 Jan 2025 12:15:00 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTK54-0000000AKYJ-3tES
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 12:13:40 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YP5934jj7z6K9h1;
	Thu,  2 Jan 2025 20:09:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 44DFF140AB8;
	Thu,  2 Jan 2025 20:13:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 2 Jan
 2025 13:13:29 +0100
Date: Thu, 2 Jan 2025 12:13:27 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Will Deacon <will@kernel.org>
CC: Yang Shi <yang@os.amperecomputing.com>, <catalin.marinas@arm.com>,
	<cl@gentwo.org>, <scott@os.amperecomputing.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangyicong@huawei.com>, <guohanjun@huawei.com>,
	<wangkefeng.wang@huawei.com>, <liaochang1@huawei.com>,
	<sunnanyong@huawei.com>, <linuxarm@huawei.com>
Subject: Re: [RFC PATCH 0/3] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Message-ID: <20250102121327.00004490@huawei.com>
In-Reply-To: <20241210113151.GC14735@willie-the-truck>
References: <20241118181711.962576-1-yang@os.amperecomputing.com>
	<20241210113151.GC14735@willie-the-truck>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_041339_176326_019D3745 
X-CRM114-Status: GOOD (  16.67  )
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

On Tue, 10 Dec 2024 11:31:52 +0000
Will Deacon <will@kernel.org> wrote:

> On Mon, Nov 18, 2024 at 10:16:07AM -0800, Yang Shi wrote:
> > 
> > When rodata=full kernel linear mapping is mapped by PTE due to arm's
> > break-before-make rule.
> > 
> > This resulted in a couple of problems:
> >   - performance degradation
> >   - more TLB pressure
> >   - memory waste for kernel page table
> > 
> > There are some workarounds to mitigate the problems, for example, using
> > rodata=on, but this compromises the security measurement.
> > 
> > With FEAT_BBM level 2 support, splitting large block page table to
> > smaller ones doesn't need to make the page table entry invalid anymore.
> > This allows kernel split large block mapping on the fly.  
> 
> I think you can still get TLB conflict aborts in this case, so this
> doesn't work. Hopefully the architecture can strengthen this in the
> future to give you what you need.
> 
> Will
> 

Hi All,

Given we have two threads on this topic, replying here as well...

Huawei has implementations that support BBML2, and might report TLB conflict
abort after changing block size directly until an appropriate TLB invalidation
instruction completes and this Implementation Choice is architecturally compliant.

I'm not trying to restrict potential solutions, but just making the point that we
will be interested in solutions that handle the conflict abort.

Jonathan

