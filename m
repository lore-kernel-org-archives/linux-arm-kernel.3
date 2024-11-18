Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC30D49209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDhOBdthdZ8Mh2YF4mnr2GwFfVGKTY6VSY78DW9JTfc=; b=KI5w21bEPpbhPVVfrL/AcVT8CY
	3JCs+Ks7hAypFL6wfIwDD9+A+pbMRyQSs4KNQwjoxAmLo9GTc2nOBtGrT6q3XAS8244IpFH+A5Vs2
	H516BPP1RJro+8M3C3IuSNaQSuR7UiPqfrpJumIWI3w2nYDDDgpsKio1ON9ftAvFJRSKJyHVnndCd
	wAejN0KUSok9WRSCNxkal6mM6GRPwOcHyHB4pVTztLGMTefiU8Psaz3LYrCdGOJzJNfzEDx5tLTgC
	tY5n2rpgUO0P3F0Uq7J0YrJtY2Fym7DOTBCJNUpghlWeiNW1RSYfoGzeAIh/dKWY7cqV4O52w5Dp3
	n9d2OPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzN6-000000099W9-2Ihv;
	Mon, 18 Nov 2024 10:52:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzLF-000000098wp-19ma
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731927049; x=1763463049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WHcuBnfq6kHAKbfDJXcBfPiEZxhyghgKgTGkb1xpg/A=;
  b=Oc8yQl+MlMLsucb5jpbSko0nvsAqLdwErl5wLner9uNHNn4Tkn6QJUhk
   Qq4IsIMShIA9nX8k0MwjShv66aTUfZrdVuY+INrPPxH4efuYtGfKyaVVI
   WOd/dr/86DsSu7xKpYondcezlTMikpEHnnJvN7tC2bImxdpBEOlgz+4vE
   37Nl3jgo3ZHpiOvL+5YvsrBf7OCNFWQL6lHpZ3O8Uffs64otJqs0fTuPB
   gSfEK1X4OjGcWOuJPH8rfFaFp3/XZ6pnFruGiSpimEO3uPZ3UYEXXI7NV
   Tlq9tPssG/6NlzFKh1LQZ5Xz8elUsggpD8niBzK8Yb71jIH8+Lo9/Jk6W
   w==;
X-CSE-ConnectionGUID: uRFJ4ooxRyO7bYFqsKsN5w==
X-CSE-MsgGUID: G0gMqKqvRCGGT/jdUE4tjA==
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="34949119"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 03:50:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 03:50:29 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 18 Nov 2024 03:50:25 -0700
Date: Mon, 18 Nov 2024 10:50:25 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Conor Dooley <conor@kernel.org>
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
Message-ID: <20241118105025.hjtji5cnl75rcrb4@DEN-DL-M70577>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
 <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
 <20241114-liquefy-chasing-a85e284f14b9@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241114-liquefy-chasing-a85e284f14b9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_025049_375514_481C60F3 
X-CRM114-Status: GOOD (  19.64  )
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

Hi Conor,

> > The lan969x switch device supports two RGMII port interfaces that can be
> > configured for MAC level rx and tx delays.
> > 
> > Document two new properties {rx,tx}-internal-delay-ps. Make them
> > required properties, if the phy-mode is one of: rgmii, rgmii_id,
> > rgmii-rxid or rgmii-txid. Also specify accepted values.
> > 
> > Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> > ---
> >  .../bindings/net/microchip,sparx5-switch.yaml        | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> > index dedfad526666..a3f2b70c5c77 100644
> > --- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> > +++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> > @@ -129,6 +129,26 @@ properties:
> >              minimum: 0
> >              maximum: 383
> >  
> > +        allOf:
> > +          - if:
> > +              properties:
> > +                phy-mode:
> > +                  contains:
> > +                    enum:
> > +                      - rgmii
> > +                      - rgmii-rxid
> > +                      - rgmii-txid
> > +                      - rgmii-id
> > +            then:
> > +              properties:
> > +                rx-internal-delay-ps:
> > +                  enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
> > +                tx-internal-delay-ps:
> > +                  enum: [0, 1000, 1700, 2000, 2500, 3000, 3300]
> 
> Properties should be define at the top level and constrained in the
> if/then parts. Please move the property definitions out, and just leave
> the required: bit here.
> 
> > +              required:
> > +                - rx-internal-delay-ps
> > +                - tx-internal-delay-ps
> 
> You've got no else, so these properties are valid even for !rgmii?
> 
> > +
> >          required:
> >            - reg
> >            - phys
> 
> Additionally, please move the conditional bits below the required
> property list.
> 
> Cheers,
> Conor.

I will be getting rid of the 'required' constraints in v3. What I hear
you say, is that the two {rx,tx}-internal-delay-ps properties (incl.
their enum values) should be moved out of the if/else and to the
top-level - can you confirm this? Is specifying the values
a property can take not considered a constraint?

Thanks,
Daniel

