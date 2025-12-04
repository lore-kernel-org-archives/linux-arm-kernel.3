Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AA0D29F88
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 18:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkN5ne6AGy4deatrHlfFV2w9dbwRa7Sv7MYr8Yqmbic=; b=ckiPfj6axy5FbawSZUx7rbRtHo
	xmV5ZDJDDrJBG8lJkFJz8BOoEdNudOoYZ1BG5HFe30Io2jQcWzcDOtq0o6QeHacYCe/5Eat/OHY/k
	SLq46cQ3ovUxi2+jCG4lcPtbrvrG7AvRDZXWb8gYvh1dU01/FeqmCBnyn/uxzpnz9ypDANdjqET4i
	E7IZT5QEdb2kTKTkHnDtd2c5V/QlPR22YgDxnZwq1pnjpFPW9ppQFZvPUqrXJyrVf1w2JGpQ0LP03
	mAFV3JnUYdt8Xn00bxy8d6HpzABVcusET+/sMfK+CCAw4kn8rlioOKtIxHzITWq0snNFQdak1pnZs
	Up5/uSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDrj-00000008Qcx-26zf;
	Thu, 04 Dec 2025 18:15:43 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDrg-00000008QcW-28PB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 18:15:41 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8b2d7c38352so256184185a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764872139; x=1765476939; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CkN5ne6AGy4deatrHlfFV2w9dbwRa7Sv7MYr8Yqmbic=;
        b=lQdSM9NRnplFlKNjxn0FKUtFJYGITqYAm5lEL9DKmT9Vbb5YSN9c5ZybOIGcbW79zu
         7JPZKmlbWECeCF974uVRYz6uaKWY4NPkrxU9hFIB/KUKg32gFnw3WOCMt9qv8WrgNT5H
         21OlVoWXaFRwl+SFkrpNfc1/CDvjsA/RxAzs5obJvIdKcSrWd9KJCYQ3mZXTr2qp1faG
         aqO3w/KvbyXDolaY68X06NntVP9xUszql5D9rX8keWdwkDH915AGUeAziJmJbjiciia2
         1anFZrJoeAeS6Vwa7uwmQ6nKbIOnIaUcgyr82WK7i1+SEV30gck5VP7O0br+LQX7cEDR
         igzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764872139; x=1765476939;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkN5ne6AGy4deatrHlfFV2w9dbwRa7Sv7MYr8Yqmbic=;
        b=sM1ZwGeZ9p3OOY4wVHF3kz5bczdHeTMH+h3pseNU+a1wRNWxcIdxfXcKKDUA7zATXa
         yZwdwGf4bpTZzMgC8TccVl74Kg0vYxwHSbHYRPJboiQg542F/2O7M8A4qQ46/MnlxNps
         5mRj7aaRx/AzX4Lu/9Du1SRn8BCWEjWTstazY372uCVPsYJaoyPn1AHmm1xn7V/N/6gz
         vJu6PWbAAg18dtIetW1EB8Z7OgzLcgfMFQhmqIODJgg2zycBKqN7Rf+GH9Eg+hFsRyVe
         fK/OPzmZycTUiPu21yQRMZ5MqIsItaBAAynEUV+UahP/D7phugWbXL6to9rsIPMv6UkQ
         UmuA==
X-Forwarded-Encrypted: i=1; AJvYcCWMQGhjAsjOm3afXAM68SxOqyVkZACt6DL6Ri45YL8ajAYCpLdtwMWzTmmmCG7KuLyLq9cPqrTU8yuyPRuiizk6@lists.infradead.org
X-Gm-Message-State: AOJu0YxyfJnLIm2VGtRQ9IefNnUlw6m6GapayVrGfw26L6YDVTGj4Q4R
	X5HH5ZF0ZeQ136I459n8UvsrHEp9r2dNTi01UfaBwfjPp0yrawbqhuhi68QyMXjWmwI=
