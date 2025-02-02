Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9036C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieNuIIPzVWLZMXOFdlK3olUaAK8OK9i96qegW/onpbc=; b=rHHz481BArfkh6fisRDouuWyb8
	a0DQrm5BWLAadn0l50wTaBkVAbz0scHZFL48w6kAO0FwHWXPbO81ZmOG2VOuCaIncbX/HmnbCxsBr
	ED1qM2iGKTmTdeek5yutH0meooX72rMLn+le9mg+zxKdu0V9G2yPFUX4weZj++rcoigSkK5LLCZ1Q
	rSHqOgBUl11LPUDmG/1y0FwLmGmWu+yNpjk7NL80OM9/158Gn1QYwkNp6XPYceXbESdHZjgWp+bVQ
	ZmhjFE5zV9t9o3lmjpi++mqdw6mlLVLun3O5aJHnakII7PkaiTJx2TZ0MBpXGrzfBBRXo3QJICJZF
	HqhJvSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teWjX-0000000Db2l-4BvD;
	Sun, 02 Feb 2025 09:57:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teWiD-0000000Dau4-2FUT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 09:56:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so3105666f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 01:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738490179; x=1739094979; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ieNuIIPzVWLZMXOFdlK3olUaAK8OK9i96qegW/onpbc=;
        b=blqlnEbcjonGv+WU5PaQDmBd6cOyLldJ2Vm1b7uRSyIn7ESqoxQjcSTnOBw+csSghM
         9DvIWq3g8vGG4GnTK5cnA+aQ6DGpx8td5PGhpfmcCAe0f55m1fm/vIgtn+yd1b8Qoavp
         1kW8ZfGArRDjjlzmUGLfC/8OCcLoTgC4gurYKBiiPNC8tR3YwVipEpzWD3N2+DPdJU9f
         hjjJPFWdfdbnPclGH2zB8foEH7oOJSCONeU/Vx7XomTrQ4mBOTWZEa5Hclxxa9H7hnvu
         hI5Nnt/iuF5RSK3bf6hayV4TZ4OzIUG8S5Sn8PFXJmBJdkm9M0bsGfMYK9hW8lIc5jZK
         SBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738490179; x=1739094979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieNuIIPzVWLZMXOFdlK3olUaAK8OK9i96qegW/onpbc=;
        b=TGjpTEHdUSMF/hGMQUK+UaMZb1PcONojtciz4SHxajeQ7lYktXTfOVl4ETe55aphid
         pslZPd1kxrhDgYztqUSwHmJWUE6VTjwFrNgwQndlwmn1rV/niAJthQWHBnKXzC6rnSH9
         GZt5Rd37VKF6fmYRbXS+rJDXv5M01Jpqhdp03qZ7S510056O2/vQOMebWT85d8W8qjHD
         sQE5C0NGExZtgVqBuMR61nMXpiL1WHqD87zLQaoBMEfYmDtXOpGa9p1h5sJdmuAP/6Ke
         YDoz/F/zLGMZVOdEywTK4E53EKOgW0vY1AlGZorCBdEZTYrvBCKOaniB9dOCAHHjnPSr
         huHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8shfGeBNw1b2Vk9Q5Z9fWC+YkIgnwmuFt3rukcslfcfHWbf4118tESvz+ypGcEeKYW4jZUui8nyDjlEs5HcNm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa1WYLBrCEOPLGZ9+Tedpsj4P72LMVGUvALbaAF6w7o71Tt2+J
	JQgJ+7B6m7cNKHxHbY8hdFrwlqHI5x8Oq/EpjcwlGzWxT2r+YnKl
