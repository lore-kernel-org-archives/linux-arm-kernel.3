Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A02CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pQCHA/YsiEN5buh66ENdiaOQ0VW42HN2VHXd8WE5AE=; b=BYEeHUrK0qzqdYjm61OeLuGrFk
	OTh1Xmj/iT/2x89ggHYd7P5c1W9wINlHxmklXbo4k1EMV1+Uo0BLOpYr0b0aN1kpiV/R/BCBGhWTL
	x4rizMSYyoLFVQFz4xs7HxXdqOGh1S3coVRDGLW+hAx/286NZFxdcPD0Unik3B3Utr9MjWMRLdoSM
	MYsX2uLP8hF3WaDmewOjB5cahRLI6MvFtgBlRG3Hxm5EjY0QEBwAzomJWKN8JvuN3ybjizFXJjkqq
	pDO/JeDxTS+mRYSWfAabG+s54p8A2uv9DfvQfyytbeErKM5HX835EH49+oe3WVghJkUrFFbfNwXDC
	wNkaLIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluaa-0000000Bmpj-41Tj;
	Tue, 12 Aug 2025 19:23:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHC-0000000Al12-2wLD;
	Tue, 12 Aug 2025 12:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755002328;
	bh=+pQCHA/YsiEN5buh66ENdiaOQ0VW42HN2VHXd8WE5AE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LqXo3FVCvi56pSCatk45+XDdD0H9nsBEu4cQnmgSPNlZsurhAOhL3au8AE9973u8m
	 ZU26p1z6Dlzp0xut2qhShM1UREY3grrRRjxQP+pXBvwZebHrAZiexJSgwHyct6rrui
	 2rNaSTofBo160/0a7J/M85bM8w9OSnK7P5cYFPcNOZnRj4CKwSGbT9m9jtEBx1ojAi
	 wdBHk3DA34bM5KGxQ46eFL8lx8cW/eONz1V+otJnplnOVFAemoZk1bEUa3pgXkZxcT
	 ClW5Pe+4kil70/qGEREbEdtl5m8GwX/X4wFkpxHN/8FAq4EOpJ9Gr/oNJCIwedegB1
	 w+sx5Gq4poMNQ==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7920917E00A3;
	Tue, 12 Aug 2025 14:38:47 +0200 (CEST)
Message-ID: <91864a1c047d2bdfce202b070716a694ede47d5e.camel@collabora.com>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 08:38:45 -0400
In-Reply-To: <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
	 <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-vqPfCzXk6jLqVbkdE40Z"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_053851_112538_D6983F27 
X-CRM114-Status: GOOD (  48.51  )
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


--=-vqPfCzXk6jLqVbkdE40Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 ao=C3=BBt 2025 =C3=A0 02:00 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> Hi Nicolas,
>=20
> On 8/11/2025 11:52 PM, Nicolas Dufresne wrote:
> > Le dimanche 10 ao=C3=BBt 2025 =C3=A0 21:24 +0000, Jonas Karlman a =C3=
=A9crit=C2=A0:
> > > This series add a HEVC backend to the Rockchip Video Decoder driver.
> > >=20
> > > With the dependent H.264 High 10 and 4:2:2 profile support series
> > > finally merged there is finally time to send a v2 with minor changes =
and
> > > a suggested code style fix of this series. v1 of this series has been
> > > fully functional up until recent unstaging of the rkvdec driver.
> > >=20
> > > A version of this HEVC backend has been in use by the LibreELEC distr=
o
> > > for the past 5+ years [1]. It was initially created based on a copy o=
f
> > > the H264 backend, unstable HEVC uAPI controls and a cabac table + sca=
ling
> > > matrix functions shamelessly copied 1:1 from the Rockchip mpp library=
.
> > >=20
> > > It has since then been extended to use the stable HEVC uAPI controls =
and
> > > improved opon e.g. to include support for rk3288 and fix decoding iss=
ues
> > > by Alex Bee and Nicolas Dufresne.
> > >=20
> > > The version submitted in this series is based on the code currently u=
sed
> > > by the LibreELEC distro, excluding hard/soft reset, and with cabac ta=
ble
> > > and scaling matrix functions picked from Sebastian Fricke prior serie=
s
> > > to add a HEVC backend [2].
> > >=20
> > > Big thanks to Alex Bee, Nicolas Dufresne and Sebastian Fricke for mak=
ing
> > > this series possible!
> > >=20
> > > Patch 1 add the new HEVC backend.
> > > Patch 2-3 add variants support to the driver.
> > > Patch 4 add support for a rk3288 variant.
> > > Patch 5 add a rk3328 variant to work around hw quirks.
> > > Patch 6-7 add device tree node for rk3288.
> > >=20
> > > This was tested on a ROCK Pi 4 (RK3399) and Rock64 (RK3328):
> > >=20
> > > =C2=A0 v4l2-compliance 1.30.1, 64 bits, 64-bit time_t
> > > =C2=A0 ...
> > > =C2=A0 Total for rkvdec device /dev/video1: 49, Succeeded: 49, Failed=
: 0, Warnings:
> > > 0
> > >=20
> > > =C2=A0 Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4=
l2request
> > > =C2=A0 ...
> > > =C2=A0 Ran 137/147 tests successfully
> >=20
> > I've also tested RK3399 using Renegade Elite from Libre Computer, thoug=
h with
> > GStreamer. My results for this suite is 134/147, with failing tests bei=
ng:
> >=20
> > - DBLK_D_VIXS_2
> > - DSLICE_A_HHI_5
> > - DELTAQP_A_BRCM_4
> > - EXT_A_ericsson_4
> > - PICSIZE_A_Bossen_1 (expected)
> > - PICSIZE_B_Bossen_1 (expected)
> > - PICSIZE_C_Bossen_1 (expected)
> > - PICSIZE_D_Bossen_1 (expected)
> > - SAODBLK_A_MainConcept_4
> > - SAODBLK_B_MainConcept_4
> > - TSUNEQBD_A_MAIN10_Technicolor_2 (expected)
> > - WPP_D_ericsson_MAIN10_2
> > - WPP_D_ericsson_MAIN_2
> >=20
> > Please share your list, this seems big enough difference to be worth ma=
king sure
> > we did not diverge somewhere between both interpretation of the V4L2 sp=
ec.
> > GStreamer has been mostly tested with MTK driver so far. Can you also s=
hare a
> > link to the latest ffmpeg tree you are using (since its not upstream FF=
MPEG) ?
>=20
> As mentioned in this cover letter the full fluster report can be found
> at [3], and has links to the trees used to produce the raw report data,
> have now also added some more details of versions used.

