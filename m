Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72066C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFQ8QgaVc56ZWSK1ugpzWPCE6fH4oiEdiJ9FyYFmdnY=; b=bNlznPOBl7Oy7QzHVR2STSHy/R
	ViNLNyvydGL0EnaXG6DfAvQCMa5FYYMBXLvV9Vy9hd/Gw03sb1MkV3eCo1ZMDMHElp8DGjYD9AdcS
	gO7I5AtQw54fEYsPxm14vTFWU5lu5S9F+L3nZw0l+SrJf+5cAO5QZ32Ln9JrN4YUqvZ2SNDwhR2tS
	TWoBFm/BaTaiTa3Mtm9x4YS97U9HngrLjnRVo6xozCcCrlYhkSPYr4TgQhCEsmz5BRgeHIu9Zk6fw
	K++dswR1cIfrC/Jx1ZvPWorbtg3x7W2LruXzzXLI+1t3PL/6MIsM2+nfzKFou2x8e/Ysn8OwKj0e+
	7R9UxlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfD8f-0000000HPb8-19ui;
	Tue, 04 Feb 2025 07:14:29 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfD7I-0000000HPXi-0D8w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 07:13:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab737e78900so244496166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 23:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738653182; x=1739257982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JFQ8QgaVc56ZWSK1ugpzWPCE6fH4oiEdiJ9FyYFmdnY=;
        b=biNDGsb2AzC8VuqSPo1rwhkuqtd/aTd5cIJCDK+FmgJWCMOg69xhzXVdfYSxh2YO+V
         iM2JJmg7Y2SIO4sgJSLCUmRB7uUYsvZetQ3vrA6GDkr37bMoazsoLtVVWmvXaF+PCnO2
         O2lDrrSvYRUEK2fJY6RNAsNqrrygX6XSLtwfcRsaiJ/KWIFtpG78YzpHyu/HKubr3DCC
         k4oVCfjRBGEUEsy18mN6yGlqMKIT+2b7VCHIsDKR1iStuc3MtPW/wP6MSqY66NpLlbCH
         bDX0UZ1oIBN32bgzte4CJdZnGkfWz0bB/vl73w9ZN7QlFGWfrST/I8HWyKyd0tX0lGiv
         N4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738653182; x=1739257982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFQ8QgaVc56ZWSK1ugpzWPCE6fH4oiEdiJ9FyYFmdnY=;
        b=LkvvDPsEjdzTfAkqwx3a7OPwp7rOyV1qrBM35s2SZ7vIONk4lvulS/twRlJs1pQDdd
         UMNZWZQUJaCmI6ujyJBuTJQsjMuU9NynKfb7800Vr7Bp5CvIxxtxEp/yIeX2KRKLvcFF
         eB6QzIprGtu3gUCUcxtOpfJ5NkGpXUyKp26kS3n9nDFVLbiM53CIBlIGRtyDJjZ36f+F
         veCVQ5mJMwA2Rs2fhpnHOKxqrCnN/1LaXK8bpYihIa+TXQZ8/8LxQSij5hkooY/xS9XD
         nyfFtXUR51+9lW7QYyfKPNdPyxsz//AV2PIA63BJKOqapfSN/V4lRuLjtxfw6En5ZErg
         oq1g==
X-Forwarded-Encrypted: i=1; AJvYcCX5m46ykM9PXoQkxfn02B23j4J1h8QXDmpHjEYPLzccBovfLmxsqDRHdMF4XEaJzwXm1pKJidp3zoeiC0ei/yqy@lists.infradead.org
X-Gm-Message-State: AOJu0YzFn2t6mndIAPh13nrb77KJz2ylihyWnApu1il8+sHwS9yooAOj
	Am0Xt0bUSOUBvUAhgbWngfAcdchEmzoMz39NVFRpi5WkCjS5BddB4A2iBdvFsPY=
X-Gm-Gg: ASbGnctBQSgI69ZKzv4EExJ2goGxWWGN007tivhQglXQgxCoQN/+6Zx/mxZP4mkpVyv
	zuXS7lZmU9alrX4uWrCEEmx4c1XTjkU/BCIEnHdxhvWCR9huGNM5ba+apWNgF4aZ1Mg1kovVLoH
	hJJTpwjK7lPZmOls5potE5uid6X03P5/tNvX/51TJCTEIfBrxDqLZBEQf+UEUtq1LfsX8291y3l
	yFi9uKcdGIQEOwJ7SHieueJVPwsQ/iILFnFK7RfRvB0dqSA1Rx7MKJz/fkPdfo9wpaQJL4atuHM
	o2//61TR0TLo6kjz3ev2
