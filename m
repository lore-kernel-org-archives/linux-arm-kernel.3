Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D942F53D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChNwrvwut9AH8kQhXrPmezqcMvifV/XRrhrpWQpij9s=; b=tXaYNKiqXfrI0DW7BTqmlb2QQb
	Yc2LITJNUYdaZY9rupNaLZl12dN6jubhjTV1s9n3ez4361TFlx6C+WG89H3pVLUoYRYozuQQuiD3D
	VtHWUZtmfZRVdcoqhOAg1H2BgunF6k0zGhUg4rxsL46VAiD1pPOmNVQ1eTYlPJ1+FbQCvmPeKkkTh
	yLJRBh2Vg6DaTVUmFkXFjR9enPKHiDBx1w3Ny2CNr9U8a4FSiSdJf0oSzB7oYPXxHnpB55XMH4WyJ
	TuaRNZZ13q3PdNxlt9hWAJhw0HF2CPh6s3vbYFcYzObHF8AuHJB7fohxDlJ4FglvZp9yBVpT93wcC
	Y+iOGWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29pr-00000004Knw-0ekf;
	Mon, 16 Mar 2026 15:26:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29pp-00000004KnS-0gdP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 15:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ChNwrvwut9AH8kQhXrPmezqcMvifV/XRrhrpWQpij9s=; b=IBPJGLLtulvdVFy2sne6MabMRP
	b5wN9vzIwGemyxgBFEV2uCmNMMJfTyzTyn+0qhMI3xDyOzXih33LWhkhaiqD6zfNCQqpbtxwHipqL
	ycXiOu343iFWtAXVpEsJnYkGGrmCbQgcKVWRcYSiI+cNBLQvrghXiqvlwZNw7Jlu/TQu740tcl/sG
	A9P42EsxnpiVqkMfSmO/uybCQXKiCx3NXITUFXiMG62XabOweJB0GapYDKbrrhqop5voH5zm6XFna
	F9BHz3por/OV4zt9G/l91u6qT5vyobNbUhDyx+6SV4zc9qettZe5VCOTxONhgAo/kepD8LUOZ5Fq0
	f42uvWPw==;
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29pl-000000074jd-2vK0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 15:26:23 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-8cd751a4e93so274881285a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773674777; x=1774279577; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ChNwrvwut9AH8kQhXrPmezqcMvifV/XRrhrpWQpij9s=;
        b=1gexxWDFOOdLzrZJTgQmO5Dn/3egVk8arrjEHrP+a0iaIVNmF9ihB+eqhN6jxiB/26
         dlvv5wRNJqaNGpRbSgElk8w7AkE1JqPER7sXsrrZhPtm3pEzRMbCB0laGywBZet+PXjj
         ezgm1KaFhNDPGoXm8KwtOQ+bNllp2hmHeDh02iRwBlu47QBJ5JRGJXYu+/1dzB2dxpJm
         Xdmay6Tdm2iBNsc8BTN9Ljc91Sg3RHGpSEM3LQmfgqVQCQno7ovz+HTn2w/vy4kEMCF3
         bviOGpNWv425NncnAWvNVF+/8YpliD31aK9XBQgFeVfC/L3OanZXXZQXwCJWNQIxTgIx
         td6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674777; x=1774279577;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChNwrvwut9AH8kQhXrPmezqcMvifV/XRrhrpWQpij9s=;
        b=OFvCm/5PKibtNR7IWtg3aLgDR5h5oMNrNCKP+2pHGPAtC1y0nmtG19AefvvkDtG08e
         Eu9lmIcPPC8SX+zbsyDYWQFlkPa2Mj+Cg8/rDkJv4pot/rIgMsrBRKpQsWpNdHEu6F+2
         TB8VJbfdkOdQTf23SeQ+2hTWLXpbUV7QpDOr/krinV3A63bazGD5W2H6cDPJCKDjNWeF
         /lxQ4gl9x6Cr3tZVy4KnkaMzBqBCLMQJtWQ9vDIbCWIMMck5trLyEwrVz69Hpwhb7WaQ
         NqXeJPVBMMrfoaNLBEQHOxNDsLuibmlil3GwnbXmCLOduWymy4YVq5rQIiQCZLjEtT2C
         psTg==
X-Forwarded-Encrypted: i=1; AJvYcCVgzp0/KMSXbeT5UPhPfpIymrbK/v7bIwAsAxlUN/YDWhU0U2DAekERebrYTz129bGOl1ekhWqo56K7jINrwRP6@lists.infradead.org
X-Gm-Message-State: AOJu0YxLY9oNPQlPuRiNV0TAxcDYRE2fhpoY/SbN99ehS0gtgQ7ZWnAK
	QgO8tiKaKRwsbO+pM5dTNGzvw7+I0QVno5QTvnigwvzHf/3uz6Uo3iZotV99otS3eDY=
