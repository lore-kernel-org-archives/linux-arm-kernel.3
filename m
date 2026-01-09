Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21216D26D67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmHlZRi4mzGX5Unx3kgK3MeyeJjaxOKWaTfJb6jpBF0=; b=F3gliFY7bKVS7w+QqWK8qRwHEa
	Cft7T87ZPHV2HwW2TkQIYlKJlo85Jf/49qM9LCw1c3yyrHIIRxWYgwaG0TmMrDzyLX+gq79Kw+OiH
	TNhce297bIgv2G8Z8swUtC1FpTgBXxYa7HeSnMSL5q/QkClQvS5GTZJCjUIt+/ScF7hXqI9zSkYg7
	FFeIzkyCRKPkTXZADmKpT1YOZanYp0YX/qEO7CcxoR00Y1OHglaPXRIA7qsIBRtO+KUMeBchMKbYf
	jFw6SOyA1DA5Gh9xvJ39UWYLJcQei0pLI69zjwpH5Dq+7aGDz+PLnqHl0jOZEZUDcncq8pDW5Xokt
	golZhXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEms-00000002X98-0ejv;
	Fri, 09 Jan 2026 15:52:30 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEmp-00000002X8d-23OY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:52:28 +0000
Message-ID: <be8a566a-163f-4d20-b712-67de6f63a6b5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767973945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmHlZRi4mzGX5Unx3kgK3MeyeJjaxOKWaTfJb6jpBF0=;
	b=D8z/sT5GzvDYXuVVUi5zo3k5Ccjd3GoRKJNvYUsQWo9pHJpIeMCwgEitWNWmNi+l+qEfdw
	uzKrZVdqMzMijMxurXwUbgUqsf7enZW1YERbuC8Oybgj/CaXUrV8cLyia9VMuJiHuY9y+G
	EujR+aU8Ts7tKxl1AQOaR41mP6sQL5A=
Date: Fri, 9 Jan 2026 10:52:18 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
 Neal Frager <neal.frager@amd.com>, Michal Simek <michal.simek@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_075227_829705_B4792EBD 
X-CRM114-Status: GOOD (  25.19  )
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

On 1/8/26 19:49, Thinh Nguyen wrote:
> On Tue, Jan 06, 2026, Sean Anderson wrote:
>> If we don't have a usb3 phy we don't need to assert the core resets.
>> Deassert them even if we didn't assert them to support booting when the
>> bootloader never released the core from reset.
>> 
> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>>  drivers/usb/dwc3/dwc3-xilinx.c | 67 ++++++++++++++++------------------
>>  1 file changed, 32 insertions(+), 35 deletions(-)
>> 
> 
> This sounds like a fix. Does it need to be Cc Stable and backported?

No, it's not a fix since the bootloaders currently in use on this
platform always initialize the serdes. But I want to add support for
skipping this initialization and this patch is necessary for that.

--Sean

> Regardless,
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 
> Thanks,
> Thinh
> 
>> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
>> index 0a8c47876ff9..f41b0da5e89d 100644
>> --- a/drivers/usb/dwc3/dwc3-xilinx.c
>> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
>> @@ -132,21 +132,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -	/*
>> -	 * The following core resets are not required unless a USB3 PHY
>> -	 * is used, and the subsequent register settings are not required
>> -	 * unless a core reset is performed (they should be set properly
>> -	 * by the first-stage boot loader, but may be reverted by a core
>> -	 * reset). They may also break the configuration if USB3 is actually
>> -	 * in use but the usb3-phy entry is missing from the device tree.
>> -	 * Therefore, skip these operations in this case.
>> -	 */
>> -	if (!priv_data->usb3_phy) {
>> -		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
>> -		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> -		goto skip_usb3_phy;
>> -	}
>> -
>>  	crst = devm_reset_control_get_exclusive(dev, "usb_crst");
>>  	if (IS_ERR(crst)) {
>>  		ret = PTR_ERR(crst);
>> @@ -171,22 +156,31 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -	ret = reset_control_assert(crst);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to assert core reset\n");
>> -		goto err;
>> -	}
>> +	/*
>> +	 * Asserting the core resets is not required unless a USB3 PHY is used.
>> +	 * They may also break the configuration if USB3 is actually in use but
>> +	 * the usb3-phy entry is missing from the device tree. Therefore, skip
>> +	 * a full reset cycle and just deassert the resets if the phy is
>> +	 * absent.
>> +	 */
>> +	if (priv_data->usb3_phy) {
>> +		ret = reset_control_assert(crst);
>> +		if (ret < 0) {
>> +			dev_err(dev, "Failed to assert core reset\n");
>> +			goto err;
>> +		}
>>  
>> -	ret = reset_control_assert(hibrst);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to assert hibernation reset\n");
>> -		goto err;
>> -	}
>> +		ret = reset_control_assert(hibrst);
>> +		if (ret < 0) {
>> +			dev_err(dev, "Failed to assert hibernation reset\n");
>> +			goto err;
>> +		}
>>  
>> -	ret = reset_control_assert(apbrst);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to assert APB reset\n");
>> -		goto err;
>> +		ret = reset_control_assert(apbrst);
>> +		if (ret < 0) {
>> +			dev_err(dev, "Failed to assert APB reset\n");
>> +			goto err;
>> +		}
>>  	}
>>  
>>  	ret = phy_init(priv_data->usb3_phy);
>> @@ -201,11 +195,15 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -	/* Set PIPE Power Present signal in FPD Power Present Register*/
>> -	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
>> -
>> -	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
>> -	writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> +	if (priv_data->usb3_phy) {
>> +		/* Set PIPE Power Present signal in FPD Power Present Register*/
>> +		writel(FPD_POWER_PRSNT_OPTION, priv_data->regs + XLNX_USB_FPD_POWER_PRSNT);
>> +		/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
>> +		writel(PIPE_CLK_SELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> +	} else {
>> +		/* Deselect the PIPE Clock Select bit in FPD PIPE Clock register */
>> +		writel(PIPE_CLK_DESELECT, priv_data->regs + XLNX_USB_FPD_PIPE_CLK);
>> +	}
>>  
>>  	ret = reset_control_deassert(crst);
>>  	if (ret < 0) {
>> @@ -225,7 +223,6 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
>>  		goto err;
>>  	}
>>  
>> -skip_usb3_phy:
>>  	/* ulpi reset via gpio-modepin or gpio-framework driver */
>>  	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>>  	if (IS_ERR(reset_gpio)) {
>> -- 
>> 2.35.1.1320.gc452695387.dirty
>> 

