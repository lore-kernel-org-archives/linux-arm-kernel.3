Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C45FED3C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPjCFMFqi8QLuboc2zZPARuZC0PwzjGUIbdAh+rlNHU=; b=MrGxM0z7S+HwzvmSTYHSb5SgTo
	/O3L387b1SiqElLBx98XBuRBPlVANIRUvve1W1+tmF0ol1M2GdluVZctFSKeC/ZemMvBTf8gnmO0x
	bW1cVBLVsqEulfp7DcjdYpH9ZqoLzovPn9BZRzgBBudgbpYfHRUBMi2UkuG9Z3oUXJRzPww3xHuXU
	09a2IGLtktAM0w2pwMRr6Pj+WPsyVucao5sjbuCj+KT8f7wOcbp+1lrT+BE9fzDapqw2jnUNPWYZf
	SlSJ4UMGggrkjME/GUoTl5R/U6gcC5s6bWVDFBkTBrVCHjhpvBt6U85RnNMBiSMAFfjopcA4D7lZM
	caLmSyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGlC-0000000DG40-0geB;
	Fri, 24 Apr 2026 13:39:58 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGl9-0000000DG3e-2YjI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 13:39:56 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8ee7ffd738dso428145985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777037994; x=1777642794; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPjCFMFqi8QLuboc2zZPARuZC0PwzjGUIbdAh+rlNHU=;
        b=TJmV6uIF6na8LWhBLqR6h+7HyYFrQB4kU3yzgSBExLufyR+E09oqfHdeO5WcIM1ZHE
         TvYyo6y0G+hpz8WqWsRi/puOVAGVKeRV0RENrfluwB5QK/0qYnKrJy6rIovLB2xT10Wz
         Pfoiq0h3zNllV3tImU93PfRryf6xmiCNSALiH/eUt4WMqydt9h3c1tE9seMfkrVM6w7F
         bTNQLc+xuLeibeAKmEbkXIc9L8ZE9qvcffwZSTtAoMeXSMwTjQVM6mcYZNkrLCOe+/ZG
         YoHx/A9tiKBuY/0j7QsVSAUAU5ynBiaoXxBQXI2CxoCd9C5rpVB0QdDDKVEgeS4D7fyI
         4DGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777037994; x=1777642794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPjCFMFqi8QLuboc2zZPARuZC0PwzjGUIbdAh+rlNHU=;
        b=Utnx49NYYvBavtLhPWVIMya8NShsDkfQ/K016yKr35uqGjm7EIcP6sDShLODMns63y
         2SnNPGkP2mwhvPjih/iAKb/8d/U/fNKTIVEMvXPOg1DAEIH8hxH9Dz5mTql0rLnn94Tx
         ZjGsvLRXblr8pPVEE8OCqcycJhoOHE6hwdsJ+ae2fkDeSv0sa2KyoeYX61auPJdOAU8T
         bjTIaZhEtF3myML/5vPUf3Wj8/GPneeT+TX+ivbnkP4T629dFfKjWakWEyiGRIEFEOt9
         0Q3gjSrV3IMwYbtevPYwWlyaAB1qzjQxlCrjCFIM+Hp5MBAfSiJ6MBP2QK4yl76KK2Kh
         UVWA==
X-Forwarded-Encrypted: i=1; AFNElJ/EDnJt6FwUAr5W+VbiYihQ1cX+fwMykL65Okpi5kU69qiKxiZnAEGD/pRdSbMmrkot5Pf20HtALjsmzokFxRBC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5HJ27gLgL0zOIR9GialszaOUzEuLunpGiktAkaIVBNP8VHUvY
	W/p5aFM3O5g/iiDU0yn9MCGkJrg7rjs3Ctj1cwQe+/iNP10nvo5fyglquq7gvkRmi4I=
X-Gm-Gg: AeBDietbQEIlPhqdLdJvUsHj7KTpSnYbEwiOslX1Ah4eQTw7YzVbFmAS2KCCZ1+dzYC
	Ruqp8SC/mgFCGH/6ubPobbIxdxoQHZ2Vbsla7zT257fdQpnwoMekhWHj67fo4e09CvvGXQOxyTP
	SfblenKr3tCgJjSvC9Dl0yo1KXr6jf5458cjhZdXfuy/XhvQkckVYmh8S4qJ/iEomLLYX2bZFCm
	v7K0O1roh/rU+IfWrzb+PiJgIHEPnrdwMH2jUCeVO832j1iyBfInpHCB1dcinl2Hg8FssXwpwTw
	/M5TugsYG32pqmNYFfpWA+nfDcZ3bpg/j+d6IQQE+B7G+p/xTOcW9d/2ZFTak0rbsxHylJ4RRNo
	2+R/lY5FCqeL9X98WhblSTR+OqDsztmMf3hh0nDh9kXhZqFtTHMvGPiKXoz0kYl8ORfKHkgMVkk
	wJCC6c56jpR62T9KPs7ANLxSQ/XnHxw46nhOnzDdkPSRGOwaLTNwqPpDpwNbRuFUM9TDg682yfJ
	HvfhU+mC4k7TNO0
X-Received: by 2002:a05:620a:40c1:b0:8cd:9281:6be9 with SMTP id af79cd13be357-8e78c5c256amr3549840385a.31.1777037994254;
        Fri, 24 Apr 2026 06:39:54 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe9638sm1898047285a.1.2026.04.24.06.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 06:39:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wGGl7-00000002Yhv-0Ex0;
	Fri, 24 Apr 2026 10:39:53 -0300
Date: Fri, 24 Apr 2026 10:39:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	nicolinc@nvidia.com, praan@google.com, kees@kernel.org,
	amhetre@nvidia.com, Alexander.Grest@microsoft.com,
	baolu.lu@linux.intel.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
Message-ID: <20260424133953.GY3611611@ziepe.ca>
References: <20260424085339.3503582-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424085339.3503582-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_063955_658715_3135608F 
X-CRM114-Status: GOOD (  14.73  )
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

On Fri, Apr 24, 2026 at 08:53:39AM +0000, Joonwon Kang wrote:
> For SVA, the IOMMU core always allocates PASID from the global PASID
> space. The use of this global PASID space comes from the limitation of
> the ENQCMD instruction in Intel CPUs that it fetches its PASID operand
> from IA32_PASID, which is per-task.

That's right, and all the iommu drivers should have no issue with
per-device pasid or they are not following the API contract..  I
believe that has been taking care of already.

So, I don't think this is an iommu driver capability.

Instead, you have to decide if the PASID is per device or not based on
if the system will use ENQCMD or any similar instruction.  I
understand ARM has introduced a similar instruction.

So you may be better off with some kind of 'arch has enqcmd like
instruction' to control this instead of involving the iommu driver.

> - The device is not a PCIe device.
> - The device is to use SVA.
> - The supported SSID/PASID space is very small for the device; only 1 to
>   3 SSIDs are supported.

Yuk

> With this setup, when other modules have allocated all the PASIDs that
> our device is expected to use from the global PASID space via APIs like
> iommu_alloc_global_pasid() or iommu_sva_bind_device(), SVA binding to
> our device fails due to the lack of available PASIDs.

So you have multiple SVA using devices as well? Or multiple instances
of the same device?

Jason

