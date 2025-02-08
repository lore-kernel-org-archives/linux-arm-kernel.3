Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBFAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 23:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykULb9cEiyiSRjZuTpehkeQRCkbvvsFyEn2UQm5iuoU=; b=LHM0vHrtkE4gFQmamN2yfjVYZG
	219ZrYJAGwwT/p5d6T2aD2DGLzW9ujewIWMxRTm7xCBmkEpixiCZMITZJUUURv4Mt0QpxTNIL1cgy
	8BltlXm6sd7Kb8PlgynkT3RAwROAd9th9WREtaC1P6xsSnF/SfW/COJwgUY3PqLJ6RhhHmIxM1L97
	xSQkVHV33gXI9Awxq/zBUORImkrSghyXG4QHhcldPKKNv88/2a1KUP4yDVIBbeX+73mKi51rn8VrC
	Nv1HOYsWs/bTG7pQe9SR3K3Hteh0hVAYSVDVfp3czPIcmtphwQLiP7Op594tW6oMhQdwhZivxXyMk
	LyvQpJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tguBg-0000000DiJ2-07ou;
	Sat, 08 Feb 2025 23:24:36 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tguAH-0000000DiAV-0lkg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 23:23:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-545097ff67cso62934e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 15:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739056987; x=1739661787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykULb9cEiyiSRjZuTpehkeQRCkbvvsFyEn2UQm5iuoU=;
        b=JUfLlHRk+b/Cn3ps4udAdHb9SMC03gL5Y1c3krGDm271r59JdzwfZMQUC9QKr2doiQ
         uw2BttJm3o9jsjwEAw1m07sb3q2wr1UUu22lXKlt8bT2T0n7iHHhufeq0aLp7gzmB/EQ
         cZU8ShZ+BlLfgxUkCR8ycUNiwAVxWN+8Qr5QiyzV0InnLdszHNxFXSrZVqJSOtyy3uvh
         hLS2IHahsV0T+6nAnPed8ECnLnQEJqDEQ6WGaSbbKty9n2sdoHmCSEZWcgJ0DBHv0t7W
         ElYTQhg1MszFIr2WXrOaCNsUcL8Lp2bhEYBRcTyf7wQ7ELEtyObAyz349tbMd2FeqR4m
         w0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739056987; x=1739661787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykULb9cEiyiSRjZuTpehkeQRCkbvvsFyEn2UQm5iuoU=;
        b=q8Q8f0CtQuIEMt1RnzECb6PWkLvpaDjzWFvCVkveXq8kggJeGH6TwPkTjXlzGsyUqH
         0qFrI4XWULAbeQw3YC3pEyIM3BOukgVHBvpjpRDDH+uEJIDKsWQvNfvEe5ztgrLnL4Hh
         eSFAO65V5PrWMyzV01zl5Jwlz6xe45/xZYbdHAuY7omUi07tq2kHxO8C4iNIlARoSoPZ
         8os7w9dtOMPkaQM1iPkHVkykGvHKHVVbQz/ngfaFQm6Zt1l55TyqPSWehEmyIKxFdyIZ
         nGMQJrcli0IXVfMi23rCYurrG4AMF7kNJpdf02/+IhYpkGMhn2LmMFhmO//f1zlpRK/4
         wuNA==
X-Forwarded-Encrypted: i=1; AJvYcCV2TYD9ZRlivn56Sml5GzAGQLVojxfapCm8Kpomja7r+DdLFPMjtk+OE/gdK2QcPIz3eau8L356//K9Ws8WnAg8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9WELvvSYdfUf4gITjs2SH+IkaGg/iyWFvi/hZlFm6QD1/JeuF
	pQ4DM4SGhWRSWn1stseO6ls8QCbd30Cv+Xw/jnbTzrhHEu6/8nnkucPxDMjBSP0=
X-Gm-Gg: ASbGncvoC33oVsIHCXPkdzfDhhRLgQjTvQ1saA08uIWlktPUx0VBZkXT23fi1R+r5mQ
	9h9rKae2uZ1WB+O0A6ODq62n02u0nqkbttKuBRBfMaOaZKPRDqAPShYAPjvqe45sHFybSW92rWE
	65Gj7VujM8B1OTZM3IshOFSlkFp9z64xN6r9X94i60nZcdUcyiLi963xfMMPqi+AbQ5uY1L/k1b
	cuEyvrtT7er0fNoTahVhsB/0t9VCRFFxyu+I/beFf2CVRaCoC4lZ74q1WC4w7qWkV/ZEDGQkh/N
	ZPN4RwKgW3dVrGaLEKa+ROg76lqGhP0KhTF0wHjC/mYyMgrVLvhEWSvvdwrVGv8UkWBfI6w=
X-Google-Smtp-Source: AGHT+IF/JBvJkuagJqa26itTPE8jU8/kvFQIMKuDm05aOsyGHWAPDELu87GWmNGqjraF7sL+Cp5yWg==
X-Received: by 2002:a05:6512:3a85:b0:53d:e3a6:ae8b with SMTP id 2adb3069b0e04-54414aa80f7mr2528489e87.26.1739056987259;
        Sat, 08 Feb 2025 15:23:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f2f31sm832127e87.165.2025.02.08.15.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 15:23:05 -0800 (PST)
Date: Sun, 9 Feb 2025 01:23:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 0/2] media: qcom: camss: Add sc7280 support
Message-ID: <dv6ccohw33gnc42fhjmxaofg5lyip6jked2u26rwkxykcwt6sx@vlgjyjkn7wva>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_152309_245861_7519D939 
X-CRM114-Status: GOOD (  12.74  )
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

On Sun, Feb 09, 2025 at 04:21:41AM +0530, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
> sensor.
> 
> Used following tools for the sanity check of these changes.
> 
> - make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml
> qcom/qcs6490-rb3gen2-vision-mezzanine.dtb
> - make DT_CHECKER_FLAGS=-m W=1
> DT_SCHEMA_FILES=media/qcom,sc7280-camss.yaml dt_binding_check
> - make -j32 W=1
> - ./scripts/checkpatch.pl
>  
> Changes in V14:
> - Updated commit text for [PATCH v13 2/2] - Dmitry
> - Removed duplicate Reviewed-by tag for [PATCH v13 1/2] - Dmitry
> - Link to v13:
>   https://lore.kernel.org/linux-arm-msm/20250208165232.2371889-1-quic_vikramsa@quicinc.com/

For the series:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

