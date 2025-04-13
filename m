Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE64C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hXQZ9yojQV6stSDTDo/eH4vyNLxCP0mp6bCX3lmKvKI=; b=iHkb1CI3WJa1AuHB2dw1WTvFyR
	TPnyGnJZspYFRl9tKEkarBv36cMzwovG3+d0+beRy3ncXScvdoN4RKrOlZU+ZrdhbXi/I21M4QYN0
	Gh86wpz/s+vt0sDBEU0lCVq5VwHusEwPcUyay5VlfnqE4N19QVjmvGGkXk6Kt0ZJ6M8I8eZ/D491i
	QvUY9JKm/F8woCJ6E9/MRuVgFx1SxbVyOb85x/rCV43K1JUHljm7V6ckc1iMIv25xMR+t0oNk5oir
	ZyZhUbelxSks1qvbIbb7CD7e1+y7j8sXvm0DWy6xuWNXifCb83rCYkeOkeT8egG9c3Q3b8rHaXcwL
	N82+KPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3xeO-0000000HDo1-0uae;
	Sun, 13 Apr 2025 13:45:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3xcY-0000000HDaD-032R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 13:43:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ac29fd22163so538268466b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Apr 2025 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744551816; x=1745156616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXQZ9yojQV6stSDTDo/eH4vyNLxCP0mp6bCX3lmKvKI=;
        b=GP5OQIEb9znBbcz/cU1XqA470RQCQ/opYJyoLU7VetFA9TW0YwzrT7rRBD47stS57O
         9nZDARnGA0xEN//Hw209T1vrl7D1zWlIVBaIFijE7LKt3H2WusSwlueWq7SzGOPjlPmK
         SuZjtP5e9fbbuE9zU9xnBXeLrbBT6VYAbW1edOawh181w4ZDqUFSk6EXehbmRaVTTsbC
         V3fO2CTVERewmO6NHb7RiN3F8xzUT6+Fc41DqhxomiUPLCTU4UepyJ1Z05KHCZDcTkHJ
         /jpzFFwPLnZ+AXqe90Ub2+3gZDqvSAslMBG9kNbuQJSDOn2sqKO1DNe/ZbKTudz2ODTD
         CuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744551816; x=1745156616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXQZ9yojQV6stSDTDo/eH4vyNLxCP0mp6bCX3lmKvKI=;
        b=wAbaTe3bnLCP+JiTHKquqHto1pilvmctA1SikYMMA/P57fsrZMzOqGAVnZRqmf47jt
         tWrN1+SLxyY2pVnCT9BwUM64z1KKAm8xi3ZqD6PO2pKbcoJbtBHz0cb91j9/YvTkwE67
         huuTd17Dzvl/fQFHrmPm40/tKu7t23f8Jl82hiU/IGj1fhjDm3KUz23A+bHB2PKwPUB7
         WeV38IiB27n4B+2YbpUdK+nYkIu9LIf4YE9gbj9DgbV+zCk4WlDwpmbjZjBiskxvjmyX
         lWSs+Pj2jOfRxE9axxVrAuRvpzo0BjgshxYdzZKCYwR1WL4YwebK4zIslo/PQM5pnowF
         N1XA==
X-Forwarded-Encrypted: i=1; AJvYcCWZbHQN62vm2rSnVtcMPt61HFewz/ltNF4YeIKCnAAcxcHJYYZw1ir9XVh0vcfxZ/fll69u8CPWZc6p7/SPFPX2@lists.infradead.org
X-Gm-Message-State: AOJu0YygXC12o9ND2zswGrNkGN/HKwHUe9DarkJTo8NgdtiCVIrqaoV/
	XWwUJ/dlZ/u+6KSsZ/ZDfT7q1kIglyo+ptXQ+W9kdFEE7vlQvt2f
X-Gm-Gg: ASbGnctcBt+pEHnEg5qmC4yAUAk6yihxW36NllMYX04+idXaGql9NBz6HY53Q2aQ1nN
	mwFxnR1vCS0vpHamBIvvEzBlxuhjxb6ZDOUGS0cAorMGAPK3MkRTQEM+U/o9RHXvUXe7NAGcK5Z
	hsPprkWwkZIadIUUIaQJIMTTRzhQuEsax8O3Oz0bdQhcKoNpvZohb8cuxcBsHrBCa9pRIyERUCW
	R0MuwSpsJkMFgM9i+cBx8KpWnCArEYaEcsBUupvM/T6ZgHJbV8ihi+y962Dk3wGuq/kQIWFZf3n
	/rCQJeUEEUwQxilWeEpy+gBAt8J9A/QJndn27z/6TYR06gQVldyoY8K4Ewk=
X-Google-Smtp-Source: AGHT+IEOIJ1i4Kh+VcM9sFRP+cgJp2vQQUT+Pqo4qfUY0eHTw4Probs6u1rivZcSvRWydAIs1ARTVQ==
X-Received: by 2002:a17:907:3c95:b0:ac6:ffb0:a2be with SMTP id a640c23a62f3a-acad36a0809mr750895066b.47.1744551815575;
        Sun, 13 Apr 2025 06:43:35 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm749422666b.55.2025.04.13.06.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:43:35 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS board
Date: Sun, 13 Apr 2025 15:42:55 +0200
Message-ID: <20250413134318.66681-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_064338_064727_8982F818 
X-CRM114-Status: UNSURE (   9.08  )
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

Orange Pi 3 LTS has similar functionality to Orange Pi 3 with slightly
different hardware. 

OrangePi 3 LTS has following features:
- Allwinner H6 quad-core 64-bit ARM Cortex-A53
- GPU Mali-T720
- 2 GB LPDDR3 RAM
- AXP805 PMIC
- AW859A Wifi/BT 5.0
- 2x USB 2.0 host port (A)
- USB 3.0 Host
- Gigabit Ethernet (Motorcomm YT8531C phy)
- HDMI 2.0 port
- soldered 8 GB eMMC
- 2x LED
- microphone
- audio jack

Best regards,
Jernej

Jernej Skrabec (2):
  dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
  arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun50i-h6-orangepi-3-lts.dts    | 351 ++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts

-- 
2.49.0


