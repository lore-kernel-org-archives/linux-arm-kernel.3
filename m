Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7E2CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2zDen68ttdZbz+wbzD59uAR8OcCwydYj53Fsb1yHBk=; b=bVFGr7xeRXWu3Qae9Ay9DgqbBc
	8yCdBDRm6UdFLywyNDp8LYBcKbeoD1sh32DLzgjZ9wbdqsWkLsFDHCZBia6hyiR/3z/x9bPy8oaiS
	W0WcqqFQzCapvekQBuL+D7wBQIa1XPxZb1Ujdf90zPgB8+zZ/goOoWgSPoEP05KivW5S7sIqu2mKA
	Ixzj4CNt2+j/YXKGU3FzTpBC7J7Hi/8nnub+F53UoW4C59M8EOHM5xqfIBVRUfVUrlxGkdiaJ7lUA
	2bR1rHIDmqefzwV52CI2TsVjTxJi7XOjZPbWj/xCUVWGxiUpBC2HQYNcPBtiBPtBHWwAp+q51LtWH
	m67z4yDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178a-0000000EREG-3oio;
	Tue, 23 Sep 2025 17:49:12 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178Y-0000000ERDR-1Dc9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:11 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NHn5o41526443;
	Tue, 23 Sep 2025 12:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758649745;
	bh=P2zDen68ttdZbz+wbzD59uAR8OcCwydYj53Fsb1yHBk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sA18aktxKcLD0LkM7GILAwJaeOUjIW4KTY9aNtJMG5OVgfJf3acM+UP2rXMYPCxkm
	 e58K80WE89e4Dzwmvr21dRmX7qWrDdUf8kPYfZdCpU2XRKnc82R0B2G6+xcxuj87p5
	 pyFd75kgK6NbZwXYOsdprZtpzl7Iyxbfv+z9FECc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NHn5th2957265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 12:49:05 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 12:49:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 12:49:04 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NHn4XV422823;
	Tue, 23 Sep 2025 12:49:04 -0500
Date: Tue, 23 Sep 2025 12:49:04 -0500
From: Kendall Willis <k-willis@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin
 Hilman <khilman@baylibre.com>,
        Dhruva Gole <d-gole@ti.com>, Sebin Francis
	<sebin.francis@ti.com>,
        Akashdeep Kaur <a-kaur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] firmware: ti_sci: Partial-IO support
Message-ID: <20250923174904.s6jqj35uizclpsxd@uda0506412>
References: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com>
 <20250812-topic-am62-partialio-v6-12-b4-v7-2-ac10865c2d87@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812-topic-am62-partialio-v6-12-b4-v7-2-ac10865c2d87@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104910_499635_0E304B12 
X-CRM114-Status: GOOD (  48.87  )
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

Hi Markus,

On 11:19-20250812, Markus Schneider-Pargmann wrote:
> Add support for Partial-IO poweroff. In Partial-IO pins of a few
> hardware units can generate system wakeups while DDR memory is not
> powered resulting in a fresh boot of the system. These hardware units in
> the SoC are always powered so that some logic can detect pin activity.
> 
> If the system supports Partial-IO as described in the fw capabilities, a
> sys_off handler is added. This sys_off handler decides if the poweroff
> is executed by entering normal poweroff or Partial-IO instead. The
> decision is made by checking if wakeup is enabled on all devices that
> may wake up the SoC from Partial-IO.
> 
> The possible wakeup devices are found by checking which devices
> reference a "Partial-IO" system state in the list of wakeup-source
> system states. Only devices that are actually enabled by the user will
> be considered as an active wakeup source. If none of the wakeup sources
> is enabled the system will do a normal poweroff. If at least one wakeup
> source is enabled it will instead send a TI_SCI_MSG_PREPARE_SLEEP
> message from the sys_off handler. Sending this message will result in an
> immediate shutdown of the system. No execution is expected after this
> point. The code will wait for 5s and do an emergency_restart afterwards
> if Partial-IO wasn't entered at that point.
> 
> A short documentation about Partial-IO can be found in section 6.2.4.5
> of the TRM at
>   https://www.ti.com/lit/pdf/spruiv7
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/firmware/ti_sci.c | 131 +++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/firmware/ti_sci.h |   5 ++
>  2 files changed, 135 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index c187fb714b3a4c658d0593c844716d4b160e4fa9..fb6f3d7f7413917cf9534ba65f0a9786d1183c71 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3750,6 +3750,116 @@ static const struct dev_pm_ops ti_sci_pm_ops = {
>  #endif
>  };
>  
> +/*
> + * Enter Partial-IO, which disables everything including DDR with only a small
> + * logic being active for wakeup.
> + */
> +static int ti_sci_enter_partial_io(struct ti_sci_info *info)
> +{
> +	struct ti_sci_msg_req_prepare_sleep *req;
> +	struct ti_sci_xfer *xfer;
> +	struct device *dev = info->dev;
> +	int ret = 0;
> +
> +	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
> +				   TI_SCI_FLAG_REQ_GENERIC_NORESPONSE,
> +				   sizeof(*req), sizeof(struct ti_sci_msg_hdr));
> +	if (IS_ERR(xfer)) {
> +		ret = PTR_ERR(xfer);
> +		dev_err(dev, "Message alloc failed(%d)\n", ret);
> +		return ret;
> +	}
> +
> +	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
> +	req->mode = TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO;
> +	req->ctx_lo = 0;
> +	req->ctx_hi = 0;
> +	req->debug_flags = 0;
> +
> +	dev_info(dev, "Entering Partial-IO because a powered wakeup-enabled device was found.\n");
> +

