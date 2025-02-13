Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FE1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fM8nRNJfG7rUd02T8erTfV5HvN4Rbdhc15q2XjlMewU=; b=giiVRNisHbdKKc/hg5Fq+k4PND
	J++usuQkMRtwG+7ywI76wuepHk5nTGWBZ4Wtix/w/TOIGuniNlZVXLMJKy9MP6hWKDHtlcfsZdoGa
	ZhkRFl7kaZ7FUWXCJlWOYqCbLjfqeg4sUuZpvdC1MIteI6Y6wF3kl/+A+Mcnkc3T7G8Rsd1sj1sH5
	JCXgaDE2NG1+lsSqRRQuQtNj0g9OINkO1P1IGpicAhn0njIuDcJSU+Ifv5ZPCwKAerDnnWJtcAh5X
	yD20ZdCKS1e5yFlermS8mKoXHtxUxM1+WOLvUEKv+UrsT9wS9mfSG4YJ4J6+LGCrd2lrm7t8GeSYZ
	99xUBsKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTOf-0000000A3KD-0RoU;
	Thu, 13 Feb 2025 07:12:29 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTNC-0000000A352-3Jtb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:11:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ab7f860a9c6so121176566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739430657; x=1740035457; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fM8nRNJfG7rUd02T8erTfV5HvN4Rbdhc15q2XjlMewU=;
        b=NLQxmmmfTZ6Di85D+4j2nvd3fz3N6ETGypnTaOLs/7Lz8Z4eZkCUSxhhmv3Z1KnP12
         +RFvHHJpcwMdrQtsInAvThdU74/HjxoDk9Z8miG5qwHD+CyTWGIykxNAvjJehAsA9pxS
         CtE1vbxeogDR/+XILop4IRYEHVK+LDr7xTcYbQfd+ooiIAGCKfO/7GjIFVZwHFbfggrb
         UOQhfk8P4a3aSzoQ0UFWkUBbQ/q1P3FyG14QWiOCAGrIUgHy0Km+7t9E5X1w08rbfCrl
         A4ei7dkeoKpE9MVxY7tFHjAC9qrK0Z17WYS4xjqYWo2BaWtxVvl6AXzPlwCeI18HJwpl
         uoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739430657; x=1740035457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fM8nRNJfG7rUd02T8erTfV5HvN4Rbdhc15q2XjlMewU=;
        b=Jdvnex426XFjn2fsh+VWJa7+T+JKAMhCsgEiY/VMGx/H1lSueoWwSxRsnHpL8We6+c
         grIdRPm0GGIh9BFXq3jJpuOtVIRTEJi4WD3J53lDXv3c70XpEizWWx6pEhtVpi/nyPpP
         BPPnoaoarxlXHKLQTvkSqjLq3xVvfmI4+BhAstuT53+jOdaqU0w1LjIh0D1ofkB9SHfp
         g+8Q/p2JPQO4Qiut3RO6xSVw7A+zsARuVng+AarbpYswKQEbMZU5mfYlyKHRuSZe7O4Z
         BkwH4EPNLhSMNtnUTC828bTYk8eWFxAJ1izUAqk3KiGn/sZ/7b1iKGRcW83ZqcJRMRLh
         JB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgigXPTZVB5XIjhwTRDc6QLktLITdOzsqzOsmBMUuvmfZMwAw7PcpXtHGF38gY6Eta6SkyCzz1UqYoQjJxub78@lists.infradead.org
X-Gm-Message-State: AOJu0YyeJP94CL6fZ7/eOtzto3YdIPnTuny9glA9nw88osY6UnU1rZGN
	0o2fjDtGGz8LJdyPNFQRZz/R1s+e7pb1UcFZTWhGgeBc7rYJdeAFDnAKmSHAHFE=
X-Gm-Gg: ASbGncv1z9xD+pkMgfSuGCSktFkIz+ldqPWn+ys4+dx+16lkGcUHOf3YQ0g+ZqAHTV3
	Qdcr7Zyry27jCuCkhra7cE40GxK2utDYQnVVNmTuK7HBNyr+LrUPJ25qSrsRcUOaUuLe5Tmrojw
	/8gnP4PYkPY0egBm0pZ6KpntWlb5VObAIzDNyCQIgZXhHqF6+OgpMx56sfPh/4Bh71Zlsx9lC/G
	RdP0iGCDonD8yD4RsfQh7dSmMgPqJeKAAboAE6ztzD+YmNabGIljZaS0ckXAsfErHCmsaRXXlhU
	15XLim3x+wa5V84Dc6gPRdJM
X-Google-Smtp-Source: AGHT+IHtrPRE46nXKkFCt4DHjiN8hmdANTLc5iX661OAdX/npX13cIu7Ky0HIkuVU57aNRMuRQab9w==
X-Received: by 2002:a17:907:3d93:b0:ab7:8520:e953 with SMTP id a640c23a62f3a-ab7f34d4f0dmr512307166b.55.1739430657085;
        Wed, 12 Feb 2025 23:10:57 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d349esm659748a12.33.2025.02.12.23.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:10:56 -0800 (PST)
Message-ID: <feefbcf2-e441-4cd1-a3de-40bfd4d7197a@linaro.org>
Date: Thu, 13 Feb 2025 07:10:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, peter.griffin@linaro.org,
 andre.draszik@linaro.org, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
 <20250212191241.280-3-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212191241.280-3-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_231058_836616_4FD8DA09 
X-CRM114-Status: UNSURE (   9.05  )
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



On 2/12/25 7:12 PM, Denzeel Oliva wrote:
> +static const struct s3c64xx_spi_port_config exynos990_spi_port_config = {
> +	/* fifo-depth must be specified in the device tree. */
> +	.fifo_depth	= 0,

have you tried testing without specifying the fifo_depth in DT?

You'll probably hit a divide by zero at:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/spi/spi-s3c64xx.c#n664

I assume the controller can work with 0 sized FIFO depth, and if so, the
driver has to be updated to allow 0 sized FIFOs.

btw, how did you test the set?

