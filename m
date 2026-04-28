Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE5CFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 19:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKGemeoj8FnEHGypWm9bjvOs0Vmx5PjJmv/Er0nGsIw=; b=kJgz0lXMteodfx3q9DxWdKZf+V
	YaNqGmJTKVF2MKEcLo2bFEHEVs+62PHEkAZHAcrkqaf0XQ7BxorbkHjCaUQ5xCsDebwRoXWQaNlbs
	Tp6u2KXQb2sqGA8cMTBpvfUBQla1Z8PMnEbU0TLU+Bu6Hvn+1Nr1yjZjwuOu7jwY9ZKXS04qcHO8f
	Uz74os67/SZpDHlLghpsuxceic7vzQ5DqmAWsaOZiXJRDq6n2MWz4yPMOCykYTWqrbuTy85MODKFn
	1vc6N6e0AerTusR9JekzOJgbDfrNJgPErU6golOgMoA7Z4DWN5CnuAd/jExseQ/Cv0ut+fs02RhiX
	SR+qbcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHo9q-000000029rG-1wui;
	Tue, 28 Apr 2026 19:31:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHo9o-000000029qj-2D0n;
	Tue, 28 Apr 2026 19:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777404701;
	bh=FjrpkL+FObtySlCwVClZ8JTKkFGMLg7sD9qeKYXMgR0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jRc5EduwOJg5xjGnf3btSiF85b2zrulZSaanq6MbdLlQd5JM/cCV+Ig1VO/nYADdA
	 usFsBC5W3U8+47HD0Vv7/FxZctRcR+1lBvtKjzZbGVdLCPj3/cVpDV+Q4pMHzRWIvy
	 VZ2Jmxf2JIZ/mjU3wzZ1KFlA+6QABCKybrBuxtF+gNpyl8dP4hzriy2hKfcyc2QrBh
	 hroE96VgmJ7+XXBNnGOdWPR15eopVnoRzqZso92/jZJ4l2k1z9iqcpkNK75q30eg3/
	 zkCaXN2LkJPUyPudyNCUXwVbnH6qiFVTSnQnQZpGPLFNEF9Qu25vfgdH2RIC8YcRoQ
	 PtwsxfrYjyymg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3BDE17E1428;
	Tue, 28 Apr 2026 21:31:38 +0200 (CEST)
Message-ID: <1b5b03df1f059f10cc990dcc23280cba429e2b60.camel@collabora.com>
Subject: Re: [PATCH 03/11] media: Add tgid and fd fields in v4l2_fh struct
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt	 <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi	 <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, 	kernel@collabora.com
Date: Tue, 28 Apr 2026 15:31:37 -0400
In-Reply-To: <20260212162328.192217-4-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-4-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-xFHKxA+aWyg4BdbVGHsJ"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_123144_771949_E1831042 
X-CRM114-Status: GOOD (  25.18  )
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


--=-xFHKxA+aWyg4BdbVGHsJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> These fields will be used in traces to help userspace tracing tools
> identify streams.
>=20
> The tgid field will keep the PID of the process that opened the video
> file.
> That is needed because trace calls can happen in IRQs, for which there is
> no current PID.
>=20
> The fd field helps identify the context in case the same process opens th=
e
> video device multiple times.
> Note that the fd field is set in the __video_do_ioctl() function.
> That is because the file descriptor has not been allocated yet when
> v4l2_open() is called.

Unless someone have a better idea with this last part (in this case please
reply):

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-fh.c=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/v4l2-core/v4l2-ioctl.c | 17 +++++++++++++++++
> =C2=A0include/media/v4l2-fh.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> =C2=A03 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/=
v4l2-
> fh.c
> index df3ba9d4674b..86e8223b46cb 100644
> --- a/drivers/media/v4l2-core/v4l2-fh.c
> +++ b/drivers/media/v4l2-core/v4l2-fh.c
> @@ -37,6 +37,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_devi=
ce
> *vdev)
> =C2=A0	INIT_LIST_HEAD(&fh->available);
> =C2=A0	INIT_LIST_HEAD(&fh->subscribed);
> =C2=A0	fh->sequence =3D -1;
> +	fh->tgid =3D current->tgid;
> =C2=A0	mutex_init(&fh->subscribe_lock);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fh_init);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> core/v4l2-ioctl.c
> index 37d33d4a363d..a3b6df0571d6 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -9,6 +9,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/compat.h>
> +#include <linux/fdtable.h>
> =C2=A0#include <linux/mm.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/slab.h>
> @@ -3061,6 +3062,16 @@ void v4l_printk_ioctl(const char *prefix, unsigned=
 int
> cmd)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(v4l_printk_ioctl);
> =C2=A0
> +static int _file_iterate(const void *priv, struct file *filp, unsigned i=
nt
> fd)
> +{
> +	const struct file *fh_filp =3D priv;
> +
> +	if (fh_filp =3D=3D filp)
> +		return fd;
> +
> +	return 0;
> +}
> +
> =C2=A0static long __video_do_ioctl(struct file *file,
> =C2=A0		unsigned int cmd, void *arg)
> =C2=A0{
> @@ -3081,6 +3092,12 @@ static long __video_do_ioctl(struct file *file,
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	if (unlikely(!vfh->fd)) {
> +		vfh->fd =3D iterate_fd(current->files, 0, _file_iterate, file);
> +		if (!vfh->fd)
> +			vfh->fd =3D -1;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * We need to serialize streamon/off with queueing new requests.
> =C2=A0	 * These ioctls may trigger the cancellation of a streaming
> diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
> index aad4b3689d7e..4ef4e58ab8d1 100644
> --- a/include/media/v4l2-fh.h
> +++ b/include/media/v4l2-fh.h
> @@ -28,6 +28,8 @@ struct v4l2_ctrl_handler;
> =C2=A0 * @vdev: pointer to &struct video_device
> =C2=A0 * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
> =C2=A0 * @prio: priority of the file handler, as defined by &enum v4l2_pr=
iority
> + * @tgid: process id that initialized the v4l2_fh
> + * @fd: file descriptor associated to this v4l2_fh for the process id in=
 tgid
> =C2=A0 *
> =C2=A0 * @wait: event' s wait queue
> =C2=A0 * @subscribe_lock: serialise changes to the subscribed list; guara=
ntee that
> @@ -44,6 +46,8 @@ struct v4l2_fh {
> =C2=A0	struct video_device	*vdev;
> =C2=A0	struct v4l2_ctrl_handler *ctrl_handler;
> =C2=A0	enum v4l2_priority	prio;
> +	uint32_t		tgid;
> +	int			fd;
> =C2=A0
> =C2=A0	/* Events */
> =C2=A0	wait_queue_head_t	wait;

--=-xFHKxA+aWyg4BdbVGHsJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafELGQAKCRDZQZRRKWBy
9AKXAP4kExFAk5kv4T+O4pPqDHiq2EYtpPeu4d74JPDJHJgK1wEAhL3jwZnj2C09
fdBkWR/kS74Jwd1c58A6367FMwwOggY=
=4DUH
-----END PGP SIGNATURE-----

--=-xFHKxA+aWyg4BdbVGHsJ--

