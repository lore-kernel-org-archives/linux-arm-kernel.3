Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D38BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCk8RqcIdhP8uF9ql+DEh+iIumM5FUYrLBf68Hu79HM=; b=PEN+Kq/i+v0tQt6SmXJQ2UQjXC
	CxCJPMoLvQpddDKKWs08eiwIdRCyys3zmc4sDvlBLF+jOWs7TrcrA0Oq8Tj6nqsdpldOIq2Ut58Gx
	hyexES/oGYLnRlJ2mmX1zbMaQejfhgsSLQW4u4mkbjQEx7FT7YgerJQhXxWO58zEtm4TG/Zn50zqX
	KUfr+mMQ3dgQ0P/w2FW3mHZULaJAMpadiFZ1ZO8vN4at9QkIxe+wjManL3i4lg/Bl1UnBcMUhVvmZ
	taJfIxNTIDmrbABR2YRPL6PXZGZg31tpOFp1U8WN+RfxoxOyk0OaAQHdEINuuBKhscXQ3AdBISOrS
	z1VrNeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuy2-000000099x4-0FOm;
	Wed, 05 Mar 2025 20:03:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptrR-00000008yZO-00ul
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:52:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46853755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200771; x=1741805571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCk8RqcIdhP8uF9ql+DEh+iIumM5FUYrLBf68Hu79HM=;
        b=Bnyn72LRc52Dzvq5Ws63aWpDCZC0sRQI0xN/6zWUre9Cu3/N98PyrA891asZbnTRRb
         brGflKCwsqb8bTy2P7MmUaJMdb00eqVBvfFuzGrH8uA0QvkTi62YjVekAlc9sipqV3MQ
         9BZJ+xCUDlxfLi4tMQzlIZL3ORBlDZSyByJdD3bE1k22iwC0YbftpY6UpWqVeQaMOlH8
         3OhgoVwt5bNrOYggZlBFLth/P2bcgJbho2o9ZU6H5Vvx0egcuxOCWdGPmhXNZxUxntJr
         wmP7tAtPr0TuZ+A3kFbbWjLl33J35rMPMph9yxedIReJyNw/l2nK4sFHXQfyyq1U/BSZ
         8gKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200771; x=1741805571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCk8RqcIdhP8uF9ql+DEh+iIumM5FUYrLBf68Hu79HM=;
        b=q86KQoWqEq9qHNFL1AfCpVXejnUzGXwqWA4vtPsRraGGLrzzx3dZzyY3gaonG1gHoR
         4EQKekIDqcR/FBLM8QJe8q+5VEUzdfpLv9zYu/D8gK0cqPFrGowEw8vDJy07QS6WwtRg
         BSP9T4hvPPDEmCMQCHPWiMxx7L2ox7tqBUUiHgKSHV2VkyWU/Vg0HsHEIx21Z9LeUEX1
         jxKTrhAQclpq86LtOejbcUn55+762O3r4tV3eX8VGxjmTo+PhcrtlrEvpsstTT7cGlra
         pXMfaB8dQa3o7vjGHifmbyK8h6Wfi0lZvK0jaZcIakaltOgjqWS0bBbLkaCsS1BK57mG
         aWPw==
X-Forwarded-Encrypted: i=1; AJvYcCVIYX8gFRdwDLqcWMakZw7LnWAfHtxfz1dUmJ0TAoLEg2cq3fyNxbiy7Ui/RYN/JDwMD57vXRaN28m297Jpaa2s@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb8sE/7cFtZaPeOmod+sDInd0b0pk/th9nT1tF2MSTzjaErB7B
	//wslkHjKePCTi0bKOqeEwnI/JstHMVyEAnt4JCFm6B1wvti5X4e
X-Gm-Gg: ASbGncu9HS5BRLCFzhMObzp8K0Dw6mCnBlJu9ATWsn6jR0m3AtwNqZf8ScZ7HgPwxqQ
	cWfDMHvjurKzRU3u5+E2jwfr6WGnLvYnWgg5hmK78eM34BluVqcvaaI+KgEKW//nHCosaOPnByP
	q6n1mY+x6ScMgOLvizpraiiDlT6482omGPeeH2kon9cMuQ3Ghgy5AynZlB3BW3wqdS5Y42zSE7E
	tclBVs5C7TE4xcwW875fpxmwbeNGw0lamOL3tDJdfK4yS6wFUR/Y+9DhtxVWrBgBA4Ngsm3mRgv
	l1QyLU8CxY8h4H3AVp3lCCP/B94gPBFMhx0c0mos+jIBZ0ujqzYzmvZa+UVzyWVhb5fDV1JJIip
	J7apbrXNBLkwy9oJuREQg
X-Google-Smtp-Source: AGHT+IGuBKbnktunZBzzNzT71sHvzIIvBdO54em+1pB/n3NbwE4YkF3yitXy4CaCKxQdjWZt3gt1lg==
X-Received: by 2002:a05:6000:144c:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-3911f726343mr3775397f8f.9.1741200771124;
        Wed, 05 Mar 2025 10:52:51 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796084sm22209780f8f.19.2025.03.05.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:52:50 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/15] arm64: dts: allwinner: a523: add Radxa A5E support
Date: Wed, 05 Mar 2025 19:52:49 +0100
Message-ID: <1888259.atdPhlSkOF@jernej-laptop>
In-Reply-To: <20250304222309.29385-14-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-14-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105253_038849_82D68379 
X-CRM114-Status: GOOD (  13.13  )
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

Dne torek, 4. marec 2025 ob 23:23:07 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Radxa A5E is a development board using the Allwinner A527 SoC, which
> is using the same die as the A523 SoC, just exposing the pins of more
> peripherals (like HDMI or the 2nd MAC). The board features:
>=20
>   - Allwinner A527/T527 SoC: 8 ARM Cortex-A55 cores, Mali-G57 MC1 GPU
>   - 1GiB/2GiB/4GiB LPDDR4 DRAM
>   - AXP717 + AXP323 PMICs
>   - Raspberry-Pi-2 compatible 40pin GPIO header
>   - 1 USB 2.0 type C port (OTG), also power supply
>   - 1 USB 3.0 type A host port (multiplexed with M.2 slot)
>   - 1 M.2 M-key 2230 slot, with 1 PCIe2.1 lane connected (multiplexed
>     with USB 3.0 port)
>   - MicroSD slot
>   - optional eMMC, 8, 16 or 32GB available
>   - optional on-board 16MiB bootable SPI NOR flash
>   - two 1Gbps Ethernet ports (via MAXIO MAE0621A PHYs)
>   - PoE header for optional supply circuit on one Ethernet port
>   - WiFi 802.11 a/b/g/n/ac/ax (LB-Link BL-M8800DS2 module using AIC8800)
>   - HDMI port
>   - camera and LCD connectors
>   - power supply via USB-C connector (but no PD) or GPIO header pins
>=20
> This .dts describes the devices as far as we support them at the moment.
> The PMIC rails have been assigned as per the schematics.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



