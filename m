Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621FAD5CC9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0Q0NHRej2coWnmexPznhuNwYovVzP2Rt/Szk2eDAPg=; b=4fnjujbGNdM8WvBMHOEBjQZaQe
	eHyoJRqSRvoBfzDMa6ufFxt3yVTtYfFUszTuh6LJTI4WllNx7FBn0vKaoN3ULyNUdzWeIq3r1lON4
	AYFvi+VaIrtxliGlLpP4PevToDdwwCCPeEWAAJDesKtN+/iECWKQ9SYws/mySGw4vnCN7CP+iudRx
	OeYjRokhpFAr8dvIrOpHppE9NDrhr3kbsdy8fWvWk7ewFMoTLohvwd12gvA+zpV5KWYnL3y/Yfd09
	wNUPA0fjFQpr5sbRItewcQtU+iykUN1jqiVxM5ui+vdnsBG3G7RBTsDtbJgiePIW8tMaBdFykZxHV
	I6/Nv41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66yM-000000009y9-0z5z;
	Wed, 30 Oct 2024 11:34:46 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66Vm-000000004bZ-2Dxs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730286314; x=1761822314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W0Q0NHRej2coWnmexPznhuNwYovVzP2Rt/Szk2eDAPg=;
  b=cx6upxl2sM56FW65tLbhvDyh1zX0Yxh2tNNUEhLzm3XISAQcCOZ5ukzj
   w+YBSawDu/alNDdcWBgd6XsmzO2ZN33Y91hHfkY9rspFlLEoxd+tKmOVC
   lkpiaH3QcI6tBSGNBMRRdjeaGrL2kvfGxJ6aFLiiX9lmHAB5ttPPZ8XbO
   Rhnj/AK7Qh7SJnM4dqZVuKa/OhqlWqmOF1b/7Z+QXYfq3z7MwR46ap067
   4euQ42xGZnjBew1/6rQWcICIqNwJ5FdYAV4qV53daaCxRJR4eAch79JNt
   YKpPxL/ilqcMpQKiIjB5cc+cXkmrbXzO9vb4y1/Ln4f8cTY7dTM7TugGn
   Q==;
X-CSE-ConnectionGUID: LpTo4fn5RuqVpbEi9f2Gfg==
X-CSE-MsgGUID: WcNd3tbQQCGYpjlYkklPDw==
X-IronPort-AV: E=Sophos;i="6.11,245,1725314400"; 
   d="scan'208";a="39761269"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Oct 2024 12:05:12 +0100
X-CheckPoint: {672212E8-E-86C05612-CA75E1CA}
X-MAIL-CPID: 7D52A97F582B8EE47DF0C31390848B71_1
X-Control-Analysis: str=0001.0A682F1E.672212E8.007C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D24E8169682;
	Wed, 30 Oct 2024 12:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730286307;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W0Q0NHRej2coWnmexPznhuNwYovVzP2Rt/Szk2eDAPg=;
	b=pZF8oJmYsgoYihk9OobiizHKp5cvTF5FYVU9STIJjs14/bk/4KRTuXYWQSwZ0kHzNGSlZP
	7GZSX0ZPvYFsv7TkrF2IH58VOkvEfwZWfvpG9ACqdY2jH7PYhN6ZY62X70NaN9GAGQwZ6J
	lm2Oke6KjYJz6wBomtbo/sXAH9DecuVvaF2SXk3wYhbemwDxdG/XqT2g9EMfxTRNq39wHE
	tHtdK04zEUx5U/R2xZJcS070U9AWHY4zHH0r6y/f1IAB0m27luiDaX+QianowEiybXxk6e
	8pwNVfgdxu8aso8Y+jSLGGy1WhKXz3FaQgDO1PaLKIWgSrOUuF54OhA6f0OhMw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: wahrenst@gmx.net, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, alice.guo@oss.nxp.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
Subject: Re: [PATCH v3] soc: imx: Add SoC device register for i.MX9
Date: Wed, 30 Oct 2024 12:05:04 +0100
Message-ID: <2964906.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
References: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_040515_091177_54A58890 
X-CRM114-Status: GOOD (  26.32  )
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

Am Mittwoch, 30. Oktober 2024, 10:13:36 CET schrieb alice.guo@oss.nxp.com:
> From: "alice.guo" <alice.guo@nxp.com>
>=20
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
>=20
> Signed-off-by: alice.guo <alice.guo@nxp.com>

I was able to successfully this on two boards:

