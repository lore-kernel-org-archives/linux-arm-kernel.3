Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49533FDEE4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/T0GTDRuU/Ml1Jl3QzhDeR+2ndhb6qBdCM6HZ+ROdk0=; b=x3ZC4m0BhVTQSif0k/KSC28/oB
	nZPIh+BUn8KJ2l1UVvfafbYfh3rs+WRnJSyZ7A30d5I2kQZZMHz3bNSFrLbOJiUBTHtrDsEF/BXPa
	IDHwlbR0pR3PoHyDG/LzTloSpKiksxe+D0rzBPUu5ABBGlyt80MMz97P6a+X1RGL/MP6L+cTt91lx
	VgylpmLcV8WDDROzwnEXQNCXOWS+P6YcZMxCwLGPY/f2ZXkZ8ueSDHi+s69+wNy1mJFolkGXhiw4x
	jepiRq0GVpKA5UIluRTwYUCzOj+gR8YEEOwd+UnyQbHgNrCEyuSbaWCFWxho8B1ur62TIpiM27ryL
	H4aj1t3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG2lY-0000000CNtv-2nrp;
	Thu, 23 Apr 2026 22:43:24 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG2lV-0000000CNtO-2ZoR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 22:43:22 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8f0579401c4so247990285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 15:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776984200; x=1777589000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/T0GTDRuU/Ml1Jl3QzhDeR+2ndhb6qBdCM6HZ+ROdk0=;
        b=NirjQ1w5P7ef3GVrhHg4LuxjR06LhYi+Ft66cUVtA8STOxD+rmmJF2dDjAUMqPNtKM
         XSLxp8IyJslGTcFfUYgNwgk+YU21oSP6BEJEyuvfmnqEDXF/66cWi+gcKa/333k5nkC1
         8vxRxZOCDAHjNZKSvMBodeeNFBj8M3tGLq3NyJjiYQKuup3jO/UBnGzeiIctooLxdRla
         q+Rd4SbFmtbjDc6AzxeRZYf2Xls5lMo3r6V0HiwEzcTQ+uM1Cq41hxpjapDlD/umcr1K
         BMUgHZIlHOA8d/fXYL5VyHlVdT0qavoo2gHtrqgk6BT8KzJq1d7jep0xWtwwBiZOZf6B
         Bv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776984200; x=1777589000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/T0GTDRuU/Ml1Jl3QzhDeR+2ndhb6qBdCM6HZ+ROdk0=;
        b=PuUKTeWY3xE+4D3TFLWNabcr9Mmxn35r36posxrDqbH3IOe51u1dMOY/g/Q34JzKL+
         33mjjYfHab4SdYTEQUXf8hgEkQiZTkNbXRFj9RhZiARqBtuqaZCbVtC/+i6UlF72cjAd
         Mxy6ZFLst4jXH69pS3uW6xyIxPRiAQqzRPJNUU6bHxrbDURhAePA2Qs6IElaF2AlfmO9
         ajyrMYJTiNAzxRGdAYT4PzVNUFktensuw2XE4F1sVYgs1mLXt7Koe9WqEa+EYRCiZt4h
         BaAbZ7aLKotgjt0qoD81HV2O5A5IqLOudYRuCyN+1FdRB3Frjza1dHZPb6RXQDF4T4An
         9W5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Y2lFDJs19Aw3Fl7w+pgeU/cjPiOFngpXbAH6nVNADMSV680rNZL1zUBcpE7SnWoDaFUR3oFogGmuxF/HBht4o@lists.infradead.org
X-Gm-Message-State: AOJu0YwQKgqPPgoGxKTCggMnQHMbERnLXQG6IX2m8rKUNZi0v86Qr0ta
	Ykepuq/OdA+JyTenKlcc6jkWZPvrKCr6DJCO19OWY8koLoX6gKARXHA04yRdCbbgyYg=