X-Gm-Gg: ATEYQzwJF/aXH54BALccFDV/5ml0cZncqJDzsDFcJBOIdVBqfe3KHG1Gn3AQxpjaHiy
	KgjpdwINPeOhChllnA/FCfVF9auPDELFMVozOQgNfHlH0z6CwYlrCC9bvR52Rmlw0s087EtNjv+
	rFeWi9X5J/jM/l2m0aD7KA8WZYBc45yvGz1B37lXz74OtZDLHk1t0gtgpjDh166vG570jox7n/O
	IEeBwfdUH8yxJrke5LnbXF3wShzbjl9dCadfox4xmFQUNSDnbp1U7Nd9CtzM8T3a1Tgs9h2yY7a
	AWuBpQ5gTo3dAhc/gHzLjFqatWgq0/L+VW6QKYRGh45POGeXWjxqnpOjrwVqxvdiyR7RrrCCg3Q
	hldb1QfuCkuC/r7mTh/XKpiC3renS5SKlVQ9kKeeuh3IW/S5133KrLaKBVXY+F/q+RiOz/1s89H
	o3+xyzkSf1AgxHkWhziWC9Ta3Oo0i7
X-Received: by 2002:a05:620a:170f:b0:8c9:e989:9d97 with SMTP id af79cd13be357-8cdb5b56e2fmr1651069785a.68.1773674776906;
        Mon, 16 Mar 2026 08:26:16 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fddfe8sm1228675185a.12.2026.03.16.08.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:26:15 -0700 (PDT)
Message-ID: <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, 	benjamin.gaignard@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, 	conor+dt@kernel.org,
 p.zabel@pengutronix.de, sebastian.fricke@collabora.com, 
	shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
 devicetree@vger.kernel.org, 	imx@lists.linux.dev, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev
Date: Mon, 16 Mar 2026 11:25:53 -0400
In-Reply-To: <20260312173349.GA137045@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
	 <20260312173349.GA137045@francesco-nb>
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
	protocol="application/pgp-signature"; boundary="=-6HvdHsM5JK0qWfzveRb3"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_152621_958688_A6EA0996 
X-CRM114-Status: GOOD (  18.55  )
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


--=-6HvdHsM5JK0qWfzveRb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 mars 2026 =C3=A0 18:34 +0100, Francesco Dolcini a =C3=A9crit=C2=
=A0:
> Hello,
>=20
> On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com=C2=A0wrot=
e:
> > From: Ming Qian <ming.qian@oss.nxp.com>
> >=20
> > Fix a kernel panic when probing the driver as a module:
> >=20
> > =C2=A0 Unable to handle kernel paging request at virtual address
> > =C2=A0 ffffd9c18eb05000
> > =C2=A0 of_find_matching_node_and_match+0x5c/0x1a0
> > =C2=A0 hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> >=20
> > The imx8mq_vpu_shared_resources array is referenced by variant
> > structures through their shared_devices field. When built as a
> > module, __initconst causes this data to be freed after module
> > init, but it's later accessed during probe, causing a page fault.
> >=20
> > The imx8mq_vpu_shared_resources is referenced from non-init code,
> > so keeping __initconst or __initconst_or_module here is wrong.
> >=20
> > Drop the __initconst annotation and let it live in the normal .rodata
> > section.
> >=20
> > A bug of __initconst called from regular non-init probe code
> > leading to bugs during probe deferrals or during unbind-bind cycles.
> >=20
> > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e6=
6@kernel.org/
> > Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> > Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia=
23b42rj3wlmpl67@rvkbuirx7kkp/
> > Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while deco=
ding H.264 and HEVC")
> > Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> > Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>=20
> What's the plan to merge this? It fixes a quite severe regression,
> a boot failure.

To be decided this week. The commit message does not say if it was released=
, or
came in RCs (and I didn't check myself yet). I'd say, if its the first one,=
 it
will go through next and backports, otherwise its is really tight to get th=
at
into the RC series, but serious enough. Please fill the gap if you have tim=
e,
and I'll handle it later, probably tomorrow.

Nicolas

--=-6HvdHsM5JK0qWfzveRb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabghAgAKCRDZQZRRKWBy
9NFwAP9sVkqCaBiBRpXCvZHE5Oa05+dzKFdWC5+h1oxIeJJ4dQD/VD/qrH1k6wW/
L9bxPFGmfGPNVwVSrJM7fk/6BwpNMg0=
=TFXY
-----END PGP SIGNATURE-----

--=-6HvdHsM5JK0qWfzveRb3--