X-Gm-Gg: ASbGncsXkpDVEBukx39FJxANIpPuyqClGNaKkEhvCv8nzCJ7ur2ulNIE9FSTGh7e/Mi
	SHAZYeBjePnpzzELBcwEhbC6a30BK3kMD3JG42YI30D6Gltu6tRaihrokE3OZt2hoQ48ixm4btD
	/LdijsHlHO9F7MIetXr2tbb1dPMA8/tpruvi+egLnKvt6oQiYKsM1XxQsiGmUuMGv+LPybcJ4z7
	5P2mgNP5TH2Zj1w0GxxSXWZqBZM/SbXbIkDRVVsI0DJr4DCL5dMmamJw0tAgP5GzTufvIyyw7JD
	+qZNagt1eWCGzRlSqoyrsHB4LKCnkx6wORuBapxqWh066p8T6hkWyDQ=
X-Google-Smtp-Source: AGHT+IH2N1UXUlNgMRrYCmzawu/nQG2XG9SVLFZtSnjOQ26z/EDkDV1CClmIxuiGxX0hc4lqLvfR3w==
X-Received: by 2002:a05:6000:1365:b0:38a:888c:a727 with SMTP id ffacd0b85a97d-38c5195dd2amr12639405f8f.25.1738490178665;
        Sun, 02 Feb 2025 01:56:18 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e6bf8sm114132475e9.23.2025.02.02.01.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 01:56:18 -0800 (PST)
Date: Sun, 2 Feb 2025 10:56:16 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: brcm,bcm59056: Convert to YAML
Message-ID: <Z59BQB_cBgTDm4ie@standask-GA-A55M-S2HP>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-bcm59054-v3-1-bbac52a84787@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_015621_597127_1692580A 
X-CRM114-Status: GOOD (  23.65  )
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

On Fri, Jan 31, 2025 at 07:13:49PM +0100, Artur Weber wrote:
> Convert devicetree bindings for the Broadcom BCM59056 PMU MFD from
> TXT to YAML format. This patch does not change any functionality;
> the bindings remain the same.
> 
> The bindings have been split into two parts: the MFD binding and
> a separate binding for the regulator node, to simplify the addition
> of other models later (which have different regulators).
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

[snip]

> +  regulators:
> +    type: object
> +    description: Container node for regulators.
> +    $ref: ../regulator/brcm,bcm59056.yaml

Use the full path, so /schemas/regulator/brcm,bcm59056.yaml#
The description seems unnecessary, you can drop it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: bcm59056@8 {

Node names should be generic. And drop unused label.
Should just look like this:
	pmic@8 {

> +            compatible = "brcm,bcm59056";
> +            reg = <0x08>;
> +            interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;

#include <dt-bindings/interrupt-controller/irq.h> ?
V2 seems to have it, not sure why you dropped this.

> +
> +            regulators {
> +                rfldo_reg: rfldo {

Unused label, drop.

> +                    regulator-min-microvolt = <1200000>;
> +                    regulator-max-microvolt = <3300000>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8939004d5a3f079c05d313bed4a2f07fbc473bac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/brcm,bcm59056.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM59056 Power Management IC regulators
> +
> +description: |
> +  This is a part of device tree bindings for the BCM590XX family of power
> +  management ICs.

This doesn't really say anything. Also AFAIK these are only part of BCM59056,
not the entire BCM590XX family.
Maybe say here something like:
"The BCM59056 PMIC integrates X regulators, their valid names are
 lorem, ipsum, etc.
> +
> +  See also Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml for
> +  additional information and example.
> +
> +maintainers:
> +  - Artur Weber <aweber.kernel@gmail.com>
> +
> +# The valid regulator node names for BCM59056 are:
> +#   rfldo, camldo1, camldo2, simldo1, simldo2, sdldo, sdxldo,
> +#   mmcldo1, mmcldo2, audldo, micldo, usbldo, vibldo,
> +#   csr, iosr1, iosr2, msr, sdsr1, sdsr2, vsr,
> +#   gpldo1, gpldo2, gpldo3, gpldo4, gpldo5, gpldo6,
> +#   vbus

This should probably be a part of the description, not just a comment.
Could be argued to drop it since it's also described below in
patternProperties, but this is easier to read, so IMO would be better to keep.

Regards,
Stanislav

