Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84FAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow2RHMrMzwGJ2rXgPNnaGC6CmMDEd/EhLg2+AS/qQa0=; b=W8C+WJpPrMjXb9ggNJGvmkVUO0
	nFdySp1laoxcVbTboeQYuNjGiQnfAmvE+UWtSf1zldObvfpYaZhTaG+44SojmNirxtUMS2Ld+YNOj
	cmNex+dc/XtErNQRRcEBEvledZKjz9njUvM033OFWWgrN3rNj2UxJJ+2xYWhTGo6CbRwAu7BQ/ruc
	TRSdfFiT1dTxUMxVJs97b3nWJ8dm3bwFrGAulybqOskwGbnliTnWJL/Qix4Ovt1dAHpcaCgBaNeLT
	N2S3/WuS6nlNUeT/4Wo54Y8f789QXBDWd8wWBfkouSbOitOstz3GyzZm19j0B0Dk3DyG28C/wiSjq
	8SIrSWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvfa-00000009GW0-0HXO;
	Wed, 05 Mar 2025 20:48:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptVH-00000008w3l-1bkj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ow2RHMrMzwGJ2rXgPNnaGC6CmMDEd/EhLg2+AS/qQa0=; b=W/9NsJWOO4ojC2oigefwig7C5n
	+GalY/VBy47m/7hum4cY1yX3alney53jn2YLBS23Tt8iS/QrX/ESczF1v2QSHZgQX+YLIk5H5SCJB
	rbb4mExkt2+47UQJzQh4uUXxh4YizhIpn7MvzkMO4HUbOuQLyC8whDzBJOQjXT58C7qI4ct4YHqV/
	lvGwCKtb9fSLwAfwv8HISSU/FwWjiyuiYVI/vG2MO4xsyaCq4V1Zft5cQA1Yt3T9xvBe1Wg7mWiRa
	WCXG9sr2ehEqktBszvCUJPALohfdSruyEOFZCyo8O/CR2nCN4p6e59v6HCtABLWTKr2KD9SBCBROd
	t/n1LOww==;
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptVE-00000000gft-1iCD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:29:58 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6e894b81678so35884066d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1741199393; x=1741804193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ow2RHMrMzwGJ2rXgPNnaGC6CmMDEd/EhLg2+AS/qQa0=;
        b=EO+IuI7XfjTMgl5Gm0g+HEJs5sS+gisRk01FY1JXprVvSzoXOB6L0KMxJZH0NoCUJA
         Gbr2S+cH/rPQfowGg6a476Vr8Vo6XEMyHNDqePMakfRsoFSgezff2gwQ+RIrlvwHN1DR
         PWF4rVwgYvaWrmA1grHJz3YDVjWSxDWxo64HHkCmn1fnDgSpq9f2r/qLFDXnq5jeQscT
         pyfPnBbHoD6wqce8r7cLrQOnr0xblIRDliH6TnvgAsdeeCkiELIj+ln3ULt3TSDgKR2Z
         JACzBGkeQw7iSozmbw6A0mhN92xcbB38ehciVQ63WtH9wA/lrkESqZIoC5L6yxpHheq+
         v4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199393; x=1741804193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow2RHMrMzwGJ2rXgPNnaGC6CmMDEd/EhLg2+AS/qQa0=;
        b=hE9hJAEgPGBXW/FpFyDZgdcZ+e9ktWGe2GnmB9dLR3SeXFWLPKkltSIH/l+ozAAF7c
         Yp4KMxM2peeGN4iyHKOL4SGni6xBtVkaDkfoQOgxK4yPKt+rxH77w5hpB6Td2qzzW/7t
         L1Daclyu7qvwlt2RIR42/kwtLnp4Bdw3/LkKvnamW4a+bnwflCIEH5o4oWiqaUtRK46p
         O6XeeIs2zvqbUfBZ2BaQFVl1P2v0HUzAXm3NotniDpTnSdkc8oLdzAHomIzhTmh6Ufan
         fD7mVHJxqTxrnJmU36Rg8QmoVcXfVi+xRBTGzCNMoBdJmKocLaM/Tf5+otcUGcnGq+MZ
         8MNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtcT5rBGFf4uKiU1YuONJN1a62X3FkvPjiJT3j/v0AeUu2gLCaYd0QryaHTHiUrT5ISUoHxWcZnmKhg8egEqz/@lists.infradead.org
X-Gm-Message-State: AOJu0YyJDdaYazCNsCzv0T3vKctemE3DA4ank3qj8I5tMv57vafdOTjB
	Uqky8QLpVDb/9mlD+LvhWVZ30Y+SiKKuinmXmkChrve0kHuF4E4QaKitkNwQ+sE=
X-Gm-Gg: ASbGncu7xonByct4pNFw8kcawlWdHvpywaih9gkUrqT7g7sWEtdO8Ksk8nm8MuDr8sp
	bBGQdJqBB5oU820NEO5FN6SItU7PuOmJ5g6ikCfOmeN/n7yE2iZ/YWeyamCd1ldP1vL2QMNPCuW
	+NMBe3eB8N9xZHYuLhCo4pN2qOaCWBw/E/2VF7YkNSrn4DYFRNCF9iDz83kibh0yXpj/Sww5bFQ
	BkmID26tyslHaWkf+VHWHHkQC5xSh6xYogqWWtqquMvMPeP1uFCPwHugD6P6z7ySeisjHLBhp1I
	8wPslZZctZn/mSg5+Kc=
X-Google-Smtp-Source: AGHT+IFsnlL54iYEsLAYoSSta5icqiZzmyiU2KUod6Ytom4/BEVwRNDkxuBHJRsDyr8KcDtnyCu60w==
X-Received: by 2002:a05:6214:21ac:b0:6e8:9e9c:d212 with SMTP id 6a1803df08f44-6e8e6c1cd7dmr50312666d6.0.1741199393252;
        Wed, 05 Mar 2025 10:29:53 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3b2fb20f0sm505715585a.107.2025.03.05.10.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:29:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tptV9-00000001UC7-35PY;
	Wed, 05 Mar 2025 14:29:51 -0400
Date: Wed, 5 Mar 2025 14:29:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com
Subject: Re: [PATCH] iommu: Unexport iommu_fwspec_free()
Message-ID: <20250305182951.GL5011@ziepe.ca>
References: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36e245489361de2d13db22a510fa5c79e7126278.1740667667.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_182956_538635_68954DB1 
X-CRM114-Status: GOOD (  16.55  )
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

On Thu, Feb 27, 2025 at 02:47:47PM +0000, Robin Murphy wrote:
> The drivers doing their own fwspec parsing have no need to call
> iommu_fwspec_free() since fwspecs were moved into dev_iommu, as
> returning an error from .probe_device will tear down the whole lot
> anyway. Move it into the private interface now that it only serves
> for of_iommu to clean up in an error case.
> 
> I have no idea what mtk_v1 was doing in effectively guaranteeing
> a NULL fwspec would be dereferenced if no "iommus" DT property was
> found, so add a check for that to at least make the code look sane.

> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c |  1 -
>  drivers/iommu/iommu-priv.h            |  2 ++
>  drivers/iommu/iommu.c                 |  1 -
>  drivers/iommu/mtk_iommu_v1.c          | 14 ++++----------
>  drivers/iommu/tegra-smmu.c            |  1 -
>  include/linux/iommu.h                 |  5 -----
>  6 files changed, 6 insertions(+), 18 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

