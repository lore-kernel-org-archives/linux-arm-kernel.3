Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD5DC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31MkZx6QLAqtW/NqnNOi+UscMDhWWhNudTK63d8OWVo=; b=vfPmnG/MW5G0JbYiizNRAVhKRB
	YJtuI0590aG9wYzEXvbLsGvycheUDW5mHsZ+sJAeQCyHoy0K/TrW7GXe4uvtaNVj1jcWRZUPjZi8K
	yVmeneSFsSXT60RybaJpv6Grgac7GvKlecrxl39A5V0HsLy0auSPntTt7MYul/4oNu6M0SuHjRlKO
	hW3CAO2B4NExi/bGNbHf4jqkCL7ZRZoOBr8r+fLmNwJRkLi4XuICJ0dytJMqPxLWigYh9jSzLV3xG
	S/uYnSmGW/R1D682zVtcrjwrZoA4d21YVbkSD2xpY028zBggy0xkE02s0blCWcn6pXp9NRoApYZuU
	jtVsmxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoyx-00000009Yzb-3Zhj;
	Wed, 18 Jun 2025 09:21:23 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouo-00000009VUc-0D4K;
	Wed, 18 Jun 2025 09:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1750238087; x=1750842887; i=frank-w@public-files.de;
	bh=31MkZx6QLAqtW/NqnNOi+UscMDhWWhNudTK63d8OWVo=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=r3sPQk27on1YoyTLna09nRRPjUc6CgT1ZqBQzQLMM4LRL2IqExQN8oPpUsNWwtId
	 1Vr9dzj1v/EpYd8JG26ihFW4tTjmCO3jkWSCqhnsg2n+7b0IwMJCHAuwV6/sD/2ca
	 lMmBH8RHmfr1kGRtReH0OssTInLfaZvuM5R7Zl2CMV20sUfPLzfWjxzRonx4Mn6xq
	 COH0o98B7Tbb2z7S3ZBXqsmcHi1oetso28bSV37GzE6r2WSdMwfRGyUoyR5H1JE0+
	 g0bRK+HRMF7D+x6nXoxy5kIQwsaUY9k5OVYm2+E2kzCdo/yw+lkZaXZWyebCJc/+2
	 sQGGP0l03OBayDjbzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.65.113.165] ([100.65.113.165]) by
 trinity-msg-rest-gmx-gmx-live-847b5f5c86-t48nw (via HTTP); Wed, 18 Jun 2025
 09:14:47 +0000
MIME-Version: 1.0
Message-ID: <trinity-98989ec6-5b15-49ab-b7e0-60e5e23dd82b-1750238087001@trinity-msg-rest-gmx-gmx-live-847b5f5c86-t48nw>
From: Frank Wunderlich <frank-w@public-files.de>
To: horms@kernel.org, linux@fw-web.de
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, daniel@makrotopia.org,
 arinc.unal@arinc9.com
Subject: Aw: Re: [net-next v4 3/3] net: ethernet: mtk_eth_soc: change code
 to skip first IRQ completely
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 09:14:47 +0000
In-Reply-To: <20250618083556.GE2545@horms.kernel.org>
References: <20250616080738.117993-1-linux@fw-web.de>
 <20250616080738.117993-4-linux@fw-web.de>
 <20250618083556.GE2545@horms.kernel.org>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:cgeZTBzTr16R05ltfUpcloI8raW3AvLgsejsxFqfAoMHyHWNB5vkqYr3kXrTTzFVpnwCe
 dTDpwkYJXjF83EtsHZx+QCZWl0ineJYaJctMIX5cNyc+orbBsc6vWRBXVj9LYPYwpcqmuz8AwIZE
 eBEva+vW2Pf6ABpTggQqOjj1pTwlKX6GReTp0yk8xC8V2yAYZDkDB5tl3VIFyQtfU3Wstty438SX
 DQ4+lDn5ds9J9huivawUQogrcsvDjJ2RO4rp7WzqLMvGUJZ8Wkrdgs5cwsWUy3ZPPyZ98XEpqdW4
 PPe2Tuixm0kYGL7TKvgwAFrlqEMr5xP0UXQlhRi5TPdJ65g5FEyx3Vlz9nT1VPkBpk=
