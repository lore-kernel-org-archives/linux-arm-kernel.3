Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CBFC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE9XS5x/IPLFg7Q0+oI241GEqid5njht4Vd0VCx+/2E=; b=rzWD6bmSioD0zr3+zav/+nVYHv
	AahCO5asV28KduCEmpVLToYPPoo6S5YAllV+NCRtmGe1po5xnrjTfe3zhqVEa0dYh8xRanYrpplRk
	80Tz8t4SnKefkuzQocGfIp5UlJL3DsJeE9ySns8fmMCzuuctWjyO3AITZB3pcTX/XdXc4QKKpS2/a
	1OJ8gBoSCAHkjoj0Q91dBFncEXkJQ6DHCw5Wi/fJL9ziqxc9lfbkTMD2otx4XeKdIR5YGIas7C3wq
	rLRjUf9IAVxZl8CusTX70JbcIg0dRdrUen4tvK639XOZlqpRbcyJ4LraUsuU8G0ByqBhHie07Il9w
	jWZnko0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh84E-00000001lwd-3TyA;
	Wed, 30 Jul 2025 14:46:06 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh819-00000001lQt-30pb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:42:57 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-707453b0306so34482956d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753886574; x=1754491374; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yE9XS5x/IPLFg7Q0+oI241GEqid5njht4Vd0VCx+/2E=;
        b=iYvQXIVYIH99eBCXgZC4btZJQJ0TUMrFh0zuo7FSIoh5Dv60sX6ZXvc1wE8iOb6zo9
         yzW+uDyQxeOVJaOg6X58iVUReqOj7QLNOP36DJKpyxhcvcHn7lscWMv4B/UEGe9ye470
         +rTUB62+Mhyj6S0hRYt8emvPciKgDVbrr+N+2otTO4iDj2SJ29GyvzkAYci44tw/rYVa
         cb/FCQ+zGHWLYZFzlTOj6dwisLRX8G/F+DlQyZANWjKDDAixEKODwl2j33aXgYTuEuLY
         HhtcGEfEFp51eG4dvsHG48SDXVxRBgCRNeMGZn79fWVt1nhE01d1a9QR+Kx9zkMW5AZz
         l3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886574; x=1754491374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE9XS5x/IPLFg7Q0+oI241GEqid5njht4Vd0VCx+/2E=;
        b=r0ymdgCVrk8XNCYTFkZmVYoOS2XGKtgLoQF3mleE/0XkKJYV6jDdCwJ7Hx9Gw7mzwo
         GZfABQSpR+rXXnVsUVyMk7cAedU/Ytw1lF41ij/Ss+rkUkzBYgT/8upLXoq6JMXqJY9T
         iLgqkO3BVmJurLB4ha5/tvLNGbjMW9/ARM0U/KBgZl2y0p9ZfLsjcTEG6tRTiR5rMU85
         I+fRdv/6coFqzouvnQYjvcX1Y4QXnYTiSJJPhOsBoJAudK57SJ/JRkIt6LhP+SpqCq7Z
         ZneS+pjkbVzTU3lQCiw4OpHZIC/l5H+6pnuSIcOzgFv7k9crJUKCLUmFU0Z+Ofm54xZY
         eRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsZFCQx6XokYxYSnj3cQ8LmHKBOM/X+jZ9C+NtHSHGu4UxDXXITEaXhGn/XwhM5EJLPGcjO/sM2nEq9Ht14ua3@lists.infradead.org
X-Gm-Message-State: AOJu0YxO1Zy1ZLj9IFBKrFVHwFPzkWRACH+fTgkpaQOrq3QSt2gze7Li
	F2jB+aJNwtJiXaM7TEOWRBY37YS6uU12xToPlkmsofRSK+WVFJROpMfd3gU6ENlzWRo=
X-Gm-Gg: ASbGncsM0gBQQuGxCsAdCCS84cR7NKGrLB82Aq7BuY5fZx8lPX5pZJEWajscgKmcpHe
	U3AVvdS8Tpxzd/4GpDPSQxBMgQ3T3x6ERNJ8EFp6gwVgudG7+DE1q2xe4L6uGUV+LkeT4o0KNNt
	l5CT/GlmKoI+ofaCh2VgTU2wwgKdSMopuD1BcPO62MQoDAq2jkLwTR7gT8vp5kFyY017EL/zqqC
	HfBxwXNqHJvtjd1kxPPloQAVrw0FVCC4LI7z1qwXDBbZelS/ko9ztoSRyWAma26X1GAObN86ml2
	Lg9kptGTz0H0gMi/Af+9DJOkLJWFGSocVcj1JXnViAMmmn67yuM6KqVpFPEoIQ5bOIWnr/zYiog
	noseNHbS2yehmH/OTWF/gaPLwi/PWmsCJWMg0tykMoaKZclBRVSUrYZoAJQfsesgT+9wjwvjbFb
	IlBKA=
X-Google-Smtp-Source: AGHT+IFTshf+JMDcrv8+0/UalWTBjWGXz7BdMW99vihoM+QJWNKuspc/O9f/fXBj039JGJi+af7NVQ==
X-Received: by 2002:a05:6214:ac7:b0:707:4daf:631 with SMTP id 6a1803df08f44-7076719b73dmr50415456d6.42.1753886574527;
        Wed, 30 Jul 2025 07:42:54 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7074b52ddc7sm39845896d6.77.2025.07.30.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 07:42:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uh817-00000000RlW-0qIU;
	Wed, 30 Jul 2025 11:42:53 -0300
Date: Wed, 30 Jul 2025 11:42:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250730144253.GM26511@ziepe.ca>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728175316.3706196-30-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_074255_754158_7F2F45C7 
X-CRM114-Status: GOOD (  14.88  )
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

On Mon, Jul 28, 2025 at 05:53:16PM +0000, Mostafa Saleh wrote:
> Register the SMMUv3 through IOMMU ops, that only support identity
> domains. This allows the driver to know which device are currently used
> to properly enable/disable then.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 92 ++++++++++++++++++-
>  1 file changed, 91 insertions(+), 1 deletion(-)

Can you split the new iommu subysstem driver out please? I think I
asked this before.

This series is big, reviewing a new iommu driver should be done separately.

Please review all the comments for the verisilicon driver, I think
many of the remarks apply here too:

 - Domain attachment looks questionable. Please do not have
   attach/detach language at all in the hypervisor facing API.
 - Get the ordering and APIs right so replace works. You need this to support RMRs
 - Use a blocking domain not some unclear detatch idea
 - Use a blocking domain for release
 - Use the smmu-v3 approach for the fwspec, don't store things in the drvdata.

Jason

