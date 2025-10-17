Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB59CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8m6taM491uP0FsDlTtYUPfXtmugRJOSW2Zs1Du/eyW0=; b=wI2GYPL+/YLEPwg1Sr+xy0eElP
	ttGqJgSwn4mWNVn/HoQoamd3MAk9oTYfgBLXbTCgdwNAtPiORHTY+IAnOmV5sYuuAfdkFRXsy8JG2
	LNmeKo+uGkCPLyfCflmmUFhjEizbfRKlzolFVFq3CYt3z8qrHKBvcWLVY4eL6sghsni7qK2gCmspg
	x2gtcqkK0MnDASaD61G1Do93zraYO39lopI0bNA59GEASu13zYTbrKzjBvYVGKcrauD5LsMkoDUyW
	CtLwrSPan+3N8s/E5tgi8IzmWNb/f5FlQFztVgpJHx1fuiN+kImQNyu4DnI5UE9Rrmc6TKlF6FJ3s
	iOLbkgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9m67-00000008DfH-2XMJ;
	Fri, 17 Oct 2025 15:10:27 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9m65-00000008Det-0vUT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:10:26 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cp7T06X0Yz6M4KG;
	Fri, 17 Oct 2025 23:06:44 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 2F42D1402FF;
	Fri, 17 Oct 2025 23:10:17 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Oct
 2025 16:10:16 +0100
Date: Fri, 17 Oct 2025 16:10:14 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <sudeep.holla@arm.com>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <d-gole@ti.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH 03/10] firmware: arm_scmi: Allow protocols to register
 for notifications
Message-ID: <20251017161014.0000347c@huawei.com>
In-Reply-To: <20250925203554.482371-4-cristian.marussi@arm.com>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
	<20250925203554.482371-4-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_081025_567147_D81EDFAC 
X-CRM114-Status: GOOD (  18.44  )
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

On Thu, 25 Sep 2025 21:35:47 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols themselves to register for their own notifications and
> providing their own notifier callbacks. While at that, allow for a protocol
> to register events with compilation-time unknown report/event sizes: such
> events will use the maximum transport size.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Hi Cristian,

A few drive by comments...

> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index 78e9e27dc9ec..3e623c14745d 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -593,7 +593,12 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
>  	if (!r_evt)
>  		return -EINVAL;
>  
> -	if (len > r_evt->evt->max_payld_sz) {
> +	/* Events with a zero max_payld_sz are sized to be of the maximum
Local multiline comment syntax seems to be
	/*
	 * Events...

> +	 * size allowed by the transport: no need to be size-checked here
> +	 * since the transport layer would have already dropped such
> +	 * over-sized messages.
> +	 */
> +	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {

> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
> index d62c4469d1fd..2e40a7bb5b01 100644
> --- a/drivers/firmware/arm_scmi/protocols.h
> +++ b/drivers/firmware/arm_scmi/protocols.h
> @@ -161,8 +161,13 @@ struct scmi_proto_helpers_ops;
>   * @dev: A reference to the associated SCMI instance device (handle->dev).
>   * @xops: A reference to a struct holding refs to the core xfer operations that
>   *	  can be used by the protocol implementation to generate SCMI messages.
> + * @hops: A reference to a struct holding refs to the common helper operations
> + *	  that can be used by the protocol implementation.

@hops isn't added in this patch so either it should be handled in where it was
added, or if that was missed a precursor patch to this one.

>   * @set_priv: A method to set protocol private data for this instance.
>   * @get_priv: A method to get protocol private data previously set.
> + * @notifier_register: A method to register interest for notifications from
> + *		       within a protocol implementation unit: notifiers can
> + *		       be registered only for the same protocol.
>   *
>   * This structure represents a protocol initialized against specific SCMI
>   * instance and it will be used as follows:
> @@ -182,6 +187,9 @@ struct scmi_protocol_handle {
>  	int (*set_priv)(const struct scmi_protocol_handle *ph, void *priv,
>  			u32 version);
>  	void *(*get_priv)(const struct scmi_protocol_handle *ph);
> +	int (*notifier_register)(const struct scmi_protocol_handle *ph,
> +				 u8 evt_id, const u32 *src_id,
> +				 struct notifier_block *nb);
>  };
>  
>  /**


