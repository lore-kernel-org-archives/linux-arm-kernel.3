Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C39FCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz0Rir68dfVLNeA+kqLkIpgtVfATL7Zz4GqfoJVdUA8=; b=q52ecD8SHdMdfcMKpFDFdeDk9y
	1yMKcyr2VXVPV/hMdn9j7J0jLlK3v+nenfovjsp1wlkjz/5w3ubfh7c60mrb+tW3euKVV2cSCq1Wj
	4VylvJinvxGK3YFvu3YgW2pO4kSlI44Bv3ucoszItvYMANrT3WErakfbTqUj23UlNpEmknofS36pE
	T5ZLW+PQemUygBwAaCa/XE/CUdOAwqt7y12kMMiF/5hhWIE3aY8F9GCtSjcyvKqJGpldQUir+4HPa
	VfmbppSUTSWIqiFxfVKJdlAZCv30EjcR18IolWtmpD8e9/fESuzAINFqg7KIYhkaIvUAJEvDz6Q1w
	VgpZ992Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2z0-00000000bue-21BT;
	Wed, 29 Oct 2025 10:00:46 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2yw-00000000bsi-3ztM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:00:45 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027;
	Wed, 29 Oct 2025 10:00:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761732039;
	bh=Lz0Rir68dfVLNeA+kqLkIpgtVfATL7Zz4GqfoJVdUA8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Q8nA+g0P0Lp8yYsVx23P8MkKmaRp5d92Nf+2imBS2NlZqa8/5ThIee3tXBOiLNt99
	 PjQedQ0JFXgKyV+emfETcayFtfRKIpSeQMZ0pgMqy9Wn3IoNaAw6sZ7VjxwGv7ehjb
	 3V9ekRK8wOTbOvttHwAsGVylPABrI1wC7ZTCqE2c=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618~y7fRb9PRk1129911299eucas1p2W;
	Wed, 29 Oct 2025 10:00:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251029100034eusmtip1f745a429892e79db9ec765d9fa07cdc8~y7fOJa_AZ2915029150eusmtip1F;
	Wed, 29 Oct 2025 10:00:34 +0000 (GMT)
Message-ID: <5e6eb6f0-fbbb-4359-9c40-075b25231e0d@samsung.com>
Date: Wed, 29 Oct 2025 11:00:33 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
To: Leon Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Richard Henderson
	<richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
	Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
	Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, Jason
	Gunthorpe <jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_030043_252119_4AFC244D 
X-CRM114-Status: GOOD (  11.15  )
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

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
>
> Thanks
>
> [1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
> [2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

Applied to dma-mapping-for-next branch.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


