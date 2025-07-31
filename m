Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB17AC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yrfb0HOaoHG7iPog1DBjfZMW+8NvBRkjZ6FVr4DkooM=; b=mxJijPThCt2EmC
	/VV+a/Hu3ON/4JYgV7zuYxBOkGy8xC+yHtMuSK74bXLscZ3x8IQULROQAtjMbytPZtouh0vtv9LUA
	yHi/1tgRiQhznhwHTzEJ0kdRZOd83W8IZaGyKy9wLGr6wvGBJjR0bpMxwgKCIyX+EEdpC4as2ZhR7
	OrxTZfefevoyfP4Ncb6xX+OGGogOmgdolATGXLHrfgvkSsKWFdg+lRBdXBW57VSJfPJaVonqyHc7i
	t591UjulM56BzrsOLR6r6Yetfhm3SltmGZGYIGplvwTS5+LbpdhiGsiFhNRWUDLvZoFT8pBjwfmrn
	k1lyuHH/jvqlfUg/6VRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUis-00000003u0z-1V7f;
	Thu, 31 Jul 2025 14:57:34 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU4k-00000003nu6-0MUA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Yrfb0HOaoHG7iPog1DBjfZMW+8NvBRkjZ6FVr4DkooM=; b=M4yifNTOJvgbXIrhWyt7VnFbod
	bzVsqfTnYcU/nnFZs8TBT9uSh0Sp46t6mGXqqC4kO3MH5wMQCvJyXnAzFz+b9GeihUicgz38qwRUq
	/QJoZUlERnPJfWlDyQBIpDFCOSxXmeJ579r3eE8tTPmIhYae3lAlZ3qs80C1RZZkqunirrDWMoDbK
	1NPX4TbE97q6lnpdjqnGD1IreBmK5Jb2sWaBaYsdz2/NvFEY/uVfKiCr98z3hxhYeEfLhRDHoenz1
	gkvRaVhHlbL7ll4Z/qzvvBRbaxlbn3K/HsGcN2Ey8U9jhdKibDjjEa2diNk1tmLaMegMHrmblLqj+
	D/SDapbA==;
