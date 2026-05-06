Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17747CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7tvgQz0muvH8bYR5hJSB+XsuzIRTcHXfFlIskt4q6c=; b=QN4XGsb1xpG4Af/8xCC4BnbR9p
	vKnwdz/If3/eoBMS9c2Im3JV/o2Sp3YEcyApyY0L8ZhUNCPxY0gbu+9PjHDd0EItoMGaKUtS5twrZ
	03W33q81TU/BmD+Xs24a3k/RNOpvUK+ajaVYT4Ellgu4JbWqmQ6fnFb/13MbExAg64/rIAb8ffmJb
	P3xnnNHHOkzSKZFwwke9RoXaQHTPm7V2gQR1Z5UIQTCHwb5MuajuJ3UEbcB3b+nW1Gnw+rFC8wwk7
	9HBLnvQY8O7vcXBTFEI1gXINSZZs89BiMDaUO4YG9Q9rWyFdsysj09Zi3FxcPSJBzvxv/IH91dBen
	rQnTkP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYwE-00000000PWl-0dGo;
	Wed, 06 May 2026 09:53:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYwC-00000000PWG-1oN7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:53:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48909558b3aso68069855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 02:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778061182; x=1778665982; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+7tvgQz0muvH8bYR5hJSB+XsuzIRTcHXfFlIskt4q6c=;
        b=lrw2m5H/3wQrIPJQi11CXFp8vyjnnY2gtvDtjCgf1S0Iz+axCiK/sLLOIahdjjgjNl
         txWmP0cvjr1nDU1ADp7aowHoTMHjxn5L9mXFrPUOVvJcqB75bdeokjX8voDtqU9Obil4
         2VsQD9BzqInxp90K/WTb3LPKnnS6vZSdeLUjI7dicoi0nEN28wfOOMMO8+C5UO6EVirc
         H1aNxh0DAXSi/YKc56aNt0gV2ryN4F/suu364p2qxKxUhRr/EInDWr16bpAklqLDWNPj
         6eGMKG4FkFK+MS9Cv67UK1UoMqtc21E+27hQph2OZckJuOxgzNLT4uYiCnrW1v2dl349
         bi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778061182; x=1778665982;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7tvgQz0muvH8bYR5hJSB+XsuzIRTcHXfFlIskt4q6c=;
        b=mjLt2BJSa39p+EqvxDZIi/UaGNoczAwydSZz2OraBM5fFvdq7gvr9GVLJ3gS3rFjU1
         J0uPDsE6suGHdQlzo3fpxZt5BTUVkQSf9B6zSfHQ+pV8zqRtsmb5LW+izCSKB50PNgE+
         i6SW5f1swKc1viiDHzyl4U/lbxWKYjsQUmAjxEYgTYIfN8pQiQQxL6pOkVvEPu0VLuqx
         ua7OywS2dMBv7XU42kaa2Fy6LHbdfU88Ujfr+7WDeh1nUtAgHAeNxOIaBnNvPVIkdmlQ
         uY5IDBirtfa5xoPN56TVUZhDLZLSbiyjgrH7L4NIp7eCCCNNENZYEwJPxnW00XE1fW7S
         O6iw==
X-Gm-Message-State: AOJu0YxQY0oNlsUIbBwprG4atwYuCUpcp6Z1pLGqGm9vL8SrlIGRWAtx
	Popd9I8U0KatcYn1nSusIPg+Bl1RE30MehDAbcYk9WZEAgSITurPTLY0JbmBqUjZaqc=
X-Gm-Gg: AeBDieurIYYV59iQqCU0V82jwj+F2JMbmej8q9+rpqzpotpbQSbGG20g0MJZyufXTbd
	oyXUHWyyS/CMPqFPhuXFMxetd/FPpwiHfvP/nFhZyNjU+AVokkYPPQYDfboIMBD2lecNSRS2yfh
	tFPYPwV4YpyAeHILMwvaQpOF0e0UL5QYrFLou+hYX33SHU79daoXCKs1q1smppnEyoM+v7croN7
	fMGUap0DBa8Jnh0xqRdA2UIkv2tw0ohlfASbKZA2jpVy4bKaIYnWW4TF7A9ke17vHq50Z/cv2Ff
	uuJtbI6sNFJoA8j5PHUgTLbAVMfV3iIKwlMk9Xb//7UJie2nsXm2QAf2hqGFMc1nIwy/xgfu4Q3
	POV3hA+tbLwGg6Q0zL/BQBWWjMzjrwDxSK5UJDHXYcxwFSqbtXX6828mEtqxudaG6XURGcW1xae
	Jp3h7FlgyE163LWuZ9qQ==
X-Received: by 2002:a05:600c:b8a:b0:48a:5574:3a48 with SMTP id 5b1f17b1804b1-48e51f32bf7mr46777065e9.16.1778061182206;
        Wed, 06 May 2026 02:53:02 -0700 (PDT)
Received: from ziepe.ca ([213.147.98.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538ca8c0sm33324735e9.13.2026.05.06.02.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:53:01 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wKYw8-0001fR-Fw;
	Wed, 06 May 2026 06:53:00 -0300
Date: Wed, 6 May 2026 06:53:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <afsPfEzgGtAFrN5P@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
 <afiN1UwS9q6F6A_v@google.com>
 <afoYBYIJOTClsdLS@ziepe.ca>
 <afoeIVIGE-JjYy22@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afoeIVIGE-JjYy22@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025304_601218_7E8D317F 
X-CRM114-Status: GOOD (  22.56  )
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

On Tue, May 05, 2026 at 04:43:13PM +0000, Mostafa Saleh wrote:
> On Tue, May 05, 2026 at 01:17:09PM -0300, Jason Gunthorpe wrote:
> > On Mon, May 04, 2026 at 12:15:17PM +0000, Mostafa Saleh wrote:
> > 
> > > I am not sure if it’s worth it, the hypervisor is much simpler, there
> > > is a single page table, it’s locked (also identity mapped), it’s
> > > updated on VM boot/teardown only, we don’t even use iotlb_gather at
> > > the moment, although possible but I wanted to keep this series as
> > > simple as I can then we can add more features later.
> > > So this patch is the least intrusive change, as whatever the main SMMUv3
> > > driver does, the range tlb invalidation logic is the same.
> > > But I am happy to experiment with that when posted.
> > 
> > Okay, then maybe just always push a full invalidation?
> 
> Like full address space invalidation? that will not be optimal and
> will affect every device on the system, why would we do that if we
> know the address?

Not every device, just wipe the VMID. If you say it is rare then keep
it simple. If you need to be narrow then use the proper infastructure
with a gather. No reason to make something boutique for pkvm here.

Jason

