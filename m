Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D70C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHQ0tvNoqJ2yord/lFVua7QgHw4bt6G06+wkrQtEyBg=; b=SCO1dRc1Fr+MqRVGNgpj3sgyfL
	3U7QphFwYHeTl1VdHNTqdjcFdagSu6LTFOtnyfQpecIdjO/8gQVa9Yfy1IzaLZuZpx0RQMlWmYB+A
	5b6hAgAnDLnkSmW3ORCtWVN8xNQeiY+6IP5/ztZHnz1pBGuXBJuJypPasuskQNDZ5A839VJiOBeNE
	52RSvFt30XKBBxjU8RhHmfdgIEEKnPcaAjv0vPeqItl+PDsHdkYaX/FHKhERtBP02PfUuPavOL3q5
	ZZaMJmSNDMPvBbGI2wrgwdoKIYO7INp+i/vnLN3+5L6g3EwX6glIzImWWj4hTug+Z7F0srxbnEOLp
	CqjDU3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ73a-00000005Foe-0Z5Q;
	Tue, 08 Jul 2025 12:04:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6wc-00000005F0v-3zIH;
	Tue, 08 Jul 2025 11:57:08 +0000
X-UUID: a66352ae5bf211f09eb0dd999d3936bf-20250708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=lHQ0tvNoqJ2yord/lFVua7QgHw4bt6G06+wkrQtEyBg=;
	b=PlWXGtciKBwCtq6tLTILEx8s1pdXfCY+cB8GMT1V6HaIzP7gOt3d6v3m7AwnEDIu5ggyzLtol/z4TH2CVI95o6u4PH1Ix6qwQ2TwVfqrUHVm4dhidnuUCtRo/0RhoEKSlXPdhMgKJVsS/4TPVUJiTILYoP9U9UNtMxS8JuN6C90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b08f2ffb-b22d-44b5-b885-ec649444519e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3eaefbd7-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a66352ae5bf211f09eb0dd999d3936bf-20250708
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <mason-cw.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1149947007; Tue, 08 Jul 2025 04:56:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 19:56:54 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Tue, 8 Jul 2025 19:56:54 +0800
Message-ID: <b014c34a560854e6dd6a6dd483b9443f42252b51.camel@mediatek.com>
Subject: Re: Aw: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add
 mt7988 lvts commands
From: Mason Chang <mason-cw.chang@mediatek.com>
To: "rafael@kernel.org" <rafael@kernel.org>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "rui.zhang@intel.com" <rui.zhang@intel.com>,
	"lukasz.luba@arm.com" <lukasz.luba@arm.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Prado
	<nfraprado@collabora.com>, "jpanis@baylibre.com" <jpanis@baylibre.com>,
	"npitre@baylibre.com" <npitre@baylibre.com>, "colin.i.king@gmail.com"
	<colin.i.king@gmail.com>, "u.kleine-koenig@baylibre.com"
	<u.kleine-koenig@baylibre.com>, "wenst@chromium.org" <wenst@chromium.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "daniel@makrotopia.org"
	<daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Steven
 Liu =?UTF-8?Q?=28=E5=8A=89=E4=BA=BA=E8=B1=AA=29?= <steven.liu@mediatek.com>,
	Sam Shih =?UTF-8?Q?=28=E5=8F=B2=E7=A2=A9=E4=B8=89=29?=
	<Sam.Shih@mediatek.com>
Date: Tue, 8 Jul 2025 19:56:54 +0800
In-Reply-To: <trinity-e9eaf8fd-42f1-46d5-b1df-3bfefe02b2fe-1750057280436@trinity-msg-rest-gmx-gmx-live-b647dc579-tr2th>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
	 <trinity-e9eaf8fd-42f1-46d5-b1df-3bfefe02b2fe-1750057280436@trinity-msg-rest-gmx-gmx-live-b647dc579-tr2th>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_045706_996441_6BE77741 
X-CRM114-Status: GOOD (  17.10  )
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

On Mon, 2025-06-16 at 07:01 +0000, Frank Wunderlich wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> > Gesendet: Montag, 26. Mai 2025 um 12:26
> > Von: "Mason Chang" <mason-cw.chang@mediatek.com>
> > Betreff: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add
> > mt7988 lvts commands
> >=20
> > Add the LVTS commands for Mediatek Filogic 880/MT7988.
> >=20
> > This series fixes severely abnormal and inaccurate LVTS temperature
> > readings when using the default commands.
> >=20
> > Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
>=20
> Hi
>=20
> just a friedly reminder for maintainers, is the patch series ok or
> does it need any changes?
>=20
> regards Frank

Hi all,

I submitted the patch a while ago, but haven't received any response
from the maintainer yet. I would really appreciate it if any maintainer
could take a look or provide some comments.

If there is a more appropriate maintainer or reviewer for this patch,
please kindly let me know or help forward it.

Thank you very much for your time and help!

Sincerely,
Mason


