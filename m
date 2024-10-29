Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3A2D3A66B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg0GIWTJ0gIBdn8bx3R5q/8K4ThtGbMW6yAW6haWnBg=; b=Qv+HC1Atw7HcGG59xBABJ0kbmw
	AWnYeIk12eTjNHFaQHwVLmyP9pfyC4PZ/1wZ4aptXNy0aFhWns1qQ4iUe2zJnObBMl3jpZSAsGcDP
	AnOmrKdrhbl9BuCUySC0YNSXjvF2/9pia9H9Of5k+JUZiLKLUkqOzwf+8eo0zZpKtXAMOdrx4WBhD
	q0JxULI/nE/+HXURatmFAu+9zTH8LnWJ5pzlmQIxjcnYOHPzaHI2ci6BqRjWtvvDgt24rKbNcWXfb
	HvOUTJnAnwFyR7kECQUX0hTNv97lkBra596xYdU2BABpWCUlsUTlceDgUhPhLQCnPivrMvxQYQCa0
	MrmOpIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nsn-0000000EqlB-2MiL;
	Tue, 29 Oct 2024 15:11:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5nf1-0000000EnXc-0Mt3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 14:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730213851; x=1761749851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zg0GIWTJ0gIBdn8bx3R5q/8K4ThtGbMW6yAW6haWnBg=;
  b=XJYXSb45GShqWtTGTIO1B86tzM+H9fLGo4oZ6n3neee6Ng4v0L5ZBpfB
   Uot2cN971PmcgycqhCR+0mA5CVXR0ASG1vrLulwbwTrFUlek3lW3ps+0X
   4teySpjj3GQ4T/ej3h2Qf8D5Jm+Ivh5cZx7rMfJYRLCFTgZfdMrbvr8Aw
   0pLs3wsY0aIgfUTiYOY5eX8xlIPztKB8y4cozAYWBJ1DB+oww9GN8RuYE
   20zEIOM3IgPtn78xg1HKNMHAhBY/7AoV4+IkEHiUuV7pkP7kSmCfLBn3J
   tVmBgZt7C9d3mU9qJ05JlWDBp/4xuLY90mkikcwNRefyH7P8Jb+I5HycG
   w==;
X-CSE-ConnectionGUID: J+1KD0e5Tpil280W5o0OnA==
X-CSE-MsgGUID: /P/YmSlgS0aH4y/spWe0Fg==
X-IronPort-AV: E=Sophos;i="6.11,241,1725314400"; 
   d="scan'208";a="39739781"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Oct 2024 15:57:26 +0100
X-CheckPoint: {6720F7D6-19-D31EDE1A-D52D6119}
X-MAIL-CPID: 29BC832677B656F5C80FE0DCDCDE5336_5
X-Control-Analysis: str=0001.0A682F21.6720F7EA.0044,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC81D167601;
	Tue, 29 Oct 2024 15:57:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730213842;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zg0GIWTJ0gIBdn8bx3R5q/8K4ThtGbMW6yAW6haWnBg=;
	b=NwJXQOdsTGo4c2vSDpaWSuQMTn6GA6GD31HGnKODdoiNAJnsKLOLEguB6E7ORDGoc+S5iv
	npo1+ZZ3SqMt7vr6yyfEtxDyK8mXqvwtqTZmjvwKZ6Z9xlnmRfxhPNQiCaDsF223FYn+gK
	F+5p1YEM0TlsygejfpV0AdXsRu+KItqAP1naD8RkcbKh50sJw6PB5aBkMHtzX4OXwbEAOp
	M6nEASrfpaE8VyBM5X/oGgBXmqFAh6JnZOlPzE4dvcPge/0pLamVJUo3MEo7bWgWS/cotG
	h0Tane3By8SrODsNB3RDTh7RHo/3Jmy3KO7aJk8f+hfft2p36B6JzVjNqzz7/A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: wahrenst@gmx.net, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>, alice.guo@oss.nxp.com
Subject: Re: [PATCH v2] soc: imx: Add SoC device register for i.MX9
Date: Tue, 29 Oct 2024 15:57:20 +0100
Message-ID: <12544933.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
References: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_075731_643384_7560E775 
X-CRM114-Status: GOOD (  24.05  )
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

Hi Alice,

Am Dienstag, 29. Oktober 2024, 09:34:06 CET schrieb alice.guo@oss.nxp.com:
> From: "alice.guo" <alice.guo@nxp.com>
>=20
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
>=20
> Signed-off-by: alice.guo <alice.guo@nxp.com>
> ---
>=20
> Changes for v2:
>  - refine error log print
>=20
>  drivers/soc/imx/Makefile   |   2 +-
>  drivers/soc/imx/soc-imx9.c | 103 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+), 1 deletion(-)
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
> index 000000000000..0722e69110f9
> --- /dev/null
> +++ b/drivers/soc/imx/soc-imx9.c
> @@ -0,0 +1,103 @@
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
> +		pr_err("%s: SMC failed: %d\n", __func__, res.a0);
> +		err =3D res.a0;
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
> +		goto soc_id;
> +	}
> +
> +	return 0;
> +
> +soc_id:
> +	kfree(attr->soc_id);
> +	kfree(attr->serial_number);
> +	kfree(attr->revision);

Please free the memory in the reverse order of allocation.

Thanks
Alexander

> +family:
> +	kfree(attr->family);
> +attr:
> +	kfree(attr);
> +	return err;
> +}
> +
> +static int __init imx9_soc_init(void)
> +{
> +	int ret =3D 0;
> +
> +	if (of_machine_is_compatible("fsl,imx91") ||
> +		of_machine_is_compatible("fsl,imx93") ||
> +		of_machine_is_compatible("fsl,imx95")) {
> +		ret =3D imx9_soc_device_register();
> +		if (ret) {
> +			pr_err("%s failed to register SoC as a device: %d\n", __func__, ret);
> +			return ret;
> +		}
> +	}
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



