Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF797CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhPDshriKOHBVRsVBlLjs1r/ABM7AzaFK2EEc21Hio4=; b=QizFsXXlVf2GAGxq1HJjePHZ9m
	wdcpBKi2dN7RM/BrS/jLsoobETVAO8HxZlsUM3YLOrMnKuHaRC9lGXnf08rjerH9UZaingG6mscr2
	v9745/fEkpa5URZVcyh5NihKBJIcOR/fd+XRNKylKD0UzHl5YoBQy4ZNzGB+AO7EGSSWVsNihUAPJ
	xJJ+NJcODxk3EihenjfdootrCKWkDG7Ivw8D1Er3NWU0bQuNonjWY3fChaLOXXLLkmW35x2fDTc43
	/xSsW76d7pKfCtDx5E2x3KmDpPerqFumnJaoUPUBpexc36ie1dzTHPYZ3rphdFWjlNgHzq64bTHRQ
	zC8m2pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRTC-0000000Dt8B-19Gs;
	Mon, 11 May 2026 14:18:54 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRT9-0000000Dt7b-3EeX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:18:53 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8b4298d271fso76269786d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778509130; x=1779113930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhPDshriKOHBVRsVBlLjs1r/ABM7AzaFK2EEc21Hio4=;
        b=Oe/1GDtWTLOw6wsHUMsgydCeM03srjNzCHNOasS0odOTgbgHYDZJmU48EB9m8Vt1xc
         TVYFxZsamVYHlqmfSKcIttmyyOyi3juTK915X89p1ZioMKCAqcvCm6GqE87LtYKvZQM7
         IU81A20HH5JFyhorE8P+hAZHfqohK+a9FGEEbXlS8oE8Ua4BhqS2fP8uAYCg5+q7S/3b
         M5uz4OaHGeAkT91jxYqhPvah8Oi9E1obQ6wveetbyBhQhj9WqJeQ/MwQg0ekruPr++LI
         1KWVEWTa+ZM4+Cp9YmC6Sh5bjDlupj7UYzztc04PFrTrPtoIuiWwr9/7AtmB3XmwDlBt
         lw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509130; x=1779113930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhPDshriKOHBVRsVBlLjs1r/ABM7AzaFK2EEc21Hio4=;
        b=fK/B1j/wUH30a2rjaBilv4YiQWxL4FuFsPcMRqt+4CPfY7HL6VI98s/0iD0jd7ZdQc
         R2JPFgSovFliGGbMCLQsv2kDcJqhTmupqH/SwdIoiRgJr/c3Sni7LKJT3mTPKF+a5BiN
         nSNnvPO4Ge5p+2Y0HP4imn9VTifoq29a7fx5p4wuRvl5+ZeFEXAtmKGnUoPAPskMu/Ye
         UOo/BN+nYAC4vUlDQQIeNeUw5hKlaZgH1fkD4U1gAk1jyqxgTvi5nHwLAVWV9L2sFRyu
         Rlq0X2RXE38JSpU2T9po2U0i3fb68f19GHYbDw1AqCUVJH4Y4v81p3TR4d4SH0M7NeSB
         RWWw==
X-Gm-Message-State: AOJu0YwZ7y/lpWHSgaM9D0IDCxawjQQzw5RXMo/VzMul5XvaHfuPpb/j
	1ZjgMKdHl9lVFiOXHLfZeDq6WV6FIvsDkrF+DP0olf7wyRUG+n2Ng7xzo2kenS3l/3o=
X-Gm-Gg: Acq92OHXCpWHMjLi3MxWJoljxnhbJBLfzGmI9COUBpvYX1PPqrqDlJew9kfJd/hciz/
	0T1ByMPxqf6ZGkyEhlV4MoAHmBacn3yHDeYAmxs2YslQhE7FpqBNDHKsGokiM0xPzBKqnJUYyA8
	qf4xtUv57Iw67eFHHLlBwuGTCbQYhcIHDiiFtxxbz+JC64aOXEjn72v9fwWc+5zOZVOfaFpGcbt
	5BBfd99WbWQgpJr6VTG+xICpMgKJ6mSaH1a0moQos5DTa66cAl5Gs0/h7Os++kNbjypFX8MHZNM
	VbsjzA+B+LSbMe2eD2hMkxbU74wwCRBQYHcQRj8s1e3Sne3f8FUAAFfC8K6191j0NGqA8CYXcPR
	3N56mAXG3rbuPLXQ1suzcYAOmXd5+bIKip4dp0FeMBRyvEIEmupMi3/FOHGe8FSSvTmDx1pufZo
	I7inTQsd3a4FPrQXSztMWQ8yW6eiiLP6OxlLe+YWNBA7JBhCesaWYKAbvQ1aeFahcSsqmCs10uQ
	vcMJ1lZT5Zmue2zljKBpNvKf7k=
X-Received: by 2002:a05:6214:4982:b0:8c0:1d4:4171 with SMTP id 6a1803df08f44-8c001d4430cmr177173846d6.19.1778509130231;
        Mon, 11 May 2026 07:18:50 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a71be9csm97495666d6.17.2026.05.11.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:18:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMRT7-00000004oCe-06zM;
	Mon, 11 May 2026 11:18:49 -0300
Date: Mon, 11 May 2026 11:18:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 06/25] iommu/io-pgtable-arm: Rework to use the
 iommu-pages API
Message-ID: <20260511141849.GO9285@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-7-smostafa@google.com>
 <20260501122424.GA6912@ziepe.ca>
 <afiO2WL4ILGfmUui@google.com>
 <20260509232155.GH9285@ziepe.ca>
 <agG6n4CeuIMD57G1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agG6n4CeuIMD57G1@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_071851_813992_2A7E92BF 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, May 11, 2026 at 11:16:47AM +0000, Mostafa Saleh wrote:
> > IDK, why? virt_to_phys() is part of the iommu-pages API, I'd just
> > leave it.. If you want to narrow it then #define it for pkvm when
> > compiling this file..
> 
> It is not going to be part of the iommu-pages API, I meant in
> io-pgtable-arm, we will use something arm_lpae_virt_to_phys()...
> which is then implemented differently for pkvm.

Again why? I think the main goal should be to not mess up the normal
code. 

  #define virt_to_phys pkvm_virt_to_phys

Does that, we should be leaning into this pattern I think, not adding
unnecessary churn...

If anything is needed then it should be an iommu_pages function to
wrapper virt_to_phys() for use by iommu_pages uses but I'd rather
not..

Jason

