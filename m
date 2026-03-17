Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0340DFED9E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 16:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URvoLxPA0BeSlPTpYdBZgg88Tz7V0XCja4l2VDYBveU=; b=v1CZtD1KSdT1e1Uss5psbpE7Y3
	HNkKBYFmhe75vnKMyHDYGwB7SkK+v3cpvLF0WAb1KeMqttCNUgJpS+dHuluXIab6FSmDpNMU3YPbZ
	UpXQ097izJfTSpNhfGJNVEjBkWlIZGP1gjWKYm93BnAgaF48rBMB/INPzM/sklp2M3PFo1IQUiis6
	CzFfZT8JrZoxJruDQ9bd5TvZnzVVdjln/kJUPozQW2wGgECZls90B1hOKt04bQrWYENs6hqUbSt8a
	/pNrpgLHHNw2ELnbZG5mJ6J4b2n+Lw/k0iayU5OSFxJq8x0WWqckuZDLA4hBoSKqwSMK1a0As9arV
	E7jQiCzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2X6m-00000006o6h-2T1r;
	Tue, 17 Mar 2026 16:17:28 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2X6k-00000006o5l-1Zht
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 16:17:27 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-128ef6c4a41so2824671c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773764245; x=1774369045; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=URvoLxPA0BeSlPTpYdBZgg88Tz7V0XCja4l2VDYBveU=;
        b=LCj6XvUOnWFz9vBsg7HXzx+3Tjo2zlpYdjHF0CvWqr/CszOAjvVMJuCkX3zf6DDyFP
         kZda3YP7liVkNy9fVtzOXQXj3ygpvUqRVtzHJB1onjPYVbF86CQ2823sOS67NCZ68xMI
         Lw3KdkusD4XiCZvPhK+zAxfZpisCfDRCgt/HUZ4Ro6E5gqR4thqsqFomuBc8kZ+0Rzj5
         NCejWc8B5ebWEZkC0XoeGWsainPZvjLUK/Way5ifgvMXT2oA1SXRiuDo9jDeurmPcOem
         QeAcOOvZnoQQdzzMEGYM1qQAwPVH5zbpo1IWknj9nYMYMgFEBdPP3a6uV63Hj5wXrYJg
         q7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773764245; x=1774369045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URvoLxPA0BeSlPTpYdBZgg88Tz7V0XCja4l2VDYBveU=;
        b=qmOS7mr7lOFutgqkdZASIcYXDQ5G+TJPxHQuIk1ITXworZKXtFHLMUNIwrD9hvRptX
         bSchkKTq0/WZ8iWEm2Nd6QicJ3XRhKyozvKRm9wKy3M8zfSj0nk16d25L7JcWQ8lppXt
         RNbXo2qHUYn2sfkLVxXVZ+lGgQ3MJijTPhEycU/y8EGH3y/RV8qe4c3QUmdnUQlEYM/O
         yEX+ZQPZPMxC2Oirn5hhgSjePNQJd8YlZfSCHo7/ILBfnv+2Zx+fOy0njpSHeEGb7OUU
         gk4My8dZ31vtqtKlV3QTcZjaf9tx5o/lDPI4QIr/1aGdwkGvkHvk6Q2VH1o5wYM21YeT
         7igQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoCHD4CHQoGRGQxh7rBNgO5F28fnwOqE43pIEYogMYkFZNa+gsOkKdnNvIo5Dvum9GWdZgeQczS5yNXdK3nyD6@lists.infradead.org
X-Gm-Message-State: AOJu0YwJhXu28wPM99o7u3BJoesqmqKZ56/VmT0vcZ1b72MUME0danH8
	J9PfwreL/wMJdLmYx67bjUl2YUFSD59qSWmX3wLCt0rOZMdFclBPCDLI
X-Gm-Gg: ATEYQzwjcVwAvYv4tnDNcuiv1Fj40h9iEgqLoVH+80SuPCX8yFUl2Bl/O/0IidVlrDJ
	Yq3vRFcSUtLn8Ai6yJtRe3nVm9WV9LePULYEnArWswAg8ovGp/6vs07KFfFYRENzdM5l/wU78V8
	n2kP7v1KN5ZXPsIBPv7H2+BsUML8r5zUTgEjdCcH8m390JIWX2dnaaJPOtS185DMgdMmFgLqVOO
	9rmRkOebnstBBK/YFcC+Z2Ew0ktNzcNDeNLcNAnDYwhdunC/L2OQf9oMQUSIxb8ARqR/GBrjbdG
	9cwIMvfW6wgo2b2XcOlhUw0ohw6tR6/PSXL39MoBZ+iA4d59QBDHvPO+gyuh9E2ANYeGQDFT8hf
	qJu3mafmVBXWX3xIOgkloFATpneIUpI9LYdDTIt3VI12jIjRDuXo2jnb4wOzM7VoIz6N845/MQW
	PxynLqx+gh7K0GqAOtr1eEqD2Kfrr0JzQpmF9zn+dMCjvhPG35v/RdZDk2Wa6dfwLI51ntPKHA
X-Received: by 2002:a05:7301:4b03:b0:2bd:fe5a:b861 with SMTP id 5a478bee46e88-2c0e4efb874mr14500eec.0.1773764245469;
        Tue, 17 Mar 2026 09:17:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526db0sm24622438eec.20.2026.03.17.09.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:17:23 -0700 (PDT)
Message-ID: <a3ec42e5-d151-4d54-9625-fffeb0399431@roeck-us.net>
Date: Tue, 17 Mar 2026 09:17:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/2] hwmon: emc2305: Support configurable fan PWM
 at shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260312144325.1311314-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_091726_672378_6450BDEA 
X-CRM114-Status: GOOD (  14.18  )
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

On 3/12/26 07:43, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> This series adds support for configuring the fan PWM duty cycle applied
> during system shutdown for the EMC2305 fan controller.
> 
> Some platforms require fans to transition to a predefined safe state
> during shutdown or reboot handoff until firmware or the next boot stage
> reconfigures the controller.
> 
> The new optional Device Tree property "fan-shutdown-percent" allows the
> shutdown PWM duty cycle to be configured per fan output.
> 
> Changes in v3:
> - Rebased on current upstream
> - Dropped already upstreamed of_node_put(child) fix
> Changes in v2:
> - Address feedback from Guenter Roeck
> - Make shutdown behavior configurable via Device Tree
> - Add optional fan-shutdown-percent property
> - Apply shutdown PWM only for channels defining the property
> 
> Florin Leotescu (2):
>    dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
>    hwmon: emc2305: Support configurable fan PWM at shutdown
> 
>   .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
>   drivers/hwmon/emc2305.c                       | 34 +++++++++++++++++++
>   2 files changed, 42 insertions(+)
> 
AI review of series is here:

https://sashiko.dev/#/patchset/20260312144325.1311314-1-florin.leotescu%40oss.nxp.com

Please take a look.

Thanks,
Guenter


