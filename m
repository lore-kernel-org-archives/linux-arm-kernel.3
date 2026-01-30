Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DAEE6BF0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0EdujWQoBAn/IwVhOEaFp9E9St0lYVYzZ1tCazrBN34=; b=bWyIA9Jmq6NKLs2063oQeSMX+7
	gfD5a/KIsF/p9RkBV6L/0RB8782D7h9hH/P82c6oPvnNjDPyeX6Rtgc1AYoFN4N1oDB8+TrPQnWvq
	17GfFgR/U7Is2qJut/MD+6zc3ysRSHNEZcHm5VymBGk+HvkTstJKL6wSexq9Nt8BK4lbYiN8MVs0l
	VLvPR2t2RAvv6gdYPOZ6b1o1qMGbeZ6nOE6lrAPeaz0QeBKrsbQh5yevg8JHXQYpKk4zlQo9STjNz
	JiDwXWpRuU6SvaffcFGgDdP0cOV+QlPFs5WKoRNTI1+oG4+y8dVmss1wSIDcwX6uVdzW6VhNRIp/S
	KOoBnw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlonM-00000001YC1-3r15;
	Fri, 30 Jan 2026 13:44:20 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlonJ-00000001YBT-2dAI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:44:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b8849dc12f6so323262066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769780655; x=1770385455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0EdujWQoBAn/IwVhOEaFp9E9St0lYVYzZ1tCazrBN34=;
        b=bT3u/qhQFM5NUZvqyBxc97clU7Z/dWicjTGkqa5/mbqMae2opTGwVljNxbvVRX2CMk
         GSmQFM4Upfl7k4Ts9fAGoEe3VKJ9uwlNuCa0TC42zwQSRkDzVuqsWwzGU7JhWHXZUSsU
         dfKeAZx4CemMImphPgwod9pkaUrpUUaWhbiEMq62k6hw9T4QH61aHY/57lR7VmpEFhLG
         J2qdjP30w5abaskMYIWW2tqpT6P4UzKoeKk+5+7cXRh6SxszMBkuanAeTY4reYFHXT18
         ZI8/B+F9eppd7sYxgSucwgdwuVONWp2rBS6SPceumOKDMj32crxF/bFfc8wkFNsDd/m9
         2EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769780655; x=1770385455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EdujWQoBAn/IwVhOEaFp9E9St0lYVYzZ1tCazrBN34=;
        b=ffkzvmneXMg+ZxKU4rOtFxwX3r2epZWhkoOmuqg6uGI/fmsKCuhyWOkWHb/6euaVvs
         57zJytzYyKEvR9123a3/wl5W3xnG9szmHHMZF4kqob4UtfUDx7mq3W008z5lU5mafH7t
         xQ2dvI0Y69uGubrEsjGi831TjD1DXuL6dmJ0bROOJBvqwzUV7Fp2+SZqWn6NeivAfFT6
         jAyXpVapu01F74eTcgs65JtJdmNu8jsKAhSUxKeIOJES8/Wnj+x/RmdvZfgOJ0QrTP4H
         RGj5fO2FZPgf+CJJunHyh4NMdb44NphOIDEXR92jfRDG3Pmkd2QVZX18f4d0IqdikEoV
         6cpg==
X-Forwarded-Encrypted: i=1; AJvYcCVc2YUbSjTjVnZSQt6g4j6P0SMuV9tNz7bpS+/oBVxz5P6VhpVIO0NsEahShNDgwoa47TG1n96zAw7jm6g693+A@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9/8kYa2LT9qVk520SOaY7FS1kyolItX+sfOeng+RUAwKo6W3/
	iCK0MhQZ44LwbZEEeS0RCetYMRBYPCrC/IQierZqIBAJt1oYl9JmmBlZjWT8vw==
X-Gm-Gg: AZuq6aILcmGjt3i8231HUaDJ/3DtTijnDl/qmSDnZL+zo27VdrMxNn3Y4/ZuQ0u/aw3
	MRDaTpomaIuN9OjvKMhetyo397Ie/F1BdcHIfq3/tzNSXga3vy3bqQzArAVAp8zsAbfxiG/a5VV
	HlLSLWqxnz85o03Q+wUff9HvmB+ZdzTM/1M7hsbStU765mR3r+3+isCy9dHUUpMf1+ICL3+kQ7A
	Jx6Ok7pQXvsdgXB8fUbExGqJAtM8zo9I559spShAPOiEKkBgj3+MaFxb7z2lnvf/2lvxT3amDUz
	vV3R97rvK7BBInC9ZtfiH/p94+lUHdPFYfnHqPLtP4cf+qHtYoh1io33lQTAFVg+s3f8h3qjR2F
	l8FTGVdHrwcDHdj4vEm7XCMskh43SpsVe/rzq9vlj5qHpZRW/3+m8guPCEZYJoy++BnE9QU8krl
	2MLY8cmMffU0r/k8QePFwUUpTP3wjk0EwgZRkRNPh98A6/mQ==
X-Received: by 2002:a17:907:7212:b0:b87:daee:a6c4 with SMTP id a640c23a62f3a-b8dff6846admr145665366b.36.1769773667338;
        Fri, 30 Jan 2026 03:47:47 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de3046abasm243751266b.2.2026.01.30.03.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:47:47 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next v2 0/2] Add support for Renesas RZ/G3L GBETH
Date: Fri, 30 Jan 2026 11:47:38 +0000
Message-ID: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_054417_685793_A022ECE6 
X-CRM114-Status: GOOD (  10.77  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.

The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
EVK. The eth1, pincontrol definitions and hotplug support will be added
later.

v1->v2:
 * Separated ethernet patches from series [1]
 * Collected tag for binding patch

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 77 ++++++++++++++++---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  1 +
 3 files changed, 70 insertions(+), 11 deletions(-)

-- 
2.43.0


