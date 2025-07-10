Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B56C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 05:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZND/XwNOzpB2vjuxP78ruQThC40Mj/qaWgPyvlaTMNk=; b=ywBWKb+HWaUddIH8+KYTM7n/df
	NuFw7XqMwKyWSzCApprPP5sLoyF6350vra8xMEIV8T0WLP+kUoWlTgAkYZNnIPnoWlNnIiOPAeHPu
	2p76bs4HGulOavpQgn2ntdqMqygBldsLiu/xCKytCzg/5STsAM+At1mdEWQVYWTzzg7PMrGCWjPUd
	8B+gtg9H9djWb7WvPY9xwMxpaaqXUCZJHLQvSn7Bsp+2zG13hB8M5YRPk47Nfd/r7PIQqREkeqLZ2
	/3DSRm9+yfv8IsUz21vktFWPTpAWlipDFTgIhSQzRMsS0zgKKB/QYMoiK4jleDQUAgHEZVR7zpUJk
	3Ip0uUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZk7m-0000000AkfY-1zQX;
	Thu, 10 Jul 2025 05:47:14 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZk4t-0000000AkFO-46YI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 05:44:17 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56A5i1l11651610;
	Thu, 10 Jul 2025 00:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752126241;
	bh=ZND/XwNOzpB2vjuxP78ruQThC40Mj/qaWgPyvlaTMNk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GU829TTF6bCdk9Vkzvtxgva2r59+A3bqkvkAC5Hpw9mmAbzotz3lVOg76DLPckJT0
	 pm5xNj4ZQqTHQfKZIHGG6qyh12bu1hR6FFZwO8DDCseeHi0qb4rrMNgmilJ06jq8P9
	 T6LJE++mbLwbA63LFo0+xnB6vHgG0bjmcE6+b/Kk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56A5i1jp3202317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 00:44:01 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 00:44:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 00:44:01 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56A5i1iF1110717;
	Thu, 10 Jul 2025 00:44:01 -0500
Date: Thu, 10 Jul 2025 00:44:01 -0500
From: Nishanth Menon <nm@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <ulf.hansson@linaro.org>, <vigneshr@ti.com>, <d-gole@ti.com>,
        <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
        <khilman@baylibre.com>
Subject: Re: [PATCH v3] firmware: ti_sci: Enable abort handling of entry to
 LPM
Message-ID: <20250710054401.5hmhsdtyulcskwug@zodiac>
References: <20250709221619.2237699-1-k-willis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250709221619.2237699-1-k-willis@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_224416_186940_B1EE82E0 
X-CRM114-Status: GOOD (  51.10  )
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

On 17:16-20250709, Kendall Willis wrote:
> The PM co-processor (device manager or DM) adds the ability to abort
> entry to a low power mode by clearing the mode selection in the
> latest version of its firmware (11.x). The following power management
> operation defined in the TISCI Low Power Mode API [1] is implemented to
> enable aborting entry to LPM:
> 
> TISCI_MSG_LPM_ABORT
> Abort the current low power mode entry by clearing the current mode
> selection.
> 
> Introduce LPM abort call that enables the ti_sci driver to support abort
> by clearing the low power mode selection of the DM. This fixes behavior
> from the DM where if system suspend failed, the next time system suspend
> is entered, it will fail because DM did not have the low power mode
> selection cleared. Instead of this behavior, the low power mode selection
> will be cleared after Linux resume which will allow subsequent system
> suspends to work correctly.
> 
> When Linux suspends, the TI SCI ->suspend() call will send a prepare_sleep
> message to the DM. The DM will choose what low power mode to enter once
> Linux is suspended based on constraints given by devices in the TI SCI PM
> domain. After system suspend completes, regardless of if system suspend
> succeeds or fails, the ->complete() hook in TI SCI will be called. In the
> ->complete() hook, a message will be sent to the DM to clear the current
> low power mode selection. This is necessary because if suspend fails, the
> low power mode selection in the DM is not cleared and the next system
> suspend will fail due to the low power mode not having been cleared from
> the previous failed system suspend.
> 
> Clearing the mode selection unconditionally acts as a cleanup from sending
> the prepare_sleep message in ->suspend(). The DM already clears the low
> power selection automatically when resuming from system suspend. If
> suspend/resume executed without failure, clearing the low power mode
> selection will not cause an error in the DM.
> 
> The flow for the abort sequence is the following:
>    1. User sends a command to enter sleep
>    2. Linux starts to suspend drivers
>    3. TI SCI suspends and sends prepare_sleep message to DM
>    4. A driver fails to suspend
>    5. Linux resumes the drivers that have already suspended
>    6. Linux sends DM to clear the current low power mode selection from
>       TI SCI ->complete() hook
>    7. DM aborts LPM entry by clearing the current mode selection
>    8. Linux works as normal

Could we trim the message a bit down? it is informative, thanks.. but I
think a bit repetitive.

> 
> [1] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
> Series has been tested on an SK-AM62B-P1 board. Normal suspend/resume
> has been verified. Abort was tested by adding an error into the TI SCI
> suspend hook.

btw, does this handle the noirq case as well? I have'nt looked closely
at the sequence to be sure.

> 
> Link to v2:
> https://lore.kernel.org/all/20250709205332.2235072-1-k-willis@ti.com/
> Link to v1:
> https://lore.kernel.org/all/20250627204821.1150459-1-k-willis@ti.com/
> 
> Changes from v2 to v3:
>   - added links to previous series and the changes between them