Missed that, sorry.

>=20
> The tests from the report was running on a RK3399 Rock Pi 4B v1.5.
>=20
> - Linux: 6.17-rc1 + patches
> - fluster: 0.4.1 + patch
> - FFmpeg: 7.1.1 + patches
> - GStreamer: 1.27.1
>=20
> JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:
>=20
> - DBLK_D_VIXS_2 (fail)
> - DSLICE_A_HHI_5 (fail)
> - EXT_A_ericsson_4 (fail)
> - PICSIZE_A_Bossen_1 (error)
> - PICSIZE_B_Bossen_1 (error)
> - PICSIZE_C_Bossen_1 (error)
> - PICSIZE_D_Bossen_1 (error)
> - SAODBLK_A_MainConcept_4 (fail)
> - SAODBLK_B_MainConcept_4 (fail)
> - TSUNEQBD_A_MAIN10_Technicolor_2 (error)
>=20
> JCT-VC-HEVC_V1 on FFmpeg-H.265-v4l2request:
>=20
> - CONFWIN_A_Sony_1 (fail)
> - EXT_A_ericsson_4 (fail)
> - PICSIZE_A_Bossen_1 (error)
> - PICSIZE_B_Bossen_1 (error)
> - PICSIZE_C_Bossen_1 (error)
> - PICSIZE_D_Bossen_1 (error)
> - SAODBLK_A_MainConcept_4 (fail)
> - SAODBLK_B_MainConcept_4 (fail)
> - TSUNEQBD_A_MAIN10_Technicolor_2 (error)
> - VPSSPSPPS_A_MainConcept_1 (error)
>=20
> The WPP_*_ericsson_MAIN* samples get a mixed Fail/Success when running
> the full test suite for FFmpeg-H.265-v4l2request, however retrying them
> individually they will eventually report Success. Not sure this is an
> issue with FFmpeg or the driver, since they pass with GStreamer.
>=20
> Interesting that DBLK_D_VIXS_2, DSLICE_A_HHI_5 and CONFWIN_A_Sony_1
> consistently differs between GStreamer and FFmpeg.

Indeed, let's identify the differences in parameters. For CONFWIN though,
Benjamin implemented pretty much a hack in GStreamer to support it. This vi=
deo
utilize the x,y coordinate of the conformance window, while maintaining the=
 same
resolution during playback. This x/y coordinate is rarely used in real worl=
d, so
this shouldn't be a priority.

I think for both GStreamer and FFMPEG, the right way would be to signal the=
 crop
over the padded area and leave it to some render filter handle it. For flak=
e,
that's something to check, but also not really a blocker.

>=20
> [3] https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d
>=20
> >=20
> > Detlev reports 146/147 on newer hardware using GStreamer, failing
> > TSUNEQBD_A_MAIN10_Technicolor_2 (9bit chroma) only. On Detlev side, it =
will we
> > important to check why 8K videos (PICSIZE*) passes with a single core, =
perhaps
> > we accidently use both cores ?
> >=20
> > Note, also expected, we failt JCT-VC-SCC, JCT-VC-MV-HEVC, and JCT-VC-RE=
xt passes
> > 2/49. This last suite is pretty new in fluster.
>=20
> Following is the FFmpeg-H.265-v4l2request result with this:
>=20
> - JCT-VC-MV-HEVC 9/9
> - JCT-VC-RExt 2/49
> - JCT-VC-SCC 0/15
> - JCT-VC-3D-HEVC 27/27

