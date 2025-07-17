Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FE5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82OHoUr0Z9aQ08e56ySzE42nN8RW+aLi/MMtZyEhPrU=; b=YuCMu4aiNlfLntksSbgxQtR+Ps
	MOIJb8t6G1wZYEuFd9mERQTG8to7gB+U+zJvnviOx2bbRt0nZ3ZElRneMxegbr5RXC1rgXEeaflEQ
	XwRWOQsBD10Zs+xcb77yoyCIQ9jZQ9+lxEj++F9SV3PcSULIRWQugMD2eUOu6PdbArStTBBHmW8bW
	0Aw+t1EVtsveO3i5EbZlvR5PtkCf1WZ7jek+TqsXH4r6NjMUmyuyDMIHB1TygfsojOhmB5AO/i2SV
	eHLFELpeE+Dtuq1FgflQCunRDkF0ArFJ6Fop6gEVzICex+YpIX1Q+KOSJLJD/Hy88u4k2HMMO5Mjo
	uy7VnlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSXZ-0000000Aodd-0XJA;
	Thu, 17 Jul 2025 17:37:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR8s-0000000AaQs-0c7i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:07:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so11771145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752768449; x=1753373249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=82OHoUr0Z9aQ08e56ySzE42nN8RW+aLi/MMtZyEhPrU=;
        b=JKlX71Ru5NGSaS6ELCpX2murLxJzyGtT8HoDjTKzQSy8/3dWq9Z/buzl+Glt7A5Anr
         BPaebAeb/UNjHJ91iTIYULuy6TuRWUyDzXmM5bRE0OaxdAy/7Nqehi6wYjvHzmYOVL7m
         2o+33DLzvNdEwYvGeBt1LVD1lSBgwJhlQC6e+vDNkP8CtHF7grsdrLkPJ5r/hFicT01q
         o1q0qok2GUuEVgQuUL4rFeEC2ZMfrkroCtzHLZOLRLhybYEXfrYSrb8aXNBfwAtlcSDj
         D6csFP9mbiGZBp6g6qEO9G7PmnyNJfmLFw0gGvHy1plzM6YcEWInQvweCbhuW3WKH5x4
         EmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768449; x=1753373249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82OHoUr0Z9aQ08e56ySzE42nN8RW+aLi/MMtZyEhPrU=;
        b=n+OuV/2Lrl39TXg4iAjnD5hDjjKX7FwIRMXcPYaBkyte7JuJGOZ79/orZfjN61fRfL
         OvL7TOl9ltZdlmRmFBJKPQVwxBrhHJYp2/+10TtLzIyRGABySpqf2z4QkGcY0EDOWcaM
         1z87xEKcBY49t3RTJXUA4ufAxNnkrDYH/0mQ7JaiBhmvS/FBaesrjwKeC4ourso6AK1E
         fiHuWF76QUMutS0qxNUNSkDBiPHexGABD8mf0QepEgtHbXu0lIryxj48AOH4cEKC2+qm
         jGeeF27Nmm5pZnEeKm0TwvsMBJU/asnOaJYUJV3W6oq29cux4gCEPiFqBQ8kedo/bAwC
         YrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqgyUXqkeguSgOLMs4CYWdvoaTPUmbgPi73K4MI3ZPE8B1+Vdsi1iPXtoAKSA9mpRk8FRMJofrhbQRPcnh+eBB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5mNSCzbi9OliKehqLQegOFEFT1f3k3ux9cTskZ4bgGdxTd7ys
	m3r9GCAnjxXXwblVt7HxOJPjh3a83OqDRb6Djffy8CFyQb8XZXWbil1drLis+m+Oa3E=
X-Gm-Gg: ASbGnctjfmeSJerIkjAJwPVa8di25mc900PVSMidnz+AfuEmHgQAozKwzODnGnSWSVA
	iCCSflmRZidmqQtMxxZSNs+05u6Us5ONxmvBZKlBA5sFp4vZmF1iEvDV4L3UwuE1QiNxiHx0Svu
	yCld/Kr1QMuzE2r3l0fSQhEAJ0Q7aAz6aQIITQ0VJAk99peiNVeAce/7YG7u4PcoyFCHaTEG72b
	bifk1d0UnnjjTQuWcIJWVp+UrpGRi8ln++k/vrudLxftLXjKZYewD09inVGMFoflJkX/AlC0JrS
	7hYeFZdH/jD/pTdt/Prj2XtO5MrcOg22aRNTIAjq+gVqraA6t6uOPPdSE+YbKI33V0Ua+B7ICsE
	qNCf3b6b1faxUifvmqW7E3yk=
X-Google-Smtp-Source: AGHT+IHzm2I/lhPKbGUV5CyURK1Tn69rc/pQKbI+7FTppM+fvafp7RbqiJF9UaoOuE40qre4CBuyNw==
X-Received: by 2002:a05:600c:4f4f:b0:456:2cd9:fc41 with SMTP id 5b1f17b1804b1-4562e3b9937mr64319855e9.20.1752768448653;
        Thu, 17 Jul 2025 09:07:28 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f4c34dsm26799925e9.6.2025.07.17.09.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 09:07:28 -0700 (PDT)
Message-ID: <27025862-dc2c-438d-8413-d61ddff01a44@suse.com>
Date: Thu, 17 Jul 2025 18:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: s32g3: Fix whitespace issue in device
 tree
To: Dan Carpenter <dan.carpenter@linaro.org>, Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <52960eb1-4432-436b-89aa-d50fc7da2c3a@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090730_190013_F9A3759E 
X-CRM114-Status: GOOD (  12.91  )
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



On 17/07/2025 00:46, Dan Carpenter wrote:
> Checkpatch points out that this should use spaces instead of tabs.
> "ERROR: code indent should use tabs where possible".
> 
> Reported-by: Xu Yang <xu.yang_2@nxp.com>
> Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 68c11ebd405f..e80144e33efb 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -489,22 +489,22 @@ usbmisc: usbmisc@44064200 {
>   			reg = <0x44064200 0x200>;
>   		};
>   
> -                usbotg: usb@44064000 {
> -                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
> -                        reg = <0x44064000 0x200>;
> -                        interrupt-parent = <&gic>;
> -                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> -                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> -                        clocks = <&clks 94>, <&clks 95>;
> -                        fsl,usbmisc = <&usbmisc 0>;
> -                        ahb-burst-config = <0x3>;
> -                        tx-burst-size-dword = <0x10>;
> -                        rx-burst-size-dword = <0x10>;
> -                        phy_type = "ulpi";
> -                        dr_mode = "host";
> -                        maximum-speed = "high-speed";
> -                        status = "disabled";
> -                };
> +		usbotg: usb@44064000 {
> +			compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
> +			reg = <0x44064000 0x200>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
> +				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
> +			clocks = <&clks 94>, <&clks 95>;
> +			fsl,usbmisc = <&usbmisc 0>;
> +			ahb-burst-config = <0x3>;
> +			tx-burst-size-dword = <0x10>;
> +			rx-burst-size-dword = <0x10>;
> +			phy_type = "ulpi";
> +			dr_mode = "host";
> +			maximum-speed = "high-speed";
> +			status = "disabled";
> +		};
>   
>   		i2c0: i2c@401e4000 {
>   			compatible = "nxp,s32g3-i2c",