Thanks, but in the future, I'd rather not want a v3, but just reply
with the missing info and better still, add to your pre-send checklist
to ensure you don't miss it in the future ;).


> 
> Changes from v1 to v2:
>    - rebase on linux-next
>    - drop the following patch:
>      pmdomain: ti_sci: Add LPM abort sequence to suspend path
>    - remove lpm_abort from ti_sci_pm_ops
>    - add ->complete() hook with ti_sci_cmd_lpm_abort to be called
>      unconditionally within it
>    - remove ti_sci_cmd_lpm_abort from the ->suspend() and
>      ->suspend_noirq() hooks
>    - reword commit message
> ---
>  drivers/firmware/ti_sci.c | 61 +++++++++++++++++++++++++++++++++++++++
>  drivers/firmware/ti_sci.h |  3 +-
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index ae5fd1936ad32..63c405f7037f0 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -2015,6 +2015,58 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
>  	return ret;
>  }
>  
> +/**
> + * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
> + * @handle:     pointer to TI SCI handle
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_lpm_abort(const struct ti_sci_handle *handle)
> +{
> +	struct ti_sci_info *info;
> +	struct ti_sci_msg_hdr *req;
> +	struct ti_sci_msg_hdr *resp;
> +	struct ti_sci_xfer *xfer;
> +	struct device *dev;
> +	int ret = 0;
> +
> +	if (IS_ERR(handle))
> +		return PTR_ERR(handle);
> +	if (!handle)
> +		return -EINVAL;
> +
> +	info = handle_to_ti_sci_info(handle);
> +	dev = info->dev;

-ECONFUSED. ti_sci_complete already gets dev and info and this API is
not exposed to other users. So why do we need to flip back and forth
with info->handle and then get info from handle and dev again??
> +
> +	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
> +				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> +				   sizeof(*req), sizeof(*resp));
> +	if (IS_ERR(xfer)) {
> +		ret = PTR_ERR(xfer);
> +		dev_err(dev, "Message alloc failed(%d)\n", ret);
> +		return ret;
> +	}
> +	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
> +
> +	ret = ti_sci_do_xfer(info, xfer);
> +	if (ret) {
> +		dev_err(dev, "Mbox send fail %d\n", ret);
> +		goto fail;
> +	}
> +
> +	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
> +
> +	if (!ti_sci_is_response_ack(resp))
> +		ret = -ENODEV;
> +	else
> +		ret = 0;
is'nt ret already 0?

OR you could go with ? like rest of code.. ;)

> +
> +fail:
> +	ti_sci_put_one_xfer(&info->minfo, xfer);
> +
> +	return ret;
> +}
> +
>  static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
>  {
>  	struct ti_sci_info *info;
> @@ -3739,11 +3791,20 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
>  	return 0;
>  }
>  
> +static void __maybe_unused ti_sci_complete(struct device *dev)

ti_sci_pm_complete or something like that?

> +{
> +	struct ti_sci_info *info = dev_get_drvdata(dev);
> +
> +	if (ti_sci_cmd_lpm_abort(&info->handle))

I see from the documentation of .complete that it is invoked in
multitude of scenarios, including resume as well. While I think it is
probably fine to clear the state, have you had a chance to look at
possible side effects in other flows (thaw etc..?)

Additionally, do we want to check info->fw_caps &
MSG_FLAG_CAPS_LPM_DM_MANAGED before sending it over to DM?

> +		dev_err(dev, "LPM clear selection failed.\n");
> +}
> +
>  static const struct dev_pm_ops ti_sci_pm_ops = {
>  #ifdef CONFIG_PM_SLEEP
>  	.suspend = ti_sci_suspend,
>  	.suspend_noirq = ti_sci_suspend_noirq,
>  	.resume_noirq = ti_sci_resume_noirq,
> +	.complete = ti_sci_complete,

Another question - when is .complete called as part of rewind? does DM
behave sane while other drivers are resuming back up before .complete is
invoked?

>  #endif
>  };
>  
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index 053387d7baa06..51d77f90a32cc 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -6,7 +6,7 @@
>   * The system works in a message response protocol
>   * See: https://software-dl.ti.com/tisci/esd/latest/index.html for details
>   *
> - * Copyright (C)  2015-2024 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C)  2015-2025 Texas Instruments Incorporated - https://www.ti.com/

please dont keep shifting license year for trivial changes :)
>   */
>  
>  #ifndef __TI_SCI_H
> @@ -42,6 +42,7 @@
>  #define TI_SCI_MSG_SET_IO_ISOLATION	0x0307
>  #define TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT	0x0309
>  #define TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT	0x030A
> +#define TI_SCI_MSG_LPM_ABORT	0x0311

NOTE: all the LPM stuff is enabled with MSG_FLAG_CAPS_LPM_DM_MANAGED.
Is this supported from the very beginning version of firmware that
has this? else will we see issues in the field with a mix of firmware
versions.. some just crashing out when the message is not supported?

>  
>  /* Resource Management Requests */
>  #define TI_SCI_MSG_GET_RESOURCE_RANGE	0x1500
> 
> base-commit: 835244aba90de290b4b0b1fa92b6734f3ee7b3d9
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

