Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B91CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sudsrgh6olVvguill/NXjWeyuYPJdT70+yOGXWlPI0g=; b=dsFEhhSIDeP8C4EEvmpBpF4COZ
	t8J/xX6QimK+gFi44VdR6ms72+MgmFMkaHY1j2GT/B6wuTU/Q0ZVibodC2kAdjO1lNddiYv6gWU6N
	RrtAQX4dRjnDuhgnN6qsrCPCwTMlhUz+rOW5nBSka561W3lrxr02xcTasi3bZyicny4yYhcpWHkYR
	Nw5rwciOGgz+pYiabzj7pZ3hq89ubztu8UO5i9w4JR8/RnN6B+zMjcgBnGhFRBW9WIeTASEnH1/l2
	idq/Ccx90THZkT0YLRf//Aq+Zf8RqysI+1ZhMoMkRm3pF7HOj5KoXM6t2vo6duDlmXeYpL9ZmFwUU
	KR6uPNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzED-00000006zkv-16qg;
	Wed, 30 Sep 2026 18:40:29 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzEB-00000006zju-0Peb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:40:28 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48aff58e6abso699987f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793625; x=1791398425; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sudsrgh6olVvguill/NXjWeyuYPJdT70+yOGXWlPI0g=;
        b=EMkfO5zb3xJcgX98bWilRkV1RB5ekLd7oZ88XkjDXkiL21HxzJYDPUCGNRxl9ztUrk
         tFApiVeokdaY07pyjQ4c4ijjP3smYxdGEiI/C1eEqSd7/0fqoRfK80Cx99h8nvjkSX06
         RmSyEzf/mBedMr4J4K70UmWkcrhcM8khU21SQ341FlI+tQ6HO0olJAv7AUH+q5HHGXqL
         lc75+jDkfo7IR4CFARN8x1DoB5isz8UonxVd/YXJJKGcrANgeTpoC7ugP12KnjvMfp/q
         gejgPxyCOR00ZnafO/21XFSLo/4hTgElGhe0iEITWF3cwWFLPfPWk3IK5hQAGp4oks+D
         rPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793625; x=1791398425;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sudsrgh6olVvguill/NXjWeyuYPJdT70+yOGXWlPI0g=;
        b=vLM6P/zsjoyoXSTpjh/IWUmUCAWxdKsqb2XNyVrZWztcy1mpOQNCzV0sPV+6wR2pld
         cv7TE0KjSsO48wh9eMdRdPfd3DH3pRRg0PZVBmKFumYnCCysAqp4HQaCCYcFCE0d/u+j
         n7mDl7RjcJDqWLLFcq4qPlHqDzazCp8ATAcMQf9hd/Ui23p8/8r92tXf6jEF2mDVJuo2
         V3Sa2sP0Pf7lRhnOpfVO9Ju3k5cvTEMIVgqH2XYL1kXztugOzv38Ox4bIOQH1LRDnfRp
         tyWWeoJ73Fp8/YTgxMVrD0WSnlAGAZVy7lhYmWUVfaUzHrn5W6brbtVxLzTTfWCzjk+r
         W3CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzS7VVBqJWiVcAew3Q5IuQQ5ELeieQBiVh1SGKSYE3xgZfvowWqHXUyJxnratnGeGJEcF5PbTaBJxP4FiG67rdi@lists.infradead.org
X-Gm-Message-State: AFq9FYKUsdtAQWNMpBKDfXhPH1o3L4IxrGOdy9pYt/N5DbmUfP9EqZT8
	incqeGDI4sx79ZiBhiWiBOw+mmmLyvsUk35XnezAx3bt+BCwxe1YxPn9
X-Gm-Gg: AYBFou2gwVg6gTbqAnYc7UK24+O7T/qPKh3cWtbA2oN+94bgi29ya8c+wo4R88nMqft
	lkKx3hry+iNZhMmXdAaafzBPmzitBO/SEvvj2ODVJgtzk7qW8/eorGmzSGEZ9BptzUsSGCkKE67
	B40n5DfmvYHwPFpw9bhcflBdxcnaHmVg1fFp9wBkeIs1W3nkDqMUQk3oufR/nJ/tqAyv+rMUq0F
	S60LsMly0+8jWzh8+EqFgdtAfuZjmjl6iqEwDog+k9/UwpC4RYfLIkV8aCMpNIImcQ0/MDOlOuV
	iYyma465lJJPF5cIySHMDJqWjQZ5f8GLv76sGDHbLGL54lZW0MC+c3mMRvK/4+dN/Fa3cQZOSBd
	ebLQK2mSA03GRYIYgIp0yUpJVVnDivyQQgIsPF8hs7f88TBF8Ojf06w5P6jiOCkCCisDOIO4wc/
	SUyqe8jyPt8P6C66E+LeFkQH8zlDtoNGbvcFyN5Su0iHc03acrtyP68CbabKSW+oxZHYmSrMhyF
	/FmE3S4NmU=
X-Received: by 2002:a5d:5d0c:0:b0:488:8132:143d with SMTP id ffacd0b85a97d-48b024df747mr4886436f8f.19.1790793624363;
        Wed, 30 Sep 2026 11:40:24 -0700 (PDT)
