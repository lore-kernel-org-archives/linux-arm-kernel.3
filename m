Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B1DCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6CUfOFr6m5QaenhIZhXMv7jaj13ID72rQAvFIcjDlo=; b=utH2J9rVH2KYc5642TM/od+LE7
	0PFXrTGLwesYkNf7b3/W8pkKyf1B1MEVHlHW7Sl7qoCRNUFnRgh1lQcVuVDOPrDTzwpG4TuYJjcHT
	311vwayzPr8EA6qXAB8L8+13RSMhfIhTj3lHSWZOrbhZkLxM6+RMIbRF9IKElyOHKqUdoHooiwrx0
	42Uji1gQ5WXN4U6AD07SqIefHqy8Ry04l57+SAIVMBv9EPJSHU0LKcftQwoZvhGgmsul8Np1XSpDM
	ISXtqTuUX5tCVi+S0loBXDhf7XH4zRkH2Yu1Td1FJb/C7Eb7pJMZfW/lHsRzOLb1cN+JagQYnzhpS
	EmXZddCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNH0h-00000003oHk-2KAa;
	Wed, 13 May 2026 21:20:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNH0e-00000003oGk-4Aq6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:20:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso4277629f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707251; x=1779312051; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c6CUfOFr6m5QaenhIZhXMv7jaj13ID72rQAvFIcjDlo=;
        b=hR10jDyXbqCMu8ONSPR7pvMOWnQ08vb8WPhLNm8xjaYK+Me6VFNa7fewuojnwbIt8/
         f4iOO2g1RV34LbKa2mii2WLqr9XV4RRyzFjVdhCo8rWfuUuSlMmwVYQKTTLOp0/ACPBB
         TD9qCW91Q9iCbxiB6XIZ/TKJ3Zv7LKyCbHSIFPu4wWTGQ3CU644BKWE5nHtwSN3XRnm4
         DRPONrmolHb+41iIqQNkqXKYsU0Wvr8G88JqvEAq7qoTYjobQq1mb6D4+AZh8yp2RS84
         5ds62xrpxnMb9NtO3A0VISOGBr+3hO5DFfM6di91S9DTUQ8/lvrtM5ratrVWkcJgEqSR
         451A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707251; x=1779312051;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c6CUfOFr6m5QaenhIZhXMv7jaj13ID72rQAvFIcjDlo=;
        b=bOw/vuAB7EaK2dRv/gyyOfL52QCs6abkPxpzvFFYHBLR3A1LkQACy3dppDq7c6HJqD
         d00XglnPUEc4Icdsm4Bv0eLsCi3cqQuWbTT3tzwTYk4rrBJ6WFeBc6Za43YWSFePIkGV
         1oh2hJsGYPGjrMNsU3Bt8/5hvyGrxDoK9H8c8vy39kU8L205ltbRDQ9WzbWOyY9LN4KP
         RmMnLMQB/FfI98sA623pfnlQs1YoMX95gg2xmyBRG2wOSGpiqtt3q9Ryca8G3OIYGgyb
         ffgmdiPhiwH0XbRBtyXcd2f0Syyf27tu3uQzh21xMWKvPF+hGDRjVG5pqEf883tNxS0U
         y62Q==
X-Gm-Message-State: AOJu0YzluPqCzVS7adkCad7tDceSXJS/kwgRPofkY/DO0fBbKDSBsh4x
	VcJZnG5m6Fpb8y4Gd63NKWfWNydx4gkWsqTmtIUQEdP1A7idoEXW/rSRKf4PMGQS
X-Gm-Gg: Acq92OH1+FfERr+In6Rr1pKcyzx/WHIlFTw9355vk6Hrlp3DLL4s1t+MU2tOuh73DN9
	yf/BOo9fAjSvJ0S5bW7nvl1F9UXnaFi8SFVLnFvG5wt2ELvJ6wO79MykAAkGkKAiutJ5zEr/88v
	FnsHlm2iTwsgn+2yxcHKGlnlteJSonrOR3WHNu+P6LsXyJ6iU+Iog77cTMW53nrrE2Lgnt2RbXv
	d+vdLVmFLZw1YHcJtx201PKil9cPgBLqKz7DoWr85gMXBJUAfqdN9spG3+zVklg8R5VTqKz0k1p
	JpPJwwlWhhB2EpOC33h1GsE6iD+CVxsf7JAAZO4d8SfWfJ/drxUJcdDY4a/sTILFZseu6QelZEB
	lHToX+7NGV6p5THRUhvEiwM6K82vnkr5VY6+ZOQdIU6WAJZG4CC8mvXmfV4yuQiStYyP3Ssc3xe
	S5UZgU15zRIWV+FfWqjBNGhG03AyKCkeY=