IMO this print should be in the ti_sci_sys_off_handler since that is
where the check is to find the wakeup-enabled device.

> +	ret = ti_sci_do_xfer(info, xfer);
> +	if (ret) {
> +		dev_err(dev, "Mbox send fail %d\n", ret);
> +		goto fail;
> +	}
> +
> +fail:
> +	ti_sci_put_one_xfer(&info->minfo, xfer);
> +
> +	return ret;
> +}
> +

Just something to think about: another way to implement this function
would be to change ti_sci_cmd_prepare_sleep to add a parameter of flags
for ti_sci_get_one_xfer in order to be able to choose if the
TI_SCI_FLAG_REQ_GENERIC_NORESPONSE or TI_SCI_FLAG_REQ_ACK_ON_PROCESSED
is used. This would make it so there's not duplicated code and
ti_sci_cmd_prepare_sleep could be used to enter partial IO.

> +/*
> + * Iterate all device nodes that have a wakeup-source property and check if one
> + * of the possible phandles points to a Partial-IO system state. If it
> + * does resolve the device node to an actual device and check if wakeup is
> + * enabled.
> + */
> +static bool ti_sci_partial_io_wakeup_enabled(struct ti_sci_info *info)
> +{
> +	struct device_node *wakeup_node = NULL;
> +
> +	for_each_node_with_property(wakeup_node, "wakeup-source") {
> +		struct of_phandle_iterator it;
> +		int err;
> +
> +		of_for_each_phandle(&it, err, wakeup_node, "wakeup-source", NULL, 0) {
> +			struct platform_device *pdev;
> +			bool may_wakeup;
> +
> +			/*
> +			 * Continue if idle-state-name is not off-wake. Return
> +			 * value is the index of the string which should be 0 if
> +			 * off-wake is present.
> +			 */
> +			if (of_property_match_string(it.node, "idle-state-name", "off-wake"))
> +				continue;
> +
> +			pdev = of_find_device_by_node(wakeup_node);
> +			if (!pdev)
> +				continue;
> +
> +			may_wakeup = device_may_wakeup(&pdev->dev);
> +			put_device(&pdev->dev);
> +
> +			if (may_wakeup) {
> +				dev_dbg(info->dev, "%pOF identified as wakeup source for Partial-IO\n",
> +					wakeup_node);
> +				of_node_put(it.node);
> +				of_node_put(wakeup_node);
> +				return true;
> +			}
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static int ti_sci_sys_off_handler(struct sys_off_data *data)
> +{
> +	struct ti_sci_info *info = data->cb_data;
> +	bool enter_partial_io = ti_sci_partial_io_wakeup_enabled(info);
> +	int ret;
> +
> +	if (!enter_partial_io)
> +		return NOTIFY_DONE;
> +
> +	ret = ti_sci_enter_partial_io(info);
> +
> +	if (ret) {
> +		dev_err(info->dev,
> +			"Failed to enter Partial-IO %pe, trying to do an emergency restart\n",
> +			ERR_PTR(ret));
> +		emergency_restart();
> +	}
> +
> +	mdelay(5000);
> +	emergency_restart();
> +
> +	return NOTIFY_DONE;
> +}
> +
>  /* Description for K2G */

nit: Might be nicer to move code before 'static const struct dev_pm_ops
ti_sci_pm_ops' to keep all the 'static const struct's together.

>  static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
>  	.default_host_id = 2,
> @@ -3893,6 +4003,19 @@ static int ti_sci_probe(struct platform_device *pdev)
>  		goto out;
>  	}
>  
> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO) {
> +		ret = devm_register_sys_off_handler(dev,
> +						    SYS_OFF_MODE_POWER_OFF,
> +						    SYS_OFF_PRIO_FIRMWARE,
> +						    ti_sci_sys_off_handler,
> +						    info);
> +		if (ret) {
> +			dev_err(dev, "Failed to register sys_off_handler %pe\n",
> +				ERR_PTR(ret));
> +			goto out;
> +		}
> +	}
> +
>  	dev_info(dev, "ABI: %d.%d (firmware rev 0x%04x '%s')\n",
>  		 info->handle.version.abi_major, info->handle.version.abi_minor,
>  		 info->handle.version.firmware_revision,
> @@ -3902,7 +4025,13 @@ static int ti_sci_probe(struct platform_device *pdev)
>  	list_add_tail(&info->node, &ti_sci_list);
>  	mutex_unlock(&ti_sci_list_mutex);
>  
> -	return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> +	if (ret) {
> +		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
> +		goto out;
> +	}
> +	return 0;
> +

Should this be a separate commit since it doesn't have anything to do 
with the Partial IO functionality? This looks like a bug fix.

Best,
Kendall Willis

>  out:
>  	if (!IS_ERR(info->chan_tx))
>  		mbox_free_channel(info->chan_tx);
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index 053387d7baa064498e6a208daa7f70040ef87281..006a3d40ba040f12d0b2dff7fce49b4eefa52517 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -592,6 +592,11 @@ struct ti_sci_msg_resp_get_clock_freq {
>  struct ti_sci_msg_req_prepare_sleep {
>  	struct ti_sci_msg_hdr	hdr;
>  
> +/*
> + * When sending prepare_sleep with MODE_PARTIAL_IO no response will be sent,
> + * no further steps are required.
> + */
> +#define TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO				0x03
>  #define TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED				0xfd
>  	u8			mode;
>  	u32			ctx_lo;
> 
> -- 
> 2.50.1
> 

