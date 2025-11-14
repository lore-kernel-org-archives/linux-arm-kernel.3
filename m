Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF483CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PlB3KmE9s2TzaIwebI2EaFl/1dycLcsS0TOwDQWm5A=; b=LRVp3xYxRUI+cbJWUCugjYsHO/
	bjuLXemIBXk+9pxZ7xivWzIkJMcyQLp3Q83x+pmpowlQD7KRjRMPu5PYt6+rcugixP5PoD4b8LOkT
	ihIkHHoon/d3WkFS42Ez2UTJpO0NI+8KJFyNCtdKiNLAppHXj1HzGUA+it/9X1FMCrZzQEF1yLtXb
	twd50h/QEX1cbEtR7ZHcFCz4dhf6aqEyats1xs6vFVnkfIGV8DnbCQ0YbAOdXtkQksr1aYSXMi4iD
	/zOKJdy0hSOj0rl9+z/RyzuDMLt0sC16PjWGgIhQgQ/fQcMm7FjsE0xAZ63BidOtes+rz4bMKEYxW
	IynBt9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwu8-0000000Cl6I-1k4L;
	Fri, 14 Nov 2025 16:44:08 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwu6-0000000Cl5H-04Ys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763138644; bh=amx1Z+RrD4CwZ1rF6kcX9RLp5bCo6GnsqSibeDGvxyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jr6lUwqtdr04b1l1ZEG72BDuCoatMDSU4HJBDfQSnzXgD43UAD7Yya8jLAOHFM3pz
	 LK+Ox5L6zQoko/4ZvLV5i4Z+4Wyd03by68F2Ftrd/PUFTz4cLrtR0Uh3YFQ4wy9nUL
	 JODrdFz9ms4H8d8kzf2o8jrHfA4D+PjWNIxxPvKvkUTOsse4SAann7ST4O5aonw/jO
	 udYtZHr4LLYpCz1UK0kTSAeFlaqJm2TXsGJyxzn2goTbucnSPvvCquQfc/6ErV0hBd
	 j0oSj65KXxFCQBVFYAHwKbapDHIIScULCidB2h1CKoawRyUpOrkVctlQXW8G2OpcRx
	 igzZpM9O9PMuw==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 2AD5C3E1525;
	Fri, 14 Nov 2025 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1763138644; bh=amx1Z+RrD4CwZ1rF6kcX9RLp5bCo6GnsqSibeDGvxyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jr6lUwqtdr04b1l1ZEG72BDuCoatMDSU4HJBDfQSnzXgD43UAD7Yya8jLAOHFM3pz
	 LK+Ox5L6zQoko/4ZvLV5i4Z+4Wyd03by68F2Ftrd/PUFTz4cLrtR0Uh3YFQ4wy9nUL
	 JODrdFz9ms4H8d8kzf2o8jrHfA4D+PjWNIxxPvKvkUTOsse4SAann7ST4O5aonw/jO
	 udYtZHr4LLYpCz1UK0kTSAeFlaqJm2TXsGJyxzn2goTbucnSPvvCquQfc/6ErV0hBd
	 j0oSj65KXxFCQBVFYAHwKbapDHIIScULCidB2h1CKoawRyUpOrkVctlQXW8G2OpcRx
	 igzZpM9O9PMuw==
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 9629B3E0CE9;
	Fri, 14 Nov 2025 16:44:03 +0000 (UTC)
Message-ID: <03494fa4-26e6-4691-8fa6-5bd99c2c25a1@mleia.com>
Date: Fri, 14 Nov 2025 18:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: lpc32xx: add bus surfix for simple-bus
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <af66cc8a-051a-4512-9a02-468b17550775@mleia.com>
 <aRdWoQ/vPplF0aQA@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <aRdWoQ/vPplF0aQA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251114_164404_195024_621ABE18 
X-CRM114-Status: GOOD (  17.26  )
/bin/ln: failed to access 'reaver_cache/texts/20251114_164404_195024_621ABE18': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_164404_195024_621ABE18 
X-CRM114-Status: GOOD (  17.43  )
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

On 11/14/25 18:19, Frank Li wrote:
> On Fri, Nov 14, 2025 at 01:55:50AM +0200, Vladimir Zapolskiy wrote:
>> Hi Frank.
>>
>> On 10/29/25 22:27, Frank Li wrote:
>>> add bus surfix for simple-bus to fix below CHECK_DTBS warnings:
>>
>> typo in the subject and in the commit message above, s/surfix/suffix/
>>
>>> arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
>>>           from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>    arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>>> index 2236901a00313..9790b0a1d6537 100644
>>> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>>> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
>>> @@ -86,7 +86,7 @@ dma: dma-controller@31000000 {
>>>    			#dma-cells = <2>;
>>>    		};
>>> -		usb {
>>> +		usb-bus {
>>
>> Device nodes under "usb" should be just elevated, the "simple-bus" here
>> was used only to group some controllers together.
>>
>>>    			#address-cells = <1>;
>>>    			#size-cells = <1>;
>>>    			compatible = "simple-bus";
>>> @@ -307,14 +307,14 @@ mpwm: pwm@400e8000 {
>>>    			};
>>>    		};
>>> -		fab {
>>> +		fab-bus {
>>
>> FAB shall find its place in the AXI/AHB/APB/... list, isn't it?
> 
> what's FAB means? It is too short and hard to find exact information
> from google?

You may find UM10326 "LPC32x0 and LPC32x0/01 User manual" document online,
LPC32xx is an old and simple SoC.

FAB stands for Fast Access Bus, it's a bus behind AHB to FAB bridge, you
may get an overview from "Fig 3. LPC32x0 block diagram, AHB matrix view",
and "Table 4. Peripheral devices on the LPC32x0" lists all FAB peripherals.

So, FAB is very similar to APB functionally, could it be just another
name of APB?.. Likely we won't know for sure.

I'd suggest to send a change, which adds "fab" to the list of permitted
device tree node names with a "simple-bus" compatible. Or let me know,
and I'll do it myself whenever I find a minute for it...

>>>    			#address-cells = <1>;
>>>    			#size-cells = <1>;
>>>    			compatible = "simple-bus";
>>>    			ranges = <0x20000000 0x20000000 0x30000000>;
>>>    			/* System Control Block */
>>> -			scb {
>>> +			scb-bus {
>>>    				compatible = "simple-bus";
>>>    				ranges = <0x0 0x40004000 0x00001000>;
>>>    				#address-cells = <1>;
>>
>> Here "simple-bus" is also unjustified...

-- 
Best wishes,
Vladimir


