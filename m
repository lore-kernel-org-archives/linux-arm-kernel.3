Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA26C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsHTkn0UEejY0NKbuUQmD06tWs6IR3e3B3FlamRDu0Q=; b=ryjDkKXe6Jdcovq+3tE9GnRBmC
	PWENj/Faks75Y8MF0HdBxORlUNODK3cXFi0anPaII2ZzDH92BJv6IjphiakjgpYKAVcHWvl8hQ62u
	fD+OL/fF4yGm+k5VtLbSxN9SQA1w1a/7WclrAetdVtl9uNtsVsx/Fan62enSRlt6SypoDvBF7NfvM
	i83LRyBxg+iaIAKPKtxOJkrhCWM3QWklU6QU5o/ap+4eFBEqmOby5jxFuCClBgEkcIvnNnvQTkyXz
	j/jG/pK/SSItx/iiUHGXSxsPJQEnOxsb8uS4PJbtQbqLQIrXTl1oCXtAx0dEIRp8xbQz/VJmDZ+sQ
	YGwXjIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOKa-000000063Ro-3lRy;
	Mon, 13 Jan 2025 17:34:28 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOJL-000000063LO-2GLv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 17:33:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21669fd5c7cso82070995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736789590; x=1737394390; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JsHTkn0UEejY0NKbuUQmD06tWs6IR3e3B3FlamRDu0Q=;
        b=E2DJKhK9Xl0GAOcfOx1adYgGYqUsz1DT+AQf/1ErERJpIqUP9z2AjeHoVIu0Uh6EKS
         TEHQCXCvOmtsUZ7fsu+FTo9q/yEN6umqK25e77R+0EsayuoLShZEfVCKNoNQFwuvJ+Pb
         20VWv0zty341gMlNwN+4EdLvFLi0oOuI9Wv+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736789590; x=1737394390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsHTkn0UEejY0NKbuUQmD06tWs6IR3e3B3FlamRDu0Q=;
        b=bX5isgytGaiw/OZYt9aoxaWX6gsAjjtM20RfnNx0fNIYz42qJwNPRrR7YbZdurzzJG
         0NpfmdCGHNbPjlFHGcslXVnEo+IT/I6lYXJIvBniUsRl0D86hhG/d9n7B81YsaH7+42F
         LHzMo1RYv5rsll3DYtE32ixdf1vKOZYnETjohxfXAHWdhHn+7uPr4EDtzp13xaR1B+oI
         NcjxTrmiSw0EFaaUdjajJQ2U06lJZliev0YCkNhrvDA8dHy+yrNsZx4hgCec2jFfstWS
         1PA9kxsx5dDX94HrJsbqKCjYCcyITKaMkkFXCKHpgnOGm6hJ+7qcFqBxTwsYtpHJNP+a
         KexQ==
X-Gm-Message-State: AOJu0YyxeVhOVL8ivNG8AFbrz7tVn1vdtHEhAZEnpm3rP7Ayr2gy+q+t
	aCAE7PJfnjA8/RXXOcbfmVYWA3uWvBX4SPg8DAxauAet5nYelcKbgw5S12gOQg==
X-Gm-Gg: ASbGncscdi3wst58E5N3UPv5DFlwO2ZuEh/6Kq6FTaiP89pRRtJLP6BZNXKxjzpwwc4
	VnWp95u7mohur3xuWMNGsadgQ2xr/apqQc8lG6b3Z3N3umVZ1IGhglHgznWMCrv7YIzBbSLBgUt
	Rj8jtu+aWOJnEU6/jy4zvlM6NKIY5sPzd5IkDnELSXyLfsPBOs5UMMY9muyFWKG6Fv3rKB8I/bX
	SXaQyKNTqNZrIQX0+BHFQhMb/qPNs4oZtua9vc+P2NfYjl2aPfSzQ7H5DGj/4ZkuJLkoDNg/SVS
	j8IU6hCYe0Xy5YhDj/08GojXbf8lI8g=
X-Google-Smtp-Source: AGHT+IGEtpFio/VZYQKRI3mqtgami6WdXlPv0aTekaxc7wyL2kYN8GhDHCTJXSQ84LlfMNYYrzoO4Q==
X-Received: by 2002:a17:902:e74d:b0:216:3e9a:89e with SMTP id d9443c01a7336-21a83fde4f2mr335899785ad.35.1736789590489;
        Mon, 13 Jan 2025 09:33:10 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22cabdsm56241225ad.183.2025.01.13.09.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 09:33:09 -0800 (PST)
Message-ID: <55d3c151-ae5e-4b02-8ac0-987b89b1d731@broadcom.com>
Date: Mon, 13 Jan 2025 09:33:09 -0800
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
 <0058c37b-9e7c-4af8-b7c0-c48b5b046d6a@broadcom.com>
 <1357f0ff-3493-491b-b06f-976c16a81681@kernel.org>
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
In-Reply-To: <1357f0ff-3493-491b-b06f-976c16a81681@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_093311_677846_9948EB65 
X-CRM114-Status: GOOD (  30.49  )
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



