Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E2CC678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tlDAQPp+Ak4wlcbM+NYh2qaHTfYWrGnJVTAcQWxrFQ=; b=c/EW7Dx56w1mwukbn9bCFzy4CB
	GTnjd4SoZOr/nBLEA0QbgAwH+S2Q3lSmS7HQSWecUzOEoGL/ZWoUCR/HhIb1KUDUsMfMlqMuTBnin
	a5or96i4Cq0HeDDKIJjJgjy4vxBYkgB6yOcdH0WTYFjvfuuG2g0gqCUsnGOSDwHkBQKmNMj6CVAP/
	V67V0iTGyn5nre9t/JQ+w2pUgdeBkzk3GEaSC3lacR0Eh/MGG+c8/yuP+7GyKCEPwcjKFV2iT6FwC
	IIbpcUfza40tNKPN8n/aMqq979VbV0uuiT3F6Z1t/qNMr0S+9Cfm5sfoHehCPR/Q9kXsGYyXn2q/A
	N1gTog1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnh-0000000AEFQ-0Fyf;
	Wed, 11 Jun 2025 14:51:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIxN-00000009eDt-0YKO;
	Wed, 11 Jun 2025 10:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:References:
	In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4tlDAQPp+Ak4wlcbM+NYh2qaHTfYWrGnJVTAcQWxrFQ=; b=eRQB40Yq2EtSoukR2/+g8nK+DP
	Sg+J39nDAxDc1vvDP6L3f8wxUl0Jtcl6ZHAwUkI2ZdDnMxxo1qzAyRII5jk4Oln/TH7ijmpc2vs18
	X2kIcESZ37C5fEi9QALoRMHUcwi5Ok7vaLtjzivVkvStMkm/r6wt2JZJZZPB6HYWh+LE8gAvKJZfl
	r8Gxd0cp6Kwo92IO0sHYj6xfdYx3WyAQrBsIhtPiWN9EqH/UqFi4+QLzrxq4ng+ygnG5aofHzbeAC
	FQOoFL/EKJIvWC7xD1lY8njFoDtKrgCUIDrOEi2hdAXPcq2Vkqzt87qbQv+AeJfW/d39YCuGSrGC/
	AnOEL4xg==;
Received: from mout.gmx.net ([212.227.15.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIxL-00000002HtG-0nQ2;
	Wed, 11 Jun 2025 10:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1749638694; x=1750243494; i=frank-w@public-files.de;
	bh=4tlDAQPp+Ak4wlcbM+NYh2qaHTfYWrGnJVTAcQWxrFQ=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RpRDFNg6OkTnwbBvFDQXwDw3ZnY9fU3SrWVN6Y0AXpmLJ7VOUA8Z+M8lU7AOerFI
	 Ha04XjyzR2yeNDFmBcVpY98IddLHZcPn29i5nnoMdrR/9xpwb0YoUEpnZKPFGYcwg
	 97vULFG6z8g1GjgKEfEkWk2eLOWr3LemMUBr0E0ngW3/rXuKzRYQAMp656pA0B34S
	 fg7wYUbEdaK46atnrcxjtJiC/ZAIybLh5qFyMBhxd938EnygQg9YCnRjvHk24tVH3
	 QlxojIlFYyrqJK2nso72mIArxmmT3mL9w7Sz4jAauUjNagdcb+KURa32u4epCnNMS
	 LwlCCn2UEh5EKLDnxw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.70.254.165] ([100.70.254.165]) by
 trinity-msg-rest-gmx-gmx-live-847b5f5c86-m27rw (via HTTP); Wed, 11 Jun 2025
 10:44:54 +0000
MIME-Version: 1.0
Message-ID: <trinity-cf16c45f-66e1-486f-969f-fb19f722f769-1749638694479@trinity-msg-rest-gmx-gmx-live-847b5f5c86-m27rw>
From: Frank Wunderlich <frank-w@public-files.de>
To: angelogioacchino.delregno@collabora.com, linux@fw-web.de,
 myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, johnson.wang@mediatek.com,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, daniel@makrotopia.org, lorenzo@kernel.org,
 nbd@nbd.name, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH v3 12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add
 sfp cages and link to gmac
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Jun 2025 10:44:54 +0000
In-Reply-To: <37c7ac6c-a5ea-45cc-8ded-9d9bb22d092e@collabora.com>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-13-linux@fw-web.de>
 <37c7ac6c-a5ea-45cc-8ded-9d9bb22d092e@collabora.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:5rfuqZloftTYUAetD3kmXeAf3vlJVORdvbUbXRuFz6ctJ/YskeQgbaIrY1+CKtBB0RGrh
 xF81oHJBfThhmKqrC7/MQbVKLhQiQWo5qNeBUoLAMolFs9/NiZFcTlCZyGcmFfFI0hkp9ZSMyVJb
 f4bzJVC3oV/YaOnXFS6mtZMMG0pGogVwoOwr2mbGIpAEGfIwdAAJgdbz8AbxmhVo4sxEF82H6CZj
 89B+KQaWe4amQ0aIQvb6vKIVxQhS1Swsl3m5OKYvFRxldHOFP5ovfoiHVT75u9kGH/OaBI1z83Q6
 mo6DbsyMc0pMe1Nb7DpiY6xS3BA6NvYt9rxOvEUAC7H4Co/P/IqvPwiUkoCq6PY1SQ=
UI-OutboundReport: notjunk:1;M01:P0:daVp29AyH1E=;NfjQzZDQVxx/ddNWbUFfMljQE5a
 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
 MmTkMNEeyg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_114519_403007_5964F8C7 
X-CRM114-Status: GOOD (  16.39  )
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

Hi

> Gesendet: Mittwoch, 11. Juni 2025 um 11:33
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> Betreff: Re: [PATCH v3 12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add =
sfp cages and link to gmac
>
> Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >=20
> > Add SFP cages to Bananapi-R4 board. The 2.5g phy variant only contains=
 the
> > wan-SFP, so add this to common dtsi and the lan-sfp only to the dual-S=
FP
> > variant.
> >=20
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v3:
> > - enable mac with 2.5g phy on r4 phy variant because driver is now mai=
nline
> > ---
> >   .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   | 12 ++++++++++++
> >   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts   | 18 ++++++++++++++++=
++
> >   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 18 ++++++++++++++++=
++
> >   3 files changed, 48 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.=
dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> > index 53de9c113f60..e63e17ae35a0 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> > @@ -9,3 +9,15 @@ / {
> >   	model =3D "Banana Pi BPI-R4 (1x SFP+, 1x 2.5GbE)";
> >   	chassis-type =3D "embedded";
> >   };
> > +
> > +&gmac1 {
>=20
> phy =3D ...
> phy-c..onnection-type
> phy-m...ode

phy-connection-type is dropped in next version due to comment from andrew,=
 but i order alphabetically

> > +	phy-mode =3D "internal";
> > +	phy-connection-type =3D "internal";
> > +	phy =3D <&int_2p5g_phy>;
> > +	status =3D "okay";
> > +};
> > +
> > +&int_2p5g_phy {
> > +	pinctrl-names =3D "i2p5gbe-led";
> > +	pinctrl-0 =3D <&i2p5gbe_led0_pins>;
>=20
> pinctrl-names
> pinctrl-0

what the difference? i don't see it :(

the others i change in v4

regards Frank

