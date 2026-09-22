Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FC9C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2HjM704yjUPc3oYEkUo0s9e3MpU0+mzXloxkK4JXLZM=; b=4EMHwV5wSljAtyxtxYrYgOBLV5
	qEsMbo8Vw8e7N2dKaNGpHcMag2325R54lFfRRiLDqdC8OaRIErvOmAs2ipCyuXPZKL0LWSsUuB1Qb
	9P3t5INYKfWOWXVdKuQ4I3pDPQOBldf69LHcxtFe5kaGGrlnfoyAinT2h6TYXDS36cDaOq0sPysyq
	shm5uYFqmh3q+8OmUwseRnGoloiJq2Ng8B8eQSBNb0Bsn9KSyoUB1PmM1ZwnCsL5V0lrfRUJuewyo
	0gC5QkHYmr9dB30AlQ113Q0IQ/H5+/BGOVtDyv3PHH7aRo6T6ZfQ7U7a0E8mkXzJEtrauiSVk7Lne
	BxNyNHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92bm-00000005uHj-1w9Q;
	Tue, 22 Sep 2026 15:40:38 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92bk-00000005uFp-0m3T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:40:37 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8633a38df87so19935b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790091635; x=1790696435; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HjM704yjUPc3oYEkUo0s9e3MpU0+mzXloxkK4JXLZM=;
        b=mBRtEZoE+WbQr5vHLlxcDg7O+IbOB3SSXmdXsk1m8E/OfG6HIKWv9zbZo3QKrkzWNc
         +RB7sUfnQOuFKCjqs1bJUevp5N1PfWP30D/PCkqu6AxR5qr8p03TFVdBARfoAvVlNOWM
         UouqnOppoSV23LOQEJ8tkuwWgSgo6dVxyd0Sap0FnyAEC3/ns2d14RThFgfe3DW/EHpi
         qruJClWZ6H7h8yv+engRywuNYKu5OwFIL4xmMPyCaTf2gQVm/KqeLGBw3YkixGcVHTD6
         hAbcpvJudQ3oYVgHP529NvknsXtfMciDJqhQYP5y6AeqYo3+xfwPvlCjucTlaO5KXGVa
         6I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091635; x=1790696435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HjM704yjUPc3oYEkUo0s9e3MpU0+mzXloxkK4JXLZM=;
        b=FQ++JqZjT+NnUmhTjFKb8rbarB+3yz2LXUBsHWG/WPTtRiBYtvm+ku55k1lfLxDR2m
         CFG6H35qVacfqnaWjJU6JIfFf2KSXR55kAYgllrkKHFvjHZxdibcFIh7jkHn2CiCqIgB
         Lcs1jMJBUC1Ag/ToSUPgx8GtbHXyzQ+78Su+qYRbyqANfe8WxezSXalX/9MEYL2kVX1H
         Gr48J2Es3gK/HiFaTqLUC4vkP3Trl+jfGDOhcIF79syPyp7rEvpvf3fHoDcZywo5l57j
         Y/T8Hzb3bNo2/nInaoH8RKE6VtB9e6hm/SoKiIF1qcf7Mrvr18tJiXeBTRIHmucSnxJ1
         KSmA==
X-Forwarded-Encrypted: i=1; AKwUvBxAGBifo9MrskIKixoKhS0LXcETVxV2ywSwcRwqxlEC5XUEOzR+uOJoHJnV2YT2SqYzWfCATDVItuf4BwIosMwP@lists.infradead.org
X-Gm-Message-State: AFuF++kd3eAKWDkNJivNJtLM8GteMWgsJYTV3FEOyB1pUdqMjnSi1ZvP
	un4T6y8oWTJCG4MG10SpOYGJWHG51BWZnxFc3OGkOzFerskIGbpYFFtF8bvQPxIL1G8=
