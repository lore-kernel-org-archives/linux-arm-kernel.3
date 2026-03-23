Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD77FC72A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foORgteAPlfrIAS1ba1QdpFRcnbJ/IN133dyq0cl3iU=; b=xOvV/QSW2X9A7JML6p7RRC7e1o
	zvxu2uF19bwlnn/JPkGM6SSKu+H72cdIkxqp/xEpApj9/qBHpLDnTxHrOEu8IS0TdGOhbBfS5EwRm
	tazKWnXkYRLJDT7kyqOosoLVU+jzGLMMELWzFkgpWD+2ZLa1tFDLMFAG/5mTwiYd/BOOT8G9nr5ae
	9W0oF89/ED2Ha+JnWTwX0FcvmI18dqTR0Gio9XbqG0ppfCKfcwT0wPBBOZjBDmQD2XhvF/UtWg1fx
	p+gsSi3XHvJIJTXzuhdWwf+MQlhl72iP6AA1ySIQRAI6rvk0aNDlSCQHL7XFPMnJTFRJEuW3w279a
	TDRIexpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Zgp-0000000GC4R-0bAk;
	Mon, 23 Mar 2026 07:27:07 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Zgk-0000000GBzs-1yN9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=foORgteAPlfrIAS1ba1QdpFRcnbJ/IN133dyq0cl3iU=; b=R0hPVjz/e4re407HofT8dGEi1i
	3JQFkXx9UO3s9OlU19vdAjXPHEUcBzvdyiBPi3DsLnMUCj9uOVolF6dMKHg5ofWtTd1S1/g65GYA0
	bTUmFtRmprxRn8aON9G+L2Rws5xyEd/NkeZSCXRLAUfcPgsoMVHlTQZyiXaZVRhC1zOegPlo/iW3Z
	d/liLWIOX6ww6cXhLLmsDBL0UeG8/+mGp7VPpE/Q3CuMTKazScNmAjIkVDNJJEItjcHdrFUR5oNfP
	sog5+bH2+knmqkgqP4jQ7fxHYpymAa1Z5a2dJbVWA7/ss/yw7vI80ZLEOadk7aEOl5i2ASn5wrvat
	VpK0VGpg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4Zga-000OD6-1i;
	Mon, 23 Mar 2026 08:26:52 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w4Zg2-000N2t-2c;
	Mon, 23 Mar 2026 08:26:52 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shenwei Wang <shenwei.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Date: Mon, 23 Mar 2026 08:26:51 +0100
Message-ID: <2826794.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260320193150.2508850-1-shenwei.wang@nxp.com>
References: <20260320193150.2508850-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27948/Sun Mar 22 07:24:25 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_002702_628725_092D4C36 
X-CRM114-Status: GOOD (  20.29  )
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

Am Freitag, 20. M=E4rz 2026, 20:31:50 CET schrieb Shenwei Wang:
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad wakeup
> trigger due to a hardware bug in the detection logic. Since the hardware
> does not support Both Edge wakeup, remap requests for Both Edge to Rising
> Edge by default to avoid hitting this issue.
>=20
> A warning is emitted when Falling Edge is selected on i.MX8QM.
>=20
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x platforms")
> cc: stable@vger.kernel.org
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Changes in V2:
>   - add a check for i.mx8qm and emit a warning when Falling Edge is
>     selected.
>=20
>  drivers/gpio/gpio-mxc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index d7666fe9dbf8..095bcfbc56e0 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -584,12 +584,13 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio=
_port *port, bool enable)
>  	unsigned long config;
>  	bool ret =3D false;
>  	int i, type;
> +	bool is_imx8qm =3D of_device_is_compatible(port->dev->of_node, "fsl,imx=
8qm-gpio");
>=20
>  	static const u32 pad_type_map[] =3D {
>  		IMX_SCU_WAKEUP_OFF,		/* 0 */
>  		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_RISING */
>  		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_FALLING */
> -		IMX_SCU_WAKEUP_FALL_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
> +		IMX_SCU_WAKEUP_RISE_EDGE,	/* IRQ_TYPE_EDGE_BOTH */
>  		IMX_SCU_WAKEUP_HIGH_LVL,	/* IRQ_TYPE_LEVEL_HIGH */
>  		IMX_SCU_WAKEUP_OFF,		/* 5 */
>  		IMX_SCU_WAKEUP_OFF,		/* 6 */
> @@ -604,6 +605,12 @@ static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_=
port *port, bool enable)
>  				config =3D pad_type_map[type];
>  			else
>  				config =3D IMX_SCU_WAKEUP_OFF;
> +
> +			if (is_imx8qm && config =3D=3D IMX_SCU_WAKEUP_FALL_EDGE) {
> +				dev_warn_once(port->dev, "No falling-edge support on i.MX8QM\n");

How about "No falling-edge support for wakeup on i.MX8QM"? Without
context this message in the kernellog is confusing.

Best regards,
Alexander

> +				config =3D IMX_SCU_WAKEUP_OFF;
> +			}
> +
>  			ret |=3D mxc_gpio_generic_config(port, i, config);
>  		}
>  	}
> --
> 2.43.0
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



