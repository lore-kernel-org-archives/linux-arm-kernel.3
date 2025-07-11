Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840C0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJW9cOBCmrxXxZqHEQ8adQkukE2W2AgflGt7EU89058=; b=mQ3yJOHLxgh6xa
	Fjouzdm7dDxEfF3DGDEJUoCOv33YAvIDxrmf7MC7yzuyYQ/v2HqQxa8qZJ5pjX+9ImNMZmq31COR3
	9VOHjniTcFy829dxMG7tn2Z75wBaPzwONpOpPqFuClmFsdP6U9yVbHgU3lc8oXRvvtjS3cylMUQ5s
	R/bP9cRdbzg9UcUJKV5Kodm6kBMifj8+27pNKQaOHw4S0duYSUQojD8Rt0dSHb9gecCazk/uOmG+U
	n1D+pN/fXkNklr2/gnfNPnG0iE6evQVC+9QX0u0nzhsaxqanOTbU5DknNqJZjyQ+2nj3+4HsS8ai8
	dAqpnMI6llrXw0ovg8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaD37-0000000ElUC-3vRF;
	Fri, 11 Jul 2025 12:40:21 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCwI-0000000EkoO-1Kpx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AJW9cOBCmrxXxZqHEQ8adQkukE2W2AgflGt7EU89058=; b=bja6yI4bhC5Up2flT2VGnPrBJi
	AI9jYvgSAP3+3hJEpZz9uckqmm/D/4jscytgnNi9jXJOlZregJWSUc4jnwX3txw3D69KK6igl+Aya
	dV0jotGglD6S4CUsOKbD0R6kbgWNNts/4dX3kfMR1kGHO5z9qc8GeyQoxqErzFirVVN5NhoovO1q1
	4NiBqtG/0W1JNj16URhLgFOjUZsWyUUyL2ir3EQyKrbxx7tWq4WUwbIlmebiF8WtR41+QcoQ3XF87
	yIPufMuzKE2gnaMtF9nqKb2rJHTw1NxY/nuFkZ0fJkl0LktfLSo2THBWYv+cncQsHSuAbC7orQM09
	BOPVLmBA==;
Received: from [122.175.9.182] (port=12257 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uaCwE-0000000Cl5L-2uHd;
	Fri, 11 Jul 2025 08:33:15 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 4D7A017820AC;
	Fri, 11 Jul 2025 18:03:09 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 2E52517820F5;
	Fri, 11 Jul 2025 18:03:09 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hCs-qG7o16wZ; Fri, 11 Jul 2025 18:03:09 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id DD32117820AC;
	Fri, 11 Jul 2025 18:03:08 +0530 (IST)
Date: Fri, 11 Jul 2025 18:03:08 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <723330733.1712525.1752237188810.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250708180107.7886ea41@kernel.org>
References: <20250702140633.1612269-1-parvathi@couthit.com> <20250702151756.1656470-5-parvathi@couthit.com> <20250708180107.7886ea41@kernel.org>
Subject: Re: [PATCH net-next v10 04/11] net: ti: prueth: Adds link
 detection, RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: frcZHpE/y/6hXxyDNRDspT8aDcWlcQ==
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
X-CRM114-CacheID: sfid-20250711_053318_396217_BE2BB470 
X-CRM114-Status: UNSURE (   6.33  )
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

> On Wed,  2 Jul 2025 20:47:49 +0530 Parvathi Pudi wrote:
>> +=09=09=09if (emac->port_id) {
>> +=09=09=09=09regmap_update_bits
>> +=09=09=09=09=09(prueth->mii_rt,
>> +=09=09=09=09=09 PRUSS_MII_RT_TXCFG1,
>> +=09=09=09=09=09 PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_MASK,
>> +=09=09=09=09=09 delay);
>=20
> Instead of breaking the lines up like this you should factor the code
> out or find some other way to reduce the indentation.
>=20

Sure, we will address this in the next version.

>> +=09qid =3D icssm_prueth_get_tx_queue_id(emac->prueth, skb);
>> +=09ret =3D icssm_prueth_tx_enqueue(emac, skb, qid);
>> +=09if (ret) {
>> +=09=09if (ret !=3D -ENOBUFS && netif_msg_tx_err(emac) &&
>> +=09=09    net_ratelimit())
>> +=09=09=09netdev_err(ndev, "packet queue failed: %d\n", ret);
>> +=09=09goto fail_tx;
>> +=09}
>=20
>> +=09if (ret =3D=3D -ENOBUFS) {
>> +=09=09ret =3D NETDEV_TX_BUSY;
>=20
>=20
> Something needs to stop the queue, right? Otherwise the stack will
> send the frame right back to the driver.
>=20

Yes, we will notify upper layer with =E2=80=9Cnetif_tx_stop_queue()=E2=80=
=9D when returning
=E2=80=9CNETDEV_TX_BUSY=E2=80=9D to not push again immediately.

>> +static inline void icssm_emac_finish_napi(struct prueth_emac *emac,
>> +=09=09=09=09=09  struct napi_struct *napi,
>> +=09=09=09=09=09  int irq)
>> +{
>> +=09napi_complete(napi);
>> +=09enable_irq(irq);
>=20
> This helper has a single caller, just put the two lines of code directly
> there. And use napi_complete_done(), please.

We will address this in the next version.

Thanks and Regards,
Parvathi.

