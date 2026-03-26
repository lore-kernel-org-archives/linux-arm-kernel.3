Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43A0109E529
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdrREemxYfCx5YD4EhfvcYVTWQ7/gTjv0x5FHQxyZYY=; b=ooNnazLmeSoplkRn2Un2VOARKU
	OImHPF5FC/aOC0cu8Y9Pr8rWGXGZbpLIKxvI+78+K060KPvHonrFQAoWvgfcB2qtpr2eqqpO1GQIp
	LNvzrvUWtOqGoQ+mz8WEgEwtX2uAaTtAL4+v8ESllP8AmRLsTgN09ZqEjG7kxZRpurKepawRObUSo
	W10KuzJpoFDQAVnfmQ2QqSvlqOD0rtWLy6YnXL1MKAParovOQQW1/SAlBhq6FFKC+cOExxk5qkqk9
	nRtQ0Eeli0OPUdeQNFCIoXsP6qC2hSzAME9DFzAMQSTDYjbeYVa+QcJqbd6tIQ5WQh58EMA66vgQu
	V7uopoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cmE-00000004hXh-0Kee;
	Thu, 26 Mar 2026 04:57:02 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cmB-00000004hX2-1Q05
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:57:00 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso1010945eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 21:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774501018; x=1775105818; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mdrREemxYfCx5YD4EhfvcYVTWQ7/gTjv0x5FHQxyZYY=;
        b=AJSjpjhuQTAKd3n01sbr7R0S0mKUV0YqxEUwlPypAtfpc0VHnaF8mOQe9Z/1v0W4UZ
         cWB/MAq0K0f6YnEgJLlsZw0EYjSu9U3/0JV4B2iENGw/geU+AMdSdVGgLzI5AnOLAx7O
         /vQfI5vgtUs0ab6LDaUPiDFOBGw7ou2g96j4KyQKZLdrgLbBt1npiRVblU8YzXAghf9w
         TLpo1aB7WuXacI7GoZNNV5lrGtpN9FzXKrbApUv9N81IXrmrMRU0pSTQpRbxxZdaY1Sv
         F1Om0o/ukw68EAx6k9Lr4QeoKDEMDC4ZDIBT/+2ZnnbB8gEEasYpPVzrPtmn3JVTSr9P
         dLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501018; x=1775105818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdrREemxYfCx5YD4EhfvcYVTWQ7/gTjv0x5FHQxyZYY=;
        b=mAaBSTpABEZQdjOpbtCNjweuDHvHKfmEAKbNprMjO7ZxQW01tPmnfQjY+5GTO1GHqC
         /atS+zR++INhAlPVY45ON5Pxf0ymsaEfnTPXZSWddx2wKZiubVJPgc3goRZRWOIhhGfE
         T3W1bo6uvOzlSux1PfpQifGI9RrRNCr66X6dMRJKbBjfFmz8bH6aqg49bJsHQ6DLecEl
         643pbQvb/UwxXdrKm+sWRIIa3WO1sSzwgN0uiRCPvpr7ksZrMmw4l0pj2sCjKYYyCMLJ
         yfzbBpZPowftgMt8spQxG16QooAMTO9lyQ2EWPwC29mNE+RSIZ1uuDN4B2N4lDoLCNXu
         BIqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7KOy9ug58xzDtq96rajXORJDOK506TBjdv/fPGO0w5D+eG9Zk7MIC1tGXlGsZxh3JeFvFNazc8RGYRU0O8jFt@lists.infradead.org
X-Gm-Message-State: AOJu0YxmnPMz8D0zXf5bV5pX8WrXYaZe47+E2TI3dreHr+9EmmdIMBGD
	kCSIDl/tG/Ps6iMMAnYcA2xutpxPdAbW/aTx8+62j6v2ENGfofn5L5fD
X-Gm-Gg: ATEYQzxpTMuSYmluslI71aLCcqVIYfc4IY1tXIS7K/UOYy1hw8SoZwBgXrAS0KJ14Ex
	DfLREBp5uefPdxwBw6N0WQGJ/HhPQuH9bdSQLxqew7cOpYgURWO6GAdsOwxbUPfSG5VZrikHFQX
	UOxUvsGgtWEHjvK8u2DUL11oIDtqIn/mHhl4qWaKTBmv3ceYLWbdTagRXD4dLwY7fHEiGWBdRgO
	crOpCFoPbx3pEkxu+OS5YgN+Z7+RSK0HzobPXYgN+qE3vur0n/Pcoqh9l5L8zFQYITV+M2vBQOP
	nZuFf1r1WKILbkJSyEnfQnad4lu4BqbiT22jpJq76+j0C3IwE644qBcRTBSLQBxBzYIHPPTlAVh
	4PILEA9NcEw1dIlSm+DnaJ5s0DTBGO/50OoNvaJQ26Sc3pfv+/lHDDKqkUz8xzegGz29vtfzqtd
	n3oQTwdgzL7AaNHrF2Yk7g5synAbPPr98jNzOXV6JCZCEVZTgI0Dy3tcBfl+9c1lCeiLjEILXt
X-Received: by 2002:a05:7300:430e:b0:2be:9989:331e with SMTP id 5a478bee46e88-2c15d2805admr3224190eec.2.1774501018257;
        Wed, 25 Mar 2026 21:56:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edc0458sm1635295eec.21.2026.03.25.21.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 21:56:57 -0700 (PDT)
Message-ID: <478e7388-f91e-4e26-bc47-eef4ec5b1c1f@roeck-us.net>
Date: Wed, 25 Mar 2026 21:56:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add support for AAEON SRG-IMX8P MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_215659_392130_88FAE644 
X-CRM114-Status: GOOD (  17.31  )
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

Hi,

On 3/24/26 12:24, Thomas Perrot (Schneider Electric) wrote:
> This patch series introduces support for the AAEON SRG-IMX8P embedded
> controller (MCU). The MCU is connected via I2C and provides GPIO and
> watchdog functionality for the SRG-IMX8P board.
> 
> The series includes:
> - Device tree binding for the MFD driver
> - MFD driver that serves as the core driver for the MCU
> - GPIO driver implementing the GPIO functionality
> - Watchdog driver for system monitoring
> - MAINTAINERS entry for the new drivers
> 
> The drivers follow the standard Linux kernel subsystem patterns, with
> the MFD driver registering the sub-devices (GPIO and watchdog) which
> are then handled by their respective subsystem drivers.
> 
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>

Sashiko reports a number of issues with this series.

https://sashiko.dev/#/patchset/20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794%40bootlin.com

I can not comment on the non-watchdog concerns, even though the ones I looked at
seem to be valid. However, please address the watchdog subsystem related comments.
If functionality such as CONFIG_WATCHDOG_NOWAYOUT is explicitly not supported,
please add the rationale as comment into the driver.

Thanks,
Guenter