UI-OutboundReport: notjunk:1;M01:P0:nPaP/13hdPQ=;c6rGciUDjgJwvNettvYeQyHtQ9w
 JXpGtLhdEOBbG3sn4CDv6IssX1o9gYrljJpoJxPBpTUdFSXfmcjSXdWZwmZ/uK9dMHHH/6TqD
 sEpFcML/k5KZ7kFRv/c3aYdclg1pgOdLPzwvTCzfbNiOeo9tTGY8nTBalVTVewS3itAzRgHvi
 jxlGsJFyCx9oyB9djWLyBOBLBLeinu2IlF8+Av1LL7HimSCz5jomeuIX2twOk2cplWRgb5F++
 hCeVCOvHDYYaBJ9m7CXGdMqqGcN6keTAKTVH1b219qtPIWazDTaDF8WkzF/wjy+WAkyAPQp2y
 DsGnbzuhkINW6q8u3mpxl9A8019gA+szoG7lVq6k/4w+XlTznlpUud3HCNH9T5GKYHQZcYch0
 phaAY3T5eYG6tPVCUuj7uzBC89PL3hMOlieavZZc/uybj/X3vC7CZ+Ii5LpGn77Y2tZNYe9i0
 ORzb6DvVvPRNpkn5Q8//+cx6vka0VBdZCYiBNb9eFIzxITZnifYMHYv3n9+ce/FuM+GKU3Acm
 JLfnuD18lHWBED4BHwrhoVfgkPvGn5W+WT7DJavzdjzsHn/z3y2hTWKxleXkjoFDi4Jb9dHYu
 fxrGcBkbVUUa0s0yeSMWVquGplDElaGfBav2G7jbXtRfgljIoOm2LqlYjoD1GkNkFqYxg/QIK
 0dbJtHRBsZzEQPYcykn4TF9g41Ngo6P7w+ucz7MRypytShfMi54K27YnOwVTuyiNlxZmLyBiD
 BvaTNUnOeUc4xdyGPIZjnbBZBfbjyEWW5m5k3pzglPgoCNF2T2ntUCemzO7CzKmtf4h+xHvQ9
 onLx6nrkZJQQMETa9QCbqBTCNQRQHyXg82RrDrfB7tDlKC162SZIGWSRh3DyEOcgOjJe1BPLg
 8XQMAHzK9QnR9PF5kcy/VTeuQqXs+WETHSv+l2/rVa+4/oxQCZTw46IpvgmF4w5n3NGpRV9le
 MvQv0AiaIib/JGp56TQ7iSNputGKTw9FvpjsUkASRfFrRWZW2GSsiP3eArpt6OXK0lFiaAnsb
 HKfOwhLcx4LcacvFB2BdplfbK4QSpCuPFrGJd5cbP5jV5PPoyP841xHuFQsHQUrzFgkVeRjpp
 MJX0eFsY39FgsI2qYzXFmgtdcyEe8O7sYavHv0Mnj7sXK2s4kAl3ckvgGG+h/sRJQcI2CUY3A
 a65UXg0uNOCUN9TirgJ+FnoKL266oBD91XBJpspdLeAM1vFYzfNStqUCuhpvG2Gmf4+niDZn1
 mueFkErzDlQ+oR3+6LZFyf5jgPfLszYh3jc07Vb+7gaX41BRvQHRrrr1jFd31jN4o47nzqGra
 6ugehoqsKshvXmvkLyWSKCZb0r2o0QbSuO439u5YGJHgsACFloy7/IoD0xIb/Jf+tetRE6i0G
 bnMNy8y/9cKS8033LVjXhfYkStNqmk+6heJY8m7j2gj5QYh/i490TZZVeQ+V/MKcr21t3bdL2
 dkCZo5WnErZ71VNSkyEO8wQ2L/Oe4CJb+ztIoHr6CfNc+tBhqvm+256NchuVOqmYxFcnFt6Ii
 HV90CL2jQ1ei53G8FSF8gNMPFWbvRf9jisSTUEdCOSye4Ryqh64+V8qS9pad7AufE1p1fWHqh
 UOtKrEbxUT9MqY0QVlgnCQi9SKNN7dMS8dui3uHsMLNQCrD/jWybivL8ttXrQJlPS+I6K5Xmq
 u5v86uvfWBFwfiiWi89n8KozJR51vYZxL8kT136V6CIoP/FSx2r/fLUXOUs54vWjWc3PqOZff
 exzMYhXHTn5ESvu/lgiy2s8FqChEfnVSF+O9cQSD4VTO0+1UFuaqMBxOti+ulrFG3zP9D6SYL
 4NxsE6UnMb5LwN99b+3o8QJmYnSB/gqRw/tGTJFa21VfU5SB0tV0zMG4vW2x8KaXxkkEKBuAU
 6xhKf9JxpEzWJJOm6IfetUCmjvQ/qkRchdJVUVN71fz3p6dUQeEKE6nnXoQpMVnrzGHjzqisQ
 lwEJq3q2SWCMhIFQwWO6Oi36sWiOMHQVsafG4jZguDHfjZqYHM2G3xtmsYdw2hrq/knkCUq8T
 qzN6/FLihqV7o1Y1DJhKlSTC4E1yJThJnn6vFW5ulXlaJTVkwoRfIrZGdm6AWLwqwTXDAS/nI
 Dxf6BTQQSGFDEHqFvm9bXS5oNRAGbzYahYw79q4tDhrKqip5wKhRLsi6yMyukh6yy8QOrAXGx
 N6aYAvr5JyW3WaHjxx6AvZJDBQdX6AUJZzmdOjp0rU0P/gdMVBdb+ZoPVZbJU1+M7R9j9r6J6
 pIRUsMIRzFyuABdSen84dPOcRh6rfQob+qnwHuX3WGuKcF2uYITHTvX/fp6HFXq8SCcNrTtnZ
 9+yK0r12WoXc3lRuP1kCM4mOhXx3j/k1MB/4M8qwuqsYKqDHC464FtnOhhaNqIhAnjSPWe8os
 69NAp2ztt41cqi/PLjc1UOtiQK7kkwxmUiFNyL6ogf56P98x88N+IPNrhPNa60Ob0gYN/iG3V
 q6KT7z2bnaXXEbWN2rITEGdxIcSvmvhjUZzlfuzcAHfR+wvs4v7twynye3BW1BzKLg9i0p2oJ
 X81JqMGKXkUnxnjHekg4QN/PnHBw6e+bktBxvQaH+vMVnORB5swlumXHPp7BPaW7CHHk//qKv
 EB/RiQVSlB4eygkIi7zYymGN4ugJOpBx5qjs1sVmmhzSKY6MEl1fnDx18rAkj8/FpeU8D1Pr8
 gbiT0PsQzo6zl1moClrxcL9RoNnCFzbGlKt2x/YBjPsf36h0GixwqHx9GtK9GsukVvl0xaoob
 vsUBJAkPejUErdRQN6VSYl2g7F9ZcS4ECSBavRxR33ANNd8neJt0GthoSp+I6bOR2z7QZsTLk
 IYWKzItLYSsrpYRDpYB36UWybAzPOuy3wCsnQm/zBkokUBaErepnVgOpTAZTIFo1Sykh1iR66
 vXzca92F8nevGHamhs7tKXM5dhM+UYVD+gXMHRatRNbKDnpE3uRw4kpauPpx6y98nD7rHxWcA
 RnGwNw2N8Mh+qDBjqdf40Ll/7gsxXlQ=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_021706_802719_9BEAACFB 
