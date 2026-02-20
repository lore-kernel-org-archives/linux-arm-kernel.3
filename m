Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C965AC55164
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JHCDgsaPyKfVh78aF3xe4hH753iI0GW0P5ZJDCxIqo=; b=L8q6BvziKlnEq0AtSs4qOtNCyq
	peCWXWW3c3snZuh0GbNRLzxQxAegYQfF6r2s9+M6CABr3EEf8BkpXYIg/sfFoc+MSNHeC/m8U4Zi2
	hitI4G4AMLpWbRBIV1ybV/vmGScBF+QY2pcj/ZVSINROZO/jl2XgkFHGVal3mx6+AgJR6jEBGM205
	4TEQDFfh89a9eZeeqIO66LDvGBfHKBFTgaI8AsY8WN/x4J7guio8zl6TF8HORU1vN+H+nsbl5W/NI
	BWY9KAfCrUVb6VRmIqDJzda/AJJEYjA4H4SjvtG1cyOHoQ4dp6ihWsKsctt09dNxXwkXqLAZQjetd
	RxWhAGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMO2-0000000DS8d-2z8D;
	Fri, 20 Feb 2026 09:01:22 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMO0-0000000DS8G-0YDp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 09:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9JHCDgsaPyKfVh78aF3xe4hH753iI0GW0P5ZJDCxIqo=;
	t=1771578080; x=1772787680; b=RKZaEKb8ML9btFUvqCEUNrGu8d60a1ea4EJ/MNRG/lS4flB
	HSi718ZeC/yXJriM7WfZV+bTVcSHH+0Zxd9bWeSckVMFtG2nbA8GEKTslEBvj2TshiT5HW8E+UXEj
	PHTZawexhPrCUho2K14LFmMtKKBLI6OIwclF06aG8cY3SijBTLE4rt4FjCXkKfsxZVzxv4hlYk7V3
	p89F9pwN5BBvfyLUqnOElvmr3aFOnDAt65zxQP+GvkXTaqACWRtebArUIwqD1ll3v91AJZFDqahpY
	lRkDFskebtNUfm2CvY9Ev8UwLtgT/EI8NaLnUf8ieppKqzHy8X2L+5tpgLfckaHw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vtMNv-0000000E3s8-1FlF;
	Fri, 20 Feb 2026 10:01:15 +0100
Message-ID: <f7091e036f1694d945e728aa58cb7d55ac07f3e1.camel@sipsolutions.net>
Subject: Re: [PATCH 14/15] wifi: mac80211: Use AES-CMAC library in
 ieee80211_aes_cmac()
From: Johannes Berg <johannes@sipsolutions.net>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Ard
 Biesheuvel	 <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu	 <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org, 	linux-cifs@vger.kernel.org,
 linux-wireless@vger.kernel.org
Date: Fri, 20 Feb 2026 10:01:14 +0100
In-Reply-To: <20260219220211.GB32578@quark>
References: <20260218213501.136844-1-ebiggers@kernel.org>
	 <20260218213501.136844-15-ebiggers@kernel.org>
	 <c3b53ea083fa26c863c6a954d13bbd2ef91e1732.camel@sipsolutions.net>
	 <20260219220211.GB32578@quark>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_010120_169380_BC948D31 
X-CRM114-Status: GOOD (  18.60  )
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

On Thu, 2026-02-19 at 14:02 -0800, Eric Biggers wrote:
> > Looks good to me in principle, I suppose we should test it? :)
>=20
> Yes, I don't expect any issues, but testing of this patch would be
> appreciated.  I don't know how to test every kernel subsystem.

Done, works fine. I checked FILS (which is against hostapd userspace
implementation) and validated the MME MIC against wlantest.

> > > +		err =3D aes_cmac_preparekey(&key->u.aes_cmac.key, key_data,
> > > +					  key_len);
> > > +		if (err) {
> > >  			kfree(key);
> > >  			return ERR_PTR(err);
> > >  		}
> >=20
> > Pretty sure that can't fail, per the documentation for
> > aes_prepareenckey() and then aes_cmac_preparekey(), but it doesn't
> > really matter. We can only get here with a key with size checked by
> > cfg80211_validate_key_settings() already.
>=20
> aes_cmac_preparekey() indeed always succeeds when passed a valid key
> length, as documented in its kerneldoc.  But in this case I recommend
> just checking the error code anyway, since ieee80211_key_alloc() can
> already fail for other reasons (i.e., it needs the ability to report
> errors anyway) and the key length isn't a compile-time constant here.

Right, sure.

> > Since you're probably going to send it through the crypto tree:
> >=20
> > Acked-by: Johannes Berg <johannes@sipsolutions.net>
>=20
> For library conversions like this I've usually been taking the library
> itself through libcrypto-next, then sending the subsystem conversions
> afterwards for subsystem maintainers to take in the next release.  But
> I'd also be glad to just take this alongside the library itself.

OK, whichever you prefer. Feel free to take it, this code did change
recently for some additional error checking, but it otherwise almost
never changes, so there shouldn't be conflicts.

johannes

