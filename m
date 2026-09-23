Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129C7C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=; b=38va/r8WaSAShayKkE1TEL8+lH
	SQ4UgBneRHbm2/YUTTe3T+VLNYLY4aa4kv2HpVjezrjzUWOrBYlFkjCTRc2nlgx0cyPvxAUm+HC8Z
	+gM9sKbYg5h7SXwVrXx8kBOJG+FyEGy42zsliza2gCziPBlmsiXMRdeTkW6LvbEOp3Wf7VB63OItp
	FY0TuIv2uy8q415MBSskr7pbNQdZkmT3HwJYL/5knUiVrsjqV652xenSWlupAfTdmGfa2RbhEn2sz
	sSA9OibtmEzxjF3vme/oD7t53l1WvzpcND6TT8+Ti4seW8YkYwmM0r8lWSdHJxOg44ZqN1W8RahVN
	mB4zEdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OP2-00000008bVV-1Yyd;
	Wed, 23 Sep 2026 14:56:56 +0000
Received: from mail-ed2-x16.google.com ([2a00:1450:4864:33::16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OOy-00000008bUV-07bU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:56:55 +0000
Received: by mail-ed2-x16.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1875531a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175410; cv=none;
        d=google.com; s=arc-20260327;
        b=dbS80QLofIf7md5jsPCLLgMJ/s8dyBRp8gP94LvBOdGSM3v2OjHQJ8f0mtn0CstMph
         wkzulmCd3PRstYAI/av1YM7VrsqkSqA/wbP+Sm2hQiM2jT4lfa+jGZtAnVwfPH9gZI43
         k2NATxV7Br53L/A3X3++E064mtuBVeASeIZO1+gxyD4v6IVP2t6i2/Dj0atrwb2VkrLz
         UlFrG3qY/Yb8nzoG8eRGkIsrTJbUM4v/aze2qFvNKMp9S1ebtzUoQv95yV8zqPwxiiCa
         Cc2h0ga8sjiZSef/Bi/TQT6XZe5bXoBH6YlpWSBx+NCmamZjjrZv4G/k2XFI7SqUZSKM
         V8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        fh=DFI7P7YGSCH4jwkcQrWrUalhfvZ1YuFmMY3ZgBBE3xY=;
        b=MyWAa1awofeKI5GWj99gk+d6t9ZplAR68ImiHzCtmjlgUaZlmRdk9OAy8f4E1U0cAl
         OSdK6io1ILDw5x2pJTkhn60yQVh/jgEDTBHBjOrqC1IjLUm9nGoIUrqorMuC//4gUPmh
         +uKEBc1UkJ/AFrTgnbQKl5/DvKD+40K3W/Xzz8t82j9nznZxu4zgwUsU5hu93fo0lAxd
         X2e/3xFpzoKIJ0g3qk5wJ6M8/cQDsk/os9PcDWdCQuEVHZ3Bob5T+VvMDdcL/sXiZ4Jy
         R8NNUSKCKNckNlEDiRRNUqwjXcneM4Es3A6Z5bsaLw/t2UkICBXnJIkF8109fZfdH+ze
         ivdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790175410; x=1790780210; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=yOSY2Z+OdhMgMmdvSo6tYR2klnDNyZhnDecZKuPSyA2mMUmEwpsV8jlShfOkK2VlzS
         wel0PRv+wGkAOfxq3c+E2ksIFbSrTjnm28ySCUZFiqHTfRAsnVCIFmYpUxIVbQGULunp
         N87vuUJbaZOYxJ8BtVLm7DThj0rRM/Cgbht4gSzqPnK2HGAf8QPOdK2cZMQ1OaCSwYAA
         l3clEP04T/hoIcYWamY59kwEVdgaKpOJh0+Kju+9MwBDQ7jROyom2mdwuVOcyCJMLme4
         8eMe7uf5Z4zupCZtEzf3mTv14L74hX7lHNScrWytS4G3JNNuyoXej8Ni6NHGFH9hLEWu
         3iBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175410; x=1790780210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=CY98lucarlz6EXvbEps7gougatA2QsQx6nTtD2xH8sP7vUVBRjZAQ3UW3Wzp8pF9tz
         7ah8UauFh1JlYBu7PJ7sNvbu3PtrujJ07AKNz2PWu9UHyH1oC5IQh3p053lrNfRtMBId
         eJpF3MLILMrj+Tx41Wlcf0EiY2v+VlSw8bRABkP/yAyJCFTNFJ8HgxypK8+Yr09G2ckY
         9VGBbBLW+hZCWZzWn3VdkNo5znA80+OjXSOq/pTwyMGhVLUYp806WpIW6Pw+BtVAkElI
         ngHMmGdLDBIJVHPppWqWjJpPuRy+yhIAE3JYr1wnZ9fFtBF+1KhFdPmhyeJXWSxChLgZ
         0WiQ==
X-Forwarded-Encrypted: i=1; AKwUvBydkzBexZd3cwt1RHkkXZmtyQHWn74R8SMguXXVi5lfNkpzRxogYIrI1wkx+kIQREx+9ToGr902/iueyqG811u/@lists.infradead.org
X-Gm-Message-State: AFuF++kYZMjYT5nDmu+vLcO1qnhROZE6KRdH61gJe+LFPtyWyiqKcx/u
	m0TRT7+ROV2pk+0MSIv+GKund4dxmy4oTyw/I2CpfZH5mkSJdpula93w3IYHPBdezT92SwlUIS2
	ViylXNJ5b127KnoRFHen4usU9W/pT7yFchQFwcUdnjQ==
X-Gm-Gg: AYBFou114yMPQe50x+B20mJ1laJv2biQ0+7UoX+9pCBVrhAg55Z9za/BXCl9dzOIWm3
	0qhBf6+nkEJLwkJ/FSgAHklqC3+DEw6Ed4K7MY4C9ZhzAawFUp0QJOzL5u3jseYPsOovP9XKFOR
	TI52VEWlrkMoJ2YgImYb5OXuwDSOvF6wmADMzSQXAkjqY5RA5/m//nob7T1o47r/4wh0PRSIKrb
	QMtRQZt9xwMlnaZAcoYF9DguBtl7n5AxK4ghUxIWrw8tP22QzcVFcAzLvA3xNFDkACCpzIjCETh
	dE0Sq4RHs4zEWizs6Jmf5B9z1adCxHoEe1UQbb7EjsAi2ogW/gg6BdY6dkGtOv9tSsWybFEhLir
	4TRXMXokin2A=
X-Received: by 2002:a05:6402:5514:b0:6aa:129a:1f70 with SMTP id
 4fb4d7f45d1cf-6aab3b647e8mr2420276a12.43.1790175409790; Wed, 23 Sep 2026
 07:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater>
In-Reply-To: <arLZj2DxBazf3wMd@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Sep 2026 08:56:38 -0600
X-Gm-Features: AclHuK883D6T5DYJIUEwz22c4TjWkQLK7CcGTqdjz7jqNMirfKCdfrjOT14z4v4
Message-ID: <CANLsYkzC5DU8j_QJLkuUcV2tYb=G86L_G4yiBZTePKSqiRdd6w@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_075652_112401_806BBDD8 
X-CRM114-Status: GOOD (  35.41  )
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

On Tue, 22 Sept 2026 at 13:44, Francesco Valla <francesco@valla.it> wrote:
>
> On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > these are discovered through a resource table parsed by the remoteproc
> > > infrastructure at runtime, their description can be needed to probe
> > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > >
> > > Each vdev is described by a dedicated "group" node, which then includes
> > > a virtio-device node, which binding is already existent and used by
> > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > using its index inside the resource table as the reg property of the
> > > node; this permits to have multiple instances of the same type of
> > > device.
> > >
> > > The binding is intended to be generic and adopted by any remoteproc
> > > provider.
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > new file mode 100644
> > > index 000000000000..c4a0d84b1460
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Virtio devices over remoteproc
> > > +
> > > +description: |
> > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > +  and its resource table. For some of them, a device tree node might be needed
> > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > +  providers.
> > > +
> > > +maintainers:
> > > +  - Francesco Valla <francesco@valla.it>
> > > +
> > > +properties:
> > > +  virtio:
> > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      "^vdev@[0-9a-f]+$":
> > > +        type: object
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description: Virtio device index inside the resource table.
> > > +            maxItems: 1
> > > +
> > > +        additionalProperties:
> > > +          type: object
> > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > +          maxItems: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    additionalProperties: false
> > > +
> > > +    required:
> > > +      - '#address-cells'
> > > +      - '#size-cells'
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    remoteproc-cm33 {
> > > +      virtio {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          vdev@0 {
> > > +              reg = <0>;
> > > +
> >
> > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > provide their input on this.
> >
>
> AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> child nodes using the 'reg' property, not the node name. This I believe
> is the preferred way of doing things.
>
> > > +              gpio {
> > > +                  compatible = "virtio,device29";
> > > +
> > > +                  gpio-controller;
> > > +                  #gpio-cells = <2>;
> > > +              };
> > > +          };
> > > +
> > > +          vdev@1 {
> > > +              reg = <1>;
> > > +
> > > +              i2c {
> > > +                  compatible = "virtio,device22";
> > > +
> > > +                  #address-cells = <1>;
> > > +                  #size-cells = <0>;
> > > +
> > > +                  eeprom@50 {
> > > +                      compatible = "atmel,24c1025";
> > > +                      reg = <0x50>;
> > > +                  };
> >
> > The previous patch introduced bindings for virtio SPI while the above two are
> > for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
> > everywhere.
> >
>
> This is because both GPIO and I2C bindings are already defined - even if
> not used in the devicetree files part of the kernel tree.
>
> Moving forward, I plan to submit at least the spi-virtio bindings as a
> separate patch set, as they can be used independently of this one.

I suggest you leave spi-virtio out of this patchset.  That way we can
concentrate on doing only one thing.

>
> > > +              };
> > > +          };
> > > +      };
> > > +    };
> > > +...
> > >
> > > --
> > > 2.55.0
> > >
>
> Regards,
> Francesco
>

