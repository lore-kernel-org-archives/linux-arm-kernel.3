Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B7FD65556
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=; b=uZh53QxwcyNTH8a7n0yIOgCc8H
	AbylRMSumZ5/5GWo9PxnQ6tz/U6RmD9ukexj+LsgVcMPlz64JtDkjjodNQ4sCnkKFf3wWEUh3ipDk
	QatACZbDpx/iAzOAVOxfouXJHYGsFnIbNtCZDonmMFaTv7Nuey8dfEjDjjjqCLDj6fhuhCKPFvrNj
	eJt0193VM4ElnErc64SKrV037k1jD8HanlamQNtO1L+KByW13z74zUfAwmg1XqE7brCYr9OCk4Vtr
	KLROTJN/p2NelXoVDyv1OAD00mcUyvyl/rmE9NgQcDT2sLXDgcB+V7Z/7/bddBZkK9vgjMF6MhxXw
	2dgWsmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqTQ-00000006m6Z-2CTZ;
	Wed, 17 Dec 2025 12:17:44 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVqTN-00000006m5z-42og
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 12:17:43 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-11beb0a7bd6so689814c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 04:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765973861; x=1766578661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=Q+VmJ2wZxgMl4hlrNYdJ/rTrPdRxhAI0Gy3z7wnul3xy3jrUEpizky88zIOxLAX4aU
         l0/I56VUQZY2/ZkGugX9fVz6rAtdZJPFolggVryYshYJobFv4aU7eg78iOjyLOUh4Acw
         4WmrmI7koRW3YO4mmAvYAbcNbEgDxur7k0qI2xvGdiibAmT6aPxB20coA2llF/T63aaE
         o3gjh7fhahy8PAnKM5n5qTz1eZK+RXAk4ldHYA+GTsNBgojByOO2KOZKTFUC4eHmdwos
         4AYh9vT1AFdAoZRdu2WaO6GK5Wfje1sCsbrC6W0yYAMAvKfGmfjQqm7FyQZ4sAa/OM7W
         eN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973861; x=1766578661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=inLKTvbQvPE/tbSbDD1XZDFyfeYLfVyCNgpoGTG4BfVpDaVbPkOcWACeV3z9oLnanB
         2sS8sWnfR6gHKP1kHlYmgzhd14SirWHtn+p9WV/WSb/eNIrymBGa12/k1fbLFdxFwK/M
         a3v1tHoXaJT2xPfYkKhYu/OvC2pmuJBqANxVXf3mWu3BjOW+0z8q2eRs2SF+UC2QaKlE
         POUd6Xra6pKrEsuXjFq2xd9IOcw0SKe0+4/sD6Emll9WY36E9JabbS/v8V8LxY3Bvfc8
         3a8Ut61kNMvQZ3RsbynXlKstOG1Ac7/qoQnU/cFAbMtryRDMlvKoIfq6zvDHBHdsLq5y
         hJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0Y6XGsZfqY9Ga86lio52mKuUW7m6q2V/Fsqr7TR8+uzGMQ+OmqtntR/vTQHYw0Sys5aYVzanoSChP1PojAJDB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg4OJO22OXh62AQ9pb/UKh5n8P2l6xUIG8iQGJQVgq4t04l36d
	9SaRRjxVFdmGxolI2LedlwzkQ0iX5DMyccpmh+9SsNo6gVw2eLZw/EzM
X-Gm-Gg: AY/fxX4oOPwL9DkS4UUFfx+ICx9cFVNJTcW82UpMatyO69RTs5YFKqdWbHD93+fNAFr
	q230LY9KJmYEqFkyBZKDYXEFP7fRE9+I3Ts+PFT5eP752BEUG6LOlwveCnmD9bAIm97HWpVYBN0
	TBjt1Ymho2XcZv3cidoMsPHCEtGFJAFmwr45eaa6Bq1XYrqCIibaYMCdQ8u3HhoBbawsFMWSVmW
	dRE8CBAPM8ANbPfw1J48TSzP1nybs1gGKmwf7s1E4WKKFR4nKCZqdCWVApJcHnF6p8C0RaMCfk+
	EixbBx68L2hF9pbnOsLXA19Jv2VI/gM6zVVthex83rqoUfOntQ7ebIl1UhcXAp3iC4FHpxJcu9j
	iqIqewiAmY1Xo1851Bu3drP2EqLzZIhWoL4uJ9md7Na7KQUz264kUn6/PqBuL8cSZdAWx8dj6jw
	E0Kbw04N+qeRT2+s654EKx2Po/
