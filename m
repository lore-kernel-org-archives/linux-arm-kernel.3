Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C86C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58D8nthEMttD8EOjkycPcqwbL7GCEdeTDZ0Fg2Jn8PI=; b=3oh+zV76lXmS44WIXK7K449VRf
	dMyt5tJmO1BeERjxE9vlcTos8qgwdnpuMz/U9//vXj8oo6d1uXsLC1YmFZYDC0rKiZoYo5iZ8SyL2
	B2l21EYLWQf110TU6iqq7PU5KI94zPfPxmACnxtUdta5wEpZWfsMK74VGwAkGE5AZhLo4TK6U8ZPc
	onucmVvdUvhB+zSEZX4XvUjN7RXoSfWIvbMabP/X3NK7ge8UBPij0szPySV52xtpDWlCA4ooC7lmm
	UmSX8+/1RV5/0bzxvhXdaeYbMPffCGwxa95XDF/IyywAQHC+3jRwz4dlC0qJJe/G/r75LauadCVx/
	8+/kWBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5Y0-0000000546I-1rDs;
	Tue, 08 Jul 2025 10:27:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5E8-000000050zW-1BtM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 10:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751969223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=58D8nthEMttD8EOjkycPcqwbL7GCEdeTDZ0Fg2Jn8PI=;
	b=freOrkbwKv7La195Q1fK8fA6gKnwc7hmLTSnFoiN7nZ1AqkMaxtRB94LwscZf2rjp/4LvJ
	i7Gx8Lc7H1/3pzCo32mK3so58ee9H+K9DfQ51xGrG7ASi2AKafqiRhQfcr/D2VxzRYiXQg
	FrTllqqRRcdWoHCJlqbNEdKPG9bbySY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-pGlPF8KKPrWUC5dskUUXOQ-1; Tue, 08 Jul 2025 06:07:02 -0400
X-MC-Unique: pGlPF8KKPrWUC5dskUUXOQ-1
X-Mimecast-MFC-AGG-ID: pGlPF8KKPrWUC5dskUUXOQ_1751969221
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a503f28b09so2377237f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 03:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969221; x=1752574021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58D8nthEMttD8EOjkycPcqwbL7GCEdeTDZ0Fg2Jn8PI=;
        b=owMjq0uLUB9G0hlRSjcPNkhbwF592ag6bFw7tKDHlJOSVzpyuNjQuboDAjuAho8vGK
         fBIV4Si6G+3YwtxBz8mWO8edPkwL0xMaCEWCuWf/Z72ACHP6WoxNfTc64npL3gmEnKLQ
         iwRIHGsr9ZiYoex4k7te8T8rZWKjUfLpHADItkXG+7/8XlZJmhoBQ3nkL4gm5fLb24ni
         im+J8gxqSvVHDoj2oA9qiI5fjfGPlZkL93I9ufIyMngdxXJ133JvQpIfz8rjQjTF+10A
         PZfgzM9wE4+7pe/eim+ICt7uG+9v66s5YlKB1lgVwr+TyqV0MAyYc43+qEnIGv+jQYFR
         B4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuMygjXane4uotFLyWQdkatdAbPUoHc72YxjR9EbeV0crGUxr7ude9um/3riNuXlG56YdTJCXYzroHk+LfajNF@lists.infradead.org
X-Gm-Message-State: AOJu0YzwzEb7Foe0gjXaEHy5s1zm8o0SI+b9Q/rcpIrOLeZf8sZerG+N
	QrNxnX6TCgM00bE7X5vi/Dj5D06dF/WvgBuIs5plola2ky9CpXtIutYl4Gvry2m4xdOr75ErjBO
	cynDA5gLMnxt+ppM7+BZSxncyzh30Mm34YYD6ss5/5ufWDpuIjJGw5/l+IrcbuX3+qvXgPPNzEV
	9b
X-Gm-Gg: ASbGnctX8qHK1EfSktg4d++CbqfGErSfwQ96QupFx6bdkzrSTole9m5wNTsKtATpKvS
	ENjFsSO9E3cbFUO2oPj1eQUA3akirew1m0OxWKuyv7GdPLVuKyhxm8Y4G3bI4MjWOQkRxW+IMOy
	ebhl57rrWlWFnSiFYQCgsYTwR0UpfGi5ZU/Q6zaRZ+d3VyeHNjI6SuaVmAvUJ0eIEklUSVasffX
	9VL5AX1oaagGR8lLcch9KnnUOzeeV/kj8EIA0ZZ6iYEU2FnNjqHPl9y6BQRE0jboktKOV2WP97u
	VoAmd8qdfq37LT1vzl+kgbjLsEr8A002b2wWg2O3+OBD5LaYHGTHfTxOs+Ka3CTaarN8aA==
