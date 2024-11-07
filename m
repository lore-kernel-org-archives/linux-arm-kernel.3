Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60047D35E5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=; b=oe89ax9xgEoY8hvovwaV63Ojkv
	KxphAUMVd1LAt8nGCt5Xm4hnzbnDE7Nr7lGOtS68zI4M+nemiQ/ddSDw4bNZTo83jHfLwdx1/HiYK
	l/B+MEGPNMWtQ49JkrZaJWa2rcquAlYNE1S+L3h7mvjjf2DErA0PK1C5sWK5F8EcR0tcA1XNn+TSZ
	wvP/6E2NTvmGhfO7d2iUFOsWnbuFup7hkPbXFXQUiiTCxJRC24VvBojcCVpiFrtY5bQ4hQ02QxR0R
	uel2kPRNufNoUdUObfWeFVOAoJVBWNjdwIil/Jtkxi8aygLYkoKVU8znDy1Mi0OxfIOujC7yeO+Mp
	zgftNRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zxK-00000006WVA-2QvL;
	Thu, 07 Nov 2024 10:41:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zsN-00000006VAd-2WzS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 10:36:32 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e52582cf8so551988b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 02:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730975790; x=1731580590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=;
        b=PbsWjrUnfMS6Rx6bFK8srCFn8UkSU3QcLP4teKDs7tSFJ6txcFcrL85a2XU/DsAHYU
         MCjtzc1mDNNB9hQlaTERB6HQyzsHLXIkl0f7tydX+4ssfSuSBZhSZGwsrwccdPleFMK4
         HHMS/ZgxY+65K1AVVWy7USzqM2yP4GuuGEJDi4NTCMJg2IoRqzpMnZcwAvACjsiLjrYA
         6YBeAJiOZgv/sZw6CxpZZM78pSkcEr10YNTB01OR9NplB343VjBwV5TGqfvoFIKJTrJE
         7/P5t4g0grxts+xhZzCayphh4XohW3djt1aRQ0yIjZt/mdfOUtAm68Csu0Tt2RdTVf+H
         mKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975790; x=1731580590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xC4jScz5PMTA20yKpGgSaZvcBSA6x4Yz2EVtRJnnFPg=;
        b=pBJad+3HAoAaDiPaxuFtf9UbEbULbpcmqljngzmHQskkHiBSSjNhRSAThvGG3TUZGf
         svHBwUG9iz0yYKTlpYlltaJt/tAzEiXiLHW/1G7A4ZvbEHXvI0fllJFtWpdLMNgccrF5
         SGrGUmG6sI7ukgku6bLzmET6aQyNK8kVOUD2CSE+u7NahmWpPosS5uPQUDEe5GT47IGU
         jiAIbq+AKNRpTcHGrB6Xj8y0GlPhXOMFirX3J+paezGRqmkzTBtYUDGs75i1yHkjYjf5
         5Z3f00AFqF+xP/KF6ZrZNyDeK+khnQwSJ74IOhapFvbMQb+9WGuqH42fRMKaR7ZJveBS
         LieQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDpOy/GF28CLIJR4n1j19aBLogMZCcfG+iWjBo3ETYlJgeNHxJqPuKoqgZsvPeIkJdTepktrfMxAyTlgN8Zl8A@lists.infradead.org
X-Gm-Message-State: AOJu0YwbGzWTh+WfvqFG7VUPv6S4PuIigpgaiLw8MiceOsMSf7NMgoLQ
	tYrGWh+tL9ZXxGgtfKpPVy2tJzS31g9VcEQukV4B6aeOikPG0s4N
X-Google-Smtp-Source: AGHT+IFEcmPOqn+X7HeywXdO6/sEgP5tjET/8PEbokkUZb1iOlKZDIKxcXvkvkXx3PWm7y2eChH7tQ==
X-Received: by 2002:a05:6a00:2284:b0:71e:4786:98ee with SMTP id d2e1a72fcca58-720c99b7befmr31801669b3a.21.1730975790564;
        Thu, 07 Nov 2024 02:36:30 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a7d9esm1209196b3a.66.2024.11.07.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:36:30 -0800 (PST)
Message-ID: <99fa8255-12b5-4a54-acfe-cc0fbbba9c0e@gmail.com>
Date: Thu, 7 Nov 2024 18:36:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-4-a0987203069@gmail.com>
 <4c018927-b6ac-4414-9dde-487453350cca@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4c018927-b6ac-4414-9dde-487453350cca@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_023631_677801_8BCA9FA4 
X-CRM114-Status: GOOD (  11.60  )
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

Dear Andrew,

Thank you for your reply.

Andrew Lunn 於 11/7/2024 2:23 AM 寫道:
>> +struct nvt_priv_data {
>> +	struct platform_device *pdev;
>> +	int id;
>> +	struct regmap *regmap;
>> +	phy_interface_t phy_mode;
> phy_mode does not seem to be used outside of nuvoton_gmac_setup(). In
> fact nothing in nvt_priv_data is used outside of
> nuvoton_gmac_setup. So it looks like you can remove it.
I will remove it.
>> +	if (of_property_read_u32(dev->of_node, "tx_delay", &tx_delay)) {
>> +		dev_info(dev, "Set TX delay(0x0).\n");
>> +		tx_delay = 0x0;
>> +	} else {
>> +		dev_info(dev, "Set TX delay(0x%x).\n", tx_delay);
> Please don't spam the logs. dev_dbg(), or no message at all.
>
> 	Andrew
I will fix it.

Thanks!

BR,

Joey


