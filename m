Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C40C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 00:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQVDg8zwmBbcXYl6zUtnOQaEMDJDakZCCSAsHxpjPDA=; b=eKWPnbYRq/SubcKthfKAm3d5RW
	veH7NsKKsqsAhCtSQPlvE9IZLpongHQ3fFdL/edLegSQKfHN5HSYNhohNLic1ahFTG+U5HhCTH+TR
	h79SU75cZ+T06AaZvA60iG4o7YT65mEQyyo5zK0dJpiuanZNvROBV89k2PJESzxNEonw471TjYQF5
	j8bp/uWCjky/kdf8vvDiX5yAfVLkMLmjBE6Rf+QEbGa8twr+ZPnENvMww1uHyln8MZSZVR2IkylKJ
	h9WYMRvqrhYUMO6mZY/F9Dc20Wm84onKiEjEi1/ZNldny45b8litEwJlWRBYnC2pZZw+I+1iSJ/Jz
	TSH4EaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taORQ-0000000912v-1Kpv;
	Wed, 22 Jan 2025 00:17:56 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taOQ7-000000090vj-2MPg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 00:16:38 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3eb880e5ac2so3710764b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 16:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737504994; x=1738109794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQVDg8zwmBbcXYl6zUtnOQaEMDJDakZCCSAsHxpjPDA=;
        b=MDMiYXqnuysNMw5ATH2IyLbsyZ+7qGXC4AS5JCO8mw045qLbQHrpnDXlh0mRq1/b/x
         5xKzMdI3Xui7szhRttGaP06UXX+3b/mrKirGWb/8E5js6OlK+WEaKtQFzY10XIgKxrL7
         0WkYhBzcI2urunIuLw+oJHQLKr3DSB7ivVaiS6Z7clKgaPuHJK3MukvjZFOjVUMSMP/B
         YURW50z3RJTfbuTppw2JoXPVLZyAKQlA1+XG4fD6SPJBhgfCOLD/l2TdgN5bYqDtELHw
         Y24Cq6rXOM/EHCJOsp7Hm0OKDOVCZU3IEjSuhTP+WiqRTGGaNYyXgxbxcPBKwyzAneq6
         4wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737504994; x=1738109794;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQVDg8zwmBbcXYl6zUtnOQaEMDJDakZCCSAsHxpjPDA=;
        b=OFHoz1XLT6CjC7a/YR4jsVIXb4nv+bBg1Fj1/q2gRNej+t3O15Su5JnlR+UG+j7YOP
         BRqCnL3eqZeBfeos1SKZfXGfc9XbBMiExitjjgWzxzdworUuq6o0qIwSl0CipHkp9WqS
         a+uL+ceqmQoCMh0yf6AM8Yq1xJ/seVZBjNBn+0aQav+tCOIbj7vDn0WntX/6rVNT4s2i
         OIgY1RD7vR8tAU3zj6lqSlX3xLosho1AHvF+UQlGghJlrNs7AGx5VwwADwtnNxwG0r4N
         y7uLB9OUwY76BSOpMNltahYYsmwZaHj0nMzKBELMHYNYJfWiBtdc66BnBYlicklnkSfJ
         F+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXf6xnnnRJff2k2cEQMUgILyV3VQ04qXdan2hyT6kkqBYoK3RfrFW2po9hT/3/gnvVCOoylYjkmjzUERZUrF5qq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4rIMpfio638KIh79X5yABdC4DNbmwahrqNab+mzuPMKGT5kJ8
	/5JTJmdXcL5HX00o9r5UXcyQZ0OGL/F5vEnLAJ994g0qWnkKEonyz/Q8K8IH/rA=
