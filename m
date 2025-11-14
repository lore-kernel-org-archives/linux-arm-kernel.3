Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0D8CDE020
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 07:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1LyxIfzecB58WhHyvKml97szj1R7tOOpgs5ctfmOkY=; b=QkBJF4mDWv1D+SKVB89k9Wk3Ob
	fxQr01QvgWmz2FKYB5FLYJtHUrxTMw9IS2eTMQY2bdbaopvRUaXWSltBAdMqnu8lNftPYqtJrz1Zy
	N8Zd/wpIlXcq/ApNrpWJ/aZYMMZIggPAYXjOjtNVDPYRKZpN6ZXO3vIRcNxAl4lEWE/L8cvMs6zAM
	Iq21G4CPVYNz7hWrKGkjCHkEVJ25HZ7CJc7YfBXS/R/yX9u5NuccR9y7KH6B5Yxtl1SzoycmlD2t1
	J9vLX2JGsbMbJSnive6IaNB54qVO93d/zbL+P6E2oHwCT8E60Csmkw7A2gp+ikajTYzoLW3o5qhYd
	ZgQvfyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJoWT-0000000Bm0L-3O8c;
	Fri, 14 Nov 2025 07:47:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJoWS-0000000Bm0A-0mQu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 07:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37FAF60127;
	Fri, 14 Nov 2025 07:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3B9C4CEF1;
	Fri, 14 Nov 2025 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763106426;
	bh=KS+VcO/NTMZzXSDvNP23TtVP+SjCFQ9HliVU+Se9klE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrjLvpGY9ZtMNfRbSPRpEaPKz4dzOPNPThw5cZ9xjU65B15xf2Jo5Aubz8cS0ERcE
	 ncTWY/ZI5nAnG0H0eBfetkm0jwty0SCzjnSYrEL+QR8XCi789VW4IeSadplEOmLWUS
	 +hhTVprQ1mUi6R017Y5xTvSqdTfHRGBWXjUaVyZlRy3A2PwTXGcwwxC5heiU/LpQQ2
	 IXabMdeE2HRfZcjEAer4to1wQ+jRhCsql08OJ1RoAsTNIE+z9Y5RgOx38So4GiAuFC
	 a3ndCVZZBEcJbUA5p6gzjpGJd4RfgBTtBzYHPg5fDJ6n/m14gn75xkt0+C/sind/jp
	 dIijx0E9vUj2w==
Date: Fri, 14 Nov 2025 08:47:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 18/20] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
Message-ID: <20251114-astonishing-marmoset-of-performance-33cdba@kuoka>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
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

On Fri, Nov 14, 2025 at 04:59:15AM +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to document the GPU SMMUs present in
> Kaanapali and Glymur chipsets.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


