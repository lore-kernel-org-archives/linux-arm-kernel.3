Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C13CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GJcj0puvXJ2NX5TNsfEkpFArqZ2b8JXqNEm7oUpzKY=; b=LT5MseWRXEZxNkqkty8b6wNAkY
	dajZJXEvcc8sY54pnjOsdYjNnFlq4/KZDfSeVzecvoCDzEtZX3ULYOPS658YdoqCztNh6zcsu4cVz
	gaCTmeKiMfnD62LR8Ve6+KChnPoWJEmks+Xz0xpHtP/VXRxjOoOC9bAbTjdAdeFgw+DE3VYMCP3ge
	lScdizRAMxHcerjhVyH9kI7ENp5rz8riELvtOmgAZ8HmMXfedGag3tD1fB7o7GzUBkU38hPD8QUMk
	7cKe5PNwSLYtudevOpO8cBhdsT2MGuDM8KfBQZkSpA4v2Gd5scgxGcSagL6MlnGFMi4rM5dznlwYo
	kr3Mlsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMmf-0000000Cwhn-354X;
	Tue, 06 May 2025 18:12:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJ9K-0000000CIBj-3iNP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FD125C4BEB;
	Tue,  6 May 2025 14:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1F0C4CEE4;
	Tue,  6 May 2025 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746541197;
	bh=mTMRUMgR4L/7RvmPvU/2UmZ78JGiv9EeVU2GVr4rwT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjKpFh6x+eNnuikWStC2X+QGu1Fl0efOWw++cCFWdpDStaJJsRlBxvrhHbsLt8th+
	 YkqLKUIUVSIzYYURi0ngt9sUpNErDhsod0lN+41Z1wNjdrT6fI/2PH9i/5S6nLjKn4
	 KHB0jCRiniVTa6PqaSFdT16ATwKV51S47DKjDRc8v8YLEWT4U+RpaIivsw4NxDlEMB
	 onLFp4YsRE7SJfcz2zs/JY6b9IEvpUqOgEkiMeykztAJ48sM60fZ9v6Um2lXAcnm1T
	 Nl74zX5JyeBVL1E0HnrCQVL8L2e3iWHfnNRZ26cMEMM1bAfrveFOSulD96tWCGnfuh
	 i0bnNYruJw3Hg==
Date: Tue, 6 May 2025 15:19:49 +0100
From: Will Deacon <will@kernel.org>
To: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
Cc: ryan.roberts@arm.com, suzuki.poulose@arm.com,
	yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	paulmck@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	kevin.tian@intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: Re: [RESEND PATCH v6 2/3] iommu/arm: Add BBM Level 2 smmu feature
Message-ID: <20250506141949.GA1197@willie-the-truck>
References: <20250428153514.55772-2-miko.lenczewski@arm.com>
 <20250428153514.55772-6-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428153514.55772-6-miko.lenczewski@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_071958_966242_79B91A06 
X-CRM114-Status: GOOD (  11.63  )
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

On Mon, Apr 28, 2025 at 03:35:16PM +0000, Mikołaj Lenczewski wrote:
> For supporting BBM Level 2 for userspace mappings, we want to ensure
> that the smmu also supports its own version of BBM Level 2. Luckily, the
> smmu spec (IHI 0070G 3.21.1.3) is stricter than the aarch64 spec (DDI
> 0487K.a D8.16.2), so already guarantees that no aborts are raised when
> BBM level 2 is claimed.
> 
> Add the feature and testing for it under arm_smmu_sva_supported().
> 
> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 3 +++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 3 +++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 4 ++++
>  3 files changed, 10 insertions(+)

This looks fine to me but please note that it doesn't apply against
mainline (v6.15-rc5).

Will

