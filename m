Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FA5D26D60
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDVtzzCDjggnrGIABHuMI1ztRsI4OAs0dlS5olQIsSk=; b=jYTXpeZztTKJhyWQxUUrpH2VAH
	s59AuoqqioSpmuVTud+kHpYF4MEyjYuP1UqC1lsx8xErAFNjxdl1wN8h91bAw+V/B2ouEvUwQns8Y
	fmcHY8hWH+3kXHTiNuIuOAMvS2ifwPg09A2XPBcsnP3wNS0c4Xi3uJoR/JgYSA+mb43HBRagjTNbW
	cJwkZBX4UNRjeWOzutQ/N1pe0IgDTCY5WaOtlC+CGnRWuxyFsZxhnPLJp2HKqwj8DNNdNXA13K6Mi
	DGm190oZs5sPBGY52gk9nYAXyLtpZ8Fpw9CBZaqgsb76da5VJSPaTa84RRChlCPggx1SRlRGn/QaK
	54HpE3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEYq-00000002Vwj-17OG;
	Fri, 09 Jan 2026 15:38:00 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEYn-00000002Vvx-3Ql6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:37:58 +0000
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7c6cc366884so2331303a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:37:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973075; x=1768577875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDVtzzCDjggnrGIABHuMI1ztRsI4OAs0dlS5olQIsSk=;
        b=hXv6lYgju0exWuMLM4pSZRINxVVtqDCUOvf6SAXfnO+rdEQo6xQpsTNN4vP5L0EJun
         UwFjMHIurq1yaoudU2gB7CbL7/Ze2ALWhrI01pCyn6xQ6MaSWJ9ajU55oRB1a9we61qU
         1RhbfHBrF/DYIsRcqCJOYPRZPxq3nq6rzKPrUu0wEcy0xEw+5g5Dty5Eim454GZdkT42
         ETxwjK+uUv6ssJAZVBu5dLK+fkgYE/1U/kyNT4zqLBVprDrJynke3toAWkjoj5E3+csj
         HUsOnk7vxMuGeoerLaMEuzCRMvhkWcZj6nyhHwupk6EzWyYJfe7dyvJb48kC1v+casT7
         nhDw==
X-Forwarded-Encrypted: i=1; AJvYcCVKqBtj7UMheqcZ9saKSCQAQ+MoqlGWFQoMf+zhyAFnUwoxLjnroJPIJUAKyNpfLisZiloBcFjWwOZ4Ul0CybHV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Vhr4s6E4UG49iWijnyMTzzFJGxCy0XzTFtygiJNb9nnDbLxW
	vYzJnx9Ioa3BCygvkx3cK7nmcFESbnHIAXiZYZ+kRhEhCa/uAxdojxngJuMmjJ6w
X-Gm-Gg: AY/fxX6LOTH6Wm3PCBexynkLK5pwnNU+TIkKMfnuqmfb324ijzdWc4J2BbdgldcoHYe
	t2bixaAcnGyhG6Tan5LniQ53klTWgFkyQEQ5j5eQXk9lynaHrRFscprajFLFH0orgWgMVHF5GUJ
	3yqGlrDMGkoZ/3pzcZWDBoWONMV+YoPt/umtuqn6wQaGPKkepk7ZEhnhzjyF3UqkUfVzMW36Zu8
	JY3U7cfXEv3+imA7Ctzq31bTpa+VGXDZfHJrvbSQBGm3WREZfYwrvOW21rjuDZIz4uSMyVk0qrR
	nSPMtSGCji0kNZFW0IP3ue42e5CG7QOa688ME2A2C2KNgoGQ4uObtcUTQv40bmrFyGIQVlowPp6
	1xHU65+DJtjP1Kz55KeVwej+6bV2SyFWnCnexzqpnzywozUc/rDft6IzHDYCGXQQ0sKqH1T0GBi
	9RFCb4Xhv2hzrbkpYbPv/L8FR0HZMJP1MRPksyviUkYyPtZOuy/ETyM6s1q5Bu1vNs4I3tvO58
X-Google-Smtp-Source: AGHT+IFFRr3yCB8N9wsSNAhnisBEjFr+bC6MvSpCxW9vic1VG7Z0/dDsKQyyZ2pTTF+bonbZ/z8Lkw==
X-Received: by 2002:a05:6830:3491:b0:7ca:e8bf:8c4a with SMTP id 46e09a7af769-7ce50917353mr6136614a34.12.1767973075480;
        Fri, 09 Jan 2026 07:37:55 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478da6f6sm7382560a34.25.2026.01.09.07.37.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:37:55 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6d3676455so2235428a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 07:37:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5bTIoWHdfoYu35P30tQl6pliesMtB4DHH8Wcvw2BCN76WY1sXQbNJ+Ylc+AxFrARXETTaMhaWMyLsX2IsaoGH@lists.infradead.org
X-Received: by 2002:a05:6830:6601:b0:7c7:827f:872d with SMTP id
 46e09a7af769-7ce50ad0573mr7614979a34.37.1767973074949; Fri, 09 Jan 2026
 07:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 9 Jan 2026 10:37:18 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-4Dycowe8TukV7+suU2pm8yy-G5ukVeBD5=r4PFKo5Lw@mail.gmail.com>
X-Gm-Features: AQt7F2rWXpsz3frhT-_Ey7mmSLoD8jECIUJKTjNZwMNhWrvNHrGDKMFRD2wFgXs
Message-ID: <CAEg-Je-4Dycowe8TukV7+suU2pm8yy-G5ukVeBD5=r4PFKo5Lw@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: apple: Add chassis-type properties
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_073757_863390_0B582B0F 
X-CRM114-Status: GOOD (  15.96  )
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

On Fri, Jan 9, 2026 at 10:25=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Add chassis-type properties for all Apple silicon Macs. "chassis-type"
> is used by u-boot to fill the SMBIOS "System Enclosure or Chassis Type"
> field. User space software uses this field to to determine if a device
> is an laptop. The exact use case eludes me unfortunately.
>
> The Mac Pro uses "server" as chassis-type which is not entirely
> accurate. The tower and rack mount Mac Pro versions share the same .dts
> file and are identical except for the enclosure. I haven't found an
> obvious property in Apple's device tree to distinguish between those so
> both use "server" instead of the more accurate "tower" and "rack mount
> chassis". The latter chassis-types are not in dt-schema anyway.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (4):
>       arm64: dts: apple: Add chassis-type property for all Macbooks
>       arm64: dts: apple: Add chassis-type property for Apple desktop devi=
ces
>       arm64: dts: apple: Add chassis-type property for Mac Pro
>       arm64: dts: apple: Add chassis-type property for Apple iMacs
>
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 ++
>  arch/arm64/boot/dts/apple/t6022-j180d.dts      | 2 ++
>  arch/arm64/boot/dts/apple/t8103-j274.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 +
>  12 files changed, 15 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260109-apple-dt-chassis-type-f31523a1f681
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

