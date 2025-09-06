Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7C8CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IP7rUBaz1mvKnSQijXZkfLhmJRgyKEeoaWImepnoHPM=; b=HV8AbWCGZeLNDdIdfl4ktUV1iL
	P6KIsAME+/XWlAFo5h79VpclNGT7PsANYExfUpt47o7KEFuY8DblWnGtnWSAhJ5wum00puKKC//C+
	pj1UJ+8ZL+ANyOxWeYTVXiikbx4geAgRz/q0GWBf7oCGiVezW5J7koxxLNf3ewtuBgDf1CBZ0SOVF
	qHbm3fkDWJuLlXthHrCdN7gHBqyqRDHWiTEdYO20jMMmu8lD40rcwXXQsm2syUezw4sxBo86X73aw
	ZAl1nZiK5YTq/En8qRCyfygFBrCIJ/WkId5b9Jfmih2AbCCtd4k24cc66GvR1kyqB/x47+gU/tket
	nDWEelcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxB7-00000008EQC-1Pkq;
	Sat, 06 Sep 2025 17:58:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uux8A-00000008EDm-0N9i;
	Sat, 06 Sep 2025 17:55:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757181295; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WNxEioriaEs/u+KCseNI2dB68EOHRgf0F+l9UmkTxpaMjOTaqo7u92cu+ELDxOq6VauP91oW2ZnCuFdGdIQG226W+TRDWmCwA6K1lZfffMI7N5jNd0xsoKMeTVR1IK7VMxAMZB0evgvqsPZF3Nuz8Jix1RWyYjfVfQelO0JUG6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757181295; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IP7rUBaz1mvKnSQijXZkfLhmJRgyKEeoaWImepnoHPM=; 
	b=mM+byTotFb+OP9BafKuB5zHSQdFPMwb3RQYFI8+0FJmDjAyweLe7SNCFmWy+36m5UCxNSlRPRyu0GAm8QbEmAmilnIpWvS5mwtSI5Vs3PEYrSxv5JBfOOaVstU2l2TGJaQBFEzZvZOkP023kXkSiEAzAJ3ZZKPwVhvEWRN0EGdc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757181295;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=IP7rUBaz1mvKnSQijXZkfLhmJRgyKEeoaWImepnoHPM=;
	b=Vo8En1fHBjlORqqr4nwH2t1Ko4oGKDiIZXye5dpPTJTXQ0z0uomJitKJBaxlGxz0
	Hyf/qh7Sf5IUbhGDXsb0Bl7OJakZbjMGKA4FFAayKBvo3sM8/nDtjSqFD7NHQPPAjTa
	lnvN1396nqMaHKXIkhA6srQFSndnyRG4BHZ+RY68=
Received: by mx.zohomail.com with SMTPS id 1757181293913862.8978758635274;
	Sat, 6 Sep 2025 10:54:53 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Date: Sat, 06 Sep 2025 19:54:46 +0200
Message-ID: <13801600.O9o76ZdvQC@workhorse>
In-Reply-To: <20250905232657.GA1497794-robh@kernel.org>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
 <20250905232657.GA1497794-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_105518_157540_5F29FD22 
X-CRM114-Status: GOOD (  28.23  )
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

On Saturday, 6 September 2025 01:26:57 Central European Summer Time Rob Herring wrote:
> On Fri, Sep 05, 2025 at 12:22:57PM +0200, Nicolas Frattaroli wrote:
> > The Mali-based GPU on the MediaTek MT8196 SoC is shackled to its concept
> > of "MFlexGraphics", which in this iteration includes an embedded MCU
> > that needs to be poked to power on the GPU, and is in charge of
> > controlling all the clocks and regulators.
> > 
> > In return, it lets us omit the OPP tables from the device tree, as those
> > can now be enumerated at runtime from the MCU.
> > 
> > Add the mediatek,mt8196-mali compatible, and a performance-controller
> > property which points to a node representing such setups. It's required
> > on mt8196 devices.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 36 +++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > index a5b4e00217587c5d1f889094e2fff7b76e6148eb..6df802e900b744d226395c29f8d87fb6d3282d26 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - items:
> >            - enum:
> >                - rockchip,rk3588-mali
> > +              - mediatek,mt8196-mali
> >            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
> >  
> >    reg:
> > @@ -53,6 +54,13 @@ properties:
> >    opp-table:
> >      type: object
> >  
> > +  performance-controller:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle of a device that controls this GPU's power and frequency,
> > +      if any. If present, this is usually in the form of some specialised
> > +      embedded MCU.
> 
> We already abuse power-domains binding with both power and performance. 
> There's a performance-domain binding too, but only used on one platform 
> for CPUs (Mediatek too IIRC). Or perhaps you could just point to an 
> empty OPP table. I don't think you have anything new here, so don't 
> invent something new.

Oops, yeah, I forgot about performance-domain already existing. I agree
that it looks like a good fit; iirc I initially disregarded it because
I thought it was an actual heterogenous core cpufreq-y thing I'd be
overloading with new meaning, but I see now that this is not so, and
aside from mediatek, Apple appears to be the only user.

Thanks for the fast review.

Kind regards,
Nicolas Frattaroli

> 
> Rob
> 





