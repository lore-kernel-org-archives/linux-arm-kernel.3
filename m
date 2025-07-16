Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB20C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCz3qkpSM0PaErwoNukZei1+0CUNeJ1oEHCchsaW8T0=; b=nd823AO7lov0n8
	e0bapYkUQrDNYCP2tQhg84XSmttHEcAQHhaoqx6W3Y5mw9iuyLCuGb/L5bFuCifwS7pTQwmsxmitg
	ebcso0pfxT1NAI/dH37wjgEw1ePZYouunnNOXhH1LYj2nCI/QRWJGXeVnW1PZglz8QyaL4RfsRdez
	vwp7UOkEuwoyQF0NabXf4DyFIHD6YEmiMX6TOErs7Pt85M32nQuYR0mzj3rpm5x6InBuCstSYIzNt
	J0rFTAFpPtW3t59nn3sOhVD8KJjBanUPtiurTQoV0wYsBWnhkx3lF6SFrDsuvQghomuT2aJRBYCzL
	PHfcP0cMq1k0Q8lsU1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1y3-00000007lq3-3q8v;
	Wed, 16 Jul 2025 13:14:39 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc1vZ-00000007lRs-3upN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qCz3qkpSM0PaErwoNukZei1+0CUNeJ1oEHCchsaW8T0=; b=mSsRorqpu8GvUFSOiJ0BQI+6mh
	JPeC9IG0TZWWoUPrYxSxp/HSk4sfNrro88xvoXztLeT2sWWhWHoK/loc6rAKWyNY89ipAUNhTqnvV
	n0Qx7fc13cSny0+cZlDbSKoYb3QLub0NkXYJjToQuBVCB5iGE9euU8iEWwqbu8xz0rSFxdiN9utnh
	2xFhX0vZSoaiavvfmR+RoiFlLtv01kpcoxXHB9XtSWKWvH16wGKXPvATqawaiX79n/ZfVbymvdIy1
	4jXKo4t2Cqck/hLrZVHpm5bswdpAVoLgdFpuyA1b1px9onoRU4A9w93r0On4zBJ2gu2lMB92G5Zsk
	gtS1oukg==;
Received: from [122.175.9.182] (port=31570 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uc1uq-0000000HP1m-0wjn;
	Wed, 16 Jul 2025 09:11:20 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 5A5831784069;
	Wed, 16 Jul 2025 18:41:12 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 3F13E1784068;
	Wed, 16 Jul 2025 18:41:12 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CYRcvNkisBKt; Wed, 16 Jul 2025 18:41:12 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id D20231781DBB;
	Wed, 16 Jul 2025 18:41:11 +0530 (IST)
Date: Wed, 16 Jul 2025 18:41:11 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: parvathi <parvathi@couthit.com>, kuba <kuba@kernel.org>
Message-ID: <1616453705.30524.1752671471644.JavaMail.zimbra@couthit.local>
In-Reply-To: <723330733.1712525.1752237188810.JavaMail.zimbra@couthit.local>
References: <20250702140633.1612269-1-parvathi@couthit.com> <20250702151756.1656470-5-parvathi@couthit.com> <20250708180107.7886ea41@kernel.org> <723330733.1712525.1752237188810.JavaMail.zimbra@couthit.local>
Subject: Re: [PATCH net-next v10 04/11] net: ti: prueth: Adds link
 detection, RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: frcZHpE/y/6hXxyDNRDspT8aDcWlcTdy9M2r
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
X-CRM114-CacheID: sfid-20250716_061205_996523_42011A48 
X-CRM114-Status: UNSURE (   2.07  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, richardcochran <richardcochran@gmail.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, mohan <mohan@couthit.com>, s hauer <s.hauer@pengutronix.de>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>>> +=09qid =3D icssm_prueth_get_tx_queue_id(emac->prueth, skb);
>>> +=09ret =3D icssm_prueth_tx_enqueue(emac, skb, qid);
>>> +=09if (ret) {
>>> +=09=09if (ret !=3D -ENOBUFS && netif_msg_tx_err(emac) &&
>>> +=09=09    net_ratelimit())
>>> +=09=09=09netdev_err(ndev, "packet queue failed: %d\n", ret);
>>> +=09=09goto fail_tx;
>>> +=09}
>>=20
>>> +=09if (ret =3D=3D -ENOBUFS) {
>>> +=09=09ret =3D NETDEV_TX_BUSY;
>>=20
>>=20
>> Something needs to stop the queue, right? Otherwise the stack will
>> send the frame right back to the driver.
>>=20
>=20
> Yes, we will notify upper layer with =E2=80=9Cnetif_tx_stop_queue()=E2=80=
=9D when returning
> =E2=80=9CNETDEV_TX_BUSY=E2=80=9D to not push again immediately.
>=20

We reviewed the flow and found that the reason for NETDEV_TX_BUSY being
notified to the upper layers is due lack of support for reliably detecting
the TX completion event.

In case of ICSSM PRU Ethernet, we do not have support for TX complete
notification back to the driver from firmware and its like store and
forget approach. So it will be tricky to enable back/resume the queue
if we stop it when we see busy status.

Returning NETDEV_TX_BUSY seems to be the best option so that the stack can
retry as soon as possible.


Thanks and Regards,
Parvathi.

