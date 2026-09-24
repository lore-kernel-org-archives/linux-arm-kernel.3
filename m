Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350C7C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdDMda8r4WwZc2FIfUvENU6Q7ef5l25LCcitsu6RJ8w=; b=iYVlPBFBaYF3ZSvi55SlcyQkmz
	XxpIp6AsVugXI343048WX1wwyL/itlejFeBQP74aH1nwvgV7vh/Jmkg57iKBdCnffi4he5NKwXsze
	xCem74OD3zXKMOzRZCpd1a1iB8wuSF08zPGi6Nb+7o7wYyqexsy5YCIG9B7HyEksAVvuhJw1Z9PHb
	AGF2+FzD4hO8Xf7qQcSY+yKZBvHAaVmINE1ZuNgn7ImUxYf+7TVkO8Z1dSIZKo/3JM3H38kiPayIz
	GFjcVLX0q8JLwjBSXsEBQ5UpqgGmLNfyWb5Tm1ftq34qB05vmzRToKLqwamFlRUOc9L/S0PFLdL7B
	TpdCSO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hfM-0000000AsFj-2nzx;
	Thu, 24 Sep 2026 11:31:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hfK-0000000AsFD-3zvM;
	Thu, 24 Sep 2026 11:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RdDMda8r4WwZc2FIfUvENU6Q7ef5l25LCcitsu6RJ8w=; b=WOXOegZsdKug0GvqnTn5aseFPa
	j1kmyZlMqi/EPjtPFvC/QLaazRhvLkYBhYO0iq9dNmrKk5kU9SnuvNGpa0oCPCoPRnRupBQYlS0mQ
	ZUirkWyRg+aV0taInPcr2JXQBRC69TtrARuuuqdIjs6lYDgYhZvgY+LItAV4yLC5BfaedDiYQmG/H
	co27A44Zte1Sm9XgGQn3y2U2dukt5DtM6MfZLPMMhdhXpv8VUUSYHzqaUcEFG0KyVwqdeG7/OJUl5
	NIJva/fTmhmy3HO8YcGyXJV2kJFuKPU/mU3Ttdvu0+uTa2tLpQ/KO30FvZ2s3mJUr2uIRy8jc1kyu
	60zX5zPg==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9hfH-0000000FuEh-3yRq;
	Thu, 24 Sep 2026 11:31:01 +0000
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 1421E1C7465;
	Thu, 24 Sep 2026 13:30:57 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:30:55 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Daniel Drake <dan@reactivated.net>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 0/5] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
Message-ID: <arUJxhEDFYSIUp4e@8bytes.org>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_123100_198861_CAB5E1C5 
X-CRM114-Status: UNSURE (   9.34  )
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

On Tue, Aug 25, 2026 at 09:56:03PM +0100, Daniel Drake wrote:
> Daniel Drake (5):
>       iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>       dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>       iommu/generic_pt: Add Broadcom BCM2712 page table format
>       iommu: Add Broadcom BCM2712 IOMMU driver
>       arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes

Applied, thanks.

Please submit a follow-on patch adding a MAINTAINERS entry for the new IOMMU
driver.

