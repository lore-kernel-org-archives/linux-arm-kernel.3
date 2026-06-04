Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED40CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clkIHT02uZl46rCjOXn4DL3sKNX9XCKfChcmoui9JdM=; b=jN1gFzcRGR6Al6zNCsLvFQ0aed
	UuiY5Tf4SydEtlSn5XUEY+vOWUIUJYRTU39EA4hNqp9AyfZYfByWmmsW6/lkRq3u4VZQ2RwYWW7/D
	X7wbkZWt4GW4i5B2qKsU3Emo3TDYkhs+JmqUvc2anc5a7WY5d9R26NnYVPu87DaKbtvZJZMR6jX45
	VJMtDZDpoF2i7dFce1QquHRUwbX+BYAzPLZTGPSKsle4FzaOdMBy4uOWtGu8WrcbEj68yABRSon7m
	kAy8KTeCvQXkqzm2j2Fq+qz3vrRyJsK+L/aoQ+pTwjT2Ye6LGrpVKnNyfuAbbeAtPu4Jw9LdtYJJU
	n3bi418g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV91O-0000000GtPL-0fH7;
	Thu, 04 Jun 2026 14:26:10 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV91L-0000000GtOT-16xD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:26:08 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51790c0a692so2597711cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780583166; x=1781187966; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=clkIHT02uZl46rCjOXn4DL3sKNX9XCKfChcmoui9JdM=;
        b=mp/h+0/0zxps0e1C8vT7ttC9lP3wx0ZEVY579AnvdFywrBd4HIwPrG8WZg6kW/JO/m
         M7MPDCx+/EvdWnk/vJduh+pD7Ce6NGGfFg0rDp0Qu8y90Vo9FORTzLROLvLM2ou5WM8p
         hnVWjT79hKKHiti0b0VT1XVNpN82Fx0CtYVoOeiTQRQbrM1fAErDMBVjsGGcfsR4b++w
         YXvT/c444qkYXtlMZ1clN1waZF/cmzQCVqvGvfYhHjpSwwddSlAtAC5r3JN6VZM3Bta2
         E465/7QBCN81MFmwKotJLK73u9+DlptKqABoDRklquzozENzY6+st0ttv9TzDOO+XnwE
         dDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583166; x=1781187966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clkIHT02uZl46rCjOXn4DL3sKNX9XCKfChcmoui9JdM=;
        b=ohbUdsrcBGds5Bhlf+xWIbkSsYQN/v2V11f5JFzCHuHRRA6PffMvLFpdRev1YKRETS
         bIr+mA8hAf5Vls0brtFKF90prJKpB/jeXZXCn8b0XAP59n2IKjc/91dADnoFebLYR0Ea
         WxfV2D7OlmkimkIVYw1QwHfButak+F0jjB0S1uSRRVo5zz3Z38JoJOleLxHs4mIA/2vI
         KUIh+/eJ/kkCx953xgxvGua/wx3aZWjszddcMwkvHyLueyRJcrhN4Y1ClISUnlN8eHOD
         rqEXCBZBQNKVbQREggLD1zea2fmIxVdLi59dRZNcTO535JrxnOLs9OO0WtGMk6M6tBRT
         kEKA==
X-Forwarded-Encrypted: i=1; AFNElJ8t4wuABtYFOfwirY+TRazccYBW/FaGDwblbWGsZy1quPMmvpvOwbyr+PT7vG1gPMl80c+LJEF25kEmkhhQXmHe@lists.infradead.org
X-Gm-Message-State: AOJu0YxETuEaBH1aoGRVLzkcbGqwpNCr8T4N0K5K+l9qfcT8XP13SsYJ
	zh1olfJpiGvPuHod6qknDuxCi7Q/8z1CHktHRHbXtHYfMRD6tMPbYEwWdj7HwMoFAE8=
X-Gm-Gg: Acq92OEcvSog9RmsRgq6ekgPU/wizv7BYdb9M5bSySE3VV/s4v/E3LtJWUzrLQ9w2L1
	gP4zWokDWb7rigD+IrUWabgCq5Ftza88dlJMLrZfc1+NJIDuv7Yw9SZmTKGUl4ds2c3UDl4rUv0
	9vtdq2NAsLK49CM8S73wS+SIDj+Jzarv7KDyx6DyXv34FRTqM18NsuD0Z7wf/LGPT9/DjeV84/p
	qoC9Gqe6Yl7lpWXFv3uZ3yQkNUJI4aj9E/NCb9JpSCyPF654WIWC7TMx2ll9sICmc5hnPaOxXJz
	m4kwx1frJ0DtyB8FVrMJetfpHzREfPyVSZvLw8/n9aX4kxD6NCNuSEjTd58nTglqzQbsDDEQxgv
	YOxH/SGrmAqu6HI1UA9r9NfkeoDoKMJYu0YVBQ2riudP60vD3lxMqTrRXCAGTPPA46SByJhGL8L
	2DpZjZEvkuT8DGCwJkET30qe76gBqBVV26FajU1Yu6IkbpmCeInSwbSftcYqNMT0v9ufZbLM4qj
	XPCsqvDNTGy45mJ
X-Received: by 2002:ac8:7dc6:0:b0:50d:7aa1:f405 with SMTP id d75a77b69052e-517785ada2amr113397751cf.9.1780583165966;
        Thu, 04 Jun 2026 07:26:05 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51790d965e8sm4420111cf.16.2026.06.04.07.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:26:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wV91J-00000008IF6-09MR;
	Thu, 04 Jun 2026 11:26:05 -0300
Date: Thu, 4 Jun 2026 11:26:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
	alikernel-developer@linux.alibaba.com, baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, joro@8bytes.org,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, oliver.yang@linux.alibaba.com, robh@kernel.org,
	robin.murphy@arm.com, shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com, suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de, wei.guo.simon@linux.alibaba.com,
	will@kernel.org, xlpang@linux.alibaba.com
Subject: Re: [PATCH v3 24/32] iommufd: use iova_to_phys_length for efficient
 unmap
Message-ID: <20260604142605.GY2487554@ziepe.ca>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-25-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603151804.1963871-25-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_072607_304047_0DB452CD 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 03, 2026 at 11:17:56PM +0800, Guanghui Feng wrote:
> Use iommu_iova_to_phys_length() to get PTE page size in
> +		for (i = 0; i < npages; i++) {
> +			if (!batch_add_pfn(batch, PHYS_PFN(phys) + i))
> +				return;

batch_add_pfn_num()

Be mindful that the num is purposfully a u32 so that will need some
attention.

Jason

