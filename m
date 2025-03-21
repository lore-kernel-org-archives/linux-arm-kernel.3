Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E456C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCYnaCr6t2CITiy2CVtW2Iw29QsHSOWYrJlCz4eX7VE=; b=sp+Kh44oa5OHbSbYnhRtSMq4T4
	Gm40CC1fmwxCSlK0SSKO0wXi4hsUGsYMMU9u6bhSR2b7/cefSMwyKNVse5YRUV+sIzR/dDJ/kG16n
	z2GWMhgaKsVOPab5DthsT4m2+yPSGNqDbVzIC5ofEWCGGpw/R5aBO80qkq+OlV0JlFwNrWfJWmuaV
	tXssPEf3I0CaXV0zcRMRN9tI+5OccAeziHGOo2ADGw0iamk/skJLHYMuG8VhyJcqntx//+XHo9r7L
	iZ/htrki/efPahiThBygQvyljpVizW5ejX+pvo80K+7P1c85QwGqV/Ffsj+YKIKCuhcq/dQ7Tauh1
	3EBZfYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhEt-0000000Fsd4-3vEO;
	Fri, 21 Mar 2025 18:37:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhAI-0000000FrRS-24Uz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 18:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742581936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TCYnaCr6t2CITiy2CVtW2Iw29QsHSOWYrJlCz4eX7VE=;
	b=Tpns9EBDvrc5sa7kztWzJu0TjUxDvFboqdZLXn+5yUCyomAaOirOx2QTsZHipHNkiJS+Ty
	dQ6aaX2KcFT1U4KVnAiwWQzxwOGUV4c9pTdlSc2Ly0Uepc8NFA8+6HmZswv8dUp4JpaOb3
	sKFTeyPl2Ron7lfXPDstXHh20rJrJ0U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-Kz_AW0YdNo-JBBktUMJk9g-1; Fri, 21 Mar 2025 14:30:39 -0400
X-MC-Unique: Kz_AW0YdNo-JBBktUMJk9g-1
X-Mimecast-MFC-AGG-ID: Kz_AW0YdNo-JBBktUMJk9g_1742581838
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceed237efso18666065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 11:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581838; x=1743186638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCYnaCr6t2CITiy2CVtW2Iw29QsHSOWYrJlCz4eX7VE=;
        b=GklJ/hxvDfXip/plWJ2AwurpBg1IB+QOswGptY91RNupcwtwDRg8MBBsLFPrShieze
         RNhg+GcHNXzsUSEUHxxore2a6KICRCRRDkjw7Nbx1EPoGJ9ViVkeSiz1Hax+uWiS8OP0
         +ECIuDtuSLlbfb4jfnKEayjbqtboJQ6kXll1ltaU3oCpKfX0ElXCcrij872VALbDDdcQ
         NW8kljRX3eeiSRHEq0qI1p7sS825c/tjwjibnW8r3uyNC9hB2bUt5dog65PpFIyXx8hO
         Qon6eYUenA6ByJOKbFF4Krje6JcISYFfPw+7DUhXWFW3k+D+vgoNcJm15Bfg7+mvDStF
         L73w==
X-Forwarded-Encrypted: i=1; AJvYcCVejjfW79HBlrPz+1OPWDCB90JWbrvJG8jh/La+wEtobjPv5Jl1Gm+5srVzx7N6O4mOLpYHifhFPahsXIKtvBa3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4WflFnbg1TuReY7p1Yt6OzTSaXlSZaUMe8cnDDr5HfU9bHqvC
	UlvUL0BNtryKLe2jb9p0qsJttrw4+9laJ3Ln4WlcW9Pd7cSE4kxo0BlwvQYrbS80iI8id9fEDIJ
	k/aAfmQDdgxbKNz9NjYvko9pPlPp/sr9Np9+pHji6RojPTWSzxMDDaLPgaxO5E0jp9SoJoS11
X-Gm-Gg: ASbGncv8h3sh8pVF7Ka6nssI1K6amuIrXehjtnGrDNrEhaXwPYod1jOEXZo9j4BqtWj
	EokUPIT0zlltxFlmVJEulTSwGueNR6yQjZciV2LdUvuaZ37gJbqsR0gBs69sIl7aYTUj8h0mBhp
	Ayy0Tm6qHqPdb4Xo4Ygn6pJ9LsPi9ZrN4U0blkrTmBBcNN92eg58PbIflTPrQ3+bfxSHAv2hELz
	YGTYhDSya2HE9doKfM+AKf6IMSJ5m1zdNCDLPhOmNtRwGZvNttD4ToEDDWgnwKOc54jasL3C16Y
	zJLiUctQjigRAsNx0jukh+lNmcJgv3xxUG2EidNsQo7XBMpr/cpbOFFxOp/y/KU=
