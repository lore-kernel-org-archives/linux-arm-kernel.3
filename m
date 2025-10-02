Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E6ACAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+6pTjnhj0G1rFNfA0mKZWvMUV57qGKCjvrZLZ8uin8=; b=f8Qbvf5ZwpHKjFyGRmPq3FCa9X
	zjCcnENQd+FW6ZLiTcJxAUgK/OGCMbIAxvl84lXxYanHnZCWbkFlPtfnkAWeYu2LmkhjqtRl5BxPb
	5bkuVJdJhYAi8IRqjVIYLIMXFZXkNf6lCxa+lJnF3ielFQizGSXacR3mlLnBFRM6KBUzJRR0k/PEg
	mVftUA1Y3JlRk01MU6Q4sDznbn+AYJiKAyOGcLc9ujDF1BZsUSWcitwlWwvQZ12BmYbOIBR8QeJAV
	6rBZhiuwPw+l5PZsvvgMNZjVD1MWBg4vJBVAWVLOmr80ET9s3V0fXpl8EMjsHRux9QXK/TqdgMKhS
	OFrDAWJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EFQ-00000009qNv-3DzQ;
	Thu, 02 Oct 2025 08:01:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4EFL-00000009qN1-3xU3;
	Thu, 02 Oct 2025 08:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759392060;
	bh=x+6pTjnhj0G1rFNfA0mKZWvMUV57qGKCjvrZLZ8uin8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lsn2rVQqrH027Dz9lpLK8PRq+HO1kARyxr9VRxSYN+q0YXdvTgML9Kz4Rbkvfqj46
	 5IPR2LyR+EF6YZv+THZUm9n7CE7PVfEMIZPy6MArBtcRNVsryfGiEMiAxfU/xSlRsI
	 zeClWlr8+WmuluQKvn3ZNWZHOajoh26hpe/agxLtVS+jz8546MZnYp8WqiNL7SvPfA
	 S+EPKcnRZR0g2ACG9uNYGOXVc9627Q+oDLIRApFF1qMZnrX5d37nPGq63rR2kemgNP
	 8Xo8KGL9ZSvUzaVjfgTazgrpv4hB51oMQEE9Q9JKpnbvWX5h8QyTf/KAE1VYDzpOtZ
	 E+WZw7SiIlTEg==
