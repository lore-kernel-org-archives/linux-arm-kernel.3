Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A41D5E124
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 03:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=; b=wL9TzKGMiBOiTkxx36hwjHSNNB
	/2rl67pR+vSQ9S4STTbGVx8Uji1fidCPqa7CX57RVeeJcMf7GJQuoRYsEq+f+gg0FPrqVEtyBA6Ju
	eCIUXaqjBd7DN1MS93vJaxuINAnBI0ae0wyuY9OgG+ddIVdzlJBGmydPzkAtuw+o5RafginBX2ick
	p12oGupcz1oODtHtCwk5MBb7+klLc29yL9prRNMyENKbo0BvVZM0djNvTEtSHRLDjA9S/NKMGNdSz
	SRUQaqMEhBLPi273lyOm2JtY0scMyHWzooCLXl8eZLDevBSQ+jIJ2AQQbO0qAJ7GpA0VEcJ1v1hK1
	xWd/GEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9FfL-000000098J3-1pw6;
	Fri, 08 Nov 2024 03:28:07 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9FbX-000000097Pp-3boT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 03:24:13 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-720be27db27so1321797b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 19:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731036251; x=1731641051; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=;
        b=Bv/mqvqcW60Vh88PJ5mCD2m09/HYA7nhYtYCfmPKK7U+J7ASN46rBD5HIooHKQ8RX7
         e7lbjsqMq6xjiG0N5wS4VK4lxjJKDotxKLE9OyMLwG2oxXhujzVWqogXITzOSMtMPJ9H
         3NGlJ/UTTnHNcXl/4HmHDTWbjBlyzfR/gflAEJ7YAWDz2NhAz7f1fXKYSYybzCQ2pvAJ
         jTr/xCLN4An/6jPDNDEgOT3/BU1Yr5xTkUM+SzPRxLgrBggmwMZSfvBd5EKDrX68iiFC
         2+dXKGCUh/ZSqzh9E3PImBTLY/fStI5V0P2macF8s7qrysDYuS2jyEPGdWMP/LvqqSJE
         p0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731036251; x=1731641051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FiQi+zVrti/4lwYHeXMzDjh6Y9tSUZHidpZ6r5DzMFs=;
        b=v8xQN23JbIP5EMQHp2wbydcjp/f44AsDc7dCVNN/qoNoYWsjv4TvJkht5HdzA9GRmY
         nfws+cIKQ4wm0VGQvRZNgJLFh5SL/9rXNaWmXvAyhgzxMCO7/LnZ3ZWLvDghN2MZ5xvI
         L+M6jHOKFbr7GCOsOqNOJhl4LyoklY6RFH9jeMY8F+B2az9qajhYNTxkvvU1Z5byP/RO
         KvsShHf9DsscmcvQv/Lg3SrFoyKcSaqbvwsCVoLPjtd5LQg73qNU0TcWgBTnln4YfvgC
         UwR2I6RmINWFYmmgwP5X0ipAhgYEFYAmkEdJqGdPlU4r97x+jP7opWvRxNKmuK6Jr5mK
         nhvw==
X-Forwarded-Encrypted: i=1; AJvYcCW5s4z+yloS7YGMaLwnNavxULSR69x2cmyy2lBatHSb1uCAbIBObdOReR2LtMlz6fV2gwB/M0YI9Di6nu9RoGih@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4t5IRFOP4DnduDlNv1hFB0YU38YUuC+K7N4q2M6yP/RMyl7s7
	ZGZt6oxmIjBr6EeUUbpcHEB8FrWpZ83pGvBvYZBone85ovy+3myK
X-Google-Smtp-Source: AGHT+IEuCqDHEhTNFZCpyyg20d0b3Zu/p1XC6BTzBjuWov+1G8DqVUKH6K6wMKylQPRL5ggF5yB5RQ==
X-Received: by 2002:a05:6a00:1a89:b0:71e:4ee1:6d78 with SMTP id d2e1a72fcca58-7241327a424mr1559577b3a.1.1731036250950;
        Thu, 07 Nov 2024 19:24:10 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240785fbe9sm2556540b3a.37.2024.11.07.19.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 19:24:10 -0800 (PST)
Message-ID: <7a476087-9efc-4271-bd2c-d04a0c1d0dff@gmail.com>
Date: Fri, 8 Nov 2024 11:24:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Conor Dooley <conor@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
 <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
 <20241107-slip-graceful-767507d20d1b@spud>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241107-slip-graceful-767507d20d1b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_192411_930719_482D290D 
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


Conor Dooley 於 11/8/2024 1:09 AM 寫道:
> On Thu, Nov 07, 2024 at 06:15:51PM +0800, Joey Lu wrote:
>> Conor Dooley 於 11/6/2024 11:44 PM 寫道:
>>> On Wed, Nov 06, 2024 at 07:19:28PM +0800, Joey Lu wrote:
>>>> +  nuvoton,sys:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: phandle to access GCR (Global Control Register) registers.
>>> Why do you need a phandle to this? You appear to have multiple dwmacs on
>>> your device if the example is anything to go by, how come you don't need
>>> to access different portions of this depending on which dwmac instance
>>> you are?
>> On our platform, a system register is required to specify the TX/RX clock
>> path delay control, switch modes between RMII and RGMII, and configure other
>> related settings.
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  reset-names:
>>>> +    items:
>>>> +      - const: stmmaceth
>>>> +
>>>> +  mac-id:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      The interface of MAC.
>>> A vendor prefix is required for custom properties, but I don't think you
>>> need this and actually it is a bandaid for some other information you're
>>> missing. Probably related to your nuvoton,sys property only being a
>>> phandle with no arguments.
>> This property will be removed.
> I'm almost certain you can't just remove this property, because you need
> it to tell which portion of the GCR is applicable to the dwmac instance
> in question. Instead, you need to ad an argument to your phandle. The
> starfive dwmac binding/driver has an example of what you can do.

Yes, I will use this method instead.🙂

mac-id and tx/rx-delay will be arguments of syscon.

Thanks!


