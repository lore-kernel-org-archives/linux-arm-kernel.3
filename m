Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4956C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aghQrEuv07Kg/49XIOsAMbUc4OCdIaCvXcCyXwdlBcU=; b=eO9R7n2s7J42ldGADwlOf106NC
	AqdIyNFdzY9PIjofP1Gr6AceVxhO+/6Jrb4oHTl2p3/V4taZ/fyA/mVq9kwEp0Aq761bvcpG2pJ9Y
	c6Vxe5/sx2J4sYVT8y05yx2KpuD+Fmv2DzztWmxpRwNP6KpFnzr1hzLRPOVl/Es5ucyVrQqwwx6hj
	FE+oQ8aU0c6CF7dKOiWcctWx0i2Xd/NUETIa+uZ/ZIa+Z/ezphLCNKUAZ8dxGcmCIsPEP0r97VS4M
	CgBLSgd+zsSIxlrDo48N+Bp0xBBm2KVY/1uDqwiPgDNE5OyyEpi8q8JFkBnIeAZf3SWHBvW+kv2xG
	g5FNHHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWJ0-0000000CoAC-1t7G;
	Mon, 10 Aug 2026 20:09:06 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWIx-0000000Co89-20mH;
	Mon, 10 Aug 2026 20:09:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786392531; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tm0PUocv/gi2E6HcqYTQT2pDn6KnObWb7LePlfoVSlX1p14pKnfF/fwNp+ORfSQQ3MpZCd0QmGSDz/TagA6F6VKoIVTQa8fU/QN4LYpwWvtHzy1TlilhCDF6IY74tnsb7zSsuTDFi6fTUFkHebOuLu3m8OmE3gNtojL8dGHGxaA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786392531; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aghQrEuv07Kg/49XIOsAMbUc4OCdIaCvXcCyXwdlBcU=; 
	b=nIy+4B/HkFkqTW0IzpUNHE2CCy1o+ksIhCbzllmNl/rJxg4ovu1dnJoXNyxxFMCc29h8/sglY/faBWKKDcWKGl2iW46cCinvmuRM373DB3Ttp/jWV4jz+XHuXqesD4EpBcAkGvAliymw64FCWpwnGt/drN9zwGgZ4zX+USPyH+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786392531;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=aghQrEuv07Kg/49XIOsAMbUc4OCdIaCvXcCyXwdlBcU=;
	b=Owh4u13YFFu/6vVccwUniknonGozUe9TD9M7C9qozuX8PByHKY1PZeimVCG2zmNf
	oyH3Q6Ds66IZWHjTHa+btnG5rtyom6UnvD61NHylPxxoFWIPULAlm74epQLzyszJie4
	EcsufKSzTTyou6vllmatKSiCKrN8nlz2k7EvgiAmb0tOswaAcV/JbS8w+zS+Vv+gsxV
	MZSY4c095GHRx6tQZm+SgpsvAA7+JjbafNb2+TIiuK2zV/PGZFiHZvgv6WL58DD3p82
	7RWrXz9tDdg1bBHfuGxGNDTsQxkVUsLG84t0oSBiTOvlyGXT2Bane23FMd1HkzAhaWB
	ff3FypMz1Q==
Received: by mx.zohomail.com with SMTPS id 178639252844422.461369694751397;
	Mon, 10 Aug 2026 13:08:48 -0700 (PDT)
Message-ID: <868e97331dc74f176db2d3efdd1c579049b8e493.camel@rong.moe>
Subject: Re: [PATCH] Bluetooth: btmtk: Disable remote wakeup for
 MT7922/MT7925
From: Rong Zhang <i@rong.moe>
To: Michal Pecio <michal.pecio@gmail.com>, Chris Lu
 =?Big5?Q?=28=B3=B0=B8X=AAl=29?=
	 <Chris.Lu@mediatek.com>
