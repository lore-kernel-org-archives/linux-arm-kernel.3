Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABD7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdLWa/pjVt7wfAUfDu2zjOc8xJ+YFDbqtxyE/Db1k/o=; b=hKkcM8n++hTsLWwOoQcERiVyJG
	x1nmgYzQrxm2xpNdB8pWtJR5bzKTdBK7HuyIPboMkJaPo5gqnsyO6Eb1toyTZ6BQkFr56LNJRgAGs
	G3VxPGXTL87GOBm98guBdqGDCHBCVv08dZl4to7AYwh44OZommr761g7m9SJqYc6EDnvI9AfAwgyh
	BmpZoU5T7tAfQy9TuPVZMeAkY0JLZQL7pW3ynhvGoG3X+3N4nq77x/gGL3+qto1Khxn8p1rb6lmxc
	OZW0ICm6hAwbqyfMGrMRrHMIezweA96UX93aSpMQL8NTM9wA2UGdR2IGf64F1Ixh8CYUjov4cbmyt
	BEc5L/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvJI-00000008HDl-2Fcj;
	Sat, 04 Jul 2026 08:01:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvJG-00000008HCs-1PIT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 08:01:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so8864565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783152068; x=1783756868; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdLWa/pjVt7wfAUfDu2zjOc8xJ+YFDbqtxyE/Db1k/o=;
        b=hu9WIx/r27ZDrIjNHdg8HXa1NYHjfx5MsUkFOOJx7PKtw7cXfsVYvHMAzbhBwTWYg7
         N2yzvUUIyUiXVM2NALl4hlOUqfx48cAywbHYzVgIJCw7s0V2azTovZvZsBYo6ezlGAad
         ovubtn3TWnWahffoSCP/CosuYrkY9ipG3sJmQFtKvJZPuWCtdoaPr7pc6+zJV1yCcDLf
         vJLSKLrn32T0mxnRckbZ30R/FKcCvUPG5szpa0Mi4H5iKrsf6Fkyq0PJPrI1fQqa1auj
         FLHhBXXmogb1zv64GfQHYkkMziqPlbUl3yjnBn2p7l/suBPhA5eoTp0YC8r5B89Wswo2
         FMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783152068; x=1783756868;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NdLWa/pjVt7wfAUfDu2zjOc8xJ+YFDbqtxyE/Db1k/o=;
        b=ECTFOr/ODaBoAxYuukM3qD0Ldf6LIt/NuS2pE6BxEb0/QXUXZqNlXyhXSWcnaf+qlc
         mrROLZAii/mdZewHTeX9c9PM//q832/DyRiYqZNyexFgm/cfW48vtSo1pT8IyToyoFNb
         oKXPi/hMsMI2VgAmUUj+nIdreaqeydE0dh/AdEx2e2ftYxG0myMJomsO9AQZ/QIBJTlJ
         +mY76Xc+UXuFUEVo/esSLGG+5ZeiPDnrHG537cgLV69Fp54hly53FansuIM4bMFdjIgF
         mIBBj9kNnRcafFlKlzz5Xiop8+/FXRNt96xNmQfSpI6Yo073FAcSeU25t5VaH5WvHOMg
         9Fdw==
X-Forwarded-Encrypted: i=1; AFNElJ9CbGUXCreDakpZQCRQ3zxcTWujQcjcuPZTOcAndP7H746HVsOVk8sfduGkg+4KGRWlBJuoMpOQBtbp+OMkdxPy@lists.infradead.org
X-Gm-Message-State: AOJu0YzTFvRAMDP+ltT4JAST98I8OeavLb9n0fDoaeWD+L4yPuyx9Awm
	IIGfp/dRmjYvROcLYcm/Ww+EFJ2+GKzHQQZAKHl3RLgTTrGtJRiNOuC29WplUU8AlmY=
X-Gm-Gg: AfdE7cm4uiBKbXQ3f3E3cOevwl682Vf/dd/qWncr+xLC9Ufw+migdwJCVtUyv+/lmi4
	XkHIjUMsdtGwwF6dVH6M/W8AMyYgR5NlJkHizm2Zect5+E4DzgaB1UtiJvzs+uL1fB2XiS+C6Cj
	SM7u/2KKu+kt6YGAxqg6X/lg+rKzoHAJ9TyTGmo3FpwSqqlLctFoK6SWjMFFHPCRDz12xAt0O+N
	5G3MzyTcttsxxrXidL20z+XWptQ/8SQJbLJfFU+4kbDyoTwhARjyqxUwy2Wwk8HL5AMaeuUNrU1
	y4On968qllyBdra7URCcM7HV+p2OveTPid8Ywit3DHwWwgNsm9ll3J+dTl5s9IRpdg0X2mmvOuO
	2MAdB/CyD2Lx6lc+DOoLh57DF7HuoIOPCO9x24Se5pcED9+nmKOHg8ntu0Y6yyThZDBId8qSeWx
	rz00W31Al98ahriRfr5jsVjuFP
