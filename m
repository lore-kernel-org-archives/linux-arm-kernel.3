Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D54AC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 21:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmW9yHmD8Dyy4s5qckAMeYd2CA7UfeC/px2jAWNVXJs=; b=rjycV9811NHC47Z0AG6bgnRGNn
	0VSAp0WoWUVXrZ9PsfvJ5xBy9dVU9d9uDbwg+o9De4zHttR4Zwbqk0xXaLpFNJWKuDW5xaxY1QlJu
	o6DdyV+fH5mvh+hnCA35Q7wkJ8H+7IQjUMnscozf/UaKD/ldjHeCaZYGa1uChKHij/IMaOabnsJcg
	EWgoYL+gxYwfkkk+MkZ8ZFms4VJUAT3xd86owqW6j7mZsOMy7a4ckqBCq3ti7Cjd7ZJn2D/wDbMgO
	SAxqY+0FkwBNfLL59bNqIy4M69T+JP6uh+ZZCjKEvg8cvcVJRTha6BFccxggnK5VhmNekc/mBFhpW
	LVJdRMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x82ig-0000000GeAm-0rK4;
	Sat, 19 Sep 2026 21:35:38 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x82id-0000000GeAP-3UnG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 21:35:37 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-93bfa610b7eso24840785a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 14:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1789853734; x=1790458534; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmW9yHmD8Dyy4s5qckAMeYd2CA7UfeC/px2jAWNVXJs=;
        b=NaVacDQrnUMinW2wOxzUedNyCA/mQm+UixHq5b7e61bv/w3q0H+wN4O2BlArg+zWya
         Y5vfxQ4ZbTJ6p9mMY78JSc/hPDSlV3J6FyZeQYKY+IswHStpOoy7EA5F8AxoROXWuKdL
         lUtZl5+YV8Sq9bzhh7A8djgH7WOIeDnpDCNMlylLw/ErD1h2zYqgVP3W0gX8yTSlog0u
         TocnycNsIeiTU7KWyHQ+e/eGvQVSxUGcaKLEeD62gvoDsSAwimBTFfAFka4HdTKDgNhF
         f7iKxwI9CcL/gMROgvZoYHE8lgsGrqmKU56+IvJQMbP4xh8wRU8cKXVlSsvMNt9uKRYO
         DSqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853734; x=1790458534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmW9yHmD8Dyy4s5qckAMeYd2CA7UfeC/px2jAWNVXJs=;
        b=otmGo1HKBR1bRJQR0XqLmaZBLsRMKFvhzeJ1NuZgTmgr/lL8akldjnSRPe8bw1CxgV
         qOKGKv5LFVImQOwi0XYs3TRucu5HXZ/jbzJjZKqPb8wADZnvmAx0HOzrfP55uvxurv9w
         F3YyWl9ZUcOMn8V7eWmhA9i1GN983jMyDYyq3WbczU9QnoPWJCPB4/8VuzfhKgNj46lr
         FUmFPG444Nt/ZART90B/IReFZ3B9fEDq/KQDc10jRWNn1tiLRrMwWWCGm/AgObhCvoEI
         3GZbPvSo/gzKp77AZZh3Zhf9IM+8cSixpeMV25PG8VCHPYHVlViDYkelucKD5L/3amoy
         zATA==
X-Forwarded-Encrypted: i=1; AKwUvBzpEvDjRdNcUB+aadVybSK+jvLgQu2vD5V3Mo3xT4Rfvmm1urShO8S5+orrMRKEKn1ke74fS+XIAZWuZyPs73dR@lists.infradead.org
X-Gm-Message-State: AFuF++m+uGuzGKK7mdC562sMN6WpvdXclJkwamqB6r2NWMRjoI32SJtI
	+QW8pEZ6542OOQH8ChF0mnJ6YsiWFS3sx5eKuWhz1lLQwPLQx27U0oPQrMCU7mQhqpc=
X-Gm-Gg: AYBFou2EpQ+9disK/uOiv9yhzAfvUNHz8ejH6cmTZv39thGmGNO5yWiN5nmPPCY4VkU
	mkwakPorIDoh4m0VlXXOfM1sH60ebskhZLEk+kP5fdmsoYZfjAFABE9YXQCrWxQanjb279daIlR
	eoP7dST1n9LJFN4dF/33b+ZC0GqE3D0gBoZyvxC2hYypmyaBEe0HXdxs9IX3AebXXjolgsRzc2P
	QZpqyFtrmtPF61MZMTc24QL9B9b7y7lHGTU9hhiZW35xXiboI2Sr0aJglRyp+zlD6/DGUaOIyMP
	pxqV6bB13vlhLWeyNrp0ST2fVEUvVC/oUn4O0+CmHUM1GjKQRgNh6EN2Mss5kFWJppvX+S9XhZm
	YAW2NOBdkZF0wwR8MrpdL5qBmLop8HGBbV4O2Cenu4gxGDJ+VBE3c95ZPiCGVS2C1SC/kDSH2yz
	yLc223iY8xs3emLoG1GZSPWi54IhriEEOfHhzQU5Uc2WCG7rdaGftjPUHKjxFEIe2qBgCYrBn3p
	ntH/Vp3k2yjBipn4kmjYEeZIYOkXrr8SQRFnr+Dxu9TlYx0+nXCQqqZ
X-Received: by 2002:a05:620a:4416:b0:939:fe55:402a with SMTP id af79cd13be357-93bf577e246mr341980385a.31.1789853733973;
        Sat, 19 Sep 2026 14:35:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bed72215fsm275561085a.1.2026.09.19.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:35:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x82iZ-00000003aXY-2gnK;
	Sat, 19 Sep 2026 18:35:31 -0300
Date: Sat, 19 Sep 2026 18:35:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <20260919213531.GI11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <yq5atsnl47c6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsnl47c6.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_143535_998987_B97015D1 
X-CRM114-Status: GOOD (  10.42  )
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

On Sat, Sep 19, 2026 at 08:27:29PM +0530, Aneesh Kumar K.V wrote:
 
> +static struct page *system_heap_alloc_order(unsigned int order, gfp_t flags,
> +					    bool cc_shared)
> +{
> +	struct cc_shared_pages mem;
> +
> +	if (!cc_shared)
> +		return alloc_pages(flags, order);
> +
> +	/* The shared granule can raise the actual allocation order. */
> +	flags |= __GFP_COMP;
> +	if (alloc_cc_shared_pages(flags, PAGE_SIZE << order, &mem))
> +		return NULL;

Oh yeah that's surprisingly easy because of how this loop works with
order

Makes sense to me

> int alloc_cc_shared_pages_node(int nid, gfp_t gfp, size_t requested,
> 			       struct cc_shared_pages *mem)

This argument order is a little weird from mm norms?

Jason

