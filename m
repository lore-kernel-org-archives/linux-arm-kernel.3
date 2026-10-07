Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A2ACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 00:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=; b=mLQV+qwCDcOpwUNHISZV7/XVZD
	i7LQg7Oa7O+niVL/EkkwtEuBE4bKL9qG6acXQ3AJrsrnYwzFwFrWPDds7G+juaRbsvVrNFmbDIbVv
	J5GbS2CqQt7P90OeMnV52VNJMCX0eABHilD12mdihlu63KqtVQjvu/FoiBBqVzb3vBFPjWC+Wiyxo
	wPHbaJwgYGJKmnCekPFF6Qu4yO3JsQpasvfuUtmMm4Hyn2DtI4E6Brat//zP2Fh5DkAoXeNpPkSRE
	5yxCGVHDPdGdihu+/3zbBaMj9jeLfRGFFbkqVq/0QOxOqectdjs0hmzW51MbUoFvNPT00avFbSHJB
	HGdqO4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFtB-00000001YBO-01sr;
	Wed, 07 Oct 2026 00:52:09 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEFt7-00000001YAz-3YqI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 00:52:07 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6af9befd04cso4855292a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 17:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334324; cv=none;
        d=google.com; s=arc-20260327;
        b=U91GGVz8AopXb5l1GAn8Nk8g2TMVEX0icYXTxNns9IIZbKoumIq/xC5UF0vGOnjijF
         VnfkIroUE1jdLP8zWv//IRJb1t8oowbdGm2WtsAEhZ8pmsFw7ek4wUUvtUjCpiCsha81
         5bh+bRKZhJaRtv5PGmcJOvHrZtY4DTg2AUnqk/SiFYBsYvgjPBPickg/z0dVvuJO1PnB
         npdWqqeM2Q5Mrb7UdJz0YlSw0kxJZ2ktU+wlQhToR9B5wg3wU2zGF7suCiV+VpqWp6kM
         UeYIYkvqggJf+ef2eiBrLQvWUT6zMkx0jBU7OlYzKmpr2TF3lXrzXyz8OsDUF2DsrKzK
         ki0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        fh=bJw1m0v31YDt1QEAphnuKUJi2liv1jl6jp8/G4lmqGg=;
        b=USbGv0hRspGuBH9d8WfQX7ZCHrzc0TRAjYXlcurrJLlzTJzKywWDMo1FhDOW/aN8wP
         qWKrNcD53pqp48VHwXmL3K3J+XEh75qfttq1L4kAG/PqecKpbe8b288lHhLmdKZdeq20
         r8C8UpCvJ09rEXW+EEaHNzMoDNCEBGWZtPBg7/lSpbwepyiM9we+3YqgqBI6zlmgs1aE
         TfvX+yoIRwBiVuRkZhFYKY+UVww6nlslRr8z60+yEliQE0LZlUoZ8S9fepfh4Plxk6Sm
         NtnboxIEDCc7gb4psYLpXqDvAZv41h9AvXfsj1lwJna9a3nj/2+d2gjhAXDgnrfGVtdg
         Eysg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334324; x=1791939124; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=ogvGVsmg3rQih8kfNJNdl+73c+ps3i5yhfak53+K5cG4xyUdKMxykT4QVYFsgoTPPY
         s5nCRAexNxA9UrK6WI029c2Il1Xpgnv3KjK3OQWBG4/IQjaqI6D50m8Or+bZyitc3aAB
         4brXbkD/IfKLwGqjFvR5AS6EVozNZEDXVsjsSmNxnkV5XsiOyReXp7ohyWAnHtNFKLu0
         cuK3jYx2HpBrICYQzbuYat3RcAU3K0fGGGC/mgy3VgX/J/wBBfV4hWR+Z7sq+2a7F7Vg
         7N3XtfYiE/ZL0oqDy26qKU9Z/Tt2RXzDri+LNTIMDtLIVpx21ngDKoNTdwWI42x4oOzU
         L8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334324; x=1791939124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=kT/T+0DeMnNN1v7mN3PrYg7SfwD9DjyLTgqahe8s6u+OO6k144M4PUdwYstYzDnfmP
         RZd59YTEauorVJeQXteXPheGHN2otJPg9lLBJYhjEhl1kwevJUxzdkYXaq2mDuETQXGl
         qnCHcaFXVSBA7Mkr+u4rJeOTcVECNJte4NGIEbjhZWHMd84CotRby77T2ocHM0wGCGVZ
         yilTvMA3lCI7wbYEFFRW94dd7DM8o72w9gcRpykwnmG2+uvULjibK91jQQTsCAIVbhaw
         JFEvjH9wjPHSCGk5B4cqRBao4UKi/OWHpZtkT55NKgybSQqS9uyCMT0HVVuvl65gPVZQ
         1m8A==
X-Forwarded-Encrypted: i=1; AKwUvBxt3pf0iB9onPfTS5PnHjIP8OJ7ubAegFkpsRa3ppDZuIR0bmkWjm1i2ixxnBFteqpdKVhlf70dhPOVIQqhiF1l@lists.infradead.org
X-Gm-Message-State: AFq9FYIUgBef6QCKQinzJ0NgQql4Ap8ueYoltJ2HUDTj6yWV4CY8ZwM1
	kIk4NalgJysgnAQcHw4dyLNrTPqdbtNU7Qc5+wLbyQFIcKieT71YCpc1oy6brJ9O7wQJk49GFzp
	0idj4aV15ddNZ2q8YmrK2fcGXbwGGRKXEFFk/5MlViQ==
