Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCDBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsZ1llpJlYq+AjYwqeb+mqRwUxkLzdHogXR1ktSXBGA=; b=1vdhyjKXYQ7250JzM7O+Jxy1Pz
	noAGTSLE3is9V54sQUugTTbVrq7tX2FEWh/JYTTTC2OjmeOVfsfijPbdUCOmJEsl7gd7lgr2Om1cn
	TpMN+4djZI9fXxRSJZxKjeuvgsCd7KjrglsmYfypz3qetCxzwhbHEFvO5qkpKWzYNyq2aJQn2X+ZS
	+UN4y3tyFBkphHwj5PlaqWjedHw0lRfUhEZWPWVdpLEoMjP0GbOWysTHLTrFiOY3IUV0FX4hezc2H
	/euKCSBp+F09s7fAu7+LhCWVDQxS0RmTh5E3aHTjFy93j0oDN8OJwfzV6FpVS/p94JGimrLi63V0w
	BRHzJDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhowy-00000005y2w-3Xwl;
	Fri, 01 Aug 2025 12:33:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhoi4-00000005n6d-2WXC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:18:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-458a84e2917so10241285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754050683; x=1754655483; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsZ1llpJlYq+AjYwqeb+mqRwUxkLzdHogXR1ktSXBGA=;
        b=U8dkm6JEpdtHs9Gvt2DpVDU5XG3LTeyKCYJxoTHFLpGtJz4N8KSvJaeYkaZulUde3J
         9agoyICh+i+g48iZMzMYlOJ8Riwj9WmkeuT0Yi99wcuKn2Bs2k/QlQOV+091rvc07prg
         +X1uLKxsjXdchDqF5IG+RPTGORXozpD6vvsRBk2bCGEKUjIpGaap7p+iNTnxqgrv5hPB
         +XjMztGJVb7Hl2L0Bvhxv2I9K9T3hBduuG23bf5sEZE1cLqPXb1vkkcpOCYsaWh0e+Mh
         VGPAdKtGGnwsiFLXI5lCBJP5SGeOF2yAvwnzvXNk+zCFK2ukJw5rwW8xUjgYJGO6s3n/
         wNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754050683; x=1754655483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsZ1llpJlYq+AjYwqeb+mqRwUxkLzdHogXR1ktSXBGA=;
        b=beHl0gcBvDGZiQAgbtivceCqV4M6uaf9iXHcluf/hz5IS7G01mjxBPzsPPzBEZp+wn
         9AwxpbfbcwlxZzaZtiZPaBxmi56L6SUiERZ9mClxSRguX4OQELCL2eyzJSTUofID5Sf6
         aMZi5EZOjxyoXEuo2p34WyGWQ+BdAJgfvZR1MKdpyOHfV4ifH4JGX4so/JogbzVVGVDt
         Shm7VxeirrVXLdT05G8JRhZzbJadQsUhEFR1W2jyjYmVXstp1T4qYNhIkcO5DyjpRCxS
         CIiU057fVYXVEO6ARcLXqV0ubMrvpfFrwOcmg+OTB0nzUw+iNyX4HkUo0nEFPiSfylOy
         Pgeg==
X-Forwarded-Encrypted: i=1; AJvYcCVOX+orp5N8gFaXrfWXnmtSsD4GAQia9XDIY+8vdnHY7dt9NjtM+7CHkkIpfvsQ/mVpSL2EyLrDeGCyJoJzMscS@lists.infradead.org
X-Gm-Message-State: AOJu0YwGXB7HpP67dp3NI0lTJVMKLrM96jD7zSDSARSxCeGpVWsEXlW7
	VdT//oT8P8G683M80A7rtr4iMIvLefVV6cUIIAH7URAx1TSqzomDFr9a
X-Gm-Gg: ASbGncviruJqtJm/2wUrY2HsaR9Uut81CkOvDUjjLOS6mL1i4CJu4ecC/M7B7MopLZQ
	DgM6D4OLDH7pvrBwDiLPo6UhfMiFWrPLqzDwLSXyTgXZSXErSFdi8s6BxtG9JwrAHVFs3M8GvPu
	26hO7rTe651MsXe5bgV47p8+zkkxUQ04x2wMnRsCKp0NyC/kltDpbpB/S+2x9jADoCzxIrCz2bl
	m0KoL170CRfBH/cx4LX0VPDrDVaD4H/oRk2QOC+W2yRFqM9jWIyK8gJgAjSvCaa3RFD/Bx/9GdI
	9eBFlYrOaFIXDXk15v8vA+A9G8Wptdfhae5Ml1CF/tEJVyquDxrKPsgnbqTyp/lhZ825vrv08Vs
	sAj9/yWm3rPpRFz8ixsGa+86h0XXxN081NI0CjBF1T8umJHpbJA==
X-Google-Smtp-Source: AGHT+IHrJFPu6CRAATEvAklTPqretPHJtlzsftD5zl+L+B6Yf1bmLAz9RezcD7RpfLo+BJQVo8zS1g==
X-Received: by 2002:a05:6000:652:b0:3b7:90df:c53e with SMTP id ffacd0b85a97d-3b79501f11bmr8833925f8f.28.1754050682841;
        Fri, 01 Aug 2025 05:18:02 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458af78fed0sm11896105e9.0.2025.08.01.05.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 05:18:02 -0700 (PDT)
Message-ID: <c39de58f-7fd9-40e3-b48e-b26b9b3ec5ad@gmail.com>
Date: Fri, 1 Aug 2025 15:18:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
 <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
 <CAOMZO5DfuRKYHkC8e4mNzetY204UdPDBHzUVy4M9pyjKpx401w@mail.gmail.com>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <CAOMZO5DfuRKYHkC8e4mNzetY204UdPDBHzUVy4M9pyjKpx401w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_051804_648159_3B7DEC12 
X-CRM114-Status: GOOD (  10.57  )
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



On 7/8/2025 4:39 AM, Fabio Estevam wrote:
> On Mon, Jul 7, 2025 at 8:46 PM Laurentiu Mihalcea
> <laurentiumihalcea111@gmail.com> wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
>> is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).
> Shouldn't this be enabled via a select in Kconfig instead?

would've been nice but I'm not sure we have an i.MX8MP SoC-specific config option for that?
or do you have anything particular in your mind?

