Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC60E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuH/NxHgypHXTjjjbglqsSTpq7IdJAHxtTHnjuWbs8w=; b=B0Xseo/+VNNx8OhXw/vCjYrqnJ
	sPSZOVFUfxtyARtr9Qd8YgxfFjvc5qNvIds3yScOOkuZaO1GH07TaNgpf71ubMkMkBnKrlvFtgeWA
	bIby5qL2Xv38jrnmS4tuhCU+4QmdZ2Zr46BHrtmQ/cLVR8fwPc//7U0w6B9AxVEQjmLdZLj5t9mhZ
	cIc2TGZ/ByVeM4wZTM07xtr8P0tSbhdSzfAog2K07eHiSjzpCgQxnJqjwWlSP4wltZoQwU7nBxApM
	i5ylI4TbwOsL1gMH2QJev5hEQXo6YDCcdSYsaCshBes5ToAdsJafWcmt4F+nyc8DM6pSwbz2SMErI
	jF1Ge9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhgQ-00000000QF6-2W2b;
	Mon, 06 Jan 2025 07:37:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhfE-00000000Q4X-2b4w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:36:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43634b570c1so100402915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 23:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736148998; x=1736753798; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XuH/NxHgypHXTjjjbglqsSTpq7IdJAHxtTHnjuWbs8w=;
        b=Gg5YMTP/xmbLsUglv/U6205y47NM1qQDCx0yN3CcWZs1sAsQouQz4LKYL/zCPpHYvI
         YleHwKqUAznt5FC2zNmVqRU6DIB01S14lg5O/2Lkrk/F+4kGIKS2f947R3cgL3LYM+20
         i/c/9GQ8yjQEkhwPo5JEyJXB/N0R4k9tJTeyG1GgUcWCh2oOoxC2ehWZhBoZ1Qor3PvD
         boUhqPPmscbiyq1cRiJOUz/o52HAJd8ksRVMH2y1qvVKQnuyerrE9GGvKSdnTIQ50PiY
         87mQ5UAnATankQnmnHIdMpIpCvEVIrX4miQxPOwxFUwZQglFlVp4A9WpGNUAMyX66IiC
         nITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736148998; x=1736753798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuH/NxHgypHXTjjjbglqsSTpq7IdJAHxtTHnjuWbs8w=;
        b=IfIoxWU0ZtV5wVG++epu1nZreXVDa+nXGYqlZkNW20HMGTVsSF40dzGzVWP4oQwQ/T
         HprvZBrGJQyaJuJLlaevBlyoYY2Ezabat1IjCsTH1gYNlAFTqtTyfRK9tKmDNwRQveqa
         a8Y2QzaB7T5ikd/42SLB8CgxkQMnygXeXQYaYZsn/pwi39d8pPLvoE3xngzU/jXQpN8O
         PTTBZIe6cjxeygyAc4ALvNT+lSbYCVFlOim3QVUtwikuTkeaccGZMwg6M6HdZbRTlEc3
         6f8GKH5NLLuM3CK8lp2f19v9d2oEYEE5RTIFUBaSj548L+TaCLEOtvNGNQWbPhbspsDE
         GN8w==
X-Forwarded-Encrypted: i=1; AJvYcCU/ginDAFwqCLuZwJKFitH79Tswz5TI3KZssJ5I7hQdZH/9qPZu/hVM6WizkF1eb7PQYrY6+2QmqwxDYbXy7DC4@lists.infradead.org
X-Gm-Message-State: AOJu0YzUQRMRjJXD572Lt4LLZJu6SmfQLO+uCGp0kdtpVE1x0EMXGDPV
	I+Bbjse2otu6FDguLoflE7+EBi/Xnl1kDwgRCLuvAanPdrv9MH776/lHby90owg=
X-Gm-Gg: ASbGncueqblqyEOFQXV7dLTzKtyaxBrtM1jWEiNFSu2S8OvMzvclyHYWJnOBwgTUYk2
	ulmAcA1JmzwrhTffRHIa60fvQFyQb30Fvs1Aa+51ZrT9ww1qz/AAtz7WVE1BI9CkqyXdYVei52U
	QiicrE1tRlwsnHq71Z875szM+XX/kmFERvo2Bmo7LlZt6Guj7v4u4LIbZNZP5f/2MXklRjl15iv
	v2w/w3r8xHHWJbbttWIxb8SQYXXzHNdlRy53H6f39yeSM+TDTfZb7lTzG5xTGV4
X-Google-Smtp-Source: AGHT+IFQI0rLosE0iSZMKHi92uLdrnY3vwPRxWC4Uk5UIaHJ/DUMhfH+TpjawDUP/rxJQinNEwLVnw==
X-Received: by 2002:a05:600c:1549:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-43668b78cd4mr451383175e9.27.1736148998319;
        Sun, 05 Jan 2025 23:36:38 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612899f0sm560190565e9.38.2025.01.05.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:36:37 -0800 (PST)
Message-ID: <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
Date: Mon, 6 Jan 2025 07:36:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_233640_672378_880970D3 
X-CRM114-Status: UNSURE (   7.01  )
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

Hiya,

On 1/5/25 4:03 PM, Ivaylo Ivanov wrote:
> +#define USI_MODE_NONE		0
> +#define USI_MODE_UART		1
> +#define USI_MODE_SPI		2
> +#define USI_MODE_I2C		3

USI_CONFIG register refers to the protocol selection with USI_I2C,
USI_SPI, USI_UART. How about getting rid of the MODE from the name?

Cheers,
ta

