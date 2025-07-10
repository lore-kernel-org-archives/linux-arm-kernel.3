Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F9EC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjeE3o0RxHj2yfYkiiw6nT6qNxm9Jz3LUgLh8cuza0U=; b=VDqVpNJOiyWw+jBeI2CG1U9ULJ
	klNluFcqPgPF0qe5bXqeOMVWiRgypTgyeYX41YTxDjvA6dAsZ+9xwYa2w0bTNoerBYAj+LOOh3ILz
	/4LSmt6pMoQ/llzeIIxM/QBs4uCdwMrku08BdY34NkiC1ksvjIEDNuHZDmEnI8YZMP93zWvRNCiYL
	EDfmoqF2zv+fstjicM4wvOkmR13GaxcuMzOZoAf0tML9boXOkSpGmZh5LaoX8GxBIOufzrBX8d+SW
	AoKZi/dgkH2JNQvWJas6put2zzsCNdXCHtPtKqAASoHojiwFEenEBU33Q9sr7+m9Y0luh9zGVZY/0
	+NCgzpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZout-0000000BXnK-0rzm;
	Thu, 10 Jul 2025 10:54:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnCi-0000000BHMd-3BXF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:04:34 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235e389599fso168285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752138271; x=1752743071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DjeE3o0RxHj2yfYkiiw6nT6qNxm9Jz3LUgLh8cuza0U=;
        b=ydwfAbI0lRLRKa2JTwKyLE+pDZDbMCPqcBh7+KkGW687xWH18z5RUNW2uIrEiOK1GP
         A/M6Q42ww/Pz+4Frwp8sp5QWjsHqH+zUDbE9k8B6Gx2DgLIdKJUnyExfcmlmn4+NYg05
         9WZCSFIPSvvPymjzhR/VYm6dTPg2Tmz73OzroBIygpt0Vb3VQ2501n1KcU+doa90Fz38
         5qzbU7U8L36yc/QUqzZVQ60P6q6cGQfIN59Ez/Jw5pfJgIxBGTIwVan3YMdMOlun10lc
         2b4rsVo+nR+mi3SEKWnnvTuiTAJPedBGne2Fo/IAtil/02PeoPDgLUeGQtb37f3lkLkr
         kAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752138271; x=1752743071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjeE3o0RxHj2yfYkiiw6nT6qNxm9Jz3LUgLh8cuza0U=;
        b=ajwtWytWWW1D1PtRVuG+JJ2ECqNHwogbyT+FmZG36KAjewYfrjp/nfDyE+hu+YL4Gg
         pPeqoQKC2SJFn56saDUh7Q0l7wMlU/WYQo5y66pfsE1SZaSBzR2dNSnCaS0Se65JhvKF
         m5SsXh8G6YdoCShP6yFRNPfcVDRm6mxMjMuuQihOtLaad1NQkXTyiFqaDuZgU4+sm8cf
         AvuZhVajM14A0HGPQUci+BEOHf2PoaV2WphkDofwFZzSvXcjqi3D/UB1rSRjyAbnmMbx
         SQSCU1BBqQYcLgdU+aOY1FfRuawdrTq+gGBKQRlHEc4umB4JIwY+sJkHuEHbMhLsKa/s
         gulA==
X-Forwarded-Encrypted: i=1; AJvYcCWn+i4WM+m181NvtD7FYooX7e0qhMf7291w22UNEfdBJlvY6HSoakOxMjqAXfsgdm9qf/FRtFvHMRkzObgOPGRX@lists.infradead.org
X-Gm-Message-State: AOJu0YytUtvET/fc1Tq6/Zk9A/tY7mDe3ag4meLzIdvcLLaKhC9pHxLE
	SN6P86aTeyPTZmCIY4AWjHYJslFFeXk1lBKgFDxrhRSgaeA0FFjRAVGHGuN/7MM9Lg==
X-Gm-Gg: ASbGncs+jYJ1sBW5/IVz8JdSoc/arDMhV/bR6jH+ZXyJyuPAbElwttGckw92nim6rAB
	sh93+9g5pgns0HKiG6vYpnSxPMdv5pBUj3Lu3sac2U5S8d8xi/2uZa3Q4zsBedR6kuTFyBABX5o
	e+Cu/7sSm23DPjx48IXUDh8KIVFySVoCBaVAWK+bY2xp6IZQ1NbovmZkI7q1E7J4b9M+DR+3p5b
	Gc07Zda9yVlK+KabYdJGHMHdGDoWvjxtb7SqDOdat951QcKnWjeQoFqHKc6zNE2HCyAnCA19fXA
	W1qpc5XL9GPhZ1ZXdQ/mQBV+dAaw2cIqeljLA9RfzPrktKRX2WXP06gx1B3bziCiBYNNKohiyX9
	J2+TNoiVXQA9mfYRnL2wX
X-Google-Smtp-Source: AGHT+IEUCwoHbQmo67knPJ74PmLn5sw1tOh05zzgGXqHLIH2hLihrsg/DC4THre9sZfOvA98I9mneg==
X-Received: by 2002:a17:902:f547:b0:215:65f3:27ef with SMTP id d9443c01a7336-23de372b90dmr2361415ad.12.1752138270075;
        Thu, 10 Jul 2025 02:04:30 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f49502sm1369146b3a.115.2025.07.10.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:04:28 -0700 (PDT)
Date: Thu, 10 Jul 2025 09:04:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aG-CE0jUxK4k1FMb@google.com>
References: <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
 <aGaXqwzfLwsgCH6n@google.com>
 <20250703175532.GF1209783@nvidia.com>
 <aGbQipeSn0aZnwZU@google.com>
 <20250704125012.GK1209783@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704125012.GK1209783@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_020432_796513_2CA51DB7 
X-CRM114-Status: GOOD (  15.20  )
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

On Fri, Jul 04, 2025 at 09:50:12AM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 03, 2025 at 06:48:42PM +0000, Pranjal Shrivastava wrote:
> 
> > Ahh, thanks for this, that saved a lot of my time! And yes, I see some
> > functions in eventq.c calling the iopf_group_response which settles the
> > CMD_RESUME. So.. I assume these resume commands would be trapped and
> > *actually* executed through this or a similar path for vPRI. 
> 
> Yes, that is what Intel did. PRI has to be tracked in the kernel
> because we have to ack requests eventually. If the VMM crashes the
> kernel has to ack everything and try to clean up.
> 

I see.. thanks for clarifying!

> Also SMMUv3 does not support PRI today, just stall.
> 

Ack. Thanks!

> Jason
Praan

