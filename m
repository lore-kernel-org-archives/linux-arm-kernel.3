Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DCFC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 04:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfIBzr1UKSVHnVMmkUtLD/+X3Es9KGDjRhcvfr2lldY=; b=fXzXMO21qWlexumeGrACobVEPY
	irFf4wFN8XsrjtQH+AKC2zIzxUquwOdeK/BHf+A910GnDq0J5tPCV6L8raGsc9namFVNTZnZeWLzM
	Oi9lQ2FKh41hngr+9j2hBZax14OoSx9K1XzNyG77o5J/JexTT9IKElHiIOvrgtIkY5z0EtIvVHloj
	0HDDE6mwxUHCvOqKJ3Ae69KuGoerBJ6sY0gDod9eCsPKE5/jteVrjTuHmjfG+KtgJh3ATdszwtJTi
	BxHr8h0W1mmMYV7JaHbInlCoESGE9hbm1u7IYe7yXNG2PMWdpoJeVFWE0o1afmkgOtBNNSdWUmq+s
	A33nQZZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRT9-000000040z4-1QxK;
	Wed, 23 Jul 2025 04:52:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRQh-000000040qZ-3hEs;
	Wed, 23 Jul 2025 04:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0049C668EE;
	Wed, 23 Jul 2025 04:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5CEC4CEE7;
	Wed, 23 Jul 2025 04:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753246210;
	bh=FRrcCCQQ4F/hJI3vXYnGQ/KyERQSqfeqQbk3YFvCDTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3cMUCxTLqzOQsWUObwmsbY2S/+091JqNYSeqdU0N/cOAtyVxdEmILr/RzkJdUnSl
	 jb6gz+T51o/8zfFtk8GYNes4Ts0EHdyPETGXI0bFgyPbFZCuwSBMMZZ7/ibVIbLCun
	 dcmBsj4jFXfbtdgBUhWu4B3pbbfFgS41JQZP8jRbGdXpuOqDsB8ON0qUmPiln5sVMw
	 nfxEePuVh48sExCgQLvZ72J3jJBFLpXd4QkiJDvzFA4EBWDJGN3bzfQn//zlF7HVof
	 MVpo5AsJn9fWRlbKJuIVhCTwuBscdHITGU90uxyDVzQe0o9gVoZDYvRqkrHL6s8Mnp
	 GXAI0WxPGCzSw==
Date: Tue, 22 Jul 2025 23:50:09 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: ufs: mediatek,ufs: add MT8195
 compatible and update clock nodes
Message-ID: <20250723045009.GA1218051-robh@kernel.org>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
 <20250722085721.2062657-3-macpaul.lin@mediatek.com>
 <b90956e8-adf9-4411-b6f9-9212fcd14b59@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b90956e8-adf9-4411-b6f9-9212fcd14b59@collabora.com>
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

On Tue, Jul 22, 2025 at 11:39:54AM +0200, AngeloGioacchino Del Regno wrote:
> Il 22/07/25 10:57, Macpaul Lin ha scritto:
> > Add MT8195 UFSHCI compatible string.
> > Relax the schema to allow between one to eight clocks/clock-names
> > entries for all MediaTek UFS nodes. Legacy platforms may only need
> > a few clocks, whereas newer devices such as the MT8195 require
> > additional clock-gating domains. For MT8195 specifically, enforce
> > exactly eight clocks and clock-names entries to satisfy its hardware
> > requirements.
> > 
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >   .../devicetree/bindings/ufs/mediatek,ufs.yaml | 42 ++++++++++++++++---
> >   1 file changed, 36 insertions(+), 6 deletions(-)
> > 
> > Changes for v2:
> >   - Remove duplicate minItems and maxItems as suggested in the review.
> >   - Add a description of how the MT8195 hardware differs from earlier
> >     platforms.
> > 
> > diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > index 20f341d25ebc..1dec54fb00f3 100644
> > --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > @@ -9,21 +9,20 @@ title: Mediatek Universal Flash Storage (UFS) Controller
> >   maintainers:
> >     - Stanley Chu <stanley.chu@mediatek.com>
> > -allOf:
> > -  - $ref: ufs-common.yaml
> > -
> >   properties:
> >     compatible:
> >       enum:
> >         - mediatek,mt8183-ufshci
> >         - mediatek,mt8192-ufshci
> > +      - mediatek,mt8195-ufshci
> >     clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 8
> >     clock-names:
> > -    items:
> > -      - const: ufs
> > +    minItems: 1
> > +    maxItems: 8
> >     phys:
> >       maxItems: 1
> > @@ -47,6 +46,37 @@ required:
> >   unevaluatedProperties: false
> > +allOf:
> > +  - $ref: ufs-common.yaml
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-ufshci
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 8
> > +        clock-names:
> > +          items:
> > +            - const: ufs
> > +            - const: ufs_aes
> > +            - const: ufs_tick
> > +            - const: unipro_sysclk
> > +            - const: unipro_tick
> > +            - const: unipro_mp_bclk
> 
> The unipro mp_bclk really is the ufs-sap clock; besides, the standard has clocks
> for both TX and RX symbols - and also MT8195 (and also MT6991, MT8196, and others)
> UFS controller do have both TX and RX symbol clocks.
> 
> Besides, you're also missing the crypto clocks for UFS, which brings the count to
> 12 total clocks for MT8195.
> 
> Please, look at my old submission, which actually fixes the compatibles other than
> adding the right clocks for all UFS controllers in MediaTek platforms.
> 
> https://lore.kernel.org/all/20240612074309.50278-1-angelogioacchino.delregno@collabora.com/
> 
> I want to take the occasion to remind everyone that my fixes were discarded because
> the MediaTek UFS driver maintainer wants to keep the low quality of the driver in
> favor of easier downstream porting - which is *not* in any way adhering to quality
> standards that the Linux community deserves.

Sounds like we need a new maintainer then. They clearly don't understand 
that downstream doesn't exist.

Rob

