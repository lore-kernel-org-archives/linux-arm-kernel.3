Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC52ED41D46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VolHPGwzyzWXHH7WDKvK/ITQahcEIxL1w6M06zCzGt8=; b=2hpE/yOhu2gfoRnhZZtA3ExA/N
	I6sDxn2WPGcRFI70HkADRq9j6rUJKfDhx0+Qo2NB28law07QezEPgPzSCbXtvj+pK8cEdLn+Cy49q
	1ZYMht4NuVjju0xgNe3MNGmL47bRaN4S6Lcb6C8vlrsU+6Dn5rU4FLK+Y8cf0PAPTbm6y1TworenB
	/CxSgWXV47EUSdkSZtN9HOC0JwZeYxXnIM7HHrhKgX3x93IhqbeEECA+EeengJUMsFJcO74IXyqul
	E5uwqqgfRF6lcVYe6M32xymdCJgi7PUPVHtrz/MOtxBtBcGSjO5vM+hA6fg+6rOKIDsV1jBL+zmF4
	ESDuernA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZ7b-00000009w6k-3jkE;
	Thu, 14 Nov 2024 12:38:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZ4s-00000009vlh-1UCM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 12:36:03 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53da5a27771so572991e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 04:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731587760; x=1732192560; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VolHPGwzyzWXHH7WDKvK/ITQahcEIxL1w6M06zCzGt8=;
        b=VFIfrIfpXIK3HLibW6Xla+y2hyMd4vqF3J6ezoQp0hQIAIJm59bAu0QSE+777TWlDe
         Zyp8o1i1DfItf8MtJba2usqI2p/842+70euf5sX6veKhPHFpjx0PJZWo83Cm2nQrrZyF
         DPiB+YCTqvLKHT+BAVDMmghgJr7eFaTS+4PM3Mfk6X+AD6VF2ueJXF8sxD8jHhW1SxSv
         /CUeAvOenXPdUvBhWn4Ia1B2cKEQH0ZzqkqaZ5CkcgtQ130IZ9YarNS7gCogqlgSG3du
         fiDf4fB9t6ifQ5NzQVZc4/jVt3pUorFiJuAHzYRrMhbMcEa3b4XG+MjzBlRGrD3CTJ7F
         pjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731587760; x=1732192560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VolHPGwzyzWXHH7WDKvK/ITQahcEIxL1w6M06zCzGt8=;
        b=oAJClfi3DYCW9qSyuKAdm4qPYhI4TIGa1KBbzix+sqhCnvnl19HFyyQxM4rLMs/fPh
         g4dJGXLuAPpTzOTBk3xKjC3x6UrORdJ38C33Pcc8wdDSY3GaLrcKlKbBgempE+ud0Dhe
         Mmwze4OIVYUuUQSjTXDCTpuEePTSuDfc62P+atO5iyJuUPjZZKxF8T8Z3FXZDt5kXR+R
         0aqLqm4e2HJ4Z6F/ZVKWdILyOM/s3WOoyAfji3RazxiPcQW23D3QnkRri/27jkH9ne3/
         FF+DQXM1eamOC+/NOBUz3FritgNPHtEtyOxkTh3/ZqnZy8voFxMAM2pAjR86+Ha2NB9u
         pY+g==
X-Forwarded-Encrypted: i=1; AJvYcCWZ85H1oD6S2LB5gdUG2y3AojRaaSZYRcb9FaOWeA7SvKAw+EGADZkoKOefjBqznK6E5Axe52xP566T2BPl4CHe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9giZInfdHgTy4pz3VBlVdLJavYmWKj/scfzmJ8I2FuG9iLg4s
	l6AB8F81EO8aGArjI55dxh5i7Ia7hN3ic5ZMjGqn90Lg9hEIDGXZMOn0/hJBob8=
X-Google-Smtp-Source: AGHT+IGi7UOzSfwh72ihUwOGEexWy2JMnijNfqGBkqGRHqPGSrFGRfh6xQPHDoXZUsDQNmf4oTaytg==
X-Received: by 2002:ac2:4c23:0:b0:53d:a86e:4f19 with SMTP id 2adb3069b0e04-53da86e4f40mr648491e87.25.1731587760466;
        Thu, 14 Nov 2024 04:36:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6530f62sm170210e87.166.2024.11.14.04.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 04:35:59 -0800 (PST)
Date: Thu, 14 Nov 2024 14:35:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu
 compatible
Message-ID: <4lpz2sx3ikvdpb5dv7qdovpsfm724kc6ibjtbmmxaajtwemr5l@xtiaork4hy6e>
References: <20241114004713.42404-4-mailingradian@gmail.com>
 <20241114004713.42404-6-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114004713.42404-6-mailingradian@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_043602_438478_44AD34ED 
X-CRM114-Status: GOOD (  19.39  )
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

On Wed, Nov 13, 2024 at 07:47:16PM -0500, Richard Acayan wrote:
> Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.
> 
> This IOMMU has the compatible strings:
> 
> 	"qcom,sdm670-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2"
> 
> While the SMMU 500 doesn't need an entry for this specific SoC, the
> SMMU v2 compatible should have its own entry, as the fallback entry in
> arm-smmu.c handles "qcom,smmu-v2" without per-process page table support
> unless there is an entry here. This entry can't be the
> "qcom,adreno-smmu" compatible because dedicated GPU IOMMUs can also be
> SMMU 500 with different handling.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 6372f3e25c4b..601fb878d0ef 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -567,6 +567,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>  	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
>  	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
> +	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
>  	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
>  	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