X-Received: by 2002:a05:600c:331c:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-43d52a8ff41mr16399545e9.21.1742581838133;
        Fri, 21 Mar 2025 11:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV1J4g5vZeaiZX63RdE3knu8eFnfAyikgZWs5oJe594PE0zRqxZLu0vVxmRdyWaSppnlnHbw==
X-Received: by 2002:a05:600c:331c:b0:43c:f332:7038 with SMTP id 5b1f17b1804b1-43d52a8ff41mr16399465e9.21.1742581837658;
        Fri, 21 Mar 2025 11:30:37 -0700 (PDT)
Received: from localhost (net-93-146-37-148.cust.vodafonedsl.it. [93.146.37.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd26cecsm33890485e9.17.2025.03.21.11.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:30:37 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:30:36 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
Message-ID: <Z92wTGu_Sp9VnqPf@lore-desk>
References: <20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org>
 <b647d3c2-171e-43ea-9329-ea37093f5dec@lunn.ch>
 <Z9WV4mNwG04JRbZg@lore-desk>
 <2d39033d-0303-48d0-98d3-49d63fba5563@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+vQwyXtwdSXuM5kh"
Content-Disposition: inline
In-Reply-To: <2d39033d-0303-48d0-98d3-49d63fba5563@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_113218_668303_8A647399 
X-CRM114-Status: GOOD (  24.05  )
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


--+vQwyXtwdSXuM5kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 3/15/25 3:59 PM, Lorenzo Bianconi wrote:
> >>> Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prep=
are
> >>> routine.
> >>
> >> A more interesting question is, why do you see an invalid port? Is the
> >> hardware broken? Something not correctly configured? Are you just
> >> papering over the crack?
> >>
> >>> -static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
> >>> +static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
> >>> +					struct airoha_foe_entry *hwe,
> >>>  					struct net_device *dev, int type,
> >>>  					struct airoha_flow_data *data,
> >>>  					int l4proto)
> >>> @@ -224,6 +225,11 @@ static int airoha_ppe_foe_entry_prepare(struct a=
iroha_foe_entry *hwe,
> >>>  	if (dev) {
> >>>  		struct airoha_gdm_port *port =3D netdev_priv(dev);
> >>
> >> If port is invalid, is dev also invalid? And if dev is invalid, could
> >> dereferencing it to get priv cause an opps?
> >=20
> > I do not think this is a hw problem. Running bidirectional high load tr=
affic,
> > I got the sporadic crash reported above. In particular, netfilter runs
> > airoha_ppe_flow_offload_replace() providing the egress net_device point=
er used
> > in airoha_ppe_foe_entry_prepare(). Debugging with gdb, I discovered the=
 system
> > crashes dereferencing port pointer in airoha_ppe_foe_entry_prepare() (e=
ven if
> > dev pointer is not NULL). Adding this sanity check makes the system sta=
ble.
> > Please note a similar check is available even in mtk driver [0].
>=20
> I agree with Andrew, you need a better understanding of the root cause.
> This really looks like papering over some deeper issue.
>=20
> AFAICS 'dev' is fetched from the airoha driver itself a few lines
> before. Possibly you should double check that code.

Are you referring to airoha_get_dsa_port() routine?
I think dev pointer in airoha_ppe_foe_entry_prepare() is not strictly
necessary a device from a driver itself since it is an egress device
and the flowtable can contain even a wlan or a vlan device. In this
case airoha_get_dsa_port() will just return the original device pointer
and we can't assume priv pointer points to a airoha_gdm_port struct.
Agree?

Regards,
Lorenzo

>=20
> Thanks,
>=20
> Paolo
>=20
>=20

--+vQwyXtwdSXuM5kh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ92wTAAKCRA6cBh0uS2t
rL/MAQDcn4FFF3wmkVqDFXlch5Wj9+r8ZXCL12r0CY8mcPZm1gD/UWZra+6Q2LlQ
dfGzn/9YsTjGEJxgAcx5ERuOnJ7eBQQ=
=/fph
-----END PGP SIGNATURE-----

--+vQwyXtwdSXuM5kh--


