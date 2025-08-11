Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EBBC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aywYyzoixAm3Sjd8epTOZToUh9Gg+kyh1HfqY33n5bw=; b=ZdXU+PcUZV60tyHnU36S9wCNjo
	SMMfkEXcFqYNRjoGfv4KyK6Mh05VDSYIPicjnpHQKjxtyHoGb/m7YyxxVrz7Q8mbd/0qm9kJ7hBhW
	gbKNW4wltjKTEV43UEOuWt8NV6SQLs+2SfK8tYsMbUBPsCQiZClXsl35ZdeWAhBZVfIucqiX9igHR
	GMno4Z8UyiEOnRyCtNhuxB18Jw+I+r/Qbn9/vbYXAi1jd6R5h5WPTl+Vh47bbtovgQ1ifapgf9hdX
	bKSVspdlotcBFxbgr1fd2gM8EClX7wBRA/oCmXKi57D3l9TZR3kInPg6sOpGgAsOTXPLVhkFdoznu
	PdaA5a0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSgu-00000007qKH-4Bvl;
	Mon, 11 Aug 2025 13:35:57 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSe6-00000007pda-27an
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:33:06 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BDNkl9025158;
	Mon, 11 Aug 2025 15:32:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aywYyzoixAm3Sjd8epTOZToUh9Gg+kyh1HfqY33n5bw=; b=Zv4kHUCXcILUQIx5
	iF4WiJiPI9HHvmA+T3RoIcBguAuS3C3kJDOPnxHM0kLu4l/+9SwtqS4cV6SWc5UI
	wU25e4iXd6rhFt8jyReReMhjqGC3POpMn3Fsvn19vgxAyo5jU/cF5q6co8GkTBAi
	Y6ZkpKmwjsMMOAufHn1POVfQotIT9MsYheaNWLEwgf03SC9ZweA5EIPWXG57iv43
	4NsH6+qCCE4kbtBLzwSxUc6wYRfBjVsj4PvD9iEtZhEol8L2Nv878LY6uMrUDmjR
	o4uMnnnj6GuP8q+wSo0cNWkJQunTzuuQGx8Gf2Yoq7qBpxK+gD4WWO6kpG+ueWv3
	ajQglg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7g65xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 15:32:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 036A340044;
	Mon, 11 Aug 2025 15:31:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BA2474D375;
	Mon, 11 Aug 2025 15:30:11 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 15:30:10 +0200
Message-ID: <2c497e75-bdb7-45ee-96ba-e293e33db91b@foss.st.com>
Date: Mon, 11 Aug 2025 15:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/9] PCI: stm32: Add PCIe host support for STM32MP25
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <johan+linaro@kernel.org>,
        <cassel@kernel.org>, <shradha.t@samsung.com>,
        <thippeswamy.havalige@amd.com>, <quic_schintav@quicinc.com>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250808164527.GA92564@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250808164527.GA92564@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_063302_822717_903033D6 
X-CRM114-Status: GOOD (  19.63  )
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



On 8/8/25 18:45, Bjorn Helgaas wrote:
> On Fri, Aug 08, 2025 at 04:55:52PM +0200, Christian Bruel wrote:
>> On 8/7/25 20:09, Bjorn Helgaas wrote:
>>> [+to Linus for pinctrl usage question below]
>>>
>>> On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
>>>> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
>>>> controller based on the DesignWare PCIe core.
> 
>>>> +	return pinctrl_pm_select_sleep_state(dev);
>>>
>>> Isn't there some setup required before we can use
>>> pinctrl_select_state(), pinctrl_pm_select_sleep_state(),
>>> pinctrl_pm_select_default_state(), etc?
>>>
>>> I expected something like devm_pinctrl_get() in the .probe() path, but
>>> I don't see anything.  I don't know how pinctrl works, but I don't see
>>> how dev->pins gets set up.
>>
>> Linus knows better, but the dev->pins states are attached to the dev struct
>> before probe by the pinctrl driver
>>
>> /**
>>   * pinctrl_bind_pins() - called by the device core before probe
>>   * @dev: the device that is just about to probe
>>   */
>> int pinctrl_bind_pins(struct device *dev)
> 
> Thanks for the pointer.  Might be worthy of a mention in
> Documentation/driver-api/pin-control.rst.  Maybe pinctrl/consumer.h
> could even have a bread crumb to that effect since drivers use all
> those interfaces that rely in the implicit initialization done before
> their .probe().
> 
> pin-control.rst mentions pinctrl_get_select_default() being called
> just before the driver probe, but that's now unused and it looks like
> pinctrl_bind_pins() does something similar:
> 
>    really_probe
>      pinctrl_bind_pins
>        dev->pins = devm_kzalloc()
>        devm_pinctrl_get
>        pinctrl_lookup_state(PINCTRL_STATE_DEFAULT)
>        pinctrl_lookup_state(PINCTRL_STATE_INIT)
>        pinctrl_select_state(init)      # if present, else default
>      call_driver_probe

Yeah, and state_init is not mentioned in the documentation even for the 
'normal probe'. The only doc I see from the original commit 
ef0eebc05130b0d22b0ea65c0cd014ee16fc89c7

" 

     Let's introudce a new "init" state.  If this is defined we'll set
     pinctrl to this state before probe and then "default" after probe
     (unless the driver explicitly changed states already). 

"

I will propose something in pin-control.rst, with maybe some code-block 
for the pm part and respin [PATCH 0/2] Add pinctrl_pm_select_init_state 
helper function...

Christian

> 
> Bjorn


