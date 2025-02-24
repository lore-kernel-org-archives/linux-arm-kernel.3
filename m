Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0C6C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 04:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXOPbjowj6Hzwuap/XS84BFQBW4l8rdr65xne9mv6JE=; b=BaTSfFHkTT8zyWqZNjKtndoPMZ
	6qlzaeNt5s+4gtnWAo2qFQW19IuCyncDmME4iBbNh2j4RDK+ssJGgGE1FwmDrdJQHNtBQy4GFNuUx
	OGaLt7rRQ1Z4wyVMv5xkvsiqxvI1Idzs4T/fz80nSvorU+yyYiDd0kFd+OYTfrHtgpTo9qTCsg6WT
	5100xXcY3qaf0ttnuDSDqsQHj0zsC8yWRVOaTrP9Wa97F0fhPWOg1XbNEb+O1UNCrPEjqVHwRRgwo
	VKHNGk1CuZ8wxIxh20f7KGnO0ODrgLaXXcD6A5CDxXLkafgpAepJejgEUjXfxoA9Smhs1McNzqwUY
	djBhux4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmQGG-0000000CJG8-26XH;
	Mon, 24 Feb 2025 04:40:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmQEi-0000000CJ5n-1cTJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 04:38:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220e0575f5bso256195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 20:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740371911; x=1740976711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QXOPbjowj6Hzwuap/XS84BFQBW4l8rdr65xne9mv6JE=;
        b=1ZfPHIJ9j0zys1vfs+HwIQoesiM3VRJIJuoyrK43d+q/fN8wFALCcQkCQEI4Hls7Pq
         Se1VKviLkmOi/UBtKHDDPyunX06vKrezjzfFBNeOsgRhy4GQ10vNhj3g39kEsO0kQ1Nm
         1o4CfGXtP6pwS7ERYmxyiP4huRwhkuFH1n0y0VIEy+rwhhpnmoKWuNQEv956+S5qS0lo
         vTXBeOaI43E3/p0+c2W9YNbau/pdLxUGc0Xk7yk0PJCxlggaQjWxtmM6+eLdf+2vNe5T
         cXESmPgQcE8hlRqEvEu5N5gVh3X/nCDkpo9Dg2pr+DBPprMLbtcWvSnEY8TdSCcmb2GV
         sg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740371911; x=1740976711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXOPbjowj6Hzwuap/XS84BFQBW4l8rdr65xne9mv6JE=;
        b=ZeB2lTljX38Xbip0/RC+ratfRuLKspX19xMj/7xv8Tu+J1K0W2WWoiED9+Ns6YA8MW
         CTDiQ9lv5d7hruYwpE+mKMpWgc+7EnzuFmvljtdftFqOWq57AQKcQQlC7lBz/J4GPzLH
         cvNZgrHE3QA1dNEzq7FbRsKbpEG7CEuh05FqTZ5bvR3lKtiOPi0x9Cb3Km3Z5fsYN4gC
         EcfxUBSAUOqCsgWtrB4sYi1PrpSTZQYVx2YQ0maHRm6h2DHm53aojcY+e/ZcPkDFN5Ui
         alGK90XfUHdaYxzzBGvBoMkbh8znmq7IZWuwQOU8ijknSq2yyDORnefWmQSnrdtDbDh4
         YiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDiVfSXEG+QSDKZrLB9ubnvsYTge48PP5kYeyiu5ClKlHcjUChgLjJoxxLMPFSPP61OsMQgQiakXnHPvA86ttO@lists.infradead.org
X-Gm-Message-State: AOJu0YwQqrL4jefHjyta+1XFvtcJLPpT1290YBveKdQ1FGHxpUW04UJh
	N877MgI195CPEZAxeABx/aaELNTLOgVozKpmYBJDdgNYuSNXOIG4UEETi7eEuw==
X-Gm-Gg: ASbGnctWWaXLlRBL8Ap3Dm8XpJjuNxAULbs8xRMt8jp79mEnGLr4EMLgQSjguvnbcpg
	XZuO7zhrvkds4CY+MtlylOWoLMiunuxEBTHchUPrdhYUJUOY1cdrguKYrJGzaN0tSOWn+3IJ5WU
	KynDP9XIv8URL9+rYkY0WH5onntMbEwFo9kSvUqhPUdsekuJgPGN40iuNyF8VqTyj9E5DXVZhVP
	CG0Xb6PShiDfH8m2ieqL9hE71KxYoEI1DMaM3427AIKcMk1mVQuy8U/unNOSwkPDV6kG9maa4cd
	5+XEx7HvlN2Tky7lI+5Lusm731eUVoaVJpfeuwGNa1LGl1/7Uh7phGvmpxz5rV4=
X-Google-Smtp-Source: AGHT+IEdLGzG2X3YEfsIyog+f9j0aXsArsFeUuMcB+n8G7DuxjBKyqLer9ZGTISS6pMA8Im0wRP9Ug==
X-Received: by 2002:a17:902:da8c:b0:216:21cb:2e14 with SMTP id d9443c01a7336-2226cc46c3amr2333105ad.21.1740371910429;
        Sun, 23 Feb 2025 20:38:30 -0800 (PST)
Received: from google.com (169.224.198.35.bc.googleusercontent.com. [35.198.224.169])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-add540f75f7sm15349070a12.46.2025.02.23.20.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 20:38:29 -0800 (PST)
Date: Mon, 24 Feb 2025 04:38:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	joro@8bytes.org, suravee.suthikulpanit@amd.com,
	robin.murphy@arm.com, dwmw2@infradead.org, baolu.lu@linux.intel.com,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v7 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Message-ID: <Z7v3u55JNDqveAuD@google.com>
References: <cover.1740238876.git.nicolinc@nvidia.com>
 <2b088fe8d2c7e692426b0d1f58d4f2c12ecb907e.1740238876.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b088fe8d2c7e692426b0d1f58d4f2c12ecb907e.1740238876.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_203832_445873_E10C882A 
X-CRM114-Status: GOOD (  15.58  )
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

On Sat, Feb 22, 2025 at 07:54:11AM -0800, Nicolin Chen wrote:
> There is a DoS concern on the shared hardware event queue among devices
> passed through to VMs, that too many translation failures that belong to
> VMs could overflow the shared hardware event queue if those VMs or their
> VMMs don't handle/recover the devices properly.
> 
> The MEV bit in the STE allows to configure the SMMU HW to merge similar
> event records, though there is no guarantee. Set it in a nested STE for
> DoS mitigations.
> 
> In the future, we might want to enable the MEV for non-nested cases too
> such as domain->type == IOMMU_DOMAIN_UNMANAGED or even IOMMU_DOMAIN_DMA.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c         | 4 ++--
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

