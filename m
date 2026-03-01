Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10EDFD006E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xl6LEfLK9tdCNQgyQ/VrS0tP+yDNwnSSeWFW4LxN94c=; b=r7Z/XQ6y08+syVx7bJUqrgMqXr
	vB3gxKrU67Cf82FKYCz40eyPTTC/Y8tavC5lsSkQ7rvPCsIwKt2lJH43CCOVHK7s4bzSize43Dw2b
	EuG9XjmPS7MxQ2y1Tpzjjd9p9cV7UJ+6h4tIbM5Q+YcRXt/8R024VE8X9PLw8QBOEu/b1RcHYU9jl
	ZBS1Oz3aDaEG7Q9LlUE9F/UKIJNleiEk500dzemVXuPtQeTywnSuM+06FP1Sy2smMbjY++GwLNt9m
	tH06STVfwKtmo68msCId4/9MuEbihv5slV+Oz56GqPyFyxBf8PMBAtg74wZTFtIprbGFO90FQ4qEH
	osqoC1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiiX-0000000Bbwk-1zEI;
	Sun, 01 Mar 2026 15:28:25 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiiV-0000000Bbw9-0Sio
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 15:28:24 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-506e287dd53so33320291cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 07:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772378902; x=1772983702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xl6LEfLK9tdCNQgyQ/VrS0tP+yDNwnSSeWFW4LxN94c=;
        b=dv8Ac2NYPWUx2aIGUaqufXwNliIwPTNWIx1gTl1SKc69C1IBc0Y6cBpZinEeXxZN2d
         386S1wgYqvbjvyUtUo2M5q5PMWWKXi4PzHRRaWYHwMKAzxFpJ+Bz1aw8uDyq8bNECF6q
         L2yjnPOQBAQbeDTJefqZcSzxw+DRxTu09OAVaRdOGXD5jQXT8j/cJC0VDmW+LAaxPOLw
         Fufr5bJVl+R0cpmenyjBXRta5bVX2ct4x2RMkF+j1VelyWDFmnQ+G2sj7uc20mVIk0al
         3sLApGya01pk9T8+/C7IY4MebvCFMl142NBBI6sLo4zh7aEtCIlRjT1HSbe/b4AD7hM+
         FSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772378902; x=1772983702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl6LEfLK9tdCNQgyQ/VrS0tP+yDNwnSSeWFW4LxN94c=;
        b=T3eGipdMqMcsVU1DtpIB65B9+zo+0wxfu1q5S0JqssbcUtxbGjkNGHQMOU8/3KMRnj
         i49oywTnd34Ont8OIIO1GICXhWIQZGJMtot0MijrQEmKfYirc4Y+KeAf0bfFZuj265W7
         MqO9Tf66ZrCas3UOMT7WqoOxAdSTlRf1t6enFpQp0dYBr+s43m5MBQWuqDA1YOfnPo0S
         GNFueEtqWkAd3gw36g81MeNRt5wG+1uSs3WxnPUcnnai7a80JRwjs8TXg+vprAjyPsgE
         aenIB733gELF9sQFg+B3MHlNsK4zrIyMShe5fabHmMuetA0yrRLrYXCCaBqEPSa86ZeS
         7Nbg==
X-Gm-Message-State: AOJu0Yw/wLok42LDeJ1qnofejzf0CVr1ZAYwekpjrnh1D6aXfaxYyiiH
	JEwVu8wte/HgM2ZdXuW7Gah4aMeO1bjW3+jXMW5Q7R45Vg6Kzs0b6OsJMExzcQAVe9E=
X-Gm-Gg: ATEYQzx9xlThU5D9VnUss6b1c3PZiAvp4x8soOPlICZYdToPAdPrvdMpqGQ9QH0f3mv
	n0TtYZ7GcQ1S7Zqp8Diyl0zUDfFny2x+tD81eaD0+nX23I5yZCZTdDygUZZNcQr4KF8U8aVd4ny
	R/sM25WIFCycOgBRiOh3JeYlYkrUgRZs6CasP6BOaD/3P5jANmDQZh2VWFEHXzqb6e50D37a83z
	fg2aZp/c8y5y6B3aZaFPBDbfzVEE/XizFWGvreea2R1ev/VtztTzctP5mNEW8nxJB7WnMIJkxJA
	AgSmxV4pBwfStqJSKav3KPV4FkhUkLM3JR1RaQHZ2IJOGTuVe3VrXse58LAgrg28aa3U+x64zBg
	ns9A/pn2dGkuqk9uSVOgUvzZ7mI64iHy74rex/KZmLUWuk/aqY21YRxWXgpog5wR/r59OV9mqw3
	Z/PxL2cs8ZRHoC7sflj/Jvi/XKlYvc5k+tt6kP/lVVkb1fjveFcrJIJ+LHPcSaL9BX0nqVoh9X7
	lhC
X-Received: by 2002:a05:622a:1787:b0:501:4857:62e3 with SMTP id d75a77b69052e-507529a9c8emr102044411cf.50.1772378901545;
        Sun, 01 Mar 2026 07:28:21 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e53a16c0sm32849486d6.35.2026.03.01.07.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 07:28:21 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH 1/2] arm64: lib: xor-neon: remove redundant filename comment
Date: Sun,  1 Mar 2026 15:28:19 +0000
Message-ID: <20260301152820.2589291-1-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_072823_169931_3780CB59 
X-CRM114-Status: GOOD (  10.28  )
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

The filename in the header comment is redundant and not recommended by Linux kernel coding style.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 arch/arm64/lib/xor-neon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/lib/xor-neon.c b/arch/arm64/lib/xor-neon.c
index 8fffebfa17b2..c65b44a8f134 100644
--- a/arch/arm64/lib/xor-neon.c
+++ b/arch/arm64/lib/xor-neon.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * arch/arm64/lib/xor-neon.c
  *
  * Authors: Jackie Liu <liuyun01@kylinos.cn>
  * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
-- 
2.43.0


