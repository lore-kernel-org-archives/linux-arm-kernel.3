Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738F1CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5yuzSij9ihN7bsN0SDs0fsi6mzTuBWCdwEM+hrLAO0=; b=cel6ejXAyWqkzmbLw9ug939Wbj
	yE45rmXeB3JcHrvyMT8Nab38juIm2t531PbFUKQaX6ZCCymjpkrngrRjh+nXbgnZQcJq7PDFhRwdh
	o9KBJlyBMQwG6djvc6ylkxQGIEpigKGPo2RPFd2EgXwkJranDl1fpy7QMqUgyVP6VevBfU2jeHOpX
	Y5LN5pypXjyN5qjlLaFW0KxAghS09xzmxUWzoS+xJloI7bPud3FQ9NhiI+ZW+RVL9MM9NF5L7nzIR
	k8ygJvQv3f7YTkzw4ggHuLhsGgnf1vZHc5sNnZCqwPG9gwFZ5t4LTJ79BAfIszB8Fqdj9Vc3OaAVY
	7zl+VYAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMntd-0000000GzpN-1TVU;
	Tue, 12 May 2026 14:15:41 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnta-0000000Gzo1-2Gem
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:15:40 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-8b6ea7716bfso60932616d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778595337; x=1779200137; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t5yuzSij9ihN7bsN0SDs0fsi6mzTuBWCdwEM+hrLAO0=;
        b=a6F5XfPrytNupJTYtMXLrxYUm81H0CVaJC9n1M64yJ3NQJB6TgcgqGkRseY5I9LDqo
         w/J2U3/FAbjDm0x71SyZLPnDdyEHATzkpnuKVsE9T2oh79AFpS9UA/hw9qgutfRA8Aab
         ycJPQhpuOtA/ogSh/gG3vGQZg+nD34e5LqdF8XTy5T+JGQtcKWSZo4w1g9Y95sU9wdqe
         njCOjYV8EBW6n291ME/rIadIeVUrYUXQAKTRpLI4Vj0noFqtpl0IOSeXKim8CyT8JXq0
         avnJupokOlAaq8t7Lympyix/ptLOmk7/gMHD75TnItU8NRE2tUxnAFhm1TWRgsjTV3za
         Vo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595337; x=1779200137;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5yuzSij9ihN7bsN0SDs0fsi6mzTuBWCdwEM+hrLAO0=;
        b=HmoxReIRc0csojePiHRdSEHGTHdesPnstuZW0fqPGKV9ap98dghK9LM6WxavmK/IsQ
         rrLfD9hx3X/EiFoYXK0eKxDLQosrKoLLozcn3vCrEOgZ45/OsVTwtk5ZtAytUP/lJBdk
         ujVlHFX2lzOk0xCKcq/u9Monj3jV7HBYuxH4naeBsmJzH4sj20yb1EQWrUIKusOEE8/h
         RzPilvD7ZHr7ZY10vusNoWv1iiCxtLQ/sRH17hWn/K5HInz5kjAMfB9TJnxAtLoOZQCp
         58dqnEH57vALvswDDDfjVveVu8JY+ohmV+So878lg/g1ab8SSrnO/MXmeejWmT8+VBMY
         8iEw==
X-Forwarded-Encrypted: i=1; AFNElJ8cr5LZTFd/ibPkC4YoVKGn4yTv9vECra8OQXyziPgsMMqjpBw2iTnY6TyTntBgHn/STDPT+4FgATCpd7cjRY+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzsZkwtAorey8jRAhyoH2Fs3XiZ9kmH+oFiUvP/AoJpIY0z2HHk
	TmUoILGyM3wPGzr/9uelQzijWSm/0hxiTJT7GqpLAEtOAp/b7siqiTdK0kQqw/Rvs4A=
X-Gm-Gg: Acq92OFYU054jGPv48mBtcgnr1cMmoA6YgXkv1hVWHckNDoO+Cj0dUzLbS0+42n0kLe
	I7BTtB/VfqH+36f5H8tQ2p1YbhFbZO1qvQc2+Z2hSdIm2+p3ECA/kdZ8E/bJghk7X+fY+xym0FA
	8GY3id5779vq89/Tg1AdVlkUBGguq6nwZITzbtfLSOFhUBJQyZICim/Jfha64+P7wACDNtbdopl
	7Tvnug1fzbYpDK0/jGfqobtCmKP7wHwUDV4seGeUHGemYm6XSzEfweHcTWAW2wC1tCAeppL0LZQ
	HcbKkbBkwDQHUWsvwYZe507lZA0N2jwTwZ35f13tRx0hYl4E5gocd/9gEkWl8CqX1gl9QCAwE8G
	1Sl1xPw+eQdaXpe2BFKDUnSlXlsDgGSBRdqApfOxjWdvlDCELKg/aMwpaMCJb53I8FNXCedR0Or
	66q6w9lbcAXacUwWmnCM0zYPz0lVu07rlIyVFO58E=