Received: from [122.175.9.182] (port=48191 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uhU4f-0000000EGfX-2qBf;
	Thu, 31 Jul 2025 10:16:02 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id E5B941781F30;
	Thu, 31 Jul 2025 19:45:55 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id C5B5C1783F55;
	Thu, 31 Jul 2025 19:45:55 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RGkdA-2r7jyA; Thu, 31 Jul 2025 19:45:55 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 7E4051781F30;
	Thu, 31 Jul 2025 19:45:55 +0530 (IST)
Date: Thu, 31 Jul 2025 19:45:55 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Message-ID: <234831131.78058.1753971355358.JavaMail.zimbra@couthit.local>
In-Reply-To: <1d39a02c-92e6-4ebe-8917-cc7c2ebb70b2@oracle.com>
References: <20250724072535.3062604-1-parvathi@couthit.com> <20250724072535.3062604-3-parvathi@couthit.com> <1d39a02c-92e6-4ebe-8917-cc7c2ebb70b2@oracle.com>
Subject: Re: [PATCH net-next v12 2/5] net: ti: prueth: Adds ICSSM Ethernet
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ICSSM Ethernet driver
Thread-Index: wj03l94gG4u1FVHPYBiI8HEpNdo3ng==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_071606_160941_DFC5E66D 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On 7/24/2025 12:53 PM, Parvathi Pudi wrote:
>> From: Roger Quadros <rogerq@ti.com>
>>=20
>> Updates Kernel configuration to enable PRUETH driver and its dependencie=
s
>> along with makefile changes to add the new PRUETH driver.
>>=20
>> Changes includes init and deinit of ICSSM PRU Ethernet driver including
>> net dev registration and firmware loading for DUAL-MAC mode running on
>> PRU-ICSS2 instance.
>>=20
>> Changes also includes link handling, PRU booting, default firmware loadi=
ng
>> and PRU stopping using existing remoteproc driver APIs.
>>=20
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> ---
>>   drivers/net/ethernet/ti/Kconfig              |  12 +
>>   drivers/net/ethernet/ti/Makefile             |   3 +
>>   drivers/net/ethernet/ti/icssm/icssm_prueth.c | 610 +++++++++++++++++++
>>   drivers/net/ethernet/ti/icssm/icssm_prueth.h | 100 +++
>>   4 files changed, 725 insertions(+)
>>   create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.c
>>   create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth.h
>>=20
>> diff --git a/drivers/net/ethernet/ti/Kconfig b/drivers/net/ethernet/ti/K=
config
>> index a07c910c497a..ab20f22524cb 100644
>> --- a/drivers/net/ethernet/ti/Kconfig
>> +++ b/drivers/net/ethernet/ti/Kconfig
>> @@ -229,4 +229,16 @@ config TI_ICSS_IEP
>>   =09  To compile this driver as a module, choose M here. The module
>>   =09  will be called icss_iep.
>>  =20
>> +config TI_PRUETH
>> +=09tristate "TI PRU Ethernet EMAC driver"
>> +=09depends on PRU_REMOTEPROC
>> +=09depends on NET_SWITCHDEV
>> +=09select TI_ICSS_IEP
>> +=09imply PTP_1588_CLOCK
>> +=09help
>> +=09  Some TI SoCs has Programmable Realtime Units (PRUs) cores which ca=
n
>=20
> Some TI SoCs have Programmable Realtime Unit (PRU)
>=20

Sure, We will address this.

>> +=09  support Single or Dual Ethernet ports with help of firmware code r=
unning
>=20
> with the help of firmware code running
>=20

Sure, We will address this.

>> +=09  on PRU cores. This driver supports remoteproc based communication =
to
>> +=09  PRU firmware to expose ethernet interface to Linux.
>=20
> ethernet -> Ethernet
>=20

Sure, We will address this.

>> +
>>   endif # NET_VENDOR_TI
>> diff --git a/drivers/net/ethernet/ti/Makefile b/drivers/net/ethernet/ti/=
Makefile
>> index cbcf44806924..93c0a4d0e33a 100644
>> --- a/drivers/net/ethernet/ti/Makefile
>> +++ b/drivers/net/ethernet/ti/Makefile
>> @@ -3,6 +3,9 @@
>>   # Makefile for the TI network device drivers.
>>   #
>>  =20
>> +obj-$(CONFIG_TI_PRUETH) +=3D icssm-prueth.o
>> +icssm-prueth-y :=3D icssm/icssm_prueth.o
>> +
>>   obj-$(CONFIG_TI_CPSW) +=3D cpsw-common.o
>>   obj-$(CONFIG_TI_DAVINCI_EMAC) +=3D cpsw-common.o
>>   obj-$(CONFIG_TI_CPSW_SWITCHDEV) +=3D cpsw-common.o
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> new file mode 100644
>> index 000000000000..375fd636684d
>> --- /dev/null
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> @@ -0,0 +1,610 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/* Texas Instruments ICSSM Ethernet Driver
>> + *
>> + * Copyright (C) 2018-2022 Texas Instruments Incorporated -
>> https://urldefense.com/v3/__https://www.ti.com/__;!!ACWV5N9M2RV99hQ!KJSw=
49T9tFMkKlUCkufdpPMrYbxZqO8afwgd1oNYrR_r0dienongkVB3K8jc1UDBehhE_eMQGHAGYrv=
O9wPpJQ$
>> + *
>> + */
>> +
>> +#include <linux/etherdevice.h>
>> +#include <linux/genalloc.h>
>> +#include <linux/if_bridge.h>
>> +#include <linux/if_hsr.h>
>> +#include <linux/if_vlan.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/net_tstamp.h>
>> +#include <linux/of.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/of_mdio.h>
>> +#include <linux/of_net.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/phy.h>
>> +#include <linux/remoteproc/pruss.h>
>> +#include <linux/ptp_classify.h>
>> +#include <linux/regmap.h>
>> +#include <linux/remoteproc.h>
>> +#include <net/pkt_cls.h>
>> +
>> +#include "icssm_prueth.h"
>> +
>> +/* called back by PHY layer if there is change in link state of hw port=
*/
>> +static void icssm_emac_adjust_link(struct net_device *ndev)
>> +{
>> +=09struct prueth_emac *emac =3D netdev_priv(ndev);
>> +=09struct phy_device *phydev =3D emac->phydev;
>> +=09bool new_state =3D false;
>> +=09unsigned long flags;
>> +
>> +=09spin_lock_irqsave(&emac->lock, flags);
>> +
>> +=09if (phydev->link) {
>> +=09=09/* check the mode of operation */
>> +=09=09if (phydev->duplex !=3D emac->duplex) {
>> +=09=09=09new_state =3D true;
>> +=09=09=09emac->duplex =3D phydev->duplex;
>> +=09=09}
>> +=09=09if (phydev->speed !=3D emac->speed) {
>> +=09=09=09new_state =3D true;
>> +=09=09=09emac->speed =3D phydev->speed;
>> +=09=09}
>> +=09=09if (!emac->link) {
>> +=09=09=09new_state =3D true;
>> +=09=09=09emac->link =3D 1;
>> +=09=09}
>> +=09} else if (emac->link) {
>> +=09=09new_state =3D true;
>> +=09=09emac->link =3D 0;
>> +=09}
>> +
>> +=09if (new_state)
>> +=09=09phy_print_status(phydev);
>> +
>> +=09if (emac->link) {
>> +=09       /* reactivate the transmit queue if it is stopped */
>> +=09=09if (netif_running(ndev) && netif_queue_stopped(ndev))
>> +=09=09=09netif_wake_queue(ndev);
>> +=09} else {
>> +=09=09if (!netif_queue_stopped(ndev))
>> +=09=09=09netif_stop_queue(ndev);
>> +=09}
>> +
>> +=09spin_unlock_irqrestore(&emac->lock, flags);
>> +}
>> +
>> +static int icssm_emac_set_boot_pru(struct prueth_emac *emac,
>> +=09=09=09=09   struct net_device *ndev)
>> +{
>> +=09const struct prueth_firmware *pru_firmwares;
>> +=09struct prueth *prueth =3D emac->prueth;
>> +=09const char *fw_name;
>> +=09int ret;
>> +
>> +=09pru_firmwares =3D &prueth->fw_data->fw_pru[emac->port_id - 1];
>=20
> If emac->port_id =3D=3D 0, this will index at -1
>=20

We will enter this API for emac->port_id as 1 or  2 always due to the
reason that the physical port indexes are 1 for MII0 and 2 for MII1
which are nothing but PRU0 and PRU1 respectively. Zero is for HOST port
which is a virtual port no PRU core associated to it but it is the ARM
core which is initializing the PRU=E2=80=99s.

>> +=09fw_name =3D pru_firmwares->fw_name[prueth->eth_type];
>> +=09if (!fw_name) {
>> +=09=09netdev_err(ndev, "eth_type %d not supported\n",
>> +=09=09=09   prueth->eth_type);
>> +=09=09return -ENODEV;
>> +=09}
>> +
>> +=09ret =3D rproc_set_firmware(emac->pru, fw_name);
>> +=09if (ret) {
>> +=09=09netdev_err(ndev, "failed to set PRU0 firmware %s: %d\n",
>=20
> Hardcoded PRU0 in Logs, what if PRU1
>=20

Sure, We will address this.

We will post the next version soon after net-next is open.


Thanks and Regards,
Parvathi.

