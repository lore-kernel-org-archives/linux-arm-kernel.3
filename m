Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C80D2CDF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 00:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsEkGNQ0X1iLzP6SENhOBfRJJANLqH3MtVROdQOe/tI=; b=pBD8O9jml+ycc7B3+dFi1syQEn
	hoYfBaJrShXxIt5yzzQ7VnP2/RroZ6ukngUJx7SBoTmHvusJndXjeZG73wEwrb8Fy67gIWX1zc77+
	quB3V5vJt/IK5BfSgRgWlpbmE+SB5Z0EUdNxa/sSLPx94utGKPy7b4fEfKX/UpjVoq/VYrVUEIttf
	frdrPODUKjb+E/Th3DSQ2DfvYOH5B9WGC4+6/LGaw1g7ikhqzZJT/WVz+FkonOymlMFgHez75Fas0
	gs8n2Gpt2D8ud4E1HeEV9tUJ8nr30K7Scpn0VZQCDz19VuddtI9Rerb4yEfduuo8hnF6QbgqjuXiw
	rQO9qwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRJJt-00000008nVD-089p;
	Fri, 05 Dec 2025 00:05:10 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRJJq-00000008nUl-0ffQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 00:05:07 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8b2ed01ba15so115238685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 16:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1764893105; x=1765497905; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QsEkGNQ0X1iLzP6SENhOBfRJJANLqH3MtVROdQOe/tI=;
        b=qad2BbcXTVsSe8WSXT68XeHjpNFt4Qmr8pDETtZVce3RCoHAj6y68+dHGMKwIO59Rx
         QYd5kfQb3CP+22BRU5uHznnzAI9vNlx/DCWHSD2JSFVeeYLEw0B4+kPZ3M99laCRW3UW
         R+hFHHqw8Xsc6i4P7X6zvixxmOvCfYLYvHL41u4D+iBNqJW4po/ArIX7Tq0+drJ5wf83
         kkvDBogrUgJv5zwFjTnpIFIOSJYKH4rz+LQRwRrXYtWjrNRLB+l2gBUfv0vuB5XE2zxz
         GZB+nGoafpZsnXMb/M4EKJEQ9PaHTXK00gWmyKKHxMrllBYLNKmE2oDg59UORp43SAIT
         cqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764893105; x=1765497905;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsEkGNQ0X1iLzP6SENhOBfRJJANLqH3MtVROdQOe/tI=;
        b=OLQd4/f8AVqLVOmbZ+k0foMe/s03T8W1F4liYuLnVy42kApXlrgi/NqAJoARB0Yopq
         ndZHRolxy/KoEBYo81VFHcy0Cgdxp/nOPi3QmzHsoqm+8LCmyh5b4bNqVftQelXFVoFX
         LzDtFakZ4K4hvS6lPItO3KXPDc8GkUMQlvpRFRgsOI4HHsC5R3zY5h4qEMzYwCsNOQ6h
         iwV5PyO+2ZUAeJYs6UmN7OkgSV72TKcZNWOSB7aGEaCbSRxiYJGvuKANvKxCu4LhWXuD
         Y/YwMfUrv5q0MvbfE2wlJk4fhHgh/n/5ITfLNcdMSGkQhsKpr59LwEZpYCwLPvto4PH8
         NP7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVj8ueSj9N9FSmV/8lpqCGkxepbTqdcrAxt3nvqu5CsqaWLxGhKRfZwasIJ51PXDGAb9Ryh9pSNuKd9mu7o4QPA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwn8Xyu5JgJlqypjQloLHm0MqQQVlVSGHSJRctUkTg4OW+S3Qz
	hgb8y/BuOejf+FuOBXUb0QKfZSYjZq3FL7HNgMK/HNiHoVQxvnvBFz64MstdcYRhVm3OeUgoVjS
	M/w5qOW4uEw==
X-Gm-Gg: ASbGnctgP9gfh0S0BQ86jOcsffSEwMA4SqK/5biyZd0R0Lk6IKpA0okOkgEv5ppNFoE
	fXfWq2bK5mADxOZryinMudrMRe1PzOit82MpvJtsl/Z+3ZQ2JryILlZN6fOEYCX9wejFD6RFUQ/
	IxdrbLNFECqlYeggmKOmrTFQbo5d3H/BWUNqQpvzOqSMRunKHKdeybSXQ/9u+XV3VLLnKAXTP5f
	syrRcRpHbSglwbIL0c/7uQjalLHWUYZDhmZ5Olg83YWWiyOosVthS/zDC2Dgbe3sIx2MXpga7ZV
	sF4kORziLKLmk+DWBYZPHnyjnn/JutgxAHXkDCHhAvAyZfYdREn5ZpjYDb16htfFMng1qpy+Lmy
	Zhjycr9bdVPzC8ajatLn+fD7x0CabcecgJsOSA1LaVgomvHZXNmHjQ51HFs2jZx5xepw9brENz8
	/0oa+7iqatcrd5kvJ5
