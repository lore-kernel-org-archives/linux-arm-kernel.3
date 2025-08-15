Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0A5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYeMUsITLzLzX8aJHEpZBjK6mYQbUKQb8W2QJwQZHWg=; b=fajtueXKx41XeGILzOCCdnwNRx
	DcpDD+0uNM7OZOZ+ypj/lAxkNGYNI8FX0yYTWl5X6BXl7l7YXjG/3+WsbqMDGYx+3YCUUlQ+8Drko
	TRGkznQCPfWymtcQxP7C6vdkXKatmkuLgss7e9mZRoSqMgFRTveU1B0LeK+bJ4JGyRCri/clM6iTB
	qh1dDqvkCos9S7tdnr9xbi9DebWJfR/efqlGys3K/LKnzufg6qvAGAp+XlsTGBZahO9LGy6l9zETT
	x5LTWKzLIwJsPpmy4m+w9uGxSnTUSRWlLQu7mGtE4UZVQu9GPAyt85bmGiQ63EcpOg9ABzIFCf4wA
	2F20fLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyAt-000000036uW-148O;
	Fri, 15 Aug 2025 17:25:07 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwgY-00000002srY-3c1o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:49:45 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-74381fc8abaso563472a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755272982; x=1755877782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYeMUsITLzLzX8aJHEpZBjK6mYQbUKQb8W2QJwQZHWg=;
        b=zuZzjG/iZPmYRcM7J39SoY6DfalFn7QqgbjwXONdiKLoTT62+KlJqpxjv/AT9qtdGZ
         LipDYE8zZcgXF63lgLMQAGuVOKO4X2bg/jKp82GD6aNoVN8GyTtz1G3XhlEEY2SeTEgM
         l9eAHW8Id3iIsoz4Mggejk73iT/cP3QLdrbRnUVynBCl4nH0+oaHVmH9z+Ywce84heAY
         6bK0ZlEiYx7CFHla9aGAjMX8NfkrPAzqU/X9GK93H0Bwv3AFdFjNh6KehG32v1HU5/lb
         A193yIARCwEY2Mi99QQMDHcIHo9oE1pz3z0BqeZjZN6zhm0aQIovn5m+oNTxvp5ytkE1
         /pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755272982; x=1755877782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYeMUsITLzLzX8aJHEpZBjK6mYQbUKQb8W2QJwQZHWg=;
        b=Pm1TqGTzIR89g9z23jbeGzj7tyBPaY63UaCedu1DMVx+zRLqZzczOHzZhDK2fcOwvt
         obQj4+ldLdE5+L6qtoXzzety9fFA1mmHF2wwiZVWEWLe0ZsohQRvLO5xMxXoC7PtABYz
         MwEbAyJF6jxFvkNG2Ur/cCgQSHHhPCNueAvTywvVfm6uKQDNYk8a7WC6PoRvxVtYOA3W
         tueBObH2Z9Tq1u5r4FL6KJmqVsMBbvcm/WT2Z3kJP3MoovVFbVts/kKz813kMuW98Xq1
         Ks6rz7pMjQ3hHdbnEXouN/9jtZnI94V9XRasdD3UkIEx5LfwU8lS+KuyRWXzG9jHuR4+
         qV1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkjK8xN0PJLiMO2riSDc7r9jBT9H5w2DbIpidTi4hnTsJC05pvv+LhGymCnY2xA+5aSxq0oULoHxf/JluSkQ1w@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5rEe+6halBvJCXSuxB4sdt3nUBjMh1lWKVqJ/Y0xzQUCT0FZ3
	THXOHf9xaLKTKnBJfMdJgojJ/6qjcdN/50DWmPOBGz5uQc/k6loconWs0iH9K6cG+s8=
X-Gm-Gg: ASbGncstCZBz1WJXwuKAFZ5cErCeVwpgTJAFLc7WjMNNPy9XWGbrpqrzxFhEmFi69I6
	6V3o3+5utZHMxla7eKI/0oxFACKnN6SN927KeLrbyTsRkTIRyqmpzobZJdMpWoBgOnCFkts+Ma0
	62LDJWMXJtwHpRMi0YU8DYs+MiFCVjnxcaF/mO7ntQAqVpxvzVjXuWuUQxOHpDFLhbH6SFsacfs
	1xxNu2/TNUCd1sUvEPUVJ2nuIInk6AusQvApQyx/PY2O2nPvYIx4Ye1jLkeEKHiwvumSLUoNb2e
	fP1kylKOjYayKTTVoQ3on+sOFOx5bzI9sLPbZ9FKLRapqh6lRE7bxMLsDQwFOFxguD2+mJ5Fc6G
	6IuZSrhcSskTID+5z5uzo34mWWBpIj0O3hgMb4mRE9OrSVU1BGNBmVIDg6Z68wae7XIVkpHI7mK
	aRfiNVnJ0=
X-Google-Smtp-Source: AGHT+IEoVnaL83a5r2gLAMPUw8k6gnxh57UaRSMs78wsysGd8hJtR5B/O1txsAfKqL986GFe82rtXQ==
X-Received: by 2002:a05:6830:4108:b0:742:f996:ef34 with SMTP id 46e09a7af769-743924f533bmr1526978a34.27.1755272981907;
        Fri, 15 Aug 2025 08:49:41 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:677:c1a1:65b9:2b0c? ([2600:8803:e7e4:1d00:677:c1a1:65b9:2b0c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7439203b5ffsm348082a34.25.2025.08.15.08.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 08:49:41 -0700 (PDT)
Message-ID: <ded7ba99-089b-47a7-95b9-ca6666dc3e29@baylibre.com>
Date: Fri, 15 Aug 2025 10:49:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add spi-buses property
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-2-sean.anderson@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250616220054.3968946-2-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_084943_139524_DD49B517 
X-CRM114-Status: GOOD (  21.13  )
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

On 6/16/25 5:00 PM, Sean Anderson wrote:
> From: David Lechner <dlechner@baylibre.com>
> 
> Add a spi-buses property to the spi-peripheral-props binding to allow
> specifying the SPI bus or buses that a peripheral is connected to in
> cases where the SPI controller has more than one physical SPI bus.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - New
> 
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 8fc17e16efb2..cfdb55071a08 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -89,6 +89,16 @@ properties:
>      description:
>        Delay, in microseconds, after a write transfer.
>  
> +  spi-buses:
> +    description:
> +      Array of bus numbers that describes which SPI buses of the controller are
> +      connected to the peripheral. This only applies to peripherals connected
> +      to specialized SPI controllers that have multiple SPI buses on a single
> +      controller.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1

Finally have some hardware to test this series with using 2 or 4 buses.
I found that we also need an absolute max here to make the bindings checker
happy. 8 seems sensible since I haven't seen more than that on a peripheral.
We can always increase it if we find hardware that requires more buses.

	maxItems: 8



> +    default: [0]
> +
>    stacked-memories:
>      description: Several SPI memories can be wired in stacked mode.
>        This basically means that either a device features several chip


