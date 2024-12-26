Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93565E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgbeCGA/OAuOWqynnOKOiTZv72XM05FeDjvUwkle+W4=; b=vT9Nn/oyaFCQJ07CbjIaRSZ/iU
	uq49YfLEhsLiKk1YXczoHgOnY/FxJk1V/gdTFVSNOk9hokrJGxyXx9XzlFXpUe45U33J3uh/TPDN2
	Z/ByhhYeGh94QM0Q8UXurvNlx7NyWKN4ktiG7s9G+Er3Rp2Y19R7wbjdVzRhugtkEs7ekBo/ZnPJU
	P37SQuma7y2l7riDEx03lOkLg8bjVaWh+7aOpLWpV+EJx/kOV2Fg/Xq+lkQAhX7uV8ls6/H8z9uMw
	RVxvbE6HWvY55gEUMf0lIXi0+htPD592Y+GYMXIf/YQ402ULywvAO8wsEOjROOCwvrH7DkyVl8k7q
	tNuq+BqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQsxm-0000000GFOC-1Uc7;
	Thu, 26 Dec 2024 18:52:02 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQswZ-0000000GFIN-46nu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 18:50:49 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6dcc42b5e30so78739796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 10:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1735239046; x=1735843846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PgbeCGA/OAuOWqynnOKOiTZv72XM05FeDjvUwkle+W4=;
        b=DZ5w96zno53d3TWzPQdsI1px1RHKt6YLo9R6uh4/XCHKqGBaIssRHRrXOcXeFugGs4
         CWJYol+WpveGGp8Di9hqMBR4nXeQ55jGwAwTuHBoiP9Dx80pRCz2AUJg4aDHP07vR0J/
         bOnkYcysmjv4erdo6q5xubltZsqV6fZ0ohmVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735239046; x=1735843846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgbeCGA/OAuOWqynnOKOiTZv72XM05FeDjvUwkle+W4=;
        b=BweNhYkIaR6ASyQC78tcWKfE+vkhq7LivIdJjZpQ1xwUF6Cy4ybe/o/lDjCPHU44G+
         nRkaMFZ8oDGKvsxCoP2G0vrn0U4Loz+5UQvl9LQO2+wIvmNi+I2EopHNsXOn06W8OSk6
         IKDdjjXgTIe+U14LQ4Y9pPb6k2No0CyNmFUrm2IPCdrzqZ2clFj95cnHSfwUyfdbvDY1
         G5pQgCMgb/hv6aS6+QpCbZt49W3/+XlemBTyKIGmDqs8kKg8OjFPoSZs/kWLdXxTvOu7
         IkNlAszISCY9coLx5GsxFGPdbWFNFsvX/7NWbXYIXS42R07xHvDHmLdbG6NoYj04wSQU
         TtBg==
X-Gm-Message-State: AOJu0Yzei1MBZF4vetdiMyd1J/lKo/p5PAoqoiWfgFF/4Q3YvACBg4pS
	jZyH+8TskRtFDC3HPipOeZEeK0FD/YXPWCJrPK0VYsMJf0Jq1WFqSXLw+ca0gQ==
X-Gm-Gg: ASbGnct5w8Gao8P3Z7QPxY7RDRjevvGhLVXe4RBncJDNNpA5E5/rfp0Lqr8KA8C7DmZ
	yMvs5jEUlvzRs01sJBd6tVlvLWuhUsNN7dfbi+zZfDMow1CSIucoGSR77eNyl/VpZh+FhPrIgoo
	t8uAVpuZxuwHZzt9loNpNXCIYA6NT23hm2HbuzkC9ud4r7dng6N/7msJ/sYYHO9inQ7ezXMstPJ
	rNygYYWJTmImfiMF2mLqIOYJFxQePvIcl+iXpBaGdzMJoMwxnQmtimL2/oVgvGaT6pLX9vJjJyX
	FB6qaAv/ZS7QsAWdKXriBoaC/9yC128=
X-Google-Smtp-Source: AGHT+IG9BYkg4L8UQkXKgGyJYDruYDUVyYnOz4pqlxf+EOjmgn6PmhUTRFAxJHXho1KNKFxCk09PVw==
X-Received: by 2002:a05:6214:5089:b0:6d4:1a6e:d343 with SMTP id 6a1803df08f44-6dd2335d668mr422027556d6.23.1735239045685;
        Thu, 26 Dec 2024 10:50:45 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181372easm72255186d6.63.2024.12.26.10.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 10:50:44 -0800 (PST)
Message-ID: <0058c37b-9e7c-4af8-b7c0-c48b5b046d6a@broadcom.com>
Date: Thu, 26 Dec 2024 10:50:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: memory-controller: Document rev c.1.5
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20241217194439.929040-1-florian.fainelli@broadcom.com>
 <20241217194439.929040-2-florian.fainelli@broadcom.com>
 <2e33t7ft5ermsfr7c4ympxrn6l5sqdef3wml4hlbnhdupoouwj@gfjpbmowjadi>
 <93a1333d-442f-4cec-b823-9b1a5ff6dc6b@broadcom.com>
 <wxq5zzfh5jesucbbste2j6x2jtj45wjfc5xzjkqbqqta7cprda@oaf5arr3z6pt>
 <f906a056-3c6b-4115-9fd0-e50da8fc049b@broadcom.com>
 <a92ff542-6534-4e2e-bef9-6f10c8362d86@kernel.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <a92ff542-6534-4e2e-bef9-6f10c8362d86@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_105048_173482_C4960042 