X-CRM114-Status: GOOD (  32.50  )
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

Hi Simon,

thanks for your review

> Gesendet: Mittwoch, 18. Juni 2025 um 10:35
> Von: "Simon Horman" <horms@kernel.org>
> Betreff: Re: [net-next v4 3/3] net: ethernet: mtk_eth_soc: change code t=
o skip first IRQ completely
>
> On Mon, Jun 16, 2025 at 10:07:36AM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >=20
> > On SoCs without MTK_SHARED_INT capability (mt7621 + mt7628) the first
> > IRQ (eth->irq[0]) was read but never used. Do not read it and reduce
> > the IRQ-count to 2 because of skipped index 0.
>=20
> Describing the first IRQ as read seems a bit confusing to me - do we rea=
d
> it? And saying get or got seems hard to parse. So perhaps something like
> this would be clearer?
>=20
> ... platform_get_irq() is called for the first IRQ (eth->irq[0]) but
> it is never used.

ok, i change it in next version

> >=20
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v4:
> > - drop >2 condition as max is already 2 and drop the else continue
> > - update comment to explain which IRQs are taken in legacy way
> > ---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 20 ++++++++++++++++----
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
> >  2 files changed, 18 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net=
/ethernet/mediatek/mtk_eth_soc.c
> > index 3ecb399dcf81..f3fcbb00822c 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -3341,16 +3341,28 @@ static int mtk_get_irqs(struct platform_device=
 *pdev, struct mtk_eth *eth)
