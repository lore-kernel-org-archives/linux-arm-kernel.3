Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F08DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 05:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulAMfJbRFBT/fSAG0Qg9z+1DBNf6VyZHT1tEXJwkloQ=; b=sdOQRyFxFhU8ekuM3onfDxroaH
	ITODskRQigkVp7Mkuo7Qr/gRAnWgRCWZHmZRMdkuoAN44tMZP/63R1oQN77yYLZUxzPE5HmOhDZZg
	pxXqeeIucJxDgYhDaLcXQ3YVgfMVvTHLZhoyydwk9haPYwC8RqgpkBt7z2eF5soaTY5MYxIl7TKKG
	LD45142kFtD8WaiXm6c/btyU/sjJO6R+Bn8FZFciE1hR3k0YUH8k/XhIrMxPwH+ds3VjZJSAA1VGb
	I/mRV308BKtYbwJ1mG8VspFVK+T94J8e9grQMjAQqRCxPR+TvyBmuFiMeT3r5Irs+o/ZnFq2vukRi
	YhCJhvXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqmSg-0000000GCeE-0h2V;
	Sat, 08 Mar 2025 05:10:58 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqmR3-0000000GCYQ-2IMX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 05:09:18 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-307c13298eeso30219681fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 21:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741410555; x=1742015355; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulAMfJbRFBT/fSAG0Qg9z+1DBNf6VyZHT1tEXJwkloQ=;
        b=IGoDci5QF2cRG+3jbdgMUWoU3uKQ6m1fCS/OeB2dS/D6nLaRxjECCiQ0K7GDLiW1BQ
         Nf3fqEZShawOYcdhoZ2VZ+JxedHHdEzOLjLnoShUEeAzfxHA6ZruI/v144Xo240ANRJ1
         BVflPWy9n2GbwrlJX/eYEDuVXWZXXVdRp+UY3MEun/1+//FmMTX5fPzeh1o/gZml6yQl
         bGqkDE4USM0mP+TPR9tbXIreB7rV6N6VthN6K8vbpi1oEMpiNtN29h3BLCLPalGT9fNZ
         94TUMgzOJ6umZgEXgQmhXvwLz8/P800drowx2M5Hf/7w2CkyWINtvGsr4+jbsltlxwXN
         OUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741410555; x=1742015355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulAMfJbRFBT/fSAG0Qg9z+1DBNf6VyZHT1tEXJwkloQ=;
        b=Bb+/0a5AgNXP/zzklr5FcB1tCD7OIhWEIz92HUnngj0un2Krd14EeKm48RD90GFru0
         z8mxjGRU6culWrC5tTDdR5CLe93wgRL9/xjWE6BtlJwo7f0Jw3CvpUl6fObqyPVEWtp/
         5u6B41VxXontiqJ0GS/RYBilxlEY/oZhzHrILEYPeCqOpBVf0Saoxf6u58ww2i69Fsd2
         3zpcwEcvfyfEsdrPN7g69MqYYO7qyopMpBfxTyLlkEG7WIfkPDTDQJl0N/Jo73bLgFzI
         Ok4N1XbxeJ69so757RtWXkKjf1KRLIEWvc8DyEcMRbPZfeCbWQ6btxlAmbZ3ASo0NAT9
         Qyfw==
X-Forwarded-Encrypted: i=1; AJvYcCXsUIpuPEhnmNy1NzpNBU/ueAi1j+onoIjzXlfMSzuVLwA94zlbYcU8UkoaChlOWO4ekHI7OM4g5oVyPluQKC5Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzUujpiUh8oRUtz7WZlP6WO3q1WFHsGJUjkN7HJ+tnbtm0tR7VP
	qGa+8kfZTkMAjE7TKtcdVsp0XVrXw/bXqdMZLBP0BvmqWjuHOKvmXl26tcO87As=
X-Gm-Gg: ASbGncs+u156BNXMvYLsjh8LkhEsngZpkvW+MgBlayF4rYcNGh81mhmXTaU5g6lF7mW
	NEWCw2WIsxtNI5UPpAjgoRGaThsUdAnV00Ipwf0XULc5+ha6trTbdSE0lcPNkjV9PSVNt7BXuz7
	tUL+GgYWCC3nHrg5iyu8/67U/Er/wWHet3y4rRO4VOEQmsRzGY1R5PgEVZi0W07OwfIZfy/P2hY
	J24GT8lnrDeEh0dhUIP+l08zUp5019V9XNXof6g/l2GmviehGcIGcE1jk97xRkTHQ+aofYNvula
	OYfW7AJpDxgylmmvHt+pTZAFfqH75ApVfxMkAsbZH8zy8XsKf3YpnWcLJ+Ga95lzvYHIQi4agQj
	lYz3Yq1jmEdeEdfvcwc/Rsv+u
X-Google-Smtp-Source: AGHT+IF7bjBB5aMjSIOWPIZXx3se8ZXwg6KEPXnQgNtkefZ48n8buFCzC0ExNuYMF9We4+jwIP9GuA==
X-Received: by 2002:a2e:be91:0:b0:30b:c608:22bf with SMTP id 38308e7fff4ca-30bfe429ce8mr7170571fa.9.1741410555213;
        Fri, 07 Mar 2025 21:09:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be98d0bf3sm7872791fa.8.2025.03.07.21.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 21:09:13 -0800 (PST)
Date: Sat, 8 Mar 2025 07:09:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, freedreno@lists.freedesktop.org, 
	Bjorn Andersson <andersson@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jonathan Marek <jonathan@marek.ca>, 
	Maxime Ripard <mripard@kernel.org>, iommu@lists.linux.dev, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
Message-ID: <nddxntwmiyurqew75gc6yoj2dcinhjqu36cdujhruqyrz62ry5@4e2y76ghmo4h>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
 <174140525677.1770282.3232695979994091275.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174140525677.1770282.3232695979994091275.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_210917_600456_61675999 
X-CRM114-Status: GOOD (  22.31  )
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

On Fri, Mar 07, 2025 at 09:40:56PM -0600, Rob Herring (Arm) wrote:
> 
> On Sat, 08 Mar 2025 03:42:23 +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Describe the Mobile Display SubSystem (MDSS) device present on the
> > Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
> > system level. SAR2130P features two DSI hosts and single DisplayPort
> > controller.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++++++++++++
> >  1 file changed, 445 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

It looks like the patch 2 could not be applied and was skipped. Is the
bot parsing the dependencies from the cover letter?

> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: Unevaluated properties are not allowed ('compatible' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae96000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
> 	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae96000: Unevaluated properties are not allowed ('compatible' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

-- 
With best wishes
Dmitry

