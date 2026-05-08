Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B0DCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HALsDsAQa8BlgwZadqAF4txAKJki3KeCnTRDOv4wNSI=; b=n0WIm1ZdUNNIz3gk+xjeM8axcQ
	Ft5XuYi5GA0CPgK3ixkagAyTjKVD1Lcthw9t8ql+C6kjit9ZAeRLOejCz0/+MQDrCmikhZDZ8rt9A
	N0Tz5r+AsdxrNEqRwHYJKiZEwXtuSxwQlQ2ASrA1Gk4gDNQ7Hk9nMh7DdorUaQ1cSLIO7/zvmYDZc
	v7p+IRt4SBLxqc1X+BZN7Ay+dhDy3kng32gumh0iNj4l5qIo+5Dtzkti42qYtEvA/8OccxA2jWP9Q
	HUwzTAOXuM7N7rQQQVbDmMf+0/wNqCT0O+eg3L8d0Odoco27r2MjZlXSijHuW9Y+np3v2ZG8koPF7
	7poyuzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHma-000000069mb-0v1g;
	Fri, 08 May 2026 09:46:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHmY-000000069lU-1VyS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:46:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso65845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778233565; x=1778838365; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HALsDsAQa8BlgwZadqAF4txAKJki3KeCnTRDOv4wNSI=;
        b=sftjC2wvznSTjLPW7z803Oa0hHsYiiJOzYux6eccw8Ma2Z7cyxBd/Ko74l4iv8JqhW
         aH+O9mXH6OnZBzZ8ijPUi+nX/Bkyl2+JXo1XHTWbGwEAcSSD5PF1w8s72kMLG9df8QQ1
         vm3Pbli0KXc61dExfpiTXD4jHJDHRxGsQVXAczonC79YZVwVi2r4RhklIgat2rSlOpCi
         1BSn3IGKV/vD73yfP/oGjRvzT9qVMj6RgXW0zq3arXwp+i0mfcUNU+zUDhHRCLXB47/Q
         SxmVpZoStWWJKq9vY1t1Sr7dWVp1wVvrGBgAXVFkQm8r7gEKEdNC5bBV98q5IKWCg8Y1
         O7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233565; x=1778838365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HALsDsAQa8BlgwZadqAF4txAKJki3KeCnTRDOv4wNSI=;
        b=cLvtsGOyzNYBKa0QVmezEGfqMsP01lGJxHR9NmT2hXSJsdnGSlxh5/8VYU2VGlVWaR
         HeNt6sof1qma/gIv8Z6742b+X7LbHsOzNVlB4gaaFMhobMHnTu3mGzS/eLI+MUtEJBnL
         nzRHFId0HmjZHTT9zPIedO51s4Qk8bDL9zZ3BIjNJOJehwaYoupypRSb01tFQlgLn4St
         SLOPdFp08SPRRRdZVFkxnW2cmlfhNboprx5E6ViG2IHgccgHr9giGDCUt3nc4zuZRQ8K
         uRMTmMsxsabWVr4BNWi3IkmXIrzWbaFZHB7AnVGwZQJcUaK5Ld+OgjmoRwMUckS1ZkG9
         gunA==
X-Forwarded-Encrypted: i=1; AFNElJ/xdcffGdqxhRkYn7VAETLgnOXtgJHEBeACsEjYJqJ/vgnGmdFmO4oThYIXfMAHrtikK4dcGUcL2/OERkQOx6aZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7f0A1LwkdkYdE6xB4B+Xx1JH3/+ATugzbXWsABn7bO6iiMXnQ
	Y9CxzD7h6hizXMeCznAuKw8bwyBZeLhyVnwGlOqvi47lKvAC02nekNzT+sn/7i/rqQ==
X-Gm-Gg: Acq92OGORjpu20mZuZKPI+eP1l3ykvjZIGTM5OVRs7nSsJBxKUYjtx2YiEDK3WVC1WF
	oleSRpSkReO5a/OQgNLoLxvQLHdahgsdg10FH/08o4B6bY4Srz8GDp5ymLd+wqrkrOyCyYMojxI
	HcKz6bkBBn8zA1x35wbk+jPidOJjF62Q8DyUXel/ICMd5KAmRpG2jE31Va0TLS6rc1jl0EOqFxg
	vmo7Yvum+3/5Kdd+2fsbb9N+LjU4cAYdoq/5rf2jUaHa+rkxloWPd2sY7ULPsAPkpWwG9KkI3Hn
	rjXODX2IIJ650ZbGoGGUzZb4uNE05ps9hNAlCSGwIi0QQtr81PbYZDCf/G5zV10NOWzapNe6KYo
	o5OoUhaHdP4tCYgRlQmjpwuuskQMXBcTj+Sete4Xm/ybr2Wp/cZqGvUtaEDUEBZjT/IKvrHE+lJ
	6Re3PKLJMUNxSQfSXuWaaqytE4qYplcxg2fIKmzyP4mv+O//tkhhPcl+OsJec9kTdTLvzT
X-Received: by 2002:a17:902:e549:b0:2b7:b03d:9dce with SMTP id d9443c01a7336-2bae9e98dafmr2720055ad.18.1778233564632;
        Fri, 08 May 2026 02:46:04 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac6bcsm14904885ad.70.2026.05.08.02.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:46:04 -0700 (PDT)
Date: Fri, 8 May 2026 09:45:55 +0000
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
Subject: Re: [PATCH 5/9] iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
 arm_smmu_cmdq_build_cmd()
Message-ID: <af2w01YI01Av0Wg5@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_024606_449521_D9999D15 
X-CRM114-Status: GOOD (  17.65  )
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

On Fri, May 01, 2026 at 11:29:14AM -0300, Jason Gunthorpe wrote:
> Nothing uses this, just dead code.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b3ef001ce80d23..ef0907b1a2204f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -290,9 +290,6 @@ static int arm_smmu_cmdq_build_cmd(struct arm_smmu_cmd *cmd_out,
>  		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_LEAF, ent->cfgi.leaf);
>  		break;
> -	case CMDQ_OP_CFGI_CD_ALL:
> -		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
> -		break;
>  	case CMDQ_OP_CFGI_ALL:
>  		/* Cover the entire SID range */
>  		cmd[1] |= FIELD_PREP(CMDQ_CFGI_1_RANGE, 31);

CMDQ_OP_CFGI_CD_ALL is also present in arm-smmu-v3-iommufd.c
I'm wondering if we should remove this from the iommufd.c file too?

This op code seems to be unused since 5.15, if a guest is running the
same Linux driver, it will never generate this command anyway.

Unless we care about Guest VMs running non-Linux OSes, I think we should
be able to remove this from iommufd.c too.

For this change alone (preferably along with removal from iommufd.c):

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

