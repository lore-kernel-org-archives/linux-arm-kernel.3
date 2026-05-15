Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7CFCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvVQDkJzj631WklGz6GdP4eLnQNFRHPWrTX5D9hxmmA=; b=qsljW7sYCgv+pc2irG7UWrjs4f
	lkiwzRv0XW9va3vTaIqUVzNtK4MlJmW2FMsoNFIR5/+jEjr4XncOVaoyCANCygMEstlsz5QEfj3Xr
	VShx9+3Cq0tc/E2oSRWjSjPAMMImsq9n+Hm7DG8gbUJw+6fkveQBN0e95op6aHKXEq4muhtUFEXhf
	3YLcZ0e8UpSl0hOzdp/TgukmIecIYorzD0opKvGgdS8PYPVu5/4RHJactPxWvldxqP1pXcyxPoV4u
	ca/la+49Smfu91AMn2SFaW00/S5HG/nldZ43KBHQd9w7xJPR2KVxgJcDbOxuUQPIpXkiFy/DcNeXj
	7JmMiy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo76-00000007ld4-2GQH;
	Fri, 15 May 2026 08:41:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo74-00000007lca-0fh6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 08:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64CB04098E;
	Fri, 15 May 2026 08:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA76C2BCB0;
	Fri, 15 May 2026 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778834501;
	bh=aY+I/LTAujFm+hDwZi1iHm/T2SvWphqZsDt1Qu4o7K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRN7HuI8F/a/wkF5ZQMN+bjdRzVs5CGPHU28vmycUxBHRi/o+yl6mzyI7K0EaOrbX
	 xcqkcorF1nR5zCVz2nEy4IEle+hQKtJEtG22BbgZBL+T+HiK8rjGkkpr0fQppTStLD
	 HXLweRFTks+nwQw6i4PpMGjjn5IbfUGRQptc+wYTKY45G7/0usy2ppltNfIZ2566bG
	 GZtBckNeBuHCwwuAq9BwIuYf6sdiEOPtXlxTBH2VjvavoQQP4GY20nVkB0ygmGZYME
	 u4PLo9k2xrvRdiWYOnbc6XEN+gS2scQT9gffMtGvhmuy+qgPpYCe+dyg6/tpj3aEDe
	 kfQUR0qQAL2Lg==
Date: Fri, 15 May 2026 10:41:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/8] dt-bindings: arm-smmu: Update the description for
 Kaanapali GPU SMMU
Message-ID: <20260515-reindeer-of-original-skill-cb55a1@quoll>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-1-13e1c07c2050@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_014142_220806_4059E4B4 
X-CRM114-Status: UNSURE (   7.91  )
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

On Tue, May 12, 2026 at 03:53:15AM +0530, Akhil P Oommen wrote:
> Extend the sm8750's clock description section to also cover Kaanapali GPU

There is nothing about sm8750 in the diff. Probably you wanted to
document the constraint of clock for Kaapanali Adreno SMMU?

> SMMU since it uses the same single "hlos" vote clock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Best regards,
Krzysztof