X-CRM114-Status: GOOD (  32.29  )
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



On 12/21/2024 12:04 PM, Krzysztof Kozlowski wrote:
> On 20/12/2024 00:43, Florian Fainelli wrote:
>> On 12/19/24 00:58, Krzysztof Kozlowski wrote:
>>> On Wed, Dec 18, 2024 at 09:15:08AM -0800, Florian Fainelli wrote:
>>>> On 12/18/24 03:37, Krzysztof Kozlowski wrote:
>>>>> On Tue, Dec 17, 2024 at 11:44:38AM -0800, Florian Fainelli wrote:
>>>>>> Document the revision c.1.5 compatible string that is present on newer
>>>>>> Broadcom STB memory controllers (74165 and onwards).
>>>>>>
>>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>>>> ---
>>>>>>     .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
>>>>>>     1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>> index 4b072c879b02..99d79ccd1036 100644
>>>>>> --- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>> @@ -29,6 +29,7 @@ properties:
>>>>>>               - brcm,brcmstb-memc-ddr-rev-c.1.2
>>>>>>               - brcm,brcmstb-memc-ddr-rev-c.1.3
>>>>>>               - brcm,brcmstb-memc-ddr-rev-c.1.4
>>>>>> +          - brcm,brcmstb-memc-ddr-rev-c.1.5
>>>>>
>>>>> You should use v2.1 fallback and drop driver patch. Or explain in
>>>>> commit briefly why different approach is suitable.
>>>>
>>>> Are you suggesting that we should have fallback compatible strings, such
>>>> that we have something like this:
>>>>
>>>> compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5",
>>>> "brcm,brcmstb-memc-ddr-rev-c", "brcm,brcmstb-memc-ddr"
>>>>
>>>> and the driver only needs to match on "brcm,brcmstb-memc-ddr-rev-c" and
>>>> apply the adequate register offset table?
>>>
>>> Almost, fallback should be brcm,brcmstb-memc-ddr-rev-b.2.1 or whatever
>>> was in the driver first or whatever is the oldest known common
>>> interface.
>>>
>>> brcm,brcmstb-memc-ddr-rev-c is not a specific compatible.
>>>
>>>> If so, that is not how the current binding, and therefore DTBs are being
>>>> deployed, so that will introduce a breakage until we update all DTBs in the
>>>> field...
>>>
>>> No. First, I thought about new comaptible so the one you add here. No
>>> breakage, it's new compatible. This saves you these pointless updates of
>>> driver everytime you add new compatible.
>>
>> Yes, but that is not how the binding has been defined until now, so all
>> of the DTBs out there have:
>>
>> compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x", "brcm,brcmstb-memc-ddr"
> 
> I don't understand the problem. We talk about new devices here, it does
> not matter what existing/old devices have in binding in that matter.

It does matter, because the DTBs that contain this compatible string are 
already in the field, we cannot retrofit them overnight with an 
additional compatible string in order to provide a fallback. Because 
this is submitted now does not mean it is a new device, this was part of 
my backlog to get submitted earlier on.

> 
>>
>> (where X is in range [1..5])
>>
>> and there is no fallback defined to "brcm,brcmstb-memc-ddr-rev-b.2.1",
>> so it is not like we can retrofit that easily by adding one now.
>>
>>   > > Second, you can introduce fallbacks to older compatibles as well -
>> there
>>> will be no breakage, because you add one more compatible. The old
>>> compatibles (covered by fallback) of course stays in the driver, so
>>> there is no breakage at all. We did it multiple times for several
>>> different bindings in Qualcomm. People were doing exactly the same:
>>> adding compatible for new device to binding and driver, without
>>> considering the compatibility at all.
>>>
>>> Except being logically correct choice - using fallbacks - this really
>>> has huge benefits when later upstreaming complete, big SoCs, like we do
>>> for latest Qualcomm SoCs: several changes will be only bindings updates.
>>
>> Yes, there are advantages to using fallbacks and we (ab)use that
>> whenever practical.
>>
>> The driver only uses a very limited subset of registers (for now), the
>> registers change between minor revisions as well in a way that using a
>> fallback like "brcm,brcmstb-memc-ddr-rev-b.2.1" is not accurate enough
>> not practical. In particular for some of the changes that I am thinking
>> of adding later on, we would need the precise minor version because the
>> behavior and/or register interface is subtly different that this matters.
> 
> Devices work fine now with the same driver data, so they are compatible.

For now they do, but not for other features that will be submitted 
later, they will not be, and at that point we will need to know that 
this is a rev C.1.5 controller versus say a rev C.1.4 controller.

> Just because you have some differences or new features does not
> invalidate that this is exactly the point for what compatibility was
> created.
> 
> 
> Best regards,
> Krzysztof

-- 
Florian


