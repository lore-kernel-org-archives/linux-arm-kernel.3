Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C478C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgG06+fPhBUefxG+g15sZ2YExh0h/ruMjb8SnPH6H+g=; b=aKlowj1LpbLlYGkvdTBDz+/xHb
	oy1JgEU4sGYdpxYKZPFByqRPyBrpZNHAnx2z5pl0IckcvFLL2WpDTydVWXG+8AIxjtOho6X4Dm1hD
	T5xQ+0cHYhFkhQJOI8WIYVf8852EbV7n6Q1g1ugw8nrxJJ8G/aP3sZclZv3Tg0hsj2enZ82BTQ/XL
	gw80BoWddOvU5RaPQpXKTAan0l7F0lkshoAomda/EJ5AU9xOmQ7FKRQSaJS4sY0ZOoQKmUbAUJvmo
	/4171yCXRKv9JKzmgdWvXkm/InCWzYaHFOwYlkSk6ER45MlomdYdZh/XY1a6GY2YiujfVc+9ZC2T6
	7sjKCr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcwt-0000000BdNJ-1f73;
	Mon, 06 Jul 2026 06:36:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgcwr-0000000BdMw-1MEA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:36:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD46C4081D;
	Mon,  6 Jul 2026 06:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7465C1F000E9;
	Mon,  6 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783319816;
	bh=DgG06+fPhBUefxG+g15sZ2YExh0h/ruMjb8SnPH6H+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ljqRKau9DCFpA3AklvnxUyEXQF+DlQ4bo0jmiHb9FTBi0BiNyfJlYGIAoZKmmV1Rd
	 78hccCK9z0lFtUb2/08OsSZNR/Pi5+h/5rLi1hpnrxlMtDgVjOjbPjDIdKLjtaahIU
	 GpIZyvi3nllQMc/bgvupFzCbkdpIl9wlgqyHvtWeh4fqfkOquRJ8EGp/Qvwgl4xxzu
	 3O5NWIkBJzsu+bWpTPQjhXAa8IUEwO5O2xHAy4S52J3Ys0V/u29PSPLAcMu2RPUsyE
	 EwyFBcFZXGkNSl6z7c/nlw8dmQ40+1esWLB8jmB4ETd0kbE9QCw+0B30vYu34Ozvdf
	 2NdYKatgV9IWQ==
Date: Mon, 6 Jul 2026 08:36:52 +0200
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
Subject: Re: [PATCH v2 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
Message-ID: <20260706-radiant-shark-of-calibration-ac2d13@quoll>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-2-6ac53de56314@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-kaana-gpu-dt-v2-2-6ac53de56314@oss.qualcomm.com>
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

On Sun, Jul 05, 2026 at 01:30:06PM +0530, Akhil P Oommen wrote:
> Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
> It is a new IP which features the new slice architecture with 3 slices,
> raytracing support, and the highest GMEM size seen so far on a Snapdragon
> mobile chipsets. Update the dt bindings documentation to describe this GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


