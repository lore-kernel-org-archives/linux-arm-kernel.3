Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A20FF47CC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 19:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ycShkWVfvP9qFPQPEgw7veVNo7m/BtpCOIUn4PJI+A=; b=Pee1foFn23AkL2MOZQSxTHPKWV
	4eKqT3UFk9LIndamOl/SuFFasTR/eSXxWzkiB74yNtbk19KhyWCb+DpmxognKThxyg22QnvEUbq9c
	hWGctoZZ7J6ZGvS6pcmSFc1o7OVEy04EvyfFdt4kFSEvazvH5s/q26Cvm44FPvfR7ESPWd8dD2RCn
	dsEUQrdlj/GF08vK9Q4xLDuu24nmsOuJ69Ol2jPmbXVWKX5ne5Bkap5JG4jWu06ReFCpq75Nwuf98
	J1nNlkux+cJM+7RG8ke9CfuUsWIm63jePpIfX/P3+/3gKhlLO/LfuqRC0U6i3buI2vvtHuEddQtOF
	s5Ga53Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEjm-00000002Twx-2CNa;
	Thu, 05 Mar 2026 19:51:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyEjk-00000002Twb-1LSp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 19:51:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48370174e18so51009565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 11:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772740314; x=1773345114; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ycShkWVfvP9qFPQPEgw7veVNo7m/BtpCOIUn4PJI+A=;
        b=j6QkCw111LZv/pewh9nP8zROq5+fVOfTnRjqsFYYqGaH9f39QN8GYc4WIOkNMlxorJ
         w/SXgeR0bDYEfbVFCqmHud0GlVYaJOJ7UdgToO2nhGbxEmdtLVyN15pMNlwupBIGzMau
         vWMicytf0Ufg8UeJB81vpmZ6cql16vAggZtZO67yCWLBnoE0M0HncWqGFynTwNW/3Iny
         n++OTP5v4UshWcizZa/wYczw6UwhA0f6OKcGyBagh6EGOlpcBprU1mf52ThMn2mRrhs8
         gBRTV3afOlH7avPe+r7nwJUXjAKVc3UqM2MrMiAspYdv7z1C9NNlFc6wx6YQ29HpTUCx
         d3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772740314; x=1773345114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ycShkWVfvP9qFPQPEgw7veVNo7m/BtpCOIUn4PJI+A=;
        b=utXPowyX95PgRhoRJfKMn1u7VlHJnbT6nWusqW6UuK0F+Kr4k2K9HB+XB5nF2ITN+g
         KGFbkG08S2oYn8umfHvLktUsY/9PAaGeY9DM1n3Dd60EJGyTgINOw8TFlYENB26/ipP6
         pC8chp2/f7hl23uEuacCrEaD7aGK1AqF/bGlRe/nsOXq2HyUUc2jJ8YnNCAoqOcNDMAa
         tqFSakFUwM0kqEOUGj2Rvexyfiqz1KQNIo2g4UrfbMe/I1tyWf5LsmJQgUsDLVCBrBU9
         MIwcNZchN34lyQNFbl0KC55cU4HZXQc02geXAprN0uKaa/l+8MBYIF6hpDkInAIwfy66
         61iA==
X-Forwarded-Encrypted: i=1; AJvYcCUrEI4aUWjqaTWLfJVqq4yG+9hJ6o8YlpiXbQngruLuB8/5QjDOpo/JMrtqCH2si4mmfmxfvRXOqLj9nQSzYVZ8@lists.infradead.org
X-Gm-Message-State: AOJu0YynmghIue5dc8U+vklPpYp2zjX3/1aZUIW/vUrLsOc8EajK/Rfn
	PWMATXAcQMCtgYdaSyntbKfFT/qp5TaqXAiPYopkviPH7KaGa9PNuSGj
X-Gm-Gg: ATEYQzwLjj+IMlXChfihRhyRPcoYFf9Elai3GCeczIqiVdGEgGLJcl/NKo0TexyvGTj
	KDfTeMDtAPHGxZ/hicB36AWkfeqVw1LrsE60qOKH4t1DecDX6vZ56Vvg9dqpskKCIb+Ev4CPzfu
	SWR7XmC11Np3eWjAWGGw45sb7owCeLNNgJise8uBqEwlqgddvxFdyLAOyQtS07n4aR9Xp7Knz7s
	XLg7DYgwpeE0KXV/MtcvRlsPdJhScetw4hB8hCGOkymougIOt3nm1aTnR8iQRZ7HUmIVDt3vO/D
	9lDsh3sKz8pH7EOR6ntOPlSvydtG2lbuI6IhiomRoyTEigkFq1Ej6IA/qR2Fe2GpkAUEWLLRwWj
	X4gpiezLOvbdhECaOC2CGkwk4OlMTNr7FN1SXA7PEdtfzG40a/usudE5bQkA8osXDJ9ZDeAoabw
	X+vTS6u/jgPijMwdbMVpmdbQJg1jv1rm3keSl8aTvwgTuiwZ1ngkUr6p1gNHSyN9I=
