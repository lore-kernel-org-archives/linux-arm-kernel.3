Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF9FC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+7yTuFOYw/+OFN7i63Es/kgRcKQFjeHwd4HaCwCrWY=; b=ZpMa8kih4NqAskriM+ENpDZFqh
	dL3fa+hcLgWV1uwj+0YrG1jXoGs6sjoZ02Ht2of4Qlg93nUP9b6iPi2IBdWnaG2/GjaHxYiITw4tS
	whNgR5cxABObnjqyzBy/71jemMe4xvi5+DJ5uAJsYjc0E3QqdtGNYzMGxbAyAdc7oWc8VtUANTjFH
	foRI8OO5aYYlzTWMJQhSOLeq6a25AK8NnYrxKknF+I1vUM6WF+326pjr0dsZVoGnC7U+s6MMCQhzT
	hI9oGK4OT9vBR6u4IC3F1bEDb+p4t9j+qiJFOoP9G+snmwBzfrvmViODdN24KydPEmdADCGpL4mJp
	FFGFm1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHol-00000005dTn-1pWd;
	Mon, 16 Jun 2025 21:56:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHfr-00000005bnh-2Vtx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:47:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2348ac8e0b4so26645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750110447; x=1750715247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+7yTuFOYw/+OFN7i63Es/kgRcKQFjeHwd4HaCwCrWY=;
        b=viVdZ6MVEiwD9MDbQV0NWUZMqu3YFgAMGiKf9e3UuDaqpMlA9Q1wBwGCMRLoZO0VoY
         baM5bs/fP68p7celjJ0VPcgXiRIjv6rdgejZJjUhELw1/R9M5iLipOnit6V9BncB8X5A
         jNBVI+nZEN3kWROuYWxPDj3UHU8cq8sdaQoD92XI5ZfDuVAV4AjZLevtttF36qAYuu2v
         LOYmhgBaX/AkAtscgc0eKgXyMoJJg7uz/FNqw5kPWEfuy/4xUw7VLP6CN5LZHQ1l4To3
         xSgMcPkRV2TCIRPVwNy8YTOn2FvXp4CfAI7yFWDDWtZKmws8zyV0MHHTmbJWKmaXdz/O
         Z4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750110447; x=1750715247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+7yTuFOYw/+OFN7i63Es/kgRcKQFjeHwd4HaCwCrWY=;
        b=AzE25cTdvpMBH0emK9zw/Zyj6P/Z4VX98NGyAIs82ADZ8okNdoMjYgpIo80AklIv6O
         24ENFy2+oKhZAi/3M/n/qHWlsWkNePeGmpLpmk0blRrAmeTgGWJk1UTqnJ3tHukwamWt
         kGIYeazj1Jz40GX9UveqiB38HEWSf3YKs8XoVbFw/9J6aHUjyu6xywMUmDsVwWafyF4g
         DZbcHaquVbjCzPbmaa/w6+m/5BNDtRId24NWBF/sZg4iJ+fdSi1EHK3AHZTPIm2kTFoT
         LIY5qRWPM1HQPDDzrHQ9rzN8coXjFw24AlW+Am7piOWzMBtlMnKc3asVG2m4enCa9Ig8
         pwVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPojnnalbuBxJcz06rcQvSEroozu+hVoSUShc2ymNelahEy+3LtIwo4jNTaDrAhiK4x/i2HENv2Z3bS6snQ4vw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/WUOAQemqwgZlX/bZz2U1OndT2XqoU+jypUHk4gWsqZVBYOcR
	IcmmznN27CBqgAxpuN2CtHaIyENJeHdhtCv9L4HKVAI9cZEkodUpx2vBkfgpuPKpwQ==
X-Gm-Gg: ASbGncsMG10vHQZ6JDfX5AfEOpeG8KiHDGmJjSfXav/r2Of57i1b4a8msMyJtXdmEym
	rJB9gqwPZsMxdvngV4NTP+dnV5C2xK0WNGQqNaIlfhR7gktGhiBtk813xmC4HtE8MEu6fTXcaJo
	OFo2/5WeDdmEM7JzK+QJWCLdYdWOljYVQ7gcSuwzWn7F99t9EYjQ0AwPFisGApRGdZnIxzaEqbJ
	gqpInpsMK1lFFpWLd2TezzlC8+ftgPfnaNGDRdYD/z27ssiEqa2lH0652oFvJpvrXC2qvi+c4hb
	27KZbUu3vtPjp4kdKP6jRX/XiE9kJs/4SyCgx9UZoEcn7gSst4NJpL1lpsc83zYU9usK4d1d6S1
	YVE5kZcDlzHOTDJleIyNriiUrjzqEleI=
X-Google-Smtp-Source: AGHT+IHag3rw8aX4ZKoeizjYKIh5qE5BVC5WmHX9g+TIQMgoMav4KZZJKeYmD/v1LvZQLFwcJimtlg==
X-Received: by 2002:a17:903:1a27:b0:234:bf4:98ba with SMTP id d9443c01a7336-2366c5bf768mr6069465ad.6.1750110446641;
        Mon, 16 Jun 2025 14:47:26 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c1esm6263160a12.48.2025.06.16.14.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:47:26 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:47:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 04/14] iommufd: Use enum iommu_veventq_type for type
 in struct iommufd_veventq
Message-ID: <aFCQ5fAn4FYXUr0G@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <208a260c100a00667d3799feaad1260745f96c6b.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <208a260c100a00667d3799feaad1260745f96c6b.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_144727_634068_BE96272D 
X-CRM114-Status: GOOD (  17.05  )
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

On Fri, Jun 13, 2025 at 11:35:16PM -0700, Nicolin Chen wrote:
> Replace unsigned init, to make it clear. No functional changes.

Nit: s/init/int

> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4619285c09b7..32f0631368e1 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -526,7 +526,7 @@ struct iommufd_veventq {
>  	struct list_head node; /* for iommufd_viommu::veventqs */
>  	struct iommufd_vevent lost_events_header;
>  
> -	unsigned int type;
> +	enum iommu_veventq_type type;
>  	unsigned int depth;
>  
>  	/* Use common.lock for protection */
> @@ -581,7 +581,8 @@ iommufd_get_viommu(struct iommufd_ucmd *ucmd, u32 id)
>  }
>  
>  static inline struct iommufd_veventq *
> -iommufd_viommu_find_veventq(struct iommufd_viommu *viommu, u32 type)
> +iommufd_viommu_find_veventq(struct iommufd_viommu *viommu,
> +			    enum iommu_veventq_type type)
>  {
>  	struct iommufd_veventq *veventq, *next;
>  
> -- 
> 2.43.0
> 