On 12/26/2024 10:58 PM, Krzysztof Kozlowski wrote:
> On 26/12/2024 19:50, Florian Fainelli wrote:
>>
>>
>> On 12/21/2024 12:04 PM, Krzysztof Kozlowski wrote:
>>> On 20/12/2024 00:43, Florian Fainelli wrote:
>>>> On 12/19/24 00:58, Krzysztof Kozlowski wrote:
>>>>> On Wed, Dec 18, 2024 at 09:15:08AM -0800, Florian Fainelli wrote:
>>>>>> On 12/18/24 03:37, Krzysztof Kozlowski wrote:
>>>>>>> On Tue, Dec 17, 2024 at 11:44:38AM -0800, Florian Fainelli wrote:
>>>>>>>> Document the revision c.1.5 compatible string that is present on newer
>>>>>>>> Broadcom STB memory controllers (74165 and onwards).
>>>>>>>>
>>>>>>>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>>>>>> ---
>>>>>>>>      .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml       | 1 +
>>>>>>>>      1 file changed, 1 insertion(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>>>> index 4b072c879b02..99d79ccd1036 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
>>>>>>>> @@ -29,6 +29,7 @@ properties:
>>>>>>>>                - brcm,brcmstb-memc-ddr-rev-c.1.2
>>>>>>>>                - brcm,brcmstb-memc-ddr-rev-c.1.3
>>>>>>>>                - brcm,brcmstb-memc-ddr-rev-c.1.4
>>>>>>>> +          - brcm,brcmstb-memc-ddr-rev-c.1.5
>>>>>>>
>>>>>>> You should use v2.1 fallback and drop driver patch. Or explain in
>>>>>>> commit briefly why different approach is suitable.
>>>>>>
>>>>>> Are you suggesting that we should have fallback compatible strings, such
>>>>>> that we have something like this:
>>>>>>
>>>>>> compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5",
>>>>>> "brcm,brcmstb-memc-ddr-rev-c", "brcm,brcmstb-memc-ddr"
>>>>>>
>>>>>> and the driver only needs to match on "brcm,brcmstb-memc-ddr-rev-c" and
>>>>>> apply the adequate register offset table?
>>>>>
>>>>> Almost, fallback should be brcm,brcmstb-memc-ddr-rev-b.2.1 or whatever
>>>>> was in the driver first or whatever is the oldest known common
>>>>> interface.
>>>>>
>>>>> brcm,brcmstb-memc-ddr-rev-c is not a specific compatible.
>>>>>
>>>>>> If so, that is not how the current binding, and therefore DTBs are being
>>>>>> deployed, so that will introduce a breakage until we update all DTBs in the
>>>>>> field...
>>>>>
>>>>> No. First, I thought about new comaptible so the one you add here. No
>>>>> breakage, it's new compatible. This saves you these pointless updates of
>>>>> driver everytime you add new compatible.
>>>>
>>>> Yes, but that is not how the binding has been defined until now, so all
>>>> of the DTBs out there have:
>>>>
>>>> compatible = "brcm,brcmstb-memc-ddr-rev-b.2.x", "brcm,brcmstb-memc-ddr"
>>>
>>> I don't understand the problem. We talk about new devices here, it does
>>> not matter what existing/old devices have in binding in that matter.
>>
>> It does matter, because the DTBs that contain this compatible string are
>> already in the field, we cannot retrofit them overnight with an
>> additional compatible string in order to provide a fallback. Because
> 
> Then they run downstream and it does not matter whether you change here
> something or not. And anyway downstream choices do not shape choices
> here. We never accept bindings just because downstream already shipped
> something.

Fair enough, but it does matter anyway, because as you can see from the 
original binding that you accepted [1] we have a precedent for having 
compatible strings of the form:

compatible = "brcm,brcmstb-memc-ddr-rev-c.1.x"

with each possible value of X being documented, this is just adding 
another way, and surprise, keeps things consistent.

Why did not you reject the original binding back then? Why the change of 
heart now?

All of this feels from my side very very arbitrary, and as such it is 
difficult to document for other people and build a correct mental model of.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml?id=fa0321ba51ddff78ebe3c7c945830a85c987e3ed

> 
>> this is submitted now does not mean it is a new device, this was part of
>> my backlog to get submitted earlier on.
> 
> Well, that's great yet is not an argument in the bindings.
 > >>
>>>
>>>>
>>>> (where X is in range [1..5])
>>>>
>>>> and there is no fallback defined to "brcm,brcmstb-memc-ddr-rev-b.2.1",
>>>> so it is not like we can retrofit that easily by adding one now.
>>>>
>>>>    > > Second, you can introduce fallbacks to older compatibles as well -
>>>> there
>>>>> will be no breakage, because you add one more compatible. The old
>>>>> compatibles (covered by fallback) of course stays in the driver, so
>>>>> there is no breakage at all. We did it multiple times for several
>>>>> different bindings in Qualcomm. People were doing exactly the same:
>>>>> adding compatible for new device to binding and driver, without
>>>>> considering the compatibility at all.
>>>>>
>>>>> Except being logically correct choice - using fallbacks - this really
>>>>> has huge benefits when later upstreaming complete, big SoCs, like we do
>>>>> for latest Qualcomm SoCs: several changes will be only bindings updates.
>>>>
>>>> Yes, there are advantages to using fallbacks and we (ab)use that
>>>> whenever practical.
>>>>
>>>> The driver only uses a very limited subset of registers (for now), the
>>>> registers change between minor revisions as well in a way that using a
>>>> fallback like "brcm,brcmstb-memc-ddr-rev-b.2.1" is not accurate enough
>>>> not practical. In particular for some of the changes that I am thinking
>>>> of adding later on, we would need the precise minor version because the
>>>> behavior and/or register interface is subtly different that this matters.
>>>
>>> Devices work fine now with the same driver data, so they are compatible.
>>
>> For now they do, but not for other features that will be submitted
>> later, they will not be, and at that point we will need to know that
>> this is a rev C.1.5 controller versus say a rev C.1.4 controller.
> 
> Which is exactly what compatibility is for.

Are you saying that the compatible strings must now all be updated to be 
of the form:

compatible = "brcm,brcmstb-memc-ddr-rev-c.1.5", 
"brcm,brcmstb-memc-ddr-rev-c.1.x", "brcm,brcmstb-memc-ddr"

or something different?
-- 
Florian


