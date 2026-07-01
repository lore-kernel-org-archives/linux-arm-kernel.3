Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAACC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ci+x4l7rGyX9PL16Opy1ybmCZaX0NHOsnDWtrHzkaw=; b=PySMO5l6GUnv5pz2zd0fwWtRDE
	UPHc7nrylTL9kozkfaFnHcZlmLcxrP/Kza0Wm2wkxKY+Pvsvd9wyzSYLIMMEiWWKWkJCZ2crRLJhA
	nSEy6t7zR81NraZsX67cVLZPQBNX0r8PUfHWhhP17m+146PkJ3fmSc06ftuKSZQfL9FJ1aryEetX4
	TSf3poIo7MH6d1fGMjjtEVG+xdVgBXRB69WDCRqz0jMDv8zpg6nCOUPhd/nZrI4X77c9NimO02qRd
	SlRbqxE748JLOVpAHqCiwe53AhuiawsJX112HS6Ju5tPneB3ApM6vf9aAGFezQ1nP2kd/oIv2w6Z/
	J3I2gHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexFr-00000002Rer-3Y0m;
	Wed, 01 Jul 2026 15:53:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexFp-00000002Rdf-37ua
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 15:53:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4629051c946so623951f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782921216; x=1783526016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ci+x4l7rGyX9PL16Opy1ybmCZaX0NHOsnDWtrHzkaw=;
        b=XQ0LCp51wZnEDNyYoc9Cah4ddbRS/aYZyVQT+jfCaONV60ssud0RVnOmYjoqvEzju+
         WoLKtI7RXvXlhBojRndqPQbX9T4hjaiCcEcBiNF0GuVbKnjexBuEBJa+yCRnEbxKiAUG
         Tt+tgdtQ5urroseHA+AEA3ZMEOpthv/OvxwcDdZnVRWz733ojJ9PkuwHr8dizWPogCLO
         m7KeulR+f+XS85t2CQOXMJ4YvGzgLwkqC3tRe+mddGuCkfzc8pEdzd5cNVeVOMFQZzz3
         Q/GDgay11aNFAAnfNZrV2uwu397x/hxChMdxFUiD2QjCzA/bX3fsZmFCYMPuCKbo/E1L
         ooNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782921216; x=1783526016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ci+x4l7rGyX9PL16Opy1ybmCZaX0NHOsnDWtrHzkaw=;
        b=ZF2qq2ZykW0uiJH4Gms1BUOxYkIVpKudWpV/knrGowerIzlY9b9DnXMOhYDz8+UAUY
         /OwtgwbXs4xge82fIfPmC5WemZf3dvq0cSQiLV9BJSMXhmq+XNOWvk9+u7i8LZw/O1H+
         lJH8wZkmt5UG1iU8d6Nhc9LhaMYdUmxAq35CsYUT8IZ2nkcXVV/0J4PvptBrXgDproEV
         IdUVTPW+xt2EGzAdYxKeYOw4KMfBveWANif7UOkYwOyl/3rd0hAVEI/PCR0E+5oQOmW0
         aeltTEQEZSvrsbptPSmOz9zUEjPCPUW0qGe3B16D1LsdhGgtGOctE6wQNrW0inlWxGcU
         ZpLA==
X-Forwarded-Encrypted: i=1; AHgh+RpWYe7MHTXDtJo8kE51Fbn7OTYELKZfV+IONgmE4DiDDh66p9COdaL11FQkZ7y/rZ5HbrA5HYg8bV5Zsy8A0lzd@lists.infradead.org
X-Gm-Message-State: AOJu0YwEp3TUvhgp9QL2XmxuyisN2tsliBP0edmwntCSjuzp1X2uQZBF
	TsZbbA/RaTEhyCPU7riaP1aWUHNPZnEystauVE+UaVXnXXZHKVRRVFFt
X-Gm-Gg: AfdE7cmsDUiKSV9nsc0P+gY9LwXCNmIB1wEGhvtsTUFljO8jl7Irfl9in/tMGIfIB+f
	vy3dF+Hgwxri4xKht81DTYhWGdYrb35ODX9r1rzYENMJII+yhJEwXAKnhRM6x7jAdqFpARg1VuX
	xOKHZhsPtZaoeU+b81UQjaEKHwBY/FHgqJmPc4AB8PiwKmBImBmgE1OMIL8TkZahahjp2hVNQUQ
	f6SNWHfrol4Lgq/QqXFm7nrf2bVop3S/0C1wNIs8jt/4ZqzGoW1TC7kWxMkO+jl6KkaDDd+mr1o
	kUPqSs6kl7fzRyC85X0GCvh29/vRInns6fTok0VzNqoaYUkIqayTzvjX0rcwtkVLoeXM8SN4+PS
	BMSOl8PWUIARsnBETK1+OlOh8jPcFEqjpHNEWPHja/XpHWzZmsqTR6cZ6jkvh1XRZZY9TxNu3lO
	mXGqQW+mgwRaERMPpgMi2MJxFdlFoHTdPfxhrKoh4suXRUmnS7aGV1SaOoFfBQ8PF3BAdluuk9W
	wOG6Fyh0LCJSXX5Zs1buzAZdg==
X-Received: by 2002:a05:6000:61e:b0:473:1e79:87e6 with SMTP id ffacd0b85a97d-477437a9a5fmr3750786f8f.3.1782921215516;
        Wed, 01 Jul 2026 08:53:35 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm803715f8f.8.2026.07.01.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:53:35 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Herfurtner <alexander.h@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart: wm8904: Add INL1 as DMICDAT1
Date: Wed,  1 Jul 2026 17:53:08 +0200
Message-ID: <20260701155308.40612-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_085337_788916_0A6A7477 
X-CRM114-Status: GOOD (  12.01  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

On the DART-MX95 platform, INL1/DMICDAT1 is used as the DMIC data line.

Add the wlf,in1l-as-dmicdat1 property to reflect this configuration.
This enables the internal MUX to switch between the ADC and DMIC as the
capture input.

Co-developed-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index a20fadacaa6d..d43270a1d907 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -158,6 +158,8 @@ wm8904: audio-codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3


