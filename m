Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ED4C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veVVuKJ87/rWDfKKk1AslmxtqJaSaNITyAxbJjSZqBs=; b=2QBwBsb13wIrDH
	+EN80KtKvhRF7OH+/0ZOaFTwcCmlN/9SnTaI7/lwhI4t4LfwM1iW6GsOg/tJbvQsyLo/DjqkZRxsr
	ulh7MLvpEPDX5wV0f9ShNCJrpQteF1UfLRsUSDiEBq/fAciYftVxgEhJshaH/zmWZyQDVTkhVy7S6
	Edx88FJkBh5RuqaM7I9UzDDywuQoOU5WP49qnr7KQZ9yqBP2YXd0Imd1U89us6Ykm+bmRgaubC5AF
	8kp/3ZFMlbmQELegs8GxRpIsOj7eriOSYAKqu3bRm0n+z0/YoQE4F9Z/AAYV0dF12CrpOiRR+cA5l
	ZuufpV9Emazhz7WDUpBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tarcX-0000000BrWs-2bsD;
	Thu, 23 Jan 2025 07:27:21 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tarbD-0000000BrJQ-37S2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 07:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=veVVuKJ87/rWDfKKk1AslmxtqJaSaNITyAxbJjSZqBs=; b=sClbXXEvBxiDWOPpHjgna2Gr/r
	y7v1+u6od2V3kWR5Nd3lCCR2kHu5jhH6cUl4U9+h//cIsVEFI3Gyiba6S9Q82ZyoN4iwE2FIsqS3W
	DsxNnFTErn3b2PRzsPP0aO1xORwztmfTzvrZan4K5x7E1Y0CAPiBY4UJljzuJNZUzVxXW7Rbb6pdR
	zFlvVbaokqMzbs96DSwagskLz3Km6HfJXaGxuzfEcM2jKKTtiijosYTR6xjXZ6hlBV8jb4jL3W9SA
	r7PzG6sPpqv/jKYGPQ3jXs3ARB9GfbCtT8gfF15l/jQ2WFZPzE5ki1LeF45zlZ870NkaxDng6OGoV
	+UMB5CsA==;
