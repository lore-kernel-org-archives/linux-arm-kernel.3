Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C470D44148
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmj4bvtxx/Xg8YNBYJtCFQMbrcm9clar1WvpWuy4YT8=; b=G77ERrU2zuX7fdZPN6YzzyyVLd
	aUr9ckw6TQwjXo/m27UCOcdMRc2UnxTn7EEbxMFdBvSFOAah0vtScYlE9BNgkFTj4ccPcw/GZRiZz
	bHbWioPCJX8kD4ChIZidxZq8owr0q3S5b/uKXO+xQTc0qgEQQB0uAspONZymA157HEXCkslie6C+M
	jzc2GGAfrDUbO0hCoB1iBvHWqdvaklvfgT6OKVTqkoqUeV2EozRBY/R+CnPpm2oQm3ZpHQsbuJPwO
	GeXbd/GDrFeG4+vhR55Hdo2149m5nfIl8X0vkLqFZkYOkGcVI5M4vcjfTNsQeuxjRWfTM+Bkn9hjL
	Fp/7Zl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMew-0000000CG32-1vF9;
	Tue, 19 Nov 2024 11:44:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMe0-0000000CFwN-1YRs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732016624; x=1763552624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oqBZU2s9GX4I4okgxGMVB9lX+KBfjQKxbdgLLlfDkEU=;
  b=r3vCLDI6Yp5xMaFC8NiEYMVQBg9R4pW3NZNHLMw9lSddFs4usKM2DgWh
   BHXMiGNPGR4gstez/rsUwu93Y763ost0ShaR3EnacWON8FXBkbU4sSicI
   RUVyOEhSkomFmoopN2AdagiCOD+oqxeEW3JObdNPU7ts0aXGBbOrxNd9j
   CLitqvz8ofXFfeHvGcHgDtJt24Wgv7CxeGZQv8YMNyWBN1VECDfQ8N6Jv
   sMp8s2cs4kAGm2U/AwuHvtxPZL5arhQ46ULQUeQfEvNSZo7j2I7xtLgxs
   W58tODuB2znl4LfUDMRbngpgx0kKKOS6XnFz7WDY9ApW6CL8iPvjCRdfP
   w==;
X-CSE-ConnectionGUID: BWklstq0SNCOj2gcHvaF3Q==
X-CSE-MsgGUID: 05g4JmwuT3OCtZoW+/CaAw==
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="34225248"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 04:43:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 04:43:08 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Nov 2024 04:43:05 -0700
Date: Tue, 19 Nov 2024 11:43:04 +0000
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
Message-ID: <20241119114304.u47srawc2t6ymvf6@DEN-DL-M70577>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
 <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
 <29ddbe38-3aac-4518-b9f3-4d228de08360@lunn.ch>
 <20241115092237.gzpat4x6kjipb2x7@DEN-DL-M70577>
 <5b9d79f1-ccdd-47c3-a02a-5ff0b12c1fb8@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5b9d79f1-ccdd-47c3-a02a-5ff0b12c1fb8@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_034344_683990_8C53B9DB 
X-CRM114-Status: GOOD (  23.86  )
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

> > Hi Andrew,
> >
> > > > The lan969x switch device supports two RGMII port interfaces that can be
> > > > configured for MAC level rx and tx delays.
> > > >
> > > > Document two new properties {rx,tx}-internal-delay-ps. Make them
> > > > required properties, if the phy-mode is one of: rgmii, rgmii_id,
> > > > rgmii-rxid or rgmii-txid. Also specify accepted values.
> > >
> > > This is unusual if you look at other uses of {rt}x-internal-delay-ps.
> > > It is generally an optional parameter, and states it defaults to 0 if
> > > missing, and is ignored by the driver if phy-mode is not an rgmii
> > > variant.
> >
> > Is unusual bad? :-)
> 
> Depends. Having a uniform usage is good, it causes less confusion. But
> strict enforcement also has its plus side.
> 
> > I thought that requiring the properties would make
> > misconfigurations (mismatching phy-modes and MAC delays) more obvious,
> > as you were forced to specify exactly what combination you want in the
> > DT.  Maybe not. I can change it,  no problem.
> 
> Do these ports only support RGMII? The general pattern is that ports
> supporting RGMII also support other modes, GMII, MII, rev-GMII,
> rev-MII etc. For these other modes RGMII delays are meaningless. The
> general pattern is that they are allowed in DT, but are just ignored.

RGMII and RMII.

> 
> If the LAN969x ports only support RGMII, and you are enforcing the
> four RGMII modes in DT, you could also enforce the delays are present
> and only have all allowed values. But i would not have the enforcement
> any more strict than the other ports. Do you enforce the phy-modes for
> the ports with a PCS?

No, we do not enforce that in the DT. For the PCS ports, you can specify
whatever phy-mode in the DT, and if that phy-mode is not advertised in
the driver, it will just be rejected.

I decided to go ahead with v3 (which needs to be reposted when net-next
opens), where the properties are not required.

> 
>         Andrew

Thanks for your feedback.

/Daniel

