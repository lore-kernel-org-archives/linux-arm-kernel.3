Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A4ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czL3Mu97JDNqFcpEdZAJCI1Ps8ECPwFG6/c6zc3mY50=; b=o8oHVMFt+E1S0s
	x2rkWrRs9qjWhYOqiNYZyBMWpNUgluxjMssYB8A1loE39RMPTFoSXmMegePhPrFxLmk3VogxSJfWQ
	vY79s7Tjq4kBgG/FLnr4zX15HQHIqhBigzZ6UOHysGw9MrigcP2mQwJGOsANJxbbfuyX/9QysobtE
	CqO7w5+2b2n3QYNQNQiRAiNZu78Z9Imde72HBG7MfTpWI+VcnOZVsbIyeSaFroNGQCWp9oD5FLUA+
	XWbQaROVy9QniAQGwx90w0x06oYuXddLnxqYxT8yj86ncwXxSsL0T6zj8oHfVbFTIxVFitgTG1rs/
	i2tDOK8gipL9tGD1bRUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKMM-0000000EEw8-014L;
	Wed, 10 Sep 2025 12:55:38 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKMJ-0000000EEv0-2DoD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:55:36 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so6328842e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757508932; x=1758113732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czL3Mu97JDNqFcpEdZAJCI1Ps8ECPwFG6/c6zc3mY50=;
        b=jFXKUUqNWPARAXzvesF0/ZPJE0nYABIX2+viadyKR6soi+kpnZlzEbB/3S0SgO6znU
         b3HpmIAyFce2suTUllhGnY0fJkLYRwV8LdKT4uB6qK1b0bY3fJFAMHWI+0/WoOAIu7vI
         URYz7O9myWGvGb7HM5v5M3tRXfuiabPm0EewtYYwgUmsaYvWVrr5K5mV6HV2amVo32rZ
         4uocRLkgL+sS2krT6L8W2xqWkvUMwb/HqKoSH7cgBenlthORz7Xw3Z4Al5Zv9H+ZitE3
         BCBYk+j6p2JdwosGN2vKAUNLEniMCartYA+MRFTdNc97QXesk9Chg2mJtaQTQThdsJuQ
         0Trw==
X-Forwarded-Encrypted: i=1; AJvYcCWg+abiEP2coF1AcKpGJuRYp317pOqG225aoOLef8br/JosJZFuQ4xE4SzDpHYpHEnm/8D75tngb4YiZM/fWBTV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxsm7sQRJf9/M1GiAMXbMzYGuUwNFbBbItFJI0wfFsJPLphaCx/
	dv7Qh9phhiPEtCCt0mPyA4d4AOvkc97VFmiSzdNy1JWWloZ77zIDR5wKRrBwkhwb
X-Gm-Gg: ASbGnctaimj8rfMLBZnv3pySpn+fMaZcQTNaLRQFQccvOUR+6UeLtYlb23cubfNWkmX
	4zZ7wzkEANnjF/JmxSQdb9r5rqWSUCKOot03sHJdGg9a4FYUVeevplvj8S9vs6kIwa1f6du9JXZ
	nxUWkgbmFtRuwoBRaaJ4f+fkRH8zeViVLQmOd8QYFziUSv4NT3nxJkMt3rzSPYfCMnVjkNc6MF9
	7pk2PHBcZ6LKm374pIOhXbZXD15H7V7opSoBQgNkuoyH5s6XVqYUPMeB9+gUEwCDfTMB0ZK/82x
	Pve8ttrtNSYOh93e5TgPqij+4TNl6zxWMQM67FbG/DYNX/U6nE7GgoEWRLQRZCCzb0x0Ctk+UuE
	nb6JBhLnfWJ/NK6Yq6vwrsGRtqDAXCiAAnydwvS5hG+N/9HkxIDL9NyE=
X-Google-Smtp-Source: AGHT+IGDuGyICDnpqnVral2jF7ncDTi2UEAE/EhxcLolzbZ+jUQubndXOuDAnjKzDhZyhXIMcJOkXQ==
X-Received: by 2002:a05:6512:e82:b0:55f:4429:15a6 with SMTP id 2adb3069b0e04-5626310e5efmr4768005e87.48.1757508931834;
        Wed, 10 Sep 2025 05:55:31 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681853d17dsm1199364e87.116.2025.09.10.05.55.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:55:31 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336a85b8fc5so50282031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 05:55:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUP7vAMXB4A6QUh+sFVx0YpA0a5YV3zh5Yu/beWdQ6sNIOwea6sGHrSfTc6bzvvKXtWtMDiB4ZA60s9wsqWyvPo@lists.infradead.org
X-Received: by 2002:a2e:a54c:0:b0:336:e199:6d95 with SMTP id
 38308e7fff4ca-33b4e07f1e7mr46456191fa.17.1757508930395; Wed, 10 Sep 2025
 05:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250901120020.181414-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250901120020.181414-1-amadeus@jmu.edu.cn>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 10 Sep 2025 20:55:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66wnhyv0x31bO2S1fWeJZzeQgdEze7ChcFb0VGjq5AjJQ@mail.gmail.com>
X-Gm-Features: Ac12FXxzgckCvK2PU-Ug8oHKsMc01hfEJlK1a7HMQ13AEF91phM76xhzrUy-R_I
Message-ID: <CAGb2v66wnhyv0x31bO2S1fWeJZzeQgdEze7ChcFb0VGjq5AjJQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: a523: drop redundant status=okay
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_055535_576430_76D16656 
X-CRM114-Status: GOOD (  16.35  )
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

On Mon, Sep 1, 2025 at 8:01=E2=80=AFPM Chukun Pan <amadeus@jmu.edu.cn> wrot=
e:
>
> Device nodes are enabled by default, so no need for
> status=3D"okay" property.
>

Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi file"=
)

Will be added when applying.

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index 6b6f2296bdff..cdf844eb8e05 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -218,7 +218,6 @@ wdt: watchdog@2050000 {
>                         interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
>                         clocks =3D <&osc24M>, <&rtc CLK_OSC32K>;
>                         clock-names =3D "hosc", "losc";
> -                       status =3D "okay";
>                 };
>
>                 uart0: serial@2500000 {
> --
> 2.25.1
>
>

