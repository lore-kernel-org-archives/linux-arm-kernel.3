Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ED2EEF316
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdvhvZ4bHSo/yG9FNjUp1pK4DykQel3I0Di4UK28igI=; b=J5WovX9BOyuD4oRej9gEMyZCwX
	iN6j/vb8Bq5xmuXuZlPOE6ggRvKPVAF1CG/Cl2qoGJkwb+/UD+N6ClBH3WU56I/ExK8BxutGu3n1m
	dxcM/SsprLzOwJ+MspzMm4bf7A8RkpTMmCeAJyr7XeuNViO9oiWtnupvl+iegXUzk4AhHl8HrDlm1
	2/6ZMBqggRQXG5nyO1SmV4UW38Npgak7GBFN0TBeknXAP6WUmxEjlx+awKRwTRtyiG8MJZAVu/9MB
	CJHmlFGTi+xqi5dm6ohvio03ZgDfemLda+KLu6u0gfXUnVZVojsxZQXZQR3gjV4NPtx/wTVnZJXM+
	nSn+DXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3OA-000000016bi-0s1V;
	Thu, 05 Mar 2026 07:44:54 +0000
Received: from mx-relay09-hz2.antispameurope.com ([83.246.65.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3O5-000000016as-3VfS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:44:53 +0000
ARC-Authentication-Results: i=1; mx-gate09-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OdvhvZ4bHSo/yG9FNjUp1pK4DykQel3I0Di4UK28igI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772696677;
 b=ot9kXfmWWRcovwX7q2KPmhEy97PAE8MNUOKY9xK3zXFjI2PJQ0pnt0V1CNvRt5EHeAGXhqrr
 v+b5DbWEMHafQqF3s9NbWyTWvv9VinN4Sa8dYFcZ9jXK16wwprjKUErXNuqDRUkIG7wM2emWkqz
 5eOaeEb9ZtTsAChXuMNCf+bw/+zEPnx6MUxrKJgrmtZ654ITRTTaQ5kBHLhhIurDd+cDnPlRA2g
 bX9l/Xby7o+cFLpV4eF6tLfALhs3et9xEE5bWYglQvxswO1sRQOOZZQlKL1CGwjKuGZupK1Lq9u
 yHXMMh8/J/HfMtPK1IEYZmvy1w+/pCmsOkSemy0fbBc8Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772696677;
 b=nNtgJcHYzG+KYZww+te5J0KJQ52D38HyD86CZc2u4XNiXljxaGBkgYSB33QkLlznA0IKT+kL
 tldWF0Dt2NbHiU3S0TXrdFisWMrJx76FFs3uM43k7NCA9uY02gOukTEVndyFO+qcZDnyBqQjTgT
 z1+1aSD1GanoukkM8XF8R0vCX1iD0NH5djzX8VLgdYUOSFoU+spxPaAUurCpsJfs+XYj0xx83FM
 n9nAuE9SzzHS83Gid4pR4KaHtupVz/GozbX3U2v58X9OV5DEdaXeNw38K0azW2QK6I2d/3Ht3Xh
 CW+yn+/YLmeu1U+RXbTC/kuJc2ntfZ5361Xnm9JhaPRwQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay09-hz2.antispameurope.com;
 Thu, 05 Mar 2026 08:44:37 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A6767CC0E88;
	Thu,  5 Mar 2026 08:44:26 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Print boot/shutdown reasons
Date: Thu, 05 Mar 2026 08:44:26 +0100
Message-ID: <24409695.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
References: <20260305-scmi-imx-reset-v1-0-18de78978ba9@nxp.com>
 <20260305-scmi-imx-reset-v1-2-18de78978ba9@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay09-hz2.antispameurope.com with 4fRM4W2hZhz20nLZ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 135cf0209f1aa8681b8239cf7f35b7f4
X-cloud-security: scantime:1.604
DKIM-Signature: a=rsa-sha256;
 bh=OdvhvZ4bHSo/yG9FNjUp1pK4DykQel3I0Di4UK28igI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772696676; v=1;
 b=Vt4GYgpeCBHekuAtGGbaUu6uOEXX97MW2NMN4FhggKNtQ4CseFFR7Pc5oIa3DdDxNRqkbju1
 LY2l0RKIW+jPYWcXJV/ndl6vjgLx/Qi1piMPF8VDqx0AMF0bIGijxT/Hxq0Pgy0GzySjuaw+l7X
 AwxBCB8qQGCyHIesSTAZMGhe+X1I8aCXKN74j2G37ukR7bNW+ofIZHUcTSvLHfGRaVfVN9CtH7p
 w3vAEn1KBe5bbUsYlMezIWWWobf4clqgbnI95twpLH+bzIA7/uXfro6MKI7E63hjnxVF4ndFweH
 NPhi5oKL4Rqf/+mM0Vk3oUgIdBzpP6fnQ1Oyl/fxPDAvg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_234450_145882_4B7F33E4 
X-CRM114-Status: GOOD (  21.72  )
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

Hi,

Am Donnerstag, 5. M=E4rz 2026, 02:56:45 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Add reset reason string table for i.MX95 and introduce a helper
> (scmi_imx_misc_get_reason) to query and print both system and LM
> (Logical Machine) reset reasons via the SCMI MISC protocol.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/sm-misc.c | 73 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 73 insertions(+)
>=20
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-mis=
c.c
> index 0a8ada329c9de3c1627da241bf142fa91a8085d7..16b5ff833d21274403a4c55ab=
e2fa1f49fce3e73 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -18,6 +18,29 @@ static const struct scmi_imx_misc_proto_ops *imx_misc_=
ctrl_ops;
>  static struct scmi_protocol_handle *ph;
>  struct notifier_block scmi_imx_misc_ctrl_nb;
> =20
> +static const char * const rst_imx95[] =3D {
> +	"cm33_lockup", "cm33_swreq", "cm7_lockup", "cm7_swreq", "fccu",
> +	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
> +	"wdog5", "jtag", "cm33_exc", "bbm", "sw", "sm_err", "fusa_sreco",
> +	"pmic", "unused", "unused", "unused", "unused", "unused", "unused",
> +	"unused", "unused", "unused", "unused", "unused", "por",
> +};
> +
> +static const char * const rst_imx94[] =3D {
> +	"cm33_lockup", "cm33_swreq", "cm70_lockup", "cm70_swreq", "fccu",
> +	"jtag_sw", "ele", "tempsense", "wdog1", "wdog2", "wdog3", "wdog4",
> +	"wdog5", "jtag", "wdog6", "wdog7", "wdog8", "wo_netc", "cm33s_lockup",
> +	"cm33s_swreq", "cm71_lockup", "cm71_swreq", "cm33_exc", "bbm", "sw",
> +	"sm_err", "fusa_sreco", "pmic", "unused", "unused", "unused", "por",
> +};
> +
> +static const struct of_device_id allowlist[] =3D {
> +	{ .compatible =3D "fsl,imx952", .data =3D rst_imx95 },
> +	{ .compatible =3D "fsl,imx95", .data =3D rst_imx95 },
> +	{ .compatible =3D "fsl,imx94", .data =3D rst_imx94 },
> +	{ /* Sentinel */ }
> +};
> +
>  int scmi_imx_misc_ctrl_set(u32 id, u32 val)
>  {
>  	if (!ph)
> @@ -75,6 +98,54 @@ static void scmi_imx_misc_put(void *p)
>  	debugfs_remove((struct dentry *)p);
>  }
> =20
> +static int scmi_imx_misc_get_reason(struct scmi_device *sdev)
> +{
> +	struct scmi_imx_misc_reset_reason boot, shutdown;
> +	const char **rst;
> +	bool system =3D true;
> +	int ret;
> +
> +	if (!of_machine_device_match(allowlist))
> +		return 0;
> +
> +	rst =3D (const char **)of_machine_get_match_data(allowlist);
> +
> +	ret =3D imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdo=
wn, NULL);
> +	if (!ret) {
> +		if (boot.valid)
> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> +				 system ? "SYS" : "LM", rst[boot.reason],
> +				 boot.orig_valid ? boot.origin : -1,
> +				 boot.err_valid ? boot.errid : -1);
> +		if (shutdown.valid)
> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n=
",
> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> +				 shutdown.orig_valid ? shutdown.origin : -1,
> +				 shutdown.err_valid ? shutdown.errid : -1);
> +	} else {
> +		dev_err(&sdev->dev, "Failed to get system reset reason: %d\n", ret);
> +	}
> +
> +	system =3D false;
> +	ret =3D imx_misc_ctrl_ops->misc_reset_reason(ph, system, &boot, &shutdo=
wn, NULL);
> +	if (!ret) {
> +		if (boot.valid)
> +			dev_info(&sdev->dev, "%s Boot reason: %s, origin: %d, errid: %d\n",
> +				 system ? "SYS" : "LM", rst[boot.reason],
> +				 boot.orig_valid ? boot.origin : -1,
> +				 boot.err_valid ? boot.errid : -1);
> +		if (shutdown.valid)
> +			dev_info(&sdev->dev, "%s shutdown reason: %s, origin: %d, errid: %d\n=
",
> +				 system ? "SYS" : "LM", rst[shutdown.reason],
> +				 shutdown.orig_valid ? shutdown.origin : -1,
> +				 shutdown.err_valid ? shutdown.errid : -1);

Is there a way to query this from userspace programs instead of printing in=
to kernel log?

Best regards,
Alexander

> +	} else {
> +		dev_err(&sdev->dev, "Failed to get lm reset reason: %d\n", ret);
> +	}
> +
> +	return 0;
> +}
> +
>  static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  {
>  	const struct scmi_handle *handle =3D sdev->handle;
> @@ -133,6 +204,8 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_devic=
e *sdev)
>  	scmi_imx_dentry =3D debugfs_create_dir("scmi_imx", NULL);
>  	debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslo=
g_fops);
> =20
> +	scmi_imx_misc_get_reason(sdev);
> +
>  	return devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx=
_dentry);
>  }
> =20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



