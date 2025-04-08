Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A809EC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EvZTf+A2Tig+IRGHQAjPjWtgFVFDb9fydbEYyz2o1UM=; b=vfc7QDrKO5BHQc9S9A8YGIQise
	2JwDPpzqxpyyGqJ19zG0vz5TBLdHV6JIGbukg5+apajopEuylaSbFQLJe0WFNF6rJbuYoErfrusx/
	Ymgf1Q0FE6bi+st57mudxOVrXQSXJxpT9Hc0IfMkLN69yMtQMqqQIZeY0T9deGpd8Ydz5oHydgUiA
	ojRek31F0vNmbqnYydIJAcJJp9RjSDLU17ScHTq2Dk2TsVCbWTGUZ4jKip9VJUEZeO48fLwivD+Hl
	0yaBD9xTYGz3h6NT8hr6SrdXFH7Sq9a4e+MYLAnmkQLEfa1+zoClIgQNC6lofG2ldMB4Qgk/HNYX8
	9DOaCzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vW-00000004NVW-0tbC;
	Tue, 08 Apr 2025 14:27:46 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27lZ-00000003wmm-3V9C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:09:28 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-477296dce76so47793041cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744114160; x=1744718960; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvZTf+A2Tig+IRGHQAjPjWtgFVFDb9fydbEYyz2o1UM=;
        b=Lyz0D9yUC10sMEoga2cy45nNYWxJQBOugW1I5kS9g6aoW6yigZFI/XHGF4UHtOLd8I
         KdBUKNwpuO0ukeBgPj8mo94DJ0JjDYVxpI1wtGvzDJD8iWlytDxrf1GksDNEGCXbMgOd
         feyLoEb3AgLhSJ66PPXHc/O5k4izfXkwtnY04TP4EhtU/aaljAHhSfgZ7AMZWlYYYNuE
         WCg1e3IzSG9uhUOneFbch7FxXYJgXUsFS62j5xwn91SFXG32Ei4tfZ4ADMj+bV8bm+vX
         j11zkSgxSmX7siMsfpjonGv2wqBYvax97ViMDaHD8OXHsaOM3MGDijm8VUFdlLLyYU8S
         I2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114160; x=1744718960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvZTf+A2Tig+IRGHQAjPjWtgFVFDb9fydbEYyz2o1UM=;
        b=uN49hldu+vPxoG9fyl998yLGohI34Zf/1DgqPrGxP8bw9k75LZY5hSbV+BMH+qXXDd
         Oo/B5CTEhZGnNsfamG/yWPLAiU7OiQ+e0ESVtciWhqBICcliWnYhgf7/IpqdAea5j+FV
         BAoYjhIdRZxVejEd1tN9hmwEtw6My/Zmdr16bIYuGpyzU2ssyVKpw9ihSYC2752JV4kC
         bmUoFHDjV1OArNRel/zR3XPdji1bP8yujFo2n4xPbUOCUn6LfNGPu+Wyg/ksBpU/7nCW
         hQP2lW7f7dTk7lV7GCArey8c2qvXHXMJpkGmH8OJm5anr4qU2tlOfaFSadp4GhkALd4g
         rM5A==
X-Forwarded-Encrypted: i=1; AJvYcCXx4EQpdIhL9zV8gUfO7DVzeXHQpMB3vkjZr8EUgqednrTghFrsK1ZkYDnnrOL7rG2Dfwh9lzpxv/L+qB+FxatZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzGRX49Dfar17wTLLQ0M4ibD6vn07VMwYfz3Lk3qGMl2FuZSMCj
	ZD6cRRTO+2FoKX+AXBd6VWohPsFGa7YCfhwVPsT6hVULZpMjUZaZLFrSmaQIoRE=
X-Gm-Gg: ASbGncunqRcOtNugxSf95rSIBTG6c1TayCXqLHwDMkfi3muKVUxnPhjlsC8F8+Ax7B9
	mJFkV7K7kbKV9Ne2ZF9ge8V1ED4bokFgEGJw1R1AozWkPDy8qZlaLEOnpEO/WyoyrbrLVbWTxYn
	WudQJZ/TFBaPj/qVYin3XjqDZhuR5+7xopZMYy7+lLvz7pZtkFZX9MFKb46n8rHIxRnt/uO4Ixz
	L4eiv+Tj39w69q99SExlWaL8dYEcZvuKAn9D8KqTee6NtTfABKbth9dgjPOEOiQOmn61P1ypdi0
	GOPZUZH0yTW4tQqz2qJD86hZhovDhOasQzGZxaX/NOCUXBT0E0YAqIOWsTAfkDVJpsKa4y2ST5Q
	iVFU+Im6BGamIhxMBLc7oF5zxyZjM+NLVtw==
X-Google-Smtp-Source: AGHT+IElwz6ZYvtcmCNJZ23hEjFuxJMkyHm7q2gsXSKL95/zDdGVqmGJmKoKERZUukK8jrmOAgtPdw==
X-Received: by 2002:a05:622a:394:b0:476:77a5:3104 with SMTP id d75a77b69052e-47930f6f3e1mr204130021cf.11.1744114160142;
        Tue, 08 Apr 2025 05:09:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b088544sm77395201cf.45.2025.04.08.05.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:09:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u27lX-00000007fyn-0hJN;
	Tue, 08 Apr 2025 09:09:19 -0300
Date: Tue, 8 Apr 2025 09:09:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, nicolinc@nvidia.com, jsnitsel@redhat.com,
	praan@google.com, kevin.tian@intel.com, ddutile@redhat.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add missing S2FWB feature detection
Message-ID: <20250408120919.GB1727154@ziepe.ca>
References: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_050922_045511_244EC7F6 
X-CRM114-Status: GOOD (  12.96  )
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

On Tue, Apr 08, 2025 at 09:03:51AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Commit 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> introduced S2FWB usage but omitted the corresponding feature detection.
> As a result, vIOMMU allocation fails on FVP in arm_vsmmu_alloc(), due to
> the following check:
> 
> 	if (!arm_smmu_master_canwbs(master) &&
> 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> 		return ERR_PTR(-EOPNOTSUPP);
> 
> This patch adds the missing detection logic to prevent allocation
> failure when S2FWB is supported.
> 
> Fixes: 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This should go to rc

Jason

