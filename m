Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08277CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 06:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4tCiHtEuBHcImWWTid6RD8zgtR1UUnyUWotA4DUPnM=; b=xObkbr6OxjD9mX
	QIl1b443mxCrTbKj5OnhgdjmWjUO/3xfqfzHinQhvjQg4DQ66y+Zc/9670xFHcJ3WiaKCXtPVqqAf
	R+sDnMq4MVaHrn/mAagpHIbVLZZUuqOWFd2MuiZoXrFYIGXUiSYnuDhYE1vH3x9gz5eUdg7XAg1fi
	7A+LP9BASLTUb6JiSUNJOyHhXlkVALsvCtWJJGfE8CBtDUQ9oeBDh2vw9pzgC4BjoI2n7Ow1HxlFe
	B8b+yWtMM7MQDpn/C21wbpfgepqxhnwtREM6dViVPCAIyqcGzcnrZLO0xcCKcC1OZje7h3tV1qMXA
	R0tKAVAQF3BgUk9RV8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utgy7-00000004dYM-3jCX;
	Wed, 03 Sep 2025 06:27:43 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utgvP-00000004bkE-1THO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=x4tCiHtEuBHcImWWTid6RD8zgtR1UUnyUWotA4DUPnM=; b=gEhSP1mtfUGcLZ09rC2smCtsK6
	T0tSls0dAi/cgEHrDAQ2LfNb4+LPYu/okrLOXpML/Fx8NqGVNseED23x0c+pPTBE+s61KBJTuQMsx
	vfKgL62zMUIiQAb5NqJNiq7sBJVDEbXfIT7djkWNiiood2lMStN/Gtb3B6U5/j/Efxv4qYsuO9MTA
	+5zD/Qqn6N6+LkrSXIdWDMAVH2z4xda+9mPD5ljmN+u8e9ILp8jvh8wynTJsQDJ21+kZIMfi8jh4N
	10u7WjZfgECckNcZYqHHVUv/wN5abRN8PXomVtoeRz/haH1Elo7TGKsC8VUgNGf3eYDZPs078izSY
	QvHEHZQw==;
Received: from [122.175.9.182] (port=39230 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1utgug-0000000AzlO-2Eye;
	Wed, 03 Sep 2025 02:24:11 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 715AC1782011;
	Wed,  3 Sep 2025 11:53:58 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 4B13717820F5;
	Wed,  3 Sep 2025 11:53:58 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MbJDssR--aGZ; Wed,  3 Sep 2025 11:53:58 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id E63761782011;
	Wed,  3 Sep 2025 11:53:57 +0530 (IST)
Date: Wed, 3 Sep 2025 11:53:57 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Md Danish Anwar <a0501179@ti.com>
Message-ID: <806290623.278790.1756880637551.JavaMail.zimbra@couthit.local>
In-Reply-To: <1b892cde-bcdc-4a4e-83b7-35cc13eef8f4@ti.com>
References: <20250822132758.2771308-1-parvathi@couthit.com> <20250822132758.2771308-3-parvathi@couthit.com> <1b892cde-bcdc-4a4e-83b7-35cc13eef8f4@ti.com>
Subject: Re: [PATCH net-next v14 2/5] net: ti: icssm-prueth: Adds ICSSM
 Ethernet driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: icssm-prueth: Adds ICSSM Ethernet driver
Thread-Index: mF5rnq3mgVHUKrTfxh1Anq5GbFjbRg==
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
X-CRM114-CacheID: sfid-20250902_232455_422620_9D58827E 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>=20
> On 8/22/2025 6:55 PM, Parvathi Pudi wrote:
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
>=20
> [ ... ]
>=20
>> +=09/* get mac address from DT and set private and netdev addr */
>> +=09ret =3D of_get_ethdev_address(eth_node, ndev);
>> +=09if (!is_valid_ether_addr(ndev->dev_addr)) {
>> +=09=09eth_hw_addr_random(ndev);
>> +=09=09dev_warn(prueth->dev, "port %d: using random MAC addr: %pM\n",
>> +=09=09=09 port, ndev->dev_addr);
>> +=09}
>> +=09ether_addr_copy(emac->mac_addr, ndev->dev_addr);
>> +
>> +=09/* connect PHY */
>> +=09emac->phydev =3D of_phy_get_and_connect(ndev, eth_node,
>> +=09=09=09=09=09      icssm_emac_adjust_link);
>> +=09if (!emac->phydev) {
>> +=09=09dev_dbg(prueth->dev, "PHY connection failed\n");
>> +=09=09ret =3D -EPROBE_DEFER;
>> +=09=09goto free;
>> +=09}
>> +
>=20
> Why are you returning EPROBE_DEFER here? If phy connection fails, you
> should just return and fail the probe. That's what ICSSG driver does.
>=20
> In drivers/net/ethernet/ti/icssg/icssg_prueth.c
>=20
> 404   =E2=94=82     ndev->phydev =3D of_phy_connect(emac->ndev, emac->phy=
_node,
> 405   =E2=94=82                       &emac_adjust_link, 0,
> 406   =E2=94=82                       emac->phy_if);
> 407   =E2=94=82     if (!ndev->phydev) {
> 408   =E2=94=82         dev_err(prueth->dev, "couldn't connect to phy %s\=
n",
> 409   =E2=94=82             emac->phy_node->full_name);
> 410   =E2=94=82         return -ENODEV;
> 411   =E2=94=82     }
>=20
>=20
> Before phy connect you do `dev_warn(prueth->dev, "port %d: using random
> MAC addr: %pM\n"`
>=20
> If device is using random mac address, this will be printed, your phy
> connect fails, you try probe again, print comes again, phy fails again
> and so on ...
>=20
> This results in system getting spammed with continuos prints of "using
> random MAC addr"
>=20
> I suggest if phy fails, let the probe fail don't do EPROBE_DEFER.
>=20
> Saw this issue on few boards which has issue with ICSSG phy.
>=20

Yes, we will check and address this in the next version.

Thanks and Regards,
Parvathi.