X-Gm-Gg: ASbGncs6nwf3b8CfpTXGGqM+e6iz2AOFFNJw9AOd69bIrCpPS9qDyvWJwfgPH2riuO4
	6150q1WYixzfNhY7KEGvXhyPDTfhBjJ2eR48+mKji1004xqGwc9GLIhZc4AIvb9iOVoOYw+j26n
	PqnPnOicefVBsJEOv3fwCWUjveG7U6La/scrvArCkPeul3ettKbNCNvkkFiUIzt13URrfD0+Cb/
	dA/PAlxD9DSjLlnPM4gxW+9ySF1NQVZ7gbSpe7Z6fkdWToFdbUEtrh9B80CDQzramu/iScuH9Qe
	4mZOMgKwDh73eHxKEkrHU43ITdJESQE=
X-Google-Smtp-Source: AGHT+IFUzXtAIp3HDw6cXZF7Eh349UV04myuUv9p02O2+mdfioB7429VrhWHruPNNSQlkcbzikUpXw==
X-Received: by 2002:a05:6808:3c97:b0:3e6:f6a:de5c with SMTP id 5614622812f47-3f19fdd1253mr12737286b6e.27.1737504994385;
        Tue, 21 Jan 2025 16:16:34 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f19da6eab9sm3330497b6e.17.2025.01.21.16.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:16:32 -0800 (PST)
Message-ID: <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
Date: Tue, 21 Jan 2025 18:16:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250116232118.2694169-2-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_161635_877885_F4516F1A 
X-CRM114-Status: GOOD (  18.46  )
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

On 1/16/25 5:21 PM, Sean Anderson wrote:
> This device supports two separate SPI busses: 

...

> @@ -84,5 +94,32 @@ examples:
>          resets = <&zynqmp_reset ZYNQMP_RESET_QSPI>;
>          reg = <0x0 0xff0f0000 0x0 0x1000>,
>                <0x0 0xc0000000 0x0 0x8000000>;
> +
> +        spi-lower {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          num-cs = <2>;
> +          cs-gpios = <0>, <&gpio 5>;
> +
> +          flash@0 {
> +            reg = <0>;
> +            compatible = "jedec,spi-nor";
> +          };
> +
> +          flash@1 {
> +            reg = <1>;
> +            compatible = "jedec,spi-nor";
> +          };
> +        };
> +
> +        spi-upper {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          flash@0 {
> +            reg = <0>;
> +            compatible = "jedec,spi-nor";
> +          };
> +        };
>        };
>      };

In the IIO subsystem, we've been recently working on several "advanced" ADCs
that could use a SPI controller like this. These ADCs have multiple input
channels that perform conversions in parallel and the data for each channel
needs to be read back on a separate serial line (MISO) at the same time. Another
similar case is to have two separate chips, but they share a conversion trigger
and essentially operate as a single composite device rather than two distinct
devices [1]. This would be similar to some ADCs that are daisy-chained where we
consider all of the chips in the chain as a single composite device, but they
would be in parallel rather than chained.

[1]: https://lore.kernel.org/linux-iio/e5e8eba7-2455-488b-a36f-e246844e11fd@baylibre.com/

For those use cases though, as mentioned above, we only have a single device
that would be connected to both buses. So for such a SPI controller with
multiple buses, I was envisioning that instead of adding child nodes for each
of the child buses, that we would do something like add a spi-buses property
to the spi peripheral bindings where you could specify one or more buses that
a device was connected to.

e.g. a device connected to the lower bus would be spi-buses = <0>; one connected
to the upper bus would be spi-buses = <1>; and a device connected to both would
be spi-buses = <0>, <1>;.  This would also work for SPI controllers that have
4 or 8 busses.

SPI controllers like these have a striping feature that allows to control both
buses at the same to either mirror the same data on both buses at the same
time when writing, e.g. for configuration or to read and write two different
bytes at the same time. A peripheral driver for device that was connected to
both buses could make use of this feature to craft a single SPI message with
transfers containing (new) parameters that specify which bus to use (one or
both) and, in the case of using both buses, to mirror or stripe the data.

Could we make a single device connected to both buses like this work using
the proposed spi-lower and spi-upper or should we consider a different binding
like the one I suggested?
 

