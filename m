Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A43CD5BAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzCqkxjdyLyluKphmX/0JXB5RtssdE0vceO3cVeu+Ys=; b=wf4QvHYyk1+t0npCR1fXjduzkd
	WuMqQhM7u8z8uLxWxVehDyQUCzhHMOD0LRSrY5pCe7vy8CJFeZB4rBNrzJF6viH0PIKdCIDcTo4iw
	LTHo9Suug63m2L1GGgwIavKWJL/Uwe6Rhg3pd1jHovFC4V9Bj6VtAvMgsgxE180JyuqhOIAU4LdUB
	mGBsMfiubWP+MaVlldHqQ1uoS3ekUhaiGsf2CUevR8iblWF2Gbq8Nx2lHct3O2hM95HLjOVDazLHF
	6hLfT2nU/0su3LTf7DEul3oUMLwyvs6SP7Onhm0nlVra7hBEB2Jq4VdSNUxMpdaat30j+63TXLe0H
	FHAO057Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJU-000000021bM-2laj;
	Tue, 19 May 2026 15:24:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIm-0000000211e-237m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38B234038B;
	Tue, 19 May 2026 15:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E113DC2BCC7;
	Tue, 19 May 2026 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204252;
	bh=ERJ6QYyD/rtixjiVMC1F+5dCbuxQKMvAlZAya3dqpJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D4MrnUeZHzwkASxmm+QLvSMa2+atQzHfuIemVPTpOJQijkUBjoNeWrcqbWq5iJFv5
	 SKY8ZmKZdDU2bxaHhHU8FPdAh3NgE6MD5DN6RFv3C7oRuuy4T6IGNbbLBMkaA28OG4
	 D2HQn1foKwNI0Qje9xesPIQANao6i0Fbe/Xb+FqSNUa7VtcSCV6iBF7zxhayfyj6S5
	 a8LA+gPrCwsd3M/3SWzClJoEwlgkPmJJ7azMCh/n/zXiXKC5qmiX56FnEFGRGIVNx7
	 VeQT2aSXxLth0qIhEp/hYo5wquD5NOd8ESpgBEMufMf2ZlBHJg/F5OX05uvgH4qHU3
	 kEq12YoAKEwbw==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Lokanadha M R <lokanadha.r@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client table
Date: Tue, 19 May 2026 16:23:05 +0100
Message-ID: <177918839354.749747.14864663543580350364.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
References: <20260428-add_glymur_mdss_compatible-v1-1-8416df5a26f4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082412_546820_456B4D81 
X-CRM114-Status: UNSURE (   9.29  )
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

On Tue, 28 Apr 2026 15:13:50 +0530, Lokanadha M R wrote:
> Add qcom,glymur-mdss to the qcom_smmu_actlr_client_of_match[]
> table to configure the SMMU-500 context bank for the display
> subsystem (MDSS) on the Glymur platform.
> 
> The settings disable the next-page prefetcher while keeping
> macro TLB caching enabled. Without this entry,
> qcom_smmu_set_actlr_dev() finds no match for the glymur MDSS
> device and leaves the context bank ACTLR at its reset value.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add glymur MDSS to ACTLR client table
      https://git.kernel.org/iommu/c/8bcad9e3a674

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