Nice we have the same for RExt, and glad we can do MVC and 3D without addit=
ional
control. These last two are simply not implemented in GStreamer. For SCC, w=
e are
missing some information, and the hardware probably does not handle it.

cheers,
Nicolas

> - JCT-VC-SHVC 1/69
>=20
> Regards,
> Jonas
>=20
> >=20
> > regards,
> > Nicolas
> >=20
> > >=20
> > > =C2=A0 Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4=
l2request
> > > =C2=A0 ...
> > > =C2=A0 Ran 9/9 tests successfully
> > >=20
> > > And on a TinkerBoard (RK3288):
> > >=20
> > > =C2=A0 v4l2-compliance 1.30.1, 32 bits, 32-bit time_t
> > > =C2=A0 ...
> > > =C2=A0 Total for rkvdec device /dev/video3: 49, Succeeded: 49, Failed=
: 0, Warnings:
> > > 0
> > >=20
> > > =C2=A0 Running test suite JCT-VC-HEVC_V1 with decoder FFmpeg-H.265-v4=
l2request
> > > =C2=A0 ...
> > > =C2=A0 Ran 137/147 tests successfully
> > >=20
> > > =C2=A0 Running test suite JCT-VC-MV-HEVC with decoder FFmpeg-H.265-v4=
l2request
> > > =C2=A0 ...
> > > =C2=A0 Ran 9/9 tests successfully
> > >=20
> > > The WPP_x_ericsson tests from test suite JCT-VC-HEVC_V1 has been show=
ing
> > > a mix of both Success and/or Fail result for FFmpeg-H.265-v4l2request=
.
> > >=20
> > > Full summary of fluster run can be found at [3].
> > >=20
> > > Please note that there is a known issue with concurrent decoding,
> > > decoding errors in one decode session may affect a separate session.
> > > The only known mitigation to this is to pause decoding for some time
> > > and/or do a full HW reset, something to handle in future series.
> > >=20
> > > Changes in v2:
> > > - Rabase after h264 high10/422 merge and unstaging of rkvdec driver
> > > - Use new_value in transpose_and_flatten_matrices()
> > > - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
> > > - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
> > > - Adjust code style in rkvdec_enum_coded_fmt_desc()
> > > - Collect a-b tag
> > > - Drop merged vdec node reg size patches
> > > Link to v1:
> > > https://lore.kernel.org/linux-media/20231105233630.3927502-1-jonas@kw=
iboo.se
> > >=20
> > > [1]
> > > https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Rockch=
ip/patches/linux/default/linux-2000-v4l2-wip-rkvdec-hevc.patch
> > > [2]
> > > https://lore.kernel.org/linux-media/20230101-patch-series-v2-6-2-rc1-=
v2-0-fa1897efac14@collabora.com/
> > > [3] https://gist.github.com/Kwiboo/bedf1f447b50921ffbe26cb99579582d
> > >=20
> > > Alex Bee (4):
> > > =C2=A0 media: rkvdec: Add variants support
> > > =C2=A0 media: rkvdec: Add RK3288 variant
> > > =C2=A0 media: rkvdec: Disable QoS for HEVC and VP9 on RK3328
> > > =C2=A0 ARM: dts: rockchip: Add vdec node for RK3288
> > >=20
> > > Jonas Karlman (3):
> > > =C2=A0 media: rkvdec: Add HEVC backend
> > > =C2=A0 media: rkvdec: Implement capability filtering
> > > =C2=A0 media: dt-bindings: rockchip,vdec: Add RK3288 compatible
> > >=20
> > > =C2=A0.../bindings/media/rockchip,vdec.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > > =C2=A0arch/arm/boot/dts/rockchip/rk3288.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 17 +-
> > > =C2=A0.../media/platform/rockchip/rkvdec/Makefile=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 2 +-
> > > =C2=A0.../rockchip/rkvdec/rkvdec-hevc-data.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1848 +++++++++++++++++
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 826 ++++++++
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-regs.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 4 +
> > > =C2=A0.../platform/rockchip/rkvdec/rkvdec-vp9.c=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 10 +
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0=
 184 +-
> > > =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=
=C2=A0 15 +
> > > =C2=A09 files changed, 2886 insertions(+), 21 deletions(-)
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc-data.c
> > > =C2=A0create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvde=
c-hevc.c

--=-vqPfCzXk6jLqVbkdE40Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJs11QAKCRBxUwItrAao
HJraAJ9RWJiqcdTXpMPzVUTHjbhWCSPcoQCgzWL4+J+5Uu9C72+SfPXoB41afJg=
=+8qk
-----END PGP SIGNATURE-----

--=-vqPfCzXk6jLqVbkdE40Z--

