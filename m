Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ABDCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r5y1mBmz5eggI5FeubKKMTyd6C8Kfk2vMD6BmwoREY=; b=PWRSS+XU/+alflLvluU3S4yY7E
	F8UWiiWHsfbZBGjZXa1pmumfPxdRPC2azBUtK8qqlMtp4S0qddDTd0+ZgCAVlNpRUcMX3jB3Rpel8
	RwblTQPuftsslGxwvGt6ux170EFoR9W7p3zWVbri8PplJGn7PAkWCwbSZpRyakOYqSjV6muuC5ek3
	ZEcSLH4/TYvTWNr1q5pQokGfFHHsts7r3e1goO0fwHObkNeH3qO2C2p4H7iydhh6NQiExSbtYYCLZ
	yXGgQZpMDrhI3lQtJdcxu97UvJ6W7LfqV9Np6aVv1gPkTreHBmTzkO6+Z4caP3F3PGm5LBj0WCFi0
	KAxaGb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtPv-0000000EQkF-2yyG;
	Mon, 20 Oct 2025 17:11:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtPu-0000000EQjr-1M6Y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 17:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2r5y1mBmz5eggI5FeubKKMTyd6C8Kfk2vMD6BmwoREY=; b=Ts3zCBjRmtBUk4J+8sV2g4Cz6r
	paR39m4HcKMqbJ2Sitc65xXBUihW7sSnVIDohGTmC2wSBkLtSv2+Twv7T/kUMoBhDtUTU/R/EHmoF
	/fOkRebt5K6G5XV9O61aOhFbvG1LLOCFLzsTyQi9rn4CNFWcmDZVNxL7ukvDGK4I8HNKzJff5VO3J
	hp3tZZczQN21ZdbR4AxEoriOVeeRJA7GFKbmKIjY5GFmrlWjLaNKYkD89I6/otgXQW1IS6izoFvkO
	0yae7qImHVUQyKwNITST9AHtX2YHf4mQWKfOGvK3ffxBwu7L72/zafHmgb//UEDdG2VX+Xw9yUY43
	2CLYNEQg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsYA-00000000249-47aC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:16:00 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr21X5Vstz6L4vM;
	Tue, 21 Oct 2025 01:08:00 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EB39140275;
	Tue, 21 Oct 2025 01:11:08 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 18:11:07 +0100
Date: Mon, 20 Oct 2025 18:11:06 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/8] firmware: arm_scmi: Extend transport driver macro
 to support ACPI
Message-ID: <20251020181106.0000724f@huawei.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<20251017-acpi_scmi_pcc-v1-2-0adbab7709d9@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.48.157.75]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_171559_191830_5E46485D 
X-CRM114-Status: GOOD (  18.10  )
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

On Fri, 17 Oct 2025 14:23:45 +0100
Sudeep Holla <sudeep.holla@arm.com> wrote:

> Extend the SCMI transport driver helper to also support ACPI-based
> systems. Introduce an internal helper macro that accepts both OF and
> ACPI match tables, and expose two wrappers:
>=20
>   - DEFINE_SCMI_TRANSPORT_DRIVER(...)      -> DT/OF wrapper (unchanged AB=
I)
>   - DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(...) -> ACPI wrapper
>=20
> For ACPI, the generated platform_driver now sets .acpi_match_table via
> ACPI_PTR() so that builds without CONFIG_ACPI remain safe (becomes NULL).
In general it doesn't normally matter if ACPI_PTR() isn't used.

What specifically is this preventing?  If CONFIG_ACPI isn't set then we'll =
never
use those paths anyway.  Using ACPI_PTR() tends to need ifdef magic or
__maybe_unused markings that are rarely worth the effort for these tiny
tables.

> The spawned platform_device inherits the parent device=E2=80=99s ACPI com=
panion
> to ensure proper firmware-node association (i.e.subsequent lookups or
> fwnode use see the correct firmware node).
>=20
> This keeps existing DT users unchanged and continues to function as
> expected while allowing transports to be probed using the structure
> `acpi_device_id` tables on ACPI platforms.
>=20
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/firmware/arm_scmi/common.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_sc=
mi/common.h
> index 911941e6885d..d038fec72360 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -9,6 +9,7 @@
>  #ifndef _SCMI_COMMON_H
>  #define _SCMI_COMMON_H
> =20
> +#include <linux/acpi.h>
>  #include <linux/bitfield.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
> @@ -453,7 +454,8 @@ struct scmi_transport {
>  	struct scmi_transport_core_operations **core_ops;
>  };
> =20
> -#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __co=
re_ops)\
> +#define __DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __of_match,=
       \
> +					__acpi_match, __core_ops)	       \
>  static void __tag##_dev_free(void *data)				       \
>  {									       \
>  	struct platform_device *spdev =3D data;				       \
> @@ -474,6 +476,7 @@ static int __tag##_probe(struct platform_device *pdev=
)			       \
>  									       \
>  	device_set_of_node_from_dev(&spdev->dev, dev);			       \
>  	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
> +	ACPI_COMPANION_SET(&spdev->dev, ACPI_COMPANION(dev));		       \
>  									       \
>  	strans.supplier =3D dev;						       \
>  	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \
> @@ -498,11 +501,18 @@ err:									       \
>  static struct platform_driver __drv =3D {					       \
>  	.driver =3D {							       \
>  		   .name =3D #__tag "_transport",				       \
> -		   .of_match_table =3D __match,				       \
> +		   .of_match_table =3D __of_match,			       \
> +		   .acpi_match_table =3D ACPI_PTR(__acpi_match),		       \
>  		   },							       \
>  	.probe =3D __tag##_probe,						       \
>  }
> =20
> +#define DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, __co=
re_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match, NULL, __c=
ore_ops)
> +
> +#define DEFINE_SCMI_ACPI_TRANSPORT_DRIVER(__tag, __drv, __desc, __match,=
 __core_ops)\
> +	__DEFINE_SCMI_TRANSPORT_DRIVER(__tag, __drv, __desc, NULL, __match, __c=
ore_ops)
> +
>  void scmi_notification_instance_data_set(const struct scmi_handle *handl=
e,
>  					 void *priv);
>  void *scmi_notification_instance_data_get(const struct scmi_handle *hand=
le);
>=20


