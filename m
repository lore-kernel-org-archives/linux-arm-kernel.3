Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B89C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84rMYzUqq4y85KkEDWY3HmzD2Qa5Sp+w6owgX1xBktY=; b=OlyWIvHMIGNgYfP9dGF6xlGRm6
	wtLOSzIFJ/jFgtRD7dOhHd3kHwY1tw7T6jrfldEJggfAhh8s2BMEvWuwtMF0HktbuXg1ZcVpOqWLO
	ZYDdUOHRD4HZitulw1fssyGOfoBIhE3G5z742CnAq3FGRxA4xk8H0cF/42HDzRjkoVxDl52Ke4cME
	gd7iCH7IOrS2amiZ9Q1fWuxGV0iE9fzjf2cQWa3Uu6xmud7m0gUMuf9QACXmmmCObRei6hHM3ekcx
	2WC95quNCR+xmhZ4UgdxqZ2Nbcr1I1+21GEGhFO/rCetSfqwP5dT26obVEJjRzrdkh0BRVx+3qQLX
	mUDqJD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhpV-0000000HLdt-3a7x;
	Fri, 17 Jan 2025 08:35:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhoE-0000000HLTb-3bZp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 08:34:32 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21625b4f978so80035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 00:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737102869; x=1737707669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=84rMYzUqq4y85KkEDWY3HmzD2Qa5Sp+w6owgX1xBktY=;
        b=sbjtbJ9GmiB+2yIpP8gI+7vC2isaMG/YA28zU9hM0uyBmZc0lYKTTuzo9+RiLSPHr+
         u0gM8JEfKhd2iXRcT6yWfkxuAQ/89XVFwOyTv0nHSpIYH956QHy74Hb6F4o6vzJFSzLu
         aZhDhe1sLYeVa1tcppoc3NJEVCIkG0twat/03j3Jo/PfOWP4SFq2lbx+PJUllijGeOQ8
         vWYuvBXLFNAEJx2BjwoohH5DgKvQQ4WRi0b4ihg+1zwj6ybzMH9vcPNfs/SvFYDGY8aS
         jy68CwV9AOjK9ge3JpIUseqeTBB5Vax60Ej3FjC3fNQaSdRQnLkum0afN0FpSncEv+Rj
         NPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737102869; x=1737707669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84rMYzUqq4y85KkEDWY3HmzD2Qa5Sp+w6owgX1xBktY=;
        b=dMwmOva+jktwXtjJLT8L68+ApoB2fnaQEP1/xHH5kqzpGHKSMnlWUDO3jr2jzHo+h5
         sm4EDiZrWcJ8G9QXxW4dn4K1VFKzpwO2VbaLT6uNLLGwt93Av/C5tdgUxDY7dr2RdyjM
         +F5n4x/MPEGLA/RjfaL6G9JtLV9Cns45L+xcHmEiGJj3oGK9DgLBiASaVE7cglI8n1Zz
         3iZk6pR5Oc83CxblN5Y1O1icZKnGkxgXOjbvMNJJmBMyBAMJAuT8YvgEdcIrFKwVEPWF
         KVsQqfqq4OpEwW2Rq+9hLrChijLwzKsGq4+sWpBNyt8M+n9IQekOw21yTEUYhb21KZul
         /atg==
X-Forwarded-Encrypted: i=1; AJvYcCWcqEihPlSRJYohswNFTs+7WNoYrQphrht/0UL6/EOHVRcYHOC9TwmpDwaFtpYP3ZGNh2105L5ztc+fe9ZCNHR9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz49nk6aes0hLQNMFQFXrCZo/BuQbB0HpZb0+Nz1zmDRaja7PTD
	OkvD9QCF31X2UVjripQnP8K4TOFkI74yJ7Gxj74M67zPF4qWK1qHlKUxzFlKFg==
X-Gm-Gg: ASbGncuP6fgqm0gECavnzoJGlqI4aWwTl6amF8T9JvviG7YiomPjgADGMdV+LwyaDz/
	LmuGsq8thw6C6EFbO3kLKlLQZIG9T0qpnhNCutOpQRTRJkPEMZef/oE9pCu5uxM/tDRiLDhttz6
	trrOiIiHFFxxx96WZld59eOhf5PYgzX+y8VikmKs0AVfbAB4XMYSm46JI+jAgYF5qscJ2bZhf2l
	+CAAPtbH00hQeNsMGxA0W1mOQ1PvNfbnEwYWq14LizG9XQa33bTzhtD6KMXc0VSJsS0MUGP64Jc
	Xcp3+yy3IqDE
X-Google-Smtp-Source: AGHT+IE7mqIl7gVi27tsigpFfH+LHplATJtz4D0uDOw0zsnmgSdBynTa28sifGUpSwSM2ArpqhIfWA==
X-Received: by 2002:a17:903:3285:b0:215:884a:e8d1 with SMTP id d9443c01a7336-21c33430be1mr1851675ad.24.1737102869074;
        Fri, 17 Jan 2025 00:34:29 -0800 (PST)
Received: from google.com (1.243.198.35.bc.googleusercontent.com. [35.198.243.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7761a713fsm1422341a91.25.2025.01.17.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:34:28 -0800 (PST)
Date: Fri, 17 Jan 2025 08:34:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, mshavit@google.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Include string_choices.h header for
 str_read_write
Message-ID: <Z4oWDGaXpY-PPkqr@google.com>
References: <20250116121025.118464-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116121025.118464-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_003430_901962_FFFEB98D 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, Jan 16, 2025 at 01:10:25PM +0100, AngeloGioacchino Del Regno wrote:
> The str_read_write() helper function is defined in the missing
> string_choices.h header: include it to resolve build failures.
> 
> Fixes: f2c77f6e41e6 ("iommu/arm-smmu-v3: Use str_read_write helper w/ logs")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 0e4cbb2c64d7..a0e395da8a88 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -26,6 +26,7 @@
>  #include <linux/pci.h>
>  #include <linux/pci-ats.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  #include <kunit/visibility.h>
>  #include <uapi/linux/iommufd.h>
>  
Hi Angelo,

This change has been applied to the arm/smmu/updates branch and should
be available in the -next when the maintainers rebuild the branch.

Thanks,
Praan

