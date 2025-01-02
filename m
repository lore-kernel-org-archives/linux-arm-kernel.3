Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4347E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rX76GSNyzHVSRa8e7aEOxdkbuGL68TpQgt8jW1PURw=; b=GwXgguYcgmFg9A
	g/nMo/1qv2EvUVeTZajLuDbmdDL/5C7b2gZlfNqCEtKsv71uXUxkHEWD59PS1ji+qyNZfBsVz8dKA
	GPJH0jNQjc4yegDTFFlyCXRBZqXbukHSfXK53dvKWfaR7CIpTTJXC39a/SQU5G1vjQz3gGNFRXCi1
	ojEjoI5tDJAz75CGyHsvwgJU7pIsl0hLtjZ+IxMRF973B5gJNXaon3QpdrMNW540L2fWx25lp5aEx
	f++Pf5CNAZtGMXE56zrgWwwtl8jx9Dnc/pRA4itzAC4n4bpbrdnY11Wc2bs744imDsz8tkIBDrnib
	5GDU+6ehgAYmrtD5aA6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPHP-0000000B1Sn-300u;
	Thu, 02 Jan 2025 17:46:43 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTPGA-0000000B1A7-0ePG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:45:28 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e3a37ae07so12477857e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 09:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735839922; x=1736444722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rX76GSNyzHVSRa8e7aEOxdkbuGL68TpQgt8jW1PURw=;
        b=i7tQlwfcd/GiZTc+R9NbnEAEEsMoIFjGJIHYnUgQFF+RTpF+0wumxf5tDgBC/gimTR
         cKjeX4zvj3qeVHxAb704WjOmcLKAuY7thXpG18laEVqy/KLjqrAZWLvBukaT1sFoSlxm
         4HqDx2pTxQG/D0hboSDcW8JmbGth67YBzOUVGhYkPx9YrfZYBfC2Blen31P62buXplSw
         MCZv3rpdPfI053ZjNl34nQQgZo8b7znt7phSeJ3vYdPKiDM+umuQV/78DEL3MCBswFUF
         t6Z4YUw82FOvCyuokQP23/7B7PVACj8S3OkcEgkwRMHvlVL6fZxlMpU5KitlqKPtghBN
         ZYdA==
X-Forwarded-Encrypted: i=1; AJvYcCW8ETWZrbDU2bXFFSjOKhcahm11RjujpsxEELImS4AcdX/0SXKTp7/zE68h/yCtUA5oV66yPC2uwqHCki6cVBIR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2CYjHp9y89BQH/OwLWSFEgSMFDJnyQzv+vSvZipv3nlA+iXaT
	Rr32UDRBBb0sYG4z87FkaCkptVlSqI2zYiBaVlk8HlsuUYosdqw3HAObwuBW
X-Gm-Gg: ASbGncuUWr/KgitGHwFurA62spOySov0gyNfi9XW66h8sKiv2o7LLAJkT/9Q7JPEknH
	GyxE4nEqGyk66bIYNgnIADvxEfv/X6TV9jv1VRf2f1Ot45H/bh9gRga0B+nnn47Qh/mJHVXX61F
	3udMs5FjFSqRedyN7VWpAWfqcbjkYTRUHwL/CdyNoz9tVE35erwj8dat9gRrOAY7mPF1FN0LRxa
	7ox5AsA+82NDsCYnsYwkXVWb02eoLFtPQvXPoqyAxuG3zcSuVjM7yVcqdcUxxxlAM3/Chc7YcRU
	ihSrYiNvLlMhdg==
X-Google-Smtp-Source: AGHT+IFT9RSfy8FiZpIXMiNhhLhQlvKm920QtzoodOn153hPcYbCEtc8Bm+CCvKUeuurAlrtT/xB3g==
X-Received: by 2002:a05:6512:e93:b0:542:1b63:141b with SMTP id 2adb3069b0e04-5422954930emr15920768e87.32.1735839921909;
        Thu, 02 Jan 2025 09:45:21 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238215c1sm3815161e87.206.2025.01.02.09.45.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 09:45:21 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso124583861fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 09:45:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2HGZ1TQ3OvvIZzp3kouH4a4Ndh05X8XoIjIIFjxYH0Nqi3el2CBocm/6CmY57vvZKdicdqff78q4479frI5bD@lists.infradead.org
X-Received: by 2002:a2e:a546:0:b0:302:1861:6df8 with SMTP id
 38308e7fff4ca-3046861cce9mr148699451fa.33.1735839920320; Thu, 02 Jan 2025
 09:45:20 -0800 (PST)
MIME-Version: 1.0
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org> <20250102171424.3644-1-lukas.schmid@netcube.li>
In-Reply-To: <20250102171424.3644-1-lukas.schmid@netcube.li>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 3 Jan 2025 01:45:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65FutJMLr8siH4LjUHVr8AconH59Y5JrVCWwgH9DGDP0w@mail.gmail.com>
Message-ID: <CAGb2v65FutJMLr8siH4LjUHVr8AconH59Y5JrVCWwgH9DGDP0w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for NetCube Systems Kumquat
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_094526_200517_C90EAA9F 
X-CRM114-Status: GOOD (  13.55  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 3, 2025 at 1:17=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube.l=
i> wrote:
>
> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
>
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC
> - QWIIC connectors for external I2C devices
>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

This seems to be a new version. Please tag the patches with a newer
version. `git format-patch -v2` can do that for you. And please
include a changelog listing the changes between this and the previous
version.

Last, please send the whole series, not just a single patch.

ChenYu

