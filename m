Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FB4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdSoGM0IN0Zxqh7qDqdJr7Z4o4Vwb6jb+542zPpHAYI=; b=LsHzEntKQdEwEj6pkkSFasp16D
	ydhCaMFyi3XqSJ+sqMQ3sjggStbbdRaIfV7jxnIPBzapLYNuP51hR/kfZalAPPIt8w0ovw1ls/W3c
	kib6SioZTbtBXfYRJt27ipVEsXGpTwmGbuJOajnCbs97cij/sqikQPyTEXTt+tpN1cBkjrdEH7qZt
	LozTtmUezNghlKgXmQHnZ27y45lL32noVHZOMWXFEMsB6nRBnR8hC1GIFhE20le4eWWRlBxmB3ZwQ
	H1W83Drc0e++Jy1naFl3iIdCYdb7m1nI8D6dvvNRA7qT2qMLMKlLktjV11K9difu8TXPapDxTZc8x
	x33lgJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVovI-0000000BMu3-07gV;
	Thu, 09 Jan 2025 09:33:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVou3-0000000BMfK-1TxZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:32:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38a8b35e168so400124f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736415152; x=1737019952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdSoGM0IN0Zxqh7qDqdJr7Z4o4Vwb6jb+542zPpHAYI=;
        b=qYozgfw0l/8ng/4paj9Fz+oM1qxyR7p2G0+aeaedegB3wQXANathX+bPl2Ht+b7HE3
         Og5adKOvw/4Yx7XgRVGMHN78yIR96sq0/pZ40hy64FMmmtbkYPQQqQ1wly8tAezZ136n
         5IGpINmpHdYluzKhPpPjnvPCUZBq14ON7j/cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736415152; x=1737019952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdSoGM0IN0Zxqh7qDqdJr7Z4o4Vwb6jb+542zPpHAYI=;
        b=J8n6+t9dkObJyF1xHk2NfUbHFZj5pJLxmhoKuZGZueuPNfkXHDPxjsJAusstMumU1e
         oVYIOkDUlBY68GA3qEZ1bFaUab04FkTu8po2KBIbIdG518bPNJ6KqCzll2OQAs2vX8Z0
         hBsJk9eKO5eh/uKAKvA4Uwslv0IebSvD95yDfVAkI9d+7hXRroHti34HYsOHfdPyx4+U
         UgiscmZ6/VcNSaIqJ0oNBB1Ioj0Y6j7gcziSCNws72znMj6mZVrTc5l5j7C+QnvbOHFm
         VCSkqDkfkM/9zuz+MmnbzCm0fn/JVD2IN9kFGDdRJAKvFRwjR3mQJFy5B6rqwCv8HpZI
         mwUw==
X-Forwarded-Encrypted: i=1; AJvYcCXvJluzV3u/0Szpi9yo5mahEMI8Dy1P3YkpL1Kf9zC03W6EpuqaK7QPvqfHKM83yqWkmjZabwwzTx/y3V7VEs8a@lists.infradead.org
X-Gm-Message-State: AOJu0YzZJIbueKUKsNT+0ehxBVc5ou0thIKfux4OQtFmHt1NvzQ35eCE
	ZaYkuQnG9HCrrwzxuKqlVqXXRZarESN1EbGaAvySHGJ15/79NotczMHkMlsrvow=
X-Gm-Gg: ASbGnctpvskWjOmCBHXb4maqf/wH6sLTjxodQTU+PSPJeAhQ5V44h1kXCEyqNqeZiED
	5FII4MIFNDvAbRu2GZEMQRZmI+M59BukZ3jjr0sjnKNe4eei56XSk6FLagIgsGnXrctfU2v3fST
	sks3XCBBky7YHysuQlpZdfor/+L+Zp8a0vPHDg1soTLqEyJmJro0oOSrz9a+aZZckd2FztuoJRD
	dWxV36aB1gX9oVzERKILnkKq6KnMmmmfPAmFhbYyvkLrEr17TB0MQKb2phihRMyLg1dWt88tdci
	BJHjsMm5rqgmDqd0G96aIhiuy5xZoifNAfE1Yul5NeVOxLKTP9b2PJOxAFscZroJ70D4K1XEpHc
	YUzzl64vw+2Xc0mVS
