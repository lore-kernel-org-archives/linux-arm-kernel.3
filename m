Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AD9E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 06:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9ie33h2U4+ognYyH3hPVrZ4Is8o1KHLTR8JXNr8du0=; b=tMxvoP8VpNk+azYSPrBwHyqB0d
	6dNy0tjvpidOOZ6XH7g9dx6lsnN/+4vLbhFBSenFStNmV5PRa5SwTx1BYK4AGJXqoB/yXqnIInnDp
	AgM7KFujP+UFTq0Nz0aTCwL6Euv9hlruJNiL3q+qiuvLqCwcZNT4/mN57Qa7C8CXHVTMU3PXtd9UZ
	toW2E43Ylc7QE16vKWEmuflsPlq4oAsJwZRhZFDt2nvKPYt21KomztFxdkePfmhrkR0buq7Tdwe7H
	VQxodiDzbzoiwQoq5r19crJaaaeheok1d/4VeAscvbmIV5p6S+uC33jil3b4SgvN+gkalI3bTul1C
	/d0nnM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9dF-00000000wCH-3WN2;
	Thu, 19 Dec 2024 06:03:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO9c9-00000000w5n-1ld5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 06:02:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9c2-0000r0-PE; Thu, 19 Dec 2024 07:02:18 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9c1-0049eU-1p;
	Thu, 19 Dec 2024 07:02:18 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tO9c2-008N4g-0k;
	Thu, 19 Dec 2024 07:02:18 +0100
Date: Thu, 19 Dec 2024 07:02:18 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: andi.shyti@kernel.org, frank.li@nxp.com, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: switch different pinctrl state in different
 system power status
Message-ID: <Z2O26jWagFtsWJd8@pengutronix.de>
References: <20241218044114.143358-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218044114.143358-1-carlos.song@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_220225_456691_48DB1B9E 
X-CRM114-Status: GOOD (  19.84  )
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

On Wed, Dec 18, 2024 at 12:41:14PM +0800, Carlos Song wrote:
> Switch different pinctrl state in different system power status.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change for V2:
> - Add Frank reviewed-by. No code change.
> ---
>  drivers/i2c/busses/i2c-imx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index b6ed270dd04b..350346a7892c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1871,6 +1871,7 @@ static int i2c_imx_runtime_suspend(struct device *dev)
>  	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
>  
>  	clk_disable(i2c_imx->clk);
> +	pinctrl_pm_select_sleep_state(dev);
>  
>  	return 0;
>  }
> @@ -1880,6 +1881,7 @@ static int i2c_imx_runtime_resume(struct device *dev)
>  	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
>  	int ret;
>  
> +	pinctrl_pm_select_default_state(dev);

Both pinctrl_pm_select_sleep_state() and
pinctrl_pm_select_default_state() may fail. Please use return values.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

