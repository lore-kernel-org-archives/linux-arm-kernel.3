Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47193C88E7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 09:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OI5Ny9D74Cc/ioYhww8l8XjzBGWxzHq8lI7GocImLIY=; b=w9o8OiAdHtadYFoVJVr8IWWskI
	ZZu0wvGntq3zL1+XlDmIrExloi4gA6Iu7jRZ8V+G2OnKQeszQHgGtJi0kqKnOuKI7cWIVVk7HJ3Uu
	EuMx6a6tgRmHw2MU83VuK1meFkj+obFqs1Vb2Ao39YAE3LB/uJ+kAnJGo6wQQ0J6ywf9K3HLtVwKc
	T3lPwzKVJGCtzIHFrGQzT+l6hzuVdsMhZKZ2Y6HR1UwXdI39aY1noEe8ARUAnvwmoRFj1cNZ5m2CT
	2zDzJFDbdx65F8wPeDavgtMrvE/MkIQf2VB0cfGYGG8DhbIA14BFq5iRpdtkZA/7+SI1xgIK2rdeg
	bFz74Fkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkInP-0000000CBAC-0Byd;
	Mon, 26 Jan 2026 09:22:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkInL-0000000CB7s-1G8i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 09:22:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso46546235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 01:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769419321; x=1770024121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OI5Ny9D74Cc/ioYhww8l8XjzBGWxzHq8lI7GocImLIY=;
        b=H3chatQbDNVa7VqATG6sJAfPrHh9vWkePOes8npiLeg0goKGiy/laLERWatJW2GdC+
         U948f1z7i+VWPCnQm9YQ/gVJhW5Iq0bMjQZTUwuYjYKCouyJA0JCX3IqAiMZbE+TDkWm
         OddaFo8QlkxdBf4TSHLuMN3tT7Ef32gE4ZhWvFWP2JfMHTn4PHvi4VcTUPCyx+AsKT5s
         AhjIMhMcb6Hp42CnBv08bi4mn3pp8br6htB/tBbnS197HwZvJFsoDJXpwqLnxAIcgFOb
         qiJRSySoVZXoNWwL8FpW87DBCoiziLOXZO7h0zgyAr2J82q40br6fK3fNd4O/gk6roXp
         9Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419321; x=1770024121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI5Ny9D74Cc/ioYhww8l8XjzBGWxzHq8lI7GocImLIY=;
        b=k011wZuwhKGU7/+hn9ynAgkwKtbKQY+IbjCaLX7D1YycFD/vCY90P1/KuwED8LqmQM
         xSJXrNnVXEMUbSL1H0nlju+xlTl0+bBBLolNOGnL1UAq/bDHtUyV75Dc176gE4wgRZxt
         Jb+nWdGlUFVkIOF8V7E8083HyYcCf4Tt7xXje7Y40TpXJjEzVApWLZdecV/Si8muXoKA
         MajX66lQAbtuF/lI8wKM/siSZV4otXqDI415+QPuCjBrgH4MWEs6Zlc6OCNS0u/nb08j
         X5FvgfI4lQW468XAbobFlsANNEI5wPS/m0gYo78eDEGayggKyoR/JyPcZWDvzwoVsUn9
         nqqg==
X-Forwarded-Encrypted: i=1; AJvYcCXmt2n6Ty99gQxJq7zIwBfGYYfSn+PekI9tyTjaZE5Ldbs0xz+kxc88CFLCZu8FeW7sv3JpvF4uqdI1pnZKijz+@lists.infradead.org
X-Gm-Message-State: AOJu0YwigSa7hp4HWd4kwZ7FbKp3RwJAgtfGOabN8kXwa2eAhFdaCzw4
	wz/0FDoIfPy+PZ82d1IVAWufLU195/VOVIlghn6e4xnxVgZyxvNYOKc6sav27uTvc8wHq9l6vnx
	IBmF4
X-Gm-Gg: AZuq6aLPI2U5/6IJ23/WA0lEQuXlJ1ExRAh7DUbAzhCtfffM0PQkEBcJ1jTq6QvqvLW
	WhAOEFOBnPNqfH1Pj2bfk/G9DYbtRFW7Iy7cWHXGnO7CnEmHdgQpTwjJzv8yocwj4W38bOshXJq
	rQEE1pqIKtyjVxpQC99vHbbklRYl59cu2zPkvm4FtLQ6masQJzDopzq7jaGHvVLfSCSXOeHfZ/7
	1BvG50EW6/oHyB6rcZG78fpGwt+lq04qvg/QmYAkcZKbwzam6lL3Nx/6o8xXu4tAO71rNROwIf+
	/UQn9jBCFuB8yrWTek9M+/gO0Y0pg4PAzp5H84cF8U3odnb4QgQucC68U+0Rw3sswbVdg25A+H1
	3eV5Q2RZ+nlwzQwQD2GWDOG6VtemTxvEQYPRIvlV2bCC01oSV2Cul/eNNHF9DF6WzXNEHGYrbE/
	JktyUlHBuunL+LhsB55Lo=
X-Received: by 2002:a05:600c:3b17:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4805d06616fmr56869205e9.29.1769419320889;
        Mon, 26 Jan 2026 01:22:00 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:e270:a43a:f2fa:900a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm346669855e9.14.2026.01.26.01.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 01:22:00 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ciprianmarian.costea@oss.nxp.com,
	s32@nxp.com,
	p.zabel@pengutronix.de,
	linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com,
	bogdan-gabriel.roman@nxp.com,
	Ionut.Vicovan@nxp.com,
	alexandru-catalin.ionita@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Cc: Frank.li@nxp.com
Subject: [PATCH 0/4] Serdes: s32g: Add support for serdes subsystem
Date: Mon, 26 Jan 2026 10:21:55 +0100
Message-ID: <20260126092159.815968-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012203_356445_976E86FB 
X-CRM114-Status: GOOD (  11.02  )
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

s32g SoC family includes 2 serdes subsystems which are made of one PCIe
controller, 2 XPCS and a shared Phy. The Phy got 2 lanes that can be
configured to output PCIe lanes and/or SGMII.
    
Implement PCIe phy and XPCS support.
    
Vincent Guittot (4):
  dt-bindings: serdes: s32g: Add NXP serdes subsystem
  phy: s32g: Add serdes subsystem phy
  phy: s32g: Add serdes xpcs subsystem
  MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver

 .../bindings/phy/nxp,s32g-serdes.yaml         |  154 +++
 MAINTAINERS                                   |    9 +
 drivers/phy/freescale/Kconfig                 |   10 +
 drivers/phy/freescale/Makefile                |    1 +
 drivers/phy/freescale/phy-nxp-s32g-serdes.c   |  926 ++++++++++++++
 drivers/phy/freescale/phy-nxp-s32g-xpcs.c     | 1082 +++++++++++++++++
 drivers/phy/freescale/phy-nxp-s32g-xpcs.h     |   47 +
 include/linux/pcs/pcs-nxp-xpcs.h              |   13 +
 8 files changed, 2242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
 create mode 100644 drivers/phy/freescale/phy-nxp-s32g-serdes.c
 create mode 100644 drivers/phy/freescale/phy-nxp-s32g-xpcs.c
 create mode 100644 drivers/phy/freescale/phy-nxp-s32g-xpcs.h
 create mode 100644 include/linux/pcs/pcs-nxp-xpcs.h

-- 
2.43.0


