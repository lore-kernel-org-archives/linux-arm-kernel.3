Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242C2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yix95Y58aFVDLktEp8lmDmKYUrlcv0lyEDYQZgOfJW0=; b=q02PoAiR7kYk8OsA+xpGDrsD3q
	/j/N2oS0Q+TlaJD2L/5koPguPkhGlWQaaB4kcMdYjMC4kOywDBUpe8JSHXrtTC/U0nRrfSzD52hJJ
	MbXFdsp7EZHhbGrOLhY5travPOKJltTYGLE4u1zC9TYfn9Xt3Npdekb3Dc54BbNdT+Q7PXAOiqjiG
	w6H1Ls6tqQ0Q27r7dWi/TpUZDjSNp1CUCRFgw1dVuyWhe+mibpOpeQs0H/IiRtTu/JYKy3fkdttMq
	MpZqLWQeW8nTYQlzotBiF6l3z7tf8jrenuqgCyonAbLfAWanUP3bPwRWy6iwAfBpdl4xpcvTGK446
	tl/WXizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8do-0000000Eq3Q-2g5p;
	Fri, 14 Mar 2025 17:16:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8bz-0000000Eps1-3xlB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 17:14:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223f4c06e9fso43841505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741972458; x=1742577258; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yix95Y58aFVDLktEp8lmDmKYUrlcv0lyEDYQZgOfJW0=;
        b=NwtF0dBvBlsnKlyAGjqXIw2GH2d8o3tpufRQ19wXOLay+2VuIjALiCeKIlZ6D/+OO/
         wfTL/hU3eYvwS4BANUdTJS6PnnMcuIK8fS8H0/JOqfSqwQOpO6t05gmNCxbkZ53cTfmM
         9SuD7nSfm3p/ljrkRTxgOjBhZz+y5BUx1KJl/w92JMQTZBgHhg7RAVRVhSVFJWTWHZLc
         MzEWiiOVd2w5GWD/wA+qYhRDW2ezrBS0ci5nwJrD8/u0TQeIcRAqylGuP0G+nL3Wrk5Y
         6xmPlVgLWeziYkiEeLk6HZd4zN4Nd00T+gPBcZl3neQ01jUKNNr6ux0F6dd4fYFTdpZw
         mQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741972458; x=1742577258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yix95Y58aFVDLktEp8lmDmKYUrlcv0lyEDYQZgOfJW0=;
        b=JJ2nPlWfTx6OLE1OaRAk8TEypJ9Vh+yKMbnkMh9y11b4VgW6BA+asnqDtxtL7JlhlY
         Ukxf6QmiL42vUG1EWIjDXVfMWcEYthi8H0uosGez+QvRI63xs8drAwPkiSMUdV50I8vV
         21Kn7fdx+K2fOo3Bj29W5Fbkg10fw4ldr/VDne58k15v4W3V07LLYclo8f7O6FCyHSNL
         ZGzTsbqjBK7LZpMsIF/WJ+xVIeo1nT49EIWe/P9OS7GS3DtPhw+q1eZlBKYMWXFMilJG
         7+FapvY14S6XqwkfPfIQFD2WRtfeuCaoIHahGAasPdRSNJjCL9noq5jOFbjN9PvfcSd6
         11Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Lb5nAXnxSRHiZzPkBmpA6Dpzsngzg09yNvOBBWEnuhK3jqb64Y1ndb8mlmus1gwoZ6utKuDkDNS8SyTcUL90@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr49vex4zNfpEp2u5zirwKKsC5Ho7vWbYIdyCJeYzgM3rZ6Q/g
	fwBcx04M0fAZz8W2C3bH3aaP0XG4Q+Pvr4cz/DjSWGvBkPZ1E32ZYQPAkKSTgQ==
X-Gm-Gg: ASbGncsRyCvl2G0MB1+HgUAGalKrO2MMDDyUa5iKqVhdxUCkdvs5Ysa5FVlnza+gGnH
	TsUq9MKEczUnkB7+qiJOfh2PBi4lKlNRxwRvhwI3s3cNpHkbJLe7PlajLNfWVC91Asg+vfGLtGV
	z7ae+DE5WCXz31N125lxy/9OhNxF38Dm8A3tZ3r5kFw2vFEQuQ+w5GvP+n/6o2BJBkSI68WXAZC
	xyxnwo2nhssf/1uUFvfVUa4OMYb9+U6aCv8e4EMidv+Vp5ko/W2NQ7CbdbJvhFadJgxev0KXxNF
	XthtSwrSt4kFzZA1GF/V2kwyHLhE7g6OWAR4t2+eAmpeqCyKIa+LY2XufTNgzF2dUTQDqhrXc8N
	lBDw/x2pDCH0xvbg=
X-Google-Smtp-Source: AGHT+IGy7HWrkPvjUpMMYhRQbw/am4ugxDMqJdGJdWH8dd6X/1N9h09zGNW9ExGPYF3hEaJz1QwaUQ==
X-Received: by 2002:a17:902:d4cd:b0:224:3994:8a8c with SMTP id d9443c01a7336-225c6613932mr89268175ad.8.1741972457947;
        Fri, 14 Mar 2025 10:14:17 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4d61sm30841415ad.242.2025.03.14.10.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:14:17 -0700 (PDT)
Date: Fri, 14 Mar 2025 10:14:13 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	kernel-team@android.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent
 property
Message-ID: <Z9Rj5T8il4rZAsoq@google.com>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
 <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_101419_983031_535EEC94 
X-CRM114-Status: GOOD (  18.17  )
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

On 03/14/2025, Peter Griffin wrote:
> ufs-exynos driver configures the sysreg shareability as
> cacheable for gs101 so we need to set the dma-coherent
> property so the descriptors are also allocated cacheable.
> 
> This fixes the UFS stability issues we have seen with
> the upstream UFS driver on gs101.
> 
> Fixes: 4c65d7054b4c ("arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes")
> Cc: stable@vger.kernel.org
> Suggested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Verified I can properly boot to Android recovery with UFS probing and mounting
the partitions in the fstab.

Can you send this to 6.12 stable as well since this is fixing booting issues
with Android?

Thanks,
Will

> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index c5335dd59dfe9fcf8c64d66a466799600f8447b0..cf30128ef004568f01b1c7150c5585ba267d64bc 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1360,6 +1360,7 @@ ufs_0: ufs@14700000 {
>  				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
>  			clock-names = "core_clk", "sclk_unipro_main", "fmp",
>  				      "aclk", "pclk", "sysreg";
> +			dma-coherent;
>  			freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
>  			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
>  			pinctrl-names = "default";
> 
> -- 
> 2.49.0.rc1.451.g8f38331e32-goog
> 

