Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BE6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cCQA9k6bE3JnyYuduP9TfMmZZN2aOdMtIN4G4eRzms=; b=Bs4QidTVlkyG1uYdnGXpmOa/Wv
	MV0u4/Wc3wv7PdvrZw0kM8uE/9j8l1rTgBi8rVyVfKUI6VJSGydWE+hfwk94+WmX8U1KDoyaG8hC5
	zGw/7w/6KvYJ/nNUrrw0uzy9JgD3dTxq399Q4Jd3MtO1SeLH7uUvm0rVOKeV7rBXDnl2yTTWiZzdp
	0ZTBFo1aU+kz4w1k3SGoF6kDl7Vwh/yjlffMFpZ0IPXO9H5cpHyF7nMBRg2O3Eipg1/p/XobFMKWt
	xk9+cH0r32hUJKmZsUhPgcuGza0Hfmhhk15DItwhkfP93I3CCNImscPx4bmlN71usDYnvaJSKAsTo
	r2N/cDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcGI-0000000Bw1B-3b4m;
	Tue, 14 Jul 2026 12:29:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcGH-0000000Bw0k-3Vs6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 12:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6cCQA9k6bE3JnyYuduP9TfMmZZN2aOdMtIN4G4eRzms=; b=V3ZIwVmNniT0ZY3SRBpwkTc3Q3
	O/DpJTz/AXCr71F3as0IWOKL/iHyOfLWrtJeJsif6enOiFXH2TQRfL+/Pp0oE33S/zrxc2t85H4au
	qeBWdQ4CBSEHWAV66cFfEpLyPupnBCGRqJnv1ScYfA8W+noc+39TTb77RRzrf1GScaW2ziJTrOUjL
	itQtvOH/dHSrlsd9y0lF8cCrZruEhXj//pIIl0vNC59han41Qwh532dnIIqUDLSG1SYxeo/c89wKC
	Qt57APmsGt0LPtS5PjFNgkMAvudM/sO7EpbomBboSJT6jWGCOp06HRGJtTzxuhrjQsDxYgO56Uzug
	IDGmnE7g==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjcGE-0000000CTjU-44Ib
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:29:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cab97c86bdso112795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784032157; x=1784636957; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6cCQA9k6bE3JnyYuduP9TfMmZZN2aOdMtIN4G4eRzms=;
        b=FrXnRzti0opmlSyDIi25/5Wi8LfSqgjmb5FkbB2X5Jao9F/t7B0RsKSmcxm3HPDZYV
         6XN2mV8mTMJOkAqnJ7yfpeFLmF4aIaxxhlg5vfgzexzwmbsKHwnvVt/KR2N3vxGpRwBe
         n6PeF9CPzL+YOdJrRXPlvQZWidkTeiDdtm5YHLUnbZFmWHUOQNckZKZjBeuu6NR0nkNC
         4bi97I0qN95vvO9IxzELZbXma0aCNtx3/U7H0dP+aYcBLmnGR36WMr9b8e6G8xXR2aht
         NDVJGTwOXtRfO2IaVuDqwZbwDTtigkLdE1dsAZHJEpJv5Dndm3NR7ca+TZuYFk1EPk6D
         UocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032157; x=1784636957;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cCQA9k6bE3JnyYuduP9TfMmZZN2aOdMtIN4G4eRzms=;
        b=Ypo2McIfSYePTfbcgOzJTLGZh0j/3YqQWHXZnVlIeOKnXpWSnzZSl1tFh3Zyfayg/4
         GDerEbBA8eZiHRM+XMyON5+b2DKC8ODQAv2giOjA2nS0W3O1eidALkhQ7uGOhljjz4EI
         zDDchFD0e12iRlpGoAO7aAeHuW/Qr/YgVqem0zgji8l7ycsZElKIf+yZM2NMAfqwdg7+
         OFNldOEEe42ae570mj24xrmSXfTdRoQbLuR283DgTHqAeDq5OwjsT0Q/oHpdhlPjgIPd
         DzjN53nn0ryWlf2VQ+Ba53kcX67iNd6GxSBkMDcQUrPnd+VUH21rsr1H3B6kfuWh+cx9
         qg9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpC4MfxhG3L9IoYKoazC6Orrk1+7bF8+qAP+FBpL8Yz3TpBKJXTk75E/iA1R/cgk37scTVYdm0h21/gYn4VAeZZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxmUFtKdvDhYdFUI1AOMafy4TKkSKTUXCQ68dCwY5A//ku5PALw
	6FWtw8zUt2DBkqaKaHA6biTwT/L/3SbUrgzJvtR0hCyEGH06/+Wv5HZ+2Iqz+ezmcA==
