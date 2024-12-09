Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77371E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWFu622FYsDD/qTEPOBOkM8k0hoWD5ZKFY1NpkHqeg8=; b=dYkHkHpdd+Ys7FUVfEUUyDsrNv
	5AXxchGnkkSs9DGke56hoeARnLmtJxp3hekBvYNvawUFbYQ9zvA5AIt93lqNx2CbkVdRyQXtfHmml
	pVt8OjjuRb8gmV71V3sRYVE8wktaNXS0gBsWOgL9bx4YViC9OtjjCtC6qvbICrCFUh70SP0Uh8yN1
	D1TaNnMW0i4yhaFeDTF2tSTdxV1SWggXIJ+I/2V7Cp4C86HBUC+fr/UJ7oGyH02aJzHhu8o6BLHP0
	DJO0youGL0HahY2dhREao+4tBDPr60g1X1IMDZi1IZxhjB4iKxQ9ylRDss83eBmtXs1FCtsKNnwWy
	D0m9cz4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjRq-000000093Si-2Qus;
	Mon, 09 Dec 2024 19:29:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjQn-000000093CR-1Lxt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:28:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD34BA41906;
	Mon,  9 Dec 2024 19:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845FCC4CED1;
	Mon,  9 Dec 2024 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733772512;
	bh=y1PS3vCZPcXrFlz4qQcjRUU8em10d57GeSZKnlpeRpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlLkSEct9oZwOI28pznT8pybo6CA0OucG4Jos1P09giB7y7H1u6lKsoYsKPhc3NY1
	 nPYU5SCJmoNsP2yJkuMlxdLJ+CKS8/1i519+yVIHkM4vY9jO6zSXFt3AevzDVQBeyV
	 mWU6LkXhN7ehdfKnPyfglZw66ygeFwQ2qQqc9izSvWQ8D3Hbt5tKDwFxXU3PtUVFyN
	 tj11KvkcxfbiGFDhxz+pvKt2i+Td+iXreF62k2nPbrgFUIJkTNcJu72gzdy9mPCqO3
	 c+Y69IRpZeg9cW3+qV5hbmuq32SrhxRe11l1jzuf6W47WatJ4QZBGlLqKAV9azodHF
	 Ib1HPcCD38hdA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Date: Mon,  9 Dec 2024 19:28:24 +0000
Message-Id: <173377135109.3922978.5202199234250494714.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241114004713.42404-4-mailingradian@gmail.com>
References: <20241114004713.42404-4-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_112833_428030_85EED5FC 
X-CRM114-Status: UNSURE (   9.14  )
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

On Wed, 13 Nov 2024 19:47:14 -0500, Richard Acayan wrote:
> This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.
> 
> Changes since v1 (20240730013820.41702-4-mailingradian@gmail.com):
> - explain need for specific compatible in iommu driver patch (2/2)
> 
> Richard Acayan (2):
>   dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
>   iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
> 
> [...]

I applied the bindings change to will (for-joerg/arm-smmu/bindings)

[1/2] dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
      https://git.kernel.org/will/c/87cafa082ce3

and the driver change to will (for-joerg/arm-smmu/updates), thanks!

[2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
      https://git.kernel.org/will/c/423147389063

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