X-Gm-Gg: AYBFou0DTmZrBgRxpIkW4jMaPGhzLva9vZzDGJT3mgCaSzlqHNHhpAQVwMYum3+/sHS
	pdOJl4gSURE5ZVuXxRuoqe4eBWZAuvuAXfBvYK92K/Ndvdn923cubbGHdpp9y0AX+8c1hqvdFlQ
	9Nn3PBhpP2B9DNbhlKeW7dl0NYX8F7gZRXAi6aW32pNlswzVIlt1Owv6rUQWE9mNdRRroe4pf5B
	n11blF9LL+JZF+ha2CmrtNP39lDcdu43OY9lSNNYVP/bi30Vd3vIVWL1PAxX1tdHGFlYm+/Casl
	91H9fcI/1NL0MsVhy0KfhtcVZ3Xuo2YR56ZbFqETv4UVsRHS/VQpiQ==
X-Received: by 2002:a05:6402:455a:b0:6ac:73f8:2e50 with SMTP id
 4fb4d7f45d1cf-6aff29b8a9dmr558035a12.43.1791334323774; Tue, 06 Oct 2026
 17:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater> <20261006183910.GA2890477-robh@kernel.org>
In-Reply-To: <20261006183910.GA2890477-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 18:51:52 -0600
X-Gm-Features: AclHuK8OpBmmKBzqQvP8CWwB7vUNA7khdkA2Xv5tnX4fcSWpzyBVTx2EHup08IU
Message-ID: <CANLsYkwhrqk0nQNFuP_5aMYQCLGsLrzm-z9YP+Fvv-C1Ug8trg@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Rob Herring <robh@kernel.org>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_175205_965299_89EED15D 
X-CRM114-Status: GOOD (  36.48  )
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

On Tue, 6 Oct 2026 at 12:39, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 22, 2026 at 09:44:20PM +0200, Francesco Valla wrote:
> > On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > > these are discovered through a resource table parsed by the remoteproc
> > > > infrastructure at runtime, their description can be needed to probe
> > > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > > >
> > > > Each vdev is described by a dedicated "group" node, which then includes
> > > > a virtio-device node, which binding is already existent and used by
> > > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > > using its index inside the resource table as the reg property of the
> > > > node; this permits to have multiple instances of the same type of
> > > > device.
> > > >
> > > > The binding is intended to be generic and adopted by any remoteproc
> > > > provider.
> > > >
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > new file mode 100644
> > > > index 000000000000..c4a0d84b1460
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Virtio devices over remoteproc
> > > > +
> > > > +description: |
> > > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > > +  and its resource table. For some of them, a device tree node might be needed
> > > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > > +  providers.
> > > > +
> > > > +maintainers:
> > > > +  - Francesco Valla <francesco@valla.it>
> > > > +
> > > > +properties:
> > > > +  virtio:
> > > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +    patternProperties:
> > > > +      "^vdev@[0-9a-f]+$":
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            description: Virtio device index inside the resource table.
>

There are 2 configurations we need to account for: (1) each device
located behind the remote processor gets its own set of virtqueues and
adheres to the virtio specifications.  This is the configuration
targeted by this thread.  The other configuration (2), discussed in
the other thread, involves virtio piggy-backed over RPMSG.  The hope
is to represent both configurations using the same bindings.  For (1),
virtio devices will be advertised in the resource table and for (2),
virtio devices will be announced via the existing remoteproc namespace
service.

> Who/what defines the resource table?

The resource table is part of the firmware image and is parsed by the
remoteproc core.  For (1), as presented in this set, "reg" links the
entry in the resource table with the device definition in the DT.  For
(2), the definition is also a device index, but said index is
communicated to the remoteproc core using a namespace announcement
rather than the resource table.

I hope to establish bindings for configuration (1) and merge that work
first.  Once that is done we can extend it to cover (2).

>
> > > > +            maxItems: 1
> > > > +
> > > > +        additionalProperties:
> > > > +          type: object
> > > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > > +          maxItems: 1
> > > > +
> > > > +        required:
> > > > +          - reg
> > > > +
> > > > +    additionalProperties: false
>
> Preferred to put this before 'properties' in the indented cases. Easier
> to see what level it belongs to.
>
> > > > +
> > > > +    required:
> > > > +      - '#address-cells'
> > > > +      - '#size-cells'
> > > > +
> > > > +additionalProperties: true
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    remoteproc-cm33 {
> > > > +      virtio {
> > > > +          #address-cells = <1>;
> > > > +          #size-cells = <0>;
> > > > +
> > > > +          vdev@0 {
> > > > +              reg = <0>;
> > > > +
> > >
> > > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > > provide their input on this.
> > >
> >
> > AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> > child nodes using the 'reg' property, not the node name. This I believe
> > is the preferred way of doing things.
>
> It is either both unit-address and reg or neither. It's preferred to
> have them unless you are just making up numbers.
>
> Rob

