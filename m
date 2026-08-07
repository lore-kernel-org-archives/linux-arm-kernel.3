Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9360C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa/2IU2RbAAtb2QUYjZKVHQ104XeXVbZBNjUDvADO9U=; b=1cogI8uP2KFGqWefecH7MnQRoH
	SIJb/IrorJf3rli0zXCvlFL2obhsnSFrlhP2gH6gJ4a7LvHgjcOf8TJ0vLp9N5zuG8VnhciSKKGVK
	/aeqQvJaVVZ2SfSmatJGZAB3dmZGZjXcm56cVfglOwvVurbh5bdaoSTpv21IgCe+yQ2aigLnD60ke
	EqDwsCV/gJGP4FnOSp91Nj9w4WyQwT1kUrUWBd4VfL5o51bqWkawdhTdVkQRCZIx3IwvMaEywhx0B
	XkkPw+CUvh6ytY12epJgyBIm1JIvJ5ZYcqxLDqH/XnmX5M3ypRw5JgGCcMrpvcyEnMn71cRfgYjES
	eZ3C0wVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG51-00000007RKT-2J6Z;
	Fri, 07 Aug 2026 08:37:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsG4w-00000007RGS-0l8P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:37:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-495437bb891so16209895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091840; x=1786696640; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qa/2IU2RbAAtb2QUYjZKVHQ104XeXVbZBNjUDvADO9U=;
        b=BULK57/B07o7joLHBmuCv4igV2IVpi2voGm6yotAjp/45HlzW7RkEs483AE1Day9aV
         UuRD8/7Sxv1S4ZSBDJM71d30T494a6ogYuIQWQvUjTrBh/KJ25M9Mnctv5ldJE1XpulR
         XScJuzEwOjksEsnkgUPRFijXCWfe3VIie+oo2DSjaFzASB4rf0MppFXhEiPXsrj2pHdC
         HwTOct1Z7DNv5EvCrAKxzZWrC3HRZAcH3U6EkMO8ugRnteCZPdWTehv6GDB/GnN6DjEe
         XqgwF6M9F+1HccoTsOuLAziAoR8qa4LZg2BgU/jxT/ffqWUSAS1Df3oNHCTNTppkyDpp
         AV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091840; x=1786696640;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa/2IU2RbAAtb2QUYjZKVHQ104XeXVbZBNjUDvADO9U=;
        b=Ms1VeD+YRUov904n4kZNAwZZnVtem0hsTFZrMSSvZKaqqbrkXBWpPb6sIoH3MVSVLY
         C74WlSUarphcK1GWBobXDPjvE66865MxFl8zKztU0BKgkiAnzDn9sdAWsrnXGRdw347N
         dcDvotG0mFsc+fGRWNwAJyp9Bfy/K0pPYE3OZlqi+mTJnWuK6iLoXsoAts0ylnAKpFFW
         uhIIH5J7g+KgA+89fbbW4TRK/V2LOkR+uo2AzZ7alYRXzcd2ldyRsy+SH6xG5I/NQX9v
         7WzH8F6YNZn8woufiS5wIErj5zjTZsqaaotdK5OAxsC8TDaLDmupHE3R/Xix+dzSawPH
         /H9w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3TJ7FUk+lF7Jkyx3XeOFch4BnPF8DUQNAPJlYdLvqNX0n6rnVUeEqABvrcRO/k2fjGLQ4cCGgmjbRbu+06EOY@lists.infradead.org
X-Gm-Message-State: AOJu0YzBJ/q+5vHAc+PU6TDGEFrtnUt07I+PD1FVklz6drvU4boJ+a+W
	5XsP3ZnMU4tyH9wOGL0oWe/kTrWFR6Rc+IQgXtU4jtpcEkiJKVmbNH9OjZcDThc6//I=
