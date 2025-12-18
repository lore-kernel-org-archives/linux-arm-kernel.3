Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0026D68BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mxIe2RWCdQyoniiqHbqT+fSW/1ncegpctg5OKn3wFA=; b=4Kypgl9UJxtaiFSUD4em7GOYXI
	SsFqK6QBNprjg8RLrdxBtEkd9n19YTenOllF+jaDYnAt9e0SlI4VUcUbxcVWsYRHoucRlStobKzcO
	g9MsKVGTOTR/Ru/UPg5uN7Vu4IjZSImknDqZFhCWRjcho4GynCFG1LB8RMUg+WC/z0kcRJn2MtBVU
	IH+kmK+xVCBDIIX5dS1xjXtl4ALnBbwvzJD5tiUgjEUmn9+YPMn3XUtau688nMmmeHyHSEJLCBI9C
	JC1WXCyQCdUhKKm9wNnNTahNuv3NCQ3c3mWrV27vLP5XjCsLJQ4rn6HbHxY7QEDD+fPVkAn+ZiUSF
	NleKPXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9YQ-000000084d4-35Jm;
	Thu, 18 Dec 2025 08:40:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9YO-000000084c6-1VqT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D01A4405A;
	Thu, 18 Dec 2025 08:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4B5C4CEFB;
	Thu, 18 Dec 2025 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047207;
	bh=ofPz3WZxF0qhrxc5N6KO0WklVZWUMGP/4at4uzuCx5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmVVJePJGXR+kQkm3+r1Kbt0GyikF3QfUnymI7CCZrHKsRgARfO2o2ba2kB+bpPCT
	 UHrvTWZoxuQAIRQXxc9I5NeoAcCrZBmmcrAlJnug5BaQTQvVwVqvaJjDuY33ZMzoy6
	 BAr6jLOIpi2I8WC82e6kp81I8nrCa8WqCHQlSBTqZwv7g1LhXawg+JG4WGZSyz9t7l
	 lUOt/NCn0KCw0dStvCGVQTawL+HWAy5Lrwn0Gx39IwmYRZLbytZdLLUDYSPzigtubq
	 ZxR25apmkkEWekeoA8W1U6GFN06j4Og1ARDAkIDWxQbraNlGOfxULa77Gl1qMs8cke
	 OZqPmHVBTqbAw==
Date: Thu, 18 Dec 2025 10:40:02 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys
 interface [qemu test failure]
Message-ID: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_004008_441496_1038AB6A 
X-CRM114-Status: GOOD (  12.93  )
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

On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Perform mechanical conversion from .map_page to .map_phys callback.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> This patch causes all my 32-bit parisc qemu tests with C3700 machine
> to fail. Network interface tests fail, and all boot attempts from
> any kind of hard drive (scsi, usb) fail with this patch in the tree.

Thanks for the report. I have a fix ready; I'll clean it up and send it out
by EOD.

> 
> Guenter

