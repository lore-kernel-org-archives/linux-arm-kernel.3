Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A501CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 11:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW7UJfRqqHzWWzAnOMaReQzYEqOKomSUlP6NJZQ26h0=; b=dhPpYNPG2ATzIQ4U4am8gBZjXV
	qk3hEI3hADctY40+2XFoCVK/Ir+yxWfO0PQZps9FGgp1rjMP1ik1bFJ7rNq5hAdMTIv7LX07ClfU0
	omOER7FqERHiKtN4XfML1zXcFKXdbPOegg8ucGSXdy/DDesWqky9hLvHFp/q7k7DT8+5VbLgYqzN4
	WgGhotJMQkhJBWM7F8Bv+BMrc/U5GwjJQWOrdLgJVIlSo8kB4nyvsq5h6gGs2c4EWXJ1cmh6g11qj
	R34vIxRubA+hOdoqUt1JFt3tZc/6i0SwBWwa6atOAlF0yJnSI1LhQicP8e+l4CTDSqR91b1nN1X33
	3InacwTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzw4m-00000005H5e-1yMS;
	Sat, 20 Sep 2025 11:48:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzw4k-00000005H5I-3G9f;
	Sat, 20 Sep 2025 11:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B200B6014D;
	Sat, 20 Sep 2025 11:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E848FC4CEEB;
	Sat, 20 Sep 2025 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758368899;
	bh=S4lEmGoMz/EYlXIdqoTKwelfO4ALXROy7V1e0MeAQH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iaVGOGORuQwMrNSIa4PH+D4hqQ1EzqYfhpFDlKS6GxoHvE2G07cydmcNxbH7JiSaF
	 VB//OvZ/NIyqtXTiQdgNIaJR1yOOt0GN5wvED71XbHWGfJQ8MXAbSmRKzOP0oGzxUo
	 eI0dRZofOuo2tWVbhmOha+R9iPLZBhlAq6PxjOe1O36YWhAikhcfQDESIsNAQ7q3jU
	 7Gd+ryQWi2LOvjIBn6+lHG+z8ITQPLWMenRTdeRpW6AWLUHFqDx4XBMKA2WVWqmMZP
	 P+Fxg09E+3mx9SdSTdOU9opMn20sKOks4qBu7Z2VV23wsoQOCrm3HqCHZtnhcHSmN+
	 St34XJ6vkjrEw==
Message-ID: <5bae4ebe-dd42-4e84-9ee6-c9f6a88f7db5@kernel.org>
Date: Sat, 20 Sep 2025 13:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/22] usb: dwc3: glue: Allow more fine grained control
 over mode switches
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-3-52c348623ef6@kernel.org>
 <20250919214013.gtbaknjrgd375hm6@synopsys.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250919214013.gtbaknjrgd375hm6@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 19.09.25 23:40, Thinh Nguyen wrote:
> On Sat, Sep 06, 2025, Sven Peter wrote:
>> We need fine grained control over mode switched on the DWC3 controller
>> present on Apple Silicon. Export core, host and gadget init and exit,
>> ptrcap and susphy control functions. Also introduce an additional
>> parameter to probe_data that allows to skip the final initialization
>> step that would bring up host or gadget mode.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   drivers/usb/dwc3/core.c   | 16 +++++++++++-----
>>   drivers/usb/dwc3/gadget.c |  2 ++
>>   drivers/usb/dwc3/glue.h   | 14 ++++++++++++++
>>   drivers/usb/dwc3/host.c   |  2 ++
>>   4 files changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 8002c23a5a02acb8f3e87b2662a53998a4cf4f5c..18056fac44c8732278a650ac2be8b493892c92dd 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -132,6 +132,7 @@ void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
>>   		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
>>   	}
>>   }
>> +EXPORT_SYMBOL_GPL(dwc3_enable_susphy);
>>   
>>   void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>   {
>> @@ -157,6 +158,7 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>   
>>   	dwc->current_dr_role = mode;
>>   }
>> +EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
> 
> I'm hesitant to export this as is. This function may change the susphy
> bits and expect them to be restored later. It's not meant to be a
> standalone use. At least, we should document how it should be used along
> with the other newly added interfaces.


Sure, I can otherwise also open-code the susphy change inside 
dwc3_apple_phy_set_mode anyway if you prefer to keep this private to the 
dwc3 core. I should restore it there to the original value anyway I 
guess after phy_set_mode.



>>   
>>   static void __dwc3_set_mode(struct work_struct *work)

[...]

>>   int dwc3_gadget_suspend(struct dwc3 *dwc)
>>   {
>> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
>> index 2efd00e763be4fc51911f32d43054059e61fb43a..633268c76fe4c7fdc312c9705dfa7cf7ccf3544c 100644
>> --- a/drivers/usb/dwc3/glue.h
>> +++ b/drivers/usb/dwc3/glue.h
>> @@ -15,16 +15,30 @@
>>    * @res: resource for the DWC3 core mmio region
>>    * @ignore_clocks_and_resets: clocks and resets defined for the device should
>>    *		be ignored by the DWC3 core, as they are managed by the glue
>> + * @skip_core_init_mode: skip the finial initialization of the target mode, as
> 
> finial -> final?

Whoops, yes, I thought I ran a spell checker over this because I usually 
add a lot of typos but must've forgotten :-)


> 
>> + *		it must be managed by the glue
>>    */

[...]

>>   
>> +int dwc3_core_init(struct dwc3 *dwc);
>> +void dwc3_core_exit(struct dwc3 *dwc);
>> +
>> +int dwc3_host_init(struct dwc3 *dwc);
>> +void dwc3_host_exit(struct dwc3 *dwc);
>> +int dwc3_gadget_init(struct dwc3 *dwc);
>> +void dwc3_gadget_exit(struct dwc3 *dwc);
>> +
>> +void dwc3_enable_susphy(struct dwc3 *dwc, bool enable);
>> +void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy);
>> +
> 
> We should document these interfaces. The dwc3_core_probe() does all of
> the above in the proper order. It's not obvious why these are needed and
> how they should be used.

Very good point, I'll add documentation for all of these!


Thanks for the review,


Sven



