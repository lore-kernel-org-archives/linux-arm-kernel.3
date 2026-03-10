Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C3EFD4F16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z95EWVsrMzPDT562nCNm2Yx6CMWIqcpH/rEof9XkH8U=; b=MoSYbIpta9Qm2AkXJAi+aM4BYv
	UNZcnjkHpsTpj908vQOY2MPGjR9fxvWKBeInjvAapa8hEjHiFAP7isssvqpARQBJ7JfHJCIQ+Op23
	pIQ6zSp449qSzLPS/LFKKBqFfEs7ujZ64CJrHP1TuvGVkwlbNFl2gKuzglDXv6OCcPlID0nzhXdeC
	MtWvU+VlgcadY5UMRQqvmM85e3hwOvpxJRyFiOsuqCJi6OFMZiaIInrz2/N4s6dKlOXZbRYrFa4b4
	S6/fQTHtXVy8TJ0Lugc2E5579GMqOMPpGFikA0pP0hmYwAue9wMb8O2wFTeQjYYbq7CSLvKR2EnNI
	uTkrbKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01XJ-0000000A33C-49kO;
	Tue, 10 Mar 2026 18:10:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01XJ-0000000A32Z-0mRq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44696600B0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 18:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9867C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 18:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773166228;
	bh=+BkbeGlWZU3HoPWqSJ4ZGWH/mYA1R9F66ZxBmJ6EvZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D20QBuJz20JGK1KlKAqOqZ98LZe96xXmFEvoFFgDEI0OK2C81PB7DoxY0y7AcHg/o
	 HEm7rQUPs9UaCUxzf/mfFjK7/pA8NpZmHCtAlWAIjFQK4yGD83W/Zzc1JtkYAp7HFr
	 YiTr+T+aGCNFnwhndRNOQg7x8Mn3oX0+YfX3CTWznLdEQiSnPnzf5xJfHwpaKo/ZTK
	 7TQ/FaHFs7+jOTrIyA4C/C++F+435/pK/LJXLLoMxHqmyRCgyYV1hLVPbdU9e0z0tp
	 XcHNxYA/Y6J5EhLiD21CNSpij8ernXpwojze9/tK04JR30/4OHbnKon/mwhECJ1tWr
	 6z2WzYHLie1ag==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b941762394aso635392966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXidQ0SluGvAINdyHHoov1A3IG0vup6U8pXknboSuWUBFILNopS5yRXawHvF8xRnagS765XktEwTh/z+zLWR6zJ@lists.infradead.org
X-Gm-Message-State: AOJu0YygsltuecfNN4Fi/SNOZR0iY2TDbYQxj8Hmp1RB6612HKbvQjtf
	oT59Os0/xLxnAFdy8dfwmrFSRuAZl4j/AtFYAOZvZTGUWY87bPd2Hjh2NsbGbBa2TLcxVqaFcGA
	r9cc3PzkdquKfxeXghWeIjTaABqVAoQ==
X-Received: by 2002:a17:906:2091:b0:b97:1d24:c015 with SMTP id
 a640c23a62f3a-b971d24fa35mr124911866b.40.1773166226421; Tue, 10 Mar 2026
 11:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <20260306-mt8196-ufs-v9-3-55b073f7a830@collabora.com> <20260306163305.GA2680515-robh@kernel.org>
 <4089450.ElGaqSPkdT@workhorse>
In-Reply-To: <4089450.ElGaqSPkdT@workhorse>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Mar 2026 13:10:14 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+mF_Q7Ld8__ZTc5yDvWAT6uK5wxfBJM-YdFjOvdiDc-w@mail.gmail.com>
X-Gm-Features: AaiRm53tDdS80GaVjUeFGPThiibYh4p5Q5y90_XYQtN7oN_0_RN9C3azVe77kTU
Message-ID: <CAL_Jsq+mF_Q7Ld8__ZTc5yDvWAT6uK5wxfBJM-YdFjOvdiDc-w@mail.gmail.com>
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Stanley Jhu <chu.stanley@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Chaotian Jing <Chaotian.Jing@mediatek.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 6, 2026 at 12:37=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Friday, 6 March 2026 17:33:05 Central European Standard Time Rob Herri=
ng wrote:
> > On Fri, Mar 06, 2026 at 02:24:44PM +0100, Nicolas Frattaroli wrote:
> > > The MediaTek MT8196 SoC's UFS controller uses three additional clocks
> > > compared to the MT8195, and a different set of supplies. It is theref=
ore
> > > not compatible with the MT8195.
> > >
> > > While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS p=
in,
> > > it appears that these two pins are commoned together, as the board
> > > schematic I have access to uses the same supply for both, and the
> > > downstream driver does not distinguish between the two supplies eithe=
r.
> > >
> > > Add a compatible for it, and modify the binding correspondingly.
> > >
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Vinod Koul <vkoul@kernel.org>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > ---
> > >  .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 58 ++++++++++++=
+++++++++-
> > >  1 file changed, 57 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml =
b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > index e0aef3e5f56b..a82119ecbfe8 100644
> > > --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > > @@ -16,10 +16,11 @@ properties:
> > >        - mediatek,mt8183-ufshci
> > >        - mediatek,mt8192-ufshci
> > >        - mediatek,mt8195-ufshci
> > > +      - mediatek,mt8196-ufshci
> > >
> > >    clocks:
> > >      minItems: 1
> > > -    maxItems: 13
> > > +    maxItems: 16
> > >
> > >    clock-names:
> > >      minItems: 1
> > > @@ -37,6 +38,9 @@ properties:
> > >        - const: crypt_perf
> > >        - const: ufs_rx_symbol0
> > >        - const: ufs_rx_symbol1
> > > +      - const: ufs_sel
> >
> > "ufs" is redundant as all the clocks are for UFS. Same comment on prior
> > patch.
>
> Is this naming a big enough concern to block this series with two
> explicit acks on this patch that fixes a wholly broken and useless
> binding?

Shrug... Is changing it really that hard?

> > > +      - const: ufs_sel_min_src
> > > +      - const: ufs_sel_max_src
> >
> > "src" sounds like a parent clock? If so, probably shouldn't be in the
> > clocks list. 'assigned-clocks' is for dealing with parent clocks.
> >
>
> I don't know what it is, and I have no way to consult any documentation
> that would tell me what it is. I am trying to put out this dumpster fire
> of a downstream turd that made its way into mainline as the review proces=
s
> has been completely subverted, and is only getting worse with each passin=
g
> month that MediaTek is allowed to block this series from progressing whil=
e
> sneaking further changes through.

It's good Mediatek is active, then they can tell us what the clocks
are for. I would think the driver would give some clue.

I don't see how accepting sub-par bindings or not fixes the issues here.

Rob

