Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDABD4922B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyeG1aaBmjIsbSJSGnDiC/7VWBoOGFG2ysO80tTCQDY=; b=EoySAuk35Iw/jbGn7x6PbJO+re
	G3XwQ091svwlhGWzKGb1ocMdlsGuKpQOpoivmuPBKvgPwatgB5I1HXTI17orld5PjRHILhUK/jsmr
	tM+NvcHLd2VApqiy3i94sR01FXC5iSWfvTupOjWqscL2Q2rz2xbXBlFZSaPDudhqFy3u8lSZPdrih
	M+6ehls2sJTVmaVs+MtKpVkbK1du+TP8/vLUTfUHTwQR0elRA4WS1jMa1ewHB2w/fSnG5OjWljHhB
	a7lmD15l8rUaI6bik86THVkqxV61D2s82mvs0y3bcdW9Xw0lF/lvvPS7+PG0OfS6HmXW/LpBkncmR
	E0nfHKHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3Yb-00000000aXb-226a;
	Fri, 12 Dec 2025 13:51:41 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU3YY-00000000aWi-3Xkf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 13:51:40 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4ee2293e6a2so10104641cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 05:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765547497; x=1766152297; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pyeG1aaBmjIsbSJSGnDiC/7VWBoOGFG2ysO80tTCQDY=;
        b=qVIBfqWdQ0ch4LQtj1936HXeWO46pqW+9t04rDIMOCGulHx9T/ARzkw5N/4hoZn/iL
         FqSnj0NkVka3DVEWXcKo5MhasNdmSMTuNtMnytlWzfNbp+a348CTogAW4AYZ6Sp9VU1T
         8xsIUsAOQUrKh+OJep/nGKzXjy7kn5JMrjR2PxQ3NWwNP0oY4wJe21cJaDoDFUGFVr05
         aOFS4RvFFgMucsJxhhNr/mO2ahlmqui8XQQ0NPMPENgzBaGNGrFFsz8HSHqTxeGl8aq8
         qvJ5jiFpEFbWb/Ducbng0QLdtnmy1onaiXJihEt9CyiPQujyS1rvAPO5PEz7RR7Wmaw8
         xjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765547497; x=1766152297;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyeG1aaBmjIsbSJSGnDiC/7VWBoOGFG2ysO80tTCQDY=;
        b=A4tJld28VqPATA6UFo1DU0ggm36ipUUePrddAFgU6YDay4VZSrHHRO0XHNZpyFxNAO
         iM5fpP08rYvmVnykHxSKB2TejKwzIuakUEFYN+0Q/NYx1eb3BzVf6hZWNrUCeFByiVD2
         NYd/lHJp4IfrAw79l/NlQEn08KHXp23uBF72JZQom8fqYrIziEFmsAVe2rfxYYzAgy6Q
         49IwqBr0kyLQx/zweM2ax4lkdDyKGdjPp0ioItlgcAcCrn2rFLsy9jcj7AQ5SRI+cNkf
         4R+5IoPEN8ktyz2sU8/FUnVeqVHOj86yxO2nMdckrnBjtbrtxnsL/aA4rdJQEfUjjSv/
         uR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDJZ07ZPryD3G5/kmuseGv+OYlGwJXjX7JeTYPm2VT6QX5SGWz7UYgRmwWmJ8BlOkuvSFQ8rNRwvfIN+0PufvZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwE1g0++CDJPtBGB0vdKHYD8xb6l1wPy25X9qQ9xryAl3X1PGpK
	OmuZaE66v722mxAjWQV3NNvpcyeiMDG5GBfJVaNEiNG4Q/Bm0MNSGFS1fw8cJlr04NQ=
X-Gm-Gg: AY/fxX4wzXOEZhqfHiV7wNxeK1miR8lhe+Ff0UdLRm6phjPrZg4ySvhiMZ8oYP89GFf
	hHU1SOOL09nHwi98ih55FIZeZxBMHNQprPuE4YH061rhrAPR+msp9FXaRFBuEmca60Rm4r+CxR4
	nxuBta1sFQMtt6rxxw433AqSMycvKOvQu80iIOR8bVoye8b0q4X8kbdI6egqYhEgh0eZR881MMf
	f4XndUgZ85Do4Iyz8PAH9ph6SI6YnTPxMIRqVYdYKeii9iZ+gTi6Skmzuo0s1edui5lDGKQXNlz
	6Zb4rjCagUwQjoOqNI33enSUqDxZQ5q3hJGU3kPPSNLji7QL3DTKnqM9FRF5P+lJxDemm7ec3D8
	wLXVXEpXbULBAQ4UpaWizdFYXbdIyJCUxEWdfUjbJmrnP/fDHVEK8qDsYeIWVs7o0L1XF+8jD87
	Bvpn+8p7rYCPmcGmlOnDuKTrwkAyg=
X-Google-Smtp-Source: AGHT+IHOkKb+3eSuMU1jIt6RCvyh1vdcJM+w+u1orn//OYXAV7AakHlaboTbBmbDNMSQrgTNuXT/UA==
X-Received: by 2002:a05:622a:1cc8:b0:4ed:1948:a8a2 with SMTP id d75a77b69052e-4f1d05d37e6mr21517091cf.40.1765547497476;
        Fri, 12 Dec 2025 05:51:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab566610esm462733885a.16.2025.12.12.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 05:51:36 -0800 (PST)
Message-ID: <f9c113914290a0701614c64b5e2167d4b3e21646.camel@ndufresne.ca>
Subject: Re: [PATCH RFC v2 2/3] decoder: Add V4L2 stateless H.264 decoder
 driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Zhentao Guo <zhentao.guo@amlogic.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Date: Fri, 12 Dec 2025 08:51:34 -0500
In-Reply-To: <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
	 <20251124-b4-s4-vdec-upstream-v2-2-bdbbce3f11a6@amlogic.com>
	 <9b74086ac938475328904960add2c284b81efd4a.camel@ndufresne.ca>
	 <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
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
	protocol="application/pgp-signature"; boundary="=-Wz8tqIBY8tBmEXzhqord"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_055139_123057_0DF6AF71 
X-CRM114-Status: GOOD (  10.56  )
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


--=-Wz8tqIBY8tBmEXzhqord
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 d=C3=A9cembre 2025 =C3=A0 12:11 +0800, Zhentao Guo a =C3=A9c=
rit=C2=A0:
> > strcpy() would be the preferred helper for this, no need to fill the le=
ading
> > zero liek this, see include/linux/string.h
> Ok, it should be more suitable to use strcpy.

I have to correct myself, I meant to suggest strscpy(dst, src, size). Passi=
ng
the size for safety seems important, and unlike strncpy() it takes care of =
the
leading zero.

Nicolas

--=-Wz8tqIBY8tBmEXzhqord
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTwd5gAKCRDZQZRRKWBy
9AjFAPwLCuzLrPMc5QeJwBH4HFnPXprZ9Z2Mkw/AdgWhkq6+PgD/XLQZRcEeKq08
r5vbLdvYkFjoVtCPaaat+b1CAdj1bAQ=
=ixRz
-----END PGP SIGNATURE-----

--=-Wz8tqIBY8tBmEXzhqord--

