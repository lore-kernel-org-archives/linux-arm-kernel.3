Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44E6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 07:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVs8cPM5R3zbIuIup9svnibtyBfIsIM8W0uZi9cjy6I=; b=Sed9+Tdtz8w2CkRq7njNUDiAUV
	lZwKXUu8d0sJmZ6n7OERwQfol37V2p31Ff8Xh9/cI1yIm2KNNh9bOr4hKfv0rfWmyz6VEo5g3F9QK
	u4v8GDLBUaMNVPd3Qz6qrnvO0YuZaho56GGLhPSuik/HoWRIMJIKE1Fh/9ncRZbpzM31JntyGPhU/
	n7zck0NkeTLq3OiityykPEpGQkPoftCaxEwN7JAPNd6lmPteaC1mrIpW1AYNdV88zDo8rXtqdjU/8
	Bm0QcUOH/kYKuoeDRMCv7Vt8eOkloR1/BLNd7+9lGJNQLBDhLuEWLPJSBnOuh0fEAk1H0XzqADfbn
	LWuNewrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIKi-00000002mHz-1RX5;
	Fri, 09 May 2025 07:39:48 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIIg-00000002lyG-0FZa;
	Fri, 09 May 2025 07:37:43 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ED3AB260E2;
	Fri,  9 May 2025 09:37:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSzk7zSKnJSd; Fri,  9 May 2025 09:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746776256; bh=vyaf3O81ftGk4hXMqvkE+LhSreJTUx7RqGyR3ijoJoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQOx/pRAmqD1GFKciaR0iDR/hrxI9cX+Un8/Ux+TQfOaLdCnoQ4NTugMZ8wFLAL2l
	 ShN/qUsbnKUQvRQZXsvUHPrkIgt5dTh9rGKfGouNXoNe+CxvcJC/hy/8uzhpEkK95F
	 BpU51SO5Umd/7H7cjJ0tt9JMJno50tG1+TPWXJOKcegcbK1RrvDJHsvgpFEYrhbVEP
	 tMofglj2iBNwQBd+zDkZY97aBrOmue5x3DibPxd/2qJG2HSyVoRQkOp04VF28CjTOr
	 I8bqFUpPnVjulaG++Bm/wHZPRmyLZjqawThzkZhLYRsaeaj/AzFkhZom9MKRch7pxo
	 Wvam/vb1E8pLg==
Date: Fri, 9 May 2025 07:37:17 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <aB2wjKa1D832FKBH@pie.lan>
References: <20250509004121.36058-2-ziyao@disroot.org>
 <20250509004121.36058-4-ziyao@disroot.org>
 <20250509-secret-smart-kangaroo-fd3b58@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-secret-smart-kangaroo-fd3b58@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_003742_519709_565A773F 
X-CRM114-Status: GOOD (  15.14  )
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

On Fri, May 09, 2025 at 08:03:11AM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 09, 2025 at 12:41:19AM GMT, Yao Zi wrote:
> > Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> > or USB 3 mode. Document its compatible string.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> 
> Eh, no...
> 
> >  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> > index 888e6b2aac5a..bd064754e537 100644
> > --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> > @@ -12,6 +12,7 @@ maintainers:
> >  properties:
> >    compatible:
> >      enum:
> > +      - rockchip,rk3528-naneng-combphy
> >        - rockchip,rk3562-naneng-combphy
> >        - rockchip,rk3568-naneng-combphy
> >        - rockchip,rk3576-naneng-combphy
> > @@ -102,7 +103,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: rockchip,rk3588-naneng-combphy
> > +            enum:
> > +             - rockchip,rk3528-naneng-combphy
> 
> Still not tested. Neither v1 nor v2 was ever tested.

Oops, somehow I missed warnings about the indentation...

Thanks for pointing out, I'll drop the tags, wait until the prerequsite
series get merged and send v3 with this problem fixed.

> Best regards,
> Krzysztof
> 

Thanks,
Yao Zi

