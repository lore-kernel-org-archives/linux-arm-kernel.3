Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A356C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=034zD2t8+j7QVlHQTTa3rHmzt0sqsL2Mdd151xEc278=; b=Viz9VYiWJlbQB4Yh7rhsBGSOmJ
	HTamEAPp4yi/ARFVejLiBaB7MRRCt9U/PvhAW21RHihYFi8P2zS+Gl+Dt7fP5dH9jn8MNH8lgUiFO
	yZeJiwNK3wtkB0KTMiWnYYgJAg43KsiMexdC9K7XRBbgT54dv8e2Y63dMcTHow2ctCItCAGYO6ojn
	OVP9sBxyZfpMbu+lNIv4m71Lck4jl296DMZdbGBp7ikC+3fHIp9AQLr7hEPMOUYKLNG7to7ldepeJ
	bjjW9J7IRZfQ0VjW/if75JTqLUrLCccl2/Dchbcpex8xqcsI9UQszUDNwmXSTRYy0cc/oMd3JwhhY
	XqkQrKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBZI-0000000EYZI-1Zkk;
	Fri, 11 Jul 2025 11:05:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAVC-0000000EOVv-1f1c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 09:57:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23dd9ae5aacso105425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 02:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752227829; x=1752832629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=034zD2t8+j7QVlHQTTa3rHmzt0sqsL2Mdd151xEc278=;
        b=fF8ZBvJj53nBREzeiahC4qHUOdRbAmd7JdUc3+XuqSSj+5octIj2gpMC89MFwFtOB7
         rqubwOR/85v+WcxTHpcMDqMVWDwEBFUNq1O/5ELJQDrV9/BjVrO8a0rC9ve/WLBRYgt1
         ccVZ2LGBRXpu3UxCs8AOIuJeroHfmcFoC4wNuEQjNjuA8tb/3TD7dpNc0F1wFV32gUvs
         HisAemEIjepEgV9ZyITq8pTrPVDDTZrdPp9jRavSHaEQc3Idavirig19RMI7x9amEd7O
         4dYkxg8f33SLqan6R8m72gF3qTh8bs4b5p8aXcKvfQM3PQ9lHzv57Lbn839vXTnEUysD
         ewjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227829; x=1752832629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=034zD2t8+j7QVlHQTTa3rHmzt0sqsL2Mdd151xEc278=;
        b=PSzfkHzhuvGYmX4jWGp0NWV7qq7pP4rwWXfk7S2dwV8MgJuquCoSfFN9REl4EdbM32
         Ewc/uUyzGypKrYduIM/SeDbCKaqc5Y6xq0idfcpq9z4RGqcVMsZ8wwvH+hNigsX3DW9I
         bKM+EQJM/ZKKYmU6s7xRtCmoCctlAEKwt0xSnSbl4BKD95aiqifbISfp9DXTLFQq76Bz
         a8cZ7WhH0/Lo+V/WeYlJMenYYCIwBfLtEdHTNZu7Sf+uf0Kg2ZxzGkkzt3LP/jdWCbde
         6zrnz5A6wmO1oTGteWKzz15vO8+s8kkiP266Z4ACWw+fq/DvH4GIdiPh08pIKmP6AH4+
         4nLw==
X-Forwarded-Encrypted: i=1; AJvYcCWv/Wv4biQrFEU2NY+SqfcUHXFSZQxqKv5GVQ2fBsNYIjcVxk5+bE0wnRVuVvoWohArljW8/OPWgr+klDiFN7ln@lists.infradead.org
X-Gm-Message-State: AOJu0YxRctj57OAjddGhheaQgDxRYeIP50qtx6h21maxL4jzfln/lOPW
	lzMxIlTv3zPHxRTQdXaAoQr5kik3cW7YbbOBinPWUtfKRTO7o9v6BUaljRvQJboMFA==
X-Gm-Gg: ASbGncsb67T52pwANu+ZpzzlBRne9fpXLiK8fzQh4IvIj0Z2Xa2hwLie84QbP48tO/K
	srjlr/rntU4of0JCyCRIr0PuDXXy8IJc78DN7SMbXZcZshQM815cu50Zzplg5L2liT5+19O/E/h
	jWPIBKRyNz5jVjnt18/EiksAd1Apv0lxsJKnL+a/kNJlorYkPoqZOku5vzY6TUZ5ybolL1Hhfde
	CBvxDMGYTKg3K8Op6AasOicgPDVqXE2KkfqDkT2hAS6+El/JsXhMpJ8dBN4OkhOJG6aLkdijOtK
	j8BVOipE0p05nTGw+cEidADl8Ntv9RgTtDYxj1ytJC+ZhLtoUh3IkYL75lZSy327OKylJMwXBGB
	WD1iKIKC0wkYyhj5TQAVfCY08Os2tj6DCj+GcqrTKBPZ7V/RP/cOBIwqu
X-Google-Smtp-Source: AGHT+IG6OJdkdwVAu17LyTkPAnvBK7l4yng4G46N/h54a/NCPDtWUMAP3Y1SEP2980Km3pvxW+HZDg==
X-Received: by 2002:a17:903:fad:b0:235:e1d6:5343 with SMTP id d9443c01a7336-23dee273e89mr2500075ad.20.1752227828514;
        Fri, 11 Jul 2025 02:57:08 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3008a610sm7731211a91.20.2025.07.11.02.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 02:57:07 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:56:59 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, bagasdotme@gmail.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 22/29] iommufd/selftest: Update hw_info coverage for
 an input data_type
Message-ID: <aHDf6w1gFcNKNtGc@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
 <aG-fZv39ci6yip3z@google.com>
 <20250710153202.GO1599700@nvidia.com>
 <aG_togvop53dLSZM@google.com>
 <20250710171216.GR1599700@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710171216.GR1599700@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_025710_431257_F85BAB4B 
X-CRM114-Status: GOOD (  13.62  )
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

On Thu, Jul 10, 2025 at 02:12:16PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 10, 2025 at 04:43:14PM +0000, Pranjal Shrivastava wrote:
> > On Thu, Jul 10, 2025 at 12:32:02PM -0300, Jason Gunthorpe wrote:
> > Alright, this was on the `for-next` branch when the head was at:
> > 3e2a9811f6a9cefd310cc33cab73d5435b4a4caa
> > iommufd: Apply the new iommufd_object_alloc_ucmd helper
> > 
> > But I see that on `for-rc` [1] the fixes are merged.
> 
> Yes, Linus discourages back merging rc without a going forward
> justification, like following patches need the rc patches. Fixes some
> bug is not a justification...
> 

Ack. Thanks for the clarifying!

> Jason

Praan

