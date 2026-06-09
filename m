Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CF5CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuuGrD50s5G3lD4/z7kBXBEhX4EmmbgTscTqHB7mZBw=; b=H9QwgASNeLEk5asT6gLPQZqBRU
	3TXw+lDfwmFWkhEnK06AXWYEvdsSOn4rcIuQaf19pq8hMo+danbEjTa+hnWIGLqltOt2lxut5QhtA
	9yFdmLn4EIiTFbdchp1pfemFWG017lrDtgmILtlFs99hrB+ntltZwXrJyqzjaNdz/9HmIv+M8/Nuj
	FpYFA/+fmTU1nR3wfnld/XgEkeMj6fGGr5IU+fWRyTFAD1xs0Pa+5+6KUrF+nyXohcyjKv9JtC+Hs
	c4VfLnCbl8d3mRB7NMuLrOsGdNgRJ0liLEh8PtBmRa72iSQfQ+Tnj+xRDgcFUa1gWrQgmXprvkj5E
	3xVTaobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwku-00000005grR-3nAR;
	Tue, 09 Jun 2026 13:44:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwks-00000005gr7-0Pyf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:44:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CC782680;
	Tue,  9 Jun 2026 06:44:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E49E23F905;
	Tue,  9 Jun 2026 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781012671; bh=sAi/28Ft7rUbm6jJKXWvzjgglgd9xi220pLzfWlK/Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gKioAK9AfWzXIl8F+KIX30lllhvxwMiVRvIFqydsD0FsElstjxRZAfMI51W33L2KM
	 GPIVct1Y43GhET5ugQ/BxbruZ05sXnpwZnMPS8+Yqkf2/gPN0mjEdIyCnScHgQyqqN
	 ilwpJkC/4+BPsJTt/AyPUC1vxz8ON2m0+P4pPjsI=
Date: Tue, 9 Jun 2026 14:44:24 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Halil Pasic <pasic@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Jaehoon Kim <jhkim@linux.ibm.com>
Subject: Re: [PATCH v6 01/20] s390: Expose protected virtualization through
 cc_platform_has()
Message-ID: <aigYuHoKHPJPCGjz@arm.com>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083959.1265923-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064434_176020_B254FABC 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jun 04, 2026 at 02:09:40PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Protected virtualization guests use memory encryption, so advertise that to
> the rest of the kernel through cc_platform_has(CC_ATTR_MEM_ENCRYPT).
> 
> s390 already forces DMA mappings to be unencrypted for protected
> virtualization guests through force_dma_unencrypted(). Add
> ARCH_HAS_CC_PLATFORM and provide the matching cc_platform_has()
> implementation
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---

Nit: just drop the --- line if you did intend to cc those people.
Nothing wrong for them to end up in the commit log (proof that they've
been cc'ed if they did not reply ;)).

-- 
Catalin

