Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C46C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IED6QZNQ0APBb2RT+lZieni4CjI0wDzgvUKFq8gCmw0=; b=nZ89gM05AqYqdT1DaahdBURx9J
	yZViQ0eNyIH1opMJAGJdhyTTp5ZRZG+IKmgVx2+Bfyl/HCUU9MIxI4/ZAnxg2klEe+QmYhrKsHBgY
	2QuAe6tMD/a861e+O4J7KtOv3WTqMYLRF7HIDb3HIEB0k8mEpm2Dl8tSexPBWTkc7wD99yQyxaYsz
	tfjtYfB8jf3rwCka18K3EyNw1T7+hmvmxZ2QJ/+adWE1fPZyE5wQeyYTVDlmssjWsIHq/4S7VSouF
	0RoTALfwjcGKrqQX/legWfMvJJ7Fncolvgg+slQZD60kNIUpp8iCblt0eljI4WxHypsYZibWdTrH+
	0fXvhMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdGZ-0000000Bfw2-1JLk;
	Mon, 06 Jul 2026 06:57:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdGY-0000000Bfvc-0Qp7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:57:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 909C34125B;
	Mon,  6 Jul 2026 06:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6CE1F000E9;
	Mon,  6 Jul 2026 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321037;
	bh=IED6QZNQ0APBb2RT+lZieni4CjI0wDzgvUKFq8gCmw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kpry7HAxYLJsH0ML10AxcMpo8KxAyeapJlQMnPgDFWzIbZH/IyYsGX/Jj/Bpb6iPD
	 Ziaw8VqdWNEuZEhsltRuIeVVRYzoNMX33u3oIjvMHufuOfIhqTq4dfcd9tBhgsjnni
	 CJUYqKnLZgdhYIZoLUaYz9GHNPCUMH1ARtay3rHOC1ZsRgTnrkoOTsFeMqUX/JuYw6
	 TbomheDZUMqTjhi3+bu/Yn8UmPoRdtJW0y5Tfcs2Wxagni8AsEyfDERXnaNY5UzHHI
	 bU+OGc6qo0OrhxGDxB7SMTUZ0Lhy2rIsHKM9JEs5yHBDyi7SGKwPmASlXTT8S3qo4A
	 vIITuQM52GChQ==
Date: Mon, 6 Jul 2026 08:57:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 5/8] dt-bindings: display/msm: Document Adreno 722 GPU
 and GMU
Message-ID: <20260706-attractive-flawless-otter-fdc7d7@quoll>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-5-c9f1354dbd29@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-5-c9f1354dbd29@oss.qualcomm.com>
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

On Sun, Jul 05, 2026 at 01:44:20PM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
> derived from A730 and shares the same IP-level configurations: HWCG
> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
> Major differences include lower cache/core counts, 1MB GMEM, no
> Concurrent Binning & LPAC support. Some of the peripheral blocks like
> RSCC are from A740 that resulted in updates to RSC layout.
> 
> Update the dt-binding docs to document this GPU and GMU.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


