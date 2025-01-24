Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134B7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NB2YdltfeIikH6Reme1dCTf12g0RpGszcrsJ1pFSmoY=; b=Qsj6/oSB/yq9dweFlcM/0foZmK
	+U3tDvz5LueJ8WVfJfgeFcUle9Z2UhQ27Nc83B7nVcFGid3sgCMl/9lJZJKbh4AURm6ufO7na2omF
	gjp4d6w4s/uZ0n1BaqjI1wCT7S9i2x0/930GvwTTe9Wyi+PX+hk95mpPGjVVOOUAeiaOCXXfnDSfE
	ZcLhW2w3pbHHZsxbhjLepBAv8ggSz6hSDRc8Tab61Wb4j2lQWm30fnbXUe27VN4f6KFs5HNmBxM01
	sD3xzG8qCTj+31+xXfkIp9Cc8srUZB4Na6eyhzi8P8lFC9BF9zHkalOrtbDTdkTHbpsWAmFAE2FZ8
	XZIRDbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSIj-0000000Fdcx-30hg;
	Fri, 24 Jan 2025 22:37:21 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSHQ-0000000FdYH-2m05
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 22:36:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OMZsgm1456284
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 16:35:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737758154;
	bh=NB2YdltfeIikH6Reme1dCTf12g0RpGszcrsJ1pFSmoY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OBgMS66S3VgCZR7Zp2YoKPH5dFaAe3pRdy5UWlOBDK4HysE73pv0E0/rR0ztP7EOu
	 ek3vYREHBtOnUsv2k81ZTmaSVv/OQ6RxEBS0HebFimpS8vXkp/su7ZSuG/R/Ne+nB+
	 kllNNoHUOesHuZ2CTUGAK7G+YR99iscRJyO3Rbq0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50OMZs6O098443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 16:35:54 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 16:35:53 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 16:35:53 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OMZr9n018949;
	Fri, 24 Jan 2025 16:35:53 -0600
Message-ID: <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
Date: Fri, 24 Jan 2025 16:35:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_143600_806159_49B67A52 
X-CRM114-Status: GOOD (  34.92  )
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

On 1/24/25 10:48 AM, Krzysztof Kozlowski wrote:
> On 24/01/2025 17:05, Markus Schneider-Pargmann wrote:
>> Hi Krzysztof,
>>
>> On Fri, Jan 24, 2025 at 09:22:54AM +0100, Krzysztof Kozlowski wrote:
>>> On Fri, Jan 24, 2025 at 09:19:49AM +0100, Krzysztof Kozlowski wrote:
>>>> On Wed, Jan 22, 2025 at 11:24:33AM +0100, Markus Schneider-Pargmann wrote:
>>>>> Add compatible for ti,am62-ddr-pmctrl to the list. There is a DDR pmctrl
>>>>> register in the wkup-conf register space of am62a and am62p. This
>>>>> register controls DDR power management.
>>>>>
>>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Un-acked, I missed the point that you really speak in commit msg about
>>> register and you really treat one register is a device. I assumed you
>>> only need that register from this device, but no. That obviously is not
>>> what this device is. Device is not a single register among 10000 others.
>>> IOW, You do not have 10000 devices there.
>>
>> Do I understand you correctly that the whole register range of the
>> wkup_conf node as seen in arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
>> should be considered a single syscon device?
> 
> I don't have the datasheets (and not my task to actually check this),
> but you should probably follow datasheet. I assume it describes what is
> the device, more or less.
> 
> I assume entire wkup_conf is considered a device.
> 
>>
>> Unfortunately wkup_conf is modeled as a simple-bus with currently 5
>> subnodes defined of which 4 of them consist of a single register. Most
>> of them are syscon as well. So I think I can't change the simple-bus
>> back to syscon.
> 
> Huh... Maybe TI folks will help us understand why such design was chosen.
> 

Many of the devices inside the wkup_conf are already modeled as such.
Clocks and muxes for instance already have drivers and bindings, this
is nothing new to TI.

If we just use a blank "syscon" over the entire region we would end up
with drivers that use phandles to the top level wkup_conf node and
poke directly the registers they need from that space.

Would you rather have

some-device {
	ti,epwm_tbclk = <&wkup_conf>;
}

or

some-device {
	clocks = <&epwm_tbclk 0>;
}

with that epwm_tbclk being a proper clock node inside wkup_conf?
I would much prefer the second, even though the clock node
only uses a single register. And in the first case, we would need
to have the offset into the wkup_conf space hard-coded in the
driver for each new SoC. Eventually all that data would need to be
put in tables and we end up back to machine board files..

I'm not saying every magic number in all drivers should
be offloaded into DT, but there is a line somewhere between
that and having the DT simply contain the SoC's name compatible
and all other data going into the kernel. That line might be a
personal preference, so my question back is: what is wrong
if we do want "1000 new syscons per each register" for our
SoCs DT?

(and the number is not 1000, scanning the kernel I can see
the largest wkup_conf region node we have today has a grand
total number sub-nodes of 6)

Andrew

>>
>> For the DDR pmctrl, this really only consist of a single register, the
>> registers surrounding this pmctrl are not related as far as I can tell.
> 
> DDR pmctrl does not fit definition of syscon then. Syscon is a
> *collection* of miscellaneous registers. Most likely the entire block is
> that collection and someone decided - oh but I want syscon per each
> register. Awesome. And then what if someone wants two registers, but
> there are spread apart and in the middle is someone else?
> 
> | ddr pmctrl 1 | something else | ddr pmctrl 2 |
> 
> Two syscons?
> 
> And what if you have three registers? What if four? You see where it is
> getting at?
> 
> 
>>
>> What do you suggest how I can solve this?
> 
> I have no clue how the device actually looks like, so tricky to give
> answer, but I could imagine total node rework, calling everything
> syscon+mfd. This would still be backwards compatible.
> 
> Or adding one new block covering remaining parts of the device, so at
> least people stop adding 1000 new syscons per each register, because
> there will be just one.
> 
> Best regards,
> Krzysztof
> 

