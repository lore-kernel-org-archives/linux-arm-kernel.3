Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B5CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7sJIQD9tWQIe4BdjnAe96u8pxDyEGA325KU5uwZDdI=; b=MuMF+UlvwTMOc3nt9Dht/G1V9B
	90y2exMhpIrsDoraFySoVm+CuhvftPSZLjBHoen7z0TQzKfArwOeCuGiGl8pbAcQUs8xV9vEeg/34
	KUdj5jHPAMWQa80DXwVE6JUdvxQGJZuoz7XWHrigiQsZCcBhBrm7kuc078mpGBb5UN7zwl6NPnXBv
	29xKfGPfBRYq8tc0Gnz7ju3od8CK8rg6LwwAa9Hv19y2fTmWm7nFFxmtuEdBenqEN/M7kLmrjdk4h
	yiyzKifYihb36Fhg3yZ01kf5Xlg70+74Yix0y/IjE6ifDC72vRHmRa/+JerMrzZEgEQYAwoDjqXQQ
	wtkT6gUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNszo-00000008V3E-404u;
	Fri, 15 May 2026 13:54:32 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNszm-00000008V2W-2mzC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:54:31 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-91080895355so294552085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778853269; x=1779458069; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7sJIQD9tWQIe4BdjnAe96u8pxDyEGA325KU5uwZDdI=;
        b=VfKiIL1LGDOvfHLhzmMN2DiMFog6XBx8lw+zbp3OrSRqgfunkjgLq9YTknTHfOKzho
         LZI2cpuSxMCCkEck8IDzHdt/jnhT9AHAhDVpQZ1w5jkBv0OwkKvXCdoAgdfO5GtSzwpF
         abHk1tZIRJdRzep+CxxMPEddnIydtLZvbVHS/WCrboG4oI2qQSSYMsBnTfZf8z7C/p9F
         p8k2KiJ0BQjZ97Wq//DQAHwn63VzVQ/yH9/xZy8WU/2CnDiZJGnFpy2m5u9QBjk56DGs
         EeDkGK9uUKPjg8i2hEDCuyO0l0nMhuHYfUuMZn/XQsj3yQj0uCjpOMIciy5H1oJdeTb/
         Q1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778853269; x=1779458069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7sJIQD9tWQIe4BdjnAe96u8pxDyEGA325KU5uwZDdI=;
        b=PMBUUkh2IW4D0BvfVnGqQ1PhHuVyTyK0D9efZZx9qkB9P/VYaHT9RngigCL/oKzM1J
         oFrkdIksCwMJTOFeOx8aHi/geElwSQu8MKQa/7/DhgtYBc14OktWPKAKdGUO8FNK2VbZ
         ga9CyZoYjChkkGS1igr5QMssEQtRgQDViOz62EkANP3tic0AZN8YsMx8OD0KWyfVTqZe
         7Nx1VtrXQ0E2ehxdBLD3VBNwtJTLAEGrG++5/QPJJ1K/8Pk/pSWABFLcwAkH3xTaQM1q
         6+rI6L2IUMozd7sPXUNM9pyV/Wo5E0SJm/lGfET3AVCUGHFQp+B61asqQCHv7QoUKOJD
         MCFA==
X-Forwarded-Encrypted: i=1; AFNElJ84RcYzaqEzj6wPXBg8rGqbnynzTRhCfS4CLcIZnT6kXvheMBGjqP97oHVgpAcLCXLSYpUQU1soP0ogHehj9lod@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9qDMWH4kkX7Em2j2DnD5p6JU5fNSzV8wIDI5mey2UJwxVU69q
	VAV1fIQR1o8OW9OSEdRKXgUKSMqHRCQJMXq5cnCS4oIwFHwElk6ixLCePcq0+xLTngo=
X-Gm-Gg: Acq92OGsIaF+Fsx3GFafe8V7gGEYgNwFO3TdpXABmawDZVqLnigVgcjEHyWcix+XRvS
	FyhQRKH8o6TKF7SiTYtqbg6JJ+HjnuBr4VA2e3r7DfJZH8xMuAID1dtGmeV5tEfXF6ZeO5kS92n
	rAwF/wj/OkkUVSg2mEa+Zew7lwLuNyCEu+4pR/LcK/+c/0S4E2zi0/wS41LAm9kBcDwc93iKM/0
	/M/ybW3pw//EHfVfiJCAgZX+7wylkaWFtD8u5mloBZwI2g1o4cBEhiQK6O4rTN0vBfVA/p5AFvb
	6CqyAeX7qrP68xpS5P13b3uI6LlDhRtKuQnqMgxqJfv9YZ+hRjYa2673HDgNUFKySnUsBu6hD+x
	8VGhNGaCyZ0FXqhn7Y1QoQVvrBODEKvnLkSMBrOEL5bS+XSD8QW+QZ5CArTTFgdExzwYwb2LUI6
	3XJTWVgWhMqNUfp+O6k/Kv/u4/yJrJuV1SugtGycr3JViafjbdC4UFQz5OZG4ZC8TzxzU+gsx3Z
	7tE/+m62udiVygqIl6poKi10Sw=
X-Received: by 2002:a05:620a:7116:b0:8db:7315:706c with SMTP id af79cd13be357-911d0f4a568mr660861285a.59.1778853269479;
        Fri, 15 May 2026 06:54:29 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bae24879sm589818085a.18.2026.05.15.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:54:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNszk-00000007TGH-1wJJ;
	Fri, 15 May 2026 10:54:28 -0300
Date: Fri, 15 May 2026 10:54:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Rework to use the iommu-pages
 API
Message-ID: <20260515135428.GG7702@ziepe.ca>
References: <20260513215203.3852661-1-smostafa@google.com>
 <20260513215203.3852661-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513215203.3852661-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_065430_713625_968DD023 
X-CRM114-Status: GOOD (  14.64  )
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

On Wed, May 13, 2026 at 09:52:02PM +0000, Mostafa Saleh wrote:
> Update the io-pgtable-arm allocator to use the iommu-pages API.
> 
> Replace the DMA API usage from __arm_lpae_alloc_pages() with
> iommu_pages_start_incoherent() and from __arm_lpae_free_pages() with
> iommu_pages_free_incoherent().
> 
> Since the iommu-pages API relies on metadata stored in the struct page
> during iommu_alloc_pages_node_sz(), it cannot be used safely with memory
> allocated via the custom cfg->alloc (which may not be backed by pages).
> So, isolate that logic and keep it as it.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 79 ++++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 23 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

I feel the setup for incoherent walk for panthor is kind of sketchy,
if you select incoherent walk and pass in a random GPU driver struct
device there are alot of assumptions suddenly to know the dma API is
doing the right thing..

Jason

