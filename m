Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1CED116FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0PSVgMbPgZnF/0MjPtEhWWUYOjFqFjkifaKlO/6NJE=; b=aNWjD0mvrCFyM/9bQHeA+YdAg5
	w9IK/9m0M9TWmOOeAsFc812/Y+/8IRx9OfSDmig1aCHBDihe/A5pQMpwGTy5YfpYw6M+0RzVuNMKP
	plYFtpNX5uEux9uLbUtQ+Tql1X5tFZVKpfZXGhROeHTOxcbl7y7ct2Cwq3PgNg/FR4fOlALc6sKS3
	3KRgHTD6HYcCXHxrKfEbRjeN125cSf2vFECIq1UNQw1kGW86yIGOHXtTDiRPKEFcIFaHuRT3wpTNR
	H2TrXzf4kykWZY0LUGJE5zrKy59eFZCMM3USJrzZgWv1ZwKM0intlJcpODTp+baEgvK6xRzIdPieY
	Ismvij2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWsd-00000005nGT-2jtb;
	Tue, 02 Dec 2025 20:21:47 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQWsb-00000005nG8-2JTA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 20:21:47 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8b1f2fbaed7so532654385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 12:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764706904; x=1765311704; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A0PSVgMbPgZnF/0MjPtEhWWUYOjFqFjkifaKlO/6NJE=;
        b=otoW9vgaR3JUySPQc4QSpt5KRyCLcDt7g8zC3xtbKwg1EOXmjO7f/3MdqdgKmBrW/w
         fh16n8CAyZI/KZyS//wze20Xn0ZZ3HyeRrnwLKlSIheCclmUwzh9guWDOXgdZd5N8fXJ
         QFN+yBDOuFzkgc3XCQnXAFM+/U5rbFEJDWDyPhcEdp6YZSG4ZAYTOE4OKrWdsZFehqF1
         kOipBYoYU3UdVh7HzEMAMNgyagS9ZdKyMYwNoCp/9z2n2ZN7ym/Pn9dnjvlb2cFUpRRh
         T6D2LpwBbZm1toT0ETtaB+OEuNZGWVkbb+1Vh5HdCBzw7Mn6pbYgYuwLKi5Me0Jm+aDl
         S4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764706904; x=1765311704;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0PSVgMbPgZnF/0MjPtEhWWUYOjFqFjkifaKlO/6NJE=;
        b=cUW7z9D8UYKd7MXtnHMIjVBqDRbU0LomiRWi1IpT8GjiXeBPCeoqJn9jswzVzEaCjX
         Jxh0i4LPgpjizWpUaltL4WFacKjtrFtCa2L3v6Md5LETl94GFOEM+KfzO0B2lZlIJsgZ
         RVIzGWMBzt5/kFCaCW/Sd+B0F43h2ed4HUaMG55KXwbHdyzry1nU5NExCqtVm2Zy+L2n
         Fy9QLFCRv2v8FUp5DUp4YqQzON/2b9LvsiZueCf5vqWiFySjhKxFrtDBv4XB1W28tL/R
         jVDBZX8L7sqVgK8WncPbfof/NG9ZiROY7oS1swrQ2Zjm90MXEr3g2xet3ZvCJzmyXoNV
         ftJg==
X-Forwarded-Encrypted: i=1; AJvYcCXA7FL9LztLjnuyCHNChEKdysmwbKE6j408Yp0Gzl0bfgLEjR8S4dQ9edxR/zTzC6OzHeh770b6wsCa5pqEVdaO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvon0/0TmZ9h0v1nx67mXPKs5Ts7LO8k5uB6aQqNFmQo5Ql9DI
	tWzMzq0EAhjDtagY52zGwKe6lSt9Ml2hbhY4eJjrq0+Dj+Ui/QsneObflfoEHFvL2ZU=
