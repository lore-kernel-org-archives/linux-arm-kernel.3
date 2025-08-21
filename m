Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E604CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPUj6s2/YhhUxsWD+aKxTzxtC+jhtgvfWGfvc2bqKPU=; b=F7K+6XxyTwgn4DWvtpB/Om3tzN
	pxIdO/TP2lQ/5yJd3QcjM8uCshq7wRo37lM6x8GxQc1s78YI9pEgDo1t1TGvT0unVTsXS0BjUj9vc
	dYI84erO7JrEFkFlHaklIE0nuODCm8KoV/X/ZN+Tw10+37ONj5jinpGS3s60Ik0EK/xJFGYgsnLq5
	B2bo2a2S/CyYRRTx0WYCN2kkAFaOdMdE8V4tAVQGIacer+Xot5VGEShbJKBQpajcX0IBDlXnSySHj
	fabp+3WgMVrV1NyjApHPtXAsTctaF+8/UC3vgVkD97ZxxMjLryHOIQfIf9Hr8AfNVHfTS2+fW3e3X
	aZ2Y93zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIdR-00000001PwC-37MD;
	Fri, 22 Aug 2025 03:40:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEGu-00000000sx3-3bbJ;
	Thu, 21 Aug 2025 23:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 382C45C60F9;
	Thu, 21 Aug 2025 23:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4D0C113D0;
	Thu, 21 Aug 2025 23:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755817239;
	bh=7rA8qT8sloOt+Gomxv3Dk1liyMq9TmAjnM4+H4zgnNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZtagFIkRBhoOh73FBc0x7ALmgqNspRrbh6BmuUp6WEuXtyEux8yoMDvLnF7mWh4gZ
	 PXE49H392eRD9iyygMGGk/bRgRh/3fIq9WybGzxcJ58hueOJpf08zGfKgyhyKwv5fK
	 GSt5FuGAcA+rlzqgpfUYEL+Ii2zot892scxQtsyXnYub2/eZupTrCIDFY9o/5l2vMT
	 weR9WqrCgVZqfSQILqY52+eOQIEHmgWE9FLZpUZze5KkRVikfdG3Y0rF4dl3NAL7xt
	 4bhWYhO6PYpVy51nDJzd/ibMu0PsFE9UajxHXd0IOnbLX/4DG81W/ooKCDDMdjh2eq
	 uwCZbECdBkPVw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7a16441so220934366b.2;
        Thu, 21 Aug 2025 16:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6t8PO3J1vKvjNlWMFbugNGYvScevkhuRXFfU5qRd1waTAC2DgizlWGQThYz9HZcvolr2ti8SM2xG1hQct26an@lists.infradead.org, AJvYcCUvahCdhH2JtUV62snp5UdaiVmCom99Ek0Yd6KhGf5DWcNnilkp5BzJKabdkV8/3jdQpF0g1vHfEkAN@lists.infradead.org
X-Gm-Message-State: AOJu0YwPlc6wsRN023z9EqZkB9BpnoZU6QvZ90l8289rbYICrTYuvU/Y
	L3+2SakZEmfl4DIfciYqLQwv2oesOCgEwUmo9M2VBSp53UzGp1Ztqo3LKNZy7Eaw16oYuo/m2Rx
	nCzPcIVjNW5wxS92dZwwUC0ERn3Q/yw==
X-Google-Smtp-Source: AGHT+IH5ReMKgM2/3Os0oHRo+pFjl/n9LIXHNBEW/4vyJJ36lhUYYD+Ni5LGTFHEdqrEFWxNcknX16jT/C8BnP/4Q+Q=
X-Received: by 2002:a17:907:72d2:b0:af9:8c20:145b with SMTP id
 a640c23a62f3a-afe28f7622amr76678966b.10.1755817238412; Thu, 21 Aug 2025
 16:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-3-172beda182b8@kernel.org> <20250821163320.GE1270980@robin.jannau.net>
In-Reply-To: <20250821163320.GE1270980@robin.jannau.net>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Aug 2025 18:00:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL=y2OT4YrzT8z0O0T2hpM5X1k2pFEb8XjBRPoNMdO5kw@mail.gmail.com>
X-Gm-Features: Ac12FXwdtTBi83iz9IiQlPSDZ_3W-XM65JsHn03GR3jMgiJWuYGJBjpjvfkth58
Message-ID: <CAL_JsqL=y2OT4YrzT8z0O0T2hpM5X1k2pFEb8XjBRPoNMdO5kw@mail.gmail.com>
Subject: Re: [PATCH RFC 03/22] dt-bindings: phy: Add Apple Type-C PHY
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_160040_983751_E46F1449 
X-CRM114-Status: GOOD (  22.52  )
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

On Thu, Aug 21, 2025 at 11:33=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> On Thu, Aug 21, 2025 at 03:38:55PM +0000, Sven Peter wrote:
> > Apple's Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> > USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon
> > SoCs.
> >
> > The PHY handles muxing between these different protocols and also provi=
des
> > the reset controller for the attached dwc3 USB controller.
> >
> > Signed-off-by: Sven Peter <sven@kernel.org>
> > ---
> >  .../devicetree/bindings/phy/apple,atcphy.yaml      | 210 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 211 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/=
Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..eb14010557c94f313b54b52=
8e2d4039fe540062a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
> > @@ -0,0 +1,210 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/apple,atcphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple Type-C PHY (ATCPHY)
> > +
> > +maintainers:
> > +  - Sven Peter <sven@kernel.org>
> > +
> > +description:
> > +  The Apple Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> > +  USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silico=
n SoCs.
> > +
> > +  The PHY handles muxing between these different protocols and also pr=
ovides the
> > +  reset controller for the attached dwc3 USB controller.
> > +
> > +  The PHY is designed for USB4 operation and does not handle individua=
l
> > +  differential pairs as distinct DisplayPort lanes. Any reference to l=
ane in
> > +  this binding hence refers to two differential pairs (RX and TX) as u=
sed in USB
> > +  terminology.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - apple,t6000-atcphy
> > +      - apple,t6000-atcphy-dp-only # PHY hardwired to DP-to-HDMI conve=
rter on M2 Pro MacBook
>
> The comment is misleading, "t6000-atcphy-dp-only" would be for M1
> Pro/Max Macbooks. M2 Pro/Max Macbooks use the same design so the
> corresponding "apple,t6020-atcphy-dp-only" compatible is missing.
> I'm not sure this is the correct design though as the HW block is
> identical to "apple,t6000-atcphy".
> I think it might be better to have either the DRM KMS driver or a
> custom DP->HDMI drm_bridge switch the mode to DP-only.
> Or atcphy could initialize itself to DP-only based on the available
> ports.

Doesn't sound like this should be a different compatible. There's a
'phy-mode' property or you can define the mode in the 'phys' cells for
the DP controller.

Rob

