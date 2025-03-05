Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD72C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 02:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnCIdQjyvJoIw+09MQfZJbNjZFzCmtvJnm0G8vRNJh0=; b=diFJ1yBAccdFEY/ZOKnwgnaJ6s
	V8liXAK4OV7i4/djMoQbEZDUSL4FUk2KB6bbX9pjgBENoFNCeCwqkaplvRcyLJOUGL8MKPK/9y6DT
	8OhKc18jHbQxnx2ggq0kN3bFAvkgrSyL1o2Lti4EjCkcdk6cD/t5PoxK4m2PcngJ3FW5xZlhnlExg
	7iarydIDJtDkLQiH9VAklTsogSRQa+DBcQeVYKyRqqPlG5gd9rGy+iaFsaqoFK+a2Q1J1DR58Eywi
	fuPo6tMgDEZR61CECekR0RjYkhTKg5rB3NYRw+hxEtz0XPyMVJ5Igd53dPdt4OBvmZAtjUTHFNSAG
	tLnYx/Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpen9-00000006pWL-2g4a;
	Wed, 05 Mar 2025 02:47:27 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpelX-00000006pNQ-41El
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 02:45:49 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so7445528e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 18:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741142746; x=1741747546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnCIdQjyvJoIw+09MQfZJbNjZFzCmtvJnm0G8vRNJh0=;
        b=HG2APG+BMUKPxZ8hrpHLejUMJPHF+YKXUsIChB8/4LXeQg5kJLYLN5RKTGJW9lSrch
         fe1OoYKvXz7cqW/A+V9KkpYwwyPmjhV9AZSkXzklJhRio4ASlPYMWgKpSBp2+hTaQA0c
         p1M/KynC4dMHLLp6KD8cNr50K0LPZVRqI11gkSe1zSjMgbmorzI1z7A7rIO5lw7G5Dmo
         OOD4kVJtD5uSIfUUwdY/0SrSFEOIVu4I/4aEUzXTw/y704QNd7paQ+fqoLNncWjU7Aot
         JEuY2P/XeDHC3AZrxJRoyuO82Ib1rUKreox+4IjP+4JjKuRvIXnZzt+NX5pM6cRAeNgo
         Qupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142746; x=1741747546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnCIdQjyvJoIw+09MQfZJbNjZFzCmtvJnm0G8vRNJh0=;
        b=htbiLYTU0bNMpETZdtOehoJbU4MhcMivdaA8KOmVQWuPkVAgBZdcUyoEZZk4mGq3lN
         4OfhyAPP9ud9rMpJoDhhqhfvgI7vCzmrIKidJnwlbRRDOgBMXvS0mViSdOu3HPkkXNqT
         cy25I1TAPECNAQpfZa4BZPE3rDGkCDXOOB2mjVkC5odUr37QvaolcaAOXgUUHifXgkA7
         OV+RBY/weoy1sdIdQp4nRIHbD24XZzvGSOrfKOlNdifw0aa0kFoqBz1uOd1YCKcea/5J
         fTO4+lT0FLxPbkYyA83RdFAAKu9fQgivTwm4drPLAsf+XrgqvSaTNTTnmgS0oZ+CUBdi
         nEfw==
X-Forwarded-Encrypted: i=1; AJvYcCVo5r5MhZjpYsvd1SyK4xV3j6d7vd2dQ+amUy+tC/LAqAYuWbUCkVoIEF+ISYUu992emwtt2FUY3R4WVTqnANGV@lists.infradead.org
X-Gm-Message-State: AOJu0YxniEvZfarI/47UeFkjFFELs3KoDz5kIUm3R5VW1MD7xGTd0cab
	01EmuKconbyQ02C8olVapgbx1XOJCtc+0c7/5mue8nvZu2e1x1gLh9KpSLRpkXw=
X-Gm-Gg: ASbGncsarnxeCstpnR80RK3LJa/iNNSuDKN+UuKmX1cciG9+2Bci1v1aa5Sd2/qZs9l
	SwSeD+McX/Wnkr/FYJbZhQ58T/1Nqj7vmTK7HaU4evqVFrmuB8RUIf1ZjFD8tg6hGSvnE7LMbB8
	ct3pe7gICy9rj4Nc+i96oo6ydLz2LzRrUslYFGWGJ3WmlPPLUEI9y/QFEPl9iBvi5RoJw1uTyJa
	M3jK0ssLDBXNQjj7LzDF22vvyReH8bRRsY461nhNHRdJctIM5v34laCSQsZXa5jG/KxrRkzLRvO
	mTgx6iy7/dshSIQ7Z+Iwp/zsE3qnHh1ega3sZpMzAuQ20NIf6RZzPZQiT3WIgB6Qbdyt1CClEwj
	EZlycwvT7/xlX07VRamGr+Z01
X-Google-Smtp-Source: AGHT+IENQirHPPtkH1C08buo5FlxHD+bBXarik3t8IBthupg5sNtQI8Z2GSZNo/BlNfNZfWRiNGXiA==
X-Received: by 2002:a19:5e5e:0:b0:549:735f:f0f6 with SMTP id 2adb3069b0e04-5497d38ecfcmr346846e87.50.1741142746049;
        Tue, 04 Mar 2025 18:45:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54959d33af7sm1173076e87.215.2025.03.04.18.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:45:44 -0800 (PST)
Date: Wed, 5 Mar 2025 04:45:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/9] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <dfpqg6u7kdvurgajufaldvpdxhe2pawmgum6ngtbbstdxrngwx@i2masto6nnwk>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-6-a698a2e68e06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_184547_988877_8E89CD95 
X-CRM114-Status: GOOD (  19.38  )
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

On Tue, Mar 04, 2025 at 01:56:39PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  10 +
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 296 ++++++++++++++++++++++++++++++
>  3 files changed, 307 insertions(+)
> 

[...]

> +
> +static int msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,

m31eusb2_phy_write_readback()

> +					const u32 mask, u32 val)
> +{
> +	u32 write_val;
> +	u32 tmp;
> +

[..]

> +
> +static const struct phy_ops m31eusb2_phy_gen_ops = {
> +	.init	= m31eusb2_phy_init,
> +	.exit	= m31eusb2_phy_exit,
> +	.owner		= THIS_MODULE,

Strange alignment

> +};
> +

[...]

> +
> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	for (i = 0; i < M31_EUSB_NUM_VREGS; i++)
> +		phy->vregs[i].supply = m31_eusb_phy_vreg_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, M31_EUSB_NUM_VREGS, phy->vregs);

devm_regulator_bulk_get_const()

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to get regulator supplies\n");
> +
> +

[..]

> +MODULE_DESCRIPTION("eUSB2 Qualcomm M31 HSPHY driver");
> +MODULE_LICENSE("GPL");

MODULE_AUTHOR()?

> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