X-Gm-Gg: ASbGncseWz3Bp2FtF0RHIaV9AiJbp5YK3wba4FFELFQ5CMpY1ULLbmWrQM7o7fsfEj0
	bdSQBW+QKcU3+jGUjIpKpBBzhp+hEEZka9sfPYOcLDeK61NnFEuf9M5oprgpZ2rFTOS40H2L8el
	9c5/qSz+NnDgfRRNsNhdS+g0kwoZQ9edhbQoxCZX/XSUB9510IILgMYBasrvr6g4Q+VcPIBaDLp
	tpaZ6NtUlQg58Td9liOMCAbI+9pxINkHMtqNad5op20YcvVOV5P9JaVc68QCAcVodWSKOCnphXo
	tHyN2GnvkfhXDNqOLIPX8ID6vD5W2fMblXPKIi+IbKD0ExLO041OBwy1Mtnwre7Q0solclzRfVB
	17y+YxY8L541qSrvMAqTGic+J3vcY/Y1yJW3K1PQtF2whfW/cLfR6cadkenhJTO7Jv+Y3F/zi34
	L/i+zFG1lRsLZkr+CR
X-Google-Smtp-Source: AGHT+IGB/lTPqo8FUB1K8vcEzaAXKNJ3jkLu9HLwdfEC+eATOB31NhxyLoJxF149M0NnfHLXi/G67A==
X-Received: by 2002:a05:620a:1a9b:b0:89f:1204:504a with SMTP id af79cd13be357-8b5d2f12a5fmr116472585a.57.1764706903517;
        Tue, 02 Dec 2025 12:21:43 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b52a1b74f3sm1140019585a.26.2025.12.02.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:21:42 -0800 (PST)
Message-ID: <570d444a92b0e49a11379cabc8f7f838e5228f7a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 ulf.hansson@linaro.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	linux-imx@nxp.com, l.stach@pengutronix.de,
 Frank.li@nxp.com, peng.fan@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 02 Dec 2025 15:21:40 -0500
In-Reply-To: <64ad3d66-4edf-4a0b-8992-0db0e90a32b0@oss.nxp.com>
References: <20251128025117.535-1-ming.qian@oss.nxp.com>
	 <20251128025117.535-2-ming.qian@oss.nxp.com>
	 <46e9a5a881946d879d1b2af3421d574b26256ae3.camel@ndufresne.ca>
	 <64ad3d66-4edf-4a0b-8992-0db0e90a32b0@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-fFM28PG+mNKcm637EtVe"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_122145_848061_84E76905 
X-CRM114-Status: GOOD (  17.96  )
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


--=-fFM28PG+mNKcm637EtVe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

Le lundi 01 d=C3=A9cembre 2025 =C3=A0 09:52 +0800, Ming Qian(OSS) a =C3=A9c=
rit=C2=A0:
> > Then instead of this, I would like to add a kref to v4l2_m2m_dec, I che=
cked
> > already and this is both safe and backward compatible.
> >=20
> > Then in the get function, you will walk over the compatible that are
> > different
> > from the currently probe node. If you find one that is initialized, you=
 will
> > call v4l2_m2m_get() to obtained a shared reference. In _remove() you wi=
ll
> > simply
> > do v4l2_m2m_put() instead of v4l2_m2m_release().
> >=20
> > Hope the others are happy with this. For Hantro drivers, this will make=
 it a
> > much more powerfull mechanism.
> >=20
> > Nicolas
> >=20
>=20
> For v4l2_m2m_get() and v4l2_m2m_put(), do you mean defining these two
> functions in v4l2 m2m, instead of just adding them in the hantro driver?

my idea was to add a kref to be able to share v4l2_m2m_dev. One thing I not=
ice
is that its the v4l2_m2m dev that creates the media controller on all other
drivers. Note sure why Hantro does it own still, maybe it predates, maybe i=
ts
something else.

Its quite weirdly glued together, since the v4l2_m2m_release() function jus=
t
happily free the m2m_dev without even trying to cleanup the media controlle=
r. It
totally orthogonal to the job queue, maybe it shouldn't be there.

I'll make an RFC for the kref anyway, if that has a change, I'll try and sp=
lit
out the v4l2_m2m_mc_dev on it own, so driver can share a m2m and use the
helpers.

Nicolas


--=-fFM28PG+mNKcm637EtVe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaS9KVAAKCRDZQZRRKWBy
9FwpAQCE8mMTD4iXjzvjVTfRBA1nQ1p6o6DmW7kVwZdUjhgwmAD/ZZDhUJ/ZxJ5m
bTyOTlRWmN/+KTAIgA9It8hO1jE00g0=
=pT2D
-----END PGP SIGNATURE-----

--=-fFM28PG+mNKcm637EtVe--

