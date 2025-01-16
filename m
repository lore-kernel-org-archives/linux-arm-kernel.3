Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0B7C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 19:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bChrpxoXYLOi2YUup3iemrrMhFmpTodAygOPpJhId9Y=; b=2jauBMRkjRVRL6toq5pTZX7hJN
	K1hHbsKrjJYG2Fc9FIfJscC4ZfpUVmHF3aw32K2p2EcI2kQyf3qwuF92lrDAYq7uevCZopENNFJE7
	TOU43lM7H8qQhbpsEaxuWKw4R+Ph10O1tUTrHq08FUhyx9xP5fohKweGNbaFuu7cecXIIZ/7fFIdr
	Mb/pIdSpOI+4eCmAaP8PrGEeMPpCbkFQAd1iHx2pZLuVfPpnOA5+TopMgveUuA3KD4qCyJWl1SbcQ
	AHv2Z2+U2Ce4zDNZfQlXjIjMV3/qb+rS1LsS/ud2p4FrmQT3QWyOXpI4BTi0PN24DVJrBIvnwsFjl
	Uc9QbhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVQW-0000000FsaT-3qPq;
	Thu, 16 Jan 2025 19:21:12 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYVPG-0000000FsTJ-1Cn1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 19:19:55 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7b6f0afda3fso138713985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 11:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737055193; x=1737659993; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bChrpxoXYLOi2YUup3iemrrMhFmpTodAygOPpJhId9Y=;
        b=dPwy8Za8iTxtNBSj5vEmfx2p8+pKRZCYewA/15ujoz1dXt0y19O9GqMbNHdX1n2RrR
         LjVd0Ru1XAhYSLf5Yx0hKnJ0sIg2zZUFtw7T6RB2WjIXrNdPCAouJIjF2MEVKjMvIOoa
         2vnirafInEBaEv63OWvjrft8uGI/Gv6anwTD+Q8k95eFE75bvl+HWeW99E1vqJPKUqlV
         QsKMDgmzk0N76agrBRx5jX+H/8sjPro4Zd5McXlRcTLKArnf5Xs7YTwtXunT1lyj/gTW
         Ohqg4aCunEH8cW2L4AxqCFT9P5T7nW9BXTQoVbud/JzhcTSSNEl8erQJI2edq74gYFOs
         Riug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737055193; x=1737659993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bChrpxoXYLOi2YUup3iemrrMhFmpTodAygOPpJhId9Y=;
        b=hgPsEc/Fh0gvk4yGRIOMzBgYFTs/3TXV8Aeh5hW/3IbkhQFgCcnpNkKbzYESzdGfcr
         Tb3VNIqPT+e4rg/E8K10Y0zyfGKKtpYg2ua3mkzangt1YC2aKbt2kmVAJMxBAqE/KNcY
         KPXEVt5XKqi4vcRh5oz4jPzyJpDmycmo+k0ePHlMnPOjuS4rGQ+/JlWmzavH+64oWLG0
         5J3luxIwZl6V0T1asICJYmT/FJvhborzEfwrV3k16km3Vop7BURenTKfWLJB8GxnpcRu
         H/9jgXXmrQ+WZwB+vbRtxbnoMTYDr8TI5akxxn5BBqnQYwmQ4Xy0n/BoTqeUHRlPuu4d
         QG2g==
X-Forwarded-Encrypted: i=1; AJvYcCULmEM1oWITjGv/5z8V1oQ7eJnkKirODQvrIBQlRoXwdrdLHBrv+uccVQBtpTwCMViOzd1wcRp7D4PWJB/8QR0w@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2xMRZXHJUDq6XcirZYs6OKq2qDBSeDNrIVUp/oc69Q8ZRZRAQ
	fMW09pxocFjPj2g92q/p59vIL+bLSg1nPEVsQ6aoNojsQgl+yO7C7euSr1iW4AQ=
X-Gm-Gg: ASbGncts2Fz3V1VcuednWpc1kAENsYFgrysMO+qhqk7kEAZFUrlgPGBf8XkekMKyrSx
	dKZwVOhaNanLvu8S8exHAVblTxTLZNZ3SdcUhXNhG2f95HyygL37hgn3+Ii3iTeB9JTq/q9gt6/
	tirtwy0D44HIIJPlVcU2TO4KkQME4qRfSAHMyqM4Xx+SUve4fNpgCl1zCtldtFzuCILoYVoyY5n
	2Y/6TU3C9pQd/U/6LnDtBq99Nrc2XHXzTViO9i5eFQuvyOnkk/3wpg/8vDPfbCEKVEa/aJ7YK80
	XSj8+AWY+fNc+RcSaxgKXPG1WmZGjw==
X-Google-Smtp-Source: AGHT+IGTm4bFEwhL8GqLcY8z3nt0mSjwsh1Z+7KfLW6eIDlz0sFoLhtw28pz+YDUvgq5sFx2TdqJnA==
X-Received: by 2002:a05:620a:2a13:b0:7b6:d8aa:7ef9 with SMTP id af79cd13be357-7be6320c0f9mr4896085a.32.1737055193220;
        Thu, 16 Jan 2025 11:19:53 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147f2e7sm33743585a.32.2025.01.16.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 11:19:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tYVPE-00000002xf3-0us0;
	Thu, 16 Jan 2025 15:19:52 -0400
Date: Thu, 16 Jan 2025 15:19:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <20250116191952.GD674319@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z35rEeSVwfZVA9IF@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_111954_321561_A855ECDC 
X-CRM114-Status: GOOD (  11.93  )
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

On Wed, Jan 08, 2025 at 12:09:53PM +0000, Mostafa Saleh wrote:

> I am open to gradually upstream this as you mentioned where as a first
> step pKVM would establish DMA isolation without translation for host,
> that should be enough to have functional pKVM and run protected workloads.

Personally I hate these giant patch series, you should strip it down
to small meaningful steps and try to stay below 20 per series.

I think getting pkvm to own the SMMU HW is a great first step that
everything else can build on

> But although that might be usable on some systems, I don’t think that’s
> practical in the long term as it limits the amount of HW that can run pKVM.

I suspect you will end up doing everything. Old HW needs paravirt, new
HW will want nesting and its performance. Users other than mobile will
come. If we were to use pKVM on server workloads we need nesting for
performance.

Jason

