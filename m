Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB004CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFC2NL6AC+2llQ+r3CsLm00vCsvAfiKwPzcatpgZERg=; b=QLj8yryI79HywrpDOFIKBJj5QA
	4EJCPXJILk1GOzpC+S2gszNchBauVpRy/xQo4IFqObPI7pXrbA37a+761wQecLZA4fwihvnDFm1Hb
	mv897jcHz+tXJMrlpVkTNAccEc8FCUi4FAR0+LdMiRJUsiirEUJ3XvgaVnsicq1xIdGMIKXpjXmWJ
	TkM4c+qndtOqfw0l/7H+xLotglPnVCwcU7lFZKDR/CIalEgzQ5ZWCWiQFJUpiNjwyvUAGrnZRbdIj
	jUFcNGeD8/upJEgvIudKq/3mnMt0lHQ9py5My6YPm40xw11S70mYE3idi0jq/lunl8jRDspQKGiUE
	P/wTYMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9o6-00000007BuV-2VYe;
	Sat, 30 Aug 2025 00:51:02 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Hj-00000006iDy-0q7n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 18:57:16 +0000
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b31201d331so10295221cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 11:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1756493831; x=1757098631; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PFC2NL6AC+2llQ+r3CsLm00vCsvAfiKwPzcatpgZERg=;
        b=WXMOEBInuXw5v083bgN2QchFptED3NlQhve/mgHPAlr+EWxBd5cIgPlxUDDxESZne5
         miS2hJP8SZ2jl0zBhkY+Y9SjZ7ndKsVQ/7FNxf3t3uyVN3qu1s9qDAnNPv3g0k+yNdOV
         4qSsXcrFkAgCkIjg0PUw2VKAm3Mfb3FBqTXt5nmUfEWJ4wEmg3z9J3USElt17Umr3STm
         oG2aWZ8dhB5+83IwYlN/eYGFiA+V7Xw43XS4wc9ww4Z65BU4I5VZXq6b3YIcwJ2as8nx
         yZjqXmwX6YIdkNpt2ynkXBa7ZQWAQrgJ+FaJMrNgf8+oyos0/+Tqjn/ugBE6WS5XBLLT
         sPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756493831; x=1757098631;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFC2NL6AC+2llQ+r3CsLm00vCsvAfiKwPzcatpgZERg=;
        b=iP6tSzX57K5MzAR9rP6bSn/4ijwOf/0h1Nyyt1U1IV4pF8K5I2tMBJfB3fvpx6dBee
         WBeOgXiaCgT2NXZ8O1pwfHYG4T0IuiW8gs5hCUXA28TVt7I/910KXSI2gZMrIE10xNTG
         v30Cpn9wrZFjbc5YctgnXBZN8cQbkTsOvfrure9/2VzabzKQX8qssuxCbRBBnasUcIqR
         MinzDlkZ6o4IUhgae9g4LFvFloDxWde0Myir/hVZln5BTcPV0XVTxNJ5Ekzl55729cgv
         LFTkU3JqTr7CVneEizl8H5V+lukQCpo518zRf/seXbMNXc8paNOUUALS16ap/c+bpxf2
         NW9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4AFOy2/rH+043QdxMltLS+wIhGsmN2coUxDgvVoaVaElPby9e3N7rvjtaKVQXluTWnIJLZEKgLsBJJtQyf2ha@lists.infradead.org
X-Gm-Message-State: AOJu0YxA5eKWkYb/7GYEYBTdF5+1ariPECnSWIJjpDh0w1iguVOINiAi
	mWFKFcqYRz5YzdihpZmLJdrNVkC19p2OF/aRUjHUlBLJlv5nKcAAJ7GOUEBt3ilWG9Q=
