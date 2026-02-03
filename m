Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEA6E83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pn2t+jQqwxoi1mJ80RFtFYUwPK3JAB4g8JQHBr3tTk=; b=AAQKG6DjMVDIMyXDS3JmiaU3ys
	Cnud/ee91kvd1JGAdD/ysr9Hq/f8XUiraaDVyeXsmPcVvj4z3tqbp/wu9jZkjhI4eRbMc+nkoS9PF
	mD+14883Fp8X8D38l9FkSJpSl34jxn/80IRyKx/srLgwqNHIt52GVH6ecW9dcBOsIvRQ7tGuEzx/V
	sLCOcgckWSGSZOoMmg0dxKhDqFJ7h9VIa8D7/VuH0W9SrwEjCYL4ToBBaY/wsZdkYcJvKaoEnKV8s
	aVK75GkefV//xG+jJFCBd6GFOipNLOulvb4X4YoPO8VXxZcc6hObMMr820gPcMhVBmVg9uuDPErnJ
	j+N6sr0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9WA-00000006A48-2M0A;
	Tue, 03 Feb 2026 06:04:06 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9W7-00000006A3n-1ysS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 06:04:04 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59dd490be5fso6771314e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 22:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770098641; x=1770703441; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6pn2t+jQqwxoi1mJ80RFtFYUwPK3JAB4g8JQHBr3tTk=;
        b=YJsP8MtUP8PpttH7YqVAoa3fVbLzwhrvCdc9nkTp3cWMMI6S2iHIEo2sAnvhShLjh6
         AzVit8kwCrrJcB1dq8kQl/a9UArvTVGiD7L0UfuFR43g/n8xxp2EykvFM4ZbI+r4W/wD
         /vSvKLlY5sC/5aSztcRWUfUxYAY39vT6CZSmMCKie3gJ+Wx2fg/8BtpMibHQjmZj3SbT
         5fEXmcpxY8hJj57mC2U7OWYRFSIrwtP7+NwZQjrZR1FC/HP9r/H454FwBmNt3u20CrIz
         MPJjfxKtB6lM/QvDeT3uwYszdO6HG1mdO5ohSVTiHB18DwyN7i4pSypLQtOvg1F6hYcL
         56HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098641; x=1770703441;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pn2t+jQqwxoi1mJ80RFtFYUwPK3JAB4g8JQHBr3tTk=;
        b=tVRXeVBmQsnL6IjqaMdf+xovX9FT/CtihaWeW1tr/14bU/lTo9N3qIXapTOAroAOOF
         8YX5T5GDPJnFtCKs9/XD9ePPn26wLOzBthYdm9LBdwGsjaGk2+KcWAU1BQ6GwcNVmbJi
         a+iT7f5ZCRgcFIonscYlmUTQusGqD0lrP3qiJRt9pZvzbyY9tx5c+2TJupSf9PbphcUw
         fYm/SFZoPDS22iwbgqr8grzEtnkYmU3dLriZoSpBrRkdmamIt+U+VC6kgq7IEtbHLDZs
         PmoWDt4O3ZpnaJIV1xpCsoo4RhhFA+dSxgki+eljUoZKl7Q//yKduv4ZopM8Ieb9rmET
         DPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7RjrQksSzEmf3HHnLXEV0s/qh01qlBJDXMOULkEC8uVrFp/yeHwtYPnUhNG6pM83YokyXT1D+pGBDfhB5Cexx@lists.infradead.org
X-Gm-Message-State: AOJu0YzD/Be1ilSjO+/MFW4Iqpj5ez4u33IzxT2fS2+6yIhIqY6sH8bG
	AJBuI9WD6xrObtLDEa9RWMUfHqfdhdjox965E1UMZAK2N5hsH5FcpWgV
X-Gm-Gg: AZuq6aIMTReUUmZZeGV+URkrwYFOhfft1SjmUOpK/9eeGH0fRc11hogP2jgec68e75v
	nWMYxB4JZEvpNtlhnA22xNEK4JT1AGrZdnU+VZnxrwi/gTOw6vGK4f4o6MoBVyH7WC99CaGyHSM
	vyhPaKNw3jF+hLdC1mEYV7U35ukxcnQY6loP+Bh+qPGnpzkVYBQWSBlGgPf4d+CgvodNCk8Zeuo
	+P8mH3g1Gx+IIn4wkHHL5e8uwgUfQ/N72KULwozc54ziUHdQho5jg96GDoRoxXkRF6CEserrFkK
	nHscNX6WCqAse5xtTIYTJtwZ1PQNKfKZAl2y4r9A83eJYnpy/EynVayOmpRXeEkHcuY17OZKDJV
	si68SohI3pNymbs7xY9Q/0kEMzdEL4ETjJGDCh4yeNBaIgRqoGn+miErHRYXU58bufCeNGpZEqb
	SWz6cASFVTglXbwxh1g2ukXXOGrThGcCALPlD68NzjDiY0a9ZkycB2b1eaErHExqXDstkq7w==
X-Received: by 2002:a05:6512:3185:b0:59d:dcd9:73ac with SMTP id 2adb3069b0e04-59e16433759mr4731144e87.42.1770098640480;
        Mon, 02 Feb 2026 22:04:00 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0772d926sm3850762e87.13.2026.02.02.22.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:03:59 -0800 (PST)
Message-ID: <e1817e62-5a1f-484d-aace-638f44f2bcb5@gmail.com>
Date: Tue, 3 Feb 2026 08:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/19] drivers: soc: ti: k3-ringacc: handle absence of
 tisci
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Cc: r-sharma3@ti.com, gehariprasath@ti.com
References: <20260130110159.359501-1-s-adivi@ti.com>
 <20260130110159.359501-12-s-adivi@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260130110159.359501-12-s-adivi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_220403_534355_DF976470 
X-CRM114-Status: GOOD (  14.66  )
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



On 30/01/2026 13:01, Sai Sree Kartheek Adivi wrote:
> Handle absence of tisci with direct register writes. This will support
> platforms that do not have tisci firmware like AM62L.
> 
> Remove TI_SCI_INTA_IRQCHIP dependency for TI_K3_RINGACC in Kconfig as
> it is required conditionally (only for devices that has TI_SCI).
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  drivers/soc/ti/Kconfig            |   1 -
>  drivers/soc/ti/k3-ringacc.c       | 188 ++++++++++++++++++++++++++----
>  include/linux/soc/ti/k3-ringacc.h |  17 +++
>  3 files changed, 181 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
> index 163aadd589d3a..5499c0def527a 100644
> --- a/drivers/soc/ti/Kconfig
> +++ b/drivers/soc/ti/Kconfig
> @@ -53,7 +53,6 @@ config WKUP_M3_IPC
>  config TI_K3_RINGACC
>  	tristate "K3 Ring accelerator Sub System"
>  	depends on ARCH_K3 || COMPILE_TEST
> -	depends on TI_SCI_INTA_IRQCHIP

I guess (based on robot report) that the selects from
TI_SCI_INTA_IRQCHIP and TI_SCI_INTA_MSI_DOMAIN are needed to be added here

-- 
Péter


