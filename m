Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B91C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 14:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tfit3Fz0i31tRy70JNSd1EFtd6PuzVakM4X6XHPww3A=; b=2zxNI9HMwTIJ/2kWG4NhD50Tac
	el7cJomXoDK0p+bqklQ8PizfvnTqwD12idT7VQBybuA2k0vDWyleW4sVO6c/L5dB5jHqFs/BSjDvj
	YV5iQ72dCsEqFHvrvNy+ro/V3x277Y0wXm/wVvZexqXk7h+eAULgi57nhHyqxZ9QUvFdxKP8BI8+O
	vpU5qDB6u8lS8WFdk6JGWLW3s9FMmGs9iCmCmmow7UAWmmhX+w5zcxP8yZjXJdZzE0xUx1q7FKOS5
	E+z3q+A91FPq2QDXCkeK+302QV5Doy9gIb2N5kH2aEmwAriqpO7U8Jmy44QTNq7fKaS8K5LccdG7i
	4Pkthpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBnr-0000000B8ES-2XCk;
	Thu, 06 Mar 2025 14:02:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBdD-0000000B6yd-4A0j;
	Thu, 06 Mar 2025 13:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tfit3Fz0i31tRy70JNSd1EFtd6PuzVakM4X6XHPww3A=; b=FPz9Z27hjz7fSVnFEjpmWs2Gws
	HJGmNcdSHNouYuPAwLHFVZzkQjvN320hkAOi6R9hsUDbPtcQ/Z4elyXx7nKUhT9h8bljbi/aeklCx
	hKRZjn6F51nlXCIW364BM0uF6ijzwpRKJgnFgN/RBDg8pnJ4VU2GMVO6Gv3aVUdvqfN3wBYPhd2hL
	ZVvdJhG7G2UnUaUMV92c1Yx99CI2/nWB2t0Bqft0QqZ7Zu4Apz0N7NjBtdsnE2SvFgCdMQkYZ1mVj
	VXiCbMyVHrKgnf+KeLImycwmI3qAH4beCRX6yhJvFDV27cWWSfsXrZQNcIB8REHN3xiixtTwIY/RD
	q0D4Y5+Q==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBdB-000000016cj-0eYH;
	Thu, 06 Mar 2025 13:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tfit3Fz0i31tRy70JNSd1EFtd6PuzVakM4X6XHPww3A=; b=Ejvj1ORDq3Xzz/I8L7kds7Y9Xq
	1/dh6WYh+ZOXL7uLac0XITB00b+xgwn3eYH25rvAqmifFDkIgGb7gMwg23nbr016dV2qH6dEds0/d
	nFmqG6/2x4MjzAXyDz7nsyN6UGfA8Gj0YPhzBj501xEQpTHao3mo7UCDx2AMCPvjlxqaQIFkzxcC1
	rIUC+yoVIVQy9Y3U7iakqAW1G3g/sRjntXIJ6utLWP5+Ue4Akw9pQtCsGndck1ipaQdUBQTSgn07P
	3p5FsgHIa2LRwCnnc10C9dj6JShiiZlhOpTtt+NtRrpp+Od11fEZwHrHSYpqaE9/julw1+4bUD5RN
	vEKh3wEQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqBd6-0003Vp-TB; Thu, 06 Mar 2025 14:51:16 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, ziyao@disroot.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu, 06 Mar 2025 14:51:16 +0100
Message-ID: <7020561.MhkbZ0Pkbq@diego>
In-Reply-To: <20250306134002.380690-1-amadeus@jmu.edu.cn>
References: <4856313.kQq0lBPeGt@diego> <20250306134002.380690-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_135121_287287_A2533024 
X-CRM114-Status: GOOD (  12.23  )
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

Am Donnerstag, 6. M=C3=A4rz 2025, 14:40:02 MEZ schrieb Chukun Pan:
> Hi,
>=20
> > That sram is part of the soc (and has an mmio-address), so I'd think
> > it should live inside the soc node?
>=20
> But soc ranges starts from 0xfe000000, I don't know whether to change it.
> And all other nodes are 0xf..., except this sram.
> Any suggestions would be greatly appreciated.

darn ... I didn't realize that this is not sram, but main memory :-)

in freescale/s32g3.dtsi and blaize/blaize-blzp1600.dtsi I see structures li=
ke:

        reserved-memory  {
                #address-cells =3D <2>;
                #size-cells =3D <2>;
                ranges;
               =20
                scmi_shmem: shm@d0000000 {
                        compatible =3D "arm,scmi-shmem";
                        reg =3D <0x0 0xd0000000 0x0 0x80>;
                        no-map;
                };
        };

does something like this work on the rk3528?

Heiko



