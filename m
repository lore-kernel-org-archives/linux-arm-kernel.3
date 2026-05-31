Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98801CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrKWJ1NykkXFbiCeCeA4esCrNiqvK/wMlJLwP88BqrM=; b=IQsr8fLHhLcZAE0jAWxnGA3DB0
	eJAL8HTD8wZMdJWPqLGjxl2UbZVCfJQ+iueMdWHLbhawQJEvNtjozM8VqIZUOpMOvR3dlECRzeROw
	vG/6BgVu2PYy1+CeD8YLXlbDHcwmcV0pYuHVk/y9BwmR9jL8iPyoq4FuSEEJyP/5VIt1Ik840aVPJ
	HNW7qSdynnQAmWFtNHEprsf2No4+jLrIQ0HuoiXPFuKbSIGWK8RTu+5d4At+AYC/08K1tBvtPYcPv
	JGqds7e2g30/LEPKTax8nmndyA9edGBHGQHo5KCMWY26VCOBt6C1KjnHmb9XL952umsMIgv9HpRZ5
	FjGs/Kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpz8-00000009ykr-09fc;
	Sun, 31 May 2026 23:54:26 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTpz6-00000009ykY-1Y6A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:54:25 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-516d61baff3so105916231cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780271663; x=1780876463; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IrKWJ1NykkXFbiCeCeA4esCrNiqvK/wMlJLwP88BqrM=;
        b=BHs9o2Jull3FMXfCQtqoDk1mopnSNyQJGbSmNO9IRK1hlDSgFTpd33mH/mcCDep6iR
         YqwsLIauWCGhxvYaspaPdKfHFljGgeAdctilzzSluDUgOMQ3g/kjO19nnQ8ZZIdHCDGR
         r/ERBIYTlX36u4z78bKLxLHWCeXvGLeRUNApjBkZZCRnLzG5MBIeHXPfEGt61vwLpCRr
         5v978j23/b5/8SBbePEGCMVfwacjQmp4z1vzU0woGPIi0lprRJf76+8WUv2iLIfPQTJT
         LNv6S1yrz8EUtF0ZQWANTEuRSyLPJw2gr/5PHTqZINXWLN++VLapbI66YjDnBAw/tZDq
         Orog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780271663; x=1780876463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrKWJ1NykkXFbiCeCeA4esCrNiqvK/wMlJLwP88BqrM=;
        b=n+CWilUXmO5jOCA/GiA0hFNbLFzkqmdX7sCAO5eyzzReILN2sp37kNe+TvfCOfyqiL
         GwtpjMXbfoXYIxtxdcww60kwGmMFEVE6Wo+N6myvbxYHngy6ruxeWk0G3vu2zzzO7bvi
         FwkH5Hv2JmHsr+jTq/L9IxY4ZxZqkrVFcH4roRhrj4EGrrlRW9+CV1Y/YMxu1U53GelP
         Fwpz5bqlbb54xoW/d0mM0ojqeoAY9UaXpTMtfzbY+pcenXckZxPFFYj4o19ii1KD6ccq
         1idzxkKyZlL+H93MLC/ugFx2peJQy3XMNFAoFCCt1nqLnkeqhMxsTnrfpK/i58h29UbZ
         A1zQ==
X-Forwarded-Encrypted: i=1; AFNElJ95jJ115CqXJkTwc/Je3/6DxPrnyYm0/DjI7M80uhtzim7fSr/8zLHYv+mnm8pa72DgBxs1iigxCqddOjPrTaM6@lists.infradead.org
X-Gm-Message-State: AOJu0YzDTx/Q79sOareq3kUaGYSTgdUBkjQLApUNhocdiscpNFoU7+8d
	+Vdh6i8769dmw96pQPtUs7JufTPp46E2BMm0kndh3V7Mg/yGSo9zO27vlXqNaFA03ZA=
X-Gm-Gg: Acq92OGQEuagVrPTA2ssS/0TbjqpAj8C7uazvdFXrzY7s8yFZdCBPXAhlXLMSOFvt0A
	WufzuKiv23uVkXHDh857g1MD4WxMSM2H+crEoau0C0RnqrOrRCvS68iY84dsNg20hPO/acQqOcJ
	QHNCIQ/nF0C1HdAsgMO++Mf6XcfJHmW0jXp7oM7B2n7ieR4bQ/ZprhRGiBqys2tFhnTkM3QvEBL
	3Toimwq7IU80lfjCqJgbY6IA3Vun2YBjRSKHpCVBaq2YdCdHztoRXAei7ePI0oQNpK2oHfssgi/
	cPAelXf3ldo4VJktmChCrI699zbzb44+viyOoqL3+bg7Gq48yVrSvEfEtexYE2c9FOlV3HJ/XV7
	SFgtXTsNtE4+eOezxDXgrth1x16wk8SwD0dNnV9No/x8xb9tM0QhLNwMD7ycvY5L2hbulIDj8kQ
	byiHJnQi7mJLB+8wUdFjqBUQShahmno/nT/4Sr1PDZHImdopl4QedlU5fEPndw0H0r04lKRtwj1
	N8C6Zwbm70wv4vB4NTHECTpsN4=
X-Received: by 2002:a05:622a:646:b0:516:d943:175e with SMTP id d75a77b69052e-5173a77ad04mr129763061cf.25.1780271663054;
        Sun, 31 May 2026 16:54:23 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea1ca972sm78588116d6.30.2026.05.31.16.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:54:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wTpz3-00000001Lqf-3yz5;
	Sun, 31 May 2026 20:54:21 -0300
Date: Sun, 31 May 2026 20:54:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
	adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, alex@shazbot.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org, xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com
Subject: Re: [PATCH 3/9] iommu/generic_pt: implement iova_to_phys_length
Message-ID: <20260531235421.GW2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-4-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531093637.3893199-4-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_165424_415626_AEBF4BE2 
X-CRM114-Status: UNSURE (   8.56  )
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

On Sun, May 31, 2026 at 05:36:31PM +0800, Guanghui Feng wrote:
> @@ -159,45 +164,51 @@ static __always_inline int __do_iova_to_phys(struct pt_range *range, void *arg,
>  	case PT_ENTRY_TABLE:
>  		return pt_descend(&pts, arg, descend_fn);
>  	case PT_ENTRY_OA:
> -		*res = pt_entry_oa_exact(&pts);
> +		data->phys = pt_entry_oa_exact(&pts);
> +		data->length = BIT(pt_entry_oa_lg2sz(&pts));

BIT is the wrong function, it uses the wrong type. log2_to_int() is
type'd properly

This also needs to keep walking and accumulating length for
consecutive PTEs until it reaches a non-contiguity.

The other drivers don't need to have that complexity.

Jason

