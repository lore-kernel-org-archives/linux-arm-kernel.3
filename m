Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E5CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnE2PZuA4mlcF5l6Wvu31DrgU1W+yVTlxMHSfuz9j+8=; b=VkGfNXXO1ZoNAKE7tSOaLTC4tJ
	nI1Uy6SATjKcZpx3pG232OLzVM5IWPS4JGrKggEhN33cdG1G+QWC8VqXv3Bte5NYilafalXeQKu70
	9Rl8cJIKBw1U13ZM3UjJvnaYQ41Nojrp4NDljpaGGk7FD+lISfwYCTimBVbAk53b15KFpP0ToDboa
	g9FWv7YKnGic3s7AyMIih1JHZ5eSqO1aVQLv8+8Sc82iuWnnRdlYQj7CeTO4wZyRNf2ocGEUD7oZB
	+bFZx40FP/gdOv/onNUZoINBr9dWza0lxE+cUmVgT+S1Wyp6x/L7M8vdc0KSbMOgbs2UoQ58LyJeN
	NOyULC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK1c-0000000GzKp-3MHB;
	Fri, 24 Jul 2026 17:49:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK1Z-0000000GzI7-1tCv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:49:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so4185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 10:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784915367; x=1785520167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UnE2PZuA4mlcF5l6Wvu31DrgU1W+yVTlxMHSfuz9j+8=;
        b=bqkkDoS7sikCVwz0ojf9W490ObYWsWsauRQrEnNFZe6Uy4JocFTn72QSnqXyhgrDQL
         bNKWh99ncGZpmDKzXWZZKMJiJv+l/W7FTvTc4ig8NI2fTXGVr66d4VJRNlCv9aR4VJM0
         U11MF7SV1PBi/swgEVOppxVctzWJTzLZDZ63x/pnjQPt3mEyUBSOSOsdr4EX2BFdXae9
         ayFtknecxXbwaQW+JRzprQ7sI6QQ/oI7XvpnhnDH67kIkSaAAR08HiFUlmnCHCeuUZHc
         O8PzQbQo6aljXXF8v7r7u/zjLayOZPxw0FqOYABCtdCxYy0yYypqGIJjElVj5eQqwF6v
         NylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915367; x=1785520167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnE2PZuA4mlcF5l6Wvu31DrgU1W+yVTlxMHSfuz9j+8=;
        b=bGDL21TSgiU3HQ4FSZZ7wlkTmnogov3/ZBb0Oya/uRdgwU5I6YYhJ9XQCA2Jq35OEQ
         sJEJ7ZJOPimEKxLNVzHEfdn/sRLJD+AGN/yWxcUxa2Xv7HlxKd0X22qpd1lzeJi2cSMW
         uJQKUO1pjN4LHK/cM98OpZjUf9tmY10B3b5lbJ84jCCKRVLLq2TsDvg6gsAkiWSDG4jx
         WHfIXLU0iVCVQbnYVpFC6PrLB4/KuJxArscAXOj5etCn87WIYnQav2sic+ctGYrNTE+8
         Ucc2uUv2AtGwVzow5TCr7WnTdghn7LAnBlsYdZD0oRwlr1dK10k+6LTWHmNj5r/6zybh
         1GnQ==
X-Forwarded-Encrypted: i=1; AHgh+RobDsLbVc2yS541+ZnEtGJ4ZvzmznRmrxE2S4Q7rvtNsVZRiUeC6UexBUI6DNrpA1QuvJVTtBm3NfBADWf/UaFh@lists.infradead.org
X-Gm-Message-State: AOJu0YwpwcXoOVAB9xLtg9hpEGwTvBNcu0bWpegdYYx2yBbCLVoQ7ci+
	vAnzYodyjfS3POrTGWSodkfs+yBbUZFBEHpdwC7SyTRSjzu3YJK88KO05MRt5bvEVg==
X-Gm-Gg: AR+sD11kK/qzJhe8SDOsyHDNL9VQVM3abdTUUcLtqVNVQazT4uQ+fWCpzXl/7NuZuh6
	a8lOrgHhNzMPtbkW9otiRUaCnCb6f91mbA4FIjxh0R6Dc+qWBq7U7JnzpiJQsjT0cEJ/0yS07GB
	PJfSs8JOvBm3VZ8Ts/lycQmSxP6T1lzoUqnBqaRdIGgN8CsHSA0QEUATcOfyLK82DHHVIjOBRoh
	82W0a69m2n5chiot/YU6X+o9Rmc2ghh1gUDIi0oRzEScY2HqJgH2HQGV4RXHuC9UCmBKXX5yc/8
	15Sl+IHrktWO+aMJkSMtHoHuDH2eO8XSSd5Fk9qKzOgmyw+NWEssk6sGZIYV6M1QjUOEGtcNQ6Y
	OGQeonaBtoaa5fkLcJ9NOwSUu+rTRRaR3jAb197dXBHj0YlnqExZSHw35tVv65PZvXfXwgM+zLY
	8kD8PrcDc0Aw1R96wlWWmspw0wOrpsk3CzjSn+9mbc48YG8wy6
X-Received: by 2002:a05:600c:4583:b0:493:aca0:32e2 with SMTP id 5b1f17b1804b1-496b4cf6c36mr98295e9.4.1784915366398;
        Fri, 24 Jul 2026 10:49:26 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee1d31sm1129795e9.5.2026.07.24.10.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:49:25 -0700 (PDT)
Date: Fri, 24 Jul 2026 17:49:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 1/7] iommupt: Remove the sanity check for
 pt_num_items_lg2() at the top level
Message-ID: <amOloT9ExCVjYxyf@google.com>
References: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <1-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_104929_972938_86CBF16C 
X-CRM114-Status: GOOD (  20.42  )
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

On Mon, Jul 06, 2026 at 01:29:07PM -0300, Jason Gunthorpe wrote:
> This was ill conceived, the existing formats work OK because they
> happen to support pt_num_items_lg2() at the top level. However the
> documentation is clear that is not permitted because ARMv8 has
> concatenated top levels and we do not want to calculate an exact
> pt_num_items_lg2() for the top level special case.
> 
> The logic to compute the number of items of the top level is shown in
> pt_top_memsize_lg2() which is:
> 
> 	num_items_lg2 = common->max_vasz_lg2 - pt_table_item_lg2sz(&pts);
> 
> Which is pointless to try and sanity check.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/generic_pt/iommu_pt.h | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
> index c2752151c80af1..f1320c7e88dbbb 100644
> --- a/drivers/iommu/generic_pt/iommu_pt.h
> +++ b/drivers/iommu/generic_pt/iommu_pt.h
> @@ -1207,20 +1207,6 @@ static int pt_init_common(struct pt_common *common)
>  		     PT_FORCE_ENABLED_FEATURES))
>  		return -EOPNOTSUPP;
>  
> -	/*
> -	 * Check if the top level of the page table is too small to hold the
> -	 * specified maxvasz.
> -	 */
> -	if (!pt_feature(common, PT_FEAT_DYNAMIC_TOP) &&
> -	    top_range.top_level != PT_MAX_TOP_LEVEL) {
> -		struct pt_state pts = { .range = &top_range,
> -					.level = top_range.top_level };
> -
> -		if (common->max_vasz_lg2 >
> -		    pt_num_items_lg2(&pts) + pt_table_item_lg2sz(&pts))
> -			return -EOPNOTSUPP;
> -	}
> -
>  	if (common->max_oasz_lg2 == 0)
>  		common->max_oasz_lg2 = pt_max_oa_lg2(common);
>  	else
> -- 
> 2.43.0
> 

