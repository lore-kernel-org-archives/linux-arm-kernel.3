Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBC5C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 07:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzO77ekcHTY/SEhOoTfIgi7v+qzS0N4+mTmWIjfWCR0=; b=KfDUPwcrXKuyje5vIvFV4c9Bjq
	1qmCA9tIKtuhGFp5ofRzxyfa0F3F9+NBb07+WNtP33kKVWHiTpigdo7N536fov6Jdvm9ID1LPMtok
	Npk8pS579wXMt3WJ4e4eZGQT5Iv6eUN/u1ofKzL5gS1iS16JM1aeIVxy41coAeavOVrRDVEDK4zpp
	tevNsAAjboNxzi/0C2Xuf5fBR2lOZUTINzxuqUvLSA7HZaAqcTbD8miGutWt46TcKBlbiBrVpyCZ8
	jCjOYzKjN/GEx+xN3NwMf/AnT9H+jz2/SAKl/Qbs+huqhjL0ZEWSsDn8/XsdO2XQOHgDbX/cN0BTc
	BWLzYLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvP9-0000000HYMf-2dYS;
	Thu, 08 May 2025 07:10:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvNB-0000000HY2u-0q4U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 07:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1746688129; x=1778224129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ro+fNqHlMjS5LfEr2nfJj/uKzW54Yi1ADwyqobeaERo=;
  b=DWZvPQotILnTYPmc2wG6v9dWYHdgYXdBWXhOCYbcnbEmXLgK0pf7uX6f
   5tGznxtvbaIeNkteK66ZcZuWD/shyBIvKMZilXk8Et4L7NvzD2lPJWh59
   fKruLPf66qcibcFiVuoNi0twLvkQwWH3ikf66y4vKWfgbErpQ1nAo3Mlk
   7WtXwTnpc+NzpvaRv7WJTNXFvagHZ/6H44dMJLcRoo6bJ3kxEe57Z06HO
   C652rUILkGlJewEG3LXlI+dRUvJ9eC6Mc9XaSr5qhOYY7pWJvhe44NeFF
   yQQI8T1hC9UkRlIL5uesvLtgj9OfNeHQ6nIzw/iB8hFWlrGmjM2bDy5mR
   A==;
X-CSE-ConnectionGUID: Lkz06igDQsq9icAK8YbzRw==
X-CSE-MsgGUID: r697ijZUQQ20/Ff89o04IQ==
X-IronPort-AV: E=Sophos;i="6.15,271,1739862000"; 
   d="scan'208";a="272726326"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 May 2025 00:08:46 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 8 May 2025 00:08:23 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 8 May 2025 00:08:22 -0700
Date: Thu, 8 May 2025 09:07:00 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Jason Xing <kerneljasonxing@gmail.com>
CC: <irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <bharat@chelsio.com>,
	<ayush.sawal@chelsio.com>, <UNGLinuxDriver@microchip.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <sgoutham@marvell.com>,
	<willemb@google.com>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>, Jason Xing
	<kernelxing@tencent.com>
Subject: Re: [PATCH net-next v1 4/4] net: lan966x: generate software
 timestamp just before the doorbell
Message-ID: <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250508033328.12507-5-kerneljasonxing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_000849_358934_B818DE0B 
X-CRM114-Status: GOOD (  15.82  )
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

The 05/08/2025 11:33, Jason Xing wrote:
> 
> From: Jason Xing <kernelxing@tencent.com>
> 
> Make sure the call of skb_tx_timestamp as close to the doorbell.
> 
> Signed-off-by: Jason Xing <kernelxing@tencent.com>
> ---
>  drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> index 502670718104..e030f23e5145 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> @@ -730,7 +730,6 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
>                 }
>         }
> 
> -       skb_tx_timestamp(skb);

Changing this will break the PHY timestamping because the frame gets
modified in the next line, meaning that the classify function will
always return PTP_CLASS_NONE.

Nacked-by: Horatiu Vultur <horatiu.vultur@microchip.com>

>         skb_push(skb, IFH_LEN_BYTES);
>         memcpy(skb->data, ifh, IFH_LEN_BYTES);
>         skb_put(skb, 4);
> @@ -768,6 +767,7 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *ifh, struct net_device *dev)
>                 next_dcb_buf->ptp = true;
> 
>         /* Start the transmission */
> +       skb_tx_timestamp(skb);
>         lan966x_fdma_tx_start(tx);
> 
>         return NETDEV_TX_OK;
> --
> 2.43.5
> 

-- 
/Horatiu