X-Gm-Gg: AR+sD11O/NySyV8BkVtmk2IkAOX3RiCoOCxp7Sz5zpl/G2zckxHeHTR+isq2Ma0izxX
	y2iOg/yvyNsnF7tykvEAt1RyEJu2cMXwGflVlkTgoi3C6cF8fdTj85qBH3soG1NBEg39VgUQ7TD
	heaonA1ur/UXiJd5i9MwD3ujCm8MwGcg1LA+avNOYs9aIVseB7ajBN145hW6VQ0unFFQ/IEphJQ
	e+y1LGUQ3jp4tZR9esjy8IZszlfpNhJ2NeZX+B9cnQyawWmpXxsL7V/+CaK0+6yDDcmP5zyZ4Jx
	aqYe5XOmpxgcJ8TlKg21VNZbSzXrb6K4tSEnmkJXwXkl9K9Gu0hWV6gw5iK+6/649v06yCtPqeF
	+DXfw95AAHutfHl1VRzPpBy6qzp1kU2RpfMrrFmwlPAjJoYbDELEvJ1KfGu7FC+Kt+qhgqbFiEZ
	wGxVD+iKr74z79EU2BEAjdCvoErGhYJhf5u2+iQnPcYC2aeZlORmbdezRUg/aWS1dU3T599Zn4c
	xzE6wbo4g==
X-Received: by 2002:a05:600c:19c9:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4995f8083c9mr1877075e9.7.1786091840306;
        Fri, 07 Aug 2026 01:37:20 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:20 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 6/6] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci
 prop to vuart3 and 4
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <8d24d424b3504105394055de268e0a11515635a9.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182924.193353.1528505361399129387.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=2379;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=/UdSyTf9Swt5Ml5qDkK3fqt0U1o1wltMS/fTtppqJ+4=;
 b=Td0FBVHZjwGzgXbgiKllL4oZyf/Dbkogo3BlU9t3xclOt5YoCOrEbt8mL9QHVk7XLfkFRJ7Wa
 6EY3etRH2R9C3Q3YQKlDY8mjaPAEc28k3jIyzjAH3Oq3M2RB4ymHQFB
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_013722_237108_8540D37F 
X-CRM114-Status: GOOD (  11.54  )
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

> The VUART 3 and 4 are VUART over PCI.
> Set this flag to indicate this information.
> Also set the syscon phandle.
> 
> Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> index 7c02633f2bd6..fbd7ab6332a1 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -722,7 +722,9 @@ vuart3: serial@1e787800 {
>  				reg-shift = <2>;
>  				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&syscon ASPEED_CLK_APB2>;
> +				aspeed,scu-syscon = <&syscon>;
>  				no-loopback-test;
> +				aspeed,vuart-over-pci;
>  				status = "disabled";
>  			};

dt-style check fails with:

    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:723: [property-order] property 'interrupts' out of canonical order (should sort before 'reg-shift')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:724: [property-order] property 'clocks' out of canonical order (should sort before 'interrupts')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:726: [property-order] property 'no-loopback-test' out of canonical order (should sort before 'aspeed,scu-syscon')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:728: [required-blank-lines] "status" must be preceded by a blank line

>  
> @@ -742,7 +744,9 @@ vuart4: serial@1e788800 {
>  				reg-shift = <2>;
>  				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&syscon ASPEED_CLK_APB2>;
> +				aspeed,scu-syscon = <&syscon>;
>  				no-loopback-test;
> +				aspeed,vuart-over-pci;
>  				status = "disabled";
>  			};
>  

Same here:

    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:742: [line-length] line exceeds 80 columns (92)
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:745: [property-order] property 'interrupts' out of canonical order (should sort before 'reg-shift')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:746: [property-order] property 'clocks' out of canonical order (should sort before 'interrupts')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:748: [property-order] property 'no-loopback-test' out of canonical order (should sort before 'aspeed,scu-syscon')
    arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:750: [required-blank-lines] "status" must be preceded by a blank line

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