Received: from strix.localnet ([197.250.96.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6c1sm1063999f8f.13.2026.09.30.11.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:40:23 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 mturquette@baylibre.com
Subject: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:40:12 +0300
Message-ID: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartulVVFYPFRfOzbNRxaXxRQA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_114027_180119_DCD59E5B 
X-CRM114-Status: GOOD (  14.74  )
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

--nextPartulVVFYPFRfOzbNRxaXxRQA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Subject: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:40:12 +0300
Message-ID: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
MIME-Version: 1.0

Hi,

This pull request contains the device tree bindings and clock driver for ZTE
zx297520v3 boards. It contains the next step in adding support for
zx297520v3 boards: Documenting clock and reset manager hardware and
adding drivers for its PLLs and clock tree.

The patches have been reviewed and carry appropriate R-B tags by Krzysztof =
Kozlowski (bindings) and Conor Dooley (clk driver).

The PR does not contain the MFD, reset and device tree patches. They
will be submitted to the MFD, reset and soc trees respectively. The
clock driver compiles without them, but won't be instantiated without
the MFD parent.

The following changes since commit b1470947e92aeedd522ddb7363369c956e55d6b6:

  Merge branch 'clk-pile' into clk-next (2026-09-29 14:14:32 -0400)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-clk-for-=
7.4

for you to fetch changes up to 89e2c0fa481f6a0da23ad5c4dc98bcd940f09fd2:

  clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-09-30 20:03:=
29 +0300)

=2D---------------------------------------------------------------
clk: zte: Add clock drivers for zx297520v3 SoC

This tag contains the device tree bindings and clock driver for ZTE
zx297520v3 boards. It contains the next step in adding support for
zx297520v3 boards: Documenting clock and reset manager hardware and
adding drivers for its PLLs and clock tree.

The PR does not contain the MFD, reset and device tree patches. They
will be submitted to the MFD, reset and soc trees respectively. The
clock driver compiles without them, but won't be instantiated without
the MFD parent.

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (9):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controll=
er
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks

 Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml    |  1=
01 ++
 Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml |   =
98 ++
 Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml    |  1=
22 +++
 MAINTAINERS                                                           |   =
 7 +
 drivers/clk/Kconfig                                                   |   =
 1 +
 drivers/clk/Makefile                                                  |   =
 1 +
 drivers/clk/zte/Kconfig                                               |   =
28 +
 drivers/clk/zte/Makefile                                              |   =
 6 +
 drivers/clk/zte/clk-regmap.c                                          |  2=
37 +++++
 drivers/clk/zte/clk-zx.c                                              |  1=
92 ++++
 drivers/clk/zte/clk-zx.h                                              |  1=
37 +++
 drivers/clk/zte/clk-zx297520v3.c                                      | 16=
57 +++++++++++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                                              |  5=
76 ++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h                        |  1=
54 +++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h                       |   =
12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h                      |   =
62 ++
 16 files changed, 3391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
lspcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
matrixcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
topcrm.yaml
 create mode 100644 drivers/clk/zte/Kconfig
 create mode 100644 drivers/clk/zte/Makefile
 create mode 100644 drivers/clk/zte/clk-regmap.c
 create mode 100644 drivers/clk/zte/clk-zx.c
 create mode 100644 drivers/clk/zte/clk-zx.h
 create mode 100644 drivers/clk/zte/clk-zx297520v3.c
 create mode 100644 drivers/clk/zte/pll-zx.c
 create mode 100644 include/dt-bindings/clock/zte,zx297520v3-clk.h
 create mode 100644 include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 create mode 100644 include/dt-bindings/reset/zte,zx297520v3-reset.h

--nextPartulVVFYPFRfOzbNRxaXxRQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq9V4wbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxois3cQAKOqW1nSvwLMITtTcza2
Vdp9CeR6iivrtbKOMsiIk4809MI5SPaDrZFTRhGptF1lkghAVFzE4/C142dNneqi
WS1IWjBaka+M4nOj8ytObhnAw4aDfykrhsTbf728cm5NREgu40tbKntocyBAVZ/9
lhmCkEYxNdFf9XmkdccrWzFzz0frS76WMl49qqGtKx4wMHLyy5if01smKb/s7++d
N64P2US67mjeHpEARXF59w57dsyBJeBOO52m/WvN2SnBE6RDdczhOSyhxVHj/TMQ
UdhoCB/8qBLeHgiMXlc0E6Z8/JepjhF0COQ2N47RQ68hwl3u1jFQdOxuGVvhUKOG
WYqKt43r4MLjBv9IInWAhT+C0hUrNeJ+sM1nnVQcnLW4liwjl4x2FOxGRjqnvKdq
b5tIcljluruQuR59Zm0v0EjPxEAcWCZdC635QIkSpkTaLdQAS2jJ5vkmghy6v8Bx
Hjn8zxLFFeqoyhUOtK3d8JXvAWh/OkA+TgC7l5pbPqe8utUYyoT157nsTu8cVMHj
hZbZpr9dUpG5SH8kg10o9QPqIXPAhaqJtPSNFKEu04mhtaCcrbMOlo0c9gJBjefW
UN/hh2zY88uedgd0O+QAdSe+DAJQ5iZ7ZRGcP6Yx9i88QNepx5BZFGueC9v1aWls
MmfTH79WEXLfNxj7sch8COSO
=tmC8
-----END PGP SIGNATURE-----

--nextPartulVVFYPFRfOzbNRxaXxRQA--




