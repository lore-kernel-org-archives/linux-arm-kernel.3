Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CA1CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaMW4qv+HWmxlbkGsY4zc3U/GseK6Y6yJUlRQosh534=; b=hYtrUHvSMKGEE9Bq0sDEwzgKgI
	5TieD8g9kldCXjFJmugp2xFwQYQ5xrPYr6NW4hhCIbImCNOmWgsmoSCQBgGrqEx/cRP3OoDy+g2BZ
	AgdF6MQIGw1gwSI7NmUnC4EZI0YVel0E2773gqMzsgd69gC7529P2VDu/LoGnn2Yocz1j56oc1Zqn
	EnipngrCYa87DtvycbAA246xfigTIhij/iRg38XZnaUcV7AWVHx+14QkEAWDPhgy0uojEe3voMkQi
	0AGTjCIEKy+x32Bwpu83yFjGZbqpOQKKOFpizhaXGZ92VYeMPXivNS4RsLkLkBnpfQqRqUoMLcBMi
	goBRg5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTqG-00000001zrz-1tue;
	Wed, 22 Oct 2025 08:05:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTqD-00000001zrB-3NLZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:05:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-427087ee59cso710383f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761120304; x=1761725104; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WaMW4qv+HWmxlbkGsY4zc3U/GseK6Y6yJUlRQosh534=;
        b=fPXR3WRFGe6ywfzGua+xEcOmBd0+LNY4fOZeqBej6RKnJUVE+JjRs6Qgkx6+liDkgh
         b7fdBQrI0C0faVUd/so1FNF30zq7F3JPHPId+VZ7nSmB/YYg8FA0tyt41ENSvenJdPH1
         Syrq4D9KfOvC1WVYxBKphCmb3wQQ+rRp1HXEV4SgWbOQhnhtdPNcQt5ysREFMr/H3MfD
         DjJ7iUWY6XvPrQtCCdsrdn5aDFVXP6hsTOHI/+9Vtq4Yg9WZi6eNTsjTQPxWiQxv8WLR
         4v0Kl4JHVCd7ofM01UJtTk616HzGUDSY+PedOiLAr9wJ+D7JH6N16qzgpB9cy6K4100R
         41tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120304; x=1761725104;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaMW4qv+HWmxlbkGsY4zc3U/GseK6Y6yJUlRQosh534=;
        b=FnDlfxA59j6Uf/gTH0828emygHrPOWBfE4QmvOS5fmVC5JddQ+CLGc+xTSQ4gpGgVn
         c9HF2r4FWZzZ58q6NOlOT06UJ03YQ+GGAAw1gcMAN7N7IALpYPQBp6a/RCUnGX4M67pI
         uB76dCjjXgZzv8v6ovDGQorycKpeSfj4bh7JFjPMYpRQ7F9MJKHxzrit9YOHprvswSLO
         GHpLPh21UjYGUqVmK3uuXyLGxuCsWEvR98SmEfVGcAGVUKYEK4BYDNQgnCVEADb7Mhx7
         FlnMV6gOUaD+2hUTQDwxn+nRbrKZoFhlOU+9WUuxuc0SNWHY7F2zr5ZjNO1VdUY1ihxZ
         Yejg==
X-Forwarded-Encrypted: i=1; AJvYcCXVvTTvpN5/XSBDycrcvAc4L8YchqRPu6rs9VnY6ZiAdQzVdusQphhHXNbE0M0fMkROkUM5OJ8GCjJXM4a76o5m@lists.infradead.org
X-Gm-Message-State: AOJu0YyY0iWpGDsSzK51UA8tA3RS62Ib3szw5WKDD2bhdjaDu3tYv1ir
	Ew/lsUoOtra1OvkDbzVxGIRMvIiGC39M/UxzrNhwLgHyzwcZU7h4eQoSiwJcu3yMDL4=
X-Gm-Gg: ASbGncu7WDUBKSjqizQWX3QI7miJSQSdOa7mq0XJLRhzxgUC81stl6vkyZ5porHHOnX
	9iAANzcsXo5X5BqF/wrZQkOfOIeWCtZ9A13CMA997qhvrwES1xrQfWm6mryHfvO39DuLdrf/rz+
	SchMREque1+Sn0vxbyKxBqSZlzW9tHYMTnSfuTfKtDOPvG4SQDVfuF/O0ru5w+ND/Gq+sPh1KkP
	ycxohlbxlolc5NUyATXat+xs7Fih0yLsWyaxxYATV9haS/RX5+KS8yFR9aRGXvp/Yk3JjR8d46o
	K+j7JSg7OMJq+/NsGpkS0S5vqRVFA3G53dqolkJaJV/NVNcPDPlcNWvB7hAu1xieTcR2S489USK
	Xr5EAqDTHFRH/6b23U+kjWuCXV0wPqxniA1r7cJucm3FOUu840Pkb10MRn7xP2TBKgNoi1ZW+jm
	ZOX67mGKGYLpcoT4CYC9MY467H2HJr4s8=
X-Google-Smtp-Source: AGHT+IEqZ2V8rN2mEmLYoG/mLkiuUl9zrLKcGvhWzFuap1o57wVT4lm2o3exaDnNV3aCI4TsrsKfHg==
X-Received: by 2002:a05:600c:c171:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-474e77e2007mr18842055e9.0.1761120303733;
        Wed, 22 Oct 2025 01:05:03 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm23751819f8f.17.2025.10.22.01.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:05:02 -0700 (PDT)
Message-ID: <ad8195d7-dee5-4f50-96a5-506de4cf15a8@linaro.org>
Date: Wed, 22 Oct 2025 10:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: Add
 "rpmsg" subnode support
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-imx@nxp.com
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-2-shenwei.wang@nxp.com>
 <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <176095488745.45867.896865155474758901.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_010505_896570_768E42A9 
X-CRM114-Status: UNSURE (   9.91  )
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

On 20/10/2025 12:08, Krzysztof Kozlowski wrote:
> 
> On Thu, 09 Oct 2025 17:27:13 -0500, Shenwei Wang wrote:
>> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
>> an RPMSG channel. These devices may require corresponding device tree
>> nodes, especially when acting as providers, to supply phandles for their
>> consumers.
>>
>> Define an RPMSG node to work as a container for a group of RPMSG channels
>> under the imx_rproc node.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>       (no commit info)
> 
This was not applied, I just b4-ty wrong patch.

Best regards,
Krzysztof


