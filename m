Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2251EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=; b=2/6UXk22h2QENI3kGyVFQKywav
	qhtO/bE8YADY5glJnXy9Wg0qw1NSFwPthIjc9NVWFn7UsO3L4Jhr81r4f6GzY0F4nqvv/NRNptEfM
	mqCVtGfXhZPXGMMIr8Lp95uXiEuINdijDb5ZS5PiKui8jSiOyCrrnGSYHlNJqP+IzdvXWEK7spNHl
	tU5CRd90kjMcwEdgbpx2b+SQ3k1J3HdfV0HQCHQ3iRDalJrzjSIl5VCXndip5xC0PXDw1i5lraBRy
	mHHx0PxcWmScwQWDH+bowXvEq6EZBIJirHggTz+rbkE4ckBEw9IjKyLk6bcYaz1+wSpLRn6A3CC3h
	DxU5gxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6ov-00000005kz7-3rTc;
	Mon, 17 Feb 2025 19:30:21 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6nS-00000005klf-1Iik
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:28:51 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c07838973eso445935885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 11:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739820528; x=1740425328; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=;
        b=22gSFExae+aEu43kckWWrCwxFrVRh0+5A/8pYEuS2QKYRq5xreyQXKzCm01N74YApz
         F7XX758Xs+uZhJ9IljLNc5uAgoavZMHO5UVNG7bXcBL/ER9T/oKA3uILielRK+iAZAOV
         iiRN7Uo5P63Ot51YGwxjTuWv3QpWYUT2oVIxHtovGJyzQJsnyvemXW/aMYJj+B7WJT1E
         3nRlDvdrGS7jvCn2POUQCSpkxp7rvOELYHhlfmh6efLKDSsZW/Y+kVj+Omuh2Qv0dKjH
         x8HPI5WpMx5Ccuh4hp+463Shmp2GaJwwP59QUEUXVGqUtRZxhqVjWCLNm2JE5r8KDD/Q
         54qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820528; x=1740425328;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AzAfbcIU/2Am+v+jnPFOtCbj7SMgMMXKSogURXBFTnU=;
        b=M30L3mLF7JMTh1arf5Q1KLDclxiU5XslsupMnZsnuXm9HOCIcZOD3SSna/2/gH/tdN
         B5mVVvPRL5c+oxekPzsZ5B6tV/p3SOzAS93uC5ktj3Z98FwXXpjP0wGF/1bjfE3bIL2N
         a0Ulm3Ik2vxuZVyHLw9u1HZ2wDpo1wapwJDeRhV4NS+8H3Z6SlklGA6qvIQCpdFwvVoP
         Aus4tR60G/vikK3vv1ghhyE/B1R7lsTgeK7UnRv7NmRGo8GLDYCZ8FfI+D5fVgDO2GN6
         BEZs0Ek3l9MxAMKsZivhDEBYHNHhtviWGpOqXu04jFCovT0Xvz1AFYMpj3DzyPm1PB0z
         dcWw==
X-Forwarded-Encrypted: i=1; AJvYcCU5PrQW+3h8qj1t0x+YnPuio/WRVKkHykVgBX8v/kH2pc9ZCHUo2FG6K5nuFFIZStL+c5e7OgsONswVaq9U2gj1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Y2YHdO3GhOdONjmngBoGrGvoWubh6KScpEQteQoRoMpTvItG
	DrHVK2DTFaiSdGDOfnjIadDOrVwrvrMLwaP6lpnRHMJpjLYJIuEFPkSGCBt0p6w=
X-Gm-Gg: ASbGncsfg/F0TacV+PAsg0BnL4XT/NbWpIVqt2+9iVMLOWzwFV8KoSFnuATZyfrRCcl
	f1t9J3s4lA1jllEh0KsJLEO4/NjMPIBlopZIBF6RxCYmWg9fAkjPgXD0n0DdExVB2jah46bOKYK
	b0BqcSMPRemR4qbnc6/nzNwIdiQWqZZ3+vTarnfdkbK7qi/2pVEeWvGnZ21dQaiAzHK339knX1x
	aY/GWqVgR7qUVYkkucbLIQy6InwZELc44+AX7x4KHiPU9Qx/GAl6Y16PovXt8/MFJHs5hlhkBPr
	0O27IdNVPHOOxV+QS728
X-Google-Smtp-Source: AGHT+IF0M1JuegcbLy3i0Bijjwl67r9LgXH3tketiaHBXEgodxNXXo5qAbFCYzz/X43MZ2CJv0eXEA==
X-Received: by 2002:a05:620a:40c1:b0:7c0:7350:9adb with SMTP id af79cd13be357-7c08a9801b5mr1443794485a.11.1739820527975;
        Mon, 17 Feb 2025 11:28:47 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c096e87af7sm193307485a.79.2025.02.17.11.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:28:46 -0800 (PST)
Message-ID: <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture
 decode
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nathan Hebert <nhebert@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 17 Feb 2025 14:28:45 -0500
In-Reply-To: <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
References: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
	 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0
 aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDA
 gQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDi
 cVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA
 8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Ro
 x8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2
 xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRB
 xUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05p
 Y29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQ
 Cgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGl
 xdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMC
 BBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZM
 Zm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG
 5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBU
 CCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOq
 ZEHAs+xabBgknYZIFPU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_112850_348347_C278C930 
X-CRM114-Status: GOOD (  25.05  )
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

aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =C3=
=A9crit=C2=A0:
> Hi Nathan,
>=20
> Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=A9c=
rit=C2=A0:
> > Mediatek devices that support HEVC also support the main still picture
> > profile, but today, the main still picture profile is excluded.
> >=20
> > This removes the skip mask for HEVC, and enables the main still
> > picture profile decoding.
> >=20
> > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > ---
> > On Mediatek devices that support HEVC decoding, HEVC Main Still Picture
> > profile is also supported by the SOC and firmware. However, this
> > capability is turned off in the vcodec driver.
> >=20
> > This removes the code that disables HEVC Main Still Picture profile
> > decoding. Validation of the decoder has been done via V4L2-backed
> > Android CTS tests on an MT8196 device.
>=20
> While its nice to know that you are working on upcoming SoC, we need
> confirmation that this is working on all the upstream stateless
> decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> which I can see has merged support without the linux-firmware file to
> go with it.
>=20
> I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> fix the situation with 8188 in linux-firmware, and CC me.

In case this is useful, we recommend providing fluster scores for the
codec, which in that case runs some public ITU conformance vectors.
Since most of the testing has been done with GStreamer, you may be able
to find old report and confirm it it works. GStreamer does not
currently filter the profile/level (on my todo), so it will try anyway.
IPRED_B_Nokia_3 is the one vector in the base suite that expose that
profile.

resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
  Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25 fps, 1=
200k tbr, 1200k tbn

regards,
Nicolas

>=20
> regards,
> Nicolas
>=20
> > ---
> > =C2=A0.../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_statele=
ss.c=C2=A0=C2=A0 | 2 --
> > =C2=A01 file changed, 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec=
_dec_stateless.c
> > index afa224da0f41..d873159b9b30 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teless.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teless.c
> > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_state=
less_controls[] =3D {
> > =C2=A0			.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > =C2=A0			.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > =C2=A0			.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > -			.menu_skip_mask =3D
> > -				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> > =C2=A0		},
> > =C2=A0		.codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > =C2=A0	},
> >=20
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> >=20
> > Best regards,
>=20


