Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB94C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWQfnp8zbk64+c1EQHIweK4Oi1mCcjaNI5dI4QLRVAk=; b=zQ8bY8wgBEQMen8lcMqsW/tfGF
	T4SX3z4RTgZK7+M2Y4Zan4eq+oPsIBjvV8D3aXya0KlD2msFKcoXPhvIpd5D+tF4A5mCbuk6edblw
	S2UDCpBUFiw33DshlrtwG710uIakacbF4Y/PqZ+e19Q9hpFMPPB5snje1hqRL6+fEJIjsxIromvAO
	sLrP1Sdb3kqegQzrTiadVJj3cVFXT+Y6KWwZr2UMGxE2zFDSX5mjp9BDWT5CDdplrEEPd1cMHP8Gn
	s0nHPf+2Bi4ZH33Ag5OBDHoSYmroCEND2FmxZhvPDzcB1EXcgTJtLjShNufDYscNq0e0z0OklrVrO
	k3Lc9GZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96Q6-00000006ROg-0R34;
	Tue, 22 Sep 2026 19:44:50 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96Q2-00000006ROA-3Vz9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:44:48 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-n5kd.prod.antispam.mailspamprotection.com; s=arckey; t=1790106286;
	 b=HBnnmLWlo35TOeZNE9CvaYKGXHjBzB+ZDTA5aLD9UeAOaD4WauD1VP6bFMqGDrT1gt6TCmwGlg
	  pA91dgvLt42SDsvBbUak/IMu+nzZ1lXiGuSymmjB+iN/OTo9lIfbchvv9RV1Moes8dLNV6hTiM
	  kWhjpOWV/9GePEo1F4I4sESU2c7Pzlrt9DhORLW9GRJOoIfMkkLHRp5EMvZhmdPxB48ckJO099
	  TDqTUZCLmfxFrZX+6Pc0JBAVpldC4Fv3q9kYDBcLN8+Ha0D27tsEUL0ooKABuO8QTpJeQTXoEi
	  +jTofyhGjjm1X6u8qSHdwvu7iqAF6slGDN7wUU9uBlmMgA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-n5kd.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-n5kd.prod.antispam.mailspamprotection.com; s=arckey; t=1790106286;
	bh=qOXrENOmvD3c0poDLwp4NolvBmbZT4OR8eyzCGaaZS8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=e18cUX8gya9LxUbMV4hBRJREZnMSn+gBMVRwh+O1hOynW3Ynin27Gd/HgE4dNJFgu1By76fDLz
	  ujv7E2OEuLn2R6bbgZD6Vf/nBLFFouY/9pSP2DEdJXZdY6da6VshH3LeBIFNKwrNmxXmBPiIj8
	  4LxXiz+Yi9TWonpo3+HtKgm1X2QFclEuoy+6kFM1URgohzhCROJeBEyQ0PnBrzZP5Ae/hVbL5u
	  vluYAljbc8cLX3UHvtlq9F4RdMDJm7dkNfUES+653b6j4Q5l74xM8FSHLKWZ/Kka04MIm82xEC
	  hcDyH8qGPKS82nl2yI53NTjw87AV8pz70p1+u1Drw7m7RQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=DWQfnp8zbk64+c1EQHIweK4Oi1mCcjaNI5dI4QLRVAk=; b=paOji0Gslss6hyI58TyTpupvSu
	sLUjh21sbEsnQ72nFhOzkLcEa17glOJtZ27cm690dj3AgSJe0CS7ooOIX/XzVFiQwmTm2VgqkhjTb
	No7PtuP08TZb30Sddfl9J4ZF82tO4853/UUlug4qfty6uvZMdtFMkR0puKF/T7Rqdg1E=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-n5kd.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x96Pz-00000007gKz-1VGv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=DWQfnp8zbk64+c1EQHIweK4Oi1mCcjaNI5dI4QLRVAk=; b=rmYcIKe1HfMMhU/P3OTu17bhSw
	6H/7sXovZu6EbKkWYT2OqOlOXqeJ6cDCDU9fLlM+3swg3mVL34qZF+TDEUKGxBzN44fRk3RuNeJ6K
	tmRsK8nIrsst1ZCw4FGr3KL7bfA5pSZtGuKcZusIF1+jkEVraGDF1oHKW9WCzXgWaNlg=;
