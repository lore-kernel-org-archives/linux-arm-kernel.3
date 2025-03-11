Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC56C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeR+5yPWoDZv9WYz81lmt8gaue+PBW2AKJ9m86Aqryc=; b=1bRQinPQai57cB7Bs65TMJccVl
	CSHG4AQZ8O/naAxZzaxxx9ftzTxoaB34+MKrBRNhNlcJnfBpySVDYkXyHPnYGmuktMhscFj3+L2bw
	FUzbP2ZApts34+GXI9+t0NCQ034asZ/s1MOUR06IEf2Ztv7onP7ZmhaAeKr2ZXscLV1zNANDswqak
	SEj3sXemRWMZa4JZ2e6xupTHLxNPkVsvQZ8W9Cou2q8yuOdajZ7fhux1nUqh3pESp1ULZuCdAzcpz
	VJHzeoTdB6JRO4wFjBZgpp0dy/WUAjblsCW7GFSCVQQEGOZkQRoY5FCQzA8t+UKRvN9ChpWqZL2Qp
	Vyb3JB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts46o-00000006aPS-47jf;
	Tue, 11 Mar 2025 18:13:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3pJ-00000006WzW-1vcq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 17:55:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A861AA460D0;
	Tue, 11 Mar 2025 17:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A55C4CEE9;
	Tue, 11 Mar 2025 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715736;
	bh=8u4pLdHTIPFDK61uW8Pwmuh4P/pSUrHF80u1BGQPw1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPM+UPYp+Dl9QmdvLVZP8/GlmuodV3AIhgCje1OSt7+3NoWS+fJHPJy17889lPa3a
	 CG84EdQhEZW3BwePkfymcv95wgGXaD1vtQUdwOXMmhEqCV5hgxiikHjRjYJ2Y/v0E9
	 WM5i/vw30jFFELw59CjhpP80sFQIfNiklgei14DqpgQQCn2/tpFtaGukHDvxOiTBLe
	 DMewDLdlM8KBeWnfPKcatcsXN489qLe4brSdeMrSfrB2G9Yp2l6TmfciXHC8RSWi4H
	 t5sU0vqoglfhHOiANV51YkT5bvJLYhIMPKAShrzcy9iUeCxVwEHSgFY+wVO8jfoSNg
	 O4YnIeQ0R3Eyw==
Date: Tue, 11 Mar 2025 17:55:30 +0000
From: Will Deacon <will@kernel.org>
To: robdclark@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
	dmitry.baryshkov@linaro.org,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <20250311175528.GA5216@willie-the-truck>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173625436399.258197.10961901698600591079.b4-ty@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_105537_563086_CFA749F2 
X-CRM114-Status: GOOD (  13.54  )
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

On Tue, Jan 07, 2025 at 04:42:39PM +0000, Will Deacon wrote:
> On Thu, 12 Dec 2024 20:43:57 +0530, Bibek Kumar Patro wrote:
> > This patch series consist of six parts and covers the following:
> > 
> > 1. Provide option to re-enable context caching to retain prefetcher
> >    settings during reset and runtime suspend.
> > 
> > 2. Remove cfg inside qcom_smmu structure and replace it with single
> >    pointer to qcom_smmu_match_data avoiding replication of multiple
> >    members from same.
> > 
> > [...]
> 
> Applied to iommu (arm/smmu/updates), thanks!
> 
> [1/5] iommu/arm-smmu: Re-enable context caching in smmu reset operation
>       https://git.kernel.org/iommu/c/ef4144b1b47d
> [2/5] iommu/arm-smmu: Refactor qcom_smmu structure to include single pointer
>       https://git.kernel.org/iommu/c/445d7a8ed90e
> [3/5] iommu/arm-smmu: Add support for PRR bit setup
>       https://git.kernel.org/iommu/c/7f2ef1bfc758
> [4/5] iommu/arm-smmu: Introduce ACTLR custom prefetcher settings
>       https://git.kernel.org/iommu/c/9fe18d825a58
> [5/5] iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500
>       https://git.kernel.org/iommu/c/3e35c3e725de

Hrm. I'm not seeing any user of the new ->set_prr*_() functions in
linux-next yet. Is there something under review, or should I revert this
for now?

Will