X-Received: by 2002:a05:6000:2303:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3b5de020c32mr1949632f8f.24.1751969220782;
        Tue, 08 Jul 2025 03:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtcYA73nlyPh3UUGiVwYijbG3S+DSKY5ccoYHAENjNZ6YmMjCSlj1e9xUsxHKnSmrtDCa3pg==
X-Received: by 2002:a05:6000:2303:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3b5de020c32mr1949573f8f.24.1751969220180;
        Tue, 08 Jul 2025 03:07:00 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd2e7e89sm18221965e9.0.2025.07.08.03.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:06:59 -0700 (PDT)
Message-ID: <b68a06a1-076a-4345-bbb4-7dda1cd73591@redhat.com>
Date: Tue, 8 Jul 2025 12:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v14 04/12] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250701114957.2492486-1-lukma@denx.de>
 <20250701114957.2492486-5-lukma@denx.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250701114957.2492486-5-lukma@denx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qIS8HekUbNw-QwLWiwbFsNbKXdMsa4OyJzowxc9n_uQ_1751969221
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_030704_397697_10CC7D89 
X-CRM114-Status: GOOD (  12.75  )
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

On 7/1/25 1:49 PM, Lukasz Majewski wrote:
> +static int mtip_sw_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	const struct mtip_devinfo *dev_info;
> +	struct switch_enet_private *fep;
> +	int ret;
> +
> +	fep = devm_kzalloc(&pdev->dev, sizeof(*fep), GFP_KERNEL);
> +	if (!fep)
> +		return -ENOMEM;
> +
> +	dev_info = of_device_get_match_data(&pdev->dev);
> +	if (dev_info)
> +		fep->quirks = dev_info->quirks;
> +
> +	fep->pdev = pdev;
> +	platform_set_drvdata(pdev, fep);
> +
> +	fep->enet_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(fep->enet_addr))
> +		return PTR_ERR(fep->enet_addr);
> +
> +	fep->irq = platform_get_irq_byname(pdev, "enet_switch");
> +	if (fep->irq < 0)
> +		return fep->irq;
> +
> +	ret = mtip_parse_of(fep, np);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "OF parse error\n");
> +
> +	/* Create an Ethernet device instance.
> +	 * The switch lookup address memory starts at 0x800FC000
> +	 */
> +	fep->hwp_enet = fep->enet_addr;
> +	fep->hwp = fep->enet_addr + ENET_SWI_PHYS_ADDR_OFFSET;
> +	fep->hwentry = (struct mtip_addr_table __iomem *)
> +		(fep->hwp + MCF_ESW_LOOKUP_MEM_OFFSET);
> +
> +	ret = devm_regulator_get_enable_optional(&pdev->dev, "phy");
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Unable to get and enable 'phy'\n");
> +
> +	fep->clk_ipg = devm_clk_get_enabled(&pdev->dev, "ipg");
> +	if (IS_ERR(fep->clk_ipg))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(fep->clk_ipg),
> +				     "Unable to acquire 'ipg' clock\n");
> +
> +	fep->clk_ahb = devm_clk_get_enabled(&pdev->dev, "ahb");
> +	if (IS_ERR(fep->clk_ahb))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(fep->clk_ahb),
> +				     "Unable to acquire 'ahb' clock\n");
> +
> +	fep->clk_enet_out = devm_clk_get_optional_enabled(&pdev->dev,
> +							  "enet_out");
> +	if (IS_ERR(fep->clk_enet_out))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(fep->clk_enet_out),
> +				     "Unable to acquire 'enet_out' clock\n");
> +
> +	/* setup MII interface for external switch ports */
> +	mtip_enet_init(fep, 1);
> +	mtip_enet_init(fep, 2);
> +
> +	spin_lock_init(&fep->learn_lock);
> +	spin_lock_init(&fep->hw_lock);
> +	spin_lock_init(&fep->mii_lock);

`mii_lock` is apparently unused in the whole series.

/P


