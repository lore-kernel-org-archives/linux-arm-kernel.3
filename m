Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107DE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5BuWukCG2nI77w+TMjN1WmznmMLHRams/Et+rV4HX0=; b=JdI/WMryfkwHVAwVW1iaYE7Da1
	RLip5gsHEvXEUh5HncFrIJZo3FBCfPKSP3SJZ5aT0m+EkNhxlw+8FhBLKDFavsQYKn5Gohne2srt5
	7QsIIJpcKpvqe2vy8kPCua4v65zVRCIGG9o30ZY5rugwnbOfxt0Tnzmus7YVNaKqofiPUQWaE+nBc
	S2MdkSuKz6QnV/4uWqNKdCwywzk5cx3YVRj6qI4D67qqn97tqEc2KCVa5EYhykh2H+OFEYNaQEomn
	/FmZg9Ix3oWP9R6WHO1aFM0uah4NFJjRZsP1IpBs+fL/kdvBsmcQ1+ybxdgbrsqHbKi7mr+zBQgrB
	a5ugrJ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObQ8-00000004oBa-1wuH;
	Fri, 20 Dec 2024 11:43:52 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObNm-00000004nnI-05Uk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:41:27 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKBfJgV152381
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 05:41:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734694880;
	bh=x5BuWukCG2nI77w+TMjN1WmznmMLHRams/Et+rV4HX0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IPms/HokTlrxIOx69z40U0s6dw1mkG+Wjwkc0yL5qlLPuAoFSFfpJeo54tKj+TCOt
	 MwCKdOQWW5ZHyYqT+YKvXKuvi27Z6u9vnhTsaL9W2SPMG0GI5+g9PLnAPdPejy86kk
	 Dc9GrCfF2cd0SOB5Tuv/K6gI+Kgbc6FqOOcveBiM=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BKBfJcg099797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Dec 2024 05:41:19 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 20
 Dec 2024 05:41:19 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 20 Dec 2024 05:41:19 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BKBfIXf050514;
	Fri, 20 Dec 2024 05:41:19 -0600
Date: Fri, 20 Dec 2024 17:11:18 +0530
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
Subject: Re: [PATCH v4 1/4] firmware: ti_sci: Support transfers without
 response
Message-ID: <20241220114118.uwi5bsefxnue46re@lcpd911>
References: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
 <20241219-topic-am62-partialio-v6-12-b4-v4-1-1cb8eabd407e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241219-topic-am62-partialio-v6-12-b4-v4-1-1cb8eabd407e@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_034126_226380_B3E7E4E4 
X-CRM114-Status: GOOD (  22.42  )
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

On Dec 19, 2024 at 21:02:12 +0100, Markus Schneider-Pargmann wrote:
> Check the header flags if an response is expected or not. If it is not
> expected skip the receive part of ti_sci_do_xfer(). This prepares the
> driver for one-way messages as prepare_sleep for Partial-IO.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/firmware/ti_sci.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 806a975fff22ae00ecb88587b2c47ba172120bc2..ec0c54935ac0d667323d98b86ac9d288b73be6aa 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -398,10 +398,13 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
>  static inline int ti_sci_do_xfer(struct ti_sci_info *info,
>  				 struct ti_sci_xfer *xfer)
>  {
> +	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;

I think it's best to sort this in order? so it will come below struct
device?

>  	int ret;
>  	int timeout;
>  	struct device *dev = info->dev;
>  	bool done_state = true;
> +	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
> +						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
>  
>  	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
>  	if (ret < 0)
> @@ -409,6 +412,9 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
>  
>  	ret = 0;
>  
> +	if (!response_expected)
> +		goto no_response;
> +

I am not a very big fan of using goto here, it feels like we should be
more clear in our implementation and make the else part below more
specific by using `else if` and checking for more specific SYSTEM_XX
states. Then based on POWEROFF, skip any polling or whatever wait for
response.
Infact, with that we may not even need the response_expected part, but I
am okay keeping both checks in place just for the clarity in design.

>  	if (system_state <= SYSTEM_RUNNING) {
>  		/* And we wait for the response. */
>  		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
> @@ -429,6 +435,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
>  		dev_err(dev, "Mbox timedout in resp(caller: %pS)\n",
>  			(void *)_RET_IP_);
>  

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

