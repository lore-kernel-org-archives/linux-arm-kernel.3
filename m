Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EFED6DDEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ml96DiVVsDQGy9XQR386I35YLc3oxUICFrH7c+RzUQ=; b=0LMZTXpAEhiVCBGqH4x58VIk+4
	vahbjbOXHyUHouRkE5FXGv1Ijd52T4n8vbFCIk3aPHQ+HzMgfLd1G8jwaKbWPhNNBXk5zvmK9mxOP
	nAwkzel6t8vU/ibNg8EUAPQdhnQo2CAaRdZlHUm4TxtfjMzoUzX0nvb7nC0lmP1mwUMBZWcoxZxW1
	JVzlpgmuZE4F2uAxWcE3UQ4GyIQboirLd8rYx/6GagrBt4Q35sqsjNQEeo9I78/udFnRgB1DyohtH
	z4bU+JOja4lz+k3kRfmBx0++dFP73vEK8zfQ27h7qMDTAEUOmPR+jxl62dGQwdH+ifQhRKGlnhBN+
	sngI76yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsYl-00000002BTT-0NAI;
	Fri, 15 Nov 2024 09:24:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsXn-00000002BII-0xeN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731662591; x=1763198591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nbuhk+CaUW9mRbVIzoPXH9V8FF1V83ATXwEiP9WhI7A=;
  b=HpTuPnKbBjIVXXjjdoIA0i4uQy1X6zBxc/G/T4mBSNzSCiZ73EcCve3a
   BnaP6T1aWjLwf8ChngTLdsdBguNlWjOv0bEqcyjgIEvU1MnL69STDvnA1
   X3daHEkSX9cwp9OHSjyRcHEsdcLodU3PAbS5arGC7Fx++TaR0d8EYIqtO
   tkPgI2xP9UT+xeTmhBbR+tz8J2p9vt3NADjHW/AK0YxyOQEbPxDKV9pFe
   zJuiCImyfq/0aJYssk2tjfTaRWU4qgUB+J9vtT0ZysR3vy/0dgR3iRCfM
   U4oab8M99Te00Sz8vCLvsDBveulMyXFPYsqYdJX6foID06xfZFwbffAJh
   g==;
X-CSE-ConnectionGUID: sSmUfU85Rbizj9448fniyw==
X-CSE-MsgGUID: sf/zJ0QfQIWXKVwBjtgE9A==
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="34091113"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Nov 2024 02:23:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Nov 2024 02:22:41 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 15 Nov 2024 02:22:38 -0700
Date: Fri, 15 Nov 2024 09:22:37 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v2 8/8] dt-bindings: net: sparx5: document RGMII
 MAC delays
Message-ID: <20241115092237.gzpat4x6kjipb2x7@DEN-DL-M70577>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
 <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
 <29ddbe38-3aac-4518-b9f3-4d228de08360@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <29ddbe38-3aac-4518-b9f3-4d228de08360@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_012311_439429_7A42949E 
X-CRM114-Status: GOOD (  12.39  )
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

Hi Andrew,

> > The lan969x switch device supports two RGMII port interfaces that can be
> > configured for MAC level rx and tx delays.
> >
> > Document two new properties {rx,tx}-internal-delay-ps. Make them
> > required properties, if the phy-mode is one of: rgmii, rgmii_id,
> > rgmii-rxid or rgmii-txid. Also specify accepted values.
> 
> This is unusual if you look at other uses of {rt}x-internal-delay-ps.
> It is generally an optional parameter, and states it defaults to 0 if
> missing, and is ignored by the driver if phy-mode is not an rgmii
> variant.

Is unusual bad? :-) I thought that requiring the properties would make
misconfigurations (mismatching phy-modes and MAC delays) more obvious,
as you were forced to specify exactly what combination you want in the
DT.  Maybe not. I can change it,  no problem.

/Daniel


> 
>         Andrew




