Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9EACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a4Yyw4cqtm7g2w2aJJeYA13ID9gFvTcA7MB5XSqJcE=; b=GTDBAPNMZrewXXcsWH0zpuzM+r
	Lkxmq+mXdCZxC5iXKbxuBb6WLJGGl4AE8Or6+UJgJ3Z8kn6mBWE+OunRLuqQORoq4t8423fdRkLYP
	3JqZWyyQq2CzlSLANbS6YM5M+lB/n4CbBw6LPcCnoYu4SK1/pMeYBEfSOHQ+6aQcdDIpTOx6L09rs
	fwCs9/CkZC74xa23wOcS8n8MXjpXagMA0umtDlckruFscoV+baxT5+NTvd00MJzbvuEH3/7VLdm5e
	aYYBR2QyKunVA+zwKdrNQFo5zNK6nxHcqvDMZDmOIYSj1GHxkyzwTeb6JjfGLW1T1oi0yixTYS8H4
	P96jwUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkpm-0000000ETYm-2QGt;
	Wed, 05 Nov 2025 21:14:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkpk-0000000ETYA-1jse
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:14:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-27d67abd215so38205ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 13:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762377263; x=1762982063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1a4Yyw4cqtm7g2w2aJJeYA13ID9gFvTcA7MB5XSqJcE=;
        b=eTlQzunYAR+OCnUE94B5lPh4FlnofqNGf1mMi/EHFdFkFGUk4HYCQFU6HINL9IysF/
         kaaUINMKEwWlcad57zXho0hnq5okFC52Cw+ldpQdFU+dyVQnpDugOHfYF/DhtcOYWEt8
         jCEKsLdFq2tb6TAhs6LSqTpmfMfzYsDNC8oHFzrN8aw7II1bBSnxXLH1y+D0dgw1NyR1
         fOp3VY1amYT+AMvGtOu14Fhc53XSSMOaX4joRDrKcoMahxuK2+5zcZEUd0c4gResQgT3
         RS4iqMXj1L4XPtSgmHWP498mqHMCXYMp4QqImmB3chYqi8Fq3beOq4VDTGlRfVFFnW4o
         i/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762377263; x=1762982063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1a4Yyw4cqtm7g2w2aJJeYA13ID9gFvTcA7MB5XSqJcE=;
        b=PY7n31L19VPvYxyCwJeM5hCnvHcNQpvkQO6NfAkUBwabOeAY7sVYxr1SBPG0o4yf3/
         0a697DYKP6O1j9eyeiuP4Dx/kBxUjzkFbp25Rn50jUbDN1EAZU0fUuFTwS8rmv7u5IVP
         w+g+hytlYgZFD53WIRdNOpJ65YliBTntwQxqAPujuMmk+086jc4JO0ozBeV4J21hunk1
         VjVQx9NSykE7u6sxuAwgLoBYBwGosJwPf/B6LEoULHnbXciAaItXVku0yArE0wEv1eDS
         OXqyaMSbOrbexYQXJpZJSbzAqMlBCq+oHg6XA+VhiaXcUn/PPiKMakOVoibJAK98w5DU
         YVFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdf/95dAUzE1gp7DWjume8phgfqJuA7mvpFUaHdoCvsT/nMeysjrj2ftPXiB5ejESaFY1SMtfnBFqGia9DCNJs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywka/c3IoAkhjmg8kvIAVnjY9Lj+XeJK2DTgNBplqlKsQdXnC7x
	2BS8ZzIUlABijLtXECRg45+eTkhFaXCnovR0zUfjqHRBqWGfP5+rFjfzmfB/VkEIsw==
X-Gm-Gg: ASbGncvdKpXMlCIPzOH/JNRvbEPw52Fn+xAuBGLyD3w5kztEO9Z5WFce69Do82wrCdz
	FC8mny3MgKJxJbHqdRYOpjQrwS1N1pNEhdmZBMNjE6mM9d4n/w1uKnBF0mpHH9vkU5uGETkENGa
	Q82IsKxAn4L/tVUyTkuHA7w/BNKsLu7vStT0r0DtZZ0y/8mjQu7wmMRGCW3cpglVwb+v+XCHtQ3
	279eMCA/ghxGohw0PnTR9eLbCTt1lsKMFqnOtaHtC2Q1Sbc7K2B6Lk3386hnGkuTcIQIQ71AJYN
	85V5+kxA6gGjMTThLnDTiOSIpA6KIHKHZxMNMnz9038kXYZaVB0dHJQLmxwnNJyIgZfSG40fFGu
	Ji96AzuU3sKsDzdiX6BGvmJxEI4dfAj0bZAfunf+QYOeM0MsqnQjXXZ9v9lng1P29mmqHMsvOlj
	WmuB+igxCpw0nyWDo0mhaP2fpMVej5/DFehUwB2EyMeZqx95K9
