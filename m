Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDBACA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFuXvB2UWggNbkHb7hidNwtHtVJzQl7qtjml68HfNqA=; b=For4eHRkmHsoXP
	ebV5/JPQ0c6IgzkTYYM01GGDcbdMllYRxMh8KCVbbaQPwbt9iuv3DPDfVEoyf6RaWUCrNRCn9qABN
	W4gzBEQoUvz2tMsKKQUzclQRc3zBXUP97cIkEw0RjWXZqBEowPr9XGNArvjw8/5JFNxC41kY6nSjc
	21T1f9fc77pT9phR+DPnB4m620q8gi7EX9cGlsR+RpkdPkBADxqUGc5qyOfcAQIp7TWhz2N3PjWAX
	uiqkOoVwAJ0J7G/ZIE+71K+l26pNgZ29/S/e/jZKD8TBmarXIV+I4KSyFXcQ3kL8lZ5bkeP4PZ72q
	52bm6jkzw9ustHfbKvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0uM-00000003R2t-1PSv;
	Fri, 15 Aug 2025 20:20:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzeh-00000003JCb-1kXl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 19:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1B2D5C66D4;
	Fri, 15 Aug 2025 18:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FB7C4CEEB;
	Fri, 15 Aug 2025 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755284398;
	bh=XFgdqlcF4w6JcQknFkuyLVCuivnPG7StN6tF26sMAY4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JKA1Htk0Vn8klSgNQ5+BvVD/T9TcDb70snLPG4jCD/orLjAXrzx0xUz7AxM9Wp46j
	 h7/iUiJQ9WdT2tnY4EPirct5e+PErV6hq4WNoRgMDWjOjsLIRtZdPY6phvXs2d/jpG
	 MkEKJrZm+wfMMQoTPF5oxotCJ9Cxfr4W1nvAgL+BJa16bav51S2wHCErtdCje+JBFG
	 Zh3spCW8Dj9s0UnrtBtMABB2VXWbcfIkprqMAaJfjlDD6jzKHz8gJGi02fbq3I2XOB
	 Ljr90FRYb/7kW0lJv0FPYx371wa2uy/UqVMPWroDyhS9u+SO81Gsykz6kGp2Nmief6
	 WXvgJLcvfPI1A==
Date: Fri, 15 Aug 2025 11:59:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v13 4/5] net: ti: prueth: Adds link detection,
 RX and TX support.
Message-ID: <20250815115956.0f36ae06@kernel.org>
In-Reply-To: <20250812133534.4119053-5-parvathi@couthit.com>
References: <20250812110723.4116929-1-parvathi@couthit.com>
	<20250812133534.4119053-5-parvathi@couthit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_115959_501107_4739B17F 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: pratheesh@ti.com, vigneshr@ti.com, praneeth@ti.com, edumazet@google.com, glaroque@baylibre.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, saikrishnag@marvell.com, m-karicheri2@ti.com, bastien.curutchet@bootlin.com, mohan@couthit.com, jacob.e.keller@intel.com, pabeni@redhat.com, s.hauer@pengutronix.de, devicetree@vger.kernel.org, conor+dt@kernel.org, alok.a.tiwari@oracle.com, richardcochran@gmail.com, johan@kernel.org, prajith@ti.com, rogerq@kernel.org, basharath@couthit.com, ssantosh@kernel.org, vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, kory.maincent@bootlin.com, m-malladi@ti.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, horms@kernel.org, krishna@couthit.com, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 12 Aug 2025 19:04:19 +0530 Parvathi Pudi wrote:
> +static irqreturn_t icssm_emac_rx_packets(struct prueth_emac *emac, int quota)

Please stick to calling the budget budget rather than synonym terms
like "quota". Makes it harder to review the code.

> +	/* search host queues for packets */
> +	for (i = start_queue; i <= end_queue; i++) {
> +		queue_desc = emac->rx_queue_descs + i;
> +		rxqueue = &queue_infos[PRUETH_PORT_HOST][i];

budget can be 0, in which case the driver is not supposed to process
Rx, just Tx (if the NAPI instance is used to serve completions).

> +	num_rx_packets = icssm_emac_rx_packets(emac, budget);
> +	if (num_rx_packets < budget) {
> +		napi_complete_done(napi, num_rx_packets);

don't ignore the return value of napi_complete_done()
-- 
pw-bot: cr