Cc: Alberto Garcia <berto@igalia.com>, sean.wang@kernel.org, 
 "luiz.dentz@gmail.com"	 <luiz.dentz@gmail.com>, Will-CY Lee
 =?Big5?Q?=28=A7=F5=ACF=BFo=29?=	 <Will-CY.Lee@mediatek.com>,
 "marcel@holtmann.org" <marcel@holtmann.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, SS Wu
 =?Big5?Q?=28=A7=C5=BE=CB=AAY=29?= <ss.wu@mediatek.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "linux-bluetooth@vger.kernel.org"	
 <linux-bluetooth@vger.kernel.org>, "patchwork-bot+bluetooth@kernel.org"	
 <patchwork-bot+bluetooth@kernel.org>, "linux-mediatek@lists.infradead.org"	
 <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"	
 <matthias.bgg@gmail.com>
In-Reply-To: <20260809223320.24431a4a.michal.pecio@gmail.com>
References: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
		<178050901239.1520440.2026593395539384648.git-patchwork-notify@kernel.org>
		<3f9c376a5dbfc9d737e2a7f83c5db8e591fb8793.camel@mediatek.com>
		<17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
		<CABBYNZ+rR71SKUEuZBTf+E3SwRNzV2-s-zt8EwNJM3PSx9qB_A@mail.gmail.com>
		<fd8587e97a48e49332a4ad36e51e18739d000250.camel@mediatek.com>
		<4e96132bcfb267af05c06dc277b5ba6895e3ddde.camel@rong.moe>
		<99fb847b8fdedb1464798230407719912d6585c6.camel@mediatek.com>
	 <20260809223320.24431a4a.michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2026 04:03:38 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_130903_561479_41860AB5 
X-CRM114-Status: GOOD (  19.01  )
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

Hi Michal,

Thanks for your insight.

On Sun, 2026-08-09 at 22:33 +0200, Michal Pecio wrote:
> On Mon, 29 Jun 2026 03:01:19 +0000, Chris Lu (=E9=99=B8=E7=A8=9A=E6=B3=93=
) wrote:
> > Hi Rong,
> >=20
> > Thanks for your understanding. We hope to find a better way to handle
> > this issue.
> >=20
> >=20
> > Hi Luiz,
> >=20
> > Regarding this issue, MediaTek Bluetooth team has already initialed an
> > internal investigation for problematic combination and will seek
> > assistance from AMD SOC team to investigate the root cause of this
> > issue.
>=20
> Hi,
>=20
> I have seen multiple reports on Arch Linux forum of MTK Bluetooth chips
> sporadically locking up and no longer enumerating on AMD systems, also
> desktops, which had to be unplugged from power to restore operation.
>=20
> I have also seen claims that auto power management is broken in btusb:
> https://lore.kernel.org/linux-bluetooth/cover.1774348119.git.berto@igalia=
.com/T/#u

I believe the proper fix of autopm failure during initialization is
https://lore.kernel.org/linux-bluetooth/20250319231235.812700-1-sean.wang@k=
ernel.org/

Some time earlier this year I was planing to pick it up and push it
forward, but it turned out I was too busy. Maybe I will find some time...

That being said, the bug I encountered has nothing to with the device
initialization though.

>=20
> This, if true, offers a plausible theory because:
> - URBs issued to suspended devices may fail, drivers may not notice,
>   make wrong assumptions about their HW state and confuse the chip
> - USB core doesn't reliably block submission of such URBs

Not the case of my devices. Autosuspend and (non-remote) autowakeup
always work fine. The only thing that triggers the bug is a random[1]
remote wakeup.

Usbmon always shows no URB between the autosuspend and the subsequent
remote wakeup, expect for the interrupt from the root hub.

[1]: it happens when no Bluetooth device is trying to establish a
connection.

> - they were also seen to break some xHCI controllers, in theory this
>   might be an HC problem - power cycling resets both device and HC

I also think this might be one of the reasons.

Thanks,
Rong

>=20
> Regards,
> Michal

