Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BABC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 22:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R47AcAvcUPYEXwZnHLXErEx0+JYbAettmKys/t37PLc=; b=wrdCuYmcbaqPMnbGJ6frdhcMqo
	RB6jAsRQb/43Y/sOWpPq19n1fbQouOa7Be5OlIx4D0EmsNGU0XUafiMOutV11xYPOzd7v93yQpqFS
	3HZg8DMYL6P/Uf/3vfOVHlicPUdJEv++3KOPss+MMOiS4pj5EY9iG1HYE70uZx4QCOk9SooU9jcAn
	j755vhw5UYCQEjA1reT+ShmNB5Qzr62xcGAsNzNN5Sp8LRMe5sQqMpkz3433pc5QsDeXbJ8IxvbLm
	BszllfiRM55jwrQnyrxwTo7uBabZz8lpy/AerNY/0yRjioLcBoXpW0uTSzF3sMKeEOOOXdQt7morw
	vanPtVDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9t7U-0000000AwcW-37Zl;
	Tue, 29 Apr 2025 22:08:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9t5Y-0000000AwGm-1mra
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 22:06:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2264c9d0295so242365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745964363; x=1746569163; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R47AcAvcUPYEXwZnHLXErEx0+JYbAettmKys/t37PLc=;
        b=1sITc/ZUwvivdzUvPheNobt8aig2Rs+K9iDDlpP3ZDMlQBrD5UwGbiachn/8ZkJ3hP
         RaLvMaXGMtLsNleFXJR1fTnkx9C2cbb+ssdISab+WwNmEFLoasKUuiQ+qj7aP9Qa0eWE
         0UnJkK35A0GakTt8hWqiFLT40+LEkOQjop2+VMNfAXSDnnXi2pEp1OibV8knG5Mjrq+b
         OnMW92eZnGMIn0Toz0JsaIKgBLov2tYv1j9/tpjRWFFRPH1Om2Sh1/ALG6REv7gSIuwf
         A22PLOXlGMaWUdcxHoktlJPvH5sSpOnPOHGSkX2YifKHegS1d6WVEyCDB4BzpCVyCW9v
         9fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745964363; x=1746569163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R47AcAvcUPYEXwZnHLXErEx0+JYbAettmKys/t37PLc=;
        b=EIMFWXA5FQqQvp2Q4G2ZgRLB2lo3jHiozfmrXBn8o+ZHDS4wcf9/LpU1kpMBiwU1SS
         jRJqHJt9Fkm8dOIr5TRWtlMh3+NE17q3iVg10+O107R3MQShkrFWX+478t+CFPdXoxFV
         hWnwvCVsRhhlQG+S7j8C4TWvtm3yUfvmoKXD1QEMCLVfGuoqniYB0rApZ/I4A3Jt2FDe
         2Y9+cV4cOxInu2e/RCIvBoq6EkSt+nHaPrS/eC7DOJX37QmlIIII7Qi8KJF+LaUF1tzA
         vDt/OVKPqDJQ2oKqDaoiJjKyNjYdZEQO472Y8aBio2MCNxT6RIPzoUOWKNHfapN8RdKz
         qmuA==
X-Forwarded-Encrypted: i=1; AJvYcCUSdNenEn29DmHU+EN9AjOSjT4YFGDHJOTzQWkFJWTEnl27YoKLwP95QA4A+1DX40b9ED0X06SPgaeI7POEWXbD@lists.infradead.org
X-Gm-Message-State: AOJu0YxhzJY1mwfFJKcktbWz09WLBK1F7sJw5e+Q04faUYt6OF6xHoQU
	7IXgJzEuwOdgr9bHT8F+mG2rJ3aU/zyY/hxm9AIzbF4prqeB9okWfFIZh3FKDA==
