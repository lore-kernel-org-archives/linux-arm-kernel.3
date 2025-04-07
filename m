Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B504C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/LHFPsYBw0bwDf6dVcpDSJnHybANIimgmPtryFgNPA=; b=zxAjcIvwjTE6OPR4nQE38G30+3
	0izomoxlMNp5VsLpNd4ltXiZWMbmQEHouf9CJU2iUtMJQsfybbSIpHbeNWV/kU9T5ZbI6h8/oRu/n
	2YEt7Cy4YCpPH1evKf6Vj0YBE/oWHAzzWnOav73PsJjjjwefGXJqS191iT5lkDRN5V9Ld1coDkMDg
	BHhJWPWFG6+ytNLiiP4E0WKpROE+soBVCKlPOOjbtLKiYIDDfRXGeUJpRDOYn16giTA59TiKN5z+o
	6LNPjXz2JgNys2jvufjAWW4VXS+9wEJyEJjM9+UoR8EiaKg2ieLr1TTaCkoDCYKIaD/gMxMZwdQhl
	/UXnqK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhm-00000000H7d-3dBq;
	Mon, 07 Apr 2025 12:35:58 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lHr-00000000B5W-2fCJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:09:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso38637941fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744027749; x=1744632549; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/LHFPsYBw0bwDf6dVcpDSJnHybANIimgmPtryFgNPA=;
        b=vZEUs5IapW2ygYMB1jiSO/dxhfNp0Dsi5va77YWpPepoHqQOmfOPuYBbaC/cXZLwmT
         b9Vp32bZe4pUBXAINSoGk6SQyEMRZ4FXVUIajykRInu4dZe4ckwil0h8nbwQ0svvq1iA
         6rGv9SRhv9OsOBteQSGGV8flOvetVWBITcMTI45MltzpSdGYgMxL8+zqjelIjGSroLtK
         Pf28qjkOUP5yD/G6i8fUp/kI6+x35q/WnyeiSD3WXoVXVTmMgkOVseZp+3TvUte/J0Bx
         7kCaowNURixg+CJrM9HqdoqDCHW54047oTfNnL+PjJCnL2Wlw2oRHxn3UQKY2Kpu/nVA
         MfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027749; x=1744632549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/LHFPsYBw0bwDf6dVcpDSJnHybANIimgmPtryFgNPA=;
        b=JzBYdl6AIJCp/kp8QK1TS8e1NxEtyrYdBiCyhivZ1T6zmVmCLg4LS4r8R+gyvajUxn
         LtVgI45MT0yaDJVAgDniFZLj4JBc822xIJ7a/MSsUbtzyhAvhgSdCxJOlJeTM0Faz+58
         stnT6okjxqxclsEX49tLqKQ/HSBGbFVBtDlKGKdLQKhdhy9a+aqccpsKrSI71pkf1WRz
         GKBTu6C1zK62PydGLaZzFdttoWXRT+q8mZjQTpthNUq9O+wQOpmyZ7KrNwl8lLTWjlV7
         T8VzzXVrLRr3+ptKtWzYGfhI0MAjDzA3dupgBCHZyj1TPiW4788bncsuo75tlOgVh6Ar
         DyeA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ5HO+46PqVQF18ub2iaYDS7ajio/i9Vr1ZV8WXJ9BOplCLw4a5DmJ1Wz+Ly+xu0MJ5N5a/uDKQCklqh1MFdJj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywej4wRDosjC3SZdjOcay1vAR82TTlJQNU8UVBa7JovSSJmox11
	XtDa/hxnyQ3DqcvQUkjNIkCzIw35k8WQz5r2D3ndDo+PJgAdIeBxfrIZ/2KDWKGm/Lf9toV3yWG
	R1YpLdfq8mXP/Enri8snKkGmDxmQmYnTlB6IYLg==
X-Gm-Gg: ASbGnctyPXAz3+KMghB8uaEZmsmVIYnggMt2/NeOtGDf43pcXgA/PW0BYbgsti5RP12
	oeQ8/WyqlirHIDPUW4mUaJB7HkhcxDIfNM8mkL5XGkdrAXj0DbmKI4pF7nkEHvMQXWmi6zcZbrK
	OV7C9+8LVWJzONR7rTilFXswz1ctDKNCm0z73tZ++m4g==
X-Google-Smtp-Source: AGHT+IE7avfocEmD5lqNIyS63JcSTkkwf3BvTJpAGhR9l+oQoFSuLjrFiN2oMnoA2mOmJOAmlfiARgKB+FZMo6LuuCU=
X-Received: by 2002:a2e:bc1b:0:b0:308:f580:729e with SMTP id
 38308e7fff4ca-30f0a180dd0mr35506541fa.27.1744027749231; Mon, 07 Apr 2025
 05:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1740504232.git.nicolinc@nvidia.com> <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
In-Reply-To: <f205a4e2f5971cd4b1033d7cac41683e10ebabfb.1740504232.git.nicolinc@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 7 Apr 2025 20:08:57 +0800
X-Gm-Features: ATxdqUE-WE2mGG2qPqESoLiVUp7LnTlD7II4G1YhfYdYp1Eq06d5HdYvjf8h2-k
Message-ID: <CABQgh9Fuh2HdBH7pyAteawZBpa55ZzfR9dv2K4RF=Ps4yhREbw@mail.gmail.com>
Subject: Re: [PATCH v8 12/14] iommu/arm-smmu-v3: Introduce struct arm_smmu_vmaster
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org, 
	joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org, 
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com, smostafa@google.com, 
	ddutile@redhat.com, yi.l.liu@intel.com, praan@google.com, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_050911_685984_08D8654D 
X-CRM114-Status: GOOD (  16.02  )
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

Hi, Nico

On Wed, 26 Feb 2025 at 01:35, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> be the first use case. Since the vsid reader will be the eventq handler
> that already holds a streams_mutex, reuse that to fenche the vmaster too.
>
> Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers to set
> or unset the master->vmaster point. Put these helpers inside the existing
> arm_smmu_attach_prepare/commit().
>
> For identity/blocked ops that don't call arm_smmu_attach_prepare/commit(),
> add a simpler arm_smmu_master_clear_vmaster helper to unset the vmaster.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastavat <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---

>
> +int arm_smmu_attach_prepare_vmaster(struct arm_smmu_attach_state *state,
> +                                   struct arm_smmu_nested_domain *nested_domain)
> +{
> +       struct arm_smmu_vmaster *vmaster;
> +       unsigned long vsid;
> +       int ret;
> +
> +       iommu_group_mutex_assert(state->master->dev);
> +
> +       /* Skip invalid vSTE */
> +       if (!(nested_domain->ste[0] & cpu_to_le64(STRTAB_STE_0_V)))
> +               return 0;

Why this is removed in v9 and 6.15-rc1?

I tested 6.15-rc1 the qemu failed to boot with qemu branch:
for_iommufd_veventq-v8
"failed to attach the bypass pagetable"

After adding this "skip check" back, the qemu works again.

Do we need to add this back?

Thanks

