Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB815C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ/8zy8l4B85cHtddHm5bMRDVmAGhs389YDqHOJWbP8=; b=kEc01n+nR6V4rQCA+V2452APM1
	SmfJc8hzQzsqp/qumeqVkRmZrRzsHs3495FpZocuhYqvb7kzmSkseHCf9yMk/x/un7gBphFic/8xg
	GYrl35yhiSn5PYYudInzZadK81KEICT+d6ffBc2FgoJ10DdNX3Pae/7V6bJDBuzSmsIN0y41TQDCY
	nnb07lIN5nHFyQu4s9W/IqinFc42ssrAOjWv9aVErUlyMFlvb/++sqCNO/A4cBJ5XvLnQdJ7U4s0d
	ZcULXEKmH8VHD8eRVG+YHSa9sgwgzDHvvLXWSc8RucxROZTWcdZLkwvVYGd2W0dZpqh4hXVJaEnU6
	+AflC+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjcl-0000000F1d1-1VjW;
	Fri, 04 Jul 2025 16:50:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3u-0000000EvIm-3L5M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so2200542a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645693; x=1752250493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ/8zy8l4B85cHtddHm5bMRDVmAGhs389YDqHOJWbP8=;
        b=nsvD9sjzg2MaK27K14KOnMvqD3gf1aEDPEn4211IR4gq+6FE6tmVXIKSJxCp6tc7bc
         iv5BsCNAV2XBpud7/ZHymfF3hADAthTyWqnmT6Iq+hMMPYFtxcTjgZFIgpE530THVcim
         qd9Toa0wAazxSd2UlMYuxSQD/VDQPNXiTNdzVseCTLq4eFAYiRfBzrq+V5lndy+E9uLg
         wWQA9AerSGogPM2zTbS1R63uL3fXfB4nmZ1KVuWbDVh/SOekbVk00BGUPQd/x3jY9qr9
         JO3old3h2RBtdPDoYZ4DNhs7B+9z8Oqjxzi2IQ4oKujrCUEvD7e099AybetIGvjACHie
         fiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645693; x=1752250493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJ/8zy8l4B85cHtddHm5bMRDVmAGhs389YDqHOJWbP8=;
        b=IuGQnKGNSq3gQvom3JCqwHvHYLXZk5wfhWc/sXT44EhS7dNTicCbdO8IGOY37OUP07
         jn6QRBlut7FcHfbZR97VJrZ2ArFKXFV6EN5OKloWMAjzcCh/jcFCr/31wM5MqfEu1bKQ
         VJ/838vwTPSBgJymc6hffsQ686VRwAtDSO1JR1YsyKXtd4XcqK/GZ8qHe1c4PIloYqaL
         Dg4/dN/wZ7FEdUIZ6Ftz2Mnvi/i1fHlQNFjDmsYjC24gtXifP9MAI4CSp4DBY4boNGJL
         9+N+BgUoDOGAZ60vk8Q3fPVRKTV7B6RORpUpTTmzpWGs9Kbii0ydMNUjx3LOVck1xews
         iYrw==
X-Forwarded-Encrypted: i=1; AJvYcCXLE+G6HpK0ZExuPii8c6/wrg/GO+rsERnUrXeoGklaMUaoP/RRFPhiylVY9OIaIeSVfsz0mkjXkCxmeFydtotE@lists.infradead.org
X-Gm-Message-State: AOJu0YwqINFxlgSv6fk+3yvHGYHynsp4Nqc82yfJzj4zyFGFM/AVIs8b
	ypmPTKjDet7tSkB/oRG06G3IIjCZOqDgwCTyoB9QusOOjger/WecfeDLx2vdzaXdN/o=
X-Gm-Gg: ASbGncuDQRyCeJdIsuR7vkGp8+5SqldrlzyXKUzcW+/6Xd+hkYw45wvDTpoYbbgZfhr
	MU9M0QUth/DujK2nv+aNxshL42o+woaPfvhW/h+25XiYaWMze1Yn3v6RBoJyFq4rwWziCKIas7U
	ysVpFV09KKodguAd8bYsNGFr/Y81HdfWB/EzhNyePVSnHjQtQeACz2lxzpNVSYxXGeom9coTtal
	zVubO6GIiqvJoCP++/yiGdUK1JsGIdbnt6dJN4SicBJN0Q30SH4fQR4CLqd2TE7hpuRAmPRstDE
	yjEiikUXF4NUD5ERS+cTkBnmsVjIe/yVIcP8f7YNhSi1gMx5Y4/Z1nwiT4MxCB9120+P7LGrkMx
	ejEFQen0IHcCBlAo=
X-Google-Smtp-Source: AGHT+IGDhz0qhVTw0+Jv8lS4jO8NKu6i+6S1WnDonE3OKo10n+XAusMMQdVW5VodGZ41K5WwIdd9Lg==
X-Received: by 2002:a17:907:72c2:b0:ae3:bd92:e69b with SMTP id a640c23a62f3a-ae3fbc4c2a9mr336020266b.7.1751645693200;
        Fri, 04 Jul 2025 09:14:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:52 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 9/9] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Fri,  4 Jul 2025 19:14:09 +0300
Message-ID: <20250704161410.3931884-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091454_841450_A2E6F439 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865..b3533ba5be7e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -227,6 +227,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0


