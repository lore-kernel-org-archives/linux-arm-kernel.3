Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D1FE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUU/XypxaduzqMjt/wtaQMQLw5fmlBNHttBG958fM88=; b=ysutHxGzLnnYd3cjOT8h7uoMSv
	UYJCgnKbQrN+Lw5MpbVdbc+lcVEFqxmSytdD0fvLxrhFNWK+u33JuK9VZFa4TSMOu7QqU7bu2Qy1X
	o7b6forVW94snOMzV1zR/+vkFzmzBXo2CssXW5jo0gJocwmPmCSg5oGuPAOB/FIsRJq7Qnik3E64o
	sVr/S9Yc0AcV1VfWMSaW9ZTs2f4yPJntcWisVmzifo/roLAP0p4DwLfMkmNQsO01JQopM9CJUpjhE
	YJxh807SBGNkAvPL/1lUyCpIrJbNjE29rmTrr38VT/DjIrq3LMx7UBQjp9i8M+KdQa98Q/Mod1azD
	McQCHAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGAE-0000000B0XT-2DkJ;
	Mon, 16 Dec 2024 18:49:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNG8g-0000000B0GK-1uyJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 18:48:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so3066061a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 10:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734374897; x=1734979697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GUU/XypxaduzqMjt/wtaQMQLw5fmlBNHttBG958fM88=;
        b=AY4jKHD7XMdbTe4DWpOwrourSFMAewodCigvc5661CMqD6wHDWp0JzRTj9rfN85u24
         F73B5mCjpk31EggxKbIX4cEAkOQRC9sDEPTlGjggRAngB03jOSdXTzd+grP2cv7HO9sq
         TuYOPWlh6dCG+mKsedepLuWViIeKauRDaVLAQWs8oHkbhUgM1e/F3cqGZdQT5SoumXkV
         ktWsZNwUp7B6FcmqiP+lCvKdLY8PHapRH6EQqs+THZIeDQVmZf7DOCSGpK5I95PzsS5n
         2AbJhf8yW5+tXD2gKpMXKDlX11kvCP9y9WToUT2ZNEKzpNU6VLj3X+iens1CCR/7aW0g
         K/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374897; x=1734979697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUU/XypxaduzqMjt/wtaQMQLw5fmlBNHttBG958fM88=;
        b=KiBUJ/JeiDrDh3fd22KT3i/eM+M68eey9bOHsVJ2LQZ/yMn97bCBlW+Byx+b7+FMpk
         3FVi7+Hsf5H+wCan4wB2V61dkjhJX+7yrijf18fZ6QhjT+6zUnw/Cx0SAyNHWlFAAeBd
         whHJ7QYIo0FVKzDcghMntq1gs+BrKLKiorQomjZ02JPlHoBkLcrT9q5igdgh37jvhExd
         byZ54R0nBK4/u+NQ9dTaY7IsrlCYQvB+yW4FP1MRzGaqa/GvGEzK9JR65vuvl2ZPxYa4
         /OImKIXo6Nqo9Ur34jW3Jdh1qpm8qhwR8Qxntcztwr5h/EDNItdMnCeY0nsV7+n26kiH
         yomw==
X-Forwarded-Encrypted: i=1; AJvYcCWPaq72oYwTB1QO1XruCu2zwTBy+f1ai0ekgt+b3oevvmN/8NhqA9004JJ5BxwpCHiDI/XBqg3eUSA+3+/8wE0c@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ZtzFFtlSUr+Ckf9H08ZsopAVy69egXdybBgMw17yogm1Vsxj
	WV1YlR6mu2kuXQpLhQLTsW1kLWI0f1sZ7vJgr3Ii5xyzEQmiyd3T
X-Gm-Gg: ASbGncvQEeOYGmhi0lo+Jij7nxxGgKJn6ZFH+Zer1pcI3jiYkWUWsOScJGF/MaM/vJ6
	Ml9IB+2FCZvFp7v1UuHl74OvcRt+CodyoEhyizwbBzCiH1du2WEGyDXgBBxvZYNICbgm7vtkUs3
	zQKp6hgyxTTiQungX8u1H+fT2CcPd4lAq40NGNv5nWLrFNPAcjdx+gzEmX3g4d6lSf7QMKwudiF
	Q3oCvjculDFvunADD75wdzGz6gNszU63scDXvn8teCeZHCwZhdDv7Bt8TbTpWf+3myI5LbqjG0u
	3O41l+JpqUIOEMQkb/zG1qO0KWmpUw==
X-Google-Smtp-Source: AGHT+IFjQgGzXMt3UDx2US4yIi+IDTITId8IwO9BLtbyFBWANvRg/nW81MMDSaOHXQlVmHcHYluZ1w==
X-Received: by 2002:a17:90b:2e4f:b0:2ee:f687:6ad5 with SMTP id 98e67ed59e1d1-2f2d7d6d692mr891327a91.2.1734374897329;
        Mon, 16 Dec 2024 10:48:17 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142c2b1f6sm8453029a91.0.2024.12.16.10.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 10:48:16 -0800 (PST)
Message-ID: <c64bb634-46d4-486a-8743-699775326058@roeck-us.net>
Date: Mon, 16 Dec 2024 10:48:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for Intel CRPS PSU
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241216175044.4144442-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_104818_503954_6AAE2270 
X-CRM114-Status: GOOD (  13.41  )
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

On 12/16/24 09:50, Ninad Palsule wrote:
> Hello,
> 
> Please review the patchset for Intel CRPS185 driver.
> V2:
> ---
>    - Incorporated review comments by Guenter Roeck
>    - Incorporated review comments by Krzysztof Kozlowski
> 

That is not a useful change log. Please describe what you changed, not who
asked for it.

Guenter

> Ninad Palsule (4):
>    hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
>    hwmon: (pmbus/crps) Add Intel CRPS185 power supply
>    dt-bindings: hwmon: intel,crps185: Add to trivial
>    ARM: dts: aspeed: system1: Use crps PSU driver
> 
>   .../devicetree/bindings/trivial-devices.yaml  |  2 +
>   Documentation/hwmon/crps.rst                  | 97 +++++++++++++++++++
>   Documentation/hwmon/index.rst                 |  1 +
>   MAINTAINERS                                   |  7 ++
>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     |  8 +-
>   drivers/hwmon/pmbus/Kconfig                   |  9 ++
>   drivers/hwmon/pmbus/Makefile                  |  1 +
>   drivers/hwmon/pmbus/crps.c                    | 79 +++++++++++++++
>   drivers/hwmon/pmbus/pmbus_core.c              | 13 ++-
>   9 files changed, 211 insertions(+), 6 deletions(-)
>   create mode 100644 Documentation/hwmon/crps.rst
>   create mode 100644 drivers/hwmon/pmbus/crps.c
> 


