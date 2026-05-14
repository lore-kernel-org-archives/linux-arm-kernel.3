Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF3CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EJq986NsowAqF9WATbjsdxBBI0UfVkG0YXeNLvM2ME=; b=FrV2+2l96RwbkztJC7BBkTepUh
	1kasBP+wXlfbkUQds6aSiIW0SBQNhvrJF95HfVAVVLTtDrKWQMBH6mrrjQNkU493u1QwqSMz805+p
	HydsM2I2ydlprZQvXZcWoQHaokabtF2i4Uoy+LsEwWExbhdUExzcZ0xyqunBB6GNLTkZOdt6EkKmw
	AK+nLmvn3AwjDy/i3wBik5I4UizGep3oIEVCWWEZJ+mJbosm8dDz69p3kobvwQwkIf37Ph7ng+Dkv
	tacQSITI9pHK5FbOwl+zD2KwspGXssQa4B3zj1rmc6NMCmzuK2WrmKtb73tbdy/Mqq3w7tTFY6nCP
	VnWmCPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT50-00000005ANU-41B7;
	Thu, 14 May 2026 10:14:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT4y-00000005AMf-26b8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8273402D3;
	Thu, 14 May 2026 10:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33276C2BCB3;
	Thu, 14 May 2026 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753647;
	bh=Ai7USvYvyJ9yhKer/xbhmzZOEjs1bRuuZfWyxxvYC4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IacatgofsSu/xqMZZklpNnXJdSI6nAIFlYlPEa1NbsS4Re6tjRYW9t5HGe67WIYmO
	 TbIpb+0X7geOY+djEwTG5BKm9WwrYEPlxvHO8TVG+EtO0JYelydwZeoijdZ/NhkGCA
	 9Za80pixVdYNyZ2RojmFuSdxPruh+5GvCK6gACMCjSi2bcwLJsMU/cLEFhD0zeLaBw
	 5t03HMvrg5HppYP40Rh2d3s4jzv1BzV9W1xoX7NgAUysugDYj28+d6mZdWpTVycE6E
	 g4oQUCCPSiGS9YOrcJQaetaPfEOjjos+McR5G2lXUQ6PZNVRhKPoYyx17XmWMaeuAK
	 lBhSJBeeTnU/g==
Date: Thu, 14 May 2026 12:14:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 3/6] dt-bindings: arm-smmu: Update the description for
 Glymur GPU SMMU
Message-ID: <20260514-loutish-roaring-fulmar-53cbab@quoll>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
 <20260513-glymur-gpu-dt-v4-3-f83832c3bc9a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-glymur-gpu-dt-v4-3-f83832c3bc9a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031408_556525_D81DA71E 
X-CRM114-Status: GOOD (  10.20  )
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

On Wed, May 13, 2026 at 12:51:20AM +0530, Akhil P Oommen wrote:
> Add the interconnects property to the common SMMU properties and extend
> the sm8750 clock description section to also cover Glymur since it uses
> the same single "hlos" vote clock.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


