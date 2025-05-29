Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B04DC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 05:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aOoiOxcK2kOgEKpsrb+lB/8+GYoC6yDyjvcP+th49RY=; b=hEqgeVcw/kN2QPgUmQp/Nuui4V
	vtUg9c1wPu5VgtveWHBLP3Wwh7YUIowYf05mv7eSUFhMCYXL0e/HjzN14tF0Tfc9y+29Ypt1Vwxxs
	uVtA8zCWvpZ+UNo+kdkFlAHy3LftVq/5LIf22PSmzhSndOBKOCEfuhmEeHxrDOj8PeYNlhaK8WV1V
	s6TpTJu55hp9u50zqZhJmxkjDIhgxBChNzDUGEEfGroZKA1GsvoaY2nbLczfbDT4B1CLgDxPDgt+A
	jsyxyGyAEfX+tYwXoeH/Xexay9V9tOpArX1DU1/eLvQbq16h4p8VlPO6eaatNoNs5MM7O8/I03TVW
	zu5L283A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKVhC-0000000Ey7p-0GiY;
	Thu, 29 May 2025 05:20:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKVf2-0000000Exzs-2kKM;
	Thu, 29 May 2025 05:18:37 +0000
X-UUID: 5c45c0643c4c11f08d385d50fb11b32d-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=aOoiOxcK2kOgEKpsrb+lB/8+GYoC6yDyjvcP+th49RY=;
	b=l3MrNSt2Up5544GZVgw6vLJ2GebiZLI0/GImcvSwH0R+2vu9jGZGhotdqB+xAe/BeLAvMydhgBdKeEpxeQ33ZfBF1Trp3HOdR+BUiSxa0aApZ8co/sUVIhCs+UiwqKhxRLpDJPiJqzFnedU4hXDVxNQzvXQot4zrga9pEd4+hTg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:98e5c37b-1fc1-4143-8403-0cec6471065c,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:9c5967f1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5c45c0643c4c11f08d385d50fb11b32d-20250528
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <mason-cw.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 407192186; Wed, 28 May 2025 22:18:31 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 29 May 2025 13:18:26 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Thu, 29 May 2025 13:18:26 +0800
Message-ID: <f0913ce328a2e501566dc311cf8e6c4539d492d3.camel@mediatek.com>
Subject: Re: Aw: [PATCH 2/3] thermal/drivers/mediatek/lvts_thermal: add lvts
 commands and their sizes to driver data
From: Mason Chang <mason-cw.chang@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>, <rafael@kernel.org>,
	<daniel.lezcano@linaro.org>, <rui.zhang@intel.com>, <lukasz.luba@arm.com>,
	<angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>,
	<jpanis@baylibre.com>, <npitre@baylibre.com>, <colin.i.king@gmail.com>,
	<u.kleine-koenig@baylibre.com>, <wenst@chromium.org>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<daniel@makrotopia.org>, <steven.liu@mediatek.com>, <sam.shih@mediatek.com>
Date: Thu, 29 May 2025 13:18:28 +0800
In-Reply-To: <trinity-319df51e-2ff3-42cd-8efd-139fda159824-1748448614514@trinity-msg-rest-gmx-gmx-live-6995845bd-wzmz6>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
	 <20250526102659.30225-3-mason-cw.chang@mediatek.com>
	 <trinity-319df51e-2ff3-42cd-8efd-139fda159824-1748448614514@trinity-msg-rest-gmx-gmx-live-6995845bd-wzmz6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_221836_702610_D060B24C 
X-CRM114-Status: GOOD (  25.99  )
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


Hi Frank,

First of all, thank you for providing the link to the actual issue
case. This issue does not affect all MT7988 ICs. Based on the
information collected from users and production lines, we have found
that about 2% of the ICs show severe temperature anomalies without this
patch.

