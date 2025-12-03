Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B422D15DBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 18:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WO7+BfFMbhtTQ5calPjfM/nfUWHGIG/6W+9CTiI6Usg=; b=NxnmOte7EYj6vWBwZ2cS0ujpHZ
	P/hryPrJHoLMa+sCVA2/Fr8eMtTFsVrFrhkiNaeXVDDED+NPnkivIl7+Z5T+fu4kf9YBT6f5Rwnor
	AseaIJU7J1wlvgHZ2cefaCqTY4f6wGmLM4GBe/KcXbboNTnpHyXzEEIp9dms4RK4H5B4LUxEYiunQ
	2iqyFyODFxgO6Ri8mkLM45JtH2FiIPgHsX+XGDdXOrBF6/PDB54WHYBuhPFyzvtUuTgDzg+LZI+4v
	U0c74ucppkg+QYVDbcTxtj8xnszGmSdDf25Il9foj6d5N5FyEBCYKvCi44LgHYT8MEMJebKc9jBMI
	QBJWZwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrQF-00000006vAF-45Ja;
	Wed, 03 Dec 2025 18:17:51 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrQC-00000006v9R-09S9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 18:17:50 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8b2a4b6876fso734485a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 10:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764785867; x=1765390667; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WO7+BfFMbhtTQ5calPjfM/nfUWHGIG/6W+9CTiI6Usg=;
        b=jw0FLbyz6S1iCDgpLRiV5swEwZhIw9vdMbwxy/AloUdnlLyFuBr5VSQ5SiPqlr4LHQ
         zy85kjfCnRtF5Dr4oMlzMMz3FllNQdji7WsOEcMqqoUHyRsXv1vnh531w8xoeTG0eZuz
         OqIWAqxt/yJRtvyFVQy/AYoRDwYAzss6pF+60Z+ajW9BiGid0ULIQkdPpPfzPtAHaEcg
         FWElLdhMfKKax0g8TYLOaUK6anfak0RTYflxxtfVMrxOhZ60TefLUyGEojtZt7IMUpys
         wIXn04yINrXSFzlgjDk8GFdW3fu8vQu46qETQpL+tI8VrOQFE06GK1pw011Klfbgg+X2
         wj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785867; x=1765390667;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WO7+BfFMbhtTQ5calPjfM/nfUWHGIG/6W+9CTiI6Usg=;
        b=grB5E8SrSsBD4KSVQW+nYpccJ5cwyROravNArTYoF5FC9Vb09J1ivGQi1dEQZs1+21
         Ovk1rtjbvCA3UQyma+mV4JR8Bx7R/Qr1LctGnxq2/rPcwqF9x6tEViLXkAtSOTj52/7M
         GakHqD5SD059VXs8tc9R7j2f+1Rg3KhuzKLibaZl6olwBpVokFY/rQuw7J2kDll2qVys
         Ra9xVe4WakyTNlYjomnzhaz4r3EZuJiC+wlnpusYRLftqyuh0Yp+1LcXui3i/r6GJ7KU
         xtXb4K15thgmdrOqvWXIVtjdyT89F62khM0t4Bi7/qCaTeSHRx8zYYEpXccF0onuNX9p
         qh3g==
X-Forwarded-Encrypted: i=1; AJvYcCUa623cr8hK4oUt4S8sqNvD+49kSw9sALSIXZOZ0kapfejtu/YazFG/xEpx/KQUpaXbIDSVreoCSywxYBDEChtf@lists.infradead.org
X-Gm-Message-State: AOJu0YyEcY7UtflOoTreCpgCgOjBkFPlQuA+Liz6b/3lwu/oPTfYV4GA
	6+NreT5ZQ6nW4uoW3nh2Ccr3eCuDps7DzkymAFOF7pW+NqbsBgIQrOcpNXrbnMjF9ck=
X-Gm-Gg: ASbGnct5SMjL5HTdKWlQLnKKw7LegRXdJg+56AEI7U7qpO7XptQ9vcBmD5vDDcW+mbU
	51/UasPKmsJ0EojXJyJZkdKZbK8uaGo7SFIxV38a+U+9zhvkNNRUEQFzOqaMiY88sHHDYcmtQgu
	lAHc899I5GcS00dkVTJW1BHgc9i35gFbmY09P4HkLCZUjTAxDqPnS90BSwrF4ay6kve093ByVgF
	eO5cFVmeYXCIOO2eJZ/IuSC4XwuH9f3L/V2PkeGjvw+uhythlZO6a62WF22yV9SoiP3j7C1k4d5
	gRsTFy054rQ3QQtwVBJkbQaEwBYB/Th/IlqHzdCC2IjasktzfD9xqquLkb/EJ9TzgY+HS46lQsX
	LeSL5f81u/EFpn9FW7nsGKUoVrLEa9Hjx6Ap7ZODqYS/OncmIGIlrm1fJhNtzNbVjKdi9uws/h+
	X3K3xf6w0it0OncocE
