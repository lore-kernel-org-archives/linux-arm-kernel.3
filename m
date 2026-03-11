Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78D1FD88D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 00:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEWsH70LiQTCzWY9XNlcF1ykIavavEQbO1LmIg1XHbc=; b=T/wR2w5GvWZAowoRrPNLfu53v6
	vu+N0n+c16o4qoKHDcMxaWh2ioJ7uTrV5AioWgxEwivK5eL2cF+VI76LDrE4RPIWFMG1Wwj0Pso0j
	KOXjgNrN8DigWRb0ChKrnj+iUBa19sL0XIMUKS2r4hiT2h88mCcAjSd3y+OIDdkzbhNypVxaugrWX
	zJh3RxWzoVb29za54pmkKkl7rps2oYOmEHyklWgNZECT81Pii6PjC/5CeVwi9/IJVmgLgDPw7qGoL
	i4oOfSEQkQxHkISPQ03bI48+iIbFCMVcImqx63As57sYrM7QdkRXPUiLwyxcCDAwgyTur3QntpoIf
	o+ARXH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07JT-0000000AQbI-3HgX;
	Wed, 11 Mar 2026 00:20:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07JQ-0000000AQZf-3SKe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 00:20:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439afc58ac7so10772555f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 17:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773188430; cv=none;
        d=google.com; s=arc-20240605;
        b=HFE2nGdCHI1u1XVSBXlDOnOMpf/SvxqCUogsICbUelgYoMLW/t4qYGp7f6T3KuKqyT
         AqItMCh3pRMHxZZYfAZ2WmOlRG/54sT3JJuFNdoOIFNoewJ82IK1JVWQiG1wT0WcqY5C
         ouJ/Rwe8lA1SXhei40ZeaAbTEi8LTmv2+YN+EfnDZ0gO+r3yEBz280b8oHijuxMzBArm
         F0CzIUnApdmcI/cj5/aVts2+5NGybfBlpiIpiRHRBaJJ/DfUiwANcY5MxQv+Ge9U0dlv
         ZuOFWvRFFfvfh8RA//g431OJjtP2jY8+EaOhDx7tfc1RD4BjUrCfPNP+REO3WICvmrTh
         Kgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JEWsH70LiQTCzWY9XNlcF1ykIavavEQbO1LmIg1XHbc=;
        fh=FONT68HXt46FUMuFPpGMPGY9wHGAltOP4A5kdogPuNw=;
        b=EWYIQtm/yjYznZdAhycslHlo0FG4Ze2HBkXQ44B9LpdLA2KFffO9FvY9kRYSsqpxef
         P0m4l3a9soQgOJL1lwLSQGSInsH5zCc2ECsBPRrl91oFfJwQTFqw6Md7V9efhZrE36M+
         y7sfS/UsPuPh6ygg86JllPqOhYR9XwBLPGaLsu78OjkfXb51d6DP/mpnWg36PcTSu0J6
         43c9se+rg7g7FpeAPLfvyMBXJKZEBdn3TrERozE89BMou8aBxBuBxh+EnxiWsDWDjSCW
         sNFt1JCVh78m7xO3o5m2ro4e7hWs5cz3pKfEW2ERSYi2tdIEcwMbZsdbI3/ccVHL7ON2
         hnHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773188430; x=1773793230; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEWsH70LiQTCzWY9XNlcF1ykIavavEQbO1LmIg1XHbc=;
        b=S965I4MI8xUnSYCLAJcYOH8XX46AkP8Npvl7DVUXGyQ4luMrzmN/mB0+KNvJlLCQRT
         fRLG0sEHkHlOSZSgGdZyZQfnx10ZKccAvm6An9+/QdvqrQLXSeDHVznHfn+6rlNCuGew
         M8UTOCC+4Vnn0QsymREoJDLS1trduyPNxZSOO9APP7JKWa+ya954G7WC0yGuaSwnojQD
         Pu3G+c+nIxrTaBMNwHfZOQVbrua/VDdXLkvFHU89oJZdDpgIsRMPPLodIRggpbyxqU7O
         jWerY7uVsX+4GWSDhHwZGtDkMIGdILDmN1h4lxru0PgddNipF2UbMBiYMA7qMeHFZf3q
         3zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188430; x=1773793230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEWsH70LiQTCzWY9XNlcF1ykIavavEQbO1LmIg1XHbc=;
        b=C9R8GgmBVQWdWa4vC/f18HDWgQmbqH0PHFxWbW3vE3m4Nq/Lrl0+uKfSsmyBbk/Zw/
         hYMPnzPANN+g3HdlL5Qh1oRfUy6p7qDMn4FmQ8E3KY7uaDRQx9tSFjqOt0D3Xi9VrVib
         VrRtYEweAfyH7fPaZSXbjPdVx2nWofOReMyeWT6pNm7L9WUt+DSwc7idqJmcYF/Pz/je
         xEY6X1pU7S4lHPfsYzy1NG++EZMXQ4d1VTTc6QcwsiEBfY+Je8pVSM6ZDGZiR/yhCsdv
         EUt3j+EUIZMPGeFjQUGlsKSHXq5IT3HEsMkt423IiIbg1x4Vl13p0z+0cqt8kQx/lvcv
         LHwA==
