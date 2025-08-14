Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79100CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRdAAvvljrXJVzo/5mrz23TGehgEhUMrKzzgnjPUjQM=; b=4MB2aDGcFncfCifDpLjoNUB+5r
	5wfvZZ3AhY5SN1dZXMg5gCGKnwuMAnOvlp5iQCvJe2BJ4h+1pBAC2YgXyYKRkeyACzcZ4QtYeMnPg
	jdNGJLN4TUp5dJMIn1G3vqDE6+HECSgcUnEZM/2cHKBi0lKBaQ8WseMPJoruVFIWnBPl3rD9GQAB+
	5H0BsEuyFsAq6ISSdixblA6RVtlyh9LzNwyXTKEaSCO+9DxyACipYn/jEBSM0z1j6ZutX1bedSmm/
	PoAmmm3CnDRaoYj738/eulyw/VFY1HwdThnI6tEkg6bhav5tFyKK4VB0u978Fj1ziVCImvIixtdls
	nTYf3J2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZfc-0000000HONk-3EpF;
	Thu, 14 Aug 2025 15:15:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYW9-0000000H94w-3g5h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 281A65C65AE;
	Thu, 14 Aug 2025 14:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EEAC4CEED;
	Thu, 14 Aug 2025 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755180080;
	bh=OJwgXQoKUoVQ6JMi/lzTSRWNwpU4o4E8nVxhmW1I3Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXxvpwzh2EedlQ9q7ou5ppIO27ljUbxMV/BYUmWblGZ1axlrwXYBkLHJbakoVUplp
	 FJisloc00zW1zUG09FJ7SC2dfPNqNth15fQHg3p56Km6tGXpkCdpDcO9H6zOnCWlCZ
	 ekmvqIscoPehmfSCBl0RCOAw/PDt3VEhHv5Sq7QcZMl/2s09izsd7TOghFMXT5+GmK
	 nTHkIry1mQfjv91Zyl2Qt2LudY3/1iR5ZfqKfi9egVQ3Zp0v5zNRnC599NTzcqM08d
	 DjDCgL9SZg7CzXSM964X4m05Re4k5PN9KQIQRmXNIVdoLWD0REGYRtj14NWj+ktkcl
	 KY8jAsbjcUlzw==
Date: Thu, 14 Aug 2025 09:01:19 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/13] dt-bindings: display: st: add new compatible to
 LVDS device
Message-ID: <20250814140119.GA2748790-robh@kernel.org>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-3-132fd84463d7@foss.st.com>
 <20250814-dancing-nautilus-of-camouflage-ebb441@kuoka>
 <2c13bf48-5453-4302-9cde-eac51e314af1@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c13bf48-5453-4302-9cde-eac51e314af1@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_070121_997964_DC03CF57 
X-CRM114-Status: GOOD (  19.66  )
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

On Thu, Aug 14, 2025 at 02:36:47PM +0200, Raphael Gallais-Pou wrote:
> 
> 
> On 8/14/25 11:09, Krzysztof Kozlowski wrote:
> > On Tue, Aug 12, 2025 at 03:49:00PM +0200, Raphael Gallais-Pou wrote:
> >> Update the compatible to accept both "st,stm32mp255-lvds" and
> >> st,stm32mp25-lvds" respectively.  Default will fall back to
> >> "st,stm32mp25-lvds".
> >>
> >> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> >> index 6736f93256b5cebb558cda5250369ec4b1b3033c..b777c55626e4b322d77ef411ad9e4a3afb6c9131 100644
> >> --- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> >> +++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
> >> @@ -31,7 +31,13 @@ description: |
> >>  
> >>  properties:
> >>    compatible:
> >> -    const: st,stm32mp25-lvds
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - st,stm32mp255-lvds
> >> +          - const: st,stm32mp25-lvds
> >> +      - items:
> > Drop. This should be just enum or const, no need for items.
> 
> Why would items not be applicable in this case ? I want the compatible field to
> be either:
> 
> compatible = "st,stm32mp255-lvds", "st,stm32mp25-lvds";
> 
> or
> 
> compatible = "st,stm32mp25-lvds";

Krzysztof is only talking about the 2nd 'items' here. For cases with a 
single entry, you can skip 'items'. It's just a shorter version. Either 
way will work the same.

Rob