X-Google-Smtp-Source: AGHT+IHtTckxV0BrLKUtwEMMlG/KT0X6JCzQ/eEGNn1nvrPgi11fSB7RRA3IhgmdXndE9lBsM2aS9w==
X-Received: by 2002:a05:7022:e806:b0:119:e569:f86a with SMTP id a92af1059eb24-11f34c29cefmr11289687c88.7.1765973860378;
        Wed, 17 Dec 2025 04:17:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm60713771c88.17.2025.12.17.04.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 04:17:39 -0800 (PST)
Date: Wed, 17 Dec 2025 04:17:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Leon Romanovsky <leon@kernel.org>
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
Message-ID: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_041742_010516_F293C111 
X-CRM114-Status: GOOD (  10.29  )
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

Hi,

On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Perform mechanical conversion from .map_page to .map_phys callback.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

This patch causes all my 32-bit parisc qemu tests with C3700 machine
to fail. Network interface tests fail, and all boot attempts from
any kind of hard drive (scsi, usb) fail with this patch in the tree.

Guenter

---
# bad: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'HEAD' 'v6.18'
# good: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag 'drm-next-2025-12-03' of https://gitlab.freedesktop.org/drm/kernel
git bisect good 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
# good: [09cab48db950b6fb8c114314a20c0fd5a80cf990] Merge tag 'soc-arm-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 09cab48db950b6fb8c114314a20c0fd5a80cf990
# bad: [701d7d782d98242a64cdeed90750f88ff733bc39] Merge tag 'spdx-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx
git bisect bad 701d7d782d98242a64cdeed90750f88ff733bc39
# good: [66a1025f7f0bc00404ec6357af68815c70dadae2] Merge tag 'soc-newsoc-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 66a1025f7f0bc00404ec6357af68815c70dadae2
# good: [c84d574698bad2c02aad506dfe712f83cbe3b771] Merge tag 'modules-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux
git bisect good c84d574698bad2c02aad506dfe712f83cbe3b771
# bad: [b0319c4642638bad4b36974055b1c0894b2c7aa9] Merge tag 'nfsd-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
git bisect bad b0319c4642638bad4b36974055b1c0894b2c7aa9
# bad: [e637b37a520513a04d00f4add07ec25f357e6c6d] Merge tag 'rproc-v6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
git bisect bad e637b37a520513a04d00f4add07ec25f357e6c6d
# bad: [56a1a04dc9bf252641c622aad525894dadc61a07] Merge tag 'libnvdimm-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
git bisect bad 56a1a04dc9bf252641c622aad525894dadc61a07
# good: [d0cf6512bbcf77afb6102f886fcd7fd48b7ae043] rust: bitmap: add BitmapVec::new_inline()
git bisect good d0cf6512bbcf77afb6102f886fcd7fd48b7ae043
# bad: [936a9f0cb16b0646143f8e05afab458adc51d0a0] xen: swiotlb: Convert mapping routine to rely on physical address
git bisect bad 936a9f0cb16b0646143f8e05afab458adc51d0a0
# good: [14cb413af00c5d3950d1a339dd2b6f01ce313fce] dma-mapping: remove unused mapping resource callbacks
git bisect good 14cb413af00c5d3950d1a339dd2b6f01ce313fce
# bad: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface
git bisect bad 96ddf2ef58ec070afa8275f371b619462cd8fb2c
# good: [e4e3fff66a57a7aee048e0737a16874aeaffe9f4] MIPS/jazzdma: Provide physical address directly
git bisect good e4e3fff66a57a7aee048e0737a16874aeaffe9f4
# first bad commit: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface

