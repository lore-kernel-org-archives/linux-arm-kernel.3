Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A818CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDibKTNg7aMpsDKBtL5lDH29Mz73OkCRNwPPaW2m0Do=; b=rdr3CMOOKk0LylRMI5D9FrBtSY
	dcVBS09IoFJIFWT3yBZKaRsB/Uj8LERx0n+GDJIsseHM9ql6PkjxshdDETgMrYGEJeV70cUmhYa5o
	dleIT/3zT45dZ1OtioHbGEfYMcxZEM6JqJt26AKUX4jGZCvbVaYxaCOEzjW75rFcOsSZXg9Ym0E9/
	5g45b79TvLBFj39m/1atM7FSgMe/NaBRI4uOwxiIGGO2nR7MTobAQCRy4XrtWULb14/Jub1uBBHjZ
	NSD7EpPST0Ec1gaoV7hjyZXsqPK02Yy9Y4WFbqKx+PXKYkltH4HlVxqE1+fOoDjLGorKBky5mbtq2
	6yr75Cvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9aJ-0000000GdP2-1Lil;
	Thu, 18 Sep 2025 08:01:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9aG-0000000GdMz-0A37
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758182499; x=1789718499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GitsJ9J2ZxRBpzFRs9d6d4RHKJvAuTWGEya7GTtLh3Y=;
  b=CHV7jag75TWCw3JOzemw0KZrl3xFptKu6beX4GCZRMo0Vq9G/CNaoA9R
   d0mxs5ouHPTUdIAgrlZLwOtijnVpOp3O2AtrlJvZjSiw9JjEYzX9Q/Ue4
   LRJYJVkYApd2zZiEgXoPYjEA3aMJbtQmrgdgx3Y6Gee4LHfCLRxG0pcTp
   4zXBpTKeacCSjqMYBb95LJaDhlQGZMgiiRYcaT5yO371I2GA8FCyrtDty
   ocsk+0aaZgasq6H8xd0yuwShECYG8y1rZQy9ayrb2Y6LgDgZkMTcXtGwt
   YR7nRNAox2dbed9bMOCzNS2krW8Xu1S1d14Navx9v5KL9X49wtfCG5KpK
   g==;
X-CSE-ConnectionGUID: hokfViyiR5iF+MmU87atWw==
X-CSE-MsgGUID: TamkIHysT26rgc6+80UfDA==
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="46084901"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 01:01:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 01:01:04 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Sep 2025 01:01:02 -0700
Date: Thu, 18 Sep 2025 08:01:01 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<luka.perkov@sartura.hr>, <benjamin.ryzman@canonical.com>
Subject: Re: [PATCH net-next] net: ethernet: microchip: sparx5: make it
 selectable for ARCH_LAN969X
Message-ID: <20250918080101.ejpdio7bxary44rj@DEN-DL-M70577>
References: <20250917110106.55219-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250917110106.55219-1-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_010140_351823_B0218504 
X-CRM114-Status: GOOD (  14.43  )
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

> LAN969x switchdev support depends on the SparX-5 core,so make it selectable
> for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/net/ethernet/microchip/sparx5/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/Kconfig b/drivers/net/ethernet/microchip/sparx5/Kconfig
> index 35e1c0cf345e..a4d6706590d2 100644
> --- a/drivers/net/ethernet/microchip/sparx5/Kconfig
> +++ b/drivers/net/ethernet/microchip/sparx5/Kconfig
> @@ -3,7 +3,7 @@ config SPARX5_SWITCH
>         depends on NET_SWITCHDEV
>         depends on HAS_IOMEM
>         depends on OF
> -       depends on ARCH_SPARX5 || COMPILE_TEST
> +       depends on ARCH_SPARX5 || ARCH_LAN969X || COMPILE_TEST
>         depends on PTP_1588_CLOCK_OPTIONAL
>         depends on BRIDGE || BRIDGE=n
>         select PHYLINK
> --
> 2.51.0
>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com> 

