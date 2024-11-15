Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F55BD68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 17:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIKvb0ovihvwQW9n54hYp/oWjnQOhMsNbKAiPmTzOOM=; b=SZA1CaMkzuL8ILAAOLQhUdoGKw
	jAj42b4m37yHxWWnQQ95bGmSu54yCeQdsJY1CF3B77LXMUr/hklFgk4T1MtAUolXHuqIb/5VMyEnb
	OvH4GwAFwgQvsJdx1lcI/hfWGz0CLdUhRqRysVEsyh7i1sJdwDhvT6KVnz5XzOorNukHbbTH9nDlM
	BagOg2TSpOisCzYI9CtzoPc8MAaoP1SvOarfoZ6hjMvhwdz4k2aESnaeeFxan71Ve6SZasrpdqKjq
	iabI6xQoil0U1JYIT7mkaFNryFU6hp7yjCpXw7czxnSN1DVxJ8YaQmUhkVeJb97DZ6QVTJeYXJrrY
	PRzDkfjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0DR-00000003ZJb-3d0d;
	Fri, 15 Nov 2024 17:34:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC0CV-00000003ZAo-3EYA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 17:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3F4E5C6465;
	Fri, 15 Nov 2024 17:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B938C4CECF;
	Fri, 15 Nov 2024 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731692022;
	bh=KAyTU2wbJPNWq+AnPPIg5jRJD0fH1t6QufJ8G6BdE+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ME/5oqI+9A5m65Ks+FI//A2msRKaoqyZsf8e+ZghTz6L0qiyWlGJI6zbxAO4SjmJ7
	 QTv6C9Js0yK/mIY90hePo9stLZfjatvVg5Osg7PVkMKaHT0MvI1wZrW3oSKUVrrsx/
	 fGfxx9566+orfgW9/TF5/rWaUCIRJL1j60bX5O6M6XeVlZoojkhxIif/G6voPR++Ep
	 VrwdwVo20M6h4e7coL8dKdFziZGDy/mJCEbWTJJrM4FiEFlyZUz2TeibmpDAKmTOCJ
	 vQ7UCDJDzVsyXx8f8wbgt5GNWmZmeMiG+4/ghCKaLIrFD+MIHxbiGK4Uf5Pn5KYe17
	 QzfRUhDaCSGow==
Date: Fri, 15 Nov 2024 11:33:40 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: add common binding for NXP CPUs
Message-ID: <20241115173340.GA3436142-robh@kernel.org>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-2-laurentiumihalcea111@gmail.com>
 <ZzUF+iFeKSqKGcpX@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzUF+iFeKSqKGcpX@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_093343_850712_D151E3A8 
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

On Wed, Nov 13, 2024 at 03:03:06PM -0500, Frank Li wrote:
> On Wed, Nov 13, 2024 at 02:52:36PM -0500, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Add common binding for NXP CPUs sharing the same programming
> > model (i.e: audio processing with SOF).
> 
> Add binding for NXP audio processor with Sound Open Firmware (SOF) support.
> 
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
> >  .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> > new file mode 100644
> > index 000000000000..6d63fcd71154
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> > @@ -0,0 +1,35 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP audio CPU common properties
> 
> audio processor?
> 
> > +
> > +maintainers:
> > +  - Daniel Baluta <daniel.baluta@nxp.com>
> > +
> > +properties:
> > +  reg:
> > +    maxItems: 1
> > +
> > +  mboxes:
> > +    maxItems: 4
> > +
> > +  mbox-names:
> > +    items:
> > +      - const: txdb0
> > +      - const: txdb1
> > +      - const: rxdb0
> > +      - const: rxdb1
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +
> > +required:
> > +  - reg
> > +  - mboxes
> > +  - mbox-names
> > +  - memory-region
> > +
> > +additionalProperties: true
> 
> example ?

Common bindings generally don't have one.

Rob

