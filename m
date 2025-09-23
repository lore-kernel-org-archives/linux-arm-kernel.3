Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFC9CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 16:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJcruCH6XoSNzPnMDJvnMg+i+F+BRa7zsNFJoSCnbPA=; b=rLZlJKfm04KWj1Qwv7Dx1ftixN
	kGBM9OHTQRCcl8uqecxwC0GTPQKGeJ60h9SFnJNBdsAV5+7F4v5U1OeVXpYaBEKAIU/Mg5C3IUdI0
	VN8doR1gi2f8uMbJtTM4QBq+W+A/GI6lya0yNopgd6Yni1qQyRqqCwOBCe/1+HSnZzkx8jqTC3qqO
	QFVZZG71s0E8vnNuG/81rbGB/aFPq1hIaiAHpULhvFqkBXopIzFltIgDsAoXlabOktTcmKXufNnmO
	USUYF1wI1zLPilpdIhmpDx1vtpxeEeDQnSEgww6nhfd9HC1YFvMuyCpJhcj/Z49SvuPwx9lQYdgXU
	BnvIMTow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v162I-0000000EI1z-3UL8;
	Tue, 23 Sep 2025 16:38:38 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v162F-0000000EI0w-3X0j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 16:38:37 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58NGcUa61492431;
	Tue, 23 Sep 2025 11:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758645510;
	bh=pJcruCH6XoSNzPnMDJvnMg+i+F+BRa7zsNFJoSCnbPA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YHr0Vf0txVQdZp8u9bUIam+yhXkHmAsbYGzwzIgPIJraTtgtH9ERzm4Yl9CilZHfw
	 snziacI/qMaxsRKlhQNWZVCeIKmNqQoEcwBb7vIdzwTSM0pz1j5320mYgSlixn+Q7t
	 ciREmGu0IM6rx22xdMmz41Q2M8I1gHhgrz6iq6VY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58NGcT5u1793914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 11:38:29 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 11:38:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 11:38:29 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58NGcTqa340851;
	Tue, 23 Sep 2025 11:38:29 -0500
Date: Tue, 23 Sep 2025 11:38:29 -0500
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
Subject: Re: [PATCH v7 1/2] firmware: ti_sci: Support transfers without
 response
Message-ID: <20250923163829.icdyyjc6ifaajomi@uda0506412>
References: <20250812-topic-am62-partialio-v6-12-b4-v7-0-ac10865c2d87@baylibre.com>
 <20250812-topic-am62-partialio-v6-12-b4-v7-1-ac10865c2d87@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250812-topic-am62-partialio-v6-12-b4-v7-1-ac10865c2d87@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_093835_970307_DF959AB0 
X-CRM114-Status: GOOD (  22.30  )
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

On 11:19-20250812, Markus Schneider-Pargmann wrote:
> Check the header flags if an response is expected or not. If it is not
> expected skip the receive part of ti_sci_do_xfer(). This prepares the
> driver for one-way messages as prepare_sleep for Partial-IO.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/firmware/ti_sci.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index ae5fd1936ad322e5e3a94897cc042f6548f919e6..c187fb714b3a4c658d0593c844716d4b160e4fa9 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -398,6 +398,9 @@ static void ti_sci_put_one_xfer(struct ti_sci_xfers_info *minfo,
>  static inline int ti_sci_do_xfer(struct ti_sci_info *info,
>  				 struct ti_sci_xfer *xfer)
>  {
> +	struct ti_sci_msg_hdr *hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
> +	bool response_expected = !!(hdr->flags & (TI_SCI_FLAG_REQ_ACK_ON_PROCESSED |
> +						  TI_SCI_FLAG_REQ_ACK_ON_RECEIVED));
>  	int ret;
>  	int timeout;
>  	struct device *dev = info->dev;
> @@ -409,12 +412,12 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
>  
>  	ret = 0;
>  
> -	if (system_state <= SYSTEM_RUNNING) {
> +	if (response_expected && system_state <= SYSTEM_RUNNING) {
>  		/* And we wait for the response. */
>  		timeout = msecs_to_jiffies(info->desc->max_rx_timeout_ms);
>  		if (!wait_for_completion_timeout(&xfer->done, timeout))
>  			ret = -ETIMEDOUT;
> -	} else {
> +	} else if (response_expected) {
>  		/*
>  		 * If we are !running, we cannot use wait_for_completion_timeout
>  		 * during noirq phase, so we must manually poll the completion.
> 
> -- 
> 2.50.1
>

Reviewed-by: Kendall Willis <k-willis@ti.com>

Best,
Kendall Willis

