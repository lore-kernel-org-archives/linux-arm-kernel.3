Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFDAD72350
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42GEtX+KF8PV1SXMltWgUuBtFY4WZcL8hCIPkAOOUUo=; b=aUgAzvHhf5psYa1g26sO71+8ax
	0ACyq4W2gGqzehI7U4fQHQNWILzOedxRONwN20t6iMQoEEPB+ppJmGoOynBiwFcl/QWRzI1tEM25e
	/vxRrMFuEL6JJI1+rGVCh7UTveJ/AqLj14ETeeC1EMCHviuywP7UKGc3+QUOv8NnyY/RhlYsnmLtX
	sTGAE1vuBYK00qysjZciJSs2/wgBT99aZliWXNtgalTJPtO4QBJHwPfZwawEPPuhOVoCjUv0suTFk
	YT6d5BXoaVgX1639Rgj40dBciHhEycB1RpFEPZE0ujyNFSNMQS2EuoM/KNASf9KaOod+rIFdiJr0m
	a3YzfpEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDPv-00000008Yhv-2WMp;
	Fri, 23 Jan 2026 09:25:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDPs-00000008YhY-2n0i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:25:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso1248267f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769160318; x=1769765118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42GEtX+KF8PV1SXMltWgUuBtFY4WZcL8hCIPkAOOUUo=;
        b=mIzSQvEpA+YqIKQRGm8+UQMcpVgq2ZTJALqTidPr+cC6EXDfQ8hJgCFWQV4dP3N9jT
         bORYqzGK5zEt0IEBDCqtcbyD1wyvL7CTyKD6aoTuiwnM4WJ+94ElmhyQvQUfi7wNqwmU
         X0Tkq+G3qdRT8/P30xNPFI6K221fqYCKaWBzp/QhCYMKrMwAb6AA+zjfhtds92SXGq8t
         y6RyR7FibRUagz/x92tKiOYrhQ9BdjFA+4hZGy96G89ll4wmD/jvo90TJ3rPeiF/dE4g
         dfTTojCHaKEPrEXOZzZE2kfROk2k2z7L/8C69EubzpwqtaFcKqTh/KJCuWy2sU5vZKB/
         vmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160318; x=1769765118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42GEtX+KF8PV1SXMltWgUuBtFY4WZcL8hCIPkAOOUUo=;
        b=XpZlyYMgeJ19LAOYNmUv6oPJxuiuNjk2rbjbvHLnlhG7lqfeHbFqW241ZvULnw8Ero
         2b2Wn2RtC+NsskurOg9WXkctsLjq9P2DrjjQ6p85PnDbiTSEpRWsjecrVSY1526bDXbS
         f8nPw8vmEdyPMiwX8uR0oxUj4XudgYaFCrGi5as7Q2PeDJE2bT30GKKpWfP+gLjEwJwR
         zFnTHBeQhwVEVGcRjyTgHQ8eBN1XGhuYp0WiotdnM3i7uV8xf8y/xdPYArCrMDZ2WAXU
         NeHvV1akGAZJvKxjehDXeJ24CdKhAJHz1QAMjfWynX0YQhS4rv6aW5oxZgDXH7YA4Qhj
         78Zw==
X-Gm-Message-State: AOJu0YyOKNaXJjAdqKZ/zyetzQHmVJMP2qkXGtCHTI2+hngf0VHZc1B6
	w5W5AzL032uYH+kRmCKJtpQDC7izl1Wo5bm6f6bfL95y8E3GlJB2oTnd8xA4Ue2+BpT8VmpWUgS
	5Opkm
X-Gm-Gg: AZuq6aJjGX9o6CpA7qWYz+5w+Sz3r1r8nK2OM3sZTvugcNpZ6u0IA0UYzTMc9FzxtQY
	dMha2tX/oy0yI/AeZ3m6N/pCH0dkEjvOoQTxe6WhHyx/HPp/cPE+mPwQLmnLn/+TCQ2hzyorLNM
	tIwNYSLoCNCokFc8d+C33sZs3QmO4PMkTtJSDarKmHBIxMKDLJPIQjwTvTETq+Gp5Tc8BEQHd1e
	5ilBHbZl/+LoB/Vl0I9IW1ohobBGPI+MoXb9faFKoo0tbqkljObOyHuR5OSZzEJE+bWcxgL53z/
	eooCaXdvb7FnfDeI0V9HLfLBXYOY1SatuICvW7JoKaQZ8Bzt3iqYL/xCx/ouVmsBt3NBurpDAyQ
	97WLSQe/Dpomlx9HTXtbCMSKJZklPJySF1wMpkQvVyyPWbCmUhnGYsa+C2mlyfj35GDwsuz35bq
	9H2viu2EwPDmnnpdJj/Q==
X-Received: by 2002:a05:6000:2c12:b0:435:a3b9:9b8 with SMTP id ffacd0b85a97d-435b15de04cmr4007181f8f.24.1769160318186;
        Fri, 23 Jan 2026 01:25:18 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f73855sm5141283f8f.29.2026.01.23.01.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 01:25:17 -0800 (PST)
Message-ID: <38eb1632-4541-40e2-adc5-9c25fad9df7e@tuxon.dev>
Date: Fri, 23 Jan 2026 11:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260122202345.3387936-2-robh@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260122202345.3387936-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_012520_894285_BC27F6F4 
X-CRM114-Status: UNSURE (   7.26  )
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



On 1/22/26 22:23, Rob Herring (Arm) wrote:
> This .dtsi file is not included anywhere in the tree and can't be
> tested.
> 
> Acked-by: Alexandre Belloni<alexandre.belloni@bootlin.com>
> Signed-off-by: Rob Herring (Arm)<robh@kernel.org>

Applied to at91-dt, thanks!