X-Gm-Gg: AeBDiet8P68+fTt7H0Ce+GMKvcIwryOK2grsweya0y7HVpAdHEm/Q1os/mwmYWKwuWn
	QCbgImGxHhoUF+B4W8IvcnN3mgweI50uZ1XdhF76FRKDIsmEH1Tk58Sy47ZKGFUSHEN719d4mVW
	y4tFSAq3+E5XO3n6d2rNSUQOEYDE8rOuR4sb32RnE/nOmQOd9/gul9JlP36InDtQ4VhLYJjKBJQ
	/pFgDfztrcoani/sPBkDkehrxUZkTpstk0qlI5aXtQmJEHnaF/2dVOlA6pHz2t0o4BtNfr3H17M
	nFCUYP2SPk5/PYk8y169aluzQjPmAWj+PGMyr7a6kIida6kClHT9gqyt5znZTnI1u/3e5oszyYz
	sUVGMS8BUP1R0H2EusvNKbu6nutGDGP+dZeoSJsnvHN27JKmCvB5y6cKjxbzwXmYoQhXQDAs+oG
	ChIoPVlq0trh7ZbFxmSk4czyBVKrVVziPKwf3Cb9MF0OxdSC8guaq26z1EFoezEkquYTnV+lICV
	8/dm4hXm6J+kCAcJ0KLxslM2ro=
X-Received: by 2002:a05:620a:3187:b0:8f0:7516:da99 with SMTP id af79cd13be357-8f07516e40bmr1047695085a.60.1776984199901;
        Thu, 23 Apr 2026 15:43:19 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02aec3a3bsm169316686d6.49.2026.04.23.15.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:43:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wG2lS-0000000GLHD-1ruw;
	Thu, 23 Apr 2026 19:43:18 -0300
Date: Thu, 23 Apr 2026 19:43:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vidya Sagar <vidyas@nvidia.com>
Cc: rafael@kernel.org, lenb@kernel.org, saket.dumbre@intel.com,
	lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	joro@8bytes.org, robin.murphy@arm.com, nicolinc@nvidia.com,
	praan@google.com, vsethi@nvidia.com, sdonthineni@nvidia.com,
	kthota@nvidia.com, sagar.tv@gmail.com, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, acpica-devel@lists.linux.dev,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 1/3] ACPICA: IORT: Add Root Complex PASID Flags field
Message-ID: <20260423224318.GT3611611@ziepe.ca>
References: <20260423191417.2031652-1-vidyas@nvidia.com>
 <20260423191417.2031652-2-vidyas@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423191417.2031652-2-vidyas@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_154321_663901_14393CF0 
X-CRM114-Status: GOOD (  17.54  )
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

On Fri, Apr 24, 2026 at 12:44:15AM +0530, Vidya Sagar wrote:
> The IORT spec, Issue E.c (ARM DEN 0049E.c, January 2022), bumps the
> Root Complex Node to revision 4 and adds two PASID descriptors:
> 
>   - PASID Capabilities at byte offset 33 (2 bytes), bits[4:0] of which
>     report the Max PASID Width supported by the Root Complex.
>   - Flags at byte offset 36 (4 bytes), bit 0 of which reports whether
>     the Root Complex itself supports PASID. This is distinct from the
>     existing ATS Attribute bit 2 (at offset 24) that only reports
>     whether the RC forwards PASID information on translated
>     transactions.
> 
> The ACPICA struct in include/acpi/actbl2.h was updated for the E.c
> PASID Capabilities descriptor (offset 33) but stops short with a
> trailing 'u8 reserved[]' flexible array, so the new Flags field at
> offset 36 is unreachable and the existing ACPI_IORT_PASID_*
> definitions have no consumer.
> 
> Replace the trailing flexible array with a fixed 'u8 reserved[1]'
> followed by 'u32 flags' so the struct fully covers RC node revision 4,
> and add the ACPI_IORT_RC_PASID_SUPPORTED mask for bit 0 of the new
> field. With #pragma pack(1) in effect for actbl2.h, this lands the new
> field at the spec-mandated absolute offset 36.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  include/acpi/actbl2.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

There is a whole process to change this file, I went through it once
for canwbs..

https://lore.kernel.org/acpica-devel/2-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com/

You have to make a pull request here:

https://github.com/acpica/acpica/pulls

And then use the 

generate/linux/make-patches.sh -u <commit-id>

Script to make this patch for linux in the perscribed format.

I think, something like that

Jason