Received: from [79.43.46.244] (port=60270 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x96Pe-00000000HKX-23nv;
	Tue, 22 Sep 2026 19:44:22 +0000
Date: Tue, 22 Sep 2026 21:44:20 +0200
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Message-ID: <arLZj2DxBazf3wMd@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKhbxi3Snbt1_Mn@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: b97c60ae1318829dfdeb67de68567e2e
X-AntiAbuse: ID - b97c60ae1318829dfdeb67de68567e2e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x96Pz-00000007gKz-1VGv-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-n5kd.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124447_062135_1F35F6B1 
X-CRM114-Status: GOOD (  29.62  )
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

On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > Add a new binding to describe remoteproc-provided virtio devices; while
> > these are discovered through a resource table parsed by the remoteproc
> > infrastructure at runtime, their description can be needed to probe
> > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > 
> > Each vdev is described by a dedicated "group" node, which then includes
> > a virtio-device node, which binding is already existent and used by
> > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > using its index inside the resource table as the reg property of the
> > node; this permits to have multiple instances of the same type of
> > device.
> > 
> > The binding is intended to be generic and adopted by any remoteproc
> > provider.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > new file mode 100644
> > index 000000000000..c4a0d84b1460
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Virtio devices over remoteproc
> > +
> > +description: |
> > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > +  and its resource table. For some of them, a device tree node might be needed
> > +  to describe remote undiscoverable hardware and/or connect consumers and
> > +  providers.
> > +
> > +maintainers:
> > +  - Francesco Valla <francesco@valla.it>
> > +
> > +properties:
> > +  virtio:
> > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^vdev@[0-9a-f]+$":
> > +        type: object
> > +
> > +        properties:
> > +          reg:
> > +            description: Virtio device index inside the resource table.
> > +            maxItems: 1
> > +
> > +        additionalProperties:
> > +          type: object
> > +          $ref: /schemas/virtio/virtio-device.yaml
> > +          maxItems: 1
> > +
> > +        required:
> > +          - reg
> > +
> > +    additionalProperties: false
> > +
> > +    required:
> > +      - '#address-cells'
> > +      - '#size-cells'
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    remoteproc-cm33 {
> > +      virtio {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          vdev@0 {
> > +              reg = <0>;
> > +
> 
> Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> provide their input on this.
>

AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
child nodes using the 'reg' property, not the node name. This I believe
is the preferred way of doing things.

> > +              gpio {
> > +                  compatible = "virtio,device29";
> > +
> > +                  gpio-controller;
> > +                  #gpio-cells = <2>;
> > +              };
> > +          };
> > +
> > +          vdev@1 {
> > +              reg = <1>;
> > +
> > +              i2c {
> > +                  compatible = "virtio,device22";
> > +
> > +                  #address-cells = <1>;
> > +                  #size-cells = <0>;
> > +
> > +                  eeprom@50 {
> > +                      compatible = "atmel,24c1025";
> > +                      reg = <0x50>;
> > +                  };
> 
> The previous patch introduced bindings for virtio SPI while the above two are
> for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
> everywhere.
>

This is because both GPIO and I2C bindings are already defined - even if
not used in the devicetree files part of the kernel tree.

Moving forward, I plan to submit at least the spi-virtio bindings as a
separate patch set, as they can be used independently of this one.

> > +              };
> > +          };
> > +      };
> > +    };
> > +...
> > 
> > -- 
> > 2.55.0
> >

Regards,
Francesco


