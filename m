Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D5EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iNSQseB1MUx/UyReLsxkuNDNXPWZeXUlBY5ARaf804=; b=mMXYiRsbFFspS7fQahoEKoZAeZ
	kAD/3+q56bNpiQesKQUpGYI++k0qz8orX9DV9O/Jrb23+56mup5VwcWKKjjy09R4Srh/GrxuVqXjQ
	bIhBcIHnTlfiefjTKAVGVG0RlaCnhwVqV362ameCgmynSuqLb8FkCRhdaJcuhWZOpqNT17BM6sRvm
	Kheu+nD0JJzmgFTAC4KaA9UHOY7lseVMO9og1CzEEOegc8oN6sBu0JLYDfuD7ALV69+YitDsiyDH+
	zoecrXAiJUdv92/Pu171TNr6rM74shFcsjevPEpAwCmeTz1u2dzTJtZzUqYGZOTRdzNUCIRFTmdig
	t0nWrS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEmh-0000000FCjl-2I0R;
	Mon, 29 Jun 2026 16:24:35 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEmf-0000000FCjJ-0m1o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:24:34 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2c81db32393so104155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782750272; x=1783355072; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0iNSQseB1MUx/UyReLsxkuNDNXPWZeXUlBY5ARaf804=;
        b=gZougzRcHj3s/bix+qgHAg3vSnsUysAjuK+6Wv/nk2XrWvW1z6H+ehfJ09ktyRxP0i
         eegPFwLC5hba/+UdNbVCgnp9nMPsviSme+EfU3sgwZUqqYGsNrrA0iVbqVTN+pYpuMPo
         xcoF9eoxb6IVmfeSgLXz6Ihdu8AHHbZ4w3Vux8KVj6f8MpPddmIjASvM0Dtnriai/6QH
         1vaBznIUOPyQoTuaLg6sr3puQ/OkJ2pGCJ5KtAZtFgW8l4Q9lB9Kb1MXWiX/hfp4KZLh
         LsWK2NfoCQVRBj8DGIZnSfXbyPtnyyTZPUiNgBqMZJbRQ26xYDlO8SIoY/tQz6y450Fm
         LtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782750272; x=1783355072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0iNSQseB1MUx/UyReLsxkuNDNXPWZeXUlBY5ARaf804=;
        b=CnAaQi41ifC66pFih/WCKhzuXTu2xJhiMzAl02OhsppEkhdqUdUfn5Uoe1HVT4jdXv
         F34vgJd3O/vcPEiTrWjMlHbb6uM9yu1CZHoLlo0hOken34THqym0z5sLakUzZ9W1leTU
         0TjZvgyxaFf9Q8957dxID3Je10phQJZJd99TyAT5TFGT8FVQEDoEA3rhPX2IDmoJKYKB
         wQEIYeMJzQZAnKRm+YlWUR/2aLLa0r5coEu5zrd9/VE6DTximKgUGrlK5GZK7hgZSDFU
         956CDVLs/pQDHNYVW98fZa39b46OmHBrGonxqT4dIPzY69S2v0HWTaqPvSy+yOISAr2b
         EbIw==
X-Forwarded-Encrypted: i=1; AHgh+RqmaueoIEaJ/UEOJCvslC6A/2AghqGlSKp3mFogE9jPrtwA9uucEinQzpimy/rc7bOLY4oSgqid9tTVj/dzwG2I@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsdf3dnjxngk/85iwT8uBdKogq3TvesCbk5/pXryWrfL2TgoCJ
	bgTgA378NDr1RnGjCnw26UvDJRoJqiWRxVj3XKr2tRy751Gt8LqpN1787yPjSM5oVw==
X-Gm-Gg: AfdE7ckjm3LbuQAwT+FMJdqhkKndpDfUuLsDY5HTLhBeRQ/OwanOOn/6VqUUGL0v4bS
	taQ+TowGspQ0FmnwpB4LO4Fodq9cAK1YiSFeg/z/zDS7aAEoHD4O1cbHjYgNhZ4iW2Na74tWsJj
	UIQRQp/2tC6+oL2bXe1z+XOYLoKa47AzAgKIuL63hiSQ7S5ysqug2MRsFnipQl7IzlcOX5nOQBH
	bKhnXO/N7UHcbeCDi/Sh6EBWevINgEWxSDTAjcNwEFO9uXUBdmqeYyldbFS2Nv+w+1Xcx3hw/uf
	dbskCSORnGv2vFx3aQE8gz4KEiPijyOiz6SPnRbE1OzNT5MbXIwb0JxjJ8fZC20dLa1PBa3Jcj7
	4adTFSNebAUpLIJUddvCRr4aggWeQjx7UZECLEBua3K2sK9W5aJ3hU0BDG0nqW6Ln1aaC4nrSfA
	oJjjziwhABvIV4YCQ/CyzAUPJ6y/pDWaw45djK8aUGek9hTIg=
X-Received: by 2002:a17:902:cec8:b0:2c6:cbcb:bc72 with SMTP id d9443c01a7336-2ca2d062c01mr256175ad.23.1782750271674;
        Mon, 29 Jun 2026 09:24:31 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37eb013af70sm3876698a91.0.2026.06.29.09.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:24:30 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:24:24 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	kees@kernel.org, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	jamien@nvidia.com
Subject: Re: [PATCH rc v6 5/7] iommu/arm-smmu-v3: Retain CR0_SMMUEN during
 kdump device reset
Message-ID: <akKcOMsUoc0mYVoe@google.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <f3866cc84cde2108b28c35b570ae502384e84c2a.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3866cc84cde2108b28c35b570ae502384e84c2a.1779265413.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_092433_221686_6E3BF280 
X-CRM114-Status: GOOD (  12.28  )
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

On Wed, May 20, 2026 at 10:03:22AM -0700, Nicolin Chen wrote:
> When ARM_SMMU_OPT_KDUMP_ADOPT is detected, do not disable SMMUEN and skip
> the CR1/CR2/STRTAB_BASE update sequence in arm_smmu_device_reset(). Those
> register writes are all CONSTRAINED UNPREDICTABLE while CR0_SMMUEN==1, so
> leaving them intact lets in-flight DMAs continue to be translated by the
> adopted stream table.
> 
> Initialize 'enables' to 0 so it can carry CR0_SMMUEN in kdump case. Then,
> preserve that when enabling the command queue.
> 
> Clear latched gerror bits if necessary.
> 
> Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
> Cc: stable@vger.kernel.org # v6.12+
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

