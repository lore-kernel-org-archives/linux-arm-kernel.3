Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C141C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4uGJaO6CiQ+BOkMaEb3vXSEtDR7OaemRf+6gDznWtc=; b=CAYYnMhsn0axSD2JIN2ipgaims
	uEyYSsaI3gQefuLcsOC9EF/3sIorDYLAqHwd0dRWBk2NGI/Ngmuv308QDF/s7ikPI0QpCELBfaKuA
	0Ax+Luy/E2oZqnkvFhuSoYDAznNU5jWnAtPj+8JtB019AQahvZ/HC5AKapbeERM3KB2KlmjGskVgS
	ylGIEvj1y/8vKZ8FgEKKTDA5VENyvIO1t76sI8/0nCt76yiD8tb4CdYcdx0Jk5nSbb5J+3Ua8yjT6
	RMkg9jXEzRRO+Bwm4cnOKmLVL1KN2briPUsOdD8ghE1wyHilYfYsouw+lZEp9ee5jC2SimyRMeMQD
	+gmkYaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLpX-0000000ECrP-4Amb;
	Thu, 19 Jun 2025 20:25:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLEM-0000000E7vZ-25YV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C93D5A546D1;
	Thu, 19 Jun 2025 19:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547E3C4CEED;
	Thu, 19 Jun 2025 19:47:21 +0000 (UTC)
Date: Thu, 19 Jun 2025 20:47:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, yang@os.amperecomputing.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	jgg@ziepe.ca, nicolinc@nvidia.com, jsnitsel@redhat.com,
	mshavit@google.com, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v7 4/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Message-ID: <aFRpRnXi3tP_iHEJ@arm.com>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-5-miko.lenczewski@arm.com>
 <aFRlDSZ2PPnHixjc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFRlDSZ2PPnHixjc@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_124726_601348_1A303B75 
X-CRM114-Status: GOOD (  10.63  )
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

On Thu, Jun 19, 2025 at 08:29:24PM +0100, Catalin Marinas wrote:
> On Tue, Jun 17, 2025 at 09:51:04AM +0000, Mikołaj Lenczewski wrote:
> > +	if (!system_supports_bbml2_noabort())
> > +		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
> >  
> >  	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
> 
> Eliding the TLBI here is all good but looking at the overall set_ptes(),
> why do we bother with unfold+fold for BBML2? Can we not just change
> them in place without going through __ptep_get_and_clear()?

Ah, it's unlikely that we'd be able to fold them back if only one pte in
the range was modified, so this optimisation would very rarely/never
trigger. So, for this patch:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

