Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE495E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGedN05yDyYA7Seb0LX9K4nmEUYLSyJdSXcb+rtc3Y8=; b=SvGDXb5YourDDfDs/ksGQ+TqvU
	7n6ILKT3P+OH9728RTgpdSDYCBxX+b2Y/pDxh6y/xKq4/y1oehksH/G5/0z+7axROs0OovYjVc5Tu
	KN83tfcGaCYOF4t2MxRxXKatABF/bbdcHEY2tEf/gDNQkoUMhNLqli/z+PPOVuPhpkvOZTvCwmwTy
	C+H+m3ilTo3J9sH/+JolqvbYDlqrJ8+MYa2t7d9Xaxqp6jOrDNBLjmi5h5E135rtmjWA8/405Pf+w
	hdpqaNJJ9XIQYykjCmENmdRi9jvwrsMalXDVhnK20Dp1JDzfMt+oNERjfP3wN4B8I4XvNxHm2sdZM
	qb1iQaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObY7-00000004pax-3lU0;
	Fri, 20 Dec 2024 11:52:07 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObWw-00000004pKy-46ob
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:50:57 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BKBojsi006872;
	Fri, 20 Dec 2024 05:50:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734695445;
	bh=tGedN05yDyYA7Seb0LX9K4nmEUYLSyJdSXcb+rtc3Y8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Q3P8OMAZnR1ML4OecptuPSeIRv3jws4wqLq4Snh8VS+mEvu2FFWwAy/SGP02hwJwy
	 Kijs36sfbjLp1WLV33c5Ecfkfce1woZFFxzlro5Sxbko5p3XUH7xBqdBUoJ2b19u3S
	 ka7+7WlIyHs9zcyRlV9vtGkWGaSmNxzOwAPOyvDc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKBojYq104259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 05:50:45 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 05:50:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 05:50:44 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKBohWO059097;
	Fri, 20 Dec 2024 05:50:44 -0600
Date: Fri, 20 Dec 2024 17:20:43 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
        Kevin Hilman
	<khilman@baylibre.com>
Subject: Re: [PATCH v4 2/4] firmware: ti_sci: Partial-IO support
Message-ID: <20241220115043.qhjroeqc4gl3pwtz@lcpd911>
References: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
 <20241219-topic-am62-partialio-v6-12-b4-v4-2-1cb8eabd407e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241219-topic-am62-partialio-v6-12-b4-v4-2-1cb8eabd407e@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_035055_114787_8296BF76 
X-CRM114-Status: GOOD (  34.65  )
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

On Dec 19, 2024 at 21:02:13 +0100, Markus Schneider-Pargmann wrote:
> Add support for Partial-IO poweroff. In Partial-IO pins of a few

Maybe add a comma after the In partial-IO, a few pins in this SOC can generate....

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
> The possible wakeup devices are found by checking which devices have the
> "poweroff" in the list of wakeup-source power states. Only devices that
> are actually enabled by the user will be considered as an active wakeup
> source. If none of the wakeup sources is enabled the system will do a
> normal poweroff. If at least one wakeup source is enabled it will
> instead send a TI_SCI_MSG_PREPARE_SLEEP message from the sys_off
> handler. Sending this message will result in an immediate shutdown of
> the system. No execution is expected after this point. The code will
> wait for 5s and do an emergency_restart afterwards if Partial-IO wasn't
> entered at that point.
> 
> A short documentation about Partial-IO can be found in section 6.2.4.5
> of the TRM at
>   https://www.ti.com/lit/pdf/spruiv7
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/firmware/ti_sci.c | 115 +++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/firmware/ti_sci.h |   5 ++
>  2 files changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index ec0c54935ac0d667323d98b86ac9d288b73be6aa..693ac816f8ba3941a9156bd39524099ca476d712 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3746,6 +3746,100 @@ static const struct dev_pm_ops ti_sci_pm_ops = {
>  #endif
>  };
>  
> +/*
> + * Enter Partial-IO, which disables everything including DDR with only a small
> + * logic being active for wakeup.
> + */
> +static int tisci_enter_partial_io(struct ti_sci_info *info)

Isn't the function naming style in the driver ti_sci_XXX ? You're
missing one `_` I guess

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
> +static bool tisci_canuart_wakeup_enabled(struct ti_sci_info *info)

Add some documentation around this please.

> +{
> +	struct device_node *wakeup_node = NULL;
> +
> +	for (wakeup_node = of_find_node_with_property(NULL, "wakeup-source");
> +	     wakeup_node;
> +	     wakeup_node = of_find_node_with_property(wakeup_node, "wakeup-source")) {
> +		struct platform_device *pdev;
> +		int index;
> +
> +		index = of_property_match_string(wakeup_node, "wakeup-source", "poweroff");
> +		if (index < 0)
> +			continue;

Doesn't the fact that we're inside the for loop already ensure this is > 0?

> +
> +		pdev = of_find_device_by_node(wakeup_node);
> +		if (!pdev)
> +			break;

Same here? Would we otherwise be in the loop?
Just having a quick look here, I could be wrong, please just check once.



-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

