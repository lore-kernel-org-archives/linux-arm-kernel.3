Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E975C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 22:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTHcKUL0A9GikZYj1YTvr/EhlWV7sWgF6MMVtB1N/9Q=; b=OO3GRU66hJU6hrYMet1nPegqJZ
	OcC1FyoV5oTKsunXp2XXfh/zBEBZLyIb6WDO7EbcWiPPBAZuYmXADBqwUBP39ZENwAqNyrcr7CJrd
	PRxShHlcAVSz4M354ewHNxEErkWiIp7aMx2cMbgFBE2AC8dhfP8NTJ92e84Xb2QHNQHwqZR6lJVZ2
	EtrbbzJ1ouiO8PjWlgGK/QzdG3CXXtdsV3CYh+u6s6Zqfv5tgpZobNYYvRYPkaI4zOT4dJ5t+1cjj
	uIenlTQdLdaL43Sj06h4urcbp7FRY+ncDjegAt0ay4w/Xbz//CX4YoiRAWD8HyD7x1+frui1SrarW
	f2ypCAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgt2M-0000000DdBe-1Woo;
	Sat, 08 Feb 2025 22:10:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgt0x-0000000Dcwq-2e8E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 22:09:28 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-543e47e93a3so3532561e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739052566; x=1739657366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qTHcKUL0A9GikZYj1YTvr/EhlWV7sWgF6MMVtB1N/9Q=;
        b=IOWmxKuXLDxS/Ybl2bTWBCiT26Dc7SIHLI2kA+MIYK52EmrqCrUD8xTNttpDz3VrGR
         mv70QiWAkPHdmNuNMgxU4jLI39hBvf6f1sj88aQnpqC16h1C/2Kf3kMv0kz97dJ4lsxd
         nDEdmYvZvd2pWtEXamoLLjmCHnSZzafKs3o/vjNA2ZNYLeh11Bk0vrdAxlgQEVWtp65p
         NZkLsK3NJVLmOFEiUpmyz7AUb3C7uhIMCEKAQTIMf+pu020VO2ALQyY3Hxqc6IfD+gdi
         27lBkebNRJDUfSWzCjC+a+yttsWMNmL8vkkwRcFWWOEDLyDGNdl1P1RWQ7DBWdc+UQtY
         zcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739052566; x=1739657366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTHcKUL0A9GikZYj1YTvr/EhlWV7sWgF6MMVtB1N/9Q=;
        b=fhTqBLJ3v1XJIfcPwSsc+KSp7y+xty2a8tqvmGPVdWVWd2KVqQeTTEiTSNTArTcUuJ
         AFnCVgn7AY3whEV9k23s2pBKzYixglsFqHBQNvGHdDlVyY5XQZ64Y3T9vKJhgikBeZK5
         D7E6yAXUU3InOTEH2BzI7SyeZV3Kpxm/ALTTKUUQZJu/fAPsEwmSZkqPrzVq7jlNvfJt
         HvRuHyWrbuN4eOoAhrPBNC7JQw+DoECwAAr+kuElSr+tuM4V0R/XTrbpiccN8Iu+DuXS
         YX43wAqA/Q3ZzQnY4yyfO2+1VAKXwp6nO1Nr0qH4jLx9EplliYRIJtVCKdHu4P/ddS+t
         9F/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/FOk4SPLL6abYnHUi0cXITf1WYiCz7XSEtY56y2y8hrQ+PjkRblWqjud7PrXTjOSBVHb+02AzEVhUJLsqJxcG@lists.infradead.org
X-Gm-Message-State: AOJu0YzGt2mOKq8dUZtwWaAxqzYsVJOiGSrxy+kc+vTwUT9g6iNYHcFF
	IOJf98V+cAPiPVMbgRHHw3jIVedr0UWS6qor3u04Th6TWxkkADw0pexeKCojbX0=
X-Gm-Gg: ASbGncv5zd4dmBSQFQ1D1Je5MIIBJCCnnXoq79q1Qoq+bihROJppH2KNdTVxIaLuFzl
	Fr27lqHfI7pvcd6aWw+P+4fcSnrsNWJN+MPhOAYh1a4s0884SJNugApOQ2rP/MR/dsnHITyBsUY
	JT1HJEef/+3KZdd0OfZPbz9J1JQoHCnQKecCd0DZnBURwK9XVj/wU4TU03iEerZLprpgnijilFK
	jTGPa+4A3qNQhxwCGNDWgJ/jBwIjD3+YohMVN4byzUgfl4V6jnVZGtL8dVcmwk13CWsXTr8HPM2
	osHfMo+cQ/Yr6SGtm1G8ikzW7ykkVCAxOGqIMSvmnrlLWXO+Hslk2EP46O6MWdlzQRiAkz8=
X-Google-Smtp-Source: AGHT+IGUH3UmhIKInMLmECf90pr5INGbeBJEBwOwexzDKJYYzBRhSekRFOt84/bINUn54xlSrNAvSw==
X-Received: by 2002:a05:6512:1247:b0:543:f1a0:9e82 with SMTP id 2adb3069b0e04-54414a96211mr2604148e87.6.1739052565570;
        Sat, 08 Feb 2025 14:09:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm830251e87.3.2025.02.08.14.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:09:24 -0800 (PST)
Date: Sun, 9 Feb 2025 00:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v13 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <mn5zxr72jn3qbn6uiqnzg6qf4s4bydjvmvqqxhd4wvrrmtf3ii@hoau7ge4wfk3>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-3-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208165232.2371889-3-quic_vikramsa@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_140927_692702_9468E710 
X-CRM114-Status: GOOD (  11.32  )
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

On Sat, Feb 08, 2025 at 10:22:32PM +0530, Vikram Sharma wrote:
> The Vision Mezzanine for the rb3gen2 ships with an imx577 camera sensor.

Qualcomm RB3 Gen 2

> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 89 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 

-- 
With best wishes
Dmitry