X-Received: by 2002:a05:6000:2681:b0:45a:e3dd:5869 with SMTP id ffacd0b85a97d-45c5a782769mr8034411f8f.30.1778707251033;
        Wed, 13 May 2026 14:20:51 -0700 (PDT)
Received: from strix.localnet ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm2043639f8f.7.2026.05.13.14.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:20:50 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: zte: Add ZTE zx297520v3 for 7.2
Date: Thu, 14 May 2026 00:20:47 +0300
Message-ID: <24423793.6Emhk5qWAg@strix>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2757041.Lt9SDvczpP";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_142053_061360_B6821F53 
X-CRM114-Status: GOOD (  12.10  )
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

--nextPart2757041.Lt9SDvczpP
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: zte: Add ZTE zx297520v3 for 7.2
Date: Thu, 14 May 2026 00:20:47 +0300
Message-ID: <24423793.6Emhk5qWAg@strix>
MIME-Version: 1.0

Dear SoC Maintainers,

This pull request adds a device tree board binding for zx297520v3 boards an=
d one initial board (D-Link DWR-932M) that is based on it.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-dts-for-=
7.2

for you to fetch changes up to 7d1f68e87b7302d0bd22c001e6c0511d0e827875:

  ARM: dts: zte: Add D-Link DWR-932M support (2026-05-14 00:02:39 +0300)

=2D---------------------------------------------------------------
ARM: dts: zte: zx297520v3 device tree for 7.2

This pull request adds board bindings and DTS files for ZTE zx297520v3
boards as well as one initial device (D-Link DWR 932M) based on this
board.

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (2):
      dt-bindings: arm: zte: Add D-Link DWR932M board based on zx297520v3 S=
oC
      ARM: dts: zte: Add D-Link DWR-932M support

 Documentation/devicetree/bindings/arm/zte.yaml     |  26 +++++++++++++++++=
+++++++++
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +++
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++++++++++++++++=
+++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++
 5 files changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/zte.yaml
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi

--nextPart2757041.Lt9SDvczpP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoE6y8bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi7Y8P/joGHGNInyk+RNFqvL/e
+IJF0lxox84rWCRSd1I/moOfx8Zf4RoKczJKezdkxcrsBVsSCFrsVnf7FK/7AyDD
xTiCwIWn5b9mio9O3ttZZuzoqCswkTQb3Y8GqGGBOlbxnUxXTZ02VTnVll2GsD6U
m5tVt04snVWqNgqbHUWijYqAWcOjb1u19EKQVkosZf4gUSkrTI0oUjspAlH/pX0w
/xeIFIm7s3iDZS3oc87Kn1l2Uv15rsxzu+3fXK3ryl04pAH4u0Y8GXvSyRzAcjpS
HoZLNVgCSLZQJ4/1JBeQutogy/QGW6iXIGIu6Mh3AOowLTsLz1/vgeiSnigb6sK6
IN1R3uWsUa7dZqx9Fyq1EU1s/VhIftR6scIBrFDhp/TeHybE4K/bYaPLU1tulXWx
cPcPxhBD8nDunSZt9kA88sNEmuLfrDrBmHsg7rgJo6QMpatbC+FkimUbJzov/Rkg
9lR7G3nMDCnTOl0UMIi7kIuFJou1Uz3jkBT+JgvUGF0wAwA3KLVgdKL3YikvxLS/
TnRMOiEcY+9TTJ38kgLvZ4DM63r1WLQvqkiVLOE1QrXVsEUdVWzIHnGe4bfeKAuy
Q8gDz7frqtuf9tsKdUFeL5hsEpUcwVqL+/C4JxHrO5nZb8ok/0UZnO+vAjjWuQ0/
L9op5zjIsWaMns8FchMCAwYL
=8csp
-----END PGP SIGNATURE-----

--nextPart2757041.Lt9SDvczpP--




