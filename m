Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0BCCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 01:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqB3QahS1nrkqDr/lqGKxg/t0WYYSWXX0SgF8JqJc0Q=; b=V4ubs9IZpdE7tBzPynp9MXM8OC
	8audzR7PDF5bRAipf8ttNvyxsRBSuRX6pE7y2tkZSEqosH1uNUirCOJoYmZcKF0mr/6xow911F+zB
	yuHxCqXStRRO0q6ENEcaYQrQbVdDuzgXAkKkVrYoQRv5PE9pn1PrBpbWhS1yimIMK8bYv+ubaIuyB
	WwReO/cZS6DgNM8Sib7wqXDpjYH/6gVvBacmql1KGA/A0hjdGvMbyao3kWUB+KQZmZ01GKi72iTHQ
	GUSG/k0HHSD9knMfUlmOOcxhPtqRczm4tGhrlRSD1i7I8A1t/6UAc8BYDeTvgTfF3x11tlfkVOalw
	PDIENu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5wA2-0000000160W-1n6v;
	Tue, 07 Oct 2025 01:06:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5wA0-000000015z5-07HQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 01:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6425459E5;
	Tue,  7 Oct 2025 01:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CBFDC4CEFF;
	Tue,  7 Oct 2025 01:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759799195;
	bh=udAwqmPlvLpoTKxdXhd/iHxSrAV/aOnuJnJ4qcFUSk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLliQOXLokvUxwlRReyLimgj6aYOZ+mBXOBL9ot10DjLmtjTfbnlqdnooZwLrfr7l
	 LzVT4slr6VR0+VTstaLPLg1z0XmSUX+52YwajRHE2txrNIdA1RcKulpPmNVq+YLzev
	 sM1dffzmruPTzKSNOG++2WAewRwO9kivYHpFaLP+80ZWr2HsJxzYViQhOGfwDjiyvZ
	 UWFXIZ/eDTm/nKOOvDvebQSkMEoWbjKDlLcSRngKIIp8G3I3vLohdWIBibGyN9FcIa
	 oqcW80jRQlh1JFuNGMRMHITlcMcF78pjqSXnIR49GiV4BRYnEqDT+9ln/woHCdUKVZ
	 ly652VN4e28Yg==
Date: Mon, 6 Oct 2025 20:06:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
	iommu@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>
Subject: Re: [PATCH 16/17] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
Message-ID: <175979919379.698258.13712668305314906075.robh@kernel.org>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-16-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-16-73530b0700ed@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_180636_086081_1E9493C2 
X-CRM114-Status: UNSURE (   8.87  )
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


On Tue, 30 Sep 2025 11:18:21 +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to support the gpu smmu present in
> the Kaanapali chipset.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


