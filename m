Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8DAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+RihokjvyPuvKH5MulYPFUcnHHoo2u+0AmNKF5bVVY=; b=YnrvGHue4bIT8+
	RLutcZt/Tm+Y9T0vtcpiLScYkYY4p5VzCZayjW+Ncf1WS9+xDWsJWovarUREMDknJUJnJa0Lv/8ry
	DOtKFxPm++Pwez9B2kC/amZ+hcTPWkvc47MK14vUuFlrQ3SWQQcUH24C36w7FNUeUlRQe26y79XlA
	IMZUsNPTRj4t5+iDjjPslN+y4bXv6qAnxTzy3L6G8bFUeOTiXH6V4M8Escqhps8GRkO9H2noSFZ2Q
	FX5uTsDafZ0ZzhG3vHtSG7SfStrtXF8HaEbBFP0HBhE1m0A83Za4rpqbEhmIL1TrnkMG3K200m7jG
	5JWvMW6Z2hWbH1P+qBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCrI-0000000EjtX-3FAt;
	Fri, 11 Jul 2025 12:28:08 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCow-0000000EjUe-1GyB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=U+RihokjvyPuvKH5MulYPFUcnHHoo2u+0AmNKF5bVVY=; b=rFglEcXqMxNFTAqq64EhkIlUw9
	AMGhKeNTAIqfB9pPlcxexOeudL2StxE/cE3Y5t3T6ETvpshnq+I0LhOnBQvhfyw8Xi8Cu0fXHX1rM
	ghcAwLB8pFS9HM/w7i5eZeHWa9Kz89MRF3CvXouJsnbv0kMISULddN7Wo1BZWbupDDA4WX2bPjEmS
	fzrk+Xm5M/1MlCLjLZYqIUddZ9v12552UaKRH5Uiy5kN1DBmJ6s5q168JrDk51Bh/3AGChzG4vYMu
	htL/miijg3KPCQ5sIUEZ3G5/cj3AhY/P0sFNQNhTxUHNU7S9RAtOaSyjsnOf6MlnF2sNEQAV7kyHx
	9HyEgb2g==;
Received: from [122.175.9.182] (port=21690 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uaCos-0000000CkxB-2S48;
	Fri, 11 Jul 2025 08:25:38 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id C7AC91781A71;
	Fri, 11 Jul 2025 17:55:32 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id A831917820AC;
	Fri, 11 Jul 2025 17:55:32 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rXhTqoIdqvVc; Fri, 11 Jul 2025 17:55:32 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 653241781A71;
	Fri, 11 Jul 2025 17:55:32 +0530 (IST)
Date: Fri, 11 Jul 2025 17:55:32 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1614106230.1712453.1752236732227.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250708174449.3e8744c5@kernel.org>
References: <20250702140633.1612269-1-parvathi@couthit.com> <20250702140633.1612269-3-parvathi@couthit.com> <20250708174449.3e8744c5@kernel.org>
Subject: Re: [PATCH net-next v10 02/11] net: ti: prueth: Adds ICSSM Ethernet
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds ICSSM Ethernet driver
Thread-Index: s1QDkc+Y2MblZ4jGceIpvmHgdXfxgQ==
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
X-CRM114-CacheID: sfid-20250711_052542_374927_FC0CDFA7 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Wed,  2 Jul 2025 19:36:24 +0530 Parvathi Pudi wrote:
>> +=09=09if (ret < 0) {
>> +=09=09=09dev_err(dev, "%pOF error reading port_id %d\n",
>> +=09=09=09=09eth_node, ret);
>> +=09=09}
>=20
> unnecessary parenthesis, but also did you mean to error out here?
>=20

Yes, we will address this in the next version.

>> +=09=09=09dev_err(dev, "port reg should be 0 or 1\n");
>> +=09=09=09of_node_put(eth_node);
>=20
> this error will also trigger if same port is specified multiple times
>=20

We will check and add appropriate code changes in the next version.

> +=09=09=09ret =3D PTR_ERR(prueth->pru1);
> +=09=09=09if (ret !=3D -EPROBE_DEFER)
> +=09=09=09=09dev_err(dev, "unable to get PRU1: %d\n", ret);
> +=09=09=09goto put_pru;
>=20
> dev_err_probe() ?
>=20

Sure, we will replace =E2=80=9Cdev_err()=E2=80=9D with =E2=80=9Cdev_err_pro=
be()=E2=80=9D to make it
simple.

>> +/**
>> + * struct prueth_private_data - PRU Ethernet private data
>> + * @fw_pru: firmware names to be used for PRUSS ethernet usecases
>> + * @support_lre: boolean to indicate if lre is enabled
>> + * @support_switch: boolean to indicate if switch is enabled
>=20
> Please improve or remove this, adding kdoc which doesn't explain
> anything is discouraged per kernel coding style.
>=20
> This one is actually more confusing than helpful the fields are
> called "support" but kdoc says "enabled". Maybe name the fields
> 'enabled' ?
>=20

Sure, we will address this in the next version.

>> + */
>> +struct prueth_private_data {
>> +=09const struct prueth_firmware fw_pru[PRUSS_NUM_PRUS];
>> +=09bool support_lre;
>> +=09bool support_switch;
>> +};
>> +
>> +/* data for each emac port */
>> +struct prueth_emac {
>> +=09struct prueth *prueth;
>> +=09struct net_device *ndev;
>> +
>> +=09struct rproc *pru;
>> +=09struct phy_device *phydev;
>> +
>> +=09int link;
>> +=09int speed;
>> +=09int duplex;
>> +
>> +=09enum prueth_port port_id;
>> +=09const char *phy_id;
>> +=09u8 mac_addr[6];
>> +=09phy_interface_t phy_if;
>> +=09spinlock_t lock;=09/* serialize access */
>=20
> 'serialize access' to what? Which fields does it protect?

We will update with more detailed explanation.


Thanks and Regards,
Parvathi.

