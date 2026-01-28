Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEFAD25B48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRJzba95YNbQZtqj//pbDPHC/663xqJuFvXEYYPTvLA=; b=Bgbh2Llaiuub0sNLxpcLREqaR8
	GieDGSHKo1VbZvFYFyKtqa0P1z3JY9DYmJbi8azJx5weCpDVhjaHiAwMp7GIptusMTs8y+oXEUkeD
	aKNUPx3j02JNn0SrseLIGfVt1GCqU1ZgCuVPWVp78ZPLIhgDSlCXikQkuPSfK35eHPnjOvJTKCF6L
	wv+DuqLVJKw2jEtSI/L7msVvMzIni+/hJugw08eOd2ASilKOmuXGtGH991nFYFZQEnWCED8+NKmpe
	SWm44q7PPju30+fEA8TjeZX/4MnIkF+L159qYyzHqei6gPk669mmKbsaI7ch+jeZX8j1NBZsEUUPC
	4A1HEcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl43q-0000000FxPD-1qsJ;
	Wed, 28 Jan 2026 11:50:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl43o-0000000FxOA-0PUf;
	Wed, 28 Jan 2026 11:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=iRJzba95YNbQZtqj//pbDPHC/663xqJuFvXEYYPTvLA=;
	t=1769601011; x=1770810611; b=J9jRZfMvuSZN2nLySUcUiZCcvFq2l9VxtjjkVI0vE63bV0M
	gAt9PFAPA1QXwS2go+Vfy8uxEaOkEOUVWDxUzPcbYudbbYzN+fKJW38wFA2kiplGXcnPnFrmAoDur
	P7nsU1v1SDV5PhEmoEAleUEkKpnlme9rRERmv0aaIX5DqrlCQa4oXVs93lscbdWnU2a0TOoQZW1HJ
	pZYY5Tyz1v7wtqB1DqSoUP2tifFVTlTbnybitiEbGduHyo2sYGVCvJbB4P/6K7p71lu83PGMyp+qa
	4fM0cDiD9qJtHj/o6z4dROcN4MLXcrxv6/VW51H5GNhe5M8kM9NqXD6zoM7RD8DQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vl43e-00000005oNF-3cT0;
	Wed, 28 Jan 2026 12:50:03 +0100
Message-ID: <69d939aae0abecfdd011219e00076542c6e1abb1.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v3] wifi: mac80211: Add eMLSR/eMLMR action
 frame parsing support
From: Johannes Berg <johannes@sipsolutions.net>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, Shayne
 Chen	 <shayne.chen@mediatek.com>, Christian Marangi <ansuelsmth@gmail.com>,
 	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 28 Jan 2026 12:50:01 +0100
In-Reply-To: <20260128-mac80211-emlsr-v3-1-473b0c1d9cc4@kernel.org> (sfid-20260128_121810_555043_35237ACC)
References: <20260128-mac80211-emlsr-v3-1-473b0c1d9cc4@kernel.org>
	 (sfid-20260128_121810_555043_35237ACC)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_035012_158509_7C332541 
X-CRM114-Status: GOOD (  10.01  )
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

I probably missed this the last time already:

> +	if ((control & IEEE80211_EML_CTRL_EMLSR_MODE) ||
> +	    (control & IEEE80211_EML_CTRL_EMLMR_MODE)) {
> +		eml_params.link_bitmap =3D get_unaligned_le16(ptr);
> +		if (eml_params.link_bitmap &&

Surely 0 is an invalid bitmap? To disable it, you send a frame without
IEEE80211_EML_CTRL_EMLSR_MODE or IEEE80211_EML_CTRL_EMLMR_MODE set, so I
don't see how an empty bitmap would be valid?

> +		    !(eml_params.link_bitmap & sdata->vif.active_links))

That's the wrong check, I think? It only checks that you have any
overlap, but we need all bits to be valid, i.e. only

		(link_bitmap & active_links) =3D=3D link_bitmap

is valid, no?

> +			return;
> +	}
> +
> +	if (drv_set_eml_op_mode(sdata, &sta->sta, &eml_params))
> +		return;
> +
> +	ieee80211_send_eml_op_mode_notif(sdata, mgmt, opt_len);

IMHO it would make more sense to pass "ptr, opt_len" rather than "mgmt,
opt_len", since that's just what gets copied and then the callee doesn't
need to dig it out.

johannes

