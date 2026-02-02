Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37701E7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXE7ald5tcjEzZ48f0b2jZkl5LlJhCx6n0+to2+iB3E=; b=wRi5U129U53syXHfjIFb9P9bCo
	aAnxP7rs98R/XV4bHuKafrnmfbOqZOoSwR6eiADSiGjZ+14e3FQyaSo8HmHy/tl/R10YTCORDI+F0
	JYWwogbDXqnqNDCP8Qp1AZNGzkMCpcvaSV175jWpCfxEIhn7YMTNtccnnOF+QIzwqfzYJeWQ8z2nw
	1uN1f2DVEH1bU9yALhrPhLyBkcjc16/C4M4AYLqrinIPLbJdFjnZqE4bbMtn+XJmMfc22qKBI3p74
	pIiSorrcuNsGfNCyQFuvnkPXP7aYpDKQCRMesD7VCbjMuqfGv5mefkXzmuK3R2rdAS5uFoX8eGqmC
	hkSLzB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyuh-00000005SQi-1mfK;
	Mon, 02 Feb 2026 18:44:48 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyuX-00000005SD3-1u7B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:44:42 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-88a2fe9e200so45322336d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 10:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1770057871; x=1770662671; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fXE7ald5tcjEzZ48f0b2jZkl5LlJhCx6n0+to2+iB3E=;
        b=LISw2AabLZy0lea0y/ZaXs+h9iZLSPjVH6eavJydG51hwzsDImcVOC8Y/NjCFp5kv0
         oW6Gn163wHzLKyTA6NxDs9Yo4EcffsKxGdFD3ARRzzlpf9qU71yfy5ASdcfbwBFFM9uU
         lKHIiFsykOKLFwxptP734c7Pyy0ZgKFTbwPMV6zYaO0hOoNV1E3pub5RG3aYdpL9gn1I
         L1sfEjgfBWxOIlXsreqhgYgz0O4oDSKaYEvsqzgcbfb/4kqJSB8bZOnWE5jj7ZkWEY3z
         2dl80YOjXk8wmHf32cDJDCCrUvj64fo+yHR23twqPtNWfULSstNTUqFA9swvutDCw+Dw
         ZrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770057871; x=1770662671;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXE7ald5tcjEzZ48f0b2jZkl5LlJhCx6n0+to2+iB3E=;
        b=CIqoxDIspK+B1AYcYjOOq55+ewY/Vv9qDH8oAvff/4r77XAha0fu9qzoTzSnwTN8xQ
         BzsPDz/D7ws0ZCN2O9NERpzLBlIaZgS73i8GW7knGmYYnCCrhYCj8rLVK/hRxMOtiGJz
         EPr2FGcs5rVv2UNhrAmnUBPVEA2AEKuAzD+xSjwpKQUGT7ebYghtJPbsXO/h1Fb3K6nh
         UBMaTVZ+K3BjETzxOA8Syx6ntqUEQFcvBbxmUz8LWuUarm8gTD6p01bwOQCrOnNVRgS/
         JrOHERvbo/hG/Ny7OEyKY4uDCAUP12CObp+SjHL3tTxcbaxjG0006/jII70Wbl9VRlDn
         zNfg==
X-Forwarded-Encrypted: i=1; AJvYcCUzxoLZhrkwhZYhoS+3Pw5M4uKZY6ph2rPH/L+XK8EpljIeZe+I92EmvPl2pt5Wye4ALepwnQu59JgnG16YWmy9@lists.infradead.org
X-Gm-Message-State: AOJu0YxxGsoh0YqlOxkMdnGhrfslBP5Ke+f/q9gMeBuNMFR9xUZR1dY7
	Esqja979d/vks7WOy5rtO1NbfIA8GK5X7bJaDCeXWKWFMvhuC/AjUiI+NUApa06dJsM=
X-Gm-Gg: AZuq6aJkYjR41mHLt0igZOHgx4IR67USrVJf+5Kdg//IuhI5+S7aOS+mpkAEfF//aK3
	riHV9RZhSxeeKIblBpbHr5rMJlqeGrl6ymXqNZm4cglrArKJuW3LDsGAJRPPifZk1lLSnsgjGJ2
	ETQdvbdzKP9+u6fu+mAGi5qIB8+ZCgN5jND6vLK0u20GN++LF4Ph9Yl/0EVQu2j2P+ncmivBEjn
	kUOL7IiBcUEicRAVcyqVE3tWHC0ub90EZX8bZjxQPfc+SRd+E7sT7kzWdSaNDMGX/wvdY40NeBV
	mduXnvXxIbFViBpUJIOBFWDO0lKM8INSfe7LFC+Dvz5Xb73CWOz40MdClZiTA2DJ/hFXalLFXmD
	YUR9XkdnazbIUnux6JmNHZa530kksn6hV8NvE9zjUwhLrP/HJSsRZ2PN/KXImtTDApdSTjM7KAR
	Lnfz0JNO1v9amKU3bE
