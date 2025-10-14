Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66858CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6UJfRMC7vI8XJ/lVMtg2P/k+rG1cg8dROQofj14ZQo=; b=XBKuUqqnr2hfNcGh5Uw5qC/4BP
	MFutu6ysKL74m0OtOOWPt4QAXDvco7IugzHnbmUUpwidLHdLM4Qglk5c3wN6mTuKTkcymkICqAnZh
	w2L5yFtNT/9OR6zEfRIuy8qpqb/9DKDmrJ5dKrcbxiwj4CYe6Lgr8aQh183Y7AFmRh9JyfuXn+FjK
	1PfckUFCc2lMmbQuoP9JehR7lvGJF0QiNjMGTB3NFQP0OU+XjQNPv+HWDuRgpANOLc7WgLQ0AhV27
	zoVOG9vi8JnYpSpz1KmeYERUcybeulrYKVmy804SDzoUwIIsw5x/7zNz3Y37+CXa7RR0U2VC+3961
	ZkP0gC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Va5-0000000F3Hi-3G5r;
	Tue, 14 Oct 2025 03:20:09 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Va2-0000000F3HG-1dDh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 03:20:07 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7835321bc98so4657707b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760412005; x=1761016805; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=l6UJfRMC7vI8XJ/lVMtg2P/k+rG1cg8dROQofj14ZQo=;
        b=IQDrRoj5w6nSa5RZPnYq5a/2qQCksP0U0IBp2wuLxHIqz9aa6ZxiMSZM/t7UMvDpfM
         exHdpGSWedWDK8+fW+51PomfKp1SYypwlt1cFIoSo3YrViRc/rSYjuZDDaIlXnJaSgtw
         KXaUEGYlcj3ZoilOlMImzm8EAuG+85a2g/Po5yyUcCkGqaZ8WPyud0zBHthg08gPPb1b
         db7rxUX/Zvz0WgLxquvPUBlDAmDq83BHIujGn6yNkUYN8khTlGENR+41WqJepTL5ST8A
         XHk057Q8m+3cpZahQHdFqTGfboSF/jIm+2fhM5TcoCQ0PkY/ut0UrSjHTRAi0iQKAnIu
         Cqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760412005; x=1761016805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6UJfRMC7vI8XJ/lVMtg2P/k+rG1cg8dROQofj14ZQo=;
        b=ZFHL4p5TxHP7c8eWqrXsjUVhjdTp2uLS/+2htGUGWYTU6Lrl1JaehQ1uq8S/IFA9Db
         2gUztXCDf5zRdt+t2oc8HGZRMuL+PJe38X6jKYX0McdANjhNRLfwRygfnlgyPq2tGneg
         P0D71xu0y1yDpKGu2QGYvLvm6yH2Y/5Lw58H6wXk7Sunwo9sFz0URlWn0lPZummaA2Vm
         7UsE8g5aAvjPk/bg3xCTP+luLWE3cNwv1f5kCEhlJoNvUkJJR0I6I/r1mUukeivFJA4E
         xWvstG/YdrgTI8F6q5zJbjNEL03AKQRZ0SgT19tPXJJc1dSPvySZHEQzwD7UyfNrLWgZ
         S10A==
X-Forwarded-Encrypted: i=1; AJvYcCUVW7SMPXxo9urMsDxYXtk8IwaYHZfbAMJkzz4W9/QDTpHCb2/fUnwtlguL01rtlGps3+akTuto8Y+uJZGrjJzP@lists.infradead.org
X-Gm-Message-State: AOJu0YwQfDeJ6TNqtQz5zvbxxRMNDw0ddSv7RA/cuXltsVrql3CSWPUA
	XyaxfLSq3cXccJMBmtkwo/TJ/MMr7vFwJAY5rcQX9JwLrwRw5URaReuV
