Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326BECC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qa9W9k+qZrFKDAmaHzsrxr0XjQ6vMMORRtDX+Ayj0RA=; b=JALkWj1eOQMsZE9vE06iTNHG60
	/jsNAk6Oi1KseqpdftNY+KRxNUxNSuMbbef+XZgKDhfzgMLWcahZD1D0ZnaX8OgWWVIHIrFqNhP1j
	bo6xvZeLJdu4herWQWMsxP/N7RCq2hMV/XBF7/5SFt2JQvF3uX9r7mpF+yuh0AO60nH2LrZePq/Jy
	P+S7tb7L3ZMQuVRnd/jDDtzYasw7d+UukcvJ9pOBoQEzMloCLRFqx+kVZyeJVNPZRr0+4bRcS0fbU
	yVCBgXIRluN8/GmmgRUYF31cnIsOiXs/uQXVxga10+70enN/Vz9gEaEBtSQHMsGK8EAtCb2YolIIR
	sXynSkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiVc-0000000Dxfp-2ZCa;
	Tue, 13 Oct 2026 19:50:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGiVa-0000000DxfA-0Tqa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 19:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791920997; x=1823456997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lnPyQoJzvaAoTOXa9xWNkSRU6Wm8vtyKKtmMcFZ4Ogg=;
  b=NiqQ/J/si82jlF40MFcNVKoaFJB81cewBXsx4y70Z0VBAgFL1jiu61Nr
   FEwz/YtgcNcB+S+zsPQxXcCErNnlK8T8oK/SXWXEqOXYFOhzfrbqM/jWt
   K2oVB9BqwYV1GhEPqQ+Lgqu/4BHtaTjMtLrGHaYC6o51c9S5IMD6SeGAe
   LwioShNU8Gm2THUjXT9ZO+/fY+7pL0VyFHuhtbQn0lU5e1A25he4BvGV3
   3xKYbB16iXVn8tRK1XiDXFwAOUs7eSYGsI8X6vnKmQPZ8ZFNKWqR5HUyb
   PH72BQzoEvtbNIJNza27SAkvJIOQgPYl7uXhvwTzA4klP0izDoh5NhN70
   w==;
X-CSE-ConnectionGUID: OxT+NZxtShudPuS1PDMCtQ==
X-CSE-MsgGUID: Ry8g32UiRP2/6svSsJvEug==
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="232072001"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 12:49:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 12:49:55 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 13 Oct 2026 12:49:53 -0700
Date: Tue, 13 Oct 2026 21:49:52 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: James Hilliard <james.hilliard1@gmail.com>
CC: <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
	<kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net-next v2] net: stmmac: leave the datapath running for
 normal-size MTU changes
Message-ID: <20261013194952.i7saki3p7zc2f2hm@DEN-DL-M70577>
References: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261013-stmmac-mtu-fastpath-v2-1-1e4ce8137689@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_124958_214689_B5FF0983 
X-CRM114-Status: UNSURE (   9.57  )
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

> When both MTUs are at most ETH_DATA_LEN, the receive buffer size and MAC
> receive limit do not change. Update the MTU without restarting the
> datapath.
> 
> This also avoids rebinding a live AF_XDP pool to a temporary RXQ. XDP
> rejects jumbo MTUs, so all supported XDP MTU changes take this path.
> Jumbo transitions still use the existing reopen path.
> 
> Found by source review while working on the stmmac MTU/resume recovery
> series. The fast path was tested on Allwinner H616 with sun8i EMAC1 and
> an AC300 PHY. The AF_XDP scenario was identified by inspection.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

