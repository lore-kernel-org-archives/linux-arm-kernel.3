Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9915CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arFSkfursW8aEJKFFDDFEMULlGpynavmPbe3lpdtsMg=; b=yDSFonR3H9barvhD0BwbwN+sXv
	UWp+wc/mVgcUOvsaklvoEV46Y0z0/2Ter2lFVaqhxwOdCHW7gf+CUoWnUcPPuvjCdWskmspPRNH/u
	BU9yK4PDma/FhY7SK+u2SKdAnwsVXb38wznVEbZ8MnIiYnyPEmB7OY1HlNw+bVqStDKx37H9PJBVj
	hVjTpfiSEbEXDEn7+BwDzlQgDtK1U04ZkJkfxAZM1wH27ZcDl7NS9APT7Q1N2MpnoyJIAZZnv4ZlM
	rJgd+MHM+E7jZ17mTK8bZjJC4D/xdczX4jaB5L8LngOAxOgE/DAqHeX0SQ6yyUXnCPL24axFhy61y
	Es635KTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCcQ-00000006I7K-1EEt;
	Sun, 24 Aug 2025 15:26:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCZp-00000006HyE-1zdk;
	Sun, 24 Aug 2025 15:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A0EB60250;
	Sun, 24 Aug 2025 15:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618EAC4CEEB;
	Sun, 24 Aug 2025 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756049052;
	bh=8wQtpQH1TlV2K94OX/d1Zy6vAxp627HaTZKKXCwGJMc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JVNQqRF79BT1l4/KZeMe33EiEKJ1JMNlsNOAcvzY3NlyHYXYBOQvQIJ5wkwzxJF54
	 5EyBy3glSbARx+QcYRaWRJj8GgSfxQV8zulen0nZxZCfNa0OYWr8ZwoVnd8Hy2bmTw
	 AtG1+8+kAj34Wju3bgusUedc/p1nybrMvFyJGKVIFhxMmZxoszkCIYWziYY6lz+Fzv
	 ju7lNMsckVFngXkBdZLXshJII/7YipNjl5E7UOymmx3L20X2r4KyperlyNRwJRvXfB
	 F87Wi21qCVGcqxZPkpZB2WTh1SPzhKJwtVZp1C4z1tahFdUmy7hXUPsdgP3zhCJRq4
	 iVRk5OOFv+jyg==
Message-ID: <bc4fa511-5dc5-4844-8206-eb55783647e8@kernel.org>
Date: Sun, 24 Aug 2025 17:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/22] usb: dwc3: apple: Reset dwc3 during role
 switches
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-4-172beda182b8@kernel.org>
 <20250821232547.qzplkafogsacnbti@synopsys.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250821232547.qzplkafogsacnbti@synopsys.com>
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

On 22.08.25 01:25, Thinh Nguyen wrote:
> On Thu, Aug 21, 2025, Sven Peter wrote:
>> As mad as it sounds, the dwc3 controller present on the Apple M1 must be
>> reset and reinitialized whenever a device is unplugged from the root
>> port or when the PHY mode is changed.
>>
>> This is required for at least the following reasons:
>>
>>    - The USB2 D+/D- lines are connected through a stateful eUSB2 repeater
>>      which in turn is controlled by a variant of the TI TPS6598x USB PD
>>      chip. When the USB PD controller detects a hotplug event it resets
>>      the eUSB2 repeater. Afterwards, no new device is recognized before
>>      the DWC3 core and PHY are reset as well because the eUSB2 repeater
>>      and the PHY/dwc3 block disagree about the current state.
>>
>>    - It's possible to completely break the dwc3 controller by switching
>>      it to device mode and unplugging the cable at just the wrong time.
>>      If this happens dwc3 behaves as if no device is connected.
>>      CORESOFTRESET will also never clear after it has been set. The only
>>      workaround is to trigger a hard reset of the entire dwc3 core with
>>      its external reset line.
>>
>>    - Whenever the PHY mode is changed (to e.g. transition to DisplayPort
>>      alternate mode or USB4) dwc3 has to be shutdown and reinitialized.
>>      Otherwise the Type-C port will not be usable until the entire SoC
>>      has been reset.
>>
>> All of this can be easily worked around by respecting transitions to
>> USB_ROLE_NONE and making sure the external reset line is asserted when
>> switching roles. We additionally have to ensure that the PHY is
>> suspended during init.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   drivers/usb/dwc3/core.c | 61 +++++++++++++++++++++++++++++++++++++++++++++---