X-Gm-Gg: ASbGncvjWY0F6exjslYOnbgV9oEG1AWzWgR6CJcComp8qgnY/bcAHqGV8Uk7eYFk41d
	QJJVpnKEMVlLVtYZBJnBSMcs5NSGQx9ylbwh+5jjLPlZIldBkQB/Oqmx6I0MBHIt3E4CFj0o/d2
	zPntZhR7Lc4R5nmr0KAyEzNngpwnKb2ovZX6bUmJoilj6DTiiIpGQJlGR51TBJrVYz5/ZR9QV21
	D54Y0IpffN54JqrA8yxOXAvVByeqahLGfPvgQEKztsEVZkCxolXj6Dst+Gmyz+sj3bLKZybe60x
	+EXbdISOt3y9yhsMBcOHBVyDMRXs4PTAHDBpGSx495LIPRtKqA/ABCrZfQtOTuVK/8pRrMga
X-Google-Smtp-Source: AGHT+IH6piFbPZPJtlfgLIuHdj3oSeyNguwt8iF17ao/opI6U18w7y2m7t4fquT0Dch2XSA/jTVSww==
X-Received: by 2002:a17:903:41d1:b0:21f:2ded:bfc5 with SMTP id d9443c01a7336-22df4076324mr1004945ad.28.1745964363012;
        Tue, 29 Apr 2025 15:06:03 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100aa7sm107720575ad.161.2025.04.29.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:06:02 -0700 (PDT)
Date: Tue, 29 Apr 2025 22:05:52 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 19/22] iommu/tegra241-cmdqv: Simplify deinit flow in
 tegra241_cmdqv_remove_vintf()
Message-ID: <aBFNQFVbxyr596gB@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7c180fb751def39cbc8634b08b65c3f26ad73833.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c180fb751def39cbc8634b08b65c3f26ad73833.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_150604_462955_2102D3EC 
X-CRM114-Status: GOOD (  19.84  )
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

On Fri, Apr 25, 2025 at 10:58:14PM -0700, Nicolin Chen wrote:
> The current flow of tegra241_cmdqv_remove_vintf() is:
>  1. For each LVCMDQ, tegra241_vintf_remove_lvcmdq():
>     a. Disable the LVCMDQ HW
>     b. Release the LVCMDQ SW resource
>  2. For current VINTF, tegra241_vintf_hw_deinit():
>     c. Disable all LVCMDQ HWs
>     d. Disable VINTF HW
> 
> Obviously, the step 1.a and the step 2.c are redundant.
> 
> Since tegra241_vintf_hw_deinit() disables all of its LVCMDQ HWs, it could
> simplify the flow in tegra241_cmdqv_remove_vintf() by calling that first:
>  1. For current VINTF, tegra241_vintf_hw_deinit():
>     a. Disable all LVCMDQ HWs
>     b. Disable VINTF HW
>  2. Release all LVCMDQ SW resources
> 
> Drop tegra241_vintf_remove_lvcmdq(), and move tegra241_vintf_free_lvcmdq()
> as the new step 2.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index ba029f7d24ce..8d418c131b1b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -628,24 +628,17 @@ static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
>  
>  /* Remove Helpers */
>  
> -static void tegra241_vintf_remove_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
> -{
> -	tegra241_vcmdq_hw_deinit(vintf->lvcmdqs[lidx]);
> -	tegra241_vintf_free_lvcmdq(vintf, lidx);
> -}
> -
>  static void tegra241_cmdqv_remove_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
>  {
>  	struct tegra241_vintf *vintf = cmdqv->vintfs[idx];
>  	u16 lidx;
>  
> +	tegra241_vintf_hw_deinit(vintf);
> +
>  	/* Remove LVCMDQ resources */
>  	for (lidx = 0; lidx < vintf->cmdqv->num_lvcmdqs_per_vintf; lidx++)
>  		if (vintf->lvcmdqs[lidx])
> -			tegra241_vintf_remove_lvcmdq(vintf, lidx);
> -
> -	/* Remove VINTF resources */
> -	tegra241_vintf_hw_deinit(vintf);
> +			tegra241_vintf_free_lvcmdq(vintf, lidx);
>  
>  	dev_dbg(cmdqv->dev, "VINTF%u: deallocated\n", vintf->idx);
>  	tegra241_cmdqv_deinit_vintf(cmdqv, idx);

I don't have access to a HW spec to verify HW behaviour, but the changes
make sense to me.

Acked-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