X-Gm-Gg: ASbGncu8qvyaDk/NEnWYcJ3oi+rKph17aDCzlF+BlPkuO4MQA8P2rrCfBaGml1QDOYc
	fRXt9Cfy5SBVcuDrGL5+HwyFik+MqPGjls9v5SOXPNIcKNU/amxZ0feR4YvLGt3odO7CRAM8yHs
	SKGgOEb6eKZDnTMhBgtBanvflBLdaDsXiq2yEq+R9C45vTO4npZufX5J2v5IRn+jMzoJxdvWzUo
	IwthQ9D0bc0vv/8PA7vgxs0TkO8VlPi6KzlarnpFA70AkHDKpOuanR/U54HcEjrrqukY8voDUto
	TEUy9JdIUpb08G6gTdjibSORRw26tq4GOxno5DE7HZR3YzHMtqa9fKu6xB10gJkg+W5MFIsHCaw
	TNfwz9HcXhETXKHy+tGAjt7nZyifOE5rAdcdzKhDS62Z511hz9VDWLUTUbBt+yQa/sjz49cy/XY
	c+KDC5JtCTmhcr7cVs
X-Google-Smtp-Source: AGHT+IE+HIR9s2e4UjyUeKhqtKhe1QpzEqyfDz+DTdQCgsuNTjBVcFH9SGVc4xBEqazvmpc5ECJjgg==
X-Received: by 2002:a05:620a:40c4:b0:8b2:9b48:605e with SMTP id af79cd13be357-8b61608ba80mr567564285a.38.1764872138834;
        Thu, 04 Dec 2025 10:15:38 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b6252b2855sm186512885a.13.2025.12.04.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 10:15:37 -0800 (PST)
Message-ID: <9f38bda2f1753645a1ae392ce5364ea0165fdc01.camel@ndufresne.ca>
Subject: Re: [PATCH v3 3/3] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 p.zabel@pengutronix.de, 	sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, 	s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, 	linux-imx@nxp.com,
 l.stach@pengutronix.de, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Dec 2025 13:15:35 -0500
In-Reply-To: <aTHGJzVKa7PbEifJ@lizhi-Precision-Tower-5810>
References: <20251204090813.595-1-ming.qian@oss.nxp.com>
	 <20251204090813.595-3-ming.qian@oss.nxp.com>
	 <aTHGJzVKa7PbEifJ@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="=-MBM9wOUi8PufoWyT5ryr"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_101540_794607_E5B05AD6 
X-CRM114-Status: GOOD (  11.14  )
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


--=-MBM9wOUi8PufoWyT5ryr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Le jeudi 04 d=C3=A9cembre 2025 =C3=A0 12:34 -0500, Frank Li a =C3=A9crit=C2=
=A0:
> > +static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_dev =
*vpu)
> > +{
> > +	struct device_node *node;
> > +	struct hantro_dev *shared_vpu;
> > +
> > +	if (!vpu->variant || !vpu->variant->shared_devices)
> > +		goto init_new_m2m_dev;
>=20
> I found only use shared_devices here, how to=C2=A0 ensure that g1 and g2 =
operate
> alternately by using shared_devices?

shared_devices is an array of of_device_id we match against. All the matchi=
ng
devices will share the same v4l2_m2m_dev (aka m2m scheduler). Typically, bo=
th
cores will be schedule as one. This achieve what alternate operations witho=
ut
active polling or blocking locks/mutex.

For this platform, we only matched against the compatible for simplicity, s=
ince
we know there is only one of each type. I've suggested this method to Ming,
since it will make it really easy to apply such a quirk if other hardware h=
ave
problems or design constraints.

regards,
Nicolas

--=-MBM9wOUi8PufoWyT5ryr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTHPyAAKCRDZQZRRKWBy
9FdpAP0WVi613vUGZXZ8B9/zghQmLePsDyJ2PS2cgoKj3hjSLwEAuoGzRC6WOtML
GYwvZvgMPtF3PhbqORxXKjZpwhicvwA=
=JuBF
-----END PGP SIGNATURE-----

--=-MBM9wOUi8PufoWyT5ryr--

