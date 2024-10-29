Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E63D2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vleHK3XScVNSHFgR+LQgkw0wFslG8DEdIFQYcAODAG8=; b=0jsTKxDoWAarHqdG8bgKuuYTRi
	3u09OcMIYBerQjQgj6iJPxbsv7m/hMqlQmh4XE6+8Umfy01lMj/sbeiRyykf77XM54DEt8TXmukre
	h0d+FawZOdz2AbD4XoVFXLRTeSs9U1XAtx5GapsahsPvBJC5swn0I0Rm+SkqCvRSLGbNs3OpoytDj
	5yqUWGKu1XmN2c0BNAWKW2fIQFt3Bw8Y1u61wOzz0xxqFizmNu9C6Qv1GFPLtui/4bNH5Yrf3v4Ww
	m0g1ifGF0qvkV6uvQZGOZUsS8+pA13I+BWUyhZ3g1xup+8MB2S4YOARFoI5FbzU+R5W0AO7ZNzmW4
	SxCX/ftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lkD-0000000ETco-1A7m;
	Tue, 29 Oct 2024 12:54:45 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kzc-0000000ELGV-2tnp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:06:38 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TC6Jqr082788;
	Tue, 29 Oct 2024 07:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730203579;
	bh=vleHK3XScVNSHFgR+LQgkw0wFslG8DEdIFQYcAODAG8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UOmyXc/GjREFKZfz1gHByJxUVWMo2HvNObQIZCI486LO+0ivX0qa4lqwCWhX/5Nb/
	 V5nmHu83s6v+f179ZbbCKfypf/jlmjkb0k0famLNsMgegt7LJs6MnRGR6u2H5ETrfY
	 FNksVbPgJEhJudEmtX4iBQaUyrWXLjQ3txrlwgoA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49TC6JVS001220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 07:06:19 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 07:06:18 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 07:06:18 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TC6IVo130170;
	Tue, 29 Oct 2024 07:06:18 -0500
Date: Tue, 29 Oct 2024 07:06:18 -0500
From: Nishanth Menon <nm@ti.com>
To: Dhruva Gole <d-gole@ti.com>
CC: Markus Schneider-Pargmann <msp@baylibre.com>,
        Chandrasekar Ramakrishnan
	<rcsekar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, <linux-can@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin
 Hilman <khilman@baylibre.com>,
        Simon Horman <horms@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/9] dt-bindings: can: m_can: Add vio-supply
Message-ID: <20241029120618.swcxgr3lyv5r7ryi@stoplight>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
 <20241028-topic-mcan-wakeup-source-v6-12-v5-2-33edc0aba629@baylibre.com>
 <20241029065819.w6jc5nrputccuxjo@lcpd911>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029065819.w6jc5nrputccuxjo@lcpd911>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_050636_839927_3278D32B 
X-CRM114-Status: GOOD (  18.89  )
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

On 12:28-20241029, Dhruva Gole wrote:
> On Oct 28, 2024 at 18:38:08 +0100, Markus Schneider-Pargmann wrote:
> > The m_can unit can be integrated in different ways. For AM62 the unit is
> > integrated in different parts of the system (MCU or Main domain) and can
> > be powered by different external power sources. For example on am62-lp-sk
> > mcu_mcan0 and mcu_mcan1 are powered through VDDSHV_CANUART by an
> > external regulator. To be able to describe these relationships, add a
> > vio-supply property to this binding.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> > index 0c1f9fa7371897d45539ead49c9d290fb4966f30..aac2add319e240f4f561b755f41bf267b807ebcd 100644
> > --- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> > +++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
> > @@ -140,6 +140,10 @@ properties:
> >  
> >    wakeup-source: true
> >  
> > +  vio-supply:
> > +    description:
> > +      Reference to the main power supply of the unit.
> > +
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>


Might want to conclude on the usage model discussed in [1]


[1] https://lore.kernel.org/all/20241029120302.3twkliytrn5hjufi@sleek/

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

