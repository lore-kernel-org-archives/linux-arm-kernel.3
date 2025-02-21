Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A30DC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diKeoGKMvw67WD9nA8oQ19aH12u8E5Lnnh0I4jgDkeE=; b=MIP2jEMzdB9zJlpVN2ntvgZfkp
	L541Rdfk+djzItT4MB/yfC37RaAx2JfKl6ooDHHEQYxmosQvd8COVTrj9m4gjyMi4TYbYeZXcQ+g3
	ToyRsExfhu3L455mEFioE64asym6uED7mHou2w408YOikQVeaTmIYpvR3cLcqnZysBLgImN3zAjb+
	Xq4ByR/2KjALfy6X1uyjrU9eq6idjMOxyTXV3QHm9uRxXKAiQR56K38cQ3Bq/Ruz5SGHmiJ1iYrbb
	b4dj4LtowT+e5om8e09P/KFpgq9bh4HfICwe/SoRPoZ47i0Ujg8R9ke0WxI7IWBO/z7VaKRzI4qhY
	rhD5XoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZtE-00000006puL-29pn;
	Fri, 21 Feb 2025 20:44:52 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZmS-00000006ox6-21a3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:37:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e0516e7a77so3860092a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740170271; x=1740775071; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=diKeoGKMvw67WD9nA8oQ19aH12u8E5Lnnh0I4jgDkeE=;
        b=aSZbJA+wTzE7Oxv4vigGTBC+TfeEB1a4HuR2t8VXGczldDaWde7eQCqvhMbszZ1qyT
         DaeqYNUGAYt/bLXHWMu7pWo6ccT2Irr+8JmAXVwPxWrN+rCekx+2zAGdQ3Or+945Qk5X
         v2zWI7A30BZ8PLoSiYu1ernW9B33JmJgbin8BxUXrdBqabPtwrFvvLESxKnTeoCCti1q
         673aECVjnnTIlacINDbpUpRQn/MjgNFGM/MeTPj49U86qEDkfki6T8nhZ7QVhVJ9aNNe
         sPEy4+sZv9DEB8Em+ACwwMdbrqzp2y49nHt9WTKFtdb6vXwaVkbB3BcS2TxIWfXcGU3I
         AO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740170271; x=1740775071;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diKeoGKMvw67WD9nA8oQ19aH12u8E5Lnnh0I4jgDkeE=;
        b=YdZHqpGJd9xwGQUYK/gE22X1UUxKebItqz5mrJF9zPTm+vgjbYqI2YIbWsoHlhrEnH
         vCSvm5H1VGhNJ2VXq03Uf1HjyIE632l/YdyqcmqVAm9FqMkAI6QjAe0VGu/84w3gSmJF
         XEgKAPppmzUy8s+uWI47jUqli2Rxu/A3Y/d0dKythHHRcXYkajLPMT78cJPI07d85zK0
         WcB3n9txEmTAK5aU28gafiyTmAYm4EjjWkayx1h3qou6HHEl/QinvKdwcE/XtUfaQIgD
         /NbPWSjaRD0jG5Y0VoX1nnZYU2YgpwP94QKHAF4UviHGTmIWCCurWP+0CU0BLmstHDGf
         MPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3cEDmNbUYgu0Jus276WXQZEzcP6L0193o9zaEIAGk4x9HNFtlXe1fCez383uDtP6pBguZiAqThZNdi+kt1v5l@lists.infradead.org
X-Gm-Message-State: AOJu0YyiQy+BP7BuquQbzJ2CjZwMOWjzRZNwPxWXygVu9arhccxrofx6
	UXLAPIDVbM9cQ57QM+pAxzu8HhxLaMEp4sBucQA6DJaFEfru2diI
X-Gm-Gg: ASbGncseVrzNvCxcfrOiftzbaWxEUIYweGAF7/MPc/inUEUi7l8otVs/TRV7HPX1USJ
	pga+7sAg+rttWL0C2dZH+SxRanT5C2rvlKdoyLM9ihb4rBkL4t4GAB8oh3IiIL6auZnBko35OL8
	ODgYH6GzSwbwFofJvZxVAlh2+FxL1aekQlf3ZdV2M2buPUf7eQJCENi8y8c14SiWUDvhnbVmKFX
	KifbUDzxufNtHd3pe+I1l35vOwOvoAy8idZ4bqi/XtJt4Ony0BGPK/dk036zlyx2Dab1swTiC46
	+dQOf7dOzTWz2cFQugg1mOKP+yE+Dj5yK9IddNPGbpkLssPl827PjsIlXtwlgB1PR6WMDAIZ3KR
	E
X-Google-Smtp-Source: AGHT+IGLQ5ULn22Qgfs/Frvb2e9mzlvzxoLU8GQj0WKPz5SnVgtK4bl1R8ZkkBRgfIHhhx0IA0rg0Q==
X-Received: by 2002:a17:906:308e:b0:ab6:511d:8908 with SMTP id a640c23a62f3a-abc0de19516mr340926666b.40.1740170270560;
        Fri, 21 Feb 2025 12:37:50 -0800 (PST)
Received: from [192.168.50.244] (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba9cf8a262sm1417895166b.22.2025.02.21.12.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:37:50 -0800 (PST)
Message-ID: <2b3059be-2a82-44c9-9bf3-d1c98f66b0e8@gmail.com>
Date: Fri, 21 Feb 2025 21:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: Add bindings for BCM21664
 pin controller
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
 <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_123752_524086_C0405234 
X-CRM114-Status: GOOD (  13.22  )
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

On 21.02.2025 21:32, Artur Weber wrote:
> Add device tree bindings for the pin controller included in the
> BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
> both chips use the same driver, but have different pins, and the
> BCM21664 has 6 alt modes instead of 4.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> (...)
> +examples:
> +  - |
> +    pinctrl@35004800 {
> +      compatible = "brcm,bcm21664-pinctrl";
> +      reg = <0x35004800 0x7f0>;
> +
> +      dev-a-active-pins {
> +        /* group node defining 1 standard pin */
> +        std-grp0 {
> +          pins = "gpio00";
> +          function = "alt1";
> +          input-schmitt-enable;
> +          bias-disable;
> +          slew-rate = <1>;
> +          drive-strength = <4>;
> +        };
> +
> +        /* group node defining 2 I2C pins */
> +        i2c-grp0 {
> +          pins = "bsc1clk", "bsc1dat";
> +          function = "alt2";
> +          bias-pull-up = <720>;
> +          input-enable;

bias-pull-up should not have a value (pull up strength is not
supported). Will fix this in the next version.

> +        };
> +      };
> +    };
> +...
> 

Best regards
Artur