$ grep . /sys/bus/soc/devices/soc0/* 2> /dev/null=20
/sys/bus/soc/devices/soc0/family:Freescale i.MX
/sys/bus/soc/devices/soc0/machine:TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA o=
n MBa93xxCA starter kit
/sys/bus/soc/devices/soc0/revision:1.1
/sys/bus/soc/devices/soc0/serial_number:3d0f41f05242fc17baca88b84febf6de
/sys/bus/soc/devices/soc0/soc_id:i.MX93

$ grep . /sys/bus/soc/devices/soc0/* 2> /dev/null=20
/sys/bus/soc/devices/soc0/family:Freescale i.MX
/sys/bus/soc/devices/soc0/machine:TQ-Systems i.MX95 TQMa95xxSA on MB-SMARC-2
/sys/bus/soc/devices/soc0/revision:1.1
/sys/bus/soc/devices/soc0/serial_number:64955bc2d946b9c3f11984a9522b2822
/sys/bus/soc/devices/soc0/soc_id:i.MX95

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thanks
Alexander
> ---
>=20
> Changes for v2:
>  - refine error log print
> Changes for v3:
>  - return -EINVAL when arm_smccc_smc failed
>  - fix the build warning caused by pr_err("%s: SMC failed: %d\n", __func_=
_, res.a0);
>  - drop the pr_err in imx9_soc_init
>  - free the memory in the reverse order of allocation
>  - use of_match_node instead of of_machine_is_compatible
>=20
>  drivers/soc/imx/Makefile   |   2 +-
>  drivers/soc/imx/soc-imx9.c | 106 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 107 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/imx/soc-imx9.c
>=20
> diff --git a/drivers/soc/imx/Makefile b/drivers/soc/imx/Makefile
> index 3ad321ca608a..ca6a5fa1618f 100644
> --- a/drivers/soc/imx/Makefile
> +++ b/drivers/soc/imx/Makefile
> @@ -3,4 +3,4 @@ ifeq ($(CONFIG_ARM),y)
>  obj-$(CONFIG_ARCH_MXC) +=3D soc-imx.o
>  endif
>  obj-$(CONFIG_SOC_IMX8M) +=3D soc-imx8m.o
> -obj-$(CONFIG_SOC_IMX9) +=3D imx93-src.o
> +obj-$(CONFIG_SOC_IMX9) +=3D imx93-src.o soc-imx9.o
> diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
> new file mode 100644
> index 000000000000..823395584533
> --- /dev/null
> +++ b/drivers/soc/imx/soc-imx9.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>
> +
> +#define IMX_SIP_GET_SOC_INFO	0xc2000006
> +#define SOC_ID(x)		(((x) & 0xFFFF) >> 8)
> +#define SOC_REV_MAJOR(x)	((((x) >> 28) & 0xF) - 0x9)
> +#define SOC_REV_MINOR(x)	(((x) >> 24) & 0xF)
> +
> +static int imx9_soc_device_register(void)
> +{
> +	struct soc_device_attribute *attr;
> +	struct arm_smccc_res res;
> +	struct soc_device *sdev;
> +	u32 soc_id, rev_major, rev_minor;
> +	u64 uid127_64, uid63_0;
> +	int err;
> +
> +	attr =3D kzalloc(sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		return -ENOMEM;
> +
> +	err =3D of_property_read_string(of_root, "model", &attr->machine);
> +	if (err) {
> +		pr_err("%s: missing model property: %d\n", __func__, err);
> +		goto attr;
> +	}
> +
> +	attr->family =3D kasprintf(GFP_KERNEL, "Freescale i.MX");
> +
> +	/*
> +	 * Retrieve the soc id, rev & uid info:
> +	 * res.a1[31:16]: soc revision;
> +	 * res.a1[15:0]: soc id;
> +	 * res.a2: uid[127:64];
> +	 * res.a3: uid[63:0];
> +	 */
> +	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 !=3D SMCCC_RET_SUCCESS) {
> +		pr_err("%s: SMC failed: 0x%lx\n", __func__, res.a0);
> +		err =3D -EINVAL;
> +		goto family;
> +	}
> +
> +	soc_id =3D SOC_ID(res.a1);
> +	rev_major =3D SOC_REV_MAJOR(res.a1);
> +	rev_minor =3D SOC_REV_MINOR(res.a1);
> +
> +	attr->soc_id =3D kasprintf(GFP_KERNEL, "i.MX%2x", soc_id);
> +	attr->revision =3D kasprintf(GFP_KERNEL, "%d.%d", rev_major, rev_minor);
> +
> +	uid127_64 =3D res.a2;
> +	uid63_0 =3D res.a3;
> +	attr->serial_number =3D kasprintf(GFP_KERNEL, "%016llx%016llx", uid127_=
64, uid63_0);
> +
> +	sdev =3D soc_device_register(attr);
> +	if (IS_ERR(sdev)) {
> +		err =3D PTR_ERR(sdev);
> +		pr_err("%s failed to register SoC as a device: %d\n", __func__, err);
> +		goto serial_number;
> +	}
> +
> +	return 0;
> +
> +serial_number:
> +	kfree(attr->serial_number);
> +	kfree(attr->revision);
> +	kfree(attr->soc_id);
> +family:
> +	kfree(attr->family);
> +attr:
> +	kfree(attr);
> +	return err;
> +}
> +
> +static const struct of_device_id imx9_soc_match[] =3D {
> +	{ .compatible =3D "fsl,imx93", },
> +	{ .compatible =3D "fsl,imx95", },
> +	{ }
> +};
> +
> +static int __init imx9_soc_init(void)
> +{
> +	int ret;
> +
> +	/* No match means it is not an i.MX 9 series SoC, do nothing. */
> +	if (!of_match_node(imx9_soc_match, of_root))
> +		return 0;
> +
> +	ret =3D imx9_soc_device_register();
> +
> +	return ret;
> +}
> +device_initcall(imx9_soc_init);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP i.MX9 SoC");
> +MODULE_LICENSE("GPL");
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



