Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE1CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1537w57wc8RfBOM5o0Xpt3mF8+Bqf0lG5WYmAS6oqRM=; b=zxAQzyLqAPVe7MTfVshF+P3GEX
	rAsLYWxgF4r+0U3kmdhpu0/2f5f6R4t4sBl8apZDu8X0vAed6uC8UBKpg+6hvMhsqaZm3X6i45Y+1
	ONTi2WPCKd/PDJ7u5cKBEamZTfoeVzgSa0YN20BECEgJCPjwEAZPe+Ifhi0KPxtVxoMqwmqvS96Rm
	7YCdqIRhmMZPibj7LU132bxNk6ElfqjGJSqMV65FLCLbKxg5QAnEFKNlYrN0XckFwGdO/OvR4lI6g
	z6oZcMLUX6uUCX0BsTmSyYymgyLoi7287ax7w4JeDMFpoSWMhqZ5e6si+5ihKqXVgbzv4njg1TJoi
	xpHHFdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwjT-0000000CkOJ-02Cl;
	Fri, 14 Nov 2025 16:33:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwjR-0000000CkO6-3OTP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1537w57wc8RfBOM5o0Xpt3mF8+Bqf0lG5WYmAS6oqRM=; b=E1U9xS/luNVi/sVFN+730wHIUW
	f4LbEutrirKgCIn4u3jEz4MFzvvJQkfpqOl6LfImqMjHVS0kaSsmREk3gzCi+Wc/xSUflh/Z4HB28
	EG4GE/7I5AB/4afNo+brU+SneFbALWk9Kedbtilm4zIJkPzEqJxGxNFtpQut9JZEIGfMRs+5jot1f
	a8Akc28yblwzgFt23/ViYGMqK/vXTDb23W9nK4brlF6uTPchVtPK7d33Bc3zuXAETUuj6f20ApmkW
	Lg4YqWbffKawdqMh9uLMsO4ID1e1LmZkzVC+1uLRGBpsPCT6Ktz/g5lW3FGg1hfTLMZL1xYQNWeph
	K60v29nA==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvrj-00000002zgy-1gNu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763137978; bh=bf0pIEsi5Ze4Ewu72bp30eGErg5IlXD0tlNNo6JLWB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PG73crPueBHj1zRKa8VzXt3JKoUTpWxaF1KTpokvaIMSItnSXKbbT9fc7IQdB+Dk7
	 FQ/n2RKODlqbT1C1Rr2vBEVWe6LBW3DesZrxIhyWYZ8thxG+D8YGxU7MUpKXzoZGJp
	 VClnOzA0pwspGoMAnGyqXS7J8ILZUMdcfOOFqO/sOom9jaEog4enVBail6xVE8ankv
	 D2pCfDYO067CdOqc7JJZYaXo+W5xgfrzJODTYFPSlUEb50gVDSJICsZOUMtiL54MGD
	 IsTNBQN0kZO1vo7qIzF2l9pRuCR3nDIQ2l7I0/PUSFe/1if7rADDpHkFCuxz9soGOP
	 xapk4l/dEfC0A==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id CCE033E1525;
	Fri, 14 Nov 2025 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763137978; bh=bf0pIEsi5Ze4Ewu72bp30eGErg5IlXD0tlNNo6JLWB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PG73crPueBHj1zRKa8VzXt3JKoUTpWxaF1KTpokvaIMSItnSXKbbT9fc7IQdB+Dk7
	 FQ/n2RKODlqbT1C1Rr2vBEVWe6LBW3DesZrxIhyWYZ8thxG+D8YGxU7MUpKXzoZGJp
	 VClnOzA0pwspGoMAnGyqXS7J8ILZUMdcfOOFqO/sOom9jaEog4enVBail6xVE8ankv
	 D2pCfDYO067CdOqc7JJZYaXo+W5xgfrzJODTYFPSlUEb50gVDSJICsZOUMtiL54MGD
	 IsTNBQN0kZO1vo7qIzF2l9pRuCR3nDIQ2l7I0/PUSFe/1if7rADDpHkFCuxz9soGOP
	 xapk4l/dEfC0A==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 450B43E0CE9;
	Fri, 14 Nov 2025 16:32:58 +0000 (UTC)
Message-ID: <646d17c0-7151-4a61-80c0-c336acdf0abd@mleia.com>
Date: Fri, 14 Nov 2025 18:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ARM: dts: lpc3250-phy3250: add at25 required
 properties
To: Frank Li <Frank.li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <20251029202801.3963952-4-Frank.Li@nxp.com>
 <4bf7223e-1611-4149-a4d6-9a3ac103e264@mleia.com>
 <aRdVY5aMCjj4fmDB@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aRdVY5aMCjj4fmDB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251114_163258_858394_49509EF0 
X-CRM114-Status: GOOD (  20.32  )
/bin/ln: failed to access 'reaver_cache/texts/20251114_163258_858394_49509EF0': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_163258_858394_49509EF0 
X-CRM114-Status: GOOD (  21.31  )
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

Hi Frank.

On 11/14/25 18:14, Frank Li wrote:
> On Fri, Nov 14, 2025 at 01:47:48AM +0200, Vladimir Zapolskiy wrote:
>> Hi Frank.
>>
>> On 10/29/25 22:28, Frank Li wrote:
>>> Add at25 required properties (size, address-width and pagesize), which
>>> duplicate deprecated properties.
>>>
>>> Change nodename 'at25' to 'eeprom'.
>>>
>>> Fix below CHECK_DTB warning:
>>>     arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
>>>     arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> index 21a6d0bca1e8a..15463a96938cc 100644
>>> --- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> +++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
>>> @@ -200,7 +200,7 @@ &ssp0 {
>>>    	cs-gpios = <&gpio 3 5 0>;
>>>    	status = "okay";
>>> -	eeprom: at25@0 {
>>> +	eeprom: eeprom@0 {
>>>    		compatible = "atmel,at25";
>>>    		reg = <0>;
>>>    		spi-max-frequency = <5000000>;
>>> @@ -216,6 +216,10 @@ eeprom: at25@0 {
>>>    		at25,byte-len = <0x8000>;
>>>    		at25,addr-mode = <2>;
>>>    		at25,page-size = <64>;
>>> +
>>> +		size = <0x8000>;
>>> +		address-width = <16>;
>>> +		pagesize = <64>;
>>
>> Is there any need to have both sets of properties?
>>
> 
> Generally, keep old one just for back compatible. It is quite common for
> this case.
> 
> I am NOT sure if it is safe enough to remove deprecated properties now.
> 

It should be safe to remove the deprecated properties, it is fine.

This way the backward compatibility is preserved, and while the forward
compatibility is not preserved, it is not supposed to be preserved anyway.

>> I'd suggest to remove the deprecated set in a separate patch, note
>> that your done change is not described in the commit message.
> 
> Which part is not described?
> 

Sorry for it, I reread the commit message, and both changes are mentined,
but please split heterogeneous changes into separate patches.

-- 
Best wishes,
Vladimir

