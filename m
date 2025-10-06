Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD7CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoFQMBlYipwDFvaTsOBn4UdYJMc+0URlt9FIb23R7fg=; b=iMo6heI19GvWAaBbXsDM7zKAI3
	g88Y8g8+da4b1mz84AfNhCbmITCJ3CwmnVhGtEyM+60wwzpJlzpV8kQLm2vBlIxvClpdETCK0mz88
	qiAD1AX36SPArHc1BZinTmBbE0qdDYnvqmAz4+TEHnLvtFJdo8wxMr4H0xSNbKe0RgZCGQKaek+6p
	Tywpvo2j7+k5o8ry8DsthPMKKsLSK3INdlrVu68rO4m/9KFaApUArAMO6QzMtiP4GX5tjd3cCL4nL
	j1gM5mXibDbAe4wSlZB173F9OmM2qat8QrrhmPFdT6/ej0asUJJObw4VkokRrOoIpb7XLAp1K5A1t
	hKFXKHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o1j-00000000OSD-2AZU;
	Mon, 06 Oct 2025 16:25:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o1i-00000000ORj-2qFY;
	Mon, 06 Oct 2025 16:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FoFQMBlYipwDFvaTsOBn4UdYJMc+0URlt9FIb23R7fg=; b=EgomTFyCnZkNRRuJAoUl5Nui1x
	z9SUFAn2dlYKhdB58I72766Q848PkOKnK9bwIEa575e3mYXmHkFT4iWGgt1w4/b8hLkE0Bs5IDD5T
	Zu90MMP2QsPhxm+pDloLIm8Pu/XILIrPZDnDAMAhspKEmq1mlgc7aHnqRpLcFRmK8i1OTNZ6xep69
	5FXYD4p3J7MhkayN/BHzilo1xDMfx+EYHwr9nx75ty24hE+5VpQ+VrAWzoXWW/McMmjFUVZ++K+c6
	Sn5cwbFcHLzRhJQcb0gE7EMH8c5ElKilzfjsvRIBOC1OEJWtz63qq2uCip76xVvEMsTDVQtaGjC8g
	4KIEWl0Q==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5o1f-0000000H2RM-36WV;
	Mon, 06 Oct 2025 16:25:29 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D3D1FB0B;
	Mon,  6 Oct 2025 18:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759767833;
	bh=t96uReInL8jGo3Qf+o1CqcdutAZiZPvLUIz8oEspw+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pz3OrF77gW3c1hVlJxiEGrX3qW1NwAm1e/KKNUZkcI0cwuC4WaFkUJ+W6d29CselO
	 CMFni65/6k+eTAXCg08FqkbzNhBYSluunBjHTl5hCVW8YWmnWhxnT4DHRbhzyQ4WPA
	 It+n/FyPIP4KHasiFIhHTUkDL/U87iZkeBVZ5X4k=
Date: Mon, 6 Oct 2025 19:25:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>, Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>, Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: rk3588-dw-hdmi-qp: Add
 tmds-enable-gpios property
Message-ID: <20251006162518.GJ5944@pendragon.ideasonboard.com>
References: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
 <20251005235542.1017-2-laurent.pinchart@ideasonboard.com>
 <c5kwmvu3j72evbgdmjn6qn5nqx7ywbiwpzhnpeh6hjjhbz5vwo@jpe3onblwhmy>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c5kwmvu3j72evbgdmjn6qn5nqx7ywbiwpzhnpeh6hjjhbz5vwo@jpe3onblwhmy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_172527_960018_24F37652 
X-CRM114-Status: GOOD (  16.99  )
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

On Mon, Oct 06, 2025 at 02:19:24PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 06, 2025 at 02:55:37AM +0300, Laurent Pinchart wrote:
> > From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > 
> > Add an optional property to RK3588 HDMI TX Controller binding describing
> > a GPIO line to be asserted when operating in HDMI 1.4/2.0 TMDS mode and
> > deasserted for HDMI 2.1 FRL.
> > 
> > This is used to control an external level shifter for HDMI data lines.
> > 
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> > index 96b4b088eebe..eec0d40c91ea 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
> > @@ -113,6 +113,13 @@ properties:
> >      description:
> >        Additional HDMI QP related data is accessed through VO GRF regs.
> >  
> > +  tmds-enable-gpios:
> > +    description:
> > +      Optional GPIO line to be asserted when operating in HDMI 1.4/2.0
> > +      TMDS mode and deasserted for HDMI 2.1 FRL. It can be used to control
> > +      an external level shifter for HDMI data lines.
> > +    maxItems: 1
> 
> Just my 2c: since TMDS is assumed to be a default mode, shouldn't this
> be a frl-enable-gpios instead?

I don't mind either way. Cristian, any opinion ?

> > +
> >  required:
> >    - compatible
> >    - reg

-- 
Regards,

Laurent Pinchart