> >  {
> >  	int i;
> > =20
> > +	/* future SoCs beginning with MT7988 should use named IRQs in dts */
>=20
> Perhaps this comment belongs in the patch that adds support for named IR=
Qs.

also thought that after sending it :)

> >  	eth->irq[MTK_ETH_IRQ_TX] =3D platform_get_irq_byname(pdev, "tx");
> >  	eth->irq[MTK_ETH_IRQ_RX] =3D platform_get_irq_byname(pdev, "rx");
> >  	if (eth->irq[MTK_ETH_IRQ_TX] >=3D 0 && eth->irq[MTK_ETH_IRQ_RX] >=3D=
 0)
> >  		return 0;
> > =20
> > +	/* legacy way:
> > +	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken f=
rom
> > +	 * devicetree and used for rx+tx.
> > +	 * On SoCs with non-shared IRQ the first was not used, second entry =
is
> > +	 * TX and third is RX.
>=20
> Maybe I am slow. But I had a bit of trouble parsing this.
> Perhaps this is clearer?
>=20
>         * devicetree and used for both RX and TX - it is shared.
> 	* On SoCs with non-shared IRQs the first entry is not used,
>         * the second is for TX, and the third is for RX.

I would also move this comment in first patch with your changes requested.

/* legacy way:
 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken from
 * devicetree and used for both RX and TX - it is shared.
 * On SoCs with non-shared IRQs the first entry is not used,
 * the second is for TX, and the third is for RX.
 */

i can keep your RB there?

> > +	 */
> > +
> >  	for (i =3D 0; i < MTK_ETH_IRQ_MAX; i++) {
> > -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> > -			eth->irq[i] =3D eth->irq[MTK_ETH_IRQ_SHARED];
> > -		else
> > -			eth->irq[i] =3D platform_get_irq(pdev, i);
> > +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
> > +			if (i =3D=3D 0)
> > +				eth->irq[MTK_ETH_IRQ_SHARED] =3D platform_get_irq(pdev, i);
> > +			else
> > +				eth->irq[i] =3D eth->irq[MTK_ETH_IRQ_SHARED];
> > +		} else {
> > +			eth->irq[i] =3D platform_get_irq(pdev, i + 1);
> > +		}
> > =20
> >  		if (eth->irq[i] < 0) {
> >  			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);

code changes are OK?

regards Frank