[...]

> 
>> +			dwc3_core_exit(dwc);
>> +		}
>> +
>> +		if (desired_dr_role) {
>> +			ret = dwc3_core_init_for_resume(dwc);
> 
> The dwc3_core_init_for_resume() is for PM, reusing this with its
> current name is confusing.

Ack, I was going to clean this up later and wanted to get feedback on 
this entire approach first. Won't be used anymore when moving to a 
glue.h based approach anyway.

> 
>> +			if (ret) {
>> +				dev_err(dwc->dev,
>> +				    "failed to reinitialize core\n");
>> +				goto out;
>> +			}
>> +		} else {
>> +			goto out;
>> +		}
>> +	}
>> +
>>   	/*
>>   	 * When current_dr_role is not set, there's no role switching.
>>   	 * Only perform GCTL.CoreSoftReset when there's DRD role switching.
>>   	 */
>> -	if (dwc->current_dr_role && ((DWC3_IP_IS(DWC3) ||
>> +	if (dwc->role_switch_reset_quirk ||
> 
> Don't override the use of GCTL.CoreSoftReset with this quirk. Not all
> controller versions should use GCTL.CoreSoftReset, the new controller
> version don't even have it. What version is this vendor using?
> 
> I'm concern how this condition is needed...

This is actually a leftover from the first attempts at making this work. 
I didn't know about the external reset line back then and had to 
soft-reset it here because it would not see new devices otherwise IIRC.
Since we're going through a hard-reset now anyway this can be dropped
and this entire commit will disappear in favor of a glue.h based driver 
anyway.

> 
>> +		(dwc->current_dr_role && ((DWC3_IP_IS(DWC3) ||
>>   			DWC3_VER_IS_PRIOR(DWC31, 190A)) &&
>> -			desired_dr_role != DWC3_GCTL_PRTCAP_OTG)) {
>> +			desired_dr_role != DWC3_GCTL_PRTCAP_OTG))) {
>>   		reg = dwc3_readl(dwc->regs, DWC3_GCTL);
>>   		reg |= DWC3_GCTL_CORESOFTRESET;
>>   		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
>> @@ -1372,6 +1394,9 @@ static int dwc3_core_init(struct dwc3 *dwc)
>>   	if (ret)
>>   		goto err_exit_phy;
>>   
>> +	if (dwc->role_switch_reset_quirk)
>> +		dwc3_enable_susphy(dwc, true);
>> +
> 
> Why do you need to enable susphy here?

The only place we actually need it is when we shut down the Type-C PHY 
due some what I assume is some hardware quirk, i.e. just before 
dwc3_core_exit.

The PHY will otherwise not be able to acquire some hardware lock (which 
they call PIPEHANDLER lock in debug strings) to switch from e.g. USB3 
PHY to a dummy PHY for USB2 only. It then can't shut down cleanly 
anymore and will get stuck in a weird state where the port refuses to 
work until I reset everything.
Originally it was added because we just undid some commit where susphy 
handling was made unconditional IIRC.

I'll move this to the glue driver with a comment explaining why it's 
required.


> 
>>   	dwc3_core_setup_global_control(dwc);

[...]

>> +	if (dev->of_node) {
>> +		if (of_device_is_compatible(dev->of_node, "apple,t8103-dwc3")) {
>> +			if (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
>> +			    !IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)) {
>> +				dev_err(dev,
>> +				    "Apple DWC3 requires role switch support.\n"
>> +				    );
>> +				ret = -EINVAL;
>> +				goto err_put_psy;
>> +			}
>> +
>> +			dwc->dr_mode = USB_DR_MODE_OTG;
>> +			dwc->role_switch_reset_quirk = true;
> 
> Put this in your glue driver or device tree.

Ack.

> 
>> +		}
>> +	}

[...]

>> +
>> +	if (dwc->role_switch_reset_quirk && !dwc->current_dr_role)
>> +		role = USB_ROLE_NONE;
> 
> Don't return USB_ROLE_NONE on role_switch get. The USB_ROLE_NONE is the
> default role. The role_switch get() should return exactly which role the
> controller is currently in, and the driver can figure that out.

Ack, will also happen from inside the glue driver now.




Sven


