Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFD6D5D683
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3HxVOUBt76AC6WLe7o07JkecNHctt3qyaCBDX9dXHw=; b=o3gogs5RJ8ZxYioIiJhnMT2fcu
	TwbTJC03iGYpJ4Kpl1BmY9r/i567Qwbo+1eGVLEhd1Esrj1RPh99HcT9Rwq7Wm351Eh8HjzEfiyqx
	ZJdCsVi7ZOFCRh4cyIQeYIC6nlMR0jgLkzAcgHSifIYgMRfiP0+w+fNt79uznNQ98/9J2DdvhrW4e
	wtZ7W6x559XBV1Sw5Myk3X2m5pn28zh9gRNlfMW1jh4zzfZhS7GiTIKkgw6kFrAbYD/oPjbfxKqSj
	ORrQ8qVHLQJJ2RhsAmONAVU9JMGTNbXkjcI0XrRYNwe24xaY5frL4xPDbiT0PRZM2JN9Ftdsuc9y5
	/ElL3Z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98Wr-0000000899V-34UY;
	Thu, 07 Nov 2024 19:50:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t982k-000000083ve-2xrS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731007186; x=1762543186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eN0VRTCZM2WBAT9cgFw9DTUrSpwbJpwTFubfXheWoYM=;
  b=Aqr9FNpqc0Vm4SXL9oki1pWvE48VFyRxojLIjoBsr0CX183bKKplLna9
   BPw21N5KZ9RiVZj/7fRKj39veFnZaUw6E2dQkgG5mY9zL2ySjTJWsZbwS
   2SvzmGGgOqivuohYtL+o/uYAoU11VWJdFCpeA1QdjSimKkJUZ9yodmTbX
   n6JcZHVd9CFv9ebwzSRodvicIrqFX9vJRHqCIL5d+KZJUObpPIMaRqA7S
   XKjlm8XBK+uqAMkFkruPeX9/KBfkWK/tVpd2EUA+4lXr45sVAgIyxJoCO
   XCz+u/FSZStnKlVh13rGRVmTF9aUajrK1UB+bLQVJWZZuizw7+nKo/GU0
   Q==;
X-CSE-ConnectionGUID: MDDVaqVhRqenuoSd1grXjg==
X-CSE-MsgGUID: wGoZR4F7TSiOLGn00rOoNA==
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="34539067"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Nov 2024 12:19:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Nov 2024 12:19:22 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Nov 2024 12:19:20 -0700
Date: Thu, 7 Nov 2024 19:19:19 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
	Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 0/9] Support external snapshots on dwmac1000
Message-ID: <20241107191919.sngc2x664lp7jeg2@DEN-DL-M70577>
References: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_111946_943465_37ACFFC2 
X-CRM114-Status: GOOD (  15.96  )
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

> Hi,
> 
> This V3 is just a rebase a V2 on top of net-next to address some minor
> conflicts. No changes were made.
> 
> This series is another take on the pervious work [1] done by
> Alexis Lothoré, that fixes the support for external snapshots
> timestamping in GMAC3-based devices.
> 
> Details on why this is needed are mentionned on the cover [2] from V1.
> 
> This V2 addresses multiple issues found in V1 :
> 
>  - The PTP_TCR register is configured from multiple places, as reported
>    by Alexis, so we need to make sure that the extts configuration
>    doesn't interfere with the hwtstamp configuration.
> 
>  - The interrupt management in V1 was incomplete, as the interrupt
>    wasn't correctly acked.
> 
>  - This series also makes so that we only enable the extts interrupt
>    when necessary.
> 
> [1]: https://lore.kernel.org/netdev/20230616100409.164583-1-alexis.lothore@bootlin.com/
> [2]: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxime.chevallier@bootlin.com/
> 
> Thanks Alexis for laying the groundwork for this,
> 
> Best regards,
> 
> Maxime
> 
> Link to V1: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxime.chevallier@bootlin.com/
> Link to V2: https://lore.kernel.org/netdev/20241104170251.2202270-1-maxime.chevallier@bootlin.com/

Hi Maxime,

Dont know much about this particular driver, but the patches looked good
to me!

For the series:

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

