Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DDAC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YljKQXBtGiaGwd+MSQtk+gKaVlh4BPM5fTbTeZoYEdE=; b=Pqm9atKW5lsyELkN66fRMWzrdL
	EAG2zrtWDFfvZaPM7IxeiBvlrXyB4hNWMzQ+7UB9w+2QB/xeVfSx2w82/2RTG7ST5rjMZIsKTtKAh
	EcyiJS35hZYi57rQDbgJVWm8+4ngiyIheVCqGhU3mcCmtfzgY8vyjhndPAWlyUg/fQsnFMBRxvvk+
	F6SOcLLqy3tUn7/EqeEhc91uFWO4peIw/8/miXpaU/ZWETFbvraW8b2+cnuaRsk7sb5xXUj5crmfF
	LTFHsZ9mUT3TAgk9J15kg4cqIlBMu1uUt4jadBFi4Rh/oVqemfCzh2pMTy8/woBHYY5IraHeKq8Bs
	td54IUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ONw-00000006RLD-2Kru;
	Mon, 28 Apr 2025 13:19:00 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NuA-00000006GBI-0h19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:48:15 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3123c0ef9so46780766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745844492; x=1746449292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YljKQXBtGiaGwd+MSQtk+gKaVlh4BPM5fTbTeZoYEdE=;
        b=IqV1qvtmbCODv6v0U4qSNlm/GFpxvTq1kZpSBHj+zy3LlgHk8/zClj4dS5Bg7uQF4j
         vDrvCkJvFu9LuNL1Fv0Eo8niiSwH/CHtwJK2/u7DbFYSXS5tndkYiw5h7wNALkJkzW/P
         qL5Q0dU60YaIzKvOtrW8DbCa2q87zUzpCOVNrf3CDnhNBQQFJw8PY+hqeNcE+hUH4j8v
         Zn5Of4dl8g80hAMIL85xnX4Q/P3MPwldDwWOebXgQ2It1WhtpHWU6gUWR186sfR+rV+m
         d/NTGswjY/GpJI6XjhwRp/mCEB6PNV0KFX9H1Rtu13jvAmjRSNS6ndMPvffG1DV1isft
         bngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844492; x=1746449292;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YljKQXBtGiaGwd+MSQtk+gKaVlh4BPM5fTbTeZoYEdE=;
        b=Vzrnbk2ZSfLTSqgaJ+pnVcJwlcSxHd5/1Bb09JA/Yoly09h/RTa3bJkrDUgxyhdn92
         dmqzzMcr+slOAYR2mm6lMCngFCr3Za3Sm/ZoctzcS3NMGyIY5fVdnnSstm3YkfdX08oe
         Cx+6RkJndf9C9rbcxRanv3eukMb4fYhq2DKPJMvZ+BVflt9rK4Xtu+oEdDAvxRBr1xgZ
         U3wu61/OZ2PBdjlPI1MrAjtAGatmF0fqPwzg8H4YtVGzSby2wOQNE9TwBYu28XSQm5tw
         v+A2RYs3uBKQ9EuTUcgT+C86Yqwg2zBAVQm2f1FEPunVHeqoY3HfrZ8G+xiM2GZxCRDL
         o7UA==
X-Forwarded-Encrypted: i=1; AJvYcCWyRlWSqJgrfHwnHjlbcDi3Sigk7a02pBgqNgsyewZHwURQV9QMDCIpF/SSUBtZTA3llbJC7weh5x2bw1iccDPw@lists.infradead.org
X-Gm-Message-State: AOJu0YwegaxtL0hSwC1DSDNxbgsryMEqQ5dq4O4xLOe4d5n29zC741PJ
	SKulbzYlbXfxgfZtb5kxt8ljQ8Z+1uK6tKhfLhygF7C0+0CYTIVLaYctBYHY4Bc=
X-Gm-Gg: ASbGncsw+thHOTLjqnsSZ8fwdRdh5I6Xw8MENRAGAvhh/GWxLltPwTaxVncNSmG7rUP
	BcAEJ8FegvGV4ULRUiONDUVdQmbtek5JTJMI1dNwxPVDyvbpSlfoKnTesvhkCNRXEj5nF23fzLX
	/A/z+RNHB4QG+ke2Iuv9C4n7SAXiD5iGlBk7JlEZpsjBGLSvOu8mk/J8ZPDkdE8mbuMazAocK9M
	FcsLNXrADEV+frYK2p16kEt+RQO/H5wMbqb42lsIl4E0Z6WDJ/IZnb1Z3weFI5MprIsEpcuU3yI
	RzHcDgfXMeOO/lBer17RQ8z1doVQIuqXomhyUE96ScQuyNh5WZnEVQKSNhU=
X-Google-Smtp-Source: AGHT+IFOroP/fL/DAdnVjum70IajwrW6YU3IaS/LoZWYdb3NibmMKKHUKEvzakkKo/2mdE8tfvRkdQ==
X-Received: by 2002:a17:907:3d94:b0:ac3:66fb:b197 with SMTP id a640c23a62f3a-ace7103a0c0mr347630966b.3.1745844492159;
        Mon, 28 Apr 2025 05:48:12 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41b5e7sm636248466b.13.2025.04.28.05.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 05:48:11 -0700 (PDT)
Message-ID: <1df9b47a-d20e-4755-9b30-75d8ff150551@linaro.org>
Date: Mon, 28 Apr 2025 14:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable XDP socket support for
 high-performance networking
To: Meghana Malladi <m-malladi@ti.com>, nm@ti.com, vigneshr@ti.com
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, quic_tdas@quicinc.com,
 nfraprado@collabora.com, arnd@arndb.de, lumag@kernel.org,
 geert+renesas@glider.be, bjorn.andersson@oss.qualcomm.com, will@kernel.org,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
References: <20250428121025.246119-1-m-malladi@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250428121025.246119-1-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_054814_215729_F4AAF3B6 
X-CRM114-Status: UNSURE (   8.00  )
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

On 28/04/2025 14:10, Meghana Malladi wrote:
> From: MD Danish Anwar <danishanwar@ti.com>
> 
> Enable CONFIG_XDP_SOCKETS to allow for eXpress Data Path (XDP) socket
> support specifically on TI SoC platforms such as the AM64x and AM65x.
> This enables the use of XDP sockets for high-performance, low-latency
> networking applications, allowing for efficient processing of network
> packets and improved overall system performance.

High performance, low-latency network applications do not use defconfig.
That's a development config.

Best regards,
Krzysztof