X-Gm-Gg: AfdE7clAuyMh1LbtaKTO4zcYq9HF7pkMIZG6mNgiD1ex5oWP+66wiSJy9shTbnn9Szl
	3DfLEAK/WO8JsMEd8vi16U/N1Ofgn9hc5uYG0ADMpRg+roqP2USzRoisZgpwYMYU4DRd00MaI9I
	MF67x1DJFB8TBFMljvQhxssOPx90jilF7/Vw9NvHQVS3B/xv5PkjfUYFMy4/axeouSu/Fe5xMnx
	INQuJx4Peb7OQcLQJFibSSq+T7kecCdKe2CMCG5C32ycoU03gTiYIzFaYHflcmWEu85W+MPv50H
	6Ay4YErMiPgC/oa41wD5uQjW8ad55zLPSZFy6DNHwHInc0Zcb2Mu2CqtJqJ2TeZcm1b9vhYP9YM
	TXnqEpkKcj0BOuUS8ThNPmjhY0c/Lrx1NhpKfqXWMor6saJzNkRjrvGKqTNvZ/fMqNZwcb+4jS5
	U6LxSSyWSjy8pTaG1sJv2cdi8AMoJsKBNqjmW8uzchJ4wSAeQ=
X-Received: by 2002:a17:902:c94a:b0:2cc:a859:d404 with SMTP id d9443c01a7336-2cee1cab7bamr5500905ad.23.1784032156142;
        Tue, 14 Jul 2026 05:29:16 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ea7fsm115135605ad.38.2026.07.14.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:29:15 -0700 (PDT)
Date: Tue, 14 Jul 2026 12:29:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] iommufd: Iterate the cache invalidation array in
 the core
Message-ID: <alYrlMPtCDfz1jRv@google.com>
References: <cover.1783539724.git.nicolinc@nvidia.com>
 <c19b7508428e9f14d6997ff9f5a41d9d5ba6cde5.1783539724.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c19b7508428e9f14d6997ff9f5a41d9d5ba6cde5.1783539724.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_132919_165208_F0EC1725 
X-CRM114-Status: GOOD (  16.81  )
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

On Wed, Jul 08, 2026 at 12:44:17PM -0700, Nicolin Chen wrote:
> The cache invalidation ops, cache_invalidate_user() for a nested HWPT and
> the cache_invalidate() for a vIOMMU, are each handed the full user request
> array and report how many of the array entries they handled by setting the
> array->entry_num. Every driver therefore implements its own loop over the
> array, and a driver wanting to process that array in fixed-size chunks
> (e.g. to issue commands out of a fixed-size on-stack buffer) has to carry
> the loop and its sub-array bookkeeping all on its own.
> 
> Move the iteration into the iommufd core instead. Invoke the op with a
> sub-array that starts at the first not-yet-handled entry, let it handle a
> prefix of that sub-array and report the count via array->entry_num, then
> advance the base pointer and re-invoke the op until the entire array has
> been consumed or until the op returns an error along the way.
> 
> A driver that handles the entire window in one single call, as all of the
> current drivers happen to do, finishes the loop in just one pass, so this
> does not change any of the existing behavior. It instead lets each of the
> drivers convert to bounded chunk processing on its own, done by each of the
> subsequent changes.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

