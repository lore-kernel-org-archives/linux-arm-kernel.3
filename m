Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D6DD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYk5VbQOx8qeK5j+I6exldUJy66Tz0nREUA5btGygaA=; b=QHIk3PIowPN3D5pp/mVDOquJw8
	fJqFO7gLU911VvUVSHO/rRbXhArqFcUD7NAAw366oDulyfEVOxySiuc1VH3DI2Z/88Ud/9uUqfm1E
	Kq8AMcFkfwOKS/wRAdkVIQPl/nhL6pYUoeHnAZUW9RRwRg/KOq/iYgTW3liGkGlwRpd77Z420gDsJ
	NA3oooksLXNR6IIF26WSrV68Z5rtgrF+FKC7iNIa9xMsAE+BgOqbkd5PgudJDYsIv6hLd6SUi4puu
	IPTgczhkwDDtQncSdcXj/fiGBFhlkdsTywHXt9HSPkwY14IUBSpkF6wxeBjryQqTaUWVErIy4svmr
	uTWePQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi67T-00000003LOZ-0kCE;
	Tue, 20 Jan 2026 07:25:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi67R-00000003LNp-05Li
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 07:25:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a35ae38bdfso55415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 23:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768893937; x=1769498737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sYk5VbQOx8qeK5j+I6exldUJy66Tz0nREUA5btGygaA=;
        b=Q721dfNI5qzQHU7EJfUnDbNI7VJtBSsIAxG8BEWvPi66PP5Vwvbv2tuTRr9xd8ydnX
         EWULhN1a1uNEQTapIAKWMpK1hXaVkTkcoLxk/n0+fs7x/dkmlUkODJHMr+bf83SilpJb
         KSx8MeZMNaRKT0rx+YnXZx8QZ51csViv3SKVX4jg1EVTORnwLIjhp5qGg/B2ffbNa1ve
         8dqptJwPk6B8uKDuZi6EgpMm8ZjpkyMVtpg+JhKZ4t19x/M1MH/37AG9vGhJJxwiAoVW
         yN1l1hO33U9Q4694k5yp7adPKAbRksX6kDN+tuIL2Z0F1+3Kp5i8rbxQ4lZxEzfQ1rbA
         A9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893937; x=1769498737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYk5VbQOx8qeK5j+I6exldUJy66Tz0nREUA5btGygaA=;
        b=Qai+/6q10JfWCQ6Vw29RhdZ4/JknWQLexzOxczuAXM485nLag8U2nkxkwsqTbW+Hnl
         K8fXL6JV+99WW/ao0zZqiswaDE91csBHzMh/V3JvI7xOOUL5BLl96HxqMWEtRd8wpCYv
         S/04wWhUh8a5gj04uwBvYzVu6yLt2lRBdFBjIzo4mGw15GKWKd/0I8TawzvsZhQT49sg
         vpbnPhc9yUxF88+WKf0kJK8C68QwekLen16m2TP3aMrdQVVP1o2u0IVsCNwSgQCePJRo
         +XaG7D8dr+IRTwfQHWV2C+JM2reVI2DWiDBkei1noOowX4WKrRNZQlVvqBaA3F1pkZbS
         dpLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVggfd9nmfy2t5TMCWKrgZTtma5RqnOTZEQYd/eRCQcrE59ZssjIU9LSNWyfkDBrJnjWQgO5oYw94wLrDRj5npu@lists.infradead.org
X-Gm-Message-State: AOJu0YwhaZ5niiHORM+8CeZ3lQFOtKcOKNIClbwkFlqdfUX2TtxaDGo6
	b95PW3M+5IjvTG0AOipYiB1c/xPMSdG87QmHzSJ9JOh1rYEPWZNkLRVh4Mqw96DUigkCIA9umEO
	+a7z2uQ==
X-Gm-Gg: AZuq6aLA/B7FPi/Ro0FnvlFkAsjWn09KHD+NIMbNrwYQ6S63glyXsX5U4ECyPVrZBLL
	D8x/ml0GUJjmXL2cWfmR/8KDIDuDqpPFXaBnlZBibpS21wLZT2wHxKGHfE7dChpuwXN8ne/iCVi
	88gok2Npz2tAgjNe9RmDWr6XlU9plDqQKBdUf48KwMJKxuVpzTX2RJOby676R47iw8oc423/i+g
	VdL2+keVQKvUkFSmQtXW0lOhc3Km6Pl4axOQvR3sdKzImRtXpruJcpl+goVxYLf0bUqmEpi4r3Z
	IMDAy3mzFutmOmsXYEORk1QucmyW9nhag46td9H7TiHqFsmuHsLC/8ic1OXysoUeLEKbGkNp+FY
	RTYgZiue928NXwus2iz+t7JJRlLybAsUGKfKKOZBAeHj/Oi3AB04kP2y6WdCdvPg6BMig2FCR2u
	+frptZRoqx09gZfi0rK/Bgbw/pRa19Hs/kgBvzk5N92RS1zdRB
X-Received: by 2002:a17:903:2289:b0:2a7:6c4e:5914 with SMTP id d9443c01a7336-2a76c4e5f06mr647805ad.6.1768893937263;
        Mon, 19 Jan 2026 23:25:37 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10c5502sm11275223b3a.24.2026.01.19.23.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:25:36 -0800 (PST)
Date: Tue, 20 Jan 2026 07:25:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Do not set disable_ats unless vSTE
 is Translate
Message-ID: <aW8t609h-7yDi033@google.com>
References: <20260115011243.1302402-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115011243.1302402-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_232541_063173_4E4361A9 
X-CRM114-Status: GOOD (  23.51  )
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

On Wed, Jan 14, 2026 at 05:12:43PM -0800, Nicolin Chen wrote:
> A vSTE may have three configuration types: Abort, Bypass, and Translate.
> 
> An Abort vSTE wouldn't enable ATS, but the other two might.
> 
> It makes sense for a Transalte vSTE to rely on the guest vSTE.EATS field.
> 
> For a Bypass vSTE, it would end up with an S2-only physical STE, similar
> to an attachment to a regular S2 domain. However, the nested case always
> disables ATS following the Bypass vSTE, while the regular S2 case always
> enables ATS so long as arm_smmu_ats_supported(master) == true.
> 
> Note that ATS is needed for certain VM centric workloads and historically
> non-vSMMU cases have relied on this automatic enablement. So, having the
> nested case behave differently causes problems.
> 
> To fix that, add a condition to disable_ats, so that it might enable ATS
> for a Bypass vSTE, aligning with the regular S2 case.
> 
> Fixes: f27298a82ba0 ("iommu/arm-smmu-v3: Allow ATS for IOMMU_DOMAIN_NESTED")
> Cc: stable@vger.kernel.org
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 93fdadd07431..823461a26659 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -177,7 +177,9 @@ static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
>  	 * config bit here base this off the EATS value in the STE. If the EATS
>  	 * is set then the VM must generate ATC flushes.
>  	 */
> -	state.disable_ats = !nested_domain->enable_ats;
> +	if (FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0])) ==
> +	    STRTAB_STE_0_CFG_S1_TRANS)
> +		state.disable_ats = !nested_domain->enable_ats;
>  	ret = arm_smmu_attach_prepare(&state, domain);
>  	if (ret) {
>  		mutex_unlock(&arm_smmu_asid_lock);

This makes sense. The nested_domain->enable_ats should indeed only be
checked for Translate configs.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan


