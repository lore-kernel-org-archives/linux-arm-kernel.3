Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F5ACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Apz5OD8t2lkSFj/LXvIiPZZcSh8uZzxm6BqniWEIHqI=; b=TE0rGzAMQEa+RKfVkmczqO3dEM
	wBFM2jPiZqyDLvLljjulz1nqUdYA0Rhm8G8gMPxGvanCG242xyq2m7kCWp6hrsNEgp1Wy2RWwnlyg
	O8VGXPcF9Nu+IChEeEE+SGn+IXaEZbHil7LAc+z8moep0Q03j4QtQwkQp/INPlAHEN6jHovXUTRGh
	1Jg8jM7rrxsfrzgVeQgbRUlRsGiZ5bQlKNsnwDDOywEGlo1XPvC0nY+X7Yj4a/96mcbs+KvK8gIm9
	6Gz2o0YGGw3m7w0gYdqQFJwHWFechA9VCBGalzTW4GaoPz0r9l/lyZwSqFu+0v1PaGAf+Uwh0YVuq
	xTkOKwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfS4-0000000G6e4-1M4F;
	Mon, 05 Oct 2026 09:57:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfS0-0000000G6dK-0z6W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791194260; x=1822730260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NW+JFu5AUhMGQatFQG++BrYi5Vx0rzk0ULHspNSVPCQ=;
  b=HxBHRoWQyCgsNxdjSSnwmkQyac7lGPLvadIsI4aoxm/eW7xn5C1QD5Tn
   pNkqndkY0H6dgcMQND1GVMldjNxe5hgbUW0utJiKI/GDjkbcrSUD8ArTU
   eA4gsa6QOFhafKy+Jomyt6UT4c3QWrzdG5JvQPIPjTqRdkbpSPslLoCVc
   V+jv2LdPzS2PKWyKvq+pZIsMxalnOA+4hNfN7nDlgtpV4ZbEvrub7ACrA
   iVXHzQxOF4kIXhwEQIeWS1K4vrArNC4/ql8dTWNR1+YX5yf8g8VGZBWaz
   sVvDl/Bedkm3FAu9i2sUzO6LhDokpQYQ+p+R533LnZqG3RiNFVeUoRjPj
   g==;
X-CSE-ConnectionGUID: mf9JFqQZQsKivlfVwyVS+Q==
X-CSE-MsgGUID: Lr+9/NGDRwWxqeEnXMMI9Q==
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="74825005"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 02:57:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Mon, 5 Oct 2026 02:57:37 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 5 Oct 2026 02:57:35 -0700
Date: Mon, 5 Oct 2026 11:57:35 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Quentin Freimanis <quentin@q-lab.dev>
CC: <netdev@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2] net: sparx5: start the TOD counters on non-PTP
 lan969x variants
Message-ID: <20261005095735.jzzlcdf6oljxpdpx@DEN-DL-M70577>
References: <20261005052826.14251-1-quentin@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261005052826.14251-1-quentin@q-lab.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_025740_496906_060B8D5E 
X-CRM114-Status: UNSURE (   8.17  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> Currently the base non-PTP-capable lan969x variants don't forward any
> Ethernet frames:
> 
>   $ ip link set eth10 up
> 
>   $ ip addr add 10.0.0.54/24 dev eth10
> 
>   $ ping 10.0.0.1
>   PING 10.0.0.1 (10.0.0.1): 56 data bytes
> 
>   --- 10.0.0.1 ping statistics ---
>   7 packets transmitted, 0 packets received, 100% packet loss
> 
>   $ cat /proc/interrupts | grep fdma
>     20:          0  GIC-0  120 Level     sparx5-fdma
> 
>   $ ip -s link show dev eth10
>       RX:  bytes packets errors dropped  missed   mcast
>            20828     102      0       0       0      72
>       TX:  bytes packets errors dropped carrier collsns
>                0       0      0       0       0       0
> 
> Testing showed that starting the domain 0 TOD counter gets networking
> working again, but start all three for consistency with the PTP variants.

Tested-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

Thank you for the patch! :-)

