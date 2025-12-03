Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C3D1BDFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qKeGTsD/DT+TUGUNxy2VzIns/N4h+6YktbT6beUiGo=; b=V7wJOecjqYwFhzWdKhIpvE9iX6
	cmudqZZS6PWiqt7cpQAsygIqdA1W3GJvLG1XzxzbpRLGfNLbt+RnFdnm/b2WjXhgmhmvRVuVM7JKu
	tUEM9QJbNhuGLDvoMRYsMRV/FURSmM71IwSihsBGa+UV6Pg87uQbMzL1YTbcvW0MS+KP+mnG+qJVo
	jQ2Q55VcyzAQTEhfPoHXaPZAeRcjTiIaL47ldrqPS8RblPzUP4y9RBHJmPJ34DIF3BDum/LuD6CH6
	WEGMZPP+Chm2jJr8azg1ZKcqwqg4PRhb+kSAe+y25+Ba76oXZv+ASFcnEocpCUQxkwOqk4MurTQcC
	osgpvJwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuhC-00000007BUE-0aTo;
	Wed, 03 Dec 2025 21:47:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuhA-00000007BTK-171k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:47:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3436d6ca17bso170728a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764798451; x=1765403251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qKeGTsD/DT+TUGUNxy2VzIns/N4h+6YktbT6beUiGo=;
        b=OjxHwc1nkHIONh/p3nqU6Hgx+s1D8QLjc8hMfGStOFsoh783hZImS6DZ9pjpcPKizN
         tq3eS59PwGd5CFCArr1Fhq4cVKt+cLnwNAEhHUD/GY6e79zKjjyfrqQgIzoA+0AKEkNB
         /V1+UoscBaRYLSwUgFZsVwtROUfClS6K0TPzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764798451; x=1765403251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qKeGTsD/DT+TUGUNxy2VzIns/N4h+6YktbT6beUiGo=;
        b=R4Xut7vsG4h/L+ND3BuoToqjOGQcoTkadOGWMi78NjGuOjSLHX8+U9zGFjBF9odkSG
         m7EYFpKWobOHt1gXaBRUkZfAv/YINAOJTSXFLzjTbdhs8RSw+Ez5CWc/U3iTSc02/5w2
         ixB6ZD2UuZefFuJXd7YWhS+0dz5XSf5l7cOzmz4ccBjjh8bSEiDMYwAwv1S3X0G1gH25
         GpUJs1RjISsTzc3l/xLt+qEYZqHB4XWvP+GhpK9FbmzEI9gC6oORR44mgxhL/txtclf0
         fjLbpOnPTw8oj7rvt2i1QkysBSJwgcHOfeKoSHFbz0+5gvprzGAeRMwkirFfvHvTGSX2
         dgGA==
X-Forwarded-Encrypted: i=1; AJvYcCXUpbSJZN+wrGpddow0PivyWMcFJFDvIFeiM3vNxIIzz93fHVAzhmuBgSpSxt4pW1eeOd7HKwchGG3QGRCIsuHL@lists.infradead.org
X-Gm-Message-State: AOJu0YwCnEuZxWoT4jjuNhAW20QD7JUf2XlGKqGetLCOm1mMDiWKV+7/
	IppHjDFLrqNbqLi7X7asSeMZIYMmrbYeh4zhMdWWrLenHBqZEJbXsAdJufDSTRKAjA==
X-Gm-Gg: ASbGnctETcICmjL1yNN0zQ7bLmtrVwdyZNnBFG0oocoCb201jDH2sg9V1MjkZN09EGD
	wMgCQrRF0h5D9QKw5zLq27IYy0JgSTytImc6rC1VA64EQfvEANfLzLe5JMnW0f+MuFYCAzqTqYl
	K9oImlSClb9e2ytFRYEf9b3ZYSAj7VMBBFXRztZvnZfjGhlMD4xfzmC4u52VEdW3IhwtwXb1Wv2
	fZdalL9oAkXYOnrfQMegnomylJk8nywSMi9uOidnnzZpsXzVe5OVgPc1+yix+KJ89U9lj3J16UH
	OHguiyzh12AR5hYgXvRyRxeQctog+uRs2vsHgqOoO2oGYYDCmFUuILbFYa5vAHKXYYfFyz115OP
	zd97OftSR+oCuW3JagTKfAV+tSd79OZCfDzyX3l1W1VpJtq4l1W0weFnpV5SyjNhmrFMUC/kPYe
	3TbT7O0j6DOffKEDj7Y5IILGBmxiSI9KMzN+rHvBjKCPjtMtCSdA==
X-Google-Smtp-Source: AGHT+IHYOL+UBYAVNBaexNp51zLW4j5ZRWtvPK/36fgfBgTEcmZyfDLkwf8DPOCYg9Guqcci0ODQoA==
X-Received: by 2002:a05:7022:63aa:b0:11d:f464:38b3 with SMTP id a92af1059eb24-11df4643926mr1543335c88.2.1764798449474;
        Wed, 03 Dec 2025 13:47:29 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:e953:f750:77d0:7f01])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-11dcb04a07bsm88741033c88.7.2025.12.03.13.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 13:47:28 -0800 (PST)
Date: Wed, 3 Dec 2025 13:47:27 -0800
From: Brian Norris <briannorris@chromium.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 4/4] arm64: dts:
 samsung,coreprimevelte: add wifi node
Message-ID: <aTCv75hjdX5XvgCh@google.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <20251026182602.26464-5-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026182602.26464-5-balejk@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_134732_303181_63C1ED30 
X-CRM114-Status: GOOD (  21.56  )
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

On Sun, Oct 26, 2025 at 07:20:41PM +0100, Karel Balej wrote:
> Add a node for the phone's WiFi serviced by the Marvell SD8777 chip a
> communication with which happens over the SDIO. Also enable a regulator
> without which it is not possible to connect to networks although they
> are discovered properly.
> 
> Signed-off-by: Karel Balej <balejk@matfyz.cz>
> ---
>  .../mmp/pxa1908-samsung-coreprimevelte.dts        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
> index b2ce5edd9c6a..36d6ae4e902e 100644
> --- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
> +++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
> @@ -475,6 +475,14 @@ ldo14: ldo14 {
>  				regulator-min-microvolt = <1200000>;
>  				regulator-max-microvolt = <3300000>;
>  			};
> +
> +			/*
> +			 * Needs to be enabled in order for the WiFi to be able
> +			 * to connect to networks.
> +			 */
> +			ldo15 {
> +				regulator-always-on;

Do we have a min/max voltage for this regulator?

> +			};
>  		};
>  	};
>  };
> @@ -523,6 +531,13 @@ &sdh1 {
>  	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
>  	bus-width = <4>;
>  	non-removable;
> +	#address-cells = <1>;
> +	#size-cells = <0>;

I wonder if this should have:

	vmmc-supply = <&ldo16>;

rather than regulator-always-on above.

Brian

> +
> +	wifi@1 {
> +		compatible = "marvell,sd8777";
> +		reg = <1>;
> +	};
>  };
>  
>  &pwm3 {
> -- 
> 2.51.1
> 

