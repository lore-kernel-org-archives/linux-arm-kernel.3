Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F74D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pyJv45tDjDKywJWeYp3I9ulqUEPqCbg6pglbJWo3s8=; b=AOPf4KaJdNUGNQPvK+DCzD1JJI
	kqOW9TNjV66BK8rKV/1zjC9OllJ4O+ZiZTRCMT0zVfCudhdsNzmfVJydWLP9sKCj8eoIct6ozOQ1q
	hbkZz1us5XurCcST98K8ZFw8ClXhP6ymf9I+B0oCbKY/WUFqvc2GCr5nEE2vUuRl3oJ3ufqGMx5/r
	PYcrE3317rjMAk3bYi9vmBHQ98b0L8U175POhwJX6X64mA21QbYhPUHaxJv0hptH29XK/UgwcGS0f
	YFBMQ7ACyZdKp6KV4J22mlYgbiJMoZ1jUg2bfRc3Ac9mPFE5Q8edMJSNdgqE6ivGlZZQghpz9WEiP
	l6fVoSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPWI-00000004qt5-2yuF;
	Tue, 16 Dec 2025 07:30:54 +0000
Received: from mx-relay100-hz2.antispameurope.com ([94.100.136.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPWE-00000004qsN-090g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:30:53 +0000
ARC-Authentication-Results: i=1; mx-gate100-hz2.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2pyJv45tDjDKywJWeYp3I9ulqUEPqCbg6pglbJWo3s8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765870197;
 b=b08VWtD50W7johvXjad53Yked2K4dgyqcvMLP+t7+ZkssdkNRQFPTfGXpmqCAwgaIZ4iJnyo
 nCnB8pmp1VDbFWFrK/gvogNUS6ohzper1da/Nz9+eNaqayG0jPVmzCwjBbb5x19zfUvsSMPoKZV
 FHKjXCewJqR3zevp0OTukiCB1ijU3Vkoyp4GZ/5G3ZJ+VoxeAfMncC9hMMd1RmDbbz1BlnsYhyF
 3m8PzkbFf87asGH9LUECTPn/2RnD2zajd4AuJ273QMDAeH9/OJKW2woQ7IqjPozkOCcaSDGkKrh
 ExTQ9nyxar9019X5wL6dQVfeODhYRidd5v4qKd8U5jGAQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765870197;
 b=CWirndWwVyVyBm11UHdmhZ0vM0sgIIjYChX5go5n0ur8tt+Zc24YlSKu17gBwsmPRxM6Eq/1
 V2POkID7Sn338Y8M4OioJpVms5/HgYgthbLoDOuaxzuAg2v08QErOzHqvTn25EFgt9V9N3u7T9m
 pAVmicjvHjTQiYAHPmtSMlDf8T31zb0QZGG+bnJ2XTxTNsMJVzZ7lSQoiNWd6AgVup2CObSg060
 fxkJ/eTYmXeb0bPASYDVvwYD8ZVDaivTr+8pnYKL6cFYJWmMds6xrg7aCjgvhhK1euc29ygLpDS
 7NLtJh8Rn/NGy2uTCtGxX0CcXPqPuPBvDtTIW56pLYJ+w==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay100-hz2.antispameurope.com;
 Tue, 16 Dec 2025 08:29:57 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 61240CC0DC8;
	Tue, 16 Dec 2025 08:29:32 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode
 to schema and example
Date: Tue, 16 Dec 2025 08:29:31 +0100
Message-ID: <3210190.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215175436.wwlgzxionq55zu27@pengutronix.de>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215175436.wwlgzxionq55zu27@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13198926.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay100-hz2.antispameurope.com with 4dVpTn4rt4z3PJZL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 7843bfe7f806661645c9883349bcb132
X-cloud-security: scantime:2.036
DKIM-Signature: a=rsa-sha256;
 bh=2pyJv45tDjDKywJWeYp3I9ulqUEPqCbg6pglbJWo3s8=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765870197; v=1;
 b=AiZkH4cEfy4dkJ53if9dWwCwwcbafU+ZKZQ2i0STubGzuw8MLPFBXdqJoetC1gjVjd1k4rSi
 4MzI8kQT3qy70XFelnP+fj2dwR8hRn+Jqpig3pVkFjPgLHSTIxCcwMMq98vZGz2qsTlLBKr3eIa
 XqVtp29hA2j+5/qLk39SsvPqMoEqf78hm2bNU047aOMPirf/GDf2hwMwFF/P6i7aJ/O06rw5nq/
 rQHouVSg6ELOVCryPlKhHI/e7SLJLwqMkALKWEjGqdGz1k9Hh0+YrcXr9yOjgp1BKHyaOR5L8rw
 UtJEzYDkKd4bZFYHZS2CPmHSuHPUOzYMMgvWPtuP8PCzg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_233050_491457_8980D13D 
X-CRM114-Status: GOOD (  29.56  )
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

--nextPart13198926.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Date: Tue, 16 Dec 2025 08:29:31 +0100
Message-ID: <3210190.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20251215175436.wwlgzxionq55zu27@pengutronix.de>
MIME-Version: 1.0

Hi,

Am Montag, 15. Dezember 2025, 18:54:36 CET schrieb Marco Felsch:
> Hi Liu,
>=20
> sorry I didn't fully answer you please see below.
>=20
> On 25-12-08, Liu Ying wrote:
> > Hi Marco,
> >=20
> > On 12/02/2025, Marco Felsch wrote:
> > > From: Liu Ying <victor.liu@nxp.com>
> > >=20
> > > i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> > > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > > field. Document the Parallel Display Format Configuration(PDFC) subno=
de
> > > and add the subnode to example.
> > >=20
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > [m.felsch@pengutronix.de: port to v6.18-rc1]
> > > [m.felsch@pengutronix.de: add bus-width]
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 92 ++++++++++++=
++++++++++
> > >  1 file changed, 92 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-medi=
a-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media=
=2Dblk-ctrl.yaml
> > > index 34aea58094e55365a2f9c86092f637e533f954ff..6e2d86d9341c75108b492=
bcbabc8a560d8e707cd 100644
> > > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-c=
trl.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-c=
trl.yaml
> > > @@ -26,6 +26,12 @@ properties:
> > >    reg:
> > >      maxItems: 1
>=20
> ...
>=20
> > > +            properties:
> > > +              endpoint:
> > > +                $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > > +                unevaluatedProperties: false
> > > +
> > > +                properties:
> > > +                  bus-width:
> >=20
> > In v1-v5, I thought the output bus format can be determined by the sink
> > device(a panel or a bridge) hence properties like bus-width were not ne=
eded.
> > But, if this property is really needed, then reference video-interfaces=
=2Eyaml
> > since bus-width is documented there.  Should we reference bus-type defi=
ned
> > in video-interfaces.yaml too?
>=20
> You're right, the bus-width should be determined by the connected panel.
> But there are cases where a 24-bit panel is connected but only the lower
> 18-bits are muxed. I added the bus-width property to handle this case.
> In the end most users don't have to specify this since the correct
> bus-width is coming from the panel bus-fmt.
>=20
> > > +                    enum: [ 16, 18, 24 ]
> >=20
> > The PARALLEL_DISP_FORMAT field of DISPLAY_MUX register says this IP sup=
ports
> > below formats.  It seems that the enum here may tell RGB888, RGB666 and=
 RGB565.
> > How can we tell RGB555, YCbCr 24 bits and YUV444 then?
> >=20
> > 000b RGB888 -> RGB888
> > 001b RGB888 -> RGB666
> > 010b RGB565 -> RGB565
> > 011b RGB555 -> RGB555
> > 100b YUV -> YCbCr 24 bits
> > 101b YUV -> YUV444
>=20
> This enum is about the physical bus width. RGB565 =3D=3D 16-bit, YUV =3D=
=3D
> 24-bit.
>=20
> That said, I don't think that you need to specify the bus-fmt since this
> is coming from the panel. As said above, my itension with the bus-width
> property is to provide integrators (dts-writers) a possibility to limit
> the physical available bus width.

Mh, isn't [1] exactly about this? Not sure about the outcome at that time.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250304101530.969920-1-victor.liu@nxp.com/

> [snip]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/
--nextPart13198926.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlBClsACgkQaS+g2M0Z
/iVQ0Qf8CUXPNQgjvninNpUlo9wHMSxcj70F/nwY4xnJ9mAHPkIcrl+Ye0RpxJvm
HUghMQJsn8g5oW1mw3ihaOEFFyjI2Nmpn839jZzyuWZFCzy+6ZArWMnhjAmU3EK8
axvxjC6n5kJ2/Dx3wih+X2Ub6IbwNIB01Xq368832yntOGHje3ucsFLNNV8RXaNH
PRwXcgrJ0fSDoEZPC1Eh59z+2sRZbA8rdLxHP+tqq71jwpBaTJUCZDSUfO1ZgFy7
LeiQPAchQ1p/gqgo9xvkM5pISy7hj0p/f1jRTroTT1VfHKsp4LDxb71VE/S+IKQU
dYOr28lQ8IOXSDJuSIAYKAynFx8akw==
=c8lD
-----END PGP SIGNATURE-----

--nextPart13198926.O9o76ZdvQC--




