Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5084FCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 21:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoyeFNyeO4llx95lndb6Ryz5Ip3RITBdTtIpINeqybQ=; b=YW3mbqTCJoyKJuGfHOiwEAj1Ld
	r07CGZunTHKgqbnz7j6ZPWRY/LV79u/jUB/mo+4HRVsdaNayKh6QCLrtloNnijWXCgzLFM6/Aqygf
	LRqKI0Qzh/pjNN8BZJUUchqV7s188pZRmU/82ZbJ8ODyuJ7nTXAGCKljXiqtcyK4MARz+SdaEd7rZ
	957vBfYMWAN1IRHc/fbFHd+aUjcmghCuP6T5KV++BwecF+Bh+49eS97TtoFQGRmfqAe1pQyasIiyK
	uTDMZtu3o2FBXtuuCM1bClOtU4fPjxq51lPxSxDzxyTyMnHNbW5xiY0d33NOAg+4hSHEeI5pIL3pv
	a6PNTa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSijq-00000006RNK-44va;
	Thu, 28 May 2026 21:58:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSijo-00000006RMe-3ud9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 21:58:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780005480; x=1780610280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoyeFNyeO4llx95lndb6Ryz5Ip3RITBdTtIpINeqybQ=;
        b=vLDqwV5Yz7iSArz31spHl/+6h9RJrNQEmmYZz1o5wbAEce508CcQIzwFjyYd5jFAIc
         dHxXFhFBQDuoG3COstlTiBvuuco0OhWqhtoe3Vix6r1zlr/HylbmAl6C7tBIEh93o7gu
         DZ15J7Tp58+Cer2yc26LpCBbcA5wFu698XjbQBlMvxXE2ZaSBxstyE2e4HvX60KDT2+F
         M2OZrSegAOi2bw3sGl/cfNshRcU2rIPx5R2O8+f0wWwtsbLg4VH4vGnrjHs9Q5baNfyn
         5hwgBj0f65r1GuoMKkS+2k/rBPyDNemIVEnrBfrGGoS+rM80fQDS+uZDNuzSsGZk+6n6
         1ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780005480; x=1780610280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoyeFNyeO4llx95lndb6Ryz5Ip3RITBdTtIpINeqybQ=;
        b=HJ9gc/t9IqUpZbQ8pxik2vcNUC5IUtCxdxeai7TGWACKtclK8ZEVZN5s25vW8Zne48
         m6zxrIdaRWjC4ZOyRY05eeHfOfdLUNRWE9ag9Q3UuZBsRXdXt/lH3qtn9w67qU5owGSY
         Ab1PBRT9m/L5uRmefw6Fqt2+GbBiElRNEKQscM1ynBm6iyvu9t4MXRyjeDFaz1i7JUbP
         36/oY8eeovdnNGDY/CjmXzsN1nqStIOBHTTrsqQ3AV73ib8DkE+9/mQJZD7OUXunMKbe
         XIl4DhXfe8Mq2DDLjpDnMF85rxwayVyLaB79s4n9YunjKzNsrFSO0p6+nXfsZAX3kLvL
         hnvA==
X-Forwarded-Encrypted: i=1; AFNElJ9+2iLmn9onRQcH4Nd/lcuxQcplFTh272HgQqBXR09nIo0c4xHPvLxqSpQMq6Iq6o785hwvTfWfTMtppvbdDR67@lists.infradead.org
X-Gm-Message-State: AOJu0YzP/EKZb+2rhCQ8EeSRhdpRvZWlIGQHgRNE+9qhhNlxNZItgOxz
	swIfUPMWp3/mAJmTzE+T1FSxTFhVsdJwzEt8VNoHCpRtuZE4v+HLbqAnXCc4E6NN9w==
X-Gm-Gg: Acq92OFnsoYLSMDxIjpNtvkpCnzZ6fdTSMXUvhGt5f+4WXgYhV31AS54zz0o6ljOTFF
	iNYn1OINBFYC1R7PrTA4R/1tYO42OumkhIM/LXpnuU2tkoUou3t3PG24BpNn8jNCvo3FJdbmNCQ
	eLtYxn+3tuwyNqzd335wXut2nXB3HWYpmAhIwAS4i7mjkFl98s22U5nN2+9TWX11Fn3Jx2fHpRB
	60ofk67GcOavra8oKsxV2cNpwWWWF6GjGg4SLVDemF/Gku3jZgu8bZuMSoFRJmMD7x6OMmQc7Z0
	WgB3m1dKHAi/XW32HVgT+duVfiGqBut1y7YqCOHv5dntviW6Nz/J3Xok474aBxx0fa8BMujPJHY
	h6NM4gkn1Af+Ihv4rSyEiDjDaQRY/L2TGPNBnMgS1FjJOJLOnajNe9mIB2suOkqysFmT/6wJLvM
	7q2qeXTKHb//3bVJr9av6ObY16VzSj+1S2042QPvHmi1YXrR9zhcVL2ws2wvBk9BLXUg7j
X-Received: by 2002:a17:903:110d:b0:2bf:1ae5:2c51 with SMTP id d9443c01a7336-2bf20d81bf6mr227635ad.1.1780005479653;
        Thu, 28 May 2026 14:57:59 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf218a2535sm343525ad.29.2026.05.28.14.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:57:59 -0700 (PDT)
Date: Thu, 28 May 2026 21:57:53 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 07/11] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <ahi6YeIypLKYyBTJ@google.com>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-8-praan@google.com>
 <ahiabwoaBdYwbtar@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahiabwoaBdYwbtar@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_145800_972754_0BF4592A 
X-CRM114-Status: GOOD (  17.90  )
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

On Thu, May 28, 2026 at 12:41:35PM -0700, Nicolin Chen wrote:
> On Wed, May 27, 2026 at 10:14:03PM +0000, Pranjal Shrivastava wrote:
> > Introduce a new bit flag, CMDQ_PROD_STOP_FLAG (bit 30), in the command
> > queue's producer index to safely gate command submissions during device
> > suspension.
> > 
> > The flag embeds the suspend state directly into the existing global state
> > The flag checked in the compxchg loop in arm_smmu_cmdq_issue_cmdlist(),
> 
> s/compxchg/cmpxchg

Ack. I'll fix it.

> 
> > which acts as a Point of Commitment, ensuring that no indices are
> > reserved or committed once the SMMU begins suspending.
> > 
> > This prevents a situation of "abandoned batches" where indices are
> > incremented but commands are never written, which would otherwise
> > lead to timeout during the drain poll.
> > 
> > Update queue_inc_prod_n() to preserve this flag during index
> > calculations, ensuring that any in-flight commands that successfully
> > passed the point of commitment can proceed to completion while the
> > flag remains set.
> > 
> > Suggested-by: Daniel Mentz <danielmentz@google.com>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
>  
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks!
Praan