X-Received: by 2002:a05:6214:1c83:b0:8ac:8337:ca08 with SMTP id 6a1803df08f44-8c1b0959359mr215100206d6.51.1778595335519;
        Tue, 12 May 2026 07:15:35 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a3401b1sm125364016d6.22.2026.05.12.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:15:33 -0700 (PDT)
Message-ID: <30f56a0ac9f724b5ec1b936eec7b5b7c5e751c75.camel@ndufresne.ca>
Subject: Re: [PATCH v5 16/29] media: rockchip: rga: split flip and rotate
 into separate function
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com
Date: Tue, 12 May 2026 10:15:30 -0400
In-Reply-To: <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-16-eb7f5d019d86@pengutronix.de>
	 <ebe5cd6689923eb1e2124e177f694895383fba54.camel@ndufresne.ca>
	 <1f447423-8c63-4545-a4f7-d8d5ef821255@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-Hb+ed2d1W1UpJMfZXIXO"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_071538_727628_EF9D0207 
X-CRM114-Status: GOOD (  48.37  )
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


--=-Hb+ed2d1W1UpJMfZXIXO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 12 mai 2026 =C3=A0 16:08 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On 5/9/26 12:11 AM, Nicolas Dufresne wrote:
> > Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9cr=
it=C2=A0:
> > > Split the flip and rotate command configuration into a separate
> > > function in preparation of filling the command stream at streamon.
> > > As the userspace can change the flipping and rotation controls while
> > > streaming, we have to update them with each new frame to prevent the
> > > user being unable to change them while streaming.
> > >=20
> > > Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> > For code point of view, everything seems fine, but the commit message l=
eave me a
> > bit wondering. Any rotation that isn't 180 degree will cause the width =
and
> > height to be reversed, and a new stride is needed to present the buffer
> > correctly. Meaning the capture format can be affected by this change.
>=20
> Sorry for missing to properly communicate my intention with this patch.
>=20
> I've stumbled over the RGA pulling a spin lock on the controls, when=20
> starting the next job [1]. This made me realize that the driver allows=
=20
> changing the controls while streaming, which my change to move the=20
> command buffer setup to streamon breaks (as a potential rotation isn't=
=20
> updated until the next streamon).
>=20
> This commit is the result of trying to not break the old behavior by=20
> moving the relevant code parts to be run on every frame instead of being=
=20
> only run at streamon. I didn't think about the 90 degree rotation=20
> problems, which are also present in the current RGA state.
>=20
> sashiko.dev also pointed out that my simple code move didn't work for=20
> the mirroring case [2], as the relevant command buffer is ore'd with the=
=20
> mirroring flags. Also I've noticed that the rotation mode affects the=20
> scaling factor. To avoid these footguns, I've got the idea to set a flag=
=20
> to raise when the controls change. Then I can fully re-initialize the=20
> command buffer on the next frame and fully avoid these kind of problems.

Thanks for the update, thanks for looking into that.

>=20
>=20
> [1]=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/media/platform/rockchip/rga/rga.c?id=3D50897c955902c93ae71c38698abb9=
10525ebdc89#n41
>=20
> [2]=20
> https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40peng=
utronix.de?part=3D16
>=20
> >=20
> > To stick with the spec, the capture format needs to be updated, and it =
needs to
> > happen in a way user can be able to read it back for the correct frame =
if
> > userspace make use of the queues. I see 3 options, let me know what you=
 think,
