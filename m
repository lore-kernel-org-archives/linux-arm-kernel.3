Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295D4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95TYvt/Y3bxZkBtWRHNbhVKIR5ubiXw34ct5QIR0VLc=; b=Yr0syYxvvAciEWV67J2OOk/c11
	nFv4nErvBICAw33NjrVItHPMeo1WVU/WXjamIFNNWviUQpSIf5j4LApeQyq5qGzexgzGqWd6FvqNm
	5U3UG45ouDyGzYLtvvEZnlWUkMt3gAn/RJXDt0Nq2rcXl78YlCMfqE9S32T0k3wwMBcrYdi/gGBgB
	7R+EDvjq01+53OPCcPMDi6CFl9oDqXY/qZ6Ur+MBsZsTwXaVH2qHWY8OM6afK016e0Vfo6zIwkDPY
	A0xmlGt3g2ldqybbRztL3oP80gGOmmvHerZGxLjiakLAiJFEcfFs/IXs26EOz6r0s6c+Zj5Mof25x
	wkT5oLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJAk-00000004maZ-3L3V;
	Thu, 02 Jul 2026 15:17:50 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJAi-00000004mZu-3be0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 15:17:49 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-8eaa7b5e31eso4698656d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 08:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783005467; x=1783610267; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=95TYvt/Y3bxZkBtWRHNbhVKIR5ubiXw34ct5QIR0VLc=;
        b=BgLYgIPlVks+YcQbFOOGNkSdqN3qgI8bjf+DO1dwLh6Njh6I+yA23rjcvJsn6TLJqu
         1Yz2WQWrLuUIA0ajG6ILjUd8Nc94PPJrKWNneBF3bojGZqGvEKKA8slXTJ6XSVAWYW30
         OljoChiYNWgVDx0E+kLTdgFuyagC926LE66Oop6eCdzr0FqZcLGdkAOeSsQf3UV6u5cy
         6ow5YZRZtCNXdN6xdUsAyYxh7jLG/3ho/rPg9u8vdGbGCvZapuBQBsGeSJ8u7DxcZL4P
         oTtSGzfjafpLAkd50DxZ1EQcZkqZi+VIygSCG+Q5DXRWleZ2zDWESUklIMSevg8wSoS6
         Or5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005467; x=1783610267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95TYvt/Y3bxZkBtWRHNbhVKIR5ubiXw34ct5QIR0VLc=;
        b=VMd1XL9877TYDXxhZPV9NwScRPbDQLh9qWDdQyV/ST8WsuIeU/zWl0Ye0AntquITAW
         CFojcJrjZK9eP2QMuZMl0KzFy8p8WM15wfU06hS7NGyonPXpCL7EZQfqBLCYBFMjWcpy
         L39R94H8NkcNH4/Hq8nazvmy8nq+gDW+vw55HFmEAY81rvt3rnNRjr03yl1bhpVyYX90
         WTtFkMVQocOnuQne2RDOPHnlOPwpsPqv4aaNUWNoAaLKrcbR2n+23+QXFjKN+Sy/3d0V
         Me5Om3X9tLHOWoIKwZ8UKCee1emiGw8Ymezw61aIvQz1KTE+/Gfa1ojxvGZsbDEzH6gL
         akew==
X-Forwarded-Encrypted: i=1; AHgh+RpIwCatyRS0KA6pxZpe35jWlQdhqvCxjAolgZKSCrXt7DNB+JgKS/KM2BfNfYH6q2x3raHcC31NGzrYx64ikKCl@lists.infradead.org
X-Gm-Message-State: AOJu0YzMgc/DQZ5rkwsT0bDcPd8CXGx0tGfnbJ/37O6xaOpYwxXhMLSN
	Ft86OngLMlrWxV3FDDj0sHxgnsEDViqP4wDIbp/hmbge3KeQEDLa05JeAan+/1/10r8=
X-Gm-Gg: AfdE7cmdc5U9rMK1X+1go6q3NT7jEQgPjwCPOAhFm9fCMV879ajk5zN5ffsnpkdVblb
	PU0jyPM3Ko+2+rCpAek7TOb1nka/KgNFWV1ZVsarlbMCQsDjoDmHCYnVMRJxUzsfTX+8l+eYtzM
	gSx11HsanFmJr4FDZl+F2q6QlClQnahitXvlAtypQ4jR2gMrEqsPxtg+7B3Lw2X7p4dtx5UxihK
	Isr2prh82dtG2QawNW5kIjSuwFsgJTFSnfW9383t7ZwUCXeoEM9Meg5tDveUUO33x8G5LmmfYzz
	/RFJ5bdjpNjI6QW9sjoE4pKCZMrJvPTxu5H3rA4dNimuYCkVdXtiOcTeJ8zVOidBS1ZqIHZwGCL
	RozZeJHsAfL7Oba1dtIHsXW9PUfL5PeVpfUHMOyGrCUHQLQ+qE6Rr/sb0bac2lfr8iRGcL8G49E
	eHS1/QR+pfIUyLQBij8Opf5hypwQNLcOa71DNs0tk1H4xPd3pY0KcfSVhwlcopaYV3OpI=
X-Received: by 2002:a05:6214:5b87:b0:8f1:958c:eff9 with SMTP id 6a1803df08f44-8f5be9c1f13mr4309056d6.28.1783005467087;
        Thu, 02 Jul 2026 08:17:47 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e371d55sm28337966d6.10.2026.07.02.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:17:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wfJAf-00000005wiw-48V3;
	Thu, 02 Jul 2026 12:17:45 -0300
Date: Thu, 2 Jul 2026 12:17:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Kyle McMartin <jkkm@meta.com>, Breno Leitao <leitao@debian.org>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <20260702151745.GQ7525@ziepe.ca>
References: <20260702112825.781750-1-kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702112825.781750-1-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081748_905323_90CD0D27 
X-CRM114-Status: GOOD (  16.62  )
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

On Thu, Jul 02, 2026 at 12:28:25PM +0100, Kiryl Shutsemau (Meta) wrote:
> The command, event and PRI queues are sized from the maxima the hardware
> advertises in IDR1, which can be several megabytes each. On systems with
> many SMMUv3 instances that cost is paid per instance and adds up to tens
> of megabytes of coherent DMA in the capture kernel.
> 
> A kdump capture kernel runs from a small crashkernel reservation and only
> has to drive the few devices used to save the dump, so deep queues serve
> no purpose. The queues carry invalidation commands and fault records, not
> DMA data, so dump throughput is unaffected; a shallower queue only bounds
> how many commands may be in flight before a sync, which does not matter for
> the capture kernel's small device count and modest I/O.
> 
> Clamp every queue to a single page when is_kdump_kernel() is true. Doing
> it in arm_smmu_init_one_queue() covers the command, event and PRI queues
> in one place. The command queue still holds at least one batch plus a sync
> (256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
> command batching keeps working.
> 
> Suggested-by: Kyle McMartin <jkkm@meta.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: Breno Leitao <leitao@debian.org>
> ---
> v2:
>  - Use min() instead of min_t(); both operands are u32 so the cast was
>    redundant (Jason Gunthorpe, Breno Leitao).
>  - Add Reviewed-by from Breno.
> 
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

