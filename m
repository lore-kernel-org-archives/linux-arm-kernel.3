Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE4AC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XJ4mlxz9+qmH9SFVDphbLCUFby68qXbPqoJ0t+cVd+E=; b=mL6AMH0+k/CoWdUW041+aeG09t
	CKuSwfbvK2SQLLBAjONXsz2cF2d56ZFLrma7LHwjJFgu8oGQ8RlCy2358Wq8N8xgwINw/fwF3jjEq
	m4ifyPjv9XzYLPMHfuVUFg06ihFyGJchRx0iDHUCgHZoluQZiFriu0ggd9qpH2F520Vtw/G1YVQfl
	kjB89krFG+DOmsF+92/aAnurrM5+W6wxtPaZyyr6PLZUsBnekmLL0JL4Gf/jxbESudRUbHAguR0NB
	O9uZSG83BKXH4tff2sGSdkafWNFIuCrF+W6zzuXGIf6di13XyHc2AOdIhevPNoMZsqrCADzA0c6wN
	6fLmRPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqJ-0000000GFUA-0SZe;
	Sat, 21 Feb 2026 18:36:39 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqG-0000000GFTL-3iWn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 18:36:38 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3870dec27f4so36793031fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 10:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771698994; x=1772303794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ4mlxz9+qmH9SFVDphbLCUFby68qXbPqoJ0t+cVd+E=;
        b=eac3VG41+nD5u82AO0qC9PY4h6S+BEaG6Zr4Fcpn/OW4NBbl+yz7ZmPhbymVf9tRKX
         g0xw3oCVBt5pkbTZ6kcVyPINyyGKoSUpNH3Aak1BY0CqZvVNLEHDYeP0yBmoKnS9xQqW
         8jkh5EhjSwbuwTl6WLU7aKKAGbzJqCPSm2Ft8UgLFQra2APHCogpXA0wQwjGc0DLVGnh
         VzuLKBaUSEO7iZ13MmfmYob+Dewa6NTr7j51sm/DD/65s80DZ5O1Zi9SWAFh8o66fhAP
         vPA7hnaMQMJ116ivlwjLdEb78UajJNWW3r173Lm+qqEx0pnLCy5AnXwIUyVKeUaaHPe8
         r75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771698994; x=1772303794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ4mlxz9+qmH9SFVDphbLCUFby68qXbPqoJ0t+cVd+E=;
        b=ox/vyck+fBMa2x4ZFNpYByuLyOzNNPzF5dkntFISt0/DLxXVuvTU1p1Xyx9YsUudME
         sQsnSTiwxHb5lRsLWZqupBN67EkYfPZxYKIM/nVu968icK9uX6KZiSILiLttaoM49fma
         NzJ0AJpXhQRdS5n2k8JvdYpzLSCP1hhaBqHYb7+Oe4fe333jgZ0t2/oQRxFseaKqaFEC
         ejNKiKIlEFGek7e61aqM/d48gR1EPxZsse8fPG1ElLYlgC9MdWuUykep+G9KlOZe424+
         +D74F6uqFtjKZ1cvJ9d0qpQADhux1bsSjpM8gyfIGbfWIF6Qix0V5WBKUnvXg1xFJpzx
         xy1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3fPTiAN4I1TZ8nxSdFD7vjpffVf5T3OupvHV0Ut0YvQFZOkkR6Ret7fRCzPCKU7cxdGxB9utuxXOIT0tMapnd@lists.infradead.org
X-Gm-Message-State: AOJu0YynF4xIZKTGhA44ZLcKUS8MXSEaf9OWACgTNuFOET5mUo6tqAZb
	5Ozstr3ugXtvE2rkEgyW+HOJPGmGJOfIJgjbYCtLkgPz9mTtDKtQV/I=
X-Gm-Gg: AZuq6aKHYONoMbroGEvZFIaC7+2Sz6ecvuKoUJKFYKDWApyBMpZkktSMXmt5HbC/Arp
	CE4It3J9DzJMc0ppKaMd3dg/L8eT/zr+8KcsLiRQ0fpisXV9KIq7cjrfKWeuEMybwjMTeIRyQaz
	pJfjrNm0MAEdwRbGR0SuQG3Dn+Y7/EQB+BAoXXA6zKK9neW0u6llmoIn7w5HEogvJDsLJJLTNkk
	gJKMveED/YfvzGRPxmE6uXRaO0oqzjJ10UyI1trmdBT8QRM2d0oKgkTzGm3WNpHoY52RsvHcMN5
	6XnZ4zCcjrcGJ5mHo9gA0n3AZ0Bq1vwRqFp9vBsTfWQ7jnoqHtcALdIIdq+cxgIKPBjOCXBu7gP
	brE6FasodetoarHqZcaVdQgnE3f7Wb379AoRHrfpwALby6OlmVEp9m99SKI/v1Rtm89POo0TVPv
	fb5IIV5jPAvLjJcLk6x1X6NxJPo2Ez1d/7OJxL33HObvfK6ic=
X-Received: by 2002:a2e:868a:0:b0:387:e03:147c with SMTP id 38308e7fff4ca-388536cef04mr25730261fa.1.1771698994175;
        Sat, 21 Feb 2026 10:36:34 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:32 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 0/3]  Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Sat, 21 Feb 2026 21:35:50 +0300
Message-Id: <20260221183609.95403-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_103636_934333_A633D8AD 
X-CRM114-Status: GOOD (  14.02  )
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

v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

v10:
 - fix a remark in the driver
 - fix compile driver for 6.12-rc2

v11:
 - fix a remark in the driver
 - fix compile driver for 6.14.0-rc2

v12:
 - fix a remark in the driver
 - fix a remark in the dt-bindings
 - check driver build on 6.15.0-rc3

 v13:
 - rename driver sun20i -> sun8i to reflect wider SoC coverage
 - drop the misleading APB > HOSC dev_info() warning
 - require allwinner,npwms and validate it as 1..16
   (remove default 8 and silent clamp)
 - adjust clock-source selection comment/logic:
   when sibling is disabled, pick the faster parent (APB vs HOSC);
   when sibling is enabled, keep existing shared settings

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-d1-pwm.yaml |  74 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  13 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun8i.c                       | 393 ++++++++++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun8i.c

-- 
2.25.1


