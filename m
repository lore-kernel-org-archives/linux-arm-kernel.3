Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A6CD6392B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 11:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JD6Q0AF4IL+tveqt140Uoo1vUpxOpAe93KG596wdcng=; b=QjxQUKbUGg/DWvPnZZAmzZ7w8v
	ovRLHadkaUdvjhbyyVOvrpJbxhD7wwnh1Ib7lYh9KE4aL1XOzRQTOkqRY/u893s9dEYHpLrpo/+6F
	pMrSnbs5mGqW5XXel9g8zw7fCaj22pywCw+tBufgf/zTndhWwvfsRS5QlyNsK2Z4+Sa1xEEqaFNec
	MIxe36jpSV1clCcOsyuJZE2tZ7ZLq5/CIb0v6QzTFx1bLGwALLd3setPmRC7hUymgJyH/Av8lNvmR
	fzfoROetRlD/emwadCsXnD29BStmubM2ZLlHAyx/biQJ0ECq5Jokh1kZYADcsTChVuAw7hQZgD3nJ
	cbPYsktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiXL-0000000F9FA-2AOd;
	Wed, 20 Nov 2024 11:06:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiLU-0000000F6ay-271Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732100045; x=1763636045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRTIDN51JL/cogJ/vUoE/+DQZzQcXO8SLlktLuDSSOQ=;
  b=KRUd8/pVhxLJsMFfa48si6TSwTWfH0cu8R60A0ll2xG2dokCYUXBMC4J
   RHm+VBFJGeW/5TjnNw+xIoMX8wn0Vp2GeFtpfnq5gefIkvHYkjvA9SjWf
   pwgI5EK2tjFWKpQWLCsbEZZlO0A3Xl+CnC03jba055ynL0W2tP9PbQvsi
   2tkD6Se5AeShs5mMHoee0LnyXqHUcCWPNv3N0OegLQXx5IJb+cukOaYqn
   oGgbQOwcfwK/RGMIPgsOK9ymOl2Jx1DuRk0PcvMdF7yWcZ2XHtvSbsjNf
   jwq2NGGu3o69UxqhoWmzpNf4BLNCfHzgkdu942YcvE2qe5IM/LSwlBC7P
   g==;
X-CSE-ConnectionGUID: l6dfGwaoTuOG0Dm/0vQtQA==
X-CSE-MsgGUID: 3fEx3WBgQ26eSFJw4tYAgg==
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="265717867"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2024 03:54:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Nov 2024 03:53:40 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Nov 2024 03:53:37 -0700
Date: Wed, 20 Nov 2024 10:53:36 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v3 8/8] dt-bindings: net: sparx5: document RGMII
 delays
Message-ID: <20241120105336.3wheaindiv5q3uvj@DEN-DL-M70577>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
 <20241118-sparx5-lan969x-switch-driver-4-v3-8-3cefee5e7e3a@microchip.com>
 <20241119182255.GA1967508-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241119182255.GA1967508-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025404_544921_03C85606 
X-CRM114-Status: GOOD (  19.67  )
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

Hi Rob,

> > The lan969x switch device supports two RGMII port interfaces that can be
> > configured for MAC level rx and tx delays.
> >
> > Document two new properties {rx,tx}-internal-delay-ps. Make them
> > required properties, if the phy-mode is one of: rgmii, rgmii_id,
> > rgmii-rxid or rgmii-txid. Also specify accepted values.
> 
> Doesn't look like they are required to me.

Commit description needs updating. Thanks for catching this!

> 
> >
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> > ---
> >  .../bindings/net/microchip,sparx5-switch.yaml          | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> > index dedfad526666..2e9ef0f7bb4b 100644
> > --- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> > +++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> > @@ -129,6 +129,24 @@ properties:
> >              minimum: 0
> >              maximum: 383
> >
> > +          rx-internal-delay-ps:
> > +            description: |
> 
> Don't need '|' if there is not formatting to preserve.

Ack.

> 
> > +              RGMII Receive Clock Delay defined in pico seconds, used to select
> > +              the DLL phase shift between 1000 ps (45 degree shift at 1Gbps) and
> > +              3300 ps (147 degree shift at 1Gbps). A value of 0 ps will disable
> > +              any delay. The Default is no delay.
> > +            enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
> > +            default: 0
> > +
> > +          tx-internal-delay-ps:
> > +            description: |
> > +              RGMII Transmit Clock Delay defined in pico seconds, used to select
> > +              the DLL phase shift between 1000 ps (45 degree shift at 1Gbps) and
> > +              3300 ps (147 degree shift at 1Gbps). A value of 0 ps will disable
> > +              any delay. The Default is no delay.
> > +            enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
> > +            default: 0
> > +
> >          required:
> >            - reg
> >            - phys
> >
> > --
> > 2.34.1
> >

/Daniel