X-Gm-Gg: ASbGnctFUavlzaeKpeAfQHhTOi6DGoh8XtfDy9Knx2s4t8FIi6URCN/+vm8VVYx9xSG
	rILnZE1YUKD3OSQEIlntjs2kAvwzVKuw4Ebr0qaQso/nzamHys7Nkj5SpDQLPH1cy/Mdy0qiFdn
	TFzWFB/2RU54wIBhvs4blkHdLCNhKzxWU7QmeSCva/bYzqZ+RNMDt2w/D+lErKgfZXVxCaPbE+v
	c9B1cMzhrNMx4KkNb+05/Qkw0gNX7F51ltJM2jlg4USAmXBL1tVbJ+M9fZGpBHJYrPr2k0AoK3V
	xRDYupc/xQ5qOI0/YkYa2r0xw89dCiJs36IMY9TpYqpknFX7Rgg5ZBQRM8L57RHWKwWL/+JfPCg
	vUWMqVASX2BLR7GLUGp0o7xUSjaYdcQgMsRWIpw==
X-Google-Smtp-Source: AGHT+IEakG3NbMasM6aByEap0RqPpWldsk82o+ZXf4RsU/WtslwCKO+NvxDoyc6q/jsSGSs3V1VMHw==
X-Received: by 2002:a05:622a:1392:b0:4b3:8ee:5220 with SMTP id d75a77b69052e-4b31b9bdf58mr2380151cf.29.1756493829825;
        Fri, 29 Aug 2025 11:57:09 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:5a76::5ac? ([2606:6d00:11:5a76::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e624cef74sm20958356d6.46.2025.08.29.11.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 11:57:09 -0700 (PDT)
Message-ID: <44aa36a8aaa7da22a4552b910ceb966b3a911691.camel@ndufresne.ca>
Subject: Re: media: mediatek: vcodec: use = { } instead of memset()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Markus Elfring <Markus.Elfring@web.de>, Qianfeng Rong
	 <rongqianfeng@vivo.com>, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Andrzej Pietrasiewicz
 <andrzejtp2010@gmail.com>,  Angelo Gioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei
 Dong	 <yunfei.dong@mediatek.com>
Date: Fri, 29 Aug 2025 14:57:07 -0400
In-Reply-To: <887bfbac-0e16-491b-ab0b-a0997890ff2d@web.de>
References: <20250803135514.118892-1-rongqianfeng@vivo.com>
	 <9f0b868c-47f9-4c98-ac99-86bfbc6a432d@web.de>
	 <e3903e95-3659-4d68-86ef-0f3d6b2c8d90@vivo.com>
	 <887bfbac-0e16-491b-ab0b-a0997890ff2d@web.de>
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
	protocol="application/pgp-signature"; boundary="=-x2bNKOcY/JOmIuS4+i3d"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_115715_237245_CA99388E 
X-CRM114-Status: GOOD (  14.02  )
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


--=-x2bNKOcY/JOmIuS4+i3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 05 ao=C3=BBt 2025 =C3=A0 15:32 +0200, Markus Elfring a =C3=A9crit=
=C2=A0:
> > > =E2=80=A6
> > > > This patch converts =E2=80=A6
> > > See also once more:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/process/submitting-patches.rst?h=3Dv6.16#n94
> > I don't think your point is a problem here. =E2=80=A6
>=20
> Will any contributors care more for the usage of imperative mood
> also according to improved change descriptions?

Markus, its the way you review that does not work. I'm far from perfect, so=
 I
don't normally give any lesson, but I've seen this this exact interaction t=
oo
often. Try suggesting a rephrase instead.

Qianfeng Rong, the suggestion is that:

   This patch converts memset() to =3D { }, thereby:
  =20
Can be rephrased:

   Converts memset() to =3D { }, thereby:

Also, some maintainers may prefer if you swap the two paraphs, so you get t=
o the
point first, and give context in the remaining. Processing tones of patches=
 is
improved if you don't have to read the entire message to understand what th=
e
patch is doing at high level.

regards,
Nicolas

--=-x2bNKOcY/JOmIuS4+i3d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaLH4BAAKCRDZQZRRKWBy
9IVHAP9J86Ojzz3i7bMsDJIB6kLBlO2gUdhSv1G3ByosVTrY6AD/VI6IENrCxFJa
n/fABRYAp3ytH2Ai4BiJS1KJLHLVLAw=
=ECGR
-----END PGP SIGNATURE-----

--=-x2bNKOcY/JOmIuS4+i3d--