X-Google-Smtp-Source: AGHT+IEhv40xL383ENCwnfqVp2ktNmuefqqTYkr/UJMCMGa9G76Ic4Btltlz1SuLx7uvnnfNFOeUrA==
X-Received: by 2002:a05:620a:c54:b0:8b2:6a47:f5ff with SMTP id af79cd13be357-8b5e7453f59mr421706785a.86.1764785866599;
        Wed, 03 Dec 2025 10:17:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1dd3b6sm1352235885a.50.2025.12.03.10.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:17:45 -0800 (PST)
Message-ID: <f1938e17e04cfd1768f90b757813f9187b424505.camel@ndufresne.ca>
Subject: Re: [PATCH 16/16] media: rockchip: rga: add rga3 support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@pengutronix.de, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Date: Wed, 03 Dec 2025 13:17:44 -0500
In-Reply-To: <ccdcf1c3-4afd-45b7-92d0-c35a31be2188@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
	 <20251007-spu-rga3-v1-16-36ad85570402@pengutronix.de>
	 <cfe8d17416184f11a93e56872c30a6bcaf017ef5.camel@ndufresne.ca>
	 <ccdcf1c3-4afd-45b7-92d0-c35a31be2188@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-O46nnlDAIF/qqFenTBb5"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_101748_325945_6365BABE 
X-CRM114-Status: GOOD (  24.81  )
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


--=-O46nnlDAIF/qqFenTBb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 10:49 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> On 10/7/25 9:41 PM, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 07 octobre 2025 =C3=A0 10:32 +0200, Sven P=C3=BCschel a =C3=A9=
crit=C2=A0:
> >=20
> > > +}
> > > +
> > > +static void rga3_cmd_enable_win0(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> > > +	unsigned int reg;
> > > +
> > > +	reg =3D RGA3_WIN0_RD_CTRL - RGA3_FIRST_CMD_REG;
> > > +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WIN_ENABLE, 1);
> > > +}
> > > +
> > > +static void rga3_cmd_set_wr_format(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> > > +	const struct rga3_fmt *out =3D ctx->out.fmt;
> > > +	u8 wr_format;
> > > +	unsigned int reg;
> > > +
> > > +	if (out->semi_planar)
> > > +		wr_format =3D RGA3_RDWR_FORMAT_SEMI_PLANAR;
> > > +	else
> > > +		wr_format =3D RGA3_RDWR_FORMAT_INTERLEAVED;
> > > +
> > > +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> > > +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_PIC_FORMAT, out->hw_format)
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_YC_SWAP,=
 out->yc_swap)
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_RBUV_SWA=
P, out->rbuv_swap)
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 FIELD_PREP(RGA3_WR_FORMAT, =
wr_format);
> > > +}
> > > +
> > > +static void rga3_cmd_disable_wr_limitation(struct rga_ctx *ctx)
> > > +{
> > > +	u32 *cmd =3D ctx->rga->cmdbuf_virt;
> > > +	unsigned int reg;
> > > +
> > > +	/* Use the max value to avoid limiting the write speed */
> > > +	reg =3D RGA3_WR_CTRL - RGA3_FIRST_CMD_REG;
> > > +	cmd[reg >> 2] |=3D FIELD_PREP(RGA3_WR_SW_OUTSTANDING_MAX, 63);
> > No issue with the code, but quite an interesting feature. We did discus=
sed in
> > pas about using the target framerate (well frame duration in v4l2) to a=
void
> > bursting the memory.
>=20
> Do you have any links to these discussions or some actual implementation?

That likely happened during a media summit. Philippe Zabel might remember m=
ore.
I know for stateful encoders, you can already have two timing information, =
but
its all vague in my memory.

>=20
> =C2=A0From the API perspective I didn't really find the desired API to=
=20
> support this feature. While VIDIOC_S_PARM would allow setting an frame=
=20
> interval, the documentation doesn't really encompass this use case (as=
=20
> we won't configure the RGA3 depending on this nor drop frames if the=20
> RGA3 is too slow).
>=20
> Also limiting the potential burst size only seems practical, when it=20
> causes latency issues. Otherwise it should be more efficient to have big=
=20
> bursts (bandwidth and potentially even power consumption wise).

I have no issue with letting it to its maximum. The comment here simply
highlights it, but pretty much all other drivers will hardcore the maximum
working size and move on. In a second thought, if you multi-plex the RGA3 a=
 lot,
you don't want any slower use of it, since it may hang up on the core for
longer. So I'd say, unless we have problems, this is fine as it is.

>=20
> Sincerely
> =C2=A0=C2=A0 =C2=A0 Sven

[...]

cheers,
Nicolas

--=-O46nnlDAIF/qqFenTBb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTB+yAAKCRDZQZRRKWBy
9O9wAP4vK3/hFQMhn6LQeuouPwSbEOMHtv4m89+tlQ156SdFFQD+IbzJtlWm4CnT
1HlbYcGIvYOfmuM+UuiPeSwc538wrQs=
=u1fm
-----END PGP SIGNATURE-----

--=-O46nnlDAIF/qqFenTBb5--

