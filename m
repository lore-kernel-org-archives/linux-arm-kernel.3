Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EF0CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2hXuCp7EQSu2VY5F9OuSum1bbz+fDfBhTmNsUc96kw=; b=p9OF56KR58uN/E4jY03vwSfaLQ
	tC063MTcr+1n2GC+kJ8c8l0XnkI34BT6PBtMpAmr5IexHhNwZ4PA05gEiErabpRmNM6OI15N/QLbS
	2M4QMu7mtTppXdX2wZUTfuJG6wKIzY3sNvssD7JJ7AMQjm72xEMAv5nSPALlX4JRvhjG4Sqq2PIVj
	XLY1BLAvXmUNHdk/loMkdxf1dOhHb6qXyhCp/DzMOGo2/ctYfyBSOOr/2Qxb7Jl82NYMYyfldhVJ5
	FdvZa06JXCTV3xV5ST2Z5K1mY9fM/zw6SDZVmaA11Rigkop+RUQdcjl/jV0jRtQI9wTLmjqL+B3zo
	xb1l54Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bwc-00000005L1d-1aNi;
	Thu, 25 Sep 2025 02:42:54 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bwZ-00000005L0o-2Zes
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 02:42:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso502414a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 19:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758768171; x=1759372971; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2hXuCp7EQSu2VY5F9OuSum1bbz+fDfBhTmNsUc96kw=;
        b=Zn0eyVYpTfjUpng8zhage9gFLGpmRqqXFAwvF/XgAIMXaxsDXTvz4vBmis+401W/t4
         GZ8rvkzZWoSfzW/rEOctoogN7tfmurIEqoD07D6hqmNsQ3P2WiBPK1surqdplzWXO4xm
         6uIpNJFksOpNroChwHZAoRolMFh3wy1K98l3wodpNETcdcF0XYEHrYuHUdM0EtKFCisZ
         8x/QXxxUEqSsq/daPIk3ju76RXjCAGHXIqwuqAd83s9p5w6q5MnG7oubRmiTiP5s5zNH
         zd14uGEdU2EDJBA8IIAqU2lB9HW79TULJ0FvX0UQeWlQ57q3qVFIYvd6LwPHsm9Q+u2b
         yr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758768171; x=1759372971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2hXuCp7EQSu2VY5F9OuSum1bbz+fDfBhTmNsUc96kw=;
        b=Ve4zaKjIp28vqk1C7fmRTzBz/1O79eKSu6jloYXehd8LrWfwCFd5ERKZKxqhneeGM5
         hTcOEOQBPTawZpi4U80LDXiNLsTcmuKU2tgvM1q93+PNaa/0GE1I8LEtYWuqeohpa3W+
         GUPgtbNvxlZiTRccqV4gL2pBCBTQZ4ZHKBN51+VUsa2msNGqtBNhZYVJHAL0n0JW9ZhL
         hMOcym4LtMKJRGSN5mevXF4ATk3QgewWWzuF439OH1zozDQnonS34GJqsDtK4acdnDIQ
         1yRZkqEPMcLjt5/sIO5upKn2cYQEWEuUfoP9HodMLMKwhACQYa/U41QnWD9JFCvEX7S6
         VUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV+5kGL+VDbore0kZo44B/ccIRFZRLOhdbWd6H8z7aaHkB5k1rZX9Jgq3YBp9VJFqvjLptfalwCnEP8HnUSmaW@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ46cqKbuhT0UwjHZznJiekN71HEBWhHGRSA16TVtNQjd2WZzf
	eaH6LY1i2xeX2nFKAlRR96Y0zmcAT5tXPtrP7KwoSoZRii+4u/k/Oo/ZBGUsYX58
X-Gm-Gg: ASbGncvzEyOF8IdpRTNNGPdavYhIE74fDRGQCfVH0hcZzlxvzngV9nl3I4nM3/v6/PP
	xV1EGCj/7LweUh/1tI9idNOB6bKVYRKujEpTBOOnoN+Dw+Wkw3s5FpGQCqZwBDKdF83GUKCKCqF
	gLQ7cznMBGlq46i4RyoWHhXm1hPEMIjJvfqzuuBc3Bi52bOSzsPV6jUL/H8ZD09AVezyOHn5t+D
	Bthv3+2s0FOsPRZmxgudOE1rgWKxcP327AVfm4Lu/V3JTdQ56QgoVPtWFv1x0syBgpCcMe+YiTF
	3YcVQ06H+ib27HYp1ke2vqgYKG990yjDOhhr8bux8o0KuM+an8V9Jzx6lniVZ3dcjUW/oJVfrJ5
	7DZvB/0SfmrCqHJKaqVvuR/eVlWtigcyy/Ww=
X-Google-Smtp-Source: AGHT+IE0G2axEK95LZpQCj1blNLHLFhQYEdYLjR6DblWy6INXdm/D+7lSNoW57qRiV90T5B2V8ID1g==
X-Received: by 2002:a17:90b:380a:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3342a306014mr1784771a91.36.1758768170707;
        Wed, 24 Sep 2025 19:42:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm525656a91.4.2025.09.24.19.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:42:50 -0700 (PDT)
Date: Wed, 24 Sep 2025 19:42:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/4] hwmon: adc: rp1: Add Raspberry Pi's RP1 ADC driver
Message-ID: <d07158fc-678e-4ae4-8943-168146a58fe0@roeck-us.net>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-3-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925000416.2408457-3-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_194251_652626_55E1D3A3 
X-CRM114-Status: GOOD (  12.65  )
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

On Thu, Sep 25, 2025 at 03:04:14AM +0300, Stanimir Varbanov wrote:
> A five-input successive-approximation analogue-to-digital converter
> with 12-bit (effective number of 9.5 bits) resolution at 500kSPS.
> The ADC has four external inputs and one internal temperature sensor.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

I just realized that there is already a hwmon driver for
Rasperri Pi - drivers/hwmon/raspberrypi-hwmon.c.

Please add this code to that driver.

> ---
>  drivers/hwmon/Kconfig   |  10 ++
>  drivers/hwmon/Makefile  |   1 +
>  drivers/hwmon/rp1-adc.c | 301 ++++++++++++++++++++++++++++++++++++++++

Also, this needs documentation.

Thanks,
Guenter

