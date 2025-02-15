Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48419C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=is1pTYO6hsOD/Q0FGbUTVInc/xQnTq9eedN5nnjkq4M=; b=vCo/R/By3x7PsnVwP9s4TfThYV
	uojhfJOW/M2n0mrhw8JMYph14lzmpvqg9rB+87Y4ddgLRpvoE6z0PubcOnS5Jq1kDAe0JWRV///pI
	BE6KnTlRN7pGjSiM9gip1X4jXUUd/ciQP22iMNh/AsJAEWdo1aHkLEQ7hYmkGXmdmQu6jAmuN49lO
	459GNMTkxGt48g31Ta6Np/tJGUcFs/zx8F2HWsQwjD/U2MA7f4xfJXCG4G/irhOOAIKbOs4lQL3Fh
	bP00k3te2+YITaXmKOU6Ybj+Lx63EVYPp57fgo9PchdG+SjjU5NKc9PakRw4XBRYqa/hjbSBu9RKF
	CVCPPGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGmR-000000000BS-3sWu;
	Sat, 15 Feb 2025 11:56:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGkz-0000000Hb1W-43TG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:54:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f378498c9so196244f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739620488; x=1740225288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=is1pTYO6hsOD/Q0FGbUTVInc/xQnTq9eedN5nnjkq4M=;
        b=PmhSq5h57p/kcCpfjWjhu/hPdW7lngN5Y5i4CbOq/7PiAqVgiv7GXfPh3ilRjkvBwe
         Ahg6qXtt+0lOJR2XZNJwfCQQm8frtMyXzdQ9fF8DwFfgkik9WEVfQm9qs+ReHnM3C0JX
         9uTWa+hVq0EoHWVMbF0sFdrEUrH8TkNUtdPHHPKUjWiJKhakmNjyWZfxJp1RyC26bUok
         gZ1V8T1ZkbQ6k+PbPtyhxVa9U6YOxiGlFMw3VaugqFCT2/lWqyQBJfOhJ4MCkV4wqOyV
         fyOAwi5MPQlQoI2SwmUl3Pq6k0/uJfnSQyIew2yH14dggc9oLlh6j91AD3M+L7Lbuxuz
         CyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739620488; x=1740225288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is1pTYO6hsOD/Q0FGbUTVInc/xQnTq9eedN5nnjkq4M=;
        b=LaYyOWMBI1jzlsp7TYUXe5j2FmV0VJXMdF7BfxXUReeRMdn1S8jrD/GLfTueH/+8qQ
         ANs1mm8ch2ql9jY1j8MH/MbKGFzkJauwNaIvcuELu1boXnKg70DxsoDOMWkvEqJmfgE+
         yhl3Pq70zbDHD5stcfo47V2fbzvEK0Y6t2/NQMdxxEmysEr0RNCwNuyJmY3CeUv0NqQI
         5LkAYfDg+cbOuZX+ZbiRj5sENQNX72CFeoof22Bsok37aHHQqGJ1wpv5SUIUp0Xd4zIZ
         3BEk/R13EYhPhcRbTWSxkHtZLf+MtVLnO1ZIVI45iTdBYspyGVVKotpCkO0bQ2Kmci3G
         RDiQ==
X-Gm-Message-State: AOJu0Yy1ok9oD6zDvGUzF2dJh1WVNZjcC6HsPEtgUxY/gEAjdxRCPZEM
	6oa2prb2bVYYAeZlhcB9RlxxVqXMoGmAA45XqveZrVE0UqtekVSi
X-Gm-Gg: ASbGncucRVTEewKWifPOyJb6M5SNv26YcTAMFczFZQrG2GSeqwO6vf5tW00LvYz1lH0
	z1ObS5u/KdESQxUXtEbpPMNNx6nklpEwXACIOgI6k5Y99KX0djbBlYJNuTxZYX/gG6jpQecAVy8
	x6SlJwFce4U3tfp/5eVNJIGRbPw9dn4i0arMva0BJAp3VfriNHzArExggA6DtTpi1pOzLw6otGs
	vI2VL73xEVpHbC3hFgLepzrlJbWDLFZQpTY9oXID41tKekhfozKfZoqWAuzOkIAMlhmoNi1n7rq
	x3u67Y2rEx5NRnMyEY43IZjA3VfNqfHKF/0rurAp0kna4Rm2v/RaqJ4rLjlHfHPnvKE=
X-Google-Smtp-Source: AGHT+IH9I+kF4E4FBAJ0uc10UZJds1ZQ+kSU1H9nf3tIt5AgUxMSTM3lxPiTDuhkF2I5bPfPT8RVxg==
X-Received: by 2002:a5d:59a7:0:b0:38d:c087:98d5 with SMTP id ffacd0b85a97d-38f33f125d2mr3534739f8f.8.1739620488237;
        Sat, 15 Feb 2025 03:54:48 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439617de5b6sm70029875e9.1.2025.02.15.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:54:47 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] clk: samsung: introduce Exynos2200 clock driver
Date: Sat, 15 Feb 2025 13:54:30 +0200
Message-ID: <20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_035450_008484_B20AFC3C 
X-CRM114-Status: GOOD (  11.29  )
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

Hey folks,

This patchset introduces clock driver support for Exynos 2200.

It's modelled to take advantage of hwacg (hardware auto-clock gating).
This means gates are not defined, so that hwacg takes care of the
gating, which leads to a smaller and simpler clock driver design.

Gate register definitions are left so that they're documented and
in case a gate needs to be forcefully left open in the future, we
won't have to define the register.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: clock: add Exynos2200 SoC
  clk: samsung: clk-pll: add support for pll_4311
  clk: samsung: introduce Exynos2200 clock driver

 .../clock/samsung,exynos2200-clock.yaml       |  247 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos2200.c          | 3928 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    1 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../dt-bindings/clock/samsung,exynos2200.h    |  431 ++
 6 files changed, 4609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200.h

-- 
2.43.0


