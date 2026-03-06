Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B511FCC05C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKyKNZTQ3z66jWtSjSN1+R3K9aCPt08hx4nox97xvHk=; b=fQ/17BE3Q4Qf9AQOubEORgg42w
	NIBbdyTk34so7nPgEIjW9+iZrw7Foxy4tU6sCzcYonporzeCjdWjvhlvaR95wC8T4J8OaePraG0oW
	fPQdfvrpnbUywweWQnAQ9uHfVjSTI4vys0tzayGWfdpcBWBpQufBburcK7pTVyd8eeUm1SbizgDAy
	SkMjLZ6sR55AHPppcHDjuhHnOvRGdRMtiaL3Gm50IXJZZiY6BuJL9CqB+/RqxT6LeJioZbW01y/pb
	ZMberkNKmH5lwblH58uOUfqGN8LUFEE4QiazWbH3OAYJEdOGEn4SXlwFnrCg0aabzUUu97FATGi+Z
	GF4HHz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya3P-00000004LJd-02rG;
	Fri, 06 Mar 2026 18:37:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vya3L-00000004LJC-1BQ5;
	Fri, 06 Mar 2026 18:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772822232; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VMEWbvz5Hnj4zLmKTQduz85HWk/983I4lo59idwq7q35KXDHwytP9XlKfLdFURo+P+b0UhCEdR14V13S4KY87hdQZDMScQ+TvwjJqFoYhxEXiHMH5Ahrwk47FTFBB0Qi/zU/i0FKZN98kxErgKtyMm9Vupd3WuL/roxAGAobj/s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772822232; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oKyKNZTQ3z66jWtSjSN1+R3K9aCPt08hx4nox97xvHk=; 
	b=XrWbKcUyPpthDMFxY696KrDfler1hA+RB2/7EjBkQRxuEz8wOG5h++7KXIzztVwSzrNFZiK6b9cfzGOXMrBhJQuiiEWZrEin96hapASASro8tOAR0ajl1LvedgcnggAxbqm4vtzvoW8HhDFoeOLAmKOcdYsBtRZIw/fV3PuixrI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772822232;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=oKyKNZTQ3z66jWtSjSN1+R3K9aCPt08hx4nox97xvHk=;
	b=K2UYhZDqtQWwaDNMOSNXNi/NUilmovHzmHnxXpWOa4Bg9Pj9jPWEmhsIq/DNNgbM
	c8vlhm5MZIhtvigANBjvTPU9lxq1duvw2Y3XrP0ZyU6WfG9JCa05+wUDHYGsJiuS/3L
	ujchqcxj/xFKK1Y75VVQDxT2pQCRfszw5vxZ7yn4=
Received: by mx.zohomail.com with SMTPS id 1772822230152545.7385167448177;
	Fri, 6 Mar 2026 10:37:10 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196 variant
Date: Fri, 06 Mar 2026 19:37:02 +0100
Message-ID: <4089450.ElGaqSPkdT@workhorse>
In-Reply-To: <20260306163305.GA2680515-robh@kernel.org>
References: <20260306-mt8196-ufs-v9-0-55b073f7a830@collabora.com>
 <20260306-mt8196-ufs-v9-3-55b073f7a830@collabora.com>
 <20260306163305.GA2680515-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_103735_408554_606565A9 
X-CRM114-Status: GOOD (  25.34  )
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

On Friday, 6 March 2026 17:33:05 Central European Standard Time Rob Herring wrote:
> On Fri, Mar 06, 2026 at 02:24:44PM +0100, Nicolas Frattaroli wrote:
> > The MediaTek MT8196 SoC's UFS controller uses three additional clocks
> > compared to the MT8195, and a different set of supplies. It is therefore
> > not compatible with the MT8195.
> > 
> > While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS pin,
> > it appears that these two pins are commoned together, as the board
> > schematic I have access to uses the same supply for both, and the
> > downstream driver does not distinguish between the two supplies either.
> > 
> > Add a compatible for it, and modify the binding correspondingly.
> > 
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Vinod Koul <vkoul@kernel.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 58 +++++++++++++++++++++-
> >  1 file changed, 57 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > index e0aef3e5f56b..a82119ecbfe8 100644
> > --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> > @@ -16,10 +16,11 @@ properties:
> >        - mediatek,mt8183-ufshci
> >        - mediatek,mt8192-ufshci
> >        - mediatek,mt8195-ufshci
> > +      - mediatek,mt8196-ufshci
> >  
> >    clocks:
> >      minItems: 1
> > -    maxItems: 13
> > +    maxItems: 16
> >  
> >    clock-names:
> >      minItems: 1
> > @@ -37,6 +38,9 @@ properties:
> >        - const: crypt_perf
> >        - const: ufs_rx_symbol0
> >        - const: ufs_rx_symbol1
> > +      - const: ufs_sel
> 
> "ufs" is redundant as all the clocks are for UFS. Same comment on prior 
> patch.

Is this naming a big enough concern to block this series with two
explicit acks on this patch that fixes a wholly broken and useless
binding?

> 
> > +      - const: ufs_sel_min_src
> > +      - const: ufs_sel_max_src
> 
> "src" sounds like a parent clock? If so, probably shouldn't be in the 
> clocks list. 'assigned-clocks' is for dealing with parent clocks.
> 

I don't know what it is, and I have no way to consult any documentation
that would tell me what it is. I am trying to put out this dumpster fire
of a downstream turd that made its way into mainline as the review process
has been completely subverted, and is only getting worse with each passing
month that MediaTek is allowed to block this series from progressing while
sneaking further changes through.

> Rob
> 