X-Gm-Gg: AYBFou19jpDcbt5sqSUS3JinaiOssk5YHNT+73L81dc2x6BMstfFJs0PIqv4Lj1YH82
	xcrsZDroB54+UNcAMX5TM2BuGCk6k4dQr0ufnc7eX1b/S/UzqnKoH/ElPNIIJluFfVAv/ddKIsV
	jG+704s8qrhS+tI4D7CREKibjrqLfhhZf4KkNLN5QgKPtWTZJqmg9ARuZojds/AZp5p56WWXeOU
	Vp/lLV3IVWzQB+kqwQcjoQXVq2ju+liN25dxHCg/7RxfJwDlyHLBjMHN08YkTYzVh5d6Az6GMl4
	3OTuT7FtOzkYqJNZRYl8JYFOb8jsIa41DMMZLiWzpZmwKQbed2uXHTLihmjN0ihOSW3GXY8MAsz
	Qav53Nb049BYC4TH6MM3ex0y73mh7/cYZkLvzkUPSdpO+hjdv+K7KeLxEM/U/Jq1wDG2KgMFGMM
	j3XWqrBMnFrdIYn5AJrq9wZN+E9F0IwsDgCcUQjAKIXWXkHbGibQjRSUuzsCI4uxagFDAVhVb0
X-Received: by 2002:a05:6a00:1393:b0:85b:8606:627f with SMTP id d2e1a72fcca58-87c82f7f151mr1827877b3a.26.1790091635190;
        Tue, 22 Sep 2026 08:40:35 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1046:ab8:737c:d2e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c2fc4b581sm1104255b3a.7.2026.09.22.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:40:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:40:31 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
Message-ID: <arKhbxi3Snbt1_Mn@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_084036_256227_1FF04963 
X-CRM114-Status: GOOD (  25.97  )
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

On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> Add a new binding to describe remoteproc-provided virtio devices; while
> these are discovered through a resource table parsed by the remoteproc
> infrastructure at runtime, their description can be needed to probe
> non-discoverable buses (such as I2C) or to link consumers and suppliers.
> 
> Each vdev is described by a dedicated "group" node, which then includes
> a virtio-device node, which binding is already existent and used by
> virtio-mmio. Each vdev shall be stattically linked to a "group" node
> using its index inside the resource table as the reg property of the
> node; this permits to have multiple instances of the same type of
> device.
> 
> The binding is intended to be generic and adopted by any remoteproc
> provider.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> new file mode 100644
> index 000000000000..c4a0d84b1460
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Virtio devices over remoteproc
> +
> +description: |
> +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> +  and its resource table. For some of them, a device tree node might be needed
> +  to describe remote undiscoverable hardware and/or connect consumers and
> +  providers.
> +
> +maintainers:
> +  - Francesco Valla <francesco@valla.it>
> +
> +properties:
> +  virtio:
> +    description: Contains a group of Virtio devices exposed by the remoteproc.
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^vdev@[0-9a-f]+$":
> +        type: object
> +
> +        properties:
> +          reg:
> +            description: Virtio device index inside the resource table.
> +            maxItems: 1
> +
> +        additionalProperties:
> +          type: object
> +          $ref: /schemas/virtio/virtio-device.yaml
> +          maxItems: 1
> +
> +        required:
> +          - reg
> +
> +    additionalProperties: false
> +
> +    required:
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    remoteproc-cm33 {
> +      virtio {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          vdev@0 {
> +              reg = <0>;
> +

Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
provide their input on this.

> +              gpio {
> +                  compatible = "virtio,device29";
> +
> +                  gpio-controller;
> +                  #gpio-cells = <2>;
> +              };
> +          };
> +
> +          vdev@1 {
> +              reg = <1>;
> +
> +              i2c {
> +                  compatible = "virtio,device22";
> +
> +                  #address-cells = <1>;
> +                  #size-cells = <0>;
> +
> +                  eeprom@50 {
> +                      compatible = "atmel,24c1025";
> +                      reg = <0x50>;
> +                  };

The previous patch introduced bindings for virtio SPI while the above two are
for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
everywhere.

> +              };
> +          };
> +      };
> +    };
> +...
> 
> -- 
> 2.55.0
> 

