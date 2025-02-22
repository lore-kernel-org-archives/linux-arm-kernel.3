Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80328C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw6pR2f8aOsPeIBUPQxbT1NRYua1Nx6Z20tWv/SkYUs=; b=Xas0VMRmDjU4BpQ0cybfkVdvX5
	bIsE9r09r3atLtpqlrXhMwnNMS2UQ4FWprJ2IkKs11qujcrXy/FgGDOBTWxEvgidm4MO797o0MPcL
	uOLCtW/uTcqh1TXnIHclwlflKwSVO7w5zDMc1uZFchUm389+D7Vd+vrkncdaJOqev68w0z6IQjyX7
	tBnt1In7nwuyYIiPQNyttgIBPFkfz9g3gCOuN3gX5JZIgNCAm7Sbk3uxfgo1KV9Y0FOdf15OZU8+O
	hMJaOSRQoQWy1EYQScbtUmkVKVCGFSsXxRhYrMMVoGB5qj/MQCYv5JgTKBIerMKTgrbRS/r82zjgq
	zu3gvMig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnHC-00000007sWc-2wcJ;
	Sat, 22 Feb 2025 11:02:30 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnCX-00000007reX-2uUo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 10:57:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so4129108a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 02:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740221860; x=1740826660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aw6pR2f8aOsPeIBUPQxbT1NRYua1Nx6Z20tWv/SkYUs=;
        b=ng03GjfSB5n0QCndHszmXAPAFxDccXCBHYV9Q3TqI+BbZ/yuxes7Q0NoCOyyWJbspq
         52mYGb6+xmnKw5Uz/t2dt3C8UBsjXHdcJuONy4WnpyufVo+GyPH54n09jZPp1hrrbeBQ
         vPlZxo43apKbe9p5Jr7ipvgPQ6jWjhNDWVKVAEKC/hIYAC7+zL30bbNcIA57FzOa0WJK
         CGn16RMo8G8fjkgC/b2ssFEDqZ/o6AMoDHcO1T8818WmGzb4vfYV/40dZ7joS1SnMfCr
         52ndKPN8WyRUSgEvdC24M4Ag+/+iE7BFwX2ZA/BcagpHjWmICeaRTFD8Chss8ntK0Gh+
         +ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740221860; x=1740826660;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw6pR2f8aOsPeIBUPQxbT1NRYua1Nx6Z20tWv/SkYUs=;
        b=qexbgw5QkTI3J8hfpdEzEqcO3OU/G5AaSTSLNbZOSmr4zw9PLQKpAVB5/hk4eT3mov
         +ECG/FQjAeqK+vk8WVeYahJZJBvgI0GOrJLJeBXwDw4BhwevkzPjxWgzVXJjxRgLVOCb
         SWp0PctAONBmjD6+QE8frVNsz7hkWI1w1ucDSvvo4Eropt1t4EkBtToqrop74XbLmu5W
         pGtW+BW03jz2KMxDOQ5zEQvq9J3LjTMG8ZPFYQsTog104kSY4fEVMjCrp4/zsYiTSZyG
         rpL6MhxE7UuJJO1Yd2008xsVd2G4G45P+1UXLpGAtxckHoWVzzFYT4hMUXc9u0PIqp88
         8aJw==
X-Forwarded-Encrypted: i=1; AJvYcCV8/1zKRXEvpNyal/Sw2xLy/dwLsRQug7E3MmfdvLmYq7t6ys7mBcPsk9w6ipLiwjRN4syDATv55zVEZ8RorQT9@lists.infradead.org
X-Gm-Message-State: AOJu0YyJUuwwt4rcW/A0B8xZKydykGP85i/m8C/vXGX+/iCvTL/GHubt
	XL/vt4BVuk1i24A/u+wZsFo2wbaKQ4hcqyh7ja4ISGiU+tHetvwu
X-Gm-Gg: ASbGncsnBjISvHkYRjU490WGDvivyxxSyASH32zbgWt6HGiruzM5dLo7XSKeQrrsV/5
	zFarGVJg62xlCQyBGJX3WDWCmLvJOgabCM64pih0dzTX+wI6iptkheI+6KihNtkdGeMZ439Q/4D
	LRx/4dwTX2FgtvR0FZaB/krC6EvQVN7fPSgM+VI4onaQKVwZhGG09QZvl42BMGRWadS79k3oJdn
	BzTNHa3F4Ml06oYxU5Klm8iq20tXsSNXEFbw7m+EIipDk8SWwpLAFrP0AM4xWGnZJgfX/B5j5bO
	z0g7S2EuAYW9SeQZpx1gQvg932U8ZjVhY+AiMBbFhgBu7Zbshgfst5Rsi9XLZ7AdjGX+Y/JJdUM
	5
X-Google-Smtp-Source: AGHT+IGnhvm54Vik2CF39bEJRoMEQ5ix1N9FJYonN4QOztOqVwTssq2Iz96ESOuZiaBNAxHqfsX97g==
X-Received: by 2002:a05:6402:234f:b0:5df:b6e1:4690 with SMTP id 4fb4d7f45d1cf-5e0b7106a9cmr14970904a12.12.1740221859769;
        Sat, 22 Feb 2025 02:57:39 -0800 (PST)
Received: from [192.168.50.244] (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5323225fsm1813486166b.24.2025.02.22.02.57.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 02:57:39 -0800 (PST)
Message-ID: <d68e179d-73ac-48d0-acb1-aab644cdf8c6@gmail.com>
Date: Sat, 22 Feb 2025 11:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
 <20250221-bcm59054-v5-1-065f516a9042@gmail.com>
 <20250222-orthodox-black-mayfly-984ffc@krzk-bin>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250222-orthodox-black-mayfly-984ffc@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_025741_735758_1D0A5281 
X-CRM114-Status: GOOD (  17.27  )
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

On 22.02.2025 10:43, Krzysztof Kozlowski wrote:
> On Fri, Feb 21, 2025 at 09:16:23PM +0100, Artur Weber wrote:
>> Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
>> TXT to YAML format. This patch does not change any functionality;
>> the bindings remain the same.
>>
>> The bindings have been split into two parts: the MFD binding and
>> a separate binding for the regulator node, to simplify the addition
>> of other models later (which have different regulators).
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ---
>> Changes in v5:
>> - Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
>>    regulator binding description
>>
>> Changes in v4:
>> - Made $ref use full schema path
>> - Cleaned up example
>> - Dropped regulator name list comment
>> - Changed description of regulator binding to mention BCM59056
>>    explicitly
>> - Changed "Power Management IC" to "Power Management Unit" to match
>>    official Broadcom naming
>> - Renamed mfd/brcm,bcm59056.yaml to mfd/brcm,bcm590xx.yaml
> 
> I don't understand why the name became "xx", instead of matching exactly
> compatible. It wasn't like this when I reviewed it last time and this is
> really unexpected change.
> 
> Please follow standard rules: filename must match compatible.

The change was mostly to make it more generic; it felt a bit weird that
the BCM59054 regulator binding (added in the next patch) referenced a
binding named after BCM59056. But if this is not a problem, and a
concrete model number is required (even if it is only one of the
supported devices), then I'll switch back to the bcm59056 name.

Best regards
Artur

