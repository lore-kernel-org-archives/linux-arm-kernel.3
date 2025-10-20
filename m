Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBD5CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HnjCj7JbAdjNvBUGLpD1SpiGs6GWZ/iOIsdOQuRNQDA=; b=UWIQ4NM23BBBByuPTq/i9vxT0B
	qNm1lcpQ/INL59sxezlOHqvz5mRxahfmmfb4sp4ML5g359erNJqrRjgzLpodAGI2CKoewTqcd6Gu5
	IS+Do0vDH9KSy6gj54tQsMk94Uj4x+xrYFYwjP1ICUMl9Hjnt2hwuDeEFRi+BD3s9NVp3WmawUCxr
	B6pZcYbDEgkLgAHAxmh/3yPFIO99FH0NbD18Y8VKMydp5OFPWQfAajGK6J62sRTM9FtBKr5hJtRnl
	PRG00VqOJWOZGiVszAS4G+iincH2dwCa6yvOEKORN6yjjRmEUk54jDM9eS9bhvYrOF09XOGSIctlx
	p6mgQuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmcP-0000000Cfrz-2s6E;
	Mon, 20 Oct 2025 09:55:57 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmcN-0000000CfrP-2f5B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:55:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7930132f59aso5638005b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760954154; x=1761558954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HnjCj7JbAdjNvBUGLpD1SpiGs6GWZ/iOIsdOQuRNQDA=;
        b=OoGUlCXTXY5jR/mBBPfMcrC0VzovURfasR0oAQkDjzUBJzTsZtheTToEBeJavN/C/M
         v+4lmIv7CzhZazKMIsJtXO+rCKGzN9Py3D2q6eXgCtHjaFGvtdB7taec4VXORfwZEUtf
         xir3x1QPTOW/Fvj6QBBBfJ/S/7WDr3DzOClC3BEf8A0gsOyoMaKaXPXdvU4QEjI714HK
         idaPV1/0fSHM/VW4Eh4SAL8iPUdxFNPrJv9ABNSBI+EU0tA8gMmrtVdDhgrgoKtrk7Ue
         L57rR5MgQlNApNnrbNdGokbmn+bnUmcIRDIQIE4uUuxG9sqDVDOMsSB1cG3GZLP0MgTO
         /bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760954154; x=1761558954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HnjCj7JbAdjNvBUGLpD1SpiGs6GWZ/iOIsdOQuRNQDA=;
        b=phZWethUaQZoudPmH6q6RGn95m+qYK9tWhpxQSuS+vz2gGc4xGyYZK8QldJk1A0lQR
         qbnYnuEerF6rLxX00EHYI09WA5burEYFmkK8+vRP40bXrRCgMXB6lh3tVr0RBtrEOI8u
         0gWgxaHo99YBOt4ObLRn6eFoCK5vV2kIMJaKUK4SvSpIon5HrBiW4nfGKvshJ2728rRr
         Iv2zoGfI7b5oGgSroytKGIBWVXm956Obhd0B4dOiqnS4XlOKcwA1VWjEZ6zzeOyqY6WG
         mvL1VsAHkaSPI/QipOWp6YxDgQDXzu9QbGLrmhISrDjsQU7ivpCbAxpibCsiNttfdXr1
         J8Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUm6y6iwyyzc/vnWmQ3uwTasHzVgbG4JXbZM1qdOrpfI+VESRCTjocdKALqf+JNth7LsJ3dG2leteQlhONeb1hs@lists.infradead.org
X-Gm-Message-State: AOJu0YygGWj4QY2HcKmx70WmlE3LDswFnalAStHo9GnAmcp9D+09wSwG
	Ve7E6nMHF454jAEtAW5exjXmQKnjU0W4daDhu7UrO3OzXWyagrTcayqEclZ9WGLKXco=
X-Gm-Gg: ASbGncs5pI6gfMYLyqL5mLhjlwOMvl8uSWW6mvxCYdqIk0le+WUEARwP6HkI8q74Z0J
	0eJ2kLVIO6qrqBU1fAtXArtnC+F4A4dx8Mj2DXJCZmDlTC7nGT56Cfg1rteZDoYE+VdZQgn0AXV
	mM0fZY3rqDKIHvzxXPacWBuwJn4oePVoMnj0ya/0UiCvbM1cksozs/6ZjXob9chQ/AqQD7+qKlU
	hxxlwngUZJZaz7Fqo0btJZhHbpVuOueJ3XkNvP3HbaGAq4cc9DKevIe4+f+DF7KEqjm4qO7mXs7
	Q+N2cDgjzhq7s9fxooXnw1pxGfSpwqs14fPzYz6dNPwcfgbbjLb2pH9wthXnGs/mlgY1pmBeXkS
	1C7BEOkBSxDGyOo9IZvTrxiNHcO5e03G9iaxOUVzJ3kqcWeYSkb59dnGKZAPwIJYSNfzh2cM8/j
	c=
X-Google-Smtp-Source: AGHT+IGgDyGZ3OQ57iwdb2555NKJghSCCZpCKxoCPXr9rM53NE7X3m8ehUVd2NOzuBByD+q6WjfyCA==
X-Received: by 2002:a05:6300:8088:b0:334:b8bc:1031 with SMTP id adf61e73a8af0-334b8bc1040mr10403992637.58.1760954154496;
        Mon, 20 Oct 2025 02:55:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b6f302sm7256845a12.38.2025.10.20.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:55:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon, 20 Oct 2025 17:54:56 +0800
Message-ID: <20251020095500.1330057-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_025555_674228_F0B7BE61 
X-CRM114-Status: GOOD (  10.60  )
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

As the SG2042 has an internal rx delay, the delay should be remove
when init the mac, otherwise the phy will be misconfigurated.

Since this delay fix is common for other MACs, add a common helper
for it. And use it to fix SG2042.

Change from v1:
- https://lore.kernel.org/all/20251017011802.523140-1-inochiama@gmail.com
1. Add phy-mode property to dt-bindings of sophgo,sg2044-dwmac
2. Add common helper for fixing RGMII phy mode
3. Use struct to hold the compatiable data.

Inochi Amaoto (3):
  dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
  net: phy: Add helper for fixing RGMII PHY mode based on internal mac
    delay
  net: stmmac: dwmac-sophgo: Add phy interface filter

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 17 ++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 17 +++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 79 insertions(+), 1 deletion(-)

--
2.51.1.dirty


