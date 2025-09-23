Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B4ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/M4chbTCwJie6GL25HuGRFhPc1V63zKjOJLKGItv6qU=; b=SxDBNZGmOcmO+9ZAkYne7bh0Jj
	wczRTKLAFjCspSZ+pRvWVV8iYkrBt6VSQMpMEsZzDkxwC70wjtepPB9kGXK76VfQ2MRrg9Xstf+iF
	3wp3hE2kcS8wTvxuIgVyK1r04G+nAIeoHXRuGGx2UDB4afUCgDDIKzPXCGe1Cr9efyncobI8fFEfT
	y3jbkoisM4fG+Nh06nUu3ku55A2BfgyffXbrTIkslT/SufX/QgqHKTsf2E8ssaF+laKnemjRxwZLy
	Z/jfxRYMTaVQRiJoBKSqxyxo2ygNQwIdfIMBWrdFvyNrhSk3Jeo5njwnWge4UIvPUuzoX9J95gDOV
	4+Qf6MQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v10v2-0000000D8LY-4AWt;
	Tue, 23 Sep 2025 11:10:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v10v0-0000000D8L9-0uCj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 11:10:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e158480beso2141925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625844; x=1759230644; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/M4chbTCwJie6GL25HuGRFhPc1V63zKjOJLKGItv6qU=;
        b=IINyIlB/wSuKW1zEIGwgbDTj60KP9F6TCx8GZv/azswS60dwHytQrhqC6gNT9+rzBW
         hi9ZurEaHHieUM4/ImK4gj4subt9JQNLmsLZ1NQa+f6bjtsWfOkJ0Oqb1+fV0JSUL2dJ
         UeUqaWguErmMfBMEIeVG0rUmderZE4AKvL4JGCR4DvL5AUuxp3FF4PQD4lQAI09G1rLS
         JzEtSUevh3V5WUEwXpYG8+YcMuWMj7ih7d3hJaOfTk91g24UknDqsT/+tjrOds3yruRN
         6Uvm9sbKz/At8wzbZ9Y9Yr5/aRGtIZYJ/tXX0ZEtmLxpvf9dbyZVuqVrGGIJxojKKZff
         PXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625844; x=1759230644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M4chbTCwJie6GL25HuGRFhPc1V63zKjOJLKGItv6qU=;
        b=KEsXB7eV1/EYhFLLVvCO/tUECvutZc3q+uP0t2V0yglAGD72No0SpwrfsoLzbQuQMr
         dv/1cC51sdd4ddfNi/V2FHnuIok2U3OFMHMRB03LIpJBrHIszGQUUYUB8cBBzk9tNRk9
         RElm2188lHMqUxIP7h5wn93RR7RSPr1KOOmy2hEvGHDyYu++RZltShqE+LEykZBC+UE1
         CU3zbKWPDuFh1IZznuyDxXoBDYLVKwjUhfgVGJJVr78Erde3wNIpJDAfcQjm1Oxh5EFm
         2wWFifu0tL4ba3NMGUGvVLYZrJDLXrRLhivULHGuSvpMPgnMYw4wa9z4NRv/bHpsI3/U
         XbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX9gERiezQ6oritl+g/t6hjjfSRcorms+oSwg+/5YFNcBN4xuQuT4hm/dkbpl1SRql8YF52Sa6x51o48ne9M01@lists.infradead.org
X-Gm-Message-State: AOJu0YyA5ta+88HfxDpMwRMWR39rvcSRwd6Nv43PvqJanM1VkmqHy5hV
	9QrxixRyB+Z/eK8GUqaAO7nWic5n606C7XVsG9gVZwkKxWlVmLLGnG54
X-Gm-Gg: ASbGncsy9vVd2L24nnj738iyFhWOJV7hgXRciSasG1+ivvn5nbvSpNea+wW6hfLtMKo
	vrBZwsYHtjL7pxktPOjO27Wn08ttyZTUjNZtxYcdF7thbY9npiAgyfyVTJnixIVFvBw7OBEPc30
	aoeMXu1KhrUfK+HVtGuSetpgGRj0IOVxAiRkHoXwGgH9J4HBbMMnFyIpGDZTFvjL303GhAKz5A3
	maBEYjNIbrS2uBgrkyBT7WOkhejlPwQG3N6tnOkZiwdPJ5mKrsrNMoPFhFmcHNeXXuO25Fze5ws
	uyAnADMH4bSFHN7qBbbU1EPa2ZPHiUOvJSYFacTz1JpCxLecxfiYfXc8bGvzaKYe68ripdv61QF
	RQunDpmTbD22NvSHlRTNZHKk=
X-Google-Smtp-Source: AGHT+IHhlp7t8Mif75guovtxrXuNcYEIzhCdfujdY3LaIWfy1jJmzn6mmtcb1ThUszzhbFiPUhqUdw==
X-Received: by 2002:a05:600c:4ed3:b0:45f:2919:5e8d with SMTP id 5b1f17b1804b1-46e1d98c40bmr12841095e9.1.1758625842783;
        Tue, 23 Sep 2025 04:10:42 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:2e0a:df05:253e:8b85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e23adcce3sm3208595e9.11.2025.09.23.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:10:41 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
X-Google-Original-From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Tue, 23 Sep 2025 14:10:38 +0300
To: Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: fsl-lx2160a: include rev2 chip's dts
Message-ID: <20250923111038.qluh2kjmc534ytig@skbuf>
References: <20240826-2160r2-v1-0-106340d538d6@nxp.com>
 <20240826-2160r2-v1-3-106340d538d6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-2160r2-v1-3-106340d538d6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_041046_270838_AAFB46DC 
X-CRM114-Status: GOOD (  19.18  )
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

Hi Shawn,

On Mon, Aug 26, 2024 at 05:38:34PM -0400, Frank Li wrote:
> The mass production lx2160 rev2 use designware PCIe Controller. Old Rev1
> which use mobivel PCIe controller was not supported. Although uboot
> fixup can change compatible string fsl,lx2160a-pcie to fsl,ls2088a-pcie
> since 2019, it is quite confused and should correctly reflect hardware
> status in dtb. Change freescale's board to use rev2's dtsi firstly.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> index 4d721197d837e..71d0d6745e44a 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
> @@ -6,7 +6,7 @@
>  
>  /dts-v1/;
>  
> -#include "fsl-lx2160a.dtsi"
> +#include "fsl-lx2160a-rev2.dtsi"
>  
>  / {
>  	model = "NXP Layerscape LX2160AQDS";
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> index 0c44b3cbef773..2373e1c371e8c 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> @@ -6,7 +6,7 @@
>  
>  /dts-v1/;
>  
> -#include "fsl-lx2160a.dtsi"
> +#include "fsl-lx2160a-rev2.dtsi"
>  
>  / {
>  	model = "NXP Layerscape LX2160ARDB";
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
> index 9f5ff1ffe7d5e..7a595fddc0273 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts
> @@ -6,7 +6,7 @@
>  
>  /dts-v1/;
>  
> -#include "fsl-lx2160a.dtsi"
> +#include "fsl-lx2160a-rev2.dtsi"
>  
>  / {
>  	model = "NXP Layerscape LX2162AQDS";
> 
> -- 
> 2.34.1
> 
> 

Sorry for digging up an old thread, but I'm curious why you applied
patch 2/3 but not this one? Currently,
arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi has no user.

Thread here.
https://lore.kernel.org/lkml/20240826-2160r2-v1-0-106340d538d6@nxp.com/

