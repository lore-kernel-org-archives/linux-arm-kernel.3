Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A12C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5CJTk2TlD92UoezyHqsHilXeiTs4Pq4ZgYFgjk1fNM=; b=Jthi7kWbTLtSOPNFalfJAiSJMP
	5Fp1B1L1L4ndcfD0FSrD2QYI1WSU6paBW5pSBjAZn/l5Phe0r60v6nH0PjvWAMb8eTbyol+orv/0X
	6rR7Jsa1mZWuahnRfjfCKiTcO+9IbXttwtzxoiRkEPG8sudxJF2fMadQvkGXrWTGu3B2EUTD630XH
	26Fbvd76UHrjatPvy6GnVQmK9kwGBHvcAl1Tadn1kwxQ63EXXijQxOLIw5oBgouNd5Yj7kVz/qAqB
	xjNfRgdnqRKQ9OswqPu8QMwOUZVnYW4/AroU0uvI5gklaLExsoZzlkoHaOU/QcoYjK1BbDCs8jAVl
	s7U9Rsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webxp-0000000HY0u-2PUj;
	Tue, 30 Jun 2026 17:09:37 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webxn-0000000HY0E-1DUF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:09:36 +0000
Received: from thinkpad-p16sg1.corp.microsoft.com (unknown [20.236.11.42])
	by linux.microsoft.com (Postfix) with ESMTPSA id 606FD20B716C;
	Tue, 30 Jun 2026 10:09:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 606FD20B716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782839372;
	bh=B5CJTk2TlD92UoezyHqsHilXeiTs4Pq4ZgYFgjk1fNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqMj+EEx6yimT5SdLBxPpYjQVeixzMgWJxE3inL7BSg7A8SIwXJw9/SY3hMdm+e2F
	 B4YadK9ITH+eLe9c7LsalSb5FNRP8fJJGvoWAnL+APrr3XphmWzeBv2nRpYtGgU0/5
	 H4Po029v5P7HCLxZZkL5nAHTbp9PT+RnE384lSTY=
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: shyamsaini@linux.microsoft.com,
	ardb@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	will@kernel.org
Cc: akpm@linux-foundation.org,
	bboscaccy@linux.microsoft.com,
	bp@alien8.de,
	dapeng1.mi@linux.intel.com,
	ebiggers@kernel.org,
	elver@google.com,
	enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com,
	gpiccoli@igalia.com,
	kees@kernel.org,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lirongqing@baidu.com,
	peterz@infradead.org,
	rdunlap@infradead.org,
	rppt@kernel.org,
	tgopinath@linux.microsoft.com,
	tony.luck@intel.com
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Date: Tue, 30 Jun 2026 10:09:11 -0700
Message-ID: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aj6SqipC/dIN01iN@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <aj6SqipC/dIN01iN@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_100935_383817_87924326 
X-CRM114-Status: GOOD (  35.20  )
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

Hi Everyone,

> On 25 Jun 2026 11:37, Mike Rapoport wrote:
> > Hi Shyam,
> > 
> > On Wed, Jun 24, 2026 at 06:22:33PM -0700, Shyam Saini wrote:
> > > On 21 Jun 2026 13:36, Mike Rapoport wrote:
> > > > On Thu, Jun 18, 2026 at 11:23:31PM -0700, Shyam Saini wrote:
> > > > > reserve_mem relies on dynamic memory allocation, this limits the
> > > > > usecase where memory is required to be preserved across the boots.
> > > > > Eg: ramoops memory reservation on ACPI platforms
> > > > >
> > > > > So add support to pass a pre-determined static address and reserve
> > > > > memory at a specified location. This enables use case like ramoops
> > > > > on ACPI platforms to reliably access ramoops region with previous
> > > > > boot logs.
> > > > > 
> > > > > Also skip the parsing of <align> when static address is passed.
> > > > > 
> > > > > Example syntax for static address
> > > > >  reserve_mem=4M@0x1E0000000:oops
> > > > 
> > > > reserve_mem is best effort by design because such hacks as well as memmap=
> > > > cannot guarantee this memory is actually free.
> > > > 
> > > > If you want to preserve ramoops reliably, use KHO with reserve_mem.
> > > > The first kernel will allocate memory, this memory will be preserved by KHO
> > > > and could be picked up by the second kernel.
> > > 
> > > ok, On ARM64 DTS systems, we can reserve ramoops memory in the device tree during
> > > the warm reboot.
> > 
> > The cc list actually implied x86 ;-)
> > Added arm64 folks now.
> 
> Thanks for adding ARM folks, I had just included whatever get_maintainer script
> suggested, sorry. 
> > > For an equivalent ARM64 ACPI platform, what is the recommended way to reserve
> > > and preserve that memory across the boots? 
> > 
> > I don't think it exists, but a command line option (be it memmap= or
> > reserve_mem=) does not seem the right way to me.
> > 
> > Most of the arguments that were made against adding memmap= to arm64 [1]
> > apply here.
> > 
> > If kexec is an option, KHO provides a reliable way to preserve memory
> > across boots.
> > 
> > If kexec is not an option, we should look for a generic way to specify
> > something like DT's reserved_mem for ACPI/EFI systems.
> > 
> > [1] https://lkml.kernel.org/lkml/20201118063314.22940-1-song.bao.hua@hisilicon.com/T/
> > 
> Well, kexec is one of the option for my use case, it also requires
> memory reservation during warm reboot, I think memory can be reserved in
> the firmware but this will create a dependency on firmware for Linux
> reservation.
> 
> It would be great to have a in kernel memory reservation mechanism for
> ARM64 ACPI platforms. I believe some other use cases like PMEM
> reservation would also benefit from this.
>

Following up on this, As Mike pointed that reserve_mem is best effort
reservation mechanism, so what is the recommended reliable Linux
mechanism, if any, to reserve a predetermined memory range during
early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
one option, but I'm specifically looking for a solution that preserves
the region across warm reboots.

Please let me know.

Thanks,
Shyam