Received: from [122.175.9.182] (port=20914 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tarb9-0008NK-2D;
	Thu, 23 Jan 2025 12:55:56 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 81E7F1781A7D;
	Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 623C21782495;
	Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CgdwGL9ompX1; Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 1E2E41781A7D;
	Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Date: Thu, 23 Jan 2025 12:55:48 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Message-ID: <507763040.391350.1737617148913.JavaMail.zimbra@couthit.local>
In-Reply-To: <CAL+tcoD6WuJH6yXaEGvuz_s3sROPXtEMeZw1hBNQvb6wnKKr-w@mail.gmail.com>
References: <20250109105600.41297-1-basharath@couthit.com> <20250110055906.65086-7-basharath@couthit.com> <CAL+tcoD6WuJH6yXaEGvuz_s3sROPXtEMeZw1hBNQvb6wnKKr-w@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Thread-Index: wTJ8No/eSvZZY8f30NQgDnaEMvdq2w==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_232559_809235_ADA720AB 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> On Fri, Jan 10, 2025 at 2:01=E2=80=AFPM Basharath Hussain Khaja
> <basharath@couthit.com> wrote:
>>
>> From: Roger Quadros <rogerq@ti.com>
>>
>> PRU-ICSS IEP module, which is capable of timestamping RX and
>> TX packets at HW level, is used for time synchronization by PTP4L.
>>
>> This change includes interaction between firmware and user space
>> application (ptp4l) with required packet timestamps. The driver
>> initializes the PRU firmware with appropriate mode and configuration
>> flags. Firmware updates local registers with the flags set by driver
>> and uses for further operation. RX SOF timestamp comes along with
>> packet and firmware will rise interrupt with TX SOF timestamp after
>> pushing the packet on to the wire.
>>
>> IEP driver is available in upstream and we are reusing for hardware
>> configuration for ICSSM as well. On top of that we have extended it
>> with the changes for AM57xx SoC.
>>
>> Extended ethtool for reading HW timestamping capability of the PRU
>> interfaces.
>>
>> Currently ordinary clock (OC) configuration has been validated with
>> Linux ptp4l.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> ---
>>  drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>>  drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  26 +
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>>  .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>>  5 files changed, 605 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> index 768578c0d958..9a2ea13703d8 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> @@ -937,11 +937,53 @@ static const struct icss_iep_plat_data
>> am654_icss_iep_plat_data =3D {
>>         .config =3D &am654_icss_iep_regmap_config,
>>  };
>>
>> +static const struct icss_iep_plat_data am57xx_icss_iep_plat_data =3D {
>> +       .flags =3D ICSS_IEP_64BIT_COUNTER_SUPPORT |
>> +                ICSS_IEP_SLOW_COMPEN_REG_SUPPORT,
>> +       .reg_offs =3D {
>> +               [ICSS_IEP_GLOBAL_CFG_REG] =3D 0x00,
>> +               [ICSS_IEP_COMPEN_REG] =3D 0x08,
>> +               [ICSS_IEP_SLOW_COMPEN_REG] =3D 0x0C,
>> +               [ICSS_IEP_COUNT_REG0] =3D 0x10,
>> +               [ICSS_IEP_COUNT_REG1] =3D 0x14,
>> +               [ICSS_IEP_CAPTURE_CFG_REG] =3D 0x18,
>> +               [ICSS_IEP_CAPTURE_STAT_REG] =3D 0x1c,
>> +
>> +               [ICSS_IEP_CAP6_RISE_REG0] =3D 0x50,
>> +               [ICSS_IEP_CAP6_RISE_REG1] =3D 0x54,
>> +
>> +               [ICSS_IEP_CAP7_RISE_REG0] =3D 0x60,
>> +               [ICSS_IEP_CAP7_RISE_REG1] =3D 0x64,
>> +
>> +               [ICSS_IEP_CMP_CFG_REG] =3D 0x70,
>> +               [ICSS_IEP_CMP_STAT_REG] =3D 0x74,
>> +               [ICSS_IEP_CMP0_REG0] =3D 0x78,
>> +               [ICSS_IEP_CMP0_REG1] =3D 0x7c,
>> +               [ICSS_IEP_CMP1_REG0] =3D 0x80,
>> +               [ICSS_IEP_CMP1_REG1] =3D 0x84,
>> +
>> +               [ICSS_IEP_CMP8_REG0] =3D 0xc0,
>> +               [ICSS_IEP_CMP8_REG1] =3D 0xc4,
>> +               [ICSS_IEP_SYNC_CTRL_REG] =3D 0x180,
>> +               [ICSS_IEP_SYNC0_STAT_REG] =3D 0x188,
>> +               [ICSS_IEP_SYNC1_STAT_REG] =3D 0x18c,
>> +               [ICSS_IEP_SYNC_PWIDTH_REG] =3D 0x190,
>> +               [ICSS_IEP_SYNC0_PERIOD_REG] =3D 0x194,
>> +               [ICSS_IEP_SYNC1_DELAY_REG] =3D 0x198,
>> +               [ICSS_IEP_SYNC_START_REG] =3D 0x19c,
>> +       },
>> +       .config =3D &am654_icss_iep_regmap_config,
>> +};
>> +
>>  static const struct of_device_id icss_iep_of_match[] =3D {
>>         {
>>                 .compatible =3D "ti,am654-icss-iep",
>>                 .data =3D &am654_icss_iep_plat_data,
>>         },
>> +       {
>> +               .compatible =3D "ti,am5728-icss-iep",
>> +               .data =3D &am57xx_icss_iep_plat_data,
>> +       },
>>         {},
>>  };
>>  MODULE_DEVICE_TABLE(of, icss_iep_of_match);
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> index cce3276d5565..86d62d64dc4d 100644
>> --- a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> @@ -7,6 +7,7 @@
>>
>>  #include <linux/if_bridge.h>
>>  #include "icssm_prueth.h"
>> +#include "../icssg/icss_iep.h"
>>
>>  #define PRUETH_MODULE_VERSION "0.2"
>>  #define PRUETH_MODULE_DESCRIPTION "PRUSS Ethernet driver"
>> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device =
*ndev,
>>         regs->version =3D PRUETH_REG_DUMP_GET_VER(prueth);
>>  }
>>
>> +static int icssm_emac_get_ts_info(struct net_device *ndev,
>> +                                 struct kernel_ethtool_ts_info *info)
>> +{
>> +       struct prueth_emac *emac =3D netdev_priv(ndev);
>> +
>> +       if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
>> +               return ethtool_op_get_ts_info(ndev, info);
>> +
>> +       info->so_timestamping =3D
>> +               SOF_TIMESTAMPING_TX_HARDWARE |
>> +               SOF_TIMESTAMPING_TX_SOFTWARE |
>> +               SOF_TIMESTAMPING_RX_HARDWARE |
>> +               SOF_TIMESTAMPING_RX_SOFTWARE |
>> +               SOF_TIMESTAMPING_SOFTWARE |
>> +               SOF_TIMESTAMPING_RAW_HARDWARE;
>=20
> In addtion to what Richard suggested, there is no need to re-mark the
> following flags "SOF_TIMESTAMPING_RX_SOFTWARE" and
> "SOF_TIMESTAMPING_SOFTWARE", please see __ethtool_get_ts_info().
>=20

Yes. This module always uses IEP HW timestamping both on RX side and TX sid=
e=20
for better precision. We will clean this in the next version.

Thanks & Best Regards,
Basharath

