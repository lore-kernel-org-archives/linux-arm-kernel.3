Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B99C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKvncxxjNvP8s9qJUZ7ZaBggAfFkch++xpbcsCwtXAk=; b=QvMuv8VDZ4AetI3dwYZ9gbtVS+
	8GEM3WTG2o9HXmK3expsbTtvl1KmOovU5P/vAYr4/AaqiANXXKlOExz5p2eSfDsF9w/u7VpI9fVh/
	ju+aWW0WldcC8oI4umVELn6smqDUJYiK0d/TWC0Egu6geVtyDihiSyhAYxl/bIMWd6l0tIA55ZPzy
	oLde0AteF8WQKScDLKAvx/GnTzBcE5OcTt96DrvTEHaVal+Qk6PbHzq/Pm+1yPZCDBfIsWbhifhFR
	M+8XyFXsNYxr3QkQfRcqtE1T4kD2Y6im0ezIFsBxv9d3rF2z/ckB33jD3qOde73sVy5SLyPixz2LP
	Qw/pC5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAtb-00000009aI7-3oZs;
	Tue, 21 Jul 2026 13:52:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAtY-00000009aHU-2WiE;
	Tue, 21 Jul 2026 13:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784641944;
	bh=NKvncxxjNvP8s9qJUZ7ZaBggAfFkch++xpbcsCwtXAk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=L+/3uuQQ8QfCezdIBcVinSmPPCz0yqpEpP/Yt3GEokyRDcgcBLRXh34/5dSeLic0s
	 tannY+pHKtCZOGwEkbkXxLfS9Xi6YEQUsvG7eOAckt/3bGLFeDpFpKDx0KXVTKwzk1
	 abRn0NctIDYBUz5bk7COunuGF4PtfUGwc0ARd1YHJhRFQdHl/rxZTBWClEdvwWr1cB
	 +uu6yYdcw8SdmTfVso+PsxU8WfiC8njIXgxHWQg9cJ2E3JtYXRynDnXrdZ7GuDXxwX
	 j6YN6rpXcR4z9aTX2Wsv4Y5K3YvaJyBbAcoeXYqBkH79fS4bFpPFN5jBo7Nbn9QxuZ
	 RtWYeqJEufYMQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28B9517E0177;
	Tue, 21 Jul 2026 15:52:23 +0200 (CEST)
Message-ID: <da269781a5e4643745635b51c8ca95c22a7a5baf.camel@collabora.com>
Subject: Re: [PATCH v2] media: mtk-jpeg: drain hardware completion before
 freeing context
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Sven
 =?ISO-8859-1?Q?P=FCschel?=	 <s.pueschel@pengutronix.de>
Cc: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  Hans
 Verkuil <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Tue, 21 Jul 2026 09:52:21 -0400
In-Reply-To: <CANUHTR-0-_zOegBf74bmAFqLgUUgjzqz5B7ydO9+Zyj=XSJ2CA@mail.gmail.com>
References: <20260718112448.3289122-1-lgs201920130244@gmail.com>
	 <f60f255b81db1db310276a1acdca412f6070a28b.camel@collabora.com>
	 <CANUHTR-0-_zOegBf74bmAFqLgUUgjzqz5B7ydO9+Zyj=XSJ2CA@mail.gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-M2rH9JyOzH9+/KPhomek"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_065228_797179_B52B51CA 
X-CRM114-Status: GOOD (  14.44  )
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


--=-M2rH9JyOzH9+/KPhomek
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 21 juillet 2026 =C3=A0 17:15 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> Would you prefer a correctness-first change that moves job_finish() to
> the hardware completion paths, accepting that serialization, or is
> there an existing v4l2-m2m mechanism for representing several
> concurrent hardware jobs that I have missed?

This one predates me as a maintainer, so I'm a bit in catchup mode. I think=
 your
work shows how much problems/complexity this method introduce. I'm currentl=
y
tracking two proposal, an RKVDEC and an RGA2 proposal. I think the second m=
ethod
is worth looking into. The first one might have had the same issue as this =
one,
as it called job_finish() immediatly in device_run() (which is equivalent o=
f
doing it in a worker like MTK codecs do in general**.=20

https://lore.kernel.org/all/20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pe=
ngutronix.de/

And you'll find the patch:

[PATCH 05/17] media: v4l2-mem2mem: support running multiple jobs in paralle=
l

That adds parallel job in the mem2mem, so that you can have a single m2m co=
ntext
for multiple cores, handling multiple jobs, and the tear down is happening =
on
all cores. Now, I'm not forcing you to do that path, but I think its a bett=
er
solution long term, as open coding custom tear down is error prone. Let me =
know
your thought, of course I'd like if you could work with Sven on a common
solution.

Nicolas


** Most of MTK codecs worker are not needed, since the m2m framework alread=
y has
a worker and is re-entrent safe for triggering the next job. But MTK code u=
ses a
lot of condition wait, turning async operation into synchronous, and once m=
ulti-
core, it just break apart.

--=-M2rH9JyOzH9+/KPhomek
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCal95lQAKCRDZQZRRKWBy
9N7TAQCbjR0A6T7HbDRxSk17zQqfY5E7SUwkbbXmxf5iwXhsYgD/X514Y0Jl9eql
56dJ1F+qySkpOeItyxeg3Oz4q2gi6wk=
=2P1k
-----END PGP SIGNATURE-----

--=-M2rH9JyOzH9+/KPhomek--