X-Google-Smtp-Source: AGHT+IFoOvj0APUYqVIcX7Wv45PC/CJ7eVsrS5D9kApDpCu+Tt2rJbGbqowsoSxGkScrHKvOo9aWxg==
X-Received: by 2002:a17:906:dc8b:b0:ab2:b72e:cf44 with SMTP id a640c23a62f3a-ab6cfc8730fmr2899312066b.2.1738653182133;
        Mon, 03 Feb 2025 23:13:02 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e4ceasm8755845a12.21.2025.02.03.23.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:13:01 -0800 (PST)
Date: Tue, 4 Feb 2025 08:12:58 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <nq7bixxzabjkaa65icm2rh4ejumjm63tq3drqmvq27qdjrr5hy@cnean3edfbyq>
References: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
 <0cb54b0340ef021e309e49ca0de97809a8c8ee9c.1738600838.git.u.kleine-koenig@baylibre.com>
 <f3148bf2-952c-419d-9e83-b6c9f1d47d67@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wlj5wtagrjnpwtkb"
Content-Disposition: inline
In-Reply-To: <f3148bf2-952c-419d-9e83-b6c9f1d47d67@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_231304_246257_1BE5EFBE 
X-CRM114-Status: GOOD (  17.12  )
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


--wlj5wtagrjnpwtkb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
MIME-Version: 1.0

On Mon, Feb 03, 2025 at 06:39:09PM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 17:46, Uwe Kleine-K=F6nig wrote:
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	memory@0 {
> > +		/* 1 GiB */
> > +		device_type =3D "memory";
> > +		reg =3D <0x0 0x40000000>;
> > +	};
> > +
> > +	soc {
> > +		fpga: bus@ff200000 {
> > +			compatible =3D "simple-bus";
> > +			reg =3D <0xff200000 0x00200000>;
>=20
>=20
> Are you sure simple-bus allows this? IOW, no warnings from simple-bus
> schema? To my knowledge, simple-bus allows only objects, except the few
> allowed properties (and reg is not allowed because it is bus, not a devic=
e).

I double checked to have a recent dtschema[1] and removing the reg line
doesn't change the output of

	make [...] intel/socfpga/socfpga_cyclone5_de10nano.dtb CHECK_DTBS=3D1

But I agree that in the presence of

	ranges =3D <0x00000000 0xff200000 0x00200000>;

the reg property isn't useful.

I'll wait a bit for more comments and then will send a v4 without that
reg line. (Unless Dinh is happy with my patch otherwise and applies it
fixing up for this issue themselves. *hinthint* :-)

> Nice coincidence with other patchset from Intel also claiming FPGA with
> resources is the bus, although there it could be root port.

There results no action item for me from this statement, right?

Best regards
Uwe

[1] pip3 install dtschema --upgrade --user --break-system-packages

--wlj5wtagrjnpwtkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmehvfcACgkQj4D7WH0S
/k5p6Qf+NG5nI+S0uGoFSwIFogGlx57g1Gp9Bgn0L0+w09hnkYYeW8LBcD0HGmki
rlLH12jIrXeBTMJ9ay9/gNXySZ76o3RHI+3fbxhXjChNSBbmEx+rhOhz8q5vCFTU
6IUDpyEWv6mzQxORxbOpn6N4XOolW5yI4vXnVRNKUIvinCtcZbyN/v+PHHrCUjgb
sAkZ4G3xeN7DSLAk39kOT/sMV0RqxndVJarBtMTqKnhbsEp8KuAKbr65SdWwgpD+
j82BCvZUw+Yjd7JbUXQ+AB0S3nA6Rc/wtth0wZ1ThQDUVnrvcSi3bJqMzbQUCquR
kOOSbuaFLrfmxBaQlrdWYwA7UMTpcQ==
=42aF
-----END PGP SIGNATURE-----

--wlj5wtagrjnpwtkb--

