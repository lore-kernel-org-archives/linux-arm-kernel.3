Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A31D46BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PA8gr+YKpeMZlbtexD0GnfzavDOVqcWassYAa2Q9AU=; b=TT3gJdIuqgoHJGIQQ4ujlWH/Zv
	UwomQ8ybxa4ryMvbBpICP97esfvdVJd3XuPIDm/08Hr/pUuE5ZANivjhn0pHRrzo9smsJyxW/Nt71
	jn8hkG0Bx77DmxH4XH5FHxGah8kwJ2iZ8JTmfiYMRhHzo1cbf5cGmpl+37atGn6D84cHWmbU5wFKR
	XeChsGM0pikMrJejXVRWCziGxZwZEF0j6uY3BwfR6ea+oCzvtuwqPmXhlz9kGufTVWojGcMwO3GAz
	ZTJEGWnQbFwGcWR9UCCiMeeEQQBDnQbx2Kb1N86XQE/WD76NH8US0kXxD1DhSzRe0Pbo3loT7tkYX
	r97iPA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHHS-0000000H5HU-3SuR;
	Thu, 29 Jan 2026 01:57:10 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHHP-0000000H5En-1lBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 01:57:09 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-124877d78a6so563216c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 17:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769651826; x=1770256626; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PA8gr+YKpeMZlbtexD0GnfzavDOVqcWassYAa2Q9AU=;
        b=YqIRZaB/2F1lOUNFz5Sp2wGeAl/sMrwRIrM00s68pYVkv6CF7JUl4Dy+iM979LxqKu
         5gloztdlm7oKOmUEkOPjVdYzkyTL2k6r4JnBMnIEKgE8dXj920ow6R1E3A4umGgoXJdt
         B1b75El31zd4dZGbUjpgC0BZQR1d/AFbQZpzqEbnsew/yqTRP7ckcYO+LF6zYb5Zajqx
         Scpd/JfGPyrfi43uFw1qi9gTYpVk34SXr0+AZ0BYk+xnYPZCG8SDtgE+3v1ABibtrzus
         hvyKRgzfnNBcToZxO3Ia7pcerc9Snxivm8JjNtdP6N02fKGma/c8ggm6V9mbxXKBAkn/
         28/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769651826; x=1770256626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PA8gr+YKpeMZlbtexD0GnfzavDOVqcWassYAa2Q9AU=;
        b=Pev2t93vEmbGDEFrvEERN5I5LRgJTeGIsdz8EtbjYwUOgS9vMwLFL2idQAB/lP+9iQ
         vml9bnmVXm74PfQNUSy1+VPBzD/rn5cMT80Qd+xmMOSgP6G9pnpWrQ8tVEJPQdk7qe+e
         ciaOCCQ3g3OGi/aOxt6ed4RoC6a3735xHK76zSwtxpOO8lA4Xrq/KncKTKEWGzxtxLLe
         eoVwiHDmJu3HPFYdYyMxbI3J8hNZEKWov2nQ5gkSp6MDx2hiFkLcNFlOHU2JUbjzWvOV
         v0ftGP0wgkLzWrmpVBeKsufRCaNRXak7fEEylz7TIyQ02ApLSdQOpng2se+rEoQVtxDq
         HiuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuD327cdBNH1rEUgKkA8/5tiN66ImET4QVT7keWVJf6JhtEdGtfqG+NM8/TdTBlDqYmXo/pybhzg3Sver0n62e@lists.infradead.org
X-Gm-Message-State: AOJu0YyeBwrpV7eLV/gn2m4B/LlsLhMO4ddj6l8YAY8AVyukbUhbACOV
	q8uBIur2CI9+2o4e2bhvo9Yjop3g9GVHF/Fa7Td0IKKIYBWP1g1JQ7Z9
X-Gm-Gg: AZuq6aIL5gXAMiGEa76JVKEXi8tpHbd5lt1PwqzbKtD0llrmGC9XwopZY8bd3hzCvJb
	BPwPtsYy3Utu1X2DppaeBI30kYr42nOOjP8v0cd+lE2P/9587hg1yZCq+oo6ogsLX5bV1nYplnW
	Yg7DgY2jJxs3HzyVGjfIAObXyj2AmturTN1rhk1a4++UVxD7IGMkpYvNfqWd+B5mipnIdieAhS/
	nrgzpbx8uI0yDibOtDvI2fMejLHAy/DKwVNJjZmrIv9Osphthig7f5JLwdPHXQrlLd8Mx9+Nv7O
	hKcWt1mc3ejMumFFQZ6oYMN3zPaL5MwOcxjSZb4HHogoYXcVAuUudvSYi/zVfGR6Pwpva2WAg2A
	U6EUbG8AFdP4WjOp4U9Nrjwtqdz8bx76iLVhFLMDt8+tXjboEsIGX/rt338RxMTUTdqmLQv1coP
	kBsjswQKk4oS1U2XefQ/4J3BYRxOd4+PUwKPMDvjfYzh7IfQ==
X-Received: by 2002:a05:7022:b8f:b0:11a:51a8:ec9 with SMTP id a92af1059eb24-124a00bd920mr3704741c88.29.1769651826013;
        Wed, 28 Jan 2026 17:57:06 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9cdcbcfsm5670014c88.0.2026.01.28.17.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 17:57:05 -0800 (PST)
Message-ID: <48f1c033-4a0a-4b17-aae0-9c712748b2ed@gmail.com>
Date: Wed, 28 Jan 2026 18:01:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <3ed93cd3-677c-4d0c-a3a6-25c3d47a4ef2@kernel.org>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <3ed93cd3-677c-4d0c-a3a6-25c3d47a4ef2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_175707_461968_FFFB90C5 
X-CRM114-Status: GOOD (  13.20  )
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

On 1/28/26 02:05, Krzysztof Kozlowski wrote:
> On 23/01/2026 11:47, Bo Gan wrote:
>> Hi Krzysztof,
>>
>> On 1/23/26 02:07, Krzysztof Kozlowski wrote:
>>> On 23/01/2026 08:39, Bo Gan wrote:
>>>>> I assume the address of the interface is fixed. So you can just key
>>>>> off that to distinguish the two instances.
>>>>>
>>>>> Since this is an internal property, not a board property, it is not
>>>>> clear it actually belongs on DT.
>>>>>
>>>>>        Andrew
>>>>
>>>> IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
>>>
>>> This is not the purpose of DT. Please rather use arguments in terms of
>>> DT rules (see docs, presentations).
>>>
>> Any examples? links? Thank you for your patience.
> 
> Really, doing simple search for it is your homework, not our task. You
> need to try harder if you want to prove that you are not wasting our time.
> 
> Documentation/devicetree/bindings
> 
> Or any elinux resources or any recent talks of mine.
> 
> Best regards,
> Krzysztof

You brought up the "use arguments in terms of DT rules" approach. and all I
ask is just some pointers to make sure I'm not misinterpreting. No offense,
but The way you slamming people w/ "not doing their homework" is truly not
constructive.

Bo

