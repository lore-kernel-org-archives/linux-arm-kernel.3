Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F6FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWVl92ySB0LOea/djTBKxUFhK5i6uFHRlukNHQHiJp8=; b=j3S6MzNcXSFV9n8fXD8Xl+sB1g
	X13f6ACl055U9TNKzWl4awmx3JNgpFaT+x4G0kfPj9QjXeC534NonKqAobnVW2iuqkRvLo9Ka7ODS
	GuS0LkkcvVDm9T7SiJUWZgQjMzZJLEXMxIpw3Y+0vY1Cb/733l8hRjMhNdl8nzeJxr7V7SX2C+kJI
	NdC4VIpgSVysSjnQtqEI3Qf5tefS2ljAbQUiPenxWje8juVOsjpF6/c7ZugXWk3EOWa/ux4W9dxXD
	xsjHn4fe/FBipXkzfPO36yfbh6i/YHHKo8/Rti4YVpXhRh8FDGMhXyNy+GoW81xfmGn5ibyi4BCb2
	15UN52rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMpg-00000005L5w-2RKk;
	Thu, 02 Jul 2026 19:12:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMpe-00000005L3B-0if6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:12:19 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so19525885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783019535; x=1783624335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWVl92ySB0LOea/djTBKxUFhK5i6uFHRlukNHQHiJp8=;
        b=jcLibw4VAkgpCPJTZXftboNmeVo8jFTKvVVxz4jmsNRryYbLtIs/8D5y02fo0LsVLo
         NUfhslF06oanfOIWhO7b3y7MlcEuvY7+dBM1PaW3m5ih38GG/5fku2nUIFvBQUWBi9Y5
         YsY9aZg+4bS7skaL3q8TGrDn33XhvYrw2aOQV+CRfVDApStj4Lln1X8+U/IwrETliyvz
         qZg8288RRfBmiioa45/bo2034zrRsSmyuKtD0Idsoc9UhA/+05Iz9IrD+yrJyoxMV4In
         J7wKh6bI7/933SbBjJgFCufbzBmAriAbdqxZkjxDsQc8EHI/jyYoK26Rv8eh5ElpbAvi
         93Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783019535; x=1783624335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yWVl92ySB0LOea/djTBKxUFhK5i6uFHRlukNHQHiJp8=;
        b=InxsJtCzS0LY0CP7OOaNSCwfESoOPLuJSLeFezBCtJ64nIhy7Zd2acE3uX42tTi2Hr
         beXLB5AldaeVVPcEdjCBmm8fI/raPl2FnYAMXqR6dw6LPdXDcEQm21shobLTCBLZFIv7
         mMTVxAMwkGRhn12uIzgIBXKsAYAisj/7hBucS7x9dz8ShQi0kzcme6WfMRwQOf/qnxAj
         ML6Tc/zme5Iwf7d1TXtvXs3gajP7KacM5KASIaywa+ZzSIEW3P5e+wSR4Um9NMUkMayq
         xCmyW7wcq3j5XCE7iwjjNEQEJFKKkdQliK2rEJc+uL1qyM9HTjGcJJpzFNc5NNorKX2V
         pJUA==
X-Forwarded-Encrypted: i=1; AFNElJ8eBlB7RxX9CTZoJi0FfSL4YbFGEtLual13yBuT2i4bbXaPdczg37QLh9iyj5ssvQiYgLdpHjMbgBv/lB0y6aZR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz60uUUUpVAy3p7n20HXGWlOVmxRo/nNH8gxezrcg/ooBO83sGh
	UfMHL82eUrxxcFnbvfi8e2tjZDjDeyz96PzHrpxSD1XVNivZVgiPHgWB
X-Gm-Gg: AfdE7clbAHG268n1oMQCGEszDvUL0RnJ5oEMIsNDHiY9sIOb2X6emc5Qh9JkgL1CdB4
	3BmoIiEFpXhyBdv/Sxxl58FyiQjRzJ6uCGV77jHXA1ArEF5PfgOZHJDpdswKunRV++AphbpKmKl
	QD/AKdIOtFIqoVunqXIZT6MtQYJHXcprbfQtmmiivgA6Wl+aQxFcqhRrCy67mF+1SFHRGTQbvla
	lKUtTGnY9nEWhOW2fLcowibSPYXTMbE0HzTbmb7ldtd8m1QT4ws8kiejNu0zU41WsRWJSt0e15O
	kLUlgmhMbIrmDCJ6BT7A/tBKc7Wj5gd1o7MnlVWMym0yDYdgXzNwl5r2rqDfTV1Gy1xSdUN2bMl
	TVuEjs6FWPCuctNWN7e19li1tDGeg28ExDRQ+M49sIogqHwJttaYJxge9PhPD2lo/LkQs9Ey1OG
	KWRhATyiOMWsN/WC59Fb0QZnm8Q5tjW3Cjqui+rWL4FeB/JtHBFj8/MO+wKLr56M1/9LE+jFxyo
	nR2vzBF
X-Received: by 2002:a05:600c:290:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-493c3cd5967mr65147035e9.8.1783019535315;
        Thu, 02 Jul 2026 12:12:15 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636cc08sm83399065e9.11.2026.07.02.12.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 12:12:13 -0700 (PDT)
Message-ID: <eff80e31-f833-4790-8114-1ece4ed3a044@gmail.com>
Date: Thu, 2 Jul 2026 20:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20260630-dev-b4-aaeon-mcu-driver-v6-0-d66b5fcbd2f0@bootlin.com>
 <20260630-dev-b4-aaeon-mcu-driver-v6-3-d66b5fcbd2f0@bootlin.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260630-dev-b4-aaeon-mcu-driver-v6-3-d66b5fcbd2f0@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_121218_259631_13716770 
X-CRM114-Status: UNSURE (   8.36  )
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

Hi Thomas,

On 6/30/26 13:51, Thomas Perrot (Schneider Electric) wrote:
> +config MFD_AAEON_MCU
> +	tristate "Aaeon SRG-IMX8P MCU Driver"
> +	depends on I2C
> +	select MFD_CORE
> +    select REGMAP
> +	help

Your REGMAP select here strangely indents with spaces, while the rest
of your kconfig attributes (and this file) are using a tab.

- Julian Braha

