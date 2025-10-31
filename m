Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31214CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teo/tPQKbj+eqyN8v2WFrPYQgfwcLLLvEpHLsfU/D9k=; b=yCIY539Sd32iQ9j7Meh9D24EMr
	hC5ZnrteoY26DXuE+bo9f1r6oZsDuSpj0KC0e0cknARXFAJFkT4xDRAEzA+EbIaYHhk1oXwXICOZh
	BeO1TnZ67b4/lUUXuKC/q/9lbRUza2SF6UbYVfa/eoUadvOHHvUerOFxMHyYNrSRgBUigYUFN1UP7
	PRng/641CYBcKgTYEtzTj92hNsksfjBDxlbZeF8f8dm5m/rd2zaQOtSXqsyzziKoAHMuolJs5gsOD
	wi9upcq9mU/vbXk3zUGEKBH7qT+uhkQ3DSrU3uOqK004cVs2z+qfY4dULgMA+62oS9NBhCsEicZ8e
	LL5+7JKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt2J-00000006XsX-1aJO;
	Fri, 31 Oct 2025 17:35:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt2F-00000006Xra-19Tt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:35:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8345FC0E958;
	Fri, 31 Oct 2025 17:35:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1FD360710;
	Fri, 31 Oct 2025 17:35:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C799C11818007;
	Fri, 31 Oct 2025 18:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761932131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=teo/tPQKbj+eqyN8v2WFrPYQgfwcLLLvEpHLsfU/D9k=;
	b=keIn0ekHPTx73WLzGzd9c4dsLHU9DVD9o5X2yeoQnwyT/aPiv8EHkw2ukThiZr1ymLnMsC
	rfORmkZJOJGlYscSpk2j919AMcD83vOu/fZhcrVORgLkTPHqlaygLDn2IFdlOVoczikdVN
	oW1LKuuNfBOR271crLqJoh4Si6TPrzsgZQrJZBpolvuy6D4LiiNchooDIVqNbCfI9d4+nT
	hTVC0KeRyAGZivZAGL8G5fBNDNwgW73xcKJ3+bI93xguELqLvBVNje6z1/MsFLsgzA90fy
	QUaUDfgNQq8zF81bL3LEUf/CPcu8TR6vTwXE5/mfcgNnztqSPqxlIhPYAJMScQ==
Date: Fri, 31 Oct 2025 18:35:25 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Marco Crivellari <marco.crivellari@suse.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 6/7] net: pch_gbe: convert to use ndo_hwtstamp
 callbacks
Message-ID: <20251031183525.5b8b8110@kmaincent-XPS-13-7390>
In-Reply-To: <20251031004607.1983544-7-vadim.fedorenko@linux.dev>
References: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
	<20251031004607.1983544-7-vadim.fedorenko@linux.dev>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103535_463228_57CFF6E9 
X-CRM114-Status: GOOD (  16.43  )
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

On Fri, 31 Oct 2025 00:46:06 +0000
Vadim Fedorenko <vadim.fedorenko@linux.dev> wrote:

> The driver implemented SIOCSHWTSTAMP ioctl command only, but it stores
> configuration in the private data, so it is possible to report it back
> to users. Implement both ndo_hwtstamp_set and ndo_hwtstamp_get
> callbacks. To properly report RX filter type, store it in hwts_rx_en
> instead of using this field as a simple flag. The logic didn't change
> because receive path used this field as boolean flag.
>=20
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
>  .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  | 40 +++++++++++--------
>  1 file changed, 24 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
> b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c index
> e5a6f59af0b6..4049137abc40 100644 ---
> a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c +++
> b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c @@ -198,42 +198,40=
 @@
> pch_tx_timestamp(struct pch_gbe_adapter *adapter, struct sk_buff *skb)
> pch_ch_event_write(pdev, TX_SNAPSHOT_LOCKED); }
> =20
> -static int hwtstamp_ioctl(struct net_device *netdev, struct ifreq *ifr, =
int
> cmd) +static int pch_gbe_hwtstamp_set(struct net_device *netdev,
> +				struct kernel_hwtstamp_config *cfg,
> +				struct netlink_ext_ack *extack)
>  {
> -	struct hwtstamp_config cfg;
>  	struct pch_gbe_adapter *adapter =3D netdev_priv(netdev);
>  	struct pci_dev *pdev;
>  	u8 station[20];
> =20
> -	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
> -		return -EFAULT;
> -
>  	/* Get ieee1588's dev information */
>  	pdev =3D adapter->ptp_pdev;
> =20
> -	if (cfg.tx_type !=3D HWTSTAMP_TX_OFF && cfg.tx_type !=3D HWTSTAMP_TX_ON)
> +	if (cfg->tx_type !=3D HWTSTAMP_TX_OFF && cfg->tx_type !=3D
> HWTSTAMP_TX_ON) return -ERANGE;
> =20
> -	switch (cfg.rx_filter) {
> +	switch (cfg->rx_filter) {
>  	case HWTSTAMP_FILTER_NONE:
>  		adapter->hwts_rx_en =3D 0;
>  		break;
>  	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
> -		adapter->hwts_rx_en =3D 0;
> +		adapter->hwts_rx_en =3D cfg->rx_filter;

It seems there is a functional change here.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

