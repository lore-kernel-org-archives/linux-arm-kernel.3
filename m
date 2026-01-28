Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760D4D25B48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihjH1iI5eRT7Oc/TIUd6sfBTrJzhVAf8tuRS24kh/Ac=; b=sXlZEKIbthc5UeWBMan8xt1Hun
	UHE/930aLoMTP0jhPlCCKrMXbGrMCjEuUSe4pOhgTWyVs0FJELZJIZe9Rm5jI3OjZczwUW0vhjwm5
	K+WOlbCvNBEyfqIloxOL/oQm3mbdodq/ID/ysKAGq/14ugMpruKoQcYaBstyus0Lu6xqAz7eir+Cn
	jsir6djYcIlM5mcgU5XZ/2OCvPv99KU+E66Vx9TTZwEgzSSBbQ2We4sxjmsfJcedp9qAyDEWz2CuJ
	8RzBLmpvHOtoxZzQjhjAHLn0A0UZ0kDGFFPR6jxScMLjOaFiWgOkbKcBHQ7J5/N9groWCwrN7X/i6
	eVb6D2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl573-0000000G1Vn-2iXK;
	Wed, 28 Jan 2026 12:57:37 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl570-0000000G1Uq-0VFC;
	Wed, 28 Jan 2026 12:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ihjH1iI5eRT7Oc/TIUd6sfBTrJzhVAf8tuRS24kh/Ac=;
	t=1769605054; x=1770814654; b=O2KsPCzuaU4tadmlAV+1IMQcdJHclp5HPF/whUvCPwDp3hg
	4bqAan0jy4cAuL3/zvNassssouvneRzo5KvXWxpkxCTLjPWBSQC17mR5d58n9IWJ2zzIXRzVlnsl0
	0AoBs+KaWqgU1ECmq2uQU5LW+4R7fhRXJPU6Qzbtb0ZfD8rcSdsULkOyFL93BzIAskvZ8D/qI2dKN
	+W9RFbIbMB9BQF0vcJ7Oql/aR5KrUgKy+nxWYv66RS+KyUIgkItp3uzgUNDb44uCKEZCpEr1XQXhn
	yg5pi+klHCGMeW1mD4G1WP+X5XDEoDcJ3UPQ2VmYVgq2aZi3GRxPRU/em9dMetEg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vl56q-00000005qTn-2hpz;
	Wed, 28 Jan 2026 13:57:24 +0100
Message-ID: <a2013bbb6988d53be3f6722cd8ff838dbd4d7f1c.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v3] wifi: mac80211: Add eMLSR/eMLMR action
 frame parsing support
From: Johannes Berg <johannes@sipsolutions.net>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, 	linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>, Shayne Chen	 <shayne.chen@mediatek.com>,
 Christian Marangi <ansuelsmth@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 28 Jan 2026 13:57:23 +0100
In-Reply-To: <aXoHdmjLKB-g54ie@lore-desk> (sfid-20260128_135628_166382_5E70C1A1)
References: <20260128-mac80211-emlsr-v3-1-473b0c1d9cc4@kernel.org>
	 <69d939aae0abecfdd011219e00076542c6e1abb1.camel@sipsolutions.net>
	 <aXoHdmjLKB-g54ie@lore-desk> (sfid-20260128_135628_166382_5E70C1A1)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_045734_154384_D8F83B34 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2026-01-28 at 13:56 +0100, Lorenzo Bianconi wrote:
> >=20
> > > +	if (drv_set_eml_op_mode(sdata, &sta->sta, &eml_params))
> > > +		return;
> > > +
> > > +	ieee80211_send_eml_op_mode_notif(sdata, mgmt, opt_len);
> >=20
> > IMHO it would make more sense to pass "ptr, opt_len" rather than "mgmt,
> > opt_len", since that's just what gets copied and then the callee doesn'=
t
> > need to dig it out.
>=20
> But I guess we need mgmt pointer to set even other fields (e.g. dst-addr,
> dialog_token, ecc.).

Yeah, good point, passing them all individually isn't great either.

johannes

