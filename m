Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507C8C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 19:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oooQh8dqRVPvirrZcwVugQF+meU4R3k+F/AmmfY0OUo=; b=OsTnyVLzgSrmoTjha31n6vDQuZ
	j2GY85/2EsqL0YyZksSm3k0ARo9SmE9F4eyCV9ck7gg2O4OnkynaeDkdNfGMA513y3at4AEWbQJxH
	RL6U8gWw6xccPCGf38vCHPs47853OJm/mLAYC1hoYr7OA+EftUqVgSETLhR7mRlLif6o1p5I0zrSz
	G2oWEYrFSMMYKWPc2wfoi3Z1DnY7WNnAY9e4K9ll13fEKsQLr/fI0eeRE2zlHbknNrntPrBvUEYNB
	YtcFr1go0Qv1BFynXSwAzgqiANQbm+1uPwsOYEVo2ov87fjH1lMES947GcNQXz+i+NVYqqnkjcPbw
	hGNvvnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub2BN-00000000Xen-2QAH;
	Sun, 13 Jul 2025 19:16:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub28y-00000000XVO-0alp;
	Sun, 13 Jul 2025 19:13:49 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2169711f8f.1;
        Sun, 13 Jul 2025 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752434026; x=1753038826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oooQh8dqRVPvirrZcwVugQF+meU4R3k+F/AmmfY0OUo=;
        b=lVoD/0R3ITvH1tY2b6/mmxIJZUzAbZVleEJX7mFKnqpiA+O7aWbG5NzDNO/InV8hMb
         9qgqNJJlzfeVy8yHS7b4wzaSZU2P+fwFmdR8bdh5r4aOECZ/t7c8RN90/Jm78ymqtVew
         DMHIKPFGVFrRGObIIRyWfATpqEfHFSB7G4LkHoldtNiMhseAdHnPKptMT7qmemVbwOAz
         5MYX1qGvuOFTOwq+SahpVH/FTGE81CAs0NJQrUTUgDgnVOWiB8WvwZeSzTOZsUsQRCyb
         48UGP8mgmV8g1RdMX7IwG861Rj0djcfKgrhi86wWfLub/UJhUMSmJQgCtrQtG3gzNSUk
         riEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752434026; x=1753038826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oooQh8dqRVPvirrZcwVugQF+meU4R3k+F/AmmfY0OUo=;
        b=PqTl+LmrN1hhhx+jX/VFxYTh+/58O3ydpOssz6koeE9jN1+PFm1wy0kGOgrg78CSEU
         WEQqy9Zf3Pl/P3ig1piYitWBqvHVTUTxmKtVw+CASvcS1KIYd7JiwjSqWaOMcasD/0Zo
         ltBUH6SOqmjY717UDf6d4XWCzywQAGbsstKVf4Fi4AlYF3/fKqWHFgMT5y3gSCGQ6CfB
         wIjj7paonVHAD76IyOPH9hrk/wDF+M3Fl1c+lUyMsZVnfvyTa5CdwX289IVmmszUbbbu
         2r2a+6YzclHGb8OtlxJJyhe0IPXSpHWftbt1How0ne1j3mPOSCxy22WlmkHFQhEtI/my
         saRg==
X-Forwarded-Encrypted: i=1; AJvYcCV7hj44J/YNXCHOOjDywCluuVn+95mmlhBBJlPeh5iFw6Lq9IsFdbEITll+5IHykOu89cuv17Vn50sr4uaZzko=@lists.infradead.org, AJvYcCWSl0iuil+fvG07P+AgL6c+LRPL0PnBef2t7EiZhWWmnmh6llOOaNQSg2sg5ekHOnB/9ywdMr3LIHQHWXwEzZiq@lists.infradead.org
X-Gm-Message-State: AOJu0YyJs5iW0j5HVz6bQocfx02TeoQl1MtVN5j5Wc0TqmfZez5tzd4G
	t9D1W+5HfxGSp14+uJQax0edHW8QGXT4CJIG/lXOeFWuTPJNMMss+8A=
