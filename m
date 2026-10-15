Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A31CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+imwRzy+TFjWbQ+yNo83g0lH0n4xVBCsI1vuUaGOns=; b=Rl5xOrjdSOmGyx+52Au1Wdpuny
	KloU8rbTguRQR0PmjqYAM8ZJs+gwa4BcJEdxK92DZoh1UUTh1YIKhvPMB8BQyf9MmrxdRe+4OtpZi
	IHImy8LFJEqdksV0H5m18SXICu2oSSBRRWJlriZJhF/WKYHnJH74wAnbfNHF7V5Pz04DvqYimD2Vv
	oAnCKPM3gbIMxeiwnSIT9BjXv1bVaiDw7+DrVr+6CcHE5j1TR0FMiVgnIgUVwCQyH+UpwuKgPYBAi
	CcMhHzou7w8KMLqlOJTeTGGbsycL8qkrNRqMxfejwRZPTqb8nHndNgESGuAzDmTS+zmoGj9s7VdBn
	vp1xa5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHO9g-00000000o5S-0P52;
	Thu, 15 Oct 2026 16:18:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHO9N-00000000o0z-43wP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 16:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BB60601EF;
	Thu, 15 Oct 2026 16:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EFC1F000C4;
	Thu, 15 Oct 2026 16:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792081068;
	bh=c+imwRzy+TFjWbQ+yNo83g0lH0n4xVBCsI1vuUaGOns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YRFhddnOwD67BDUZz8e+5AHZfAUyqZTD22qHQFLAaw0mX2G1Td8dj64kQAcpTaBmB
	 an3MHuPXbXjRjAAWTHrEfeCBQ23VfxijrwFYdpjokFn7IMZaO0aDLYDSllOGxzPnca
	 j4f4TyUtOAEnSWlIctPI1smEokMCFZ50ju4VKrdM=
Date: Thu, 15 Oct 2026 18:17:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/15] misc/arm-cla: Add launch operation helpers
Message-ID: <2026101542-briskness-most-a8ca@gregkh>
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015142552.4128028-3-ryan.roberts@arm.com>
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

On Thu, Oct 15, 2026 at 03:25:36PM +0100, Ryan Roberts wrote:
> From: Jean-Philippe Brucker <jpb@kernel.org>
> 
> CLA commands are issued by writing optional payload registers,
> programming the LAUNCH register and polling LRESP until the hardware
> accepts or rejects the operation.
> 
> Add a common launch helper that performs this sequence on the CLA's
> local CPU, waits for LRESP completion and translates launch response
> codes into Linux errors.
> 
> Build accelerator reset and register read and write support on top of
> it. The register read and write helpers split larger accesses into
> multiple launch operations when an access crosses an eight-register
> window.
> 
> Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>

You forgot to sign off on patches from others :(