X-Received: by 2002:a05:6214:c42:b0:894:46d9:53f7 with SMTP id 6a1803df08f44-894e9f27762mr178804396d6.12.1770057871331;
        Mon, 02 Feb 2026 10:44:31 -0800 (PST)
Received: from ?IPv6:2606:6d00:15:210e::5ac? ([2606:6d00:15:210e::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d3740e62sm119882596d6.26.2026.02.02.10.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:44:30 -0800 (PST)
Message-ID: <169eba79e8e1f906b1a0b59e22a531dfc7e57a1f.camel@ndufresne.ca>
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, 	shawnguo@kernel.org,
 ulf.hansson@linaro.org, s.hauer@pengutronix.de, 	kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, 	l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 02 Feb 2026 13:44:28 -0500
In-Reply-To: <0b24716b-438c-4185-8a93-3a3879147c24@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
	 <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
	 <0b24716b-438c-4185-8a93-3a3879147c24@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-VlA8ZcxnzX2eUS2/dkES"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104433_904568_CAE55287 
X-CRM114-Status: GOOD (  40.12  )
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


--=-VlA8ZcxnzX2eUS2/dkES
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 f=C3=A9vrier 2026 =C3=A0 15:44 +0800, Ming Qian(OSS) a =C3=A9cr=
it=C2=A0:
> Hi Nicolas,
>=20
> On 1/30/2026 10:47 PM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le vendredi 30 janvier 2026 =C3=A0 16:41 +0800, ming.qian@oss.nxp.com=
=C2=A0a =C3=A9crit :
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > >=20
> > > The VPU G2 clock was reduced from 600MHz to 300MHz in commit
> > > b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock") to address
> > > pixel errors with high-resolution HEVC postprocessor output.
> > >=20
> > > However, testing shows the 300MHz clock rate is insufficient for
> > > 4K60fps decoding and the original pixel errors no longer occur at
> > > 600MHz with current drivers.
> >=20
> > Tested on EVK, with the downstream DCSS driver, and this change trigger=
s DCSS
> > underrun (which is related to the DRAM QoS erratas on this SoC). It als=
o
> > sometimes trigger the "not all macroblock decoded" warning I added rece=
ntly, and
> > we can empty IRQs, but these are handled now.
> >=20
>=20
> This doesn't sound like just a VPU issue; it's related to the display or=
=20
> DDR.
> If not displayed, do the fluster test cases yield different results at=
=20
> 600MHz and 300MHz?

Didn't you run these tests before sending ? I can try again, but in my inte=
rnal
notes, I wrote:

  > Tested that, and everything becomes unstable

That was before I figure-out the IRQ handler didn't handle exception bits t=
hat
didn't stop the decoder (or dry IRQ, which strangely is common from the G2)=
.

>=20
> > >=20
> > > Test results with 3840x2160@60fps HEVC stream decoded to NV12
> > > (the same scenario that exhibited pixel errors previously):
> > >=20
> > > 300MHz performance:
> > > - Severe frame dropping throughout playback
> > > - Only 336 frames rendered in 11:53 (0.471 fps)
> > > - Continuous "A lot of buffers are being dropped" warnings
> > > - Completely unusable for 4K video
> > >=20
> > > 600MHz performance:
> > > - Smooth playback with only 1 frame dropped at startup
> > > - 37981 frames rendered in 10:34 (59.857 fps)
> > > - Achieves target 60fps performance
> > > - No pixel errors or artifacts observed
> >=20
> > That probably only true with the upstream DCSS + a small resolution emb=
edded
> > panel ? Can you clarify this setup, because the display drivers mainlin=
e are
> > very minimal. Would be nice to show you average DDR read/write bandwidt=
h
> > utilization during this run for comparision.
>=20
> My display is hdmi, I'll try the DCSS.
> And the DDR bandwidth results measured by perf are as follows:
>=20
> =C2=A0 Performance counter stats for 'system wide':
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 113303664278=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 imx8_ddr0/read-cycles/
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 82457075530=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 imx8_ddr0/write-cycles/
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 634.892101865 seconds time elapsed
>=20
> >=20
> > Another information that bugs me, in the BSP code, the G2 voltage is in=
creased
> > too, which you didn't do here. They also use the thermal 2 zone to kick=
 it down
> > to 300 until it cools down.
> >=20
>=20
> In our internal code, whenever the frequency of either g1 or g2 reaches
> 600MHz, the voltage is adjusted to 1.0V. Since g1 is already set to 600
> MHz in the upstream DTS, I believe the default version is already 1.0v.
>=20
> And do you mean vpu-thermal? But it doesn't define the cooling-map, I'm
> not sure how it works.
>=20
> 		vpu-thermal {
> 			polling-delay-passive =3D <250>;
> 			polling-delay =3D <2000>;
> 			thermal-sensors =3D <&tmu 2>;
>=20
> 			trips {
> 				vpu-crit {
> 					temperature =3D <90000>;
> 					hysteresis =3D <2000>;
> 					type =3D "critical";
> 				};
> 			};
> 		};

Its not:

 $> cat /sys/kernel/debug/regulator/regulator_summary | grep SW1C
 SW1C                             1    1      0 unknown   900mV     0mA   8=
25mV  1100


Before I gave up on 60Hz on this SoC, I did test raising it to 1v with this
patch (hopefully there is a way to do that in DT, would be more elegant):


diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 4b828d74a606..2f2b85ca6fd2 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -639,6 +639,7 @@ static const struct imx_pgc_domain imx8m_pgc_domains[] =
=3D {
 		},
 		.pgc   =3D BIT(IMX8M_PGC_VPU),
 		.keep_clocks =3D true,
+		.voltage   =3D 1000000,
 	},
=20
 	[IMX8M_POWER_DOMAIN_DISP] =3D {

I would also like to remind you your own erratas, in the errata document yo=
u
state that DRAM QoS is broken, and all transactions are treated with the sa=
me
priority. If you overload the bandwidth, it becomes fatal for the display
controller. We tried to workaround with changing the NoC configuration, but=
 it
did not work. It feels like that NoC granularity is not enough to prevent
underrun of the display controller (where the QoS would work, since its don=
e at
transaction level, not by measuring bandwidth).

Nicolas

>=20
> Regards,
> Ming
>=20
> > Nicolas
> >=20
> > >=20
> > > Restore the clock to 600MHz to enable proper 4K60fps decoding
> > > capability while maintaining stability.
> > >=20
> > > Test pipeline:
> > > =C2=A0=C2=A0 gst-launch-1.0 filesrc location=3D<4K60_HEVC.mkv> ! \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 video/x-matroska ! aiurdemux ! h265parse ! \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 v4l2slh265dec ! video/x-raw,format=3DNV12 ! =
\
> > > =C2=A0=C2=A0=C2=A0=C2=A0 queue ! waylandsink
> > >=20
> > > Fixes: b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock")
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > > =C2=A0 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > index 607962f807be..731142176625 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > @@ -960,7 +960,7 @@ pgc_vpu: power-domain@6 {
> > > =C2=A0=C2=A0								=09
> > > <&clk IMX8MQ_SYS1_PLL_800M>,
> > > =C2=A0=C2=A0								=09
> > > <&clk IMX8MQ_VPU_PLL>;
> > > =C2=A0=C2=A0						assigned-clock-rates =3D
> > > <600000000>,
> > > -							=09
> > > <300000000>,
> > > +							=09
> > > <600000000>,
> > > =C2=A0=C2=A0							=09
> > > <800000000>,
> > > =C2=A0=C2=A0								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0>;
> > > =C2=A0=C2=A0					};
> > >=20
> > > base-commit: c824345288d11e269ce41b36c105715bc2286050
> > > prerequisite-patch-id: 0000000000000000000000000000000000000000

--=-VlA8ZcxnzX2eUS2/dkES
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYDwjAAKCRDZQZRRKWBy
9M0iAQCQ+75+dFwxPBtQI6SItaSuQV1acKtDid/mlGDfjCw4EQD/Xw6NrgBGFWtL
nBi1uvDvRI2awNqQROZ2r40kipfvpwc=
=PVw+
-----END PGP SIGNATURE-----

--=-VlA8ZcxnzX2eUS2/dkES--

