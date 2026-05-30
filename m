Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C486CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6iJ03g0GN7RPUEqnMX9QzrhnN3t4K3RUDcacgMvbpA=; b=KNWd26CSvMuBK5np88jDucI5Jx
	L5zKQISouZktUHKDeRGBMJryMILtv77w2KH/i0EyBuaWGpDrQEGd67ruDgtMJsof+v1mtNLospvOq
	rtwVgXcR6ktzWHOEqLkAPt+8E0LC8YdzSymF9dzDfuxq28D+aNIaT/PVGOIaD3mPEQGCpqHIZlKvU
	FHgZ8rWJMCPUp90bQZMD7PxoCPlZRyhWdkUClh6DuO6F2FXGsIj9b2muKdx182EBkKE7Uk6ZfKG1c
	Ga4gnlVPBFmQHS3szNwQ8ccYcgU/kYH/9ZxyYQv50YfhGSGMpKtRAZDi/rPfqlYDuaBI58hHveKcv
	ltoUgrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHy1-00000008gaM-0NYl;
	Sat, 30 May 2026 11:35:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTHxy-00000008gZw-3hKk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 11:34:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D1A5402BD;
	Sat, 30 May 2026 11:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AE61F00893;
	Sat, 30 May 2026 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140897;
	bh=r6iJ03g0GN7RPUEqnMX9QzrhnN3t4K3RUDcacgMvbpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=imYG6wHpndrIyG2kUXah98OBeOwxAQDxY+wnIJP2tmdT81J8jrlgyC9zjchdYinrp
	 qrUwgYBT9G5apv8isIO+ZfnGbXbykqDUC1FDnE7Ay5q/2UR5W8EZyOe1i0mxgZPKIy
	 iIPeqjCEDwKD8nsV8rhLLHL1+Ev5/QAyb3zCLONelalhQa4Lpq9RpJtoRu/3SLYSQ6
	 UW2ecTI7wyeuNZhHfcKVjz2R1WFhmrbOJVHtcx+VcYPUS6Py/4NsxZwC+CbRiSRC4d
	 qL01rbpeAjc9gEJmvEQSKpvHrqY+MAWqSYcPSuE7/rMcGqnz1mvNLBj+QYcfzF0z2H
	 psI/LmsNcVEUQ==
Date: Sat, 30 May 2026 13:34:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Suresh Vankadara <quic_svankada@quicinc.com>, Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
Message-ID: <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_043458_961964_73F91674 
X-CRM114-Status: GOOD (  16.05  )
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

On Tue, May 26, 2026 at 10:42:45PM +0530, Nihal Kumar Gupta wrote:
> Shikra uses the same CAMSS IP as QCM2290. Extend the existing
> qcom,qcm2290-camss binding to add the qcom,shikra-camss compatible
> string.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..7b1469d6a1601413a1a32dc452d7d1fc85aa9eb8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -8,13 +8,16 @@ title: Qualcomm QCM2290 Camera Subsystem (CAMSS)
>  
>  maintainers:
>    - Loic Poulain <loic.poulain@oss.qualcomm.com>
> +  - Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>  
>  description:
>    The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>  
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss
> +    enum:
> +      - qcom,qcm2290-camss
> +      - qcom,shikra-camss
>  
>    reg:
>      maxItems: 9
> @@ -76,6 +79,7 @@ properties:
>        - const: sf_mnoc
>  
>    iommus:
> +    minItems: 1

No. Same feedback as before - you need to describe now the items if you
claim that there is distinction. I already pointed this out to Qualcomm
at least two or three times.

Best regards,
Krzysztof


