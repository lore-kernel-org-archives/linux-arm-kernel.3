Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B32C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvjiIuDfrlWWbykzDv6yMKlbKFJ9c3SfR0on8ygzWv8=; b=hHzeJ7asPmdIfi
	hvvb35juCTGIsPOlgcFIv51sgEOg8xtKUGy4ZSSKRep6kMZWaEsg6at5kQtvByi/tcEyv+xr4mAkr
	nonHVk3n4ewqFEcC6ZY7aRvLTc2GeZQXuAViQXb0bJlDlEkqnbgGJvotjlUWNDrvNm7FK2PopETOB
	x2FB7wBj8hK9lOpj0LAeDXVtWU+iogGbF6A8ZgzEj4hCjxpEqQ3n1YbtOeaxgg3fe9DHy/d/uTecx
	giMXUg5iIA6XrM/IOMnI7WMZS54R34/kLvKNlQ9a9c8RqL9bgFeUQUwqFevevGf6nW7Z4TxVwTkKJ
	CXqmM9VC8ala0R71xuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9bm-00000008hA8-2aTd;
	Wed, 16 Jul 2025 21:24:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Nb-00000008fqz-31eh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 21:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36E76601BB;
	Wed, 16 Jul 2025 21:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FEAC4CEE7;
	Wed, 16 Jul 2025 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752700168;
	bh=ZvjiIuDfrlWWbykzDv6yMKlbKFJ9c3SfR0on8ygzWv8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MihocQ5CfRgKpACI/aeFhkJ5efmhxN3ecKFo8AYnY89VPMXR1C4T9t3Q5aqmsISYQ
	 qCkS257leQLzb3LjhZJLla7Ra3zItwwNU0vjngd7HF8DOwzYXcApTXAtRKMdASzWXk
	 bsIuuYDUqO8H9+hXjPIpDIyxKpdq9ojwWIjBZpnPONeJ+NUMqJfY9apufkcTpVxGf+
	 mqxztjqJ45Cuf0YQFLrSYrn+NgT04N5m5cXOPE0zL4wk8Md5xd1+z++31VnqlA3wDv
	 MPZi8dXrwsIGfwlsTYa1mm6JKvAWH2KnMbiq1NDRbD5vdqWTAuBn4wx7y3ZTYAYN7r
	 p1LStuyyw3sgQ==
Date: Wed, 16 Jul 2025 14:09:26 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Subject: Re: [PATCH net-next v10 04/11] net: ti: prueth: Adds link
 detection, RX and TX support.
Message-ID: <20250716140926.3aa10894@kernel.org>
In-Reply-To: <1616453705.30524.1752671471644.JavaMail.zimbra@couthit.local>
References: <20250702140633.1612269-1-parvathi@couthit.com>
	<20250702151756.1656470-5-parvathi@couthit.com>
	<20250708180107.7886ea41@kernel.org>
	<723330733.1712525.1752237188810.JavaMail.zimbra@couthit.local>
	<1616453705.30524.1752671471644.JavaMail.zimbra@couthit.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 16 Jul 2025 18:41:11 +0530 (IST) Parvathi Pudi wrote:
> >> Something needs to stop the queue, right? Otherwise the stack will
> >> send the frame right back to the driver.
> >=20
> > Yes, we will notify upper layer with =E2=80=9Cnetif_tx_stop_queue()=E2=
=80=9D when returning
> > =E2=80=9CNETDEV_TX_BUSY=E2=80=9D to not push again immediately.
>=20
> We reviewed the flow and found that the reason for NETDEV_TX_BUSY being
> notified to the upper layers is due lack of support for reliably detecting
> the TX completion event.
>=20
> In case of ICSSM PRU Ethernet, we do not have support for TX complete
> notification back to the driver from firmware and its like store and
> forget approach. So it will be tricky to enable back/resume the queue
> if we stop it when we see busy status.

IIUC this is all implemented in SW / FW. You either need to add=20
the notification or use a timer to unblock the queue.