X-Google-Smtp-Source: AGHT+IFP1YxRkoxKG9m5uY31RvKem02MIvxx/qMo4X6r12qFFAqsYxQUQt6ctZOzHEsowBEgNB2RGA==
X-Received: by 2002:a17:902:e74b:b0:290:8ecf:e9f9 with SMTP id d9443c01a7336-2965b17e891mr190525ad.7.1762377262520;
        Wed, 05 Nov 2025 13:14:22 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d121cf9fsm21677a91.10.2025.11.05.13.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:14:21 -0800 (PST)
Date: Wed, 5 Nov 2025 21:14:15 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	skolothumtho@nvidia.com
Subject: Re: [PATCH v2] iommu/arm-smmu-v3-iommufd: Allow attaching nested
 domain for GBPA cases
Message-ID: <aQu-Jy27_PzxqVvt@google.com>
References: <20251103172755.2026145-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103172755.2026145-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_131424_456254_95943EB4 
X-CRM114-Status: GOOD (  30.21  )
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

On Mon, Nov 03, 2025 at 09:27:55AM -0800, Nicolin Chen wrote:
> A vDEVICE has been a hard requirement for attaching a nested domain to the
> device. This makes sense when installing a guest STE, since a vSID must be
> present and given to the kernel during the vDEVICE allocation.
> 
> But, when CR0.SMMUEN is disabled, VM doesn't really need a vSID to program
> the vSMMU behavior as GBPA will take effect, in which case the vSTE in the
> nested domain could have carried the bypass or abort configuration in GBPA
> register. Thus, having such a hard requirement doesn't work well for GBPA.
> 
> Skip vmaster allocation in arm_smmu_attach_prepare_vmaster() for an abort
> or bypass vSTE. Note that device on this attachment won't report vevents.
> 
> Update the uAPI doc accordingly.
> 
> Tested-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
> 
> Changelog
> v2
>  * Add Tested-by from Shameer
>  * Skip vmaster allocation instead of bypassing vsid=0
>  * Revise the uAPI doc to note a corner case when CR0.SMMUEN=1
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 13 ++++++++++++-
>  include/uapi/linux/iommufd.h                        |  9 +++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 8cd8929bbfdf8..e5fbbdbdea242 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -99,6 +99,8 @@ static void arm_smmu_make_nested_domain_ste(
>  int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  				    struct arm_smmu_nested_domain *nested_domain)
>  {
> +	unsigned int cfg =
> +		FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(nested_domain->ste[0]));
>  	struct arm_smmu_vmaster *vmaster;
>  	unsigned long vsid;
>  	int ret;
> @@ -107,8 +109,17 @@ int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
>  
>  	ret = iommufd_viommu_get_vdev_id(&nested_domain->vsmmu->core,
>  					 state->master->dev, &vsid);
> -	if (ret)
> +	/*
> +	 * Attaching to a translate nested domain must allocate a vDEVICE prior,
> +	 * as CD/ATS invalidations and vevents require a vSID to work properly.
> +	 * A abort/bypass domain is allowed to attach w/o vmaster for GBPA case.
> +	 */
> +	if (ret) {
> +		if (cfg == STRTAB_STE_0_CFG_ABORT ||
> +		    cfg == STRTAB_STE_0_CFG_BYPASS)
> +			return 0;
>  		return ret;
> +	}
>

Skipping the vmaster allocation entirely for the GBPA-only case (when no
vdevice is found) is much cleaner. Thanks!

>  	vmaster = kzalloc(sizeof(*vmaster), GFP_KERNEL);
>  	if (!vmaster)
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index c218c89e0e2eb..225671603ade6 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -450,6 +450,15 @@ struct iommu_hwpt_vtd_s1 {
>   * nested domain will translate the same as the nesting parent. The S1 will
>   * install a Context Descriptor Table pointing at userspace memory translated
>   * by the nesting parent.
> + *
> + * It's suggested to allocate a vDEVICE object carrying vSID and then re-attach
> + * the nested domain, as soon as the vSID is available in the VMM level:
> + * - when Cfg=translate, a vDEVICE must be allocated prior to attaching to the
> + *   allocated nested domain, as CD/ATS invalidations and vevents need a vSID.
> + * - when Cfg=bypass/abort, a vDEVICE is not enforced during the nested domain
> + *   attachment, to support a GBPA case where VM sets CR0.SMMUEN=0. However, if
> + *   VM sets CR0.SMMUEN=1 while missing a vDEVICE object, kernel would fail to
> + *   report events to the VM. E.g. F_TRANSLATION when guest STE.Cfg=abort.
>   */

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