X-Forwarded-Encrypted: i=1; AJvYcCVbhKHo/56gJ4t2dL2WeuSsSrM+gqHlH1tq5jUY3dFaLH2szBGQy2WC5UESEteVSyDnukE6tgFTkIEtNcGxj8uO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2K2twjB0M1WVogukxtHDPOgpY1Vf3ZTsyQHkn1NnpcuyVF1u8
	HOPKOXznX2L0QKrEIwigOsCOb0PWuhIm4/ugz37LfoTu73fBq/L8Tvctdbs5V5WwvTzWJviWnqX
	+c5PChPN4fLDkBETXnYWXNbBxOfaElW8=
X-Gm-Gg: ATEYQzz1tlDmK1UHrtM8J3zINCwIkOJ8mHLlaZzhFAmeWkMJ1Ey3H6mv5lQIvOYugRC
	eMPuA9T8n6UmzKl59XQ4UJ57eAhYzYgmC3ePczLf+iuUa6Jg7+rQUjrQoKQUCr/Q+3n4S6tWiDb
	PtxHZSWNjsxauZBve8bz8yRcdIJm0XiDPqCPgDGo2gHK5CO0wOMoC7vlwoxHKSyzl0VZiVfpahb
	GNI6UBQQ8cvlqoM78LsvyfusjwTlbFQrEJfrUgEzW483mZHVjvqE7K7SnxLFzM+FD4f++fQEk3V
	zJ6+HuRqhIBtLp15i32Jn73LdtG/bWe4xSyfAIU=
X-Received: by 2002:a05:6000:26c9:b0:439:be4e:6e58 with SMTP id
 ffacd0b85a97d-439f821fe85mr1356532f8f.47.1773188430081; Tue, 10 Mar 2026
 17:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260310031002.3921234-1-dennis@ausil.us> <20260310031002.3921234-4-dennis@ausil.us>
In-Reply-To: <20260310031002.3921234-4-dennis@ausil.us>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 10 Mar 2026 19:20:17 -0500
X-Gm-Features: AaiRm51PAI7L0-07ByzfYcAg2ZuI_NxhNytjlEljQJmd9vtbdXeFbAGFh3Mn-oU
Message-ID: <CALWfF7KD1=U-gC4wC9M49kEYD3ijcfr+XSmMeh_-zAvjO2JVoQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: dennis@ausil.us
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Alexey Charkov <alchark@gmail.com>, 
	Peter Robinson <pbrobinson@gmail.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_172032_873359_1DC36E9C 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

<snip>
> +
> +       vcc5v0_otg: regulator-vcc5v0-otg {
> +               compatible = "regulator-fixed";
> +               enable-active-high;
> +               gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&vcc5v0_otg_en>;
> +               regulator-always-on;
> +               regulator-boot-on;
regulator-always-on and regulator-boot-on does not seem right.

Why were these added? The vendor did not have them.
https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts#L216-L226

Was this mistakenly taken from the regulator usb 20 which is powering
the onboard usb2.0 hub?
https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts#L111-L119

> +               regulator-max-microvolt = <5000000>;
> +               regulator-min-microvolt = <5000000>;
> +               regulator-name = "vcc5v0_otg";
> +               vin-supply = <&vcc5v0_sys>;
> +       };

<snip>


Jimmy

