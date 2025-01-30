Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA82EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 08:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=reKlDefPaChUTykY+ITPpKv9Nus8Na5+cRD7++mWhUI=; b=wzyBv9PFMB/KQMFJh3/3Lsd/tU
	XHwrCQe9hGPMKelK3Dkx5tSYS0n54eoyku8SlvTtfHLysRpAwTvZctL0mZ76PwB+6CXfyJsCC78hx
	Toefbt+0sE25PnSLRcMwIt4wG7haQ5FMgYdlH7TOow+dZBFm0qCwq4VS3swC8mpAImOqWrGy8WFPZ
	Q6hiwa3llUYsp58glQbAL45ca5RzNB3m50io8tasG7n9K2Q6vZgPZCOMVu1N0L4RC7G0PvXn9Q8rG
	O8oSMjyLyiedxCDwEFIpu5USXOkYmrBXD5zDLLOLERxfHw00LTdDlOjqi9xux7GddDFTNZKowvbRE
	MO9WIisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ7a-00000008R0x-04nP;
	Thu, 30 Jan 2025 08:41:58 +0000
Received: from mail-ua1-f45.google.com ([209.85.222.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ6F-00000008QsS-3N47
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 08:40:36 +0000
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85c4cd95885so129094241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 00:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738226434; x=1738831234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reKlDefPaChUTykY+ITPpKv9Nus8Na5+cRD7++mWhUI=;
        b=pZedMBqKLYAe3XcplZcbbh1QopDJBt6F9ayFcgpPOp3Ocs1vSO5JG5M51jBcxjJsCD
         3LdHz15wyZVBU1aWMU1zBtE9igilwj4WV0a7k1/KAOw7dAD/CFLI+BLfSVqym5q5kFUR
         HLexCa8yomAj6hpxo9c9K6Zib/t9sz43ylcCLTcfuQr0Luyhpl6W570ljZTXzQbszAa1
         RuPtkGLrDIB7DVyCOmTuHPw/mdTJL0Gsa2MY2DrJimuXgADW0u9dR91M7kGnxiiKNn90
         TC+gLdRTVldydiMrFQxFfF6h1fRTItPOjX8XOLBWzMBWeSFg8U3/ouePFALdDN1VHncI
         o7gA==
X-Forwarded-Encrypted: i=1; AJvYcCX/ENcuS9XxQ0szqs8i2dF/azDztk8exUUjl2bE1Ds1X1hhfWqyRDMVlUraL42S1eG4l2aA0NiO61emgAGiucGf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl4qAuYlaC4yscDMjn4+2gIiuMmTjZ6DNTHKucu6ATBZ6xCivF
	cTxkqUdbxY/vdADQrnjKdkcMzzoYhsyX4iCiDNbxaDxzt+pba/dT4SzWd6lk
X-Gm-Gg: ASbGncuJ9GWUp9z8NyFv/UQwb9ns2+VmH5i8EYUkMDC2B7Zxq0i+hHwOyZCM9sElrqQ
	rcbZlZhkAM95IiPv9IP3xhIpdCIv5Sx0f/nUaaZ4dK5OMmmGzYN8D796lDMROFXVd07YXnORliy
	Ewrh+smRcT/aek8+XuBkmQbb5sGkgYM6miFLx1imaWMYJwdbPbQIGwSmmjJc+NNIk9a0AvdT665
	uDjBsUigSKVXG4nPzvjiD03fsf9V513WGzh6sy/C/rCjK1SYTsWRSRR+mki8tm+5bmLurxdmqPH
	MLhAcm0jSgLRA1TrGpiF3POcuX7o5a5okaS63CBAx16f+7WVolgQJw==
X-Google-Smtp-Source: AGHT+IE+a1FdBesGYK7oaXtOyEZeCAyEpBv+Yl98kk+kcPtdtVlDxQzsmmdR06csuoXfz3JrZXx0WA==
X-Received: by 2002:a05:6102:4194:b0:4b2:cca8:88d0 with SMTP id ada2fe7eead31-4b9a4ec91eamr5728073137.1.1738226433899;
        Thu, 30 Jan 2025 00:40:33 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86693f52ae4sm179585241.0.2025.01.30.00.40.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:40:33 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c4c9349b3so137746241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 00:40:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkVN5+nTu8NCCVN1uWteCZnGieh/sA5DntkPYlqq4ip02OL7ODyPE3pnuN7/nSxqCcDNBh/FCVeRMeyEI/15nQ@lists.infradead.org
X-Received: by 2002:a05:6102:38d4:b0:4b2:ae3a:35d6 with SMTP id
 ada2fe7eead31-4b9a52369camr5735036137.19.1738226433365; Thu, 30 Jan 2025
 00:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-15-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-15-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:40:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3KFJzNx3tEpMTobNYT9odEJ3S1g+wx7NY32TFv91TWw@mail.gmail.com>
X-Gm-Features: AWEUYZmW_sT5X4Wa-mPPzDPgmdW5QEJL-LtPYhMiRhBaVWxg-vKjEcEY64LYB6Y
Message-ID: <CAMuHMdW3KFJzNx3tEpMTobNYT9odEJ3S1g+wx7NY32TFv91TWw@mail.gmail.com>
Subject: Re: [PATCH 14/14] defconfig: Enable RZ/T2H Soc and RZ_SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_004035_837336_7EE889EA 
X-CRM114-Status: GOOD (  12.02  )
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

CC linux-renesas-soc

On Wed, 29 Jan 2025 at 17:57, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e61586..a1cc7a37386d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -486,6 +486,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
>  CONFIG_SERIAL_IMX=y
>  CONFIG_SERIAL_IMX_CONSOLE=y
>  CONFIG_SERIAL_SH_SCI=y
> +CONFIG_SERIAL_RZ_SCI=y
>  CONFIG_SERIAL_MSM=y
>  CONFIG_SERIAL_MSM_CONSOLE=y
>  CONFIG_SERIAL_QCOM_GENI=y
> @@ -1457,6 +1458,7 @@ CONFIG_ARCH_R9A07G054=y
>  CONFIG_ARCH_R9A08G045=y
>  CONFIG_ARCH_R9A09G011=y
>  CONFIG_ARCH_R9A09G057=y
> +CONFIG_ARCH_R9A09G077=y
>  CONFIG_ROCKCHIP_IODOMAIN=y
>  CONFIG_ARCH_TEGRA_132_SOC=y
>  CONFIG_ARCH_TEGRA_210_SOC=y
> --
> 2.43.0

