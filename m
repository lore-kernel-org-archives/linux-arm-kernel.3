Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F27D25959
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+1+uhzaNgtaSPXCQF2LP7SSvxe54i1i/2urVLgEc/g=; b=u52G6M+ESkQbZ029jieXKDmmef
	gX1trghEPeCFXpxsAD0xkwwnUPAaG+DtsRRTmXyAC2bCkwwxsg66kD9qDsB2X+M6SIZinbSliPf1H
	Aixulms0GFdJNDY958pY4avLiwtvfqtmGUAvqBxGTYufrb2+HVgKeK+CoIIOQHKy1CDT6XYvMZ5qU
	LIIdeEusif7OLklau8t3EYuojCeFXwcTW6hQQ+n1rvCdOL5bFNfeF2yCux365HytyesTBVbv/l3eL
	d/x2iQyqBxTNRuh/7LzcYt0LD9Z15GdAC/D0CrIOfauqbolfdJmKwpbOC1pIsWddNmGjPWXYRNBEx
	ceB2Z3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vke3U-0000000DoTW-3SgB;
	Tue, 27 Jan 2026 08:04:08 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vke3R-0000000DoSZ-3arH;
	Tue, 27 Jan 2026 08:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=h+1+uhzaNgtaSPXCQF2LP7SSvxe54i1i/2urVLgEc/g=;
	t=1769501045; x=1770710645; b=c0cJ1y84A72yheZChnr/VfG/l9YUZk2XehTTZxXtxeA+UiF
	GnXDwM7K8KDW7vgCXw8TCvyzpJUtSLQLUsLPhazw/63oC2V3Ay2xT2XEtzp8GX+3BSpkIOx/rCtsU
	cnk/zzt3uh5HKzISXaZYjqzynLsDz/RlPz7j6LcP0+U/mGGzZS3Ds1lDqiRACHC6vJ+g/9NEZJc2o
	RLDTfHzAXzV/SIiBvuNzrzMQc+buh5B7HwrBs9IPrKwj/wwvWhH2oKOsIvVy4nwsBikzMBcGw4NLL
	bpjI89Gn6dDeMmLo+hq/V7AXofM6GvHFE54arcHt0+mLe7tPZGWO01u945ynpi1w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vke3I-00000004tNs-02NE;
	Tue, 27 Jan 2026 09:03:56 +0100
Message-ID: <b592a6c9a8f59f112b2221b9a46568769b1e9dcd.camel@sipsolutions.net>
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
Date: Tue, 27 Jan 2026 09:02:28 +0100
In-Reply-To: <aXftjdCtqnQk69ys@lore-desk> (sfid-20260126_234123_580390_07BE70DF)
References: <20260125-mac80211-emlsr-v2-0-466329d61c88@kernel.org>
	 <20260125-mac80211-emlsr-v2-1-466329d61c88@kernel.org>
	 <01e62344994a34daae0666b3873aa98e72fb5850.camel@sipsolutions.net>
	 <aXftjdCtqnQk69ys@lore-desk> (sfid-20260126_234123_580390_07BE70DF)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_000405_922872_F69D4F37 
X-CRM114-Status: GOOD (  15.82  )
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

On Mon, 2026-01-26 at 23:41 +0100, Lorenzo Bianconi wrote:
>=20
> > Per spec I'm also not sure what the MCS map should be when it's not
> > included in the frame?
>=20
> IIUC the mcs map value are supposed to be in Operation mode notification =
frame
> just for eMLMR. I think the driver should check if the bit is set in
> ieee80211_eml_params control field to verify if mcs_map_bw values are val=
id.

Yeah you're right, the MCS Map is always present if EMLMR Mode is set to
1. I thought it was also optional and then what values should you use?

Can't mac80211 validate the values?

> Reading the standard, it is not clear to me if mcs map values are suppose=
d to be
> added in the Notification frame sent by the AP. What do you think?

Hmm. I thought no, but then the language says it's present when the
EMLMR Mode is set to 1, so ... it would have to be? Strange, because
it's not really defined (well) in this direction.

OK, I guess the memcpy was right after all:

   An AP affiliated with the AP MLD that receives an EML Operating Mode
   Notification frame from a non-AP STA affiliated with the non-AP MLD
   should send an EML Operating Mode Notification frame to confirm the
   mode switch at the AP MLD to the non-AP STA with EML Control field
   set to the same value as EML Control field in the received EML
   Operating Mode Notification frame from the non-AP STA before the
   transition timeout expires.

But I think better restrict memcpy() then to just the EML Control field
and build the action header etc. directly.

johannes

