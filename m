Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497FCCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBw4ejj4fmMEafZBPpzx+wYOwZgdJDUmWT9JGV8MXfA=; b=JRk5+h5qun1Vyr+7eEX7gD8GNI
	0Wpm6WYrbOz/kyufEjq4EmDLsQk6iDWUfCtch26JJPMe1mdu1pKDlO902yRpRieX+35xMXNF+G2Dg
	WMS2kshot4+gSB2RF4PBpLrNZaIbqHOXvtqZeAOZKgfOVXImalfbEb60CtSWHhXprSJ99Gew4KxJa
	jCgTZ5DZosbQPjyYfgc1g2NPC6W84gkZNUYEz9VjMtF9arf2a2ldUKP60X0BLuz+ZEOQU+OF72Jlm
	8iTIFMqsYfrdpYYOX+QK+/Sp3xtXL/7Ut3u0UOyT4k6Q6CBTU/RGflepWvKIEtJ3Q/E8M6+mq+a8q
	JunJCtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Blt-00000002I1r-0TUh;
	Mon, 29 Sep 2025 11:10:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Blq-00000002I0T-2Eum
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:10:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e32c0e273so101915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759144216; x=1759749016; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBw4ejj4fmMEafZBPpzx+wYOwZgdJDUmWT9JGV8MXfA=;
        b=AgSVEA9ztu5jW8nCP3rKS6jCRB6o947zgODOi+ty0+NKY0DsX73TqFyeVGABfBQO1S
         hUz91nRIcQSyFEjwXgVoijXbYO0JiEb6PXBW9tiyJtOsSqF1FCO3ItstsPIaDPIpy5iI
         bT4Yc4TM9AO8Ahy5Kk47YrE/9Qd6gFFJgAQYupT8Qv6VTzFxVFSVXK+HOonAS3/DtKSg
         v9XAGCRWwIkxbvf9LRG8O8nzR8kTU243AAZ53isB5hG8a05/qMft4zicdYL9cScA+Lva
         tQqVuhdH0TCynXxgUE3uLleCbas6ezknIcgzgDZM6KxuugxmOKs9xqphh8bAHSnUfMw6
         ZjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759144216; x=1759749016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBw4ejj4fmMEafZBPpzx+wYOwZgdJDUmWT9JGV8MXfA=;
        b=WgjPrCoNFz1839tspOyHonpORie4yN/ErQmaTT4TCqFfM10DCJxSCOpzLBAKPTKGb6
         SWC1ia6Sh7pdLotIqwPTnEhuJAPoFwh8gQXdqbMbnoYEMxo4iBsHngBJQLH9/ODiflNo
         6rYrtzmDT5aPWhLxUr8AyN5xeCY4k8G0uR3E3v5Z5jBUzEi3NEEbYiV6Es3HMJHBf4v+
         BYHhZSD1ULLne7UQxbwEMRZg5M3hODTdxhevkb4Zy6dnoZkbIWGSI9ikj39R+LFX4Y7p
         xH3u9nN35cDIFODhB7AMGURF1cfOTsaZPEuqELmJrxbkHNbmskI7+bFmoIh63WHrXLMV
         CxwA==
X-Forwarded-Encrypted: i=1; AJvYcCWrs7QOkrlsu/O+eEQqMVCwLKwwTtsEcL3jE0Wbuc+0Z0QCWsdsOZ2p6BmVkHVJyNzKQWLWDakO404Py39mHxTO@lists.infradead.org
X-Gm-Message-State: AOJu0YwRTgtT3sNZ3VbpWmyizaG7wRnioR2vUefsriv/wt2JE82nzBmv
	E4VQt1xMBPD+sCHsxbqevKgKqmw0xK2/xv0jbWDKbd82+WwgOu2yeQSICoWk1/XqSQ==
X-Gm-Gg: ASbGncuWKAi5oonsJmtf+cwzd1gPcC0cU87NC5/Vd4KYzJ2PJhh3bHGOXuarfj+NU/I
	8diOQtadkK9OmWbz+d+6TEN/BfyozuAKFiuPZGCrhZ2Rnzab1q9mCxKBTNWTVSxg2sTTtBmawqL
	Qs8ZDQEOfD80U5PPFu6LfDJDIrwp5N7Z2HI/cwkxj9kyI4j6E3wpE89XaJJHxrnjaMR4hJXM7f6
	4mAQHXioDm4K+0nU7lqm7/n2tJ6fMEI66z3biXH3nrVkZoIyExxNksUt5JU7SrQqupkQqy0kF0L
	l+fthuhq3RooV74ahgWNRX3khOPRupZmrUjWmRuSy681McErInzyNV3N9EYnlu5ItVRAmvz6WB2
	raL4ZKyDfl78/fQK4jB6qVgJMfbbiYlm2IkSDU4fdnW3S+8XoCCFOCCoYsGOcTZO6HIY=
X-Google-Smtp-Source: AGHT+IFGf4k+JJs/tMEbOwTNQ+j0uedEPD+8WOGLeH7x1gD8a+XVxRfw6dvXWns5XmMqAfUaxJmdrw==
X-Received: by 2002:a05:600c:37c3:b0:45b:9bcb:205 with SMTP id 5b1f17b1804b1-46e575a08e6mr402015e9.5.1759144216266;
        Mon, 29 Sep 2025 04:10:16 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603365sm18381901f8f.37.2025.09.29.04.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:10:15 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:10:11 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <aNppE9A3PDiDg_1W@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923173806.GF2547959@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_041018_590052_753208F4 
X-CRM114-Status: GOOD (  21.85  )
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

On Tue, Sep 23, 2025 at 02:38:06PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 23, 2025 at 02:35:48PM +0000, Mostafa Saleh wrote:
> > If we really want to avoid the current approach, we can keep deferring probe,
> > until a check for a new flag set from “finalize_pkvm” which is called
> > unconditionally of KVM state.
> 
> I still think the pkvm drivers should be bound to some special pkvm
> device_driver and the driver core should handle all this special
> dancing:
>  - Wait for pkvm to decide if it will start or not
>  - Claim a device for pkvm and make it visible in some generic way,eg
>    in sysfs
>  - Fall back to using the normal driver once we conclude pkvm won't
>    run.
> 
> It sounds like a pain to open code all this logic in every pkvm
> driver? How many do you have?

I though more about this, I think involving the driver core will be
useful in the future for init, as it will ensure power domains are
probed before the SMMUs when RPM is supported.

One simple way to do that, is the make the KVM SMMUv3 driver bind to
the SMMUs first until KVM finish init, then it unbinds them so the
main driver can be bind to them, that will not require any changes
or assumptions from the main driver, but in runtime the KVM driver
can't interact with the driver model.

Another possible solution, to keep a device bound to the KVM driver,
is to probe the SMMUs from the KVM driver, then to create child devices;
possibly use something as device_set_of_node_from_dev to bind those to
the main SMMUv3 or find another way to probe the main SMMUv3 without
changes.

Then we have a clear parent/child representation in the kernel, we can
also use sysfs/debugfs. But this might be more challenging, I will
look more into both and will update the logic in v5.

Thanks,
Mostafa

> 
> Jason

