Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4016EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jj6+mcpbE9V02qadLzbuN9y/flOOPMALPxxrYxqko6o=; b=XhwaJp2GG8fx7rAJdVE4bQo21M
	dhmOzmZqFgQ1RikOvZn46PTNVSUxMQCveFZvZz1PMsHUCOzrKYszSoRW0RdAAXPnuoLHOUdpAN1FI
	SsvCP9esFgoz9inyYFOEPmmoQC4L5Wgx+g5KLb3crAzMeJqwKHW2KdeBvze9apPJqwnzI8eIRxFst
	D4Oh6ROqIgF5sOUzZWLUgpcB4aM4rfvZbVv/xY4cL4+7LQQPvXwAzrdXKm6eGRJEa+an9UXoYusCk
	bg1IDR4L76UxLRQgHEcJ7YVHoldVEjoB2txII3/j6gyuezqw8swoV2uBSQCiB3G2OJSAZNq9FuvFB
	N3rO3bww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIil-00000005lXz-2IHZ;
	Mon, 16 Jun 2025 22:54:31 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIgY-00000005lEP-02Hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:52:15 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235ca5eba8cso65485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750114333; x=1750719133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj6+mcpbE9V02qadLzbuN9y/flOOPMALPxxrYxqko6o=;
        b=LsdkVv+uxM/Yg3Sl39R6y+2XMJE+NTo1w/BpUlwVxORfNAaccyv1AVNK5vVbTaLnzS
         bqhE0Vl5oMo1HMuE7VgpyK5toqlp1yvN3yLDfPLC6zLQ31Fx49qEPlFrebR/kAWEh+S5
         ZCBQy2ytDonpLxn9oCjibKnfNDqMzAd8vG87362antZZjjrC/zvOiPQR9e7Gk16x+u0C
         vsh35uF3pihx1b/j/1bVn+LYRR2Pq/H0qJ25QXOst2276MZ9vPNqs8kjR7UbdI3XnoPC
         wq6ov6Ib+8tnA63Az6KdWd5cKDtv8cr9AZ9JTDQxVad8sSy3R5b6eFEeerKM/tSPBSqS
         oz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750114333; x=1750719133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj6+mcpbE9V02qadLzbuN9y/flOOPMALPxxrYxqko6o=;
        b=rHVCbCIPSPzjYBztfdyEXPKpzC2lkNnq5cb1P6jSWpa60F1sqGfo2Hyjd/F7FN1qKb
         Y48frglK1u5mAn+jaJf2BvWIkclE8Cs6HIJAtui6tWwLITlyd1A4IyI7r8UL3OAWvuyA
         nxMZa9lkd6VAPU7wsGiOVfM0Ukp3/Jt4XGRLG0e4d5VY14TLm657MH70kUgOC9MLGAcZ
         Vn/ZV+mmw/l/eYNqwIVHUNBM/xb07JNs2DsjTy/VdGQhYS2c3j2DfyZ5iWwv86TsRr95
         /tnMYi8qeg7EE6+BFimCpH/s4P2Kz2NViYLld54giTB74lUFJpv8qHVDMjbaPo0EEfd6
         FPHA==
X-Forwarded-Encrypted: i=1; AJvYcCU3oJIPDs5VrjKt7C/fvrhBmlYIR2tG9edjv3aojIiG4TmX2+CKsIkNZvuOAHM+kw7PIlf6vBz1tgo25x8O2+gD@lists.infradead.org
X-Gm-Message-State: AOJu0YwSmmr7HuxSSYS+OuMQP9UdBbS6QCvtFmfrUS9FQaAeDAhclkGt
	t1PoynUDReIRN+ObVIsaRP1Ssu8g8Lu3/iLmE0oLJORdloADxGavTu/zW+7H+tHifw==
X-Gm-Gg: ASbGncsOix4+UtRUtIUlLnrMb9GU9iuWiednHB6k9bMnSrVyhFTykiT5NU/6Wr5H7D+
	apiqaiRGa/B4C7+X537Q7DKZ1x5YJVoOwNDTTIh385O3OzEQFMWlqK5jfffe9Wkg7iPVDqqNub/
	WaxulfHKnYhXnXi3KrYmUdaKZ01/G/M/cyVtz17nDgJDv/HUQj5LRQ7Z0LnsyBfTiORSnBC5BTD
	KQDmJBjHjvJrm7k5/ipkRQmDAjgY+QhI8PjSgXZUXyinbnw2WGCx6B30UT7MTumN112N2ImG8s4
	jkd3oUCUuqtxtFdl2YomwF7S0u5Ex2igMWZlTdL5ZVff6N+ap9GIN1ZIBDi22glamSfHQ6c+CWm
	xbWGNuf3C9AKr1uPN7/LN
X-Google-Smtp-Source: AGHT+IGlPE9uP1SbbWnzOuYOIe1eDG4YyhjqWGy1/roBJfbAZkNgrizH5BthvNw3ZPe4qwD5HsBoXA==
X-Received: by 2002:a17:903:b45:b0:234:b2bf:e67f with SMTP id d9443c01a7336-2366eef0269mr5964675ad.9.1750114333086;
        Mon, 16 Jun 2025 15:52:13 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b319dc80726sm3333506a12.68.2025.06.16.15.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:52:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:52:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 13/14] iommufd: Introduce iommufd_object_alloc_ucmd
 helpery
Message-ID: <aFCgFPlz5dYlN8N2@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_155214_048060_13C9DE33 
X-CRM114-Status: GOOD (  12.09  )
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

On Fri, Jun 13, 2025 at 11:35:25PM -0700, Nicolin Chen wrote:
> An object allocator needs to call either iommufd_object_finalize() upon a
> success or iommufd_object_abort_and_destroy() upon an error code.
> 
> To reduce duplication, store a new_obj in the struct iommufd_ucmd and call
> iommufd_object_finalize/iommufd_object_abort_and_destroy() accordingly in
> the main function.
> 
> Similar to iommufd_object_alloc() and __iommufd_object_alloc(), add a pair
> of helpers: __iommufd_object_alloc_ucmd() and iommufd_object_alloc_ucmd().
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 26 +++++++++++++++++++++++++
>  drivers/iommu/iommufd/main.c            | 25 ++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> -- 

Acked-by: Pranjal Shrivastava <praan@google.com>

> 2.43.0
> 

