Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2C0D37E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hewq6sKfyqMWuY04fEC1TGPKE79y9zR1LTOJeM3Fj4A=; b=uYbFyXi32OFLSXuxJ4GqtDhfpa
	MafGC5ZweFlM/hXc4BA9HaRMLglEG+UU4fgXwCxyv6z3+Z0m9mNPP0vWrZOGAJ9WI76eLZspw8Tyg
	67llLDZoDGROVie7gOyyo2fJfKVzOktPaQp58XjS7AA1FIlzjmLZNBsk98EfeESzUG+hrCk+kFWAv
	XA0pieJbxcahxMRUGh+pue7aq0Uev94TZawqvl+WsTHRE/g+/jWjS+aIWopCOfwQbYQNHUpMZS6t+
	u79tvQcxAAi7g+Oga/JBJLNlontSbuvcwG0VM0s5CmXZKiSM6hbEBeQgOWXA9JeObqgzFmed01Q8U
	1td2uG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg37k-00000009m4d-03uh;
	Wed, 14 Jan 2026 15:49:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg37h-00000009m3o-2l6q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:49:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0d06cfa93so76685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768405768; x=1769010568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hewq6sKfyqMWuY04fEC1TGPKE79y9zR1LTOJeM3Fj4A=;
        b=PKRgJ3kKRsDML60FJvRk8ObLdswfUm4Yiub1jSvGAcDY8+5sxxgqQi+I9ddRVyvx+v
         kGknOI5+qzvxR20WFvklYVKLKHPxRIrPmdAw0P293H/c0WXBRYkjtON3LH4lW5mAeVqj
         d4QoF9KI67tqE5xji3C/ulLcGE1OTOzKutKdM7xTtZ/yGqaTC88QUpddfwVYhw7x2WNY
         P2fD7tscqCBq/uWxCaPKFNJ2bRBMhD+l8DgPOEYZXbBsOOCGHtpWS+ltF8vgbmoDIIxl
         86V8Na1Dx6Dtdwj2GrkkiQ7zAe/qWzO9axCm6BbY8ardo3pe1KU9nC/OFbpujdxRvTT2
         al1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405768; x=1769010568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hewq6sKfyqMWuY04fEC1TGPKE79y9zR1LTOJeM3Fj4A=;
        b=M6QXHoq7oCQMvAh0UBgrSrp9pZTdBjb7N4JBpIJrX680FliMh59JzSsp1QT5AKvuuP
         Z/p8np1etb1hEFaqBiwOdpL+fm89wM1bSm0SMLwX+S2faTTp2xN/9NJwY+ZIoqwM8+zO
         8wgO10KuWIPqzyjVtI3/8TrBsq48jlxO0tgeFLy7zDAREyTm+sho4fZBT8uGKGhnD5bu
         owe4/ckWHSoxLZD+Tf+HyT/azxxosMAR0NjSVu7P+SKVOCABPiA6DM6SoZFUL/VTR0ti
         VXjjkZFyPtd/Ax3YQdDX8hm6rDzI90unUyUjNdZPUoZVYDXzUO/BuGMiC9WgwrVLWmvT
         D2Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXZsRlxDDWIhX+zTryZRzJd2dB6WNdiUgnP7grzXpzrLvOdoOTP+tzZT/k7UNF4Eow3KJf//PsE4iQLHngHP/j5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfenhdto71iyXuAqdW47BShYVNaCHad1nPblUesQoX+oZKtRe9
	VLZD1hOsILvF9iCtzeUhNJbulsSih+TYlStbqI6Y9PuE2J9juuIsAPqssBR3iBna8w==
X-Gm-Gg: AY/fxX5dxuRoiyYlEN/0zq47mkPEV+OCAEjKzAK+syjgnk2VFgSbayB/lHL0rBXYjSc
	5UtCN9MS2Sywa2fwr+5LCI1877Ruw906JsdDCwTCsaL+UeA24s04R+lSytRNvyM9V4k2ZgROJeJ
	mMFuc9pzahbkLt8XX7ADK/u/H1GQ/yYJZgWBd9cJIaf9y1atSJZcJst93DFTRQC6u3ghiLFRUP0
	/YNkx1n1U5wOO0IRYeDR9aUbgECCWCldKylJz1sI+Y+QkHn6SqkXpkNTInQ6WrSbaqRfKuuIA/F
	aA4VA2JusYDhVcrhi85tTQhh+UmAcEsQC+YYBOaD2Bi7cTyhYCDJl7NIV48WG/Plw+QIY38ebfH
	dXRTnJdW4fQTo5yuzNlcnE3LndX3oRXtud4uqNvsDm0swoUMv+YacmHxZ5AA8dp1wVgvui/v730
	lOwdsnC4jS3TfWaG7DTK/YpqzQkRe9FdqkbGXyOgjto3CfC4Hu
X-Received: by 2002:a17:902:d583:b0:292:b6a0:80df with SMTP id d9443c01a7336-2a599aec680mr2522025ad.10.1768405767789;
        Wed, 14 Jan 2026 07:49:27 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c530133csm23442851b3a.31.2026.01.14.07.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:49:26 -0800 (PST)
Date: Wed, 14 Jan 2026 15:49:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v6 1/4] iommu/arm-smmu-v3: Add update_safe bits to fix
 STE update sequence
Message-ID: <aWe7AUG7PPGX7mkl@google.com>
References: <cover.1768248467.git.nicolinc@nvidia.com>
 <b80ddc54f439a239e74bd7c0bf33ffb73e2eed1d.1768248467.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b80ddc54f439a239e74bd7c0bf33ffb73e2eed1d.1768248467.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_074929_697729_22C0F30E 
X-CRM114-Status: GOOD (  15.54  )
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

On Mon, Jan 12, 2026 at 12:20:14PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> C_BAD_STE was observed when updating nested STE from an S1-bypass mode to
> an S1DSS-bypass mode. As both modes enabled S2, the used bit is slightly
> different than the normal S1-bypass and S1DSS-bypass modes. As a result,
> fields like MEV and EATS in S2's used list marked the word1 as a critical
> word that requested a STE.V=0. This breaks a hitless update.
> 
> However, both MEV and EATS aren't critical in terms of STE update. One
> controls the merge of the events and the other controls the ATS that is
> managed by the driver at the same time via pci_enable_ats().
> 
> Add an arm_smmu_get_ste_update_safe() to allow STE update algorithm to
> relax those fields, avoiding the STE update breakages.
> 
> After this change, entry_set has no caller checking its return value, so
> change it to void.
> 
> Note that this change is required by both MEV and EATS fields, which were
> introduced in different kernel versions. So add get_update_safe() first.
> MEV and EATS will be added to arm_smmu_get_ste_update_safe() separately.
> 
> Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks!

