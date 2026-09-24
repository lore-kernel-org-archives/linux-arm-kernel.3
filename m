Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F0DC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 00:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjIsmWZd9CC+h5zUSaWzkTJZkaeJqJLSvYoM6LHxRv0=; b=z1bJNLpszkCD2ZwurTCfnoCX//
	wz0cdYbuyJQgz/p05/zuPvuBjIcLZNv9VIa9mi9oLvXsSh/XjKvhKsW5vrHEDXxMiowGh92z52NL6
	x+knPSq794wVrLgkW/Ro/kaRKkDL26SRTyB35mrOEruuUqOZIVekF+ay1aZPokq4u6NcynTQg9PDL
	+dHceV8pmQKypBVGlvaDvVXoaNH54S1HMeMntKEAFYNuV7Oh4Lj8TFfyggemw27Th6HAmeO7knkBe
	EsJi1VYk+G0ap99wij0NzcBvZNxaq0vwV3R8Ry/Nqc8t+5EdLJsV4iERPIZwtCXaJbwVgVSTDnJCs
	lZ/bNERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9X7E-00000009k93-1hoK;
	Thu, 24 Sep 2026 00:15:08 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9X7B-00000009k8U-2E6n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 00:15:06 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso363515e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790208903; x=1790813703; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gjIsmWZd9CC+h5zUSaWzkTJZkaeJqJLSvYoM6LHxRv0=;
        b=axUPAzLs7nDsXMjgngiSeaVlcQo5Ftab1elWGT9ExNOu5JgELIQaOw9OsPns4dm3wp
         248uRDp+LrVZDefqQhypf6klEkujyvrMkumPsGT3iy6tzgnCkkJk+j3Ge2uOPs90b4c6
         0xzKrgp7utoan6SW6rK6U/EzD6Kjr10q6x7gQWu+lyezQcxi+RDWpUv5lCdkxwMBOnCt
         zdJWctOTTqnVHPWOSxpXPjSRkMGxZYZtfipWqJOjkJuhhkuyQWmK5iN+K5PXvAp04yFo
         aJuFEqnP5q0O9Prvf/RLg3vCLSL1+LC4f8nJ315nsv05zkdg/cmkHJ+9zILI7nPcCqU9
         OQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790208903; x=1790813703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjIsmWZd9CC+h5zUSaWzkTJZkaeJqJLSvYoM6LHxRv0=;
        b=avPJYyvA34O05AxjX+1q59VQ9zvVNkob3kzPo/vyux+6npQre6YZYmqJX/cEMm0wHN
         eD/qzyxgf/2BuCUfIetsMgOte1BhvugSLPa29XE88l/u4AYing24f562PhUYiMnN8AVF
         cQHCxBx8roxmUf00tidhFkY3jnhYWiWFULrcwJ+mPfbyByS8+d1f+c4tMJ811GA68dLX
         CsoSE7Y0vjqYziAWOEWb1LUbi+RW5RQUui3W0K+wyTtbbVFLqxAaZknn8C19YPDhDXCN
         fnMxTiieJpbLTTtT0EuTJDTQtqW9bWMUvU0wpbs/asDlvV//RMFCH50qE1tLiNCd16bs
         FKVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6kZDdgDn1lXnp/XndVZax0EVSNjnSejdfe2ePU/Dejo5T6LmMUpg/WtcBukIqW4K15VC78E4GgOM73vNmFVvU@lists.infradead.org
X-Gm-Message-State: AFuF++keKCa+by1ep9yEQMyyscHozuVJiTLvcwDgFo6dA5OoNDEfsNss
	7TQemy+IIZK1AdmmzxWqzVS1bAaUr4XEvHNk6OXsMEWKbm+Ubvdi7oRw3NDqaB7XU84=
X-Gm-Gg: AYBFou1w8NfqF+1vzOpE0ecxUXwm9BLiH9bi6YRecFb0u+wpkgC6LPArbnijXvhF7Ng
	z4CV+P9TQLOvPrzAOOauMQnhsWPl/MQZ7U5icFL+o/Xov5BMTroxCy1aV0lQY6TbThTDi+rCPIT
	BvGpYQ29/m6THAEjVF1c9PA1OHVEB4e7YJ4+P42ErcFp7Y4yjzCrgOxMFgXMXrNV0DJabv0feru
	5kF6hkRL5ghKhZYuAyVnJvyfqt+tl6ETp1+rPhWhqylj4XslGVMvkMSP5ZdMEFHYJztEF/6ogJ2
	0zB8SPLNx7b6cQCbnzRcywP26L3MOT8npigeJArQv6cn6XmmB73biznjj5oy9k7eG7TVfgo2Ibm
	AZqYSyoAqRNwe/Je47FPaSXApYHOIkygz55koSfqk1hDbpwjbS3TVj9rlVjrvKGnMgFm+wm01PB
	b1WbD7Rr6GTgM+MaGdAV+dBnCdRU6XzjVR2MVHeVxBCko99axxnDo+GBCq1i9sOYwg/7oEzrR1B
	6muxTTDWi1Eg4KA3SENrj5FGnDvk6wvOBgRfQwQ9TwzTqLtarl7nMWf
X-Received: by 2002:a05:6102:818b:10b0:7ab:9152:1c6e with SMTP id ada2fe7eead31-7af1eae9c71mr425311137.27.1790208903588;
        Wed, 23 Sep 2026 17:15:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9852a2b6c6csm211091241.5.2026.09.23.17.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:15:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9X78-0000000ExXK-1vqU;
	Wed, 23 Sep 2026 21:15:02 -0300
Date: Wed, 23 Sep 2026 21:15:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260924001502.GO1540250@ziepe.ca>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_171505_735744_3DDB352C 
X-CRM114-Status: GOOD (  14.15  )
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

On Mon, Sep 21, 2026 at 04:44:07PM +0530, Vijayanand Jitta wrote:
> From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> 
> Add support for the contiguous hint (CONT) bit in ARM LPAE page tables.
> When a set of consecutive PTEs map a naturally aligned contiguous block of
> memory, set CONT on every descriptor in that group so the hardware can
> combine translations and improve TLB reach.
> 
> Advertise the supported CONT group sizes in pgsize_bitmap. Callers select
> those sizes through the normal page-size selection path; io-pgtable-arm
> then installs the corresponding tagged descriptors directly. A partial
> unmap of a tagged CONT group is rejected before modifying any descriptor,
> so a rejected request cannot leave the group partly unmapped.
> 
> The IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT quirk allows SMMU drivers to disable
> CONT support for hardware with implementation-specific errata.

smmuv3 has this errata, it must be disabled there too. I didn't notice
it in this patch?

Jason

