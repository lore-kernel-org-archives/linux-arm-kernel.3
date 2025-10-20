Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07E7CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 16:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1+m70MIpIyLz0CgkjVmG+Zs9EMNilUICX9qZOez4wM=; b=jhUzA2GzVR4r3k7rhfci7cR3qI
	vNU56WKBD0xAtg7z4x6YtQNCQEGaf/n3MxCQ00ASjxK5+D8ylhilunRtzNsfw45v+xSHclyLR/gXW
	qklwhvafFTHn1dXPm//TKbMdkekpcr9uAd1KYPLR/c28ieAU8g7MwJG0AHDWxq/mf6B0Af4+JD8kW
	dhkpTxaDYW6eC8r/XaMSXTw9BH8cpmvIy0WKxA6dUFDEY8dsssQVGyi5qZLLvd+mh1PLukDrvfr9Z
	I7YvIXK7DSi75aBTVespX0CG0GU+8lBKi/Vzkc/ekSWvGe0Uiww8Wk60UU+K4F5AysIrTJbgKbglE
	ow+SGS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsja-0000000EIla-2P3d;
	Mon, 20 Oct 2025 16:27:46 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsjX-0000000EIjO-2izC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:27:45 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e;
	Mon, 20 Oct 2025 16:27:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760977657;
	bh=e1+m70MIpIyLz0CgkjVmG+Zs9EMNilUICX9qZOez4wM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KX6ZcktJJB15hpYlnrrgQKN5QMQizY7xdPAAhwp/El6wk7EM1ZJ6O6Pj837PofyJ0
	 migBg+i6L8vxe8bZ5F9hMcPUSOwsRbNZdnHxT7YLQRx589Age6y9jtnUV7j+rxCbcf
	 lscFl8Zw2Bwk6HlnV8xYW2UgmAXjN9fs/Wr5RS2Y=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6~wP9lIhm7s0044200442eucas1p1L;
	Mon, 20 Oct 2025 16:27:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251020162733eusmtip2068f969d861135995e1cd515194afc64~wP9hxNWHW2552125521eusmtip2Y;
	Mon, 20 Oct 2025 16:27:33 +0000 (GMT)
Message-ID: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
Date: Mon, 20 Oct 2025 18:27:32 +0200
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
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_092743_822409_5CC2C798 
X-CRM114-Status: GOOD (  10.79  )
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

Dear All,

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

I would like to have some acks from respective arch maintainers before 
applying this patchset.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