X-Received: by 2002:a05:600c:3f0f:b0:493:c432:f48f with SMTP id 5b1f17b1804b1-493d11895c2mr27432545e9.0.1783152068303;
        Sat, 04 Jul 2026 01:01:08 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm6231470f8f.21.2026.07.04.01.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:01:07 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 11/12] reset: zte: Add a zx297520v3 reset driver
Date: Fri, 03 Jul 2026 19:19:51 +0300
Message-ID: <AcQaacfOR3mtrGh-gPN30Q@gmail.com>
In-Reply-To: <4f12469143f61194c332eb6d911ba090ab58ed95.camel@pengutronix.de>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
 <20260702-zx29clk-v6-11-377b704f80c4@gmail.com>
 <4f12469143f61194c332eb6d911ba090ab58ed95.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartpcZktKqnRSCVt1wDyDWmmA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_010110_412871_6F967632 
X-CRM114-Status: GOOD (  17.36  )
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

--nextPartpcZktKqnRSCVt1wDyDWmmA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH v6 11/12] reset: zte: Add a zx297520v3 reset driver
Date: Fri, 03 Jul 2026 19:19:51 +0300
Message-ID: <AcQaacfOR3mtrGh-gPN30Q@gmail.com>
In-Reply-To: <4f12469143f61194c332eb6d911ba090ab58ed95.camel@pengutronix.de>
MIME-Version: 1.0

Hi,

Am Freitag, 3. Juli 2026, 12:16:09 Ostafrikanische Zeit schrieb Philipp Zab=
el:
> On Do, 2026-07-02 at 23:28 +0300, Stefan D=C3=B6singer wrote:

> > +	rst->map =3D device_node_to_regmap(of_node);
> > +	if (IS_ERR(rst->map))
> > +		return dev_err_probe(dev, PTR_ERR(rst->map), "Cannot get=20
parent syscon
> > regmap\n");
> Does your parent even have to be a syscon?
>=20
> Could you just create the regmap in the MFD driver and use
> dev_get_regmap(pdev->dev.parent, NULL) here?

topcrm needs to be a syscon: It has control bits that the watchdog driver w=
ill=20
need to access

lspcrm no. I am convinced it only has clocks and resets

matrixcrm is yet to be decided. It is involved in the mailbox system to rea=
d=20
RAM properties together with the dedicated RAM controller, but I need to do=
=20
more investigation. I might drop the syscon depending on the outcome.

Afaiu device_node_to_regmap is supposed to work on on both syscon and non-
syscon nodes. Am I correct?

> MODULE_DEVICE_TABLE(platform, reset_zx297520v3_ids);
>=20
> With that,
>=20
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks for the reviews and advice!

Cheers,
Stefan
--nextPartpcZktKqnRSCVt1wDyDWmmA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpH4ScbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiqAYP/0PSsCJlf1iqdfLjDzre
QaoR6ubCMLcjhUyly/jNCsev5VyfG/DKJEZNJuUN676osNwkvtuIc9JEtK3Tn2jS
PV3HfJ1CebGkpSsUJXGSMLcgzzlmpEZHh/SRwe84z1WE+DXhURLJJ0X+foIrAao0
q56lNk/EvCOOfurFn1G8kTrU0WeAb1Yl3uGTIB9RiEzmm1QvjlW8oIczLUJ3+CUk
Y9F2seldqqaOTYoVMvU6FC2PfIf7CrTS+1l9y7pmGDZyGiMJduldvEVq9nhadGEw
/bBzamiINBn8quw4RR3qFF8K982jGXCF9MWzRgFqWSwrCV0v03n02IYsBTekfSE/
YYTLTdW+1e66d7MUQ3yxYgv6hnzdXRLJFO31Z9TDCS7SFWlZ49Tzx2sH9YLnXQqZ
kNisSl3CqxpqsfcQ/3Io/PPTIuFV6f9Q3vrD47AdCZelgv07Wo2px3Xloc2oQt7n
HFL1bz6vBbES+xSTGPY1TlqtVOz0NSJ3sIKRjfmqZ77TUyaigFs3AzS9GW9559eR
aSBwKVwLbBJJziQAG09Ce04U5w7QHZ6l7lHer3luAwq1pQmoetuxPuOA2I714Zxs
grduqqB3KwvuOhsMRBeXbcD99otALxwXBP/ajR6zbuO11G0+yPwjMDau9Ym+3l9z
37C7wQ37BWNiCWRh6di8m4ab
=wt6K
-----END PGP SIGNATURE-----

--nextPartpcZktKqnRSCVt1wDyDWmmA--




