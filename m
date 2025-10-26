Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D4BCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dr/rzi95WLg/Q0IBg7hU4+KdgBC8XDqy387/vcjoEfM=; b=PJMQEsZuHwbxs5WGRSDGRawXKG
	rmJJ3+SZ4WbsYGGpGqVb8w0sOYEM+3SfcChsd9YUcGz45AwtWNEqio78Uwk+rymq33uHqJCgaoWOX
	XuhYwF7GEayfM/HDoaq+FGWn3BpK2qVMlD5AolKoPY3PVE9DgL8sCWoAha/M2UE4qIcG4R0r1F0ch
	79Pclam5tAKnKAWAo8Q36389d/5EkCy2o1HvwDwEy9znNjjLPt9Z6G0pKuPdnGAXWGTkmXT0xhqA8
	tkpvTE00m3evIbExz2ct18LLpDDXJQLnoeFvB6dxYyWf8jC4FLithj1wgYPbneVATbXQaamyZKqrz
	IdnJ+bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCvKl-0000000C8a8-20Ez;
	Sun, 26 Oct 2025 07:38:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCvKk-0000000C8Zy-0p62
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 07:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10582602B6;
	Sun, 26 Oct 2025 07:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEC0C4CEE7;
	Sun, 26 Oct 2025 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761464312;
	bh=tE6duDWkMhf/izPfcVJAu0QGF5RniuWMZJNurHMPV4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+Fmvy/TkbKsHE/ly3nNuV5cMvplX6wPfLQ8hDaDmyX3wLacnUE7JOG/nZvuUxvmv
	 CczVISfw5M2fl/jL4dxMpQZjR+1heTwgUYiFF7wTs743d7UeCv0GILFXzjGlxgVBC0
	 oE76qdMbU/6QmYSolZLhh/1ehXnuAH4Wfx1TxENucSoXAohh6TFciSEQZaKMP7NYm1
	 JNqz8+TYhassoC4ST69Mi5FA0Qr+hRmr+2UhbjR5EKFyOegX19oAs4ZZ/0v57u0VQ0
	 /l9R6yk8RlGVj+rmA/30TcaUiEVUwLELSxYEgJrK1wn3ZV8WITcnHNlOkzodvgsSHW
	 uuxeQvWuJFb7A==
Date: Sun, 26 Oct 2025 09:38:28 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
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
	Magnus Lindholm <linmag7@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
Message-ID: <20251026073828.GC12554@unreal>
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
 <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
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

On Mon, Oct 20, 2025 at 06:27:32PM +0200, Marek Szyprowski wrote:
> Dear All,
> 
> On 15.10.2025 11:12, Leon Romanovsky wrote:
> > This series is a combination of previous two steps [1, 2] to reduce
> > number of accesses to struct page in the code "below" DMA layer.
> >
> > In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> > callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
> 
> I would like to have some acks from respective arch maintainers before 
> applying this patchset.

If to judge by git log and lore for some of these arch (didn't check all),
you won't get any response and will need to make a call by yourself.

Thanks

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