X-Google-Smtp-Source: AGHT+IGSnH/JXwRwm6jBIx+8DOrUaP2xqYV4k8pRacxA2nEEaHNzRx2PV5KL8Zh8YrfImVMtOQRvRw==
X-Received: by 2002:a05:6214:4613:b0:87d:e32:81c4 with SMTP id 6a1803df08f44-8881955b913mr136009156d6.48.1764893104770;
        Thu, 04 Dec 2025 16:05:04 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f59c3fsm21465976d6.25.2025.12.04.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 16:05:04 -0800 (PST)
Message-ID: <b45a73845e66355080cfad0f0040b6e7a9d78241.camel@ndufresne.ca>
Subject: Re: [PATCH v3 3/3] media: verisilicon: Avoid G2 bus error while
 decoding H.264 and HEVC
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.li@nxp.com>
Cc: ming.qian@oss.nxp.com, linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, 	ulf.hansson@linaro.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, 	festevam@gmail.com, linux-imx@nxp.com,
 l.stach@pengutronix.de, peng.fan@nxp.com, 	eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Dec 2025 19:05:01 -0500
In-Reply-To: <aTIRwcocnye0Y6yV@lizhi-Precision-Tower-5810>
References: <20251204090813.595-1-ming.qian@oss.nxp.com>
	 <20251204090813.595-3-ming.qian@oss.nxp.com>
	 <aTHGJzVKa7PbEifJ@lizhi-Precision-Tower-5810>
	 <9f38bda2f1753645a1ae392ce5364ea0165fdc01.camel@ndufresne.ca>
	 <aTIRwcocnye0Y6yV@lizhi-Precision-Tower-5810>
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
	protocol="application/pgp-signature"; boundary="=-vhLAVdUguC0rEDc5y4Vo"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_160506_405767_D822E490 
X-CRM114-Status: GOOD (  20.44  )
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


--=-vhLAVdUguC0rEDc5y4Vo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 04 d=C3=A9cembre 2025 =C3=A0 17:57 -0500, Frank Li a =C3=A9crit=C2=
=A0:
> On Thu, Dec 04, 2025 at 01:15:35PM -0500, Nicolas Dufresne wrote:
> > Hi Frank,
> >=20
> > Le jeudi 04 d=C3=A9cembre 2025 =C3=A0 12:34 -0500, Frank Li a =C3=A9cri=
t=C2=A0:
> > > > +static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_=
dev *vpu)
> > > > +{
> > > > +	struct device_node *node;
> > > > +	struct hantro_dev *shared_vpu;
> > > > +
> > > > +	if (!vpu->variant || !vpu->variant->shared_devices)
> > > > +		goto init_new_m2m_dev;
> > >=20
> > > I found only use shared_devices here, how to=C2=A0 ensure that g1 and=
 g2 operate
> > > alternately by using shared_devices?
> >=20
> > shared_devices is an array of of_device_id we match against. All the ma=
tching
> > devices will share the same v4l2_m2m_dev (aka m2m scheduler). Typically=
, both
> > cores will be schedule as one. This achieve what alternate operations w=
ithout
> > active polling or blocking locks/mutex.
>=20
> Okay, but this code require shared_devices=3D=3DNULL's device probe first=
ly.
> generally not order guaranteed, if there are not depentance at DT.

shared_devices is a constant array that is set inside the variant. It is
normally NULL, except for the imx8mq SoC, for which its always set.

>=20
> Does VPU always probe before g1/g2?
>=20
> and if there are two VPU instances, what's happen?

Since there is two VPU, g1 and g2, we will enter this loop:

> +	for_each_matching_node(node, vpu->variant->shared_devices) {

On imx8mq, this will match twice.

> +		struct platform_device *pdev;
> +		struct v4l2_m2m_dev *m2m_dev;
> +
> +		pdev =3D of_find_device_by_node(node);
> +		of_node_put(node);
> +
> +		if (!pdev)
> +			continue;

If the match does not have a device yet (not probe yet), we skip.

> +
> +		shared_vpu =3D platform_get_drvdata(pdev);
> +		if (IS_ERR_OR_NULL(shared_vpu) || shared_vpu =3D=3D vpu) {
> +			platform_device_put(pdev);
> +			continue;
> +		}

If its the current VPU, we also skip.

> +
> +		v4l2_m2m_get(shared_vpu->m2m_dev);
> +		m2m_dev =3D shared_vpu->m2m_dev;
> +		platform_device_put(pdev);

Finally, if the other VPU was initialized, we ref the v4l2_m2m_dev. We will=
 then
create m2m_ctx from it which will cause the two VPU to be scheduled one aft=
er
the other.

> +
> +		return m2m_dev;
> +	}

> +
> +init_new_m2m_dev:
> +	return v4l2_m2m_init(&vpu_m2m_ops);

Otherwhise we create a fresh one.

Does it make sense now ?

Nicolas

--=-vhLAVdUguC0rEDc5y4Vo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTIhrQAKCRDZQZRRKWBy
9GE5AQDJOm22eqxSILGUVYuLEGZXBEYnvCqwMf4OaSeoN4eG6gEAshUhjhSYRqW9
GJYH8F9tSP/jNRsCAnew+09GBU8MXQ0=
=gSqa
-----END PGP SIGNATURE-----

--=-vhLAVdUguC0rEDc5y4Vo--

