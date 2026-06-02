Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB504CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVz6SYKqYy1ykUS1fwQECnfl6EKiONJTsloqPqT0xyw=; b=o/bSLqnBpo9Rff1iHQZfTFVuz0
	lXX8+JvJ4U9MdnWyWVMl44lhI7ts+rWQtqjuzMnyWYMTds5xh4ASOcE3lasQM8la0f+2W/ms9NFWy
	6CppOJtb/CsjVtadw1g5DHWBRq74hW/ljN2USCplvKrGNkeKZOg46gPctCc/1xRQxNONyjTpJnUYu
	5jg78/BBJxqXTdnqcw7CyJxoFVv7HkL7gMjNL9PAfenKM7E1h0hhQ92z1bYYMYifBgpcTfg6VZTgg
	9m/wZ32+ZTZuCs06qJsgcOfYrxmUSm4s+pAPhNWB/i68TegbN5MkD8JTX7sF6ZauQ9tClKladdpu1
	hbEiT+kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIqd-0000000CPCu-20ib;
	Tue, 02 Jun 2026 06:43:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIqb-0000000CPCT-0NQP;
	Tue, 02 Jun 2026 06:43:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CFAB7435F5;
	Tue,  2 Jun 2026 06:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D7F1F00893;
	Tue,  2 Jun 2026 06:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780382611;
	bh=oVz6SYKqYy1ykUS1fwQECnfl6EKiONJTsloqPqT0xyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HMrt8VQ8uviRax8hfIijft+UtVgXap1KfnuLZUk9hKw3gmtJtZrF+2F0P9L2zwv6B
	 OYVkXHe5ymymdtUGoHD8xqvbGWUxJc1bOI2lCCXUDxKLiejmYCSzKI0APvGYSdlZFv
	 Gbj8qld+TsJLHaPOFGx3DCjpiIQKTEHVGWfqTgnLfquLyY27gmmakOp3nepTSoELKp
	 ieziZVdbzoSz6bS3HS+dvaaJtnHGWxVjP1KuVUXiEvu7zmmL961jRIMW7GvKczDLnx
	 gzUFgY6oQ7aHFoPKCFs7zDfZo967XXwqX6FJBwkBxaKAwLNlY8Y+LrEwPR1dhXw0E+
	 UZQpNVNw7uMpQ==
Date: Tue, 2 Jun 2026 08:43:27 +0200
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Roy Luo <roychl666@gmail.com>
Cc: Ryder Lee <Ryder.Lee@mediatek.com>,
	Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>, Roy-CH Luo <Roy-CH.Luo@mediatek.com>,
	Chui-hao Chiu =?utf-8?B?KOmCseWegua1qSk=?= <Chui-hao.Chiu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	Sean Wang <Sean.Wang@mediatek.com>,
	Bo Jiao =?utf-8?B?KOeEpuazoik=?= <Bo.Jiao@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: fix reading zeroed
 info->control.flags after mt76_tx_status_skb_add()
Message-ID: <ah57j_SwdVZTc0GR@lore-rh-laptop>
References: <20260531-mt76_tx_status_skb_add-overwrite-fix-v2-1-b73c4b4a9798@kernel.org>
 <ee0e584cb2ad1b536d327eb89342d1646fa96570.camel@mediatek.com>
 <ahwla_obwnwr2cZo@lore-desk>
 <44c54ed4da0d294c567b3b0ad750f082a6f1be9f.camel@mediatek.com>
 <ahwzwHDF7fT9t7hP@lore-desk>
 <7f02be7c4f919413718a0218b3792d4b0a222ca3.camel@mediatek.com>
 <ah0fGek5y8Nha0kd@lore-rh-laptop>
 <CAHoxoj+N3AtJgFD8vGP+uDpj6anKMgPBtZGejLDgAz0ZyisSHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vyatZ5JMfhikfHCS"
Content-Disposition: inline
In-Reply-To: <CAHoxoj+N3AtJgFD8vGP+uDpj6anKMgPBtZGejLDgAz0ZyisSHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_234333_193607_08675C3C 
X-CRM114-Status: GOOD (  26.39  )
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


--vyatZ5JMfhikfHCS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 01, Roy Luo wrote:
> > > I mean the link_id is only corresponds to one specific flags bit of
> > > mac80211_tx_control_flags. But there are other bits that aren't
> > > handled. Wouldn't u32 flags make it more cleaner?
> >
> > Yes, I got your point, but my concern is if we need to sync link_id bet=
ween
> > mt7996_tx_prepare_skb() and mt7996_mac_write_txwi(). If so, I guess it =
is
> > much better to pass link_id explicitly to mt7996_mac_write_txwi() since=
 it
> > does not just depended on mac80211_tx_control_flags and I think we shou=
ld
> > not duplicate the logic in mt7996_mac_write_txwi(). Got my point?
> > If in the future (not required now) we need to pass mac80211_tx_control=
_flags
> > to mt7996_mac_write_txwi(), we will do it easily.
> >
> > Regards,
> > Lorenzo
> >
> > >
> > > Ryder
> > >
> > >
>=20
> Lorenzo,

Hi Roy,

>=20
> I got your point and IIUC the problem being addressed in this patch is th=
at
> the link id assignment has unnecessary duplicated logic across different
> places. However, the commit tile "fix reading zeroed info->control.flags"
> seems a bit misleading to me - this patch does not fully address the prob=
lem
> where the info->control.flags is cleared by memset in tx path when its
> value might still be referenced, the field is still zeroed after
> mt76_tx_status_skb_add() and whoever reads it afterward would get
> incorrect value. With this patch, we avoid using the incorrect value for
> link id, but the root cause remains.

This patch is actually fixing both of the issues since now do not have any
leftover access to info->control.flags after running mt76_tx_status_skb_add=
()
in the mt7996 tx path and it is not required (according to the current mt79=
96
codebase) to pass the flags cached value to mt7996_mac_write_txwi(). Howeve=
r,
if in the future this will be necessary, I am completely fine with that.

Regards,
Lorenzo

>=20
> The issue that Ryder tries to address in
> https://lore.kernel.org/all/5ecac6a9b7d29526e8438dea105b58f5487c93aa.1778=
521232.git.ryder.lee@mediatek.com/
> concerns the overlapping use of info->control and info->status in tx path,
> and it remains valid even with this link id fix applied. We have to be
> cautious when dealing with info->control in mt7996 tx path until the issue
> is fully resolved.
>=20
> Regards,
> Roy

--vyatZ5JMfhikfHCS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCah57jAAKCRA6cBh0uS2t
rAmFAQDk/bGX6PjAX+FifRA1xIjx6t2hREKHPBDgAfNVJn2rXAEA+RKD4cI97xcJ
rWdhiY7wIkB+7003MrfHC78YlcbvXgM=
=CO5r
-----END PGP SIGNATURE-----

--vyatZ5JMfhikfHCS--