X-Gm-Gg: ASbGncuJN7vzaUJ+i4N9PxcxyqMGVDadFmjgBWhuVBUd+Zac46x8Jx1nQqTfy/CwoXr
	MiOTFIdNF9N71pxY9Gd+MabucNWKmaweqctyZCCO2uudN38EgJRs+I9d48yxpMKSdR3/dvtPyHf
	ipDPIIJ4N7rNJgGXMt5iBSsMxL5WR98Gd3jq+kmtIiyeeDIdBESrXZkmItAo2wLLj9p5pjihdT2
	H6G0HyIU9YLFsDxCp8l6xDev4Vgk0+urcnjqQrlYCOiBUL/cqykwK3g8NOVfx+Ymw2VeD311BlB
	QmwwS14ByTm5sfMgk2or4hX5jGlIlhXRTqhLgzyAK9z+auYRdrxXvI8y2/IOjNqGAF6+XrPnEHY
	7X7GtHbvWZHDX8dQjcE4Wf9irSfqNG+NcAL1nbdaGkJj/WYond1+Qltt9edw/Jyo14+BagJPNeT
	9ovlP1q7/d5SJ52SXL93xn/WBI
X-Google-Smtp-Source: AGHT+IE2bL3FW7iscYvEusgSbZQ3EznMhjFPvP3ZLjEF/s4fklES93VBIW8vBAnhYEqbAtzcszCZqQ==
X-Received: by 2002:a05:6a00:b84:b0:781:1481:897d with SMTP id d2e1a72fcca58-7938763169cmr30189229b3a.17.1760412004876;
        Mon, 13 Oct 2025 20:20:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b73334asm13266281b3a.21.2025.10.13.20.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:20:04 -0700 (PDT)
Message-ID: <e3dc7aee-c8af-4276-84e5-0f0c7926be05@roeck-us.net>
Date: Mon, 13 Oct 2025 20:20:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Tao Ren <taoren@meta.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net> <aO2kLyxGlGt12sKD@fedora>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aO2kLyxGlGt12sKD@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_202006_460384_D6CCCF45 
X-CRM114-Status: GOOD (  20.30  )
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

On 10/13/25 18:15, Tao Ren wrote:
> Hi Guenter,
> 
> On Mon, Oct 13, 2025 at 05:20:57PM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> On Sun, Jul 27, 2025 at 10:56:13PM -0700, rentao.bupt@gmail.com wrote:
>>> From: Tao Ren <rentao.bupt@gmail.com>
>>>
>>> Include "facebook-fuji-data64.dts" in facebook-fuji dts to avoid
>>> duplicated code.
>>>
>>> Fuji-data64 and Fuji are identical except the BMC flash layout.
>>>
>>> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
>>
>> With this patch in the mainline kernel, the Ethernet interface I use for
>> testing does not come online when loading fuji-bmc in qemu.
>>
>> Reverting this patch fixes the problem.
>>
>> Looking into this patch,
>>
>>> -
>>> -#include <dt-bindings/leds/common.h>
>>> -#include "ast2600-facebook-netbmc-common.dtsi"
>>> +#include "aspeed-bmc-facebook-fuji-data64.dts"
>>>   
>> ...
>>> -&mac3 {
>>> -	status = "okay";
>>> -	phy-mode = "rgmii";
>>> -	phy-handle = <&ethphy3>;
>>> -	pinctrl-names = "default";
>>> -	pinctrl-0 = <&pinctrl_rgmii4_default>;
>>> -};
>>
>> I don't see this in aspeed-bmc-facebook-fuji-data64.dts, meaning that
>> interface is now disabled. Adding it back in fixes the problem.
>> Also, MAC3 is explicitly enabled for fuji-bmc in qemu.
>>
>> Was the interface disabled on purpose ?
>>
>> Thanks,
>> Guenter
> 
> The mac3 interface was removed in the latest patch (v4) per Andrew Lunn's
> feedback, because the rgmii setting is incorrect.
> 
> I was planning to add mac3 back as soon as rgmii support is properly
> handled in aspeed mac driver, but kindly let me know if you have other
> suggestions.
> 

All I can say is that it worked just fine with the qemu emulation,
and that it is broken now. Since it was broken on purpose I guess I'll
have to find a workaround or stop testing network interfaces with
that emulation entirely.

Guenter


