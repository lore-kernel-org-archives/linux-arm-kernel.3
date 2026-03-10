Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47286EB1076
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lc38Fn3zlBIPtaUNiDV83Wk+CmY8G7wJUmaKJGxKSus=; b=HhZOUJJDxVy5a+UPu/735tjyp5
	0oZdkYpupIy5PEpY55GJT5hGuELOQfQCFqerG2a29K8lgI6kt/qVffJArU8mC2YW6MkEsZCK7cUxO
	8/+6Ry5dBf1T9L4wvTqSyzCnxyu50ATs24PLt/MsfsKauokULHMG34/w+uk5irWRsYo5FfNxaQgWi
	WhJPeR1QOiDRAzd4XH9NCZPBj1FV29oTWtpK+YaUPQMhLiDz3cr9P5TO0upLR9bbBGxS1reVEZ87t
	iNx0v2eWPu7d400C95X6pEmeAjgdhooHJQP3d6M+r3YW/9RCzLCSSPBkbxt9W+qV2VGEx9ysSXvQ2
	DgM5OKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzNg-00000009rNT-0P27;
	Tue, 10 Mar 2026 15:52:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzNb-00000009rMZ-01m3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:52:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso19526215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773157937; x=1773762737; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lc38Fn3zlBIPtaUNiDV83Wk+CmY8G7wJUmaKJGxKSus=;
        b=k2W6qmjshChXmVoc0ydjFQs0eruKZJlftbaN71hMt/Ds9Sy63ndTQut5haTepJs8zl
         Z/JPBE00egquLN9edt8+LRUX1SlJv/7qKMhw+SXXC8DfPesat3hWusAs8UwVx0mulkCZ
         pNZqUn4oV1ScsYFMYBysdExDATWVn85q5+1UM266btUmCkpK/ZDBBtdKRfWy0l9/hNfo
         GjWNqje6/9QA0ch2Bvwvm/GLzU8OGAJKpvGiEPW6d1LvAeI5mbC/EeIB2pRl5R/lR83v
         UDBQwPNg5hNUDJAcbNXBzyUF0ARUAO8SA1B3iuT3k1lRf4dTqNZMYmI8VwL8By0gQo7L
         t+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157937; x=1773762737;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc38Fn3zlBIPtaUNiDV83Wk+CmY8G7wJUmaKJGxKSus=;
        b=wbZsFWr4fj55IeyZO4I700Zf5dOBgyhqwQucdZ/MH9kCIyk/hDK9UuLBFeV94ZIjip
         RjEsthBpisLTBv6Ff/7BONFBn4QHYrwz6D3mnGcfq3J4lngGQ/nVC5WhoYBossLOnNBd
         ETXNYIUX5Mj7xVRcOB0+KWFxLae3Z+Etgk96EWkioNHDdYcJDKh6oLmTbkUwvEl2IcaW
         zdQEibGgdKuhVshckGjZd0Galrs3/TuBMdqowZyc39dEoqIpGYlYgEsyPfxMfteHUrCR
         odK+PQFikD3W5JeVS5WX8tU0xkNSKVgRHTWHHtwQ8dW8AT6lloq59198ASuOUPEJurhz
         itGA==
X-Forwarded-Encrypted: i=1; AJvYcCWzzAWYCG35tPBPZzoDC1OpGVJzpfyBVL78YwMENfhOuZZFqyZVUrRweOib9DMUCcN6rGXS7gq3dLwrdhgQVKlj@lists.infradead.org
X-Gm-Message-State: AOJu0YwNoaHxmPRytVnIXYmdJ/56p8N7S95Az8dDNFiDCj3V09GWfBNr
	yw7p6MMD3HimxRu0MaLdKug2nXGSXKxKaAzMoND1iMPIf2zVwD8vwsiJ
X-Gm-Gg: ATEYQzx0w2G+/X5DlxA78hu6T+8DXn+FiTFXXa7uMNYCxdJWIxHXR3bURwIMpb/DQzI
	aoxMDZCuJXthiLqc5SYo9rUQO2hiNlHbKfDfrwfZYO3D7qMUtOChboAYhEZR5+wS9trG9Cle4NS
	R+2QrapNGaXy9/3ogzlICWrESoyOm6/1G46BoyVAQ3dss3CQ6s24ZGxAgCc+b1NsuSTDbzKfb7t
	MOdTAEnJTwDLE17rg4w4pnCEC9FcLJqlRdERSgV5/vjS31OYpY7RBQVb7HVHbVBSzlPwZlFnnpX
	9kPEvgQENn4oxAyv3dU3PSdZtBDsKkKtFIFekMvfJoeAlN84wpM1U6/uitB9Ah05pYYqZkfQfbE
	kk633VdmRoTjXhsCSZIndYNOX04PVY5Qx9YCTnK545P5aVpHK2KJwTvfSMEPFTULQiZgWsGpQbb
	TVoz7lq7K1y75ls3kJlwHEgrPABPnxbSg2ECcCmlE=
X-Received: by 2002:a05:6000:40df:b0:439:cc07:5701 with SMTP id ffacd0b85a97d-439da86f256mr28292468f8f.56.1773157936802;
        Tue, 10 Mar 2026 08:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:3201:3d10:6ff9:342f:d717:ee6d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae483desm36426630f8f.34.2026.03.10.08.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:52:16 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 10 Mar 2026 16:52:12 +0100
Subject: [PATCH] arm64: defconfig: Enable MT7921S support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
X-B4-Tracking: v=1; b=H4sIACs+sGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MD3dyS7JTUtOT8vLTMdF3TFEszI7M0IxOjZHMloJaCotS0zAqwcdG
 xtbUA4L4OYF4AAAA=
X-Change-ID: 20260310-mtkdefconfig-5d9626f242c7
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773157935; l=1129;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=zAmOBnyEggFR5OQAvggPS4f6KRDzPg7q7H1L5xGnwP0=;
 b=1L8BUqfuGaDHO8J5p/bYLGHuQo8iUTCv5X5duPwnSfrdhMj3c5eyNcC6HhORXu1n0HAw4Tcgh
 wEZhAqGVhKnD/6xiDYOPhuYdxOG6I3Ar3vkmGntV7iqRXsY/Xxvjxg5
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_085219_068422_FF8BC540 
X-CRM114-Status: GOOD (  10.08  )
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

Enable MT7921S which is the SDIO variant of the MT7921, also called
Filogic 320 [1].
This driver is now used by Tungsten510/700 platforms which are now
included upstream.

[1] https://www.mediatek.com/products/broadband-wifi/mediatek-filogic-320

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..d469ad15dc69 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -200,6 +200,7 @@ CONFIG_BT_HCIUART_QCA=y
 CONFIG_BT_HCIUART_MRVL=y
 CONFIG_BT_MRVL=m
 CONFIG_BT_MRVL_SDIO=m
+CONFIG_BT_MTKSDIO=m
 CONFIG_BT_QCOMSMD=m
 CONFIG_BT_NXPUART=m
 CONFIG_CFG80211=m
@@ -462,6 +463,7 @@ CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
 CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
+CONFIG_MT7921S=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
 CONFIG_WLCORE_SDIO=m

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260310-mtkdefconfig-5d9626f242c7

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


