Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E107C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+0EUTg8Om0IPSNzG6rxy9lo4eUp9UvMyxb5DYuifRI=; b=ATE9DoOAP3PqfARdZ4DJHeGHwv
	uaBVzrmPmPJE0l2tODazkfzYLccms9Vqhdqt2BYR01Z4eFYXXgzgo5/RjtTzKYnXPGHGdleWabPiZ
	0ALU+ux81OLyRWI7V4xPmOvVThyNAZZdITIE/1Isefiz7cDF7nl2HQ6fa6sDv8yeGhjZ/gLlNoySV
	0bPwo2wSn6R03qlgeOlIafIObpzwMCATV9CmFGTBrTEnuWGqY5nkutjax0QWEK6FRbOe+grXM0rK1
	c/D0UWbO/qwrU9e3D0cKt0lG5b9WBMOaEGjt+pecPVmbKI8txug0b7rLBU+Te7dXujsXpvRUHQZjJ
	H6X5frNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBB1Y-00000000cRq-1t29;
	Mon, 28 Sep 2026 13:04:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBB1V-00000000cRI-0CFX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790600641; x=1822136641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=65+7vKuEvhuWFc/lEOTdpPleihYib6cFiBpcE5AQo5U=;
  b=lJgOcj5g6jpbI5kvogzf9ZJwUgneieQtHVL0QGvNpvmVCojNNLTBL87E
   XqKZM7MTaBUlfzYuOoMdT1yKVTtholB1it096ot1e9AyFaHRjmxfLAFXg
   UKWI92vEaXofFT6CmFThSMXwhLwjfGf92TUg43jKz7KTKGYidqcg4f43K
   1SWpivhQmDwu15G75/UT41434f3j44BSxxYgGy1oV5RWtm66QIlKWF6lU
   MLaKIodTpd49u9wezEPkq8UW8cbmPsy86V/W+/tEDxwxJArJ9v3QskFIv
   zhWETg6DFjR/y3DrunFshw9MY7asOAGaaEzKdMWafrTWtE1W9xEObOT/N
   g==;
X-CSE-ConnectionGUID: iXTAp/08Sci8x7ZxUFv50w==
X-CSE-MsgGUID: hNDEykj2RiuvUDcZN6ZVLw==
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="295665390"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2026 06:04:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 28 Sep 2026 06:03:58 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 28 Sep 2026 06:03:56 -0700
Date: Mon, 28 Sep 2026 15:03:55 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Quentin Freimanis <quentin@q-lab.dev>
CC: <netdev@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: sparx5: skip ptp deinit if init was skipped
Message-ID: <20260928130355.jxs4iqcd6jfoxezp@DEN-DL-M70577>
References: <20260928044542.29287-1-quentin@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260928044542.29287-1-quentin@q-lab.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_060401_323756_6FECA986 
X-CRM114-Status: GOOD (  11.94  )
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

Hi Quentin,

> sparx5_ptp_init() returns early on the base lan969x variants
> because they do not have the SPX5_FEATURE_PTP flag. It also returns early
> when no "ptp" interrupt is described. Unbinding the driver then causes a
> NULL pointer dereference when cleaning up uninitialized tx_skbs queues:
> 
>     Unable to handle kernel NULL pointer dereference at virtual address
>     0000000000000008
>     Call trace:
>     skb_queue_purge_reason+0x68/0x120 (P)
>     sparx5_ptp_deinit+0x64/0xc0
>     mchp_sparx5_remove+0x38/0x70
>     platform_remove+0x20/0x30
>     device_remove+0x4c/0x80
> 
> Before per-port tx_skbs were added, a NULL dereference would have happened
> when calling ptp_clock_unregister() on the never-registered PTP clocks.
> 
> Fix by returning early in sparx5_ptp_deinit() if PTP is not used.
> 
> Fixes: 0933bd04047c ("net: sparx5: Add support for ptp clocks")
> Signed-off-by: Quentin Freimanis <quentin@q-lab.dev>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Tested-by: Daniel Machon <daniel.machon@microchip.com>

Thanks!

/Daniel