> > or what is later implemented if you already thought about that.
> >=20
> > 1. Synchronously update the capture format width/height, document in th=
e
> > respective control this behaviour, leaving to userspace to remember whi=
ch frames
> > the change will apply to.
> >=20
> > This works nicely for this type of HW, but would be a bit complicated f=
or a
> > deinterlacer, since the buffering might be HW specific. It also make us=
age of
> > queues harder, less independent.
> >=20
> > 2. Force a drain/stop/start for any 90 degree rotation
> >=20
> > This might impose a longer idle time for the converter core, and is kin=
d of
> > opposite of your commit message. But requires no spec work.
> >=20
> > 3. Emit SRC_CH, implement the drain procedure typical to decoder resolu=
tion
> > change.
> >=20
> > Typically it means userspace can keep buffering on the OUTPUT queue, an=
d once
> > the LAST buffer is met, it can simply read the new format (and new stri=
de, since
> > due to alignment, this might be hardware specific) and toggle streamoff=
/on only
> > on capture queue to reactivate the processing.
> >=20
> > The 3. is more complex for the driver, but its a proven race-free metho=
d for
> > decoders already. 2 would be statusquo to get this series in, and we co=
uld post-
> > poned more advance work for seamless 90degree rorations. 1., I don't re=
ally like
> > that solution, it not quite generic enough.
>=20
> I'll go with option 2 for now to keep it simple and improve the status=
=20
> quo a bit.

Works for me.

Nicolas

>=20
> Sincerely
> =C2=A0=C2=A0 =C2=A0 Sven
>=20
> > feedback welcome,
> > Nicolas
> >=20
> > > ---
> > > =C2=A0=C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 57 +++++++=
++++++++++-----------
> > > =C2=A0=C2=A01 file changed, 34 insertions(+), 23 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/m=
edia/platform/rockchip/rga/rga-hw.c
> > > index dac3cb6aa17d3..6c1956b04f6ba 100644
> > > --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> > > +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> > > @@ -156,7 +156,38 @@ static void rga_cmd_set_dst_addr(struct rga_ctx =
*ctx, dma_addr_t dma_addr)
> > > =C2=A0=C2=A0	dest[reg >> 2] |=3D 0x7 << 8;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
> > > +static void rga_cmd_set_flip_rotate_info(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *dest =3D ctx->cmdbuf_virt;
> > > +	union rga_src_info src_info;
> > > +
> > > +	src_info.val =3D dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2];
> > > +
> > > +	if (ctx->vflip)
> > > +		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_X;
> > > +
> > > +	if (ctx->hflip)
> > > +		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_Y;
> > > +
> > > +	switch (ctx->rotate) {
> > > +	case 90:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_90_DEGREE;
> > > +		break;
> > > +	case 180:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_180_DEGREE;
> > > +		break;
> > > +	case 270:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_270_DEGREE;
> > > +		break;
> > > +	default:
> > > +		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_0_DEGREE;
> > > +		break;
> > > +	}
> > > +
> > > +	dest[(RGA_SRC_INFO - RGA_MODE_BASE_REG) >> 2] =3D src_info.val;
> > > +}
> > > +
> > > +static void rga_cmd_set_format_scale_info(struct rga_ctx *ctx)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> > > =C2=A0=C2=A0	u32 *dest =3D ctx->cmdbuf_virt;
> > > @@ -219,27 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ct=
x *ctx)
> > > =C2=A0=C2=A0		}
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	if (ctx->vflip)
> > > -		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_X;
> > > -
> > > -	if (ctx->hflip)
> > > -		src_info.data.mir_mode |=3D RGA_SRC_MIRR_MODE_Y;
> > > -
> > > -	switch (ctx->rotate) {
> > > -	case 90:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_90_DEGREE;
> > > -		break;
> > > -	case 180:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_180_DEGREE;
> > > -		break;
> > > -	case 270:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_270_DEGREE;
> > > -		break;
> > > -	default:
> > > -		src_info.data.rot_mode =3D RGA_SRC_ROT_MODE_0_DEGREE;
> > > -		break;
> > > -	}
> > > -
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * Calculate the up/down scaling mode/factor.
> > > =C2=A0=C2=A0	 *
> > > @@ -431,7 +441,8 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> > > =C2=A0=20
> > > =C2=A0=C2=A0	rga_cmd_set_src_info(ctx, &src->offset);
> > > =C2=A0=C2=A0	rga_cmd_set_dst_info(ctx, &dst->offset);
> > > -	rga_cmd_set_trans_info(ctx);
> > > +	rga_cmd_set_format_scale_info(ctx);
> > > +	rga_cmd_set_flip_rotate_info(ctx);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	rga_write(rga, RGA_CMD_BASE, ctx->cmdbuf_phy);
> > > =C2=A0=20

--=-Hb+ed2d1W1UpJMfZXIXO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagM2AwAKCRDZQZRRKWBy
9MamAQCg9e/Ky0+zC2Z8lfiVls39juZyDf++dO5vz2Rw3IxBCgD+MDZjn42S+QzA
DS03AmFWK0jBnfunAQURY5X9xMeNrQo=
=BRHu
-----END PGP SIGNATURE-----

--=-Hb+ed2d1W1UpJMfZXIXO--

