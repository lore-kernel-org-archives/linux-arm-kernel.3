Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50628CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg6wbnYU6IxqikudtR5uG+CUKtmNxQwde8y0MusXhEI=; b=dInDVctHKoiRPzrOqNVjY9v1em
	cpWnocuE9EDrMrRZkFxUiRWrpTDg1jlp5dAa5va6d12j0a4xxEEFC7BJY43+P6Vw+w59AaM8w0T7+
	9tvqF3oP6H+7Txo75EsB2vxOQWoco2iktOO8asyvwkhXujkxgC2VOXICnsAl9MUnoynDRkr1FyxlC
	gGUVOMnfNFbqbJF/sqzlihDuUtVTSfaK9/de4vsLCKwwTZy3TZeGQUghbqJzjOcG+y7JbaMGJVuKG
	O/3A5OUTNjo/y8hKwBGzw9gcHD1yM4B9eDEWQGiYKdX4X19b90NmcG7k24GZl4BWRTu3VRv5W58VQ
	7pxPK0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLl4-00000006cWk-1i80;
	Fri, 08 May 2026 14:00:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLl1-00000006cW6-1zGP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:00:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso87775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778248847; x=1778853647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg6wbnYU6IxqikudtR5uG+CUKtmNxQwde8y0MusXhEI=;
        b=ZMAI3+U4qjF9kkJW+taXlnHVRlpO6fG3KYV5cWYfePHdzRKbssqNjtWyrutoZReYZE
         GJGVOEu/oC/2wm2LFOtQOB33voAYpONm9iBgY/3U3A11JlLZSWmxCtdZjZQ1eB++xRgH
         wcUrTnMpgz7q19OJL3alzY1ruQ3wLbt6KwBFSUkfExhMcMiggYt4Xfv3YcCBF/jp4VOU
         jexoN7QvQbCYXbJXuzpn653Vw8K6ye5CM7x/wmyt0sAV+gl4rIw6QyIvwwq5Tz0jl+rY
         de2gFOCOSs2R1p02Lq0/YizBGFqJ73Li1vSG58LZeGWh+8J0KR1TL3sn/EUaLZii9zh8
         uq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248847; x=1778853647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rg6wbnYU6IxqikudtR5uG+CUKtmNxQwde8y0MusXhEI=;
        b=SmEuQpsreYn1jlfh/81dRlQVelbJb50psyWgAolzrKQOnjdrJIQ/mEZ7N6pj8eriaz
         L2AoPGmGCV3z5MFiC7TGqpUNxNoxXvdI2DWgfwlEMkTfUpuC2Q0Y4EoVi2CsTPADjXva
         W7Qewrc5JCl+vVBnsG/5tdFPA78OP7l90fQqo2lQUdUmlqJDlPTmKuDz2zT2NX5KqVmA
         9+ZVsEqo16suGjjfCu6/YVsn7RRkztT4PnAXVSX7Sw1R6EzTFzDYwKxZRNM8Og9kFpZ3
         lugF/gZVyaNot07TdS0Wz22bhMzNNluALVRAII6ndmDeRw49xTDj3hoh7/lMnYvXLHYi
         J/0g==
X-Forwarded-Encrypted: i=1; AFNElJ/ciIsSY3Ec3NlQM6iFJCZAuyRI+pA9FmVQhCQj36rymi91zDrO0LAfMcl+xrj06NytlRrphHYcaUl1YQQJWiyz@lists.infradead.org
X-Gm-Message-State: AOJu0YwCNSqlHTH2o3UFqbci1TUI1jqjqUiz5pl7Q5vmeaxc15oCG8d0
	LBL2LtYzgOFBLMpIoAPNU9R5ShY7YRYCttDXSqvsfSO5mqOzTLlqbCQ+4wryVrMmVA==
X-Gm-Gg: Acq92OE+vGT8UA8dyIiNzcpBkTy6sCFdjunJlHI7YIE5WatIUriICeX/K/FPBxarmZ8
	vBo7MVM2owZTUnvbnBh3Nyx4nB2CcSo7wjCpb4CSHEH+94UgIWBuJAC6hr5+wJ5AlA1mHi6njpa
	DbdzkFoGb8XYGqrBYWMvorkEMPTJ3qh+PlVLYWoO6EKqOeyDGl/fvEhV+/oSP4JQVab1nrv9MJ8
	/WSF9qCPGw6/2gV8tLcvh5B8+WhBrUqtuCiZ7Qvj+gGYk+fBjlr7tMLizfEtqwmuhcLQ+DxQ4q6
	jimXWtWztC+rewJpDFbL0V03yPzdvgyYmgFGINnyiIozTXZxcbgAQH3H/yVzIg9qViQcMmwN2MV
	fqqfIxB6PBxCKw0EsWpxHmY95gbR2w5UZTLDdf/zbiwc/osTsoCUQQzozzj2XcoJKcXc9Ftqn8j
	SC5j2sdQe3d1dHHs8W6Oe/TH+d4m1O2IVPWysJaIJS+Yx+OzpASEhkbLgNo7+C/qBNTad1
X-Received: by 2002:a17:902:fc87:b0:2b0:5c88:51e1 with SMTP id d9443c01a7336-2bae9e67750mr3727515ad.14.1778248845874;
        Fri, 08 May 2026 07:00:45 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d405adsm24217865ad.28.2026.05.08.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:00:45 -0700 (PDT)
Date: Fri, 8 May 2026 14:00:39 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 9/9] iommu/arm-smmu-v3: Directly encode TLBI commands
Message-ID: <af3shx9ETdSzwPhq@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <9-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_070048_253281_15F04937 
X-CRM114-Status: GOOD (  10.09  )
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

On Fri, May 01, 2026 at 11:29:18AM -0300, Jason Gunthorpe wrote:
> TLBI is more complicated than all the other commands because the
> invalidation loop builds a template command from the struct
> arm_smmu_inv which is then expanded into many TLBI commands for the
> invalidation.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

