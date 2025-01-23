Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DF1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39CuZZZdjSJEJPQMh+OB3G3RFMPggoTrQcp5t75nl8Y=; b=3F7JpjMcIM6Kup
	ba9A7uazhEWvpR0UJCjc7MutvK4GnNIBBeofTrBoiiddcrmtX/powYd9XChJGuzqkX3qK64I1k/EH
	yPhZoPU22OKAXvsM5DXjAyQCNACf0GucABDfFOtZjfEXOuY8xJe9u99Vv+T9yl2EeOEUE4cf3jMxC
	jReJnGIilbbUkplbrQqNmpEUaYoPZCj6nZYskIsFtxCcPrRXLEZ/CG3UYHZiQt9nyWQompfi+nJWT
	v+XrdUhZjykpXRnkONLHT6ktt2SSbj6Tu0Yr7sMGhyfJwC/mFebD0R/oJjARWac5Gs2fsbO08xdNp
	PDzhAdbsD/PoQ4em648Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawNA-0000000CSF2-2Ix4;
	Thu, 23 Jan 2025 12:31:48 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tawLr-0000000CS6m-3GNi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 12:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=39CuZZZdjSJEJPQMh+OB3G3RFMPggoTrQcp5t75nl8Y=; b=atGtDdFA/e4szMovQBwMFwgXZn
	co6f+Ko4J890WcGUnR27tQkv47WQotAMgVeGUpdhIHs0P2Ay6ftyu4fzFvUfxjY4gJXetCJDuQPVF
	TtvHLm8RmrsIztBJvjDPjdUo1rAYIKT0D+YzQ7UWKKjTGTUbxUSoHnI6m7EreB+hqZdtGl3u7i3jK
	jdFp5M9z4gv7koNlNHcYAhghg/IUdc18Qj+WBrSOsb4jrB8OUSqc7QEeMiOVafkvItxkP9cg1eYCO
	j17SlYjKKx1cM+3yFH74+WkQuyZmN8tWggp4l2iWs5idkuwdGvVJWIMAnAnxKfD8R3OFlpkkcyyER
	g0jaFJug==;
Received: from [122.175.9.182] (port=45111 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tawLl-0005TL-35;
	Thu, 23 Jan 2025 18:00:22 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 5FE1A1781C63;
	Thu, 23 Jan 2025 18:00:13 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 395D61782495;
	Thu, 23 Jan 2025 18:00:13 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2df9ieE3WTUM; Thu, 23 Jan 2025 18:00:13 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id D9E111781C63;
	Thu, 23 Jan 2025 18:00:12 +0530 (IST)
Date: Thu, 23 Jan 2025 18:00:12 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <1333946741.395386.1737635412707.JavaMail.zimbra@couthit.local>
In-Reply-To: <6ac6161b-373a-47ce-801d-9e4ff1ef258c@wanadoo.fr>
References: <20250109105600.41297-1-basharath@couthit.com> <20250109105600.41297-5-basharath@couthit.com> <6ac6161b-373a-47ce-801d-9e4ff1ef258c@wanadoo.fr>
Subject: Re: [RFC PATCH 04/10] net: ti: prueth: Adds link detection, RX and
 TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: wMpv7fMC/ugczbeFyu6r0nphcnNI/g==
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
X-CRM114-CacheID: sfid-20250123_043027_891971_FBC327E2 
X-CRM114-Status: UNSURE (   5.36  )
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
Cc: nm <nm@ti.com>, vigneshr <vigneshr@ti.com>, tony <tony@atomide.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, Rob Herring <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, praneeth <praneeth@ti.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, prajith <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, rdunlap <rdunlap@infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


> Le 09/01/2025 =C3=A0 11:55, Basharath Hussain Khaja a =C3=A9crit=C2=A0:
>> From: Roger Quadros <rogerq@ti.com>
>>=20
>> Changes corresponding to link configuration such as speed and duplexity.
>> IRQ and handler initializations are performed for packet reception.Firmw=
are
>> receives the packet from the wire and stores it into OCMC queue. Next, i=
t
>> notifies the CPU via interrupt. Upon receiving the interrupt CPU will
>> service the IRQ and packet will be processed by pushing the newly alloca=
ted
>> SKB to upper layers.
>>=20
>> When the user application want to transmit a packet, it will invoke
>> sys_send() which will inturn invoke the PRUETH driver, then it will writ=
e
>> the packet into OCMC queues. PRU firmware will pick up the packet and
>> transmit it on to the wire.
>=20
> Hi,
> a few nitpicks.
>=20
> ...
>=20
>> +static int icssm_prueth_tx_enqueue(struct prueth_emac *emac,
>> +=09=09=09=09   struct sk_buff *skb,
>> +=09=09=09=09   enum prueth_queue_id queue_id)
>> +{
>> +=09struct prueth_queue_desc __iomem *queue_desc;
>> +=09const struct prueth_queue_info *txqueue;
>> +=09u16 bd_rd_ptr, bd_wr_ptr, update_wr_ptr;
>> +=09struct net_device *ndev =3D emac->ndev;
>> +=09unsigned int buffer_desc_count;
>> +=09int free_blocks, update_block;
>> +=09bool buffer_wrapped =3D false;
>> +=09int write_block, read_block;
>> +=09void *src_addr, *dst_addr;
>> +=09int pkt_block_size;
>> +=09void __iomem *dram;
>> +=09int txport, pktlen;
>> +=09u32 wr_buf_desc;
>> +=09void *ocmc_ram;
>> +
>> +=09dram =3D emac->prueth->mem[emac->dram].va;
>> +=09if (eth_skb_pad(skb)) {
>> +=09=09if (netif_msg_tx_err(emac) && net_ratelimit())
>> +=09=09=09netdev_err(ndev, "packet pad failed");
>=20
> Missing trailing \n.
>=20
>> +=09=09return -ENOMEM;
>> +=09}
>> +
>> +=09/* which port to tx: MII0 or MII1 */
>> +=09txport =3D emac->tx_port_queue;
>=20
> ...
>=20
>> +static int icssm_emac_request_irqs(struct prueth_emac *emac)
>> +{
>> +=09struct net_device *ndev =3D emac->ndev;
>> +=09int ret =3D 0;
>=20
> No need to init.
>=20
>> +
>> +=09ret =3D request_threaded_irq(emac->rx_irq, NULL, icssm_emac_rx_threa=
d,
>> +=09=09=09=09   IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
>> +=09=09=09=09   ndev->name, ndev);
>> +=09if (ret) {
>> +=09=09netdev_err(ndev, "unable to request RX IRQ\n");
>> +=09=09return ret;
>> +=09}
>=20
> ...
>=20
>> +static int icssm_emac_ndo_start_xmit(struct sk_buff *skb,
>> +=09=09=09=09     struct net_device *ndev)
>> +{
>> +=09struct prueth_emac *emac =3D netdev_priv(ndev);
>> +=09int ret =3D 0;
>> +=09u16 qid;
>> +
>> +=09if (unlikely(!emac->link)) {
>> +=09=09if (netif_msg_tx_err(emac) && net_ratelimit())
>> +=09=09=09netdev_err(ndev, "No link to transmit");
>=20
> \n
>=20
>> +=09=09goto fail_tx;
>> +=09}
>> +
>> +=09qid =3D icssm_prueth_get_tx_queue_id(emac->prueth, skb);...

We will handle all comments in the next version.

Thanks & Best Regards,
Basharath

