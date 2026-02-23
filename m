Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8368E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9juCIWO3/qNsUDquSKfNxba1OKTRHA92+YWH/XuFNg=; b=QNcW74m+shGOWBrhs/hsELDclr
	AF+G/xAXXuOjgw+pWsx5oLJIBiQRWv4oZsAezEOSPVISMps/jJ/fE8caqy8L6Vy9/E6tzBY264hZU
	N0SyE5CuMFuHqgams80Kv0/QiQWXNi+JRq/4thH/w8tEoofpBJeR8lEDkcwgFBquiVP4nB+/bKoJq
	e8Q+cal4FUSHjcROOD7ikOKPjZ7UBMsk9vqdpP7uO3tUwR8awRVSQyr/4tmUyVHCLvkwXWhvKt5hh
	6cMZi6yGQpJcK3KuRknK5kfy/enwx+9M0WuuECoPpMP4v0oB3wj4rL2I4eq2sSdEaH/2EhjupWkYI
	03N/MRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTd0-000000006fY-3ygN;
	Mon, 23 Feb 2026 10:57:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTcx-000000006eV-2wGo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:57:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4834826e555so40237465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771844241; x=1772449041; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A9juCIWO3/qNsUDquSKfNxba1OKTRHA92+YWH/XuFNg=;
        b=CDCrDymApAMLW454b30JBOfnbC+Bs71fPpVC6EBlBL5ml4N1qqXJG5IkW2l+gkp/QH
         i9ELRx7RbpfIM8fDpK+kM0vGNWRKkmUTkO/u6rf2T7mXzZ1+q69Od/aAR9X05/sMj2nK
         di2QsxGE/N6k472Ylu+iw5X0n7eDw/rbE45675w9A7qAy4XtYKArZg7B+ku3mKVbLKgr
         7h9/lwHo7c+3G62upRwqqT+bkO//C7hcJZ+2H//SLaceZKk60QhX4HHNrzBNrUz90PKx
         9sl+vbpzGwHE3+xHTc+Ol93zx+fhi7RfYzhEepuF1RfKGu341dTVZ5bwe+5/zC+hm07T
         x4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844241; x=1772449041;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9juCIWO3/qNsUDquSKfNxba1OKTRHA92+YWH/XuFNg=;
        b=ovy7nA9EGVYeN6uIqvYp2iX7PIv3+3VCpb5m+h0MUlSOq9djQvjcuaEZt30KSzvHee
         wjNT2CK1MsTDLPYzMlqJC1JGyzGpb6dRTWQwceEDwck4zDZiOyjhX1N7kbEr4BHNzGEX
         d3ws/XWB3rc2M5Jncl7A3gDuCjuKoEYCK0QC3SlnRAQBzOtMoKD90tYjCYRypFVY8TOs
         7AvLzQNXZS3GWDIa7jcRlNZOAXPqrQ0VPiYjYfAuYMxfFVCIbSBSuf0KYcO+hy8tnGBl
         nMG2BBUedv/WmzEbm/zWM0i6K82I9eQKVYY1hu0wF1srYF335tm/xDnmltMVWtoGcIvc
         m/uw==
X-Forwarded-Encrypted: i=1; AJvYcCWkR3By+HBBQYuiGQFFQdNeQ+3bHEWGRRhF4UBnWjSiECp7ar+2JuZTcBjM7r3Fk/l4qEFBGoUgv3TC5pZfu4Lq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5qE75ahR7LjUtmoMbPzbTz2zo63aeWUPs7A9Flh9LAW/osQgA
	reWxpjHst3J2ZmT/B0EijEXtDBSCrOCLXdGkWVVjV0C0SdLKHxVOFueO
X-Gm-Gg: AZuq6aJlHMYd8JLemkYNp3oZLIqf8tgtm6Ct6mLc+5ny0L4yHjF74PsSJLltPkjfiVD
	vZihHI2WRKmwpR7YEh/mRvfzCBj+gNlGQ7pKpKciIYH3CQoy7G+4rh/WVPvfEeYMmM3GIXntA/c
	ZPSXqmtOIwgpYmw/wb6/VAmx7EwRqrLgrn1M5GAmf7qLX0wEMsdOyWBkzEL4d0abxzcOUH4db38
	mVcxg1CC/luAwD+moYtKvyz9f5A5EjXG1qIrolgiXIz9TiByNOyr1ZfHeJlixA+XvzYI4bltQSu
	RyffoYAnUcC9D4ifeXZFUdNWNKzLF3rC7W1h7PivicvPm4gxmp1ZuHVHRRgJP45UeSrd2f3xuGQ
	QYbmpDfpWSNLLiF4ZGdGidgE+FU6Gge4M4kkDN5IM1pH2qiLWwMn5eisqq1gG2VmGiNkk28wD7e
	6cRwq7GD5PTOciqqeNUZfltwinZb/axYg4nWZBzpspSBl+Ju9NBCQw7Hx9+L/35+c=
