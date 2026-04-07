Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D196EDB7CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRbB4QOtAa/uYrxe8tM7UcOku8nS2uXPrimd+3b5GkY=; b=tWLRsP79AOeT78TxAQeZk5fJKv
	2ZKmW7AavbSrkNwr09g5Apje/UiVNTN6EVT1aeU7eDyOsqn6y23ZGeKhXZPqYM4PkPm7GF6uICRjT
	hk+potTmcVVcP51R5Id0iAMqRNAChzVIXLyBT6Nt6QaTHqWIdlAcBsNquK3kKxamwmXuWjs9b32Le
	z383OLFzym6FyPqnGMg++v3C/YYPNHodq1nMkUL1L2TD1XMJ3nrAnRalCIhS+ZpqOWJYeiPxiPRZY
	myTLISfOebjRQxLR5e0buRtcgwvJod5+zsTWlclm5JvgPbiOsFgfkbZvrHgQ4+REprL6KDNm1jhnO
	rGru1euA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1m4-000000069GD-0W32;
	Tue, 07 Apr 2026 08:27:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1m3-000000069FA-1JkB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 07 Apr 2026 08:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MRbB4QOtAa/uYrxe8tM7UcOku8nS2uXPrimd+3b5GkY=; b=MkhK1M3vTL3N6azDILSQKCMO5g
	1VmA+o7RlGw4LN3gV5YIpp+Bz3A5JUxzerR8nbCekdHWrqIa9cn074aoJXmRjNCO1+GNXcb/FBz3q
	vRVBGGS666PL2nQn40wDO2FcRoQQWakZrP8fHHatL8btN22hKAQj4FI21jszWahPSfM2xDIRNQ+S2
	A9gbR85+0FUCbXmUgZUAMtFBNs90xHvrN0QkpxGsULUDUjgOuBigcPgmUcOwCU3Rr3MbVNpV6y/NC
	QyUlbYDjTV/JZ1VAqPil8DLbzFoFsP+b+1b69ohGSJ4O266mpblEzm0xPvJN5xK+Jf4022KPn7b8J
	o4kifQrQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lz-00000007pt8-0so2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:27:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wA1lq-0007on-3F; Tue, 07 Apr 2026 10:26:50 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wA1lp-00498b-2L;
	Tue, 07 Apr 2026 10:26:49 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wA1lp-0000000CxyR-2VYR;
	Tue, 07 Apr 2026 10:26:49 +0200
Date: Tue, 7 Apr 2026 10:26:49 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, dmaengine@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dmaengine: imx-sdma: Refine spba bus searching in
 probe
Message-ID: <6r7ih7wz7xn44c7c2ukohy3fgp3tpo222jh7ocxacccrvywz3i@mddoznil6way>
References: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407032755.2758049-1-shengjiu.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092659_401420_D2920009 
X-CRM114-Status: GOOD (  23.99  )
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

On 26-04-07, Shengjiu Wang wrote:
> There are multi spba-busses for i.MX8M* platforms, if only search for
> the first spba-bus in DT, the found spba-bus may not the real bus of
> audio devices, which cause issue for sdma p2p case, as the sdma p2p
> script presently does not deal with the transactions involving two devices
> connected to the AIPS bus.
> 
> Search the SDMA parent node first, which should be the AIPS bus, then
> search the child node whose compatible string is spba-bus under that AIPS
> bus for the above multi spba-busses case.

Sorry but I've to NACK this, I already fixed it in a more robust way by
checking the consumer sdma node.

Regards,
  Marco


> Fixes: 8391ecf465ec ("dmaengine: imx-sdma: Add device to device support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - add fixes tag
> - use __free(device_node) for auto release.
> 
>  drivers/dma/imx-sdma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
> index 3d527883776b..36368835a845 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -2364,7 +2364,9 @@ static int sdma_probe(struct platform_device *pdev)
>  			return dev_err_probe(&pdev->dev, ret,
>  					     "failed to register controller\n");
>  
> -		spba_bus = of_find_compatible_node(NULL, NULL, "fsl,spba-bus");
> +		struct device_node *sdma_parent_np __free(device_node) = of_get_parent(np);
> +
> +		spba_bus = of_get_compatible_child(sdma_parent_np, "fsl,spba-bus");
>  		ret = of_address_to_resource(spba_bus, 0, &spba_res);
>  		if (!ret) {
>  			sdma->spba_start_addr = spba_res.start;
> -- 
> 2.34.1
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

