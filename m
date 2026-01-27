Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDC3D19515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ1nqRttscRDb16nvyQHmnYUcs+BHGQLI8sK1OBlzmU=; b=IcAfsNT0CCbSuR0QwpWww7tpwe
	f+p5Td4FI/WQGnNJOr1NZNWP7Ozc82yMOYc5Xu7ScxAebeslk+bY9g/d9CduRhoGAFRuu0tmYgNyZ
	nzcUFNwjz6B/PTysdsNBuvyXBGfy8fQ1gNbIFH7XIAiL/6UfYXRFZm9afNk1SPdwDTm1W4WXNWEo8
	V8WGARK/VvIfprFe956BVitG7Elpx2pLVC3FHta8M2z80JX5S7YmbGJR3O6YV+xuJt4llMVYdkfiT
	Vi3PvMNgMcxdjRfMlOosLC6h2NEtPj9ZxdILK5fY6eu6UWIpekOLZCCARE/4OJx2oHQu4d8X+Hooz
	oaYU+/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfXf-0000000Dxob-2VDV;
	Tue, 27 Jan 2026 09:39:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfXd-0000000Dxn9-0APf;
	Tue, 27 Jan 2026 09:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=oZ1nqRttscRDb16nvyQHmnYUcs+BHGQLI8sK1OBlzmU=;
	t=1769506760; x=1770716360; b=SjdqwJJwqwjDGi9atwB7JbG1zOAscLkkxKZo5zDz/bdj2+c
	fhJYWClTNISP2owmCB3CyCZaxY8TCRCGhW0CSTB1oDvDxLmk7HICTLo+Gv79M77hTDLCxsz/3X9MI
	iQyMoM+L4NdrzojRp7sQ1YgWWzBVzQzzWO9oGyS/is1Gsmn8DzSoW5Wmjyg1y3Ait9/pLYNSbCtHN
	esD706CxSOnKInB5Y+cn2QpggMuvL5Pi9gceaa4E+IZSdpTFtFRO060Cpheb9bZhIF7kPTUXNNXWr
	qq1HxpMVylTIxdCO0956EdZJkl2+ASMmMBs6KgtTpOS03nuXv/whu0JznqgQq7AA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vkfXV-00000004vNm-2gYa;
	Tue, 27 Jan 2026 10:39:13 +0100
Message-ID: <3a70b1e233d413b8b812d4c16dd0263f3ff4557f.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v2 1/2] wifi: mac80211: Add eMLSR/eMLMR
 action frame parsing support
From: Johannes Berg <johannes@sipsolutions.net>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, 	linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, Shayne Chen	 <shayne.chen@mediatek.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 27 Jan 2026 10:39:12 +0100
In-Reply-To: <aXiHUlHmrKz8JgXS@lore-desk> (sfid-20260127_103728_074617_E1C38CA6)
References: <20260125-mac80211-emlsr-v2-0-466329d61c88@kernel.org>
	 <20260125-mac80211-emlsr-v2-1-466329d61c88@kernel.org>
	 <01e62344994a34daae0666b3873aa98e72fb5850.camel@sipsolutions.net>
	 <aXftjdCtqnQk69ys@lore-desk>
	 <b592a6c9a8f59f112b2221b9a46568769b1e9dcd.camel@sipsolutions.net>
	 <aXiHUlHmrKz8JgXS@lore-desk> (sfid-20260127_103728_074617_E1C38CA6)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013921_078778_48D9AFA0 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, 2026-01-27 at 10:37 +0100, Lorenzo Bianconi wrote:
>=20
> > OK, I guess the memcpy was right after all:
> >=20
> > =C2=A0=C2=A0=C2=A0An AP affiliated with the AP MLD that receives an EML=
 Operating Mode
> > =C2=A0=C2=A0=C2=A0Notification frame from a non-AP STA affiliated with =
the non-AP MLD
> > =C2=A0=C2=A0=C2=A0should send an EML Operating Mode Notification frame =
to confirm the
> > =C2=A0=C2=A0=C2=A0mode switch at the AP MLD to the non-AP STA with EML =
Control field
> > =C2=A0=C2=A0=C2=A0set to the same value as EML Control field in the rec=
eived EML
> > =C2=A0=C2=A0=C2=A0Operating Mode Notification frame from the non-AP STA=
 before the
> > =C2=A0=C2=A0=C2=A0transition timeout expires.
> >=20
> > But I think better restrict memcpy() then to just the EML Control field
> > and build the action header etc. directly.
>=20
> I guess we can just memcpy() control field + link_bitmap (if present) +
> eMLMR Supported MCS and NSS Set subfiled (if present). Agree?

Well, the link bitmap and MCS set subfields are all _part_ of the EML
Control field, so I'd not phrase it that way, but yes.

johannes