X-Google-Smtp-Source: AGHT+IG6EVqO91UjbtoUelxcOZNCcrgW27kDqPVuoYWnpsd+PlHziHUYVSflHCF+xbYHxYClj+IZyg==
X-Received: by 2002:a05:6000:4011:b0:386:3d27:b4f0 with SMTP id ffacd0b85a97d-38a8b0d324bmr1808176f8f.14.1736415152547;
        Thu, 09 Jan 2025 01:32:32 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1bebsm1274803f8f.95.2025.01.09.01.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:32:32 -0800 (PST)
Message-ID: <efe370b6-09ed-46b7-a40d-dacc03d853cf@smile.fr>
Date: Thu, 9 Jan 2025 10:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
To: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Davis <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, kristo@kernel.org, vigneshr@ti.com,
 Romain Naour <romain.naour@skf.com>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
 <20250103212528.enq4ur5afxhwzh7n@outdoors> <7hr05eb5st.fsf@baylibre.com>
 <20250108131139.dygei6ejamh5zaij@segment>
 <1251db38-5009-4e93-9603-3ae02f276e5b@ti.com>
 <ikfjvrqi7jbqmeyjejuhpe4iw7uzaqeuqc3ijf4t6wjqgvextt@j4w5cift7ev3>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ikfjvrqi7jbqmeyjejuhpe4iw7uzaqeuqc3ijf4t6wjqgvextt@j4w5cift7ev3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_013236_000579_C9DF7037 
X-CRM114-Status: GOOD (  18.07  )
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

Hello Andrew, Siddharth, All,

Le 08/01/2025 à 16:46, Siddharth Vadapalli a écrit :
> On Wed, Jan 08, 2025 at 09:09:37AM -0600, Andrew Davis wrote:
> 
> Hello Andrew,
> 
>> On 1/8/25 7:11 AM, Nishanth Menon wrote:
>>> On 14:46-20250107, Kevin Hilman wrote:
>>>> Nishanth Menon <nm@ti.com> writes:
>>>>
>>>>> On 15:07-20241205, Kevin Hilman wrote:
>>>>>>
>>>>>> On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
>>>>>>> The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
>>>>>>> SoC are used to drive the reference clock to the PCIe Endpoint device via
>>>>>>> the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
>>>>>>> obtain the regmap for the ACSPCIE_CTRL register within the System
>>>>>>> Controller device-tree node in order to enable the PAD IO Buffers.
>>>>>>>
>>>>>>> The Technical Reference Manual for J721e SoC with details of the
>>>>>>> ASCPCIE_CTRL registers is available at:
>>>>>>> https://www.ti.com/lit/zip/spruil1
>>>>>>>
>>>>>>> [...]
>>>>>>
>>>>>> Applied, thanks!
>>>>>>
>>>>>> [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
>>>>>>        commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
>>>>>> [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
>>>>>>        commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
>>>>>>
>>>>>> Best regards,
>>>>>> -- 
>>>>>> Kevin Hilman <khilman@baylibre.com>
>>>>>>
>>>>> This will need a bit of fixup - See along the lines of the following.
>>>>> Additionally, we should be a bit careful about the dependency of dts
>>>>> mix up from two trees.
>>>>
>>>> sorry, these should be going through your tree in the first place.  They
>>>> are now dropped from my tree, please go ahead and take them along with
>>>> Andrews fixup.  Sorry for complicating things.
>>>
>>>
>>> Romain,
>>>
>>> There is additional fixups needed, unfortunately as well: syscon yaml
>>> has two lists based on which dt-schema version you use.. your patch
>>> fixed one list, but missed the other as well. Could you integrate the
>>> fixes and resubmit, please?
>>>
>>>
>>
>> Or since we already have 'ti,j784s4-acspcie-proxy-ctrl' for the same
>> reason, you could drop the first patch and re-use this compatible.
> 
> I had suggested this in the past since the ACSPCIE IP on J784S4 and J721E
> is the same, but Krzysztof insists that there will be hardware differences
> in the ACSPCIE block across J784S4 and J721E irrespective of what the
> datasheet says, as mentioned by Krzysztof at:
> https://lore.kernel.org/r/1bfdf1f1-7542-4149-a85d-2ac4b659b26b@kernel.org/
> Therefore Romain had to introduce a new compatible for J721E.

There is a pending patch series from Andrew [1] fixing
ti,j784s4-acspcie-proxy-ctrl compatible for the same reason.

Should I take it into account before resubmit?

[1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/

Best regards,
Romain


> 
> Regards,
> Siddharth.