Received: from eldfell (unknown [194.136.85.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E68017E0154;
	Thu,  2 Oct 2025 10:00:59 +0200 (CEST)
Date: Thu, 2 Oct 2025 11:00:46 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Sebastian Wick <sebastian@sebastianwick.net>, "=?UTF-8?B?TsOtY29sYXM=?=
 F. R. A. Prado" <nfraprado@collabora.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
Message-ID: <20251002110046.7041e2c3@eldfell>
In-Reply-To: <CAPj87rMHP_np_9vtnyJ_NU4S3W09DoMRrLPps-33hTngdLyKCw@mail.gmail.com>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
	<20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
	<CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
	<CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
	<CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
	<269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
	<CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com>
	<2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
	<CAPj87rMHP_np_9vtnyJ_NU4S3W09DoMRrLPps-33hTngdLyKCw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.ZPoc3j9RATtA5mof+M5iMl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_010104_177713_0370F364 
X-CRM114-Status: GOOD (  38.71  )
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

--Sig_/.ZPoc3j9RATtA5mof+M5iMl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Sep 2025 14:20:09 +0200
Daniel Stone <daniel@fooishbar.org> wrote:

> Hi,
>=20
> On Fri, 26 Sept 2025 at 15:45, Sebastian Wick
> <sebastian@sebastianwick.net> wrote:
> > So I'm going to argue that making the properties read-only or
> > read-write is useless.
> >
> > The only case where knowing the color pipeline of the previous user
> > would be useful is if you want to re-use the framebuffer of said
> > user. Otherwise, the color pipeline and the generated framebuffer
> > have to somehow just match to produce the desired output and that
> > does not require any previous state, making the legacy properties
> > useless. =20
>=20
> I don't think it's useless; if nothing else, drm_info is a thing and
> having it work is nice.

I think that the properties of the chosen API flavor should be
readable, and properties of the not-chosen API should be hidden.

> > If we genuinely believe that this is something to be supported,
> > then my question is why the new color pipeline should not be able
> > to accurate reflect the state of the previous user, even if they
> > used the legacy props? =20
>=20
> That's reasonable. My hunch was that it would be too much code in the
> kernel to essentially just do format reinterpretation on userspace's
> behalf.

I agree with Sebastian here. For userspace like drm_info or a
compositor to inspect the current state of KMS, it must first pick the
API to use: either legacy or colorops pipelines. There is no indication
which one was programmed, and since properties always have some value,
both APIs will return something. Which one is right is unknown.

Given that colorop pipelines can and should be able to represent
everything the legacy APIs can, but the opposite is not true, it is a
safe bet to always choose colorops pipelines API. Hence, legacy API
state should always be translated to colorops pipelines API by the
kernel.

Colorops pipelines API is even safe for switching from more capable to
less capable KMS client: the less capable client can see colorops it
does not understand being used, so it will be aware that it cannot
understand the full pipeline. This can trigger a fallback, e.g. do not
animate the switch between clients.

> > The hardware was able to get into some state based on the legacy
> > props, so it will be able to get into the same state with the color
> > pipeline props; it's "just" a matter of exposing the right pipeline.
> >
> > If we are not able to accurate reflect the previous state with the
> > pipeline props, then use space will see inconsistent state between
> > the legacy and color pipeline props. Which state is the right one?
> > We cannot know. The previous user could have used either one. So
> > having the legacy props does not help because we don't know if we
> > should use them or the pipeline state.
> >
> > So, I would argue that we should *remove* the legacy props if
> > DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE is set. If the handover is
> > relevant for a driver, they should ensure the legacy props state
> > translates to the correct color pipeline state. =20
>=20
> FWIW, the usecase I can see in mind would be doing a fade-style
> transition between the old and new clients. But I don't really care
> too strongly about it to be honest; I mostly care about having
> drm_info work because it's a super-useful tool.

drm_info can be reliable, if it always uses colorops pipelines API when
available, and in that case ignores the legacy color operation
properties.

If necessary, one of the pipelines could be explicitly a model of the
old color operation properties.


Thanks,
pq

--Sig_/.ZPoc3j9RATtA5mof+M5iMl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmjeMS4ACgkQI1/ltBGq
qqftcg/7BRMuF/qIkhHoK4Tl6xS04edlgXwWtqWtHobHQ5H1RGbDIscvv9NRZ9fy
LgFwrGKArYOEKletHqfhMzcTdnV1gC507llERWKqm8JoptMTGAgBYSPKL0d+yDq7
Bh67gQGiZumSBI3uORE+PDdPoaNjm8ZiNgZoXi/0M2rWMJ/ACKpK5udCwgGoq93p
QK6ljGqjMXarFhJiB8MjX+5qPRNidO/CPdT1VNo5N+Ul9uqDoXHvIJgsljze8Cm0
6F4Qa7sUkiy2KsFOFrP7fh1DW23bdc7pSfJ04f2NwzJod1pYtA6Q3M1FqCbkmTj4
KZLxmcNhQuJ9q7X8NZdCbS4v2Z0pInK45UHn+tHPSXdigonyxGptFSbvPyQSu9m4
7PpuWcIRp03r3hrVKza64eXyaLuZog91HNAmnk9PUZ6LdFjfQxI6FEgAEWVVEpzN
73yUYJ5o+qS0ggc+Fgrydmuhj34h0xA+m6KpdqUojNykpvi5gc66FycFoPp9gK7A
2lYnZ7QO4eqoNUUfhNOqfMHo33cjZ5MUCmM3TxyDdNXlPoZRIYcZDv8NwlhJu9V/
QlvB7H4qXx5br66W98NjKobtnj/+iCh+Iogk5ZHOmdoDX7aGVFteIWojDXTXTlG5
e0bQs+SsB7WRP7uYptG6Uni5Tjo3qFs5OT4lFqMZaYUpEceuf6Y=
=NkT0
-----END PGP SIGNATURE-----

--Sig_/.ZPoc3j9RATtA5mof+M5iMl--

