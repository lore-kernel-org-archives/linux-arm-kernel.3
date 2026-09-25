Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06B4C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 06:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUtj2Sr5gs9R557K5H+4iH70W6+BzWz3euZXf8iY86U=; b=UxLx/Alm1NVvpytmtDrdlHrhLD
	zkhfreq42r4pYE33DKetXZCbjLm1ZDsyLM3iosYaTnquo1T6YBjTi7GcjPMbAPsAgyQXsOIxozK9r
	WEm2pHQfK2FyKpDYAxtQjNy2PiVyH2OJwZzlEvAsrL7dIjDisRO7lUWJBfDvvOxVQRB1NYHq7DyQL
	CLNgqVDeAY1HVbDaLY4IMPwFsJooMCVRwDTE5xyDHJb9rD6h3kwtxavJfk/+sLPyO3x5f+sedpftU
	AZrXoNEzoIZurM7C41aeAFES9hnTbbHcZLHbpQCYSU4iyalcaNNMK2ieB1ymSQ3XKU7a2WCrPbJHc
	Dp6J3fIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zVr-0000000Cko0-0GAQ;
	Fri, 25 Sep 2026 06:34:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zVp-0000000Cknh-32R6;
	Fri, 25 Sep 2026 06:34:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rUtj2Sr5gs9R557K5H+4iH70W6+BzWz3euZXf8iY86U=; b=ABj0TqcNVWA11fM/YwiTMOV8F3
	DHdHvVDITLy6y1dyRembvqXUbVsMKWxfMMttZYxbRbqdoMCBbUapSiPzBZn6yRNnq1ndO7qxyiplz
	ZtJ+n3l1zVMxxY6LsSJBXUwVnuxgW235n7G+6jxUrXVr3hgyoi3a1lU0rxjJE/kKbSJr/qkDwb/m5
	2nA1GNtzED6+O87yrMGtL+eyHdJ0fAdA0elw7fhv6JHmuuWYeCD/YDShr9zUDpJes7eIg7mLcn8oa
	38qeGuMwJlnxk06CFQRm+kK4QgKAsUZsOT3rxkwHZ6o6y0faaO9yL0kymIbZURMJJr+U86qkNM4hp
	TNEogjlw==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9zVl-0000000GeZx-32f3;
	Fri, 25 Sep 2026 06:34:24 +0000
Received: from 8bytes.org (p200300f6af404a000b03c3c046b119f0.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:b03:c3c0:46b1:19f0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 62B4C1C7759;
	Fri, 25 Sep 2026 08:34:17 +0200 (CEST)
Date: Fri, 25 Sep 2026 08:34:16 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Daniel Drake <dan@reactivated.net>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com, james.quinlan@broadcom.com, 
	Jason Gunthorpe <jgg@ziepe.ca>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/6] Add support for Broadcom BCM2712 IOMMU driver
 (Raspberry Pi 5)
Message-ID: <arYVR2QK4WPpTmTg@8bytes.org>
References: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_073422_425264_B7C0443C 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, Sep 24, 2026 at 10:10:50PM +0100, Daniel Drake wrote:
> Daniel Drake (6):
>       iommu_pt: Fix test_pgsize_boundary() failure on narrow-OA formats
>       dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>       dt-bindings: display: brcm,bcm2835-hvs: Document iommus property
>       iommu/generic_pt: Add Broadcom BCM2712 page table format
>       iommu: Add Broadcom BCM2712 IOMMU driver
>       arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes

Something got lost along the way, I didn't receive patches 5 and 6. While patch
5 made it to lore at least, patch 6 is missing there as well.

Can you please investigate and resend the full series? As Florian requested I
will then apply only 1-5.

Thanks, 

	Joerg

