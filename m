Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2045CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RuQEgRxHcjCSAwP9bDowwwjk2VbVjxN07stQ0dNve5k=; b=kXOTtSzAZ3othmNW0Djsp3VXkJ
	f6FVbqDQ2x8r51CCtjlvSKcanhVxzxaXb93+1yp2ogV4QsFKVI/1PasrwuercJSkBpgNK7qK9GN3m
	DdbaAYqzHzIx03z5Lwef1tlETYLhBQ0dx4VIdolVy6a0w+3PP7E7vRvBwyTMEtmWiLjX12pwBbrIF
	oWlpMRjjKsdMVAm2SMavvqYy3PWVbVpMjy6BBPIUPbo8NWdDRKNMDecFQFIA8RZc6xT8fpA1Oy1X5
	yts1kd1VNCq7v/JU6G05urkmAFtlP5PTATxCt1QO177OXVsnR+wdlmI1Co+pk8fg+bXTJnZsDBuqE
	Xn45yQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolmU-0000000EPq6-4C1j;
	Wed, 20 Aug 2025 16:35:23 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokD3-0000000E9pT-2Yx3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:54:43 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E174C240028
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 16:54:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1755701675; bh=RuQEgRxHcjCSAwP9bDowwwjk2VbVjxN07stQ0dNve5k=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=k/UopcBBT/aZjxVUhU/Vl6bkhobYNTOs0CA/eX5BwZMVlXnhQemGZYdcsX/yRTj70
	 evwvbtbjB02Ed8DOkSVcqqmIKWPiW3QgL44JL0RG4mn1Q7F21+PS7CGrvVLxyzPmi5
	 pfeRNpgJFTFKigNq0BHJxk0hFA5lyzxdfLR2DPpAwhbf48lanbAQrkU4oTvi/WWh/8
	 IYooTtErPW5L9j4ktoxeGX0y/xPPaeLa5sWzAzHTL01+MBqbUeG754+Zfxzofqn6Wd
	 uPhN3owEWQR/6AYYWZ7RMSFCtSl9B2+NUd8ig2wIpViCniOXxvwo2owBS9W49sfnIW
	 eU4w0laXwMenw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4c6Txh6q4Pz9rxQ;
	Wed, 20 Aug 2025 16:54:32 +0200 (CEST)
Message-ID: <af64e20ba242d4742f650057254029257a40ae79.camel@posteo.de>
Subject: Re: [PATCH] media: nxp: imx8-isi: check return value of
 media_pad_remote_pad_first()
From: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 20 Aug 2025 14:54:35 +0000
In-Reply-To: <20250820140135.GA6190@pendragon.ideasonboard.com>
References: <20250205172957.182362-1-martink@posteo.de>
	 <1f4b4e707762c0926c0acece18cb9cc3ecc242bc.camel@posteo.de>
	 <20250820140135.GA6190@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_075441_928682_992C60B3 
X-CRM114-Status: GOOD (  16.45  )
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

Am Mittwoch, dem 20.08.2025 um 17:01 +0300 schrieb Laurent Pinchart:
> Hi Martin,
>=20
> On Thu, Feb 06, 2025 at 08:49:37AM +0000, Martin Kepplinger wrote:
> > Am Mittwoch, dem 05.02.2025 um 17:29 +0000 schrieb Martin
> > Kepplinger-
> > Novakovi=C4=87:
> > > media_pad_remote_pad_first() return NULL if "no enabled link has
> > > been
> > > found".
> > > Check for that.
> > >=20
> > > backstory
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > While trying to get a (Y10 grey) sensor working on imx8mp
> > > (v6.12.12
> > > now and
> > > I know the hardware works on an ancient nxp-kernel),
> > > I tried to enable the sensor link, set formats and stream:
> >=20
> > btw, that's roughly the
> > driver:=C2=A0
> > https://github.com/VC-MIPI-modules/vc_mipi_nxp/tree/master/src
> > that might need additions to with recent mainline kernels. Will the
> > sensor be the reason for the link not being found here?
>=20
> I've submitted
> https://lore.kernel.org/linux-media/20250820140021.8026-1-laurent.pinchar=
t@ideasonboard.com
> ,
> which should fix this issue in a more generic way.
>=20


Hi, thank you. As posted over there, this indeed fixes the crash
itself.

P.S.:
Not that you should care :) But as for my specific "vision components"
sensor I want to use here, where this rpi-driver exists:
https://github.com/VC-MIPI-modules/vc_mipi_raspi/blob/main/src/vc_mipi_came=
ra/vc_mipi_camera.c
a script like

media-ctl -d 1 --links "'vc_mipi_camera 3-001a':0->'csis-
32e50000.csi':0[1]"

# format settings for mipi rx and ISI
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"vc_mipi_camera 3-
001a":0[fmt:Y10_1X10/2592x1944 field:none]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"csis-
32e50000.csi":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2
'"crossbar":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2
'"mxc_isi.0":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'

v4l2-ctl -d /dev/video2 --set-fmt-
video=3Dwidth=3D2592,height=3D1944,pixelformat=3D'Y10 '
v4l2-ctl --verbose --device=3D/dev/video2 --stream-mmap --stream-count=3D10


still fails with


[   34.642252] vc_mipi_camera 3-001a: vc_core_set_format(): Set format:
0x200a (Y10_1X10)
[   34.650227] vc_mipi_camera 3-001a: vc_core_try_format(): Try format
0x200a (Y10_1X10, format: 0x2b)
[   34.659284] vc_mipi_camera 3-001a: vc_core_try_format(): Checking
mode 0 (format: 0x2b)
[   34.667295] vc_mipi_camera 3-001a: vc_core_calculate_max_exposure():
period_1H_ns: 7407, vmax.max: 1048575, vmax.min: 9
[   34.678083] vc_mipi_camera 3-001a: vc_core_get_optimized_vmax():
vmax_def: 4500, v_factor: 0, height: 1944/1944
[   34.688178] vc_mipi_camera 3-001a:
vc_core_calculate_max_frame_rate(): period_1H_ns: 7407, vmax:
4500/4500, max_frame_rate: 30002
[   34.699833] vc_mipi_camera 3-001a: vc_core_update_controls():
num_lanes: 2, format 43, exposure.max: 7766728 us, framerate.max: 30002
mHz
[   34.712184] vc_mipi_camera 3-001a: vc_core_set_frame(): Set frame
(left: 0, top: 0, width: 2592, height: 1944)
[   34.722208] vc_mipi_camera 3-001a: vc_core_calculate_max_exposure():
period_1H_ns: 7407, vmax.max: 1048575, vmax.min: 9
[   34.733000] vc_mipi_camera 3-001a: vc_core_get_optimized_vmax():
vmax_def: 4500, v_factor: 0, height: 1944/1944
[   34.743112] vc_mipi_camera 3-001a:
vc_core_calculate_max_frame_rate(): period_1H_ns: 7407, vmax:
4500/4500, max_frame_rate: 30002
[   34.754768] vc_mipi_camera 3-001a: vc_core_update_controls():
num_lanes: 2, format 43, exposure.max: 7766728 us, framerate.max: 30002
mHz
VIDIOC_QUERYCAP: ok
		VIDIOC_REQBUFS returned 0 (Success)
		VIDIOC_CREATE_BUFS returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_QUERYBUF returned 0 (Success)
		VIDIOC_G_FMT returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_STREAMON returned -1 (Broken pipe)

