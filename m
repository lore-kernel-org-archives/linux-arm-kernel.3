Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B2CC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avuh6Og9p0aKaIBlcuzJBoKk7NCWagcKodZZuZcN8OE=; b=bBJ5cwC6Et/0f3pYXidY62+8pE
	Zgey5dWbL7V48YoqB2bf99kCFRz9s7sK4YFwZT3SdtOF/olzolxaSx8MwbleSOwyQVcf9l9DAv17v
	WcID5q6zPBRBCl3qqzAJ+jmlI6BjJVV4sXAOXEJ60hg98nufZeVyeTl16t0thihz0H4EvBkjclA0b
	KmA7gSsvjy4bCyAgVi/IfxGpM97J01NFIvmTVH9TcPOsAVE/mFFeU7Rk//o9r5w5WWkh1VGSMNXRe
	7OPqJT/GdggKWCMBF1GJ7pd477/mmdnaiFgW67izqcgJc36mOdYfuc8Pw1uRfu/vjqkOvwOsvS1hb
	SwS7T8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ecg-0000000BoNB-2bXu;
	Thu, 17 Sep 2026 16:06:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ecb-0000000BoM1-40CW;
	Thu, 17 Sep 2026 16:06:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 723D01476;
	Thu, 17 Sep 2026 09:05:57 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0930A3F86F;
	Thu, 17 Sep 2026 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789661161; bh=9mcxnDc8qxIpxmpk6T3Tp+BnQwg+ATLN/zS0rC02bj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSTmFOj/SjkZUclQCqE4zTW0vk94VTD2VbErQFckNg1Hf9DqR+Wb+AcjT1kbXrZTY
	 9NCVL8hRLjredBc9QRerBZnnZDifRLrHjsitRjiaswGzll4lpHF3AB6KbXTdEHKJsU
	 MLwoOZ4/t3+aNJhsyRfmX7PHIpukuOpzzytXFkiM=
Date: Thu, 17 Sep 2026 17:05:53 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
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
	Xu Yilun <yilun.xu@linux.intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4 4/5] dma: swiotlb: Add an overridable architecture
 pool opt-out
Message-ID: <aqwP4ZKugUpFezV7@arm.com>
References: <20260914070135.313337-1-aneesh.kumar@kernel.org>
 <20260914070135.313337-5-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914070135.313337-5-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_090602_036011_65CDFBF4 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, Sep 14, 2026 at 12:31:33PM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index be3962a33fc6..ef7a776ee508 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -20,6 +20,8 @@ struct scatterlist;
>  #define SWIOTLB_INIT_ADDRESSING_LIMIT	(1 << 2)
>  /* Initialize a default-sized pool that requires architecture remapping. */
>  #define SWIOTLB_INIT_REMAP		(1 << 3)
> +/* Do not initialize a pool unless SWIOTLB is explicitly required. */
> +#define SWIOTLB_INIT_FORCE_DISABLE	(1 << 4)

Nit: maybe better as SWIOTLB_INIT_DEFAULT_OFF. "Force" sounds too
drastic and it can be overridden on the command line to re-enable.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

