Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13BCCFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+Nt4PwtSCWJNIshSoQ6Pe0T+do8j4Lql840RsA+7Cs=; b=pfYA2jPRn17P2qM29edIyJ2V6L
	cysr8l/rBxcggbIqtzKHfSQeJFEYNOMXrhrvP25snmgqAqtHwoOLFoyalpEeEHhwkyY96kUbjFkmK
	QIta58/QkAGGG//hIjXHPHzV8mUPPRL5Fi3NcjWobygcsJRuQnPg6ijydxitNIOmYBYyXIpOFLdz0
	OBVdrd38U64z6T/zOW0qPsDRZeDUa1r24JqBBGfjmYtad+d2n7ahvC3WZ/9Qp6rl8LH08YfXP8Zjc
	mSt3iPfA+MRjgh50SMAu9xFx7JuvaTYL7b/pQyaTh3cbXpqMkKoh6kC3Xf1N8pazJ5CcI76eoXMjz
	iZMCa7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWOm-0000000BiT9-0rJx;
	Mon, 24 Nov 2025 13:14:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWOl-0000000BiSi-1Fmf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 13:14:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66699601B8;
	Mon, 24 Nov 2025 13:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E64EC116C6;
	Mon, 24 Nov 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763990070;
	bh=RkP3XoBrROfWxpPBrDgZoNSdZ6SM16qUrh12yE+95MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmZ/16DT0AV5S1MN9ZABpryaAZ3eE5oVUK1vVTDTfYkNQzDDlagWodLtTcSEHSRHE
	 bBx8CzXdWq6kmAoB0um7jWzu6RT21Mfp0Y3UUfrAI5iWePndMdFXpN7ipEpuY+4Xvg
	 wUGWCymAWyCllQgPeKsZ8sBhc3U6xtF/RTRcQlBafh5TYS2ZCqC8fIh3Ys8LYgDJUW
	 xYw++b6a0Eae2yMUU3qNcVzlRd20nTzHxqDqLVCgqcj6fbs1H77qJSk8OYmdc7VyP/
	 Hx1Yi91I9FhKM2ctMbelRoQU4RInZZX77QIz2CdYeKYKZ2up2tFxBslyS0aHGgWBZz
	 S4d793LsYiBxg==
Date: Mon, 24 Nov 2025 13:14:24 +0000
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, catalin.marinas@arm.com,
	gshan@redhat.com, aneesh.kumar@kernel.org, sami.mujawar@arm.com,
	sudeep.holla@arm.com, steven.price@arm.com,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] GHES firmware can't be readonly - Was: Re: [PATCH
 v3 3/3] arm64: acpi: Enable ACPI CCEL support
Message-ID: <aSRaME9ZO-nchE1I@willie-the-truck>
References: <20250918125618.2125733-1-suzuki.poulose@arm.com>
 <20250918125618.2125733-4-suzuki.poulose@arm.com>
 <20251121224611.07efa95a@foz.lan>
 <4a750da6-7883-4afa-94c1-4806677e61c2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a750da6-7883-4afa-94c1-4806677e61c2@arm.com>
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

On Mon, Nov 24, 2025 at 05:21:00AM +0000, Suzuki K Poulose wrote:
> On 21/11/2025 21:46, Mauro Carvalho Chehab wrote:
> > Hi,
> > 
> > Em Thu, 18 Sep 2025 13:56:18 +0100
> > Suzuki K Poulose <suzuki.poulose@arm.com> escreveu:
> > 
> > > Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> > > As per UEFI specifications NVS memory is reserved for Firmware use even
> > > after exiting boot services. Thus map the region as read-only.
> > > 
> > > Cc: Sami Mujawar <sami.mujawar@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > > Cc: Gavin Shan <gshan@redhat.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Tested-by: Sami Mujawar <sami.mujawar@arm.com>
> > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >   arch/arm64/kernel/acpi.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
> > > index 4d529ff7ba51..b3195b3b895f 100644
> > > --- a/arch/arm64/kernel/acpi.c
> > > +++ b/arch/arm64/kernel/acpi.c
> > > @@ -357,6 +357,16 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> > >   			 * as long as we take care not to create a writable
> > >   			 * mapping for executable code.
> > >   			 */
> > > +			fallthrough;
> > > +
> > > +		case EFI_ACPI_MEMORY_NVS:
> > > +			/*
> > > +			 * ACPI NVS marks an area reserved for use by the
> > > +			 * firmware, even after exiting the boot service.
> > > +			 * This may be used by the firmware for sharing dynamic
> > > +			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
> > > +			 * as read-only.
> > > +			 */
> > >   			prot = PAGE_KERNEL_RO;
> > 
> > Please revert this change.
> > 
> > Making area reserved to be used by firmware breaks some APEI
> > notification mechanisms:
> 
> Thanks for the report. Clearly, we missed this case. I am happy for this
> patch to be reverted and we can work out the handling of NVS later.

I'll revert the change shortly.

Will

