Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16570C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUVvKjrO5CilP0Dhdnmye4vxFJhvbGovkQ7n4BbuuAg=; b=nu6JP1Va0WMO2d2XUsPbjYpd7V
	Bj/SbJ2yN4HzLrfYuNIPT4dcxxQzZnmNNUD9iVhWK8SmxdzRZD0OgzN0ayC5BrcecVXPLEuqKQnmm
	5U5alWOTNWwhLqXbv4Tk7iGWouQNBwowNSDbBo+fZBuMH3bdgkbmW6wqk92Lhp7L28Kh71Duvm7iq
	4ZPygvut3VVY5kZ5l4jkZ+6K6VH1iOl8n03bFc/wNXzcSuw2IN/Uf2FAv2Cweqcyt8tWklCgZkphV
	yC6FCPx6qaJKXpvvLMoIpH1Sy8WgizKf4zL9omDAvZkqHFlivNMzTB8Zvufp/Dro5zGjEsQ8Zy0Uc
	PkPwQm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qJy-00000008HJ8-1yfv;
	Tue, 08 Sep 2026 07:32:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qJw-00000008HIw-1IfE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:32:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 505DE601DB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 07:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E881F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788852763;
	bh=BUVvKjrO5CilP0Dhdnmye4vxFJhvbGovkQ7n4BbuuAg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LadyelDWcNtzqn2pNDPzvE2ycihraLgBZJHb2jgVLHZZXzxgABvvuAdH7JVsF0ef7
	 hOCOsWfZgMq38Hw97bgA4s5aD6TcqNRa3uSb6utMDdvzy9wJ7f79H452uu5XmX32Lf
	 BsVMBAce4AwFBaI6PVcKTdCAwZd/MD2v0a+Blri6jINnKmNF0uTg6eiA59HZNt0sqd
	 pNULmwRPByHIr8/0We3MvslK0s5bWBbvgpsaV/RX8s67xpmG+NiDvPfGuJe+szXdD7
	 eB7t0Fyd46VQ/Pt0cnLJZJaHIdNmDjg6rmuK0nZx4Ckt63GBjxffjSD/6cVwmwVvxP
	 k4OW5NDiHLmbg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1eb6fa0f4so41684401fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 00:32:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrnf40aDv1YerZe6Q0QXjYAxhY69M6GwW0qeT3zSW+8II1GfLsctx5cPZeo9Jk+mukceAP3kb20FSL8qX4yj5L@lists.infradead.org
X-Gm-Message-State: AFuF++k9a3vCeyq8ptw/Oikk7Dgy17qqgAefVTeZgkkEI9P2/zTQuV3S
	aYH/BGY//MpfeO/m8xJsW6/b1bm2LNFogyXENwHOah3heweIzqLQ+zmO3Gy7FOIiC1J447D0WtH
	Co7PNvbTyrRPpCAKz4Pold2Jp6AvyVzXBk6Ghthwx8g==
X-Received: by 2002:a05:651c:222c:b0:39f:ef09:bc55 with SMTP id
 38308e7fff4ca-3a371b30ee3mr58920061fa.3.1788852761641; Tue, 08 Sep 2026
 00:32:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 02:32:40 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 02:32:40 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 02:32:40 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me9AcVByS64-AwW08wPyHHnL=73E5N5srPzTSqusMHMTA@mail.gmail.com>
X-Gm-Features: AcwNN1XHgy9F2mNEObYLvFmWhv5aBUGsku_NoIXOHxOBjg8w5SFRiAiimbjLAiE
Message-ID: <CAMRc=Me9AcVByS64-AwW08wPyHHnL=73E5N5srPzTSqusMHMTA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 2 Sep 2026 03:38:58 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Add specific compatible string to document the GPU SMMU present on
> Nord SoC, and constrain it to the single HLOS vote clock.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v2:
> - Add the missing HLOS vote clock constraint
> - Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/
>
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..214a9c051588 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -102,6 +102,7 @@ properties:
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,milos-smmu-500
> +              - qcom,nord-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,nord-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