X-Gm-Gg: ASbGncu0PcH5xS/46UUWq2Ic3y1FAzHe9MUEPsvnXhI5XGFA5PNOo0v7nMEDmQBsYtZ
	gYOy8hDTVP/ySh+t3tWqkhobxQpj2Je+uZxf4rcvYLYOOlNsL97lZwWRDereeH0M+TuYux/wtzp
	lpZFs+bWnih4AM4xExLF1kD74grygqTrwnWtdNtMsee9qhk8xxHKhO2kmb5zWJz4ECsgGRW+eSS
	3yvZyx/VNbWt4bhz+3L23H34o6dyY29me5IVHLprHHR6guc47OFr5fMEq4becq1WGK1QPITeD7P
	6vLsH3mv9XJfhkbSqNDV8ruTXIybu/gO/W1BqDgYFTnfKpAINubd+upL8KC6PRllEM/WibsEjFl
	xYtPEHrpAZRCk9/6fRWsRYXV81ylF+bXZAQlrMOHF9mfy3KvISU88rCkoisdVhJY5GVwc0GcwDY
	hnMKU=
X-Google-Smtp-Source: AGHT+IGNeHGBggvz35vdEjlIEqgBSfIcQabUpCb1c+vu131AXZr+/1qIYQWvMa0z8By/1rVOgsbfPw==
X-Received: by 2002:a05:6000:21c8:b0:3b5:f165:14e1 with SMTP id ffacd0b85a97d-3b5f18b41b0mr6088573f8f.38.1752434025843;
        Sun, 13 Jul 2025 12:13:45 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:80da:6526:1e81:c18f? ([2a02:810b:f13:8500:80da:6526:1e81:c18f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45615a4551bsm23035615e9.37.2025.07.13.12.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 12:13:45 -0700 (PDT)
Message-ID: <702dc4bb-7b3c-4647-b84f-8516989b0836@gmail.com>
Date: Sun, 13 Jul 2025 21:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250712173805.584586-1-jonas@kwiboo.se>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250712173805.584586-1-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_121348_188060_5B6D6FA1 
X-CRM114-Status: GOOD (  21.47  )
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

Hi list, Hi Jonas,

> This series adds dt-bindings and initial device tree for the following
> Rockchip RK3528A boards:
> - Radxa ROCK 2A/2F
> - ArmSoM Sige1
> - FriendlyElec NanoPi Zero2


this only sub-related to this series: Is there any particular reason, why
we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
what I can see all boards currently supported (and those in this series)
are having the RK3528A version of the SoC. I didn't follow the development
here, but there are differences - I did a quick compare of the datasheets
of those two SoC versions - it looks like RK3528 version has USB3-DRD
controller, while RK3528A has USB3 host-only controller. Also it seems to
have different video codec IPs and the DRAM controller additionally
supports LPDDR4X.
I guess it would be good to discuss this before this series is merged,
because re-naming *.dts files after they have been in a release is somewhat
impossible.

Regards,
Alex
> 
> The bt/wifi_reg_on pins are described in the device tree using
> rfkill-gpio nodes.
> 
> Changes in v3:
> - Rename led nodes to led-0/led-1
> - Remove pinctrl* props from sdio0
> - Collect a-b tags
> 
> Changes in v2:
> - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
> - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
> - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
> - Add bluetooth and wifi nodes on Sige1
> - Collect t-b tag for NanoPi Zero2
> 
> These boards can be booted from emmc or sd-card using the U-Boot 2025.07
> generic-rk3528 target or work-in-progress patches for these boards [1].
> 
> For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
> Fix UART DMA support for RK3528" [2] is required.
> 
> [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
> 
> Jonas Karlman (6):
>    dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
>    arm64: dts: rockchip: Add Radxa ROCK 2A/2F
>    dt-bindings: arm: rockchip: Add ArmSoM Sige1
>    arm64: dts: rockchip: Add ArmSoM Sige1
>    dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
>    arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
> 
>   .../devicetree/bindings/arm/rockchip.yaml     |  17 +
>   arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>   .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
>   .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
>   .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
>   .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
>   .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
>   7 files changed, 1211 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> 


