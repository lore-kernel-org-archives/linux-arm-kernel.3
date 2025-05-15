Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEFFC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=; b=zIEc0e0TmEAZtJIBSryJDrC/85
	Gq7RjBEbvQJfgRZjLGe7ueWz0n4NYODMyNWY7MD+//FzPRzH4lFdgfblDoI70jlqEbeg7rPDpnaos
	ve1ZrfnHVpWXbTIJLBxx3Q8UI7Avc44UdLxnPmTWJskVk/7aAoNQeRJxcHHxu4xVPP0hYXWV1qkQW
	xpnmmllKWifQjM2bt2XVIzxr6rFNBd+Gz4Z3uOPRaPip6vyPgB/AFikmV2ThAgfBbL7dhOHT0O2Ds
	VJjq5OjtuJEBJtOs9NiyMNQnIXPctcf1tfnHUWQbfUH0XgdKzlFwi6NGKtDTuoaVFUi3XdATTJgO2
	0m8gzMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUdF-000000006jz-21MA;
	Thu, 15 May 2025 09:12:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUMD-000000003TV-188U
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 May 2025 08:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=; b=NjxDI5bbWmTgNIMzKsy44flIUn
	X42JiRD3acL1BVfVXmlUuNcuniWHQNsjgw7cOMBRvW41FlQwfoLKCmgaaR/7PfIfgcnpTpXZqvD6G
	ocxmeXeJrhCmxIiTRP9lbOif0rklDyw8V0pAM7xtA/+vDt3jixuE6dnPPdU4kdFxdhqXpT711R1wI
	klZp9KrzASKi5/WeNUlii264DEc3fvKsp0Uhnl1ZMZl+wC7tih62s6yfIzbNrf/7LLeFyWZQBeA5b
	i8ImWRaPgkjXepDVzMDpjnmZFozo6IPdp1Ex//LHJwNRPqG/Ku+Z03aKBxqyFSF7+Utv19X16rMsh
	nhFNTspQ==;
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFUMA-0000000HQ4d-0yO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:54:23 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso6307911fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747299259; x=1747904059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=;
        b=NB+vOn8aIlh4yBtV3tBV8yxWV+n3WKZq1NXMTs9DqFyq5HC2zgNvk5Jkc/jLB0Ve9M
         iwbH+57xNYxSe/NtPf5azZNtLtv8hH9MgO27CQ2zA22I6RlkmWcauZgsjRiRhOz+hQZA
         wanlD47oJRkt164iV952XVGVsoMznkp8XfGwlh3So+AIw3HVr1le7SxLCIkqHoq3n7TI
         WZWFUh1XDBr9ETK9BxRuaqiQI0KLilYQEqp5EHZslegHruMvNw4wVM70iThQxvm1P7oT
         oDymjFVVEVVvrllCpfZcnLawzCe9tpEcdt4EnzAyhkXUohNwV87riIDkwbfDcuAxD8cU
         zEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299259; x=1747904059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a7JvnrWNRYAOhJGuJiHPvQ8RmC0zHeKbDlxT+TMUjbE=;
        b=LYFYgwyqXER9QINj/da1Vc0lYz/i0Z2lrx9xlvzNtPD0bmVw4OxOaVUUJ19DrbP4FB
         UJgVLpILeqqzTJ5USGXMGdhtVTj/AyAu88Jp/U6lUb2omGjn8bg9mU4cFJcNhgHXB7Q3
         eYeL5YkyoQxFPANpDxWIuJS15cpg8W00oBaWO2zy9WOANn3Zo0KwyTnqz5DwsAZb8S+h
         tQ7yOXZ6d5rUolr1Yc7Ks4nUnHbIwgVOrf8t3ML7OHAAMyCMmt6konN3BLRE+q5AWtqj
         DuaDZHfi/14MjuJygjobyoVW+XSkLjlFKfBk90cMxCm6603zoGMcWTiMF8nAUE2gATIo
         WCsw==
X-Forwarded-Encrypted: i=1; AJvYcCU2wJe0t/F0jj1VHbWlveneTZ2gfWFtZnaZqI0HX166tO2znwDFH6wvdggLXXi8HBjZf4Ev1pa3sCKewyLv+iHq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0EwcWABGNTL5pfDuq/6GG8qt81Q3/vnmH6JHwjrtM9G0R/XUp
	DUgqz7qBMky4+AumYJYqjqNp1HzHSHX7oDYl/AEFwm27F27/T2d1
X-Gm-Gg: ASbGncs4FKS6WLVrp7seapFfqXBJGhAz3ZO1V21cfLo+N1vcZGZoquM3CeH7XdEsmO7
	LYf6XHOSu/zqq4ditTuaPwLLFKcql0ov2H1pwuMVUnWZu4/TtUrwpZF/6yOMROrEwaykiBnmSoY
	mle5H1IqUu1nneDHHU5sGvkHyf11LrEl8e+HmRIosoudQTwDNsB4W4B0OfTg20i81lkoMgOvCz/
	5feEo5Yn6ZGt+u8vjs1baUR/fCD94HhjIKAIwaMNieUnsfo3Dwbb6CZR5p29/xjsD6ekSYhy9wr
	a7EwJ8/4IbxLE3eCF5YUhG9pnv9qqEmJ0m7A7XaPFhihaYKQ7OaM3HNzWk7+0RYEVwUXtF/OOSa
	O+CHe7y6y/xzrTf3BmAU22TdvcbTnRMz8
X-Google-Smtp-Source: AGHT+IHtcdpnhUlg72zfo7hWrvx0FJm1YaMSsnRsy3WAnb5OW4dErT+GY1iWZYdh7iEQuUQYLBOqVg==
X-Received: by 2002:a2e:9fcb:0:b0:30b:ad2c:dfe4 with SMTP id 38308e7fff4ca-327ed1dedb9mr32145521fa.30.1747299258821;
        Thu, 15 May 2025 01:54:18 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7fe3sm22411401fa.24.2025.05.15.01.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:54:18 -0700 (PDT)
Message-ID: <db3f6178-646b-4f42-983e-9004d61dabc2@gmail.com>
Date: Thu, 15 May 2025 11:54:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] arm64: dts: imx8mn-bsh-smm-s2-common: Leave regulator
 under hw state machine
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_095422_382261_36A57966 
X-CRM114-Status: GOOD (  13.84  )
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

On 14/05/2025 11:24, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Let regulator to be controlled by hardware state machine.

Is it possible to add a note _why_ these regulators must be controlled 
by the state machine and not by the software?

> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index 5a1ec2f6a552..0d343ffdb7f9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -144,6 +144,7 @@ buck4_reg: BUCK4 {
>   				regulator-max-microvolt = <3300000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			buck5_reg: BUCK5 {
> @@ -153,6 +154,7 @@ buck5_reg: BUCK5 {
>   				regulator-max-microvolt = <1995000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			buck6_reg: BUCK6 {
> @@ -162,6 +164,7 @@ buck6_reg: BUCK6 {
>   				regulator-max-microvolt = <1400000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				rohm,no-regulator-enable-control;
>   			};
>   
>   			ldo1_reg: LDO1 {

Yours,
	-- Matti


