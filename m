Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60554C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=una0b7iSQE3/1X7UfiBFNzSBZGQVECZybRvoQUF1H+I=; b=mcUU3ELflx+vasywU1tZIUF4X1
	r/gXUMT49pLeCYNamLnGtVFYYc2uR/hd28EYECpetlatVkxvJuaWj5exnjqS21I0xffV9Cj18sqzw
	BAh4L9GzTGprnwuwhugxnswlzyNFu0WX5rRieJRwTLXUpd2/WH7sJvJuvR/Xj9Myaaf07LwaG1357
	naX0z5aj6f3dk2Y0ToQXQPc3hMpNU9hMMu8DQw2Sx6ZR2oxp9Qk8Jkb7steT575aWyvbuWr53yO/0
	8F/ITJzd8GxJQbleXEzO6pG/toodg8pYIVmfOKniWLRltWvs8Jn/gLAQZZWrug/5ePTZj8DibGvgs
	9NUb8mJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJCY-00000004mtx-0NxK;
	Thu, 02 Jul 2026 15:19:42 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJCW-00000004mtS-0M75
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:19:41 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8efcef23d21so12569556d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 08:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783005579; x=1783610379; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=una0b7iSQE3/1X7UfiBFNzSBZGQVECZybRvoQUF1H+I=;
        b=Huxm94KL/7zzhdaPRNoD2NH4j7ldZuY+MgbPRYUCqt5o534gWtDzQfk0lGrK6hrCHy
         zE84DAx8lNUBOTmaPrlVffslciM23ZTetcia2w2g2f+B4OA2O3dQU2ZW/wyD7Lp/KkgY
         i2EvqOZKE4SRH6WkIBQ6Um9PVcQBE45AoQ20Cte3aFxeQwCqJTlqMhpdoudVqdXGAWy7
         St6cCXHfmAf/o8HkRmsogvzlCjzJAlmZVlrrtC1PcGJAWvg4yvITH662yhKXyHAeCTwj
         8bRSBP7A0+aWfsXRHlv1cVBOZ7M/NJdWnHY5QMKhbndRHlqzM9yF8n1uTB+bcMk+oqaD
         bl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005579; x=1783610379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=una0b7iSQE3/1X7UfiBFNzSBZGQVECZybRvoQUF1H+I=;
        b=FwaoMG+g5oNSTk3oIMRYR3F2OqZvK9uF9mvDhBJsrGxaxAzzwzfQ1O1iiRKgvhgBVO
         w/bEVCyZIarWVp0oVBnY80fmSGmdv0sOfyUCOZkgzpbIQUE0Z0e58brepes/ecQmEXvZ
         ZD69uSEQEkkMSJvgI/zSCZHsApdz8i4CI/cstifQJQ65/wsbxHY/i+d0823lCJ0rZtjN
         OTNMVSWMvlJBnKa+BnwkV9S3uAONSFy12Tc7sAYMiWfrfT+Op89gzT76AhfBYt9D+1Da
         Dk+wLM2Gkr5e/PjDlrFtuWFhXnwqUapRL8P49sBH/z7yCpT9+V45S+Be+L+1hEn6xyvf
         BtgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Pj9pjy0N6ZkRGSsXYSqJO2Jxhlu/ANMua/VHkUWhh05pbK1/YrlO7wGHWyykWZZ+OFZIt3IrsmgLCPlPoaVR@lists.infradead.org
X-Gm-Message-State: AOJu0YwdVGUcp1iDsn9OfpxI4JC8MUCmXWL9krmOBNzKJIEMBnrLA+Mw
	AF9j27YB/JGjJBTG+m84TxsEXWSG0zrLBkwXwIdHzPdfvgSypEFFLwevaw85v9CzNOxMhyx3Qj7
	ydnV7
X-Gm-Gg: AfdE7cm5ZtQVoCXAFQQMUibOPmr3/elmlLru0pRujLpKDpgoAwDTk4DU9Nlakk1pvCG
	s4rRwoGMgY/oFeMRjB34xU80C7dPXyK4tejpMIZqVMeGILZBHu9eNaLjaIzWwGGWX2/9Etr4BCf
	/vlaiNSEf7AjT4mmW1GKiyhKsWXFchLxFd2HAnZZEQEPBLpOr4GNtWCS8BK7WpLfch3k/3IiuMD
	BaDRIzlY+E7DQ44y+POcKJlfZ6146RbdsIFbWRSTO7mZuBJxdSHkujP8FjQj25ZWQainr27bTSF
	gV/g/A+gVgtQjJAze5L6/glPVHnV8tDgYPLdBZgvD5lOOtO1X2wjFAG6etDLiMAUs7mUYg4Pm61
	vto0nC/xHc9j2JJCBsSuq22oIi9n2yqi+fePMfCYRfah8IrM2l3fOR/D6iiCANzBqTCJJ6pBiQN
	8SDpwAsf2Vzp461RNykSZLoNVJnxJzNzGloeN2FXMBI6s+b/tf1NMygFX3Z7VIITiuoMI=
X-Received: by 2002:a05:6214:4208:b0:8de:16a7:fbe3 with SMTP id 6a1803df08f44-8f3c863d139mr68985636d6.31.1783005578597;
        Thu, 02 Jul 2026 08:19:38 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f471de93a1sm27985376d6.34.2026.07.02.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:19:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfJCR-00000005wsj-2X8o;
	Thu, 02 Jul 2026 12:19:35 -0300
Date: Thu, 2 Jul 2026 12:19:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260702151935.GR7525@ziepe.ca>
References: <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org>
 <20260619122148.GL231643@ziepe.ca>
 <yq5aldcaejos.fsf@kernel.org>
 <20260619140616.GB1068655@ziepe.ca>
 <yq5ao6gtoncp.fsf@kernel.org>
 <20260630174216.GK7525@ziepe.ca>
 <yq5abjcro17x.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5abjcro17x.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081940_132599_1265E480 
X-CRM114-Status: UNSURE (   9.50  )
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

On Wed, Jul 01, 2026 at 08:39:06AM +0530, Aneesh Kumar K.V wrote:

> This is the only code path where we need to special-case host memory
> encryption. For this reason, I have avoided renaming
> io_tlb_mem::cc_shared to io_tlb_mem::unencrypted. I can send a v7 with
> the above and we can review the changes based on that?

I'm OK with this

Jason