> Hi Mason,
>=20
> thank you for working on this.
>=20
> I have not yet tested the series, but did not have the issue (which
> should be solved by it) reported [1].
>=20
> So just my thoughts when looking through changes
>=20
> > Gesendet: Montag, 26. Mai 2025 um 12:26
> > Von: "Mason Chang" <mason-cw.chang@mediatek.com>
> > Betreff: [PATCH 2/3] thermal/drivers/mediatek/lvts_thermal: add
> > lvts commands and their sizes to driver data
> >=20
> > Add LVTS commands and their sizes to driver data in preparation for
> > adding different commands.
> >=20
> > Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
> > ---
> > =C2=A0drivers/thermal/mediatek/lvts_thermal.c | 65 ++++++++++++++++++++=
-
> > ----
> > =C2=A01 file changed, 52 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/thermal/mediatek/lvts_thermal.c
> > b/drivers/thermal/mediatek/lvts_thermal.c
> > index 7e4f56831..5b7bf29a7 100644
> > --- a/drivers/thermal/mediatek/lvts_thermal.c
> > +++ b/drivers/thermal/mediatek/lvts_thermal.c
> > @@ -96,17 +96,6 @@
> >=20
> > =C2=A0#define LVTS_MINIMUM_THRESHOLD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20000
> >=20
> > -static const u32 default_conn_cmds[] =3D { 0xC103FFFF, 0xC502FF55 };
> > -/*
> > - * Write device mask: 0xC1030000
> > - */
> > -static const u32 default_init_cmds[] =3D {
> > -=C2=A0=C2=A0=C2=A0=C2=A0 0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098=
D, 0xC10308F1,
> > -=C2=A0=C2=A0=C2=A0=C2=A0 0xC10307A6, 0xC10306B8, 0xC1030500, 0xC103042=
0, 0xC1030300,
> > -=C2=A0=C2=A0=C2=A0=C2=A0 0xC1030030, 0xC10300F6, 0xC1030050, 0xC103006=
0, 0xC10300AC,
> > -=C2=A0=C2=A0=C2=A0=C2=A0 0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E=
1
> > -};
>=20
> could you please move this block in part 1 to the position used here
> in v2 to avoid deletion/adding again here?

To clearly separate changes and maintain the principle of minimal
modifications, you can see that in patch [1/3], the functions
lvts_ctrl_connect and lvts_ctrl_initialize call the commands.
Therefore, the commands cannot be moved to the part in patch [2/3].

> Maybe magic numbers can be described a bit?

This is just an initialization sequence, it cannot be adjusted.

> > =C2=A0static int golden_temp =3D LVTS_GOLDEN_TEMP_DEFAULT;
> > =C2=A0static int golden_temp_offset;
> >=20
> ...
> > @@ -1446,6 +1442,17 @@ static int lvts_resume(struct device *dev)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > =C2=A0}
> >=20
> > +static const u32 default_conn_cmds[] =3D { 0xC103FFFF, 0xC502FF55 };
> > +/*
> > + * Write device mask: 0xC1030000
> > + */
> > +static const u32 default_init_cmds[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0 0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098=
D, 0xC10308F1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 0xC10307A6, 0xC10306B8, 0xC1030500, 0xC103042=
0, 0xC1030300,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 0xC1030030, 0xC10300F6, 0xC1030050, 0xC103006=
0, 0xC10300AC,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E=
1
> > +};
> > +
> > =C2=A0/*
> > =C2=A0 * The MT8186 calibration data is stored as packed 3-byte little-
> > endian
> > =C2=A0 * values using a weird layout that makes sense only when viewed
> > as a 32-bit
> > @@ -1740,7 +1747,11 @@ static const struct lvts_ctrl_data
> > mt8195_lvts_ap_data_ctrl[] =3D {
>                                                                     =20
> regards Frank
>=20
> [1]
> https://urldefense.com/v3/__https://github.com/openwrt/openwrt/pull/18750=
*issuecomment-2877554514__;Iw!!CTRNKA9wMg0ARbw!lVkeuQXjfQ1pWGSvoDCEmf0FEFQq=
qQDEb0ovZ5cSsNiXi7hud5epYUyl9xFjO6U7vukgfBY1Ue_-xJ78F5Qe7rw4UzwJyA$

Thank you for focusing on this issue!

Sincerely
Mason