X-Received: by 2002:a05:600c:828a:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-4851986f362mr134157105e9.19.1772740313624;
        Thu, 05 Mar 2026 11:51:53 -0800 (PST)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852378dc51sm9128705e9.1.2026.03.05.11.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 11:51:53 -0800 (PST)
Message-ID: <41a42087-dc36-41de-a8f2-0c8b39425ffd@gmail.com>
Date: Thu, 5 Mar 2026 20:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' properties
Content-Language: hu
To: Andrew Lunn <andrew@lunn.ch>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com>
 <db997887-2431-4baa-8e96-04f53ea59060@lunn.ch>
 <874imug18l.fsf@BLaptop.bootlin.com>
 <cacefc69-dba3-4ff6-a039-85fe35a91e0b@lunn.ch>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <cacefc69-dba3-4ff6-a039-85fe35a91e0b@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_115156_387203_E478CA31 
X-CRM114-Status: GOOD (  18.76  )
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

Hi Andrew,

2026. 03. 05. 14:28 keltezéssel, Andrew Lunn írta:
> On Thu, Mar 05, 2026 at 08:54:34AM +0100, Gregory CLEMENT wrote:
>> Hello Andrew,
>>
>>> On Wed, Mar 04, 2026 at 08:12:43PM +0100, Gabor Juhos wrote:
>>>> The 'marvell,usb-misc-reg' property is present both in the EHCI and
>>>> in the XHCI USB host device nodes, however it is not documented. Thus
>>>> 'make dtbs_check' produces warnings like these:
>>>>
>>>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
>>>>           from schema $id: http://devicetree.org/schemas/usb/generic-xhci.yaml
>>>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-reg' was unexpected)
>>>>           from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
>>>>
>>>> Apart from the fact that the properties are not documented, those are
>>>> not even used by any USB host drivers. At least 'git grep' says this:
>>>>
>>>>   $ git grep -n 'marvell.usb-misc-reg' v7.0-rc2
>>>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:30:  marvell,usb-misc-reg:
>>>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:41:  - marvell,usb-misc-reg
>>>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-utmi-phy.yaml:50:      marvell,usb-misc-reg = <&usb2_syscon>;
>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:372:                              marvell,usb-misc-reg = <&usb32_syscon>;
>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:383:                              marvell,usb-misc-reg = <&usb32_syscon>;
>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:396:                              marvell,usb-misc-reg = <&usb2_syscon>;
>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:406:                              marvell,usb-misc-reg = <&usb2_syscon>;
>>>>   v7.0-rc2:drivers/phy/marvell/phy-mvebu-a3700-utmi.c:231:                                                         "marvell,usb-misc-reg");
>>>
>>
>> I don't follow:
>>
>>> The phy-mvebu-a3700-utmi.c does use it, and does document it:
>>>
>>>   marvell,usb-misc-reg:
>>>     description:
>>>       Phandle on the "USB miscellaneous registers" shared region
>>>       covering registers related to both the host controller and
>>>       the PHY.
>>>     $ref: /schemas/types.yaml#/definitions/phandle
>>>
>>> And the patch which added the property to the USB nodes also added the
>>> PHY nodes.
>>>
>>> commit 05d168a56fae8ff50432d5dfe6e7423b989455a8
>>> Author: Miquel Raynal <miquel.raynal@bootlin.com>
>>> Date:   Tue Jan 29 10:36:34 2019 +0100
>>>
>>>     arm64: dts: marvell: armada-37xx: declare USB2 UTMI PHYs
>>>
>>
>> You stated that the property is used and was properly added.
> 
> I can understand your confusion. The commit message is not great. I
> had to read quite a bit of code to convince myself the change is
> correct.

> The property is used and documented in the Generic PHY driver,
> phy-mvebu-a3700-utmi.c. And the properties being removed are in USB
> nodes. The properties in the PHY node are not removed.
> 
> The properties in the USB node have never been used, as far as i can
> see.

Thank you for the review, and sorry about the confusing commit message. Perhaps
I should have skipped the 'git grep' part.

@Gregory: Shall I send a v2 with a reworded the commit message?

Regards,
Gabor