X-Received: by 2002:a05:600c:8183:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483a962e09fmr116392445e9.21.1771844241031;
        Mon, 23 Feb 2026 02:57:21 -0800 (PST)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dd3391sm166294125e9.1.2026.02.23.02.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:57:20 -0800 (PST)
Message-ID: <10f15883-d8db-4872-8af2-7a8cf293780d@gmail.com>
Date: Mon, 23 Feb 2026 11:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: cznic,turris-mox-rwtm: convert to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260221-mox-rwtm-yaml-v1-1-25dec4a0228b@gmail.com>
 <77c45be6-a0c1-4799-9491-f7e492d60aab@kernel.org>
Content-Language: hu
In-Reply-To: <77c45be6-a0c1-4799-9491-f7e492d60aab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_025723_785581_BFA7FC7B 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Krzysztof,

2026. 02. 21. 19:31 keltezéssel, Krzysztof Kozlowski írta:
> On 21/02/2026 19:21, Gabor Juhos wrote:
>> +
>> +description: |
>> +  This device tree node should be used on Turris Mox, or potentially
>> +  another A3700 compatible device running the Mox's rWTM firmware in
>> +  the secure processor (for example it is possible to flash this
>> +  firmware into EspressoBin).
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: marvell,armada-3700-rwtm-firmware
>> +
>> +      - items:
>> +        - const: marvell,armada-3700-rwtm-firmware
> 
> This makes little sense. How this can be alone and followed by fallback?

I admit that this is quite messy, but let me describe the current situation in
detail.

Originally both the dt-bindings documentation and the 'turris-mox-rwtm' driver
have used the 'cznic,turris-mox-rwtm' compatible alone.

In commit 90ae47215de3 ("firmware: turris-mox-rwtm: add
marvell,armada-3700-rwtm-firmware compatible string") a new compatible string
'marvell,armada-3700-rwtm-firmware' has been added to the driver.

Additionally, in commit 3a52a48973b3 ("arm64: dts: marvell: armada-37xx: move
firmware node to generic dtsi file") added a node to the Armada 37xx SoC dtsi
file which uses only 'marvell,armada-3700-rwtm-firmware' as compatible. In the
same commit the 'armada-3720-turris-mox.dts' file has been modified to use both
compatible strings, and the 'cznic,turris-mox-rwtm'  has been chosen to be the
fallback.

Unfortunately, none of the commits above updated the original dt-binding
documentation, so it is out of date since more than 4 years.

In short, the driver handles both compatibles equally, none of those are a
fallback of the other one. And in the existing in-kernel dts files, the
compatible is specified in the following forms:
  "marvell,armada-3700-rwtm-firmware", "cznic,turris-mox-rwtm"
or
  "marvell,armada-3700-rwtm-firmware" alone

The dt-schema is based on these facts in order to avoid new 'dtbs_check'
warnings, even if this is not the optimal/best approach.

> Plus adding new compatible has to be explicit in commit msg, including
> the reason (existing users).
> 
>> +        - const: cznic,turris-mox-rwtm
> 
> Anyway, not tested. Please test your patches BEFORE you send them. I
> finished review here because of that.

Sorry about wasting your time. This is my first schema and I have missed the
'yamllint' warning indicated by Rob's bot in the other mail.

Nevertheless, I have tested the patch before sending, along with several different
versions besides the current one.

Without the patch 'make dtbs_check' throws the following warnings:

  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
  arch/arm64/boot/dts/marvell/armada-3720-db.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']
  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm']
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: /firmware/armada-3700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700-rwtm-firmware']

Below are the results of testing different compatible rules.

  properties:
    compatible:
      const: cznic,turris-mox-rwtm

  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible:0: 'cznic,turris-mox-rwtm' was expected
  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm'] is too long
  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible:0: 'cznic,turris-mox-rwtm' was expected
  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm'] is too long

  properties:
    compatible:
      const: marvell,armada-3700-rwtm-firmware

  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm'] is too long
  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm'] is too long

  properties:
    compatible:
      enum:
        - marvell,armada-3700-rwtm-firmware
        - cznic,turris-mox-rwtm

  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm'] is too long
  arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware', 'cznic,turris-mox-rwtm'] is too long

  properties:
    compatible:
      items:
        - const: marvell,armada-3700-rwtm-firmware
        - const: cznic,turris-mox-rwtm

  arch/arm64/boot/dts/marvell/armada-3720-db.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-eDPU.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short
  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtb: armada-3700-rwtm (marvell,armada-3700-rwtm-firmware): compatible: ['marvell,armada-3700-rwtm-firmware'] is too short


I wanted to get rid of all warnings, so I ended up with the current patch.

Do you have any suggestion about what would be the acceptable solution to clean
up the current mess?


Regards,
Gabor


