Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6040C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUkV8BywuFWcK3XlHlfeRzzwdT0Xtem3jQh4BxB4+2M=; b=ImIxIGPW86ygWARTauuFjn38/D
	+eClK5+tOiOZ9lZsyZD3NH0vbKqvGZXQj2mxrp49EcxRg9N4r3zYRkwcd88LjguRvNPEKj3RZRODy
	pGqAKN0TvMdLdbga7DdW/v9d/pMCkutVA+GL2Br5xDn07sWBfSbDNLasQ1D5t9j6I3MGift3V9UNC
	QpYjd1Xnwa+T513frFX7rvfGoUWF4QIrU6Je/4pX6gOc4B/Kj1xFYNvCwQGc9Mr8BZrOuMRqUGmBt
	yjivqEv/VvBJAO6WxtcqsUwibGauHqGeewQNKVs8iS9XG5+pPux/9KqvRUPjndDww8gnv06ur2EcH
	KnJ3MnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDO8h-00000003qCS-0uXk;
	Fri, 09 May 2025 13:51:47 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNFb-00000003en3-3sRl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:54:53 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-549963b5551so2368671e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746795290; x=1747400090; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUkV8BywuFWcK3XlHlfeRzzwdT0Xtem3jQh4BxB4+2M=;
        b=Ric7ECY2X307Mcry1N2zNrFfoWDENeQjsr8a8M0GrMova+mBN65hjVr1eVPf6+Ymeo
         AeUR1+9ywLrKOphBBvVq0WmQpwcKTbJ8zNhIC/P42zRx3djDalIiRBlJav07ylwsodd9
         95An8c46IfUzWCxDPyfNYuPpA77w1/tiDF3kWdkZ8fO7jgZSF8tN6Y6uDDc5bhjKBiOh
         huFEoQaYCpePPqlh70pwbpJSlh2hkyK1uBLhcRv6zkMY2rhDllCPI2/fBiXScnBsyA5p
         6xVVzYAcDUIMgwu2E0FlyDYDHzyPvonpRoGjz1WuSkKS8u7YKwrns9cbatiSAc4t7E9y
         14Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746795290; x=1747400090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUkV8BywuFWcK3XlHlfeRzzwdT0Xtem3jQh4BxB4+2M=;
        b=WrKFnriJmkag+burdBMwJc9LVAJi0g2STKZejmAxKDIxHbKP/23NfP9/Fm5gfGqe7n
         v4ObJgOMeK2kueNiBYtXLzKCkfWnxQ7n64FuCkhYwPexIXt7kL5znrFsCb/gkvfylPZZ
         hOjbRJ+tu2gVi//HChNuK/N3qJZMoYD+UQeUGvGNkx2VFNtjPX8Wby4FV2fh+KE5GaEg
         whW6RH4CbbY9+aQqwB0HIzH9IvhrJRZCBr8iq+LHGNuiTq3ML/ZG0YfmLVYr6Ner53uC
         viaZ9VhpLIiw+BqeEZbPqgeLbl15lLNLljGVSv23zJE/Tna+oN+P+SRcbDnZIVORqhiW
         HCPw==
X-Forwarded-Encrypted: i=1; AJvYcCVry+Oa4e+jlXw4St+6oSknB3Rqpvc1QJ2Aj6mR7XA1tqTDf0HVzue8qZ+em+Gprr0S55lmxNDKLBONIqCaAE/7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx169eYkKDkorgTkFhJPZS8sOvxWo/PHSfy7QteJqkFMH3SGO+d
	72Jk3lWtvf2Du2EZh65HB4CZ+TbmT/D+n5O7WqLUas8WCch6UZyi
X-Gm-Gg: ASbGncv56fJFyyVCMXuE5F+jeCVeaqqpa2dxFOZbc6pkamEuZ9xrjV3cUZAWn0URaG2
	STYCwde1E+Bi6J4Bjmk6cLa09lsKtqu5xsjf5coaKS2TkVuCJlTpbZRAHyz6GuSjvLVVf5Vj6Oj
	qnTLcGuH/YBjjWHxfbJ4+le3QNCDKXQY3DF1mbOq/Yg0nRar1Os/EETRFfKiKyFwvfg3KLLdWEL
	0yBXbdvXZ4nm5EpaD6GOGM6oTC5M4MksYymVAscqhXPgqhpHOisB0TOAQxazO06NQmKScvc94S0
	6kvdmsY+9aZTi/pyRQwvH6AF7UBO3CsvA1EEXSrhUfZ99BbebZILrwT20oakp48mUItxnF2v4ql
	p1de7vfv6zCv9Icw8qBmzEqkofY3MEl1t
X-Google-Smtp-Source: AGHT+IGB0rBm4Sd2c2ZAuOBq1Wdz7EzM8zgvpzQWNHnTdOFbsdIwxpR9iWs0VxeI4bDlh0fT/50rUQ==
X-Received: by 2002:a05:6512:6506:b0:54f:c074:f91b with SMTP id 2adb3069b0e04-54fc67c95damr1229451e87.24.1746795289472;
        Fri, 09 May 2025 05:54:49 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cdcbsm270564e87.69.2025.05.09.05.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:54:48 -0700 (PDT)
Message-ID: <16e91572-b132-4246-9fa9-8e8bc4c24f40@gmail.com>
Date: Fri, 9 May 2025 15:54:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: Add DSPI entries for S32G platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
 James Clark <james.clark@linaro.org>, Vladimir Oltean <olteanv@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-14-32bfcd2fea11@linaro.org>
 <3ddde799-76b5-43f9-971e-a52ec322e9b1@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <3ddde799-76b5-43f9-971e-a52ec322e9b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_055451_966137_F56D7951 
X-CRM114-Status: GOOD (  12.61  )
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

On 09/05/2025 14:26, Krzysztof Kozlowski wrote:
> On 09/05/2025 13:06, James Clark wrote:
>> +&spi1 {
>> +	pinctrl-0 = <&dspi1_pins>;
>> +	pinctrl-names = "default";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	status = "okay";
>> +
>> +	spidev0: spidev@0 {
> 
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> 
> 
>> +		compatible = "rohm,dh2228fv";
> 
> 
> Nah, I really doubt. That's not the device you have there. It's
> possible, though, so can you share schematics?

Actually, not even possible. There is no DH2228FV from ROHM. There is 
BH2228FV though:
https://www.rohm.com/products/data-converter/d-a-converters/8bit-d-a/bh2228fv-product

but as you know, it is unlikely this is the part populated on the board.

For the author:
https://lore.kernel.org/linux-rockchip/20250213-calamity-smuggler-5d606993be32@spud/T/

Yours,
	-- Matti

