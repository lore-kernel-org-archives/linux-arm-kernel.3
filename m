Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F573CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 00:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8s7zFl+2eb3TMAz+jhCE+xRnt2/MEJ1FXnvoxEqZlz4=; b=sHv2IA+6gaK1CBqZoEvZJCulKO
	/hbmNcx1oKbQ1De4jUXHK8YAyhJVj7FxNpJowrcMYetIzOX4pAnajktvWbnAlAbBad+BYH2AjOsnN
	i6m8bGnyYlSiQjKumndmlnL+yc8gp1QDQ4j04oDRmYOfnCneMl4UDVGJj/hokHaDtBrGgIH9Bzxh+
	RGtMvEwKe2QQYqXwXkLTb+8/6pj5H8+Q5ANq/s6d8HCPUQ30bWn9RyXtoDQGXK7yTsxRJdfD5kLMw
	Tn7FLGYLm67Oo7d2hu+OL2HY2qtKSM7Xx7oglEGOBtRTRDklcUqiUFEcpeFhQR6sEj4c21S0qMRjQ
	7R+LqDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXjy-0000000F0KI-0S62;
	Tue, 28 Oct 2025 00:39:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDXjw-0000000F0Jx-0woZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 00:39:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-290aaff555eso49175815ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761611947; x=1762216747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8s7zFl+2eb3TMAz+jhCE+xRnt2/MEJ1FXnvoxEqZlz4=;
        b=Ct1CQ5kdf3lklwdF9gooEATUCJAK+mCdZWXkCjmQ19klrU0H4slWyJcjvofM2HX5aG
         +bHIHhaqpPJhMByt7iTk4lNqaOUppm9NzpjXLeA+bwlhH5MfV0Mg7Ohg+qXilzXoruTe
         tYZmLTaIt2GaQoJk839nskI9leQ0JmA0fFdQazxL5qluRjuZM0RS7NeMnFwpKunk/o38
         +co6IKzfgpipj5sbfhIO87jN6lVmKTj6vU8vUsV+6vf2ha0zQ4U9psBKlIlT8H8Xdn3j
         tX8z6Hmumz4O6YifAUEb/ETS/jHfdVMk3Ne9rHPE/tQ7fxKo7phe30ZccWSLCueQzaEA
         0seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761611947; x=1762216747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8s7zFl+2eb3TMAz+jhCE+xRnt2/MEJ1FXnvoxEqZlz4=;
        b=vPCh3iBVUxtFKKzyLZ5E6lzmfdA9Q9qffEgly/e5MysB6Y11xQCcu4qGMMWh/pgvw6
         oHJJx5tqPeP948xXfy3atN/2Z9MjJinN020l2PU//+phNj3NCQbdYNPAcR6tVOr3HMlg
         gh7Nv+qKuGOyIhkt63u6Lg/4aIW5v27mnsQtJiR/GO01LnoZy7m4t7mQbo6n0tZtVAax
         zBNs8GkX+rWwfHt5InA9N3/XEyYTfyGB3xDn9iYiedMCOJ/uuhcY+82WrONKix16rIbp
         DZZrlaAntXgd0Yx6U/8mldTI8YimrSqcopnO8HpEGeUc9K5yqXlz0WGKCekr6lYoc2CO
         JmkA==
X-Forwarded-Encrypted: i=1; AJvYcCXx9sWsMBBqVpZmiWnQT7w8vhK2mhLQoGQ2dWXUtQcNHyXsEEkYieE4/7F14P5wNC9SCtec0m0IlGII7gYrtlGO@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkg/GBtrFHSrMGR68GTk/PWZnNdr1grD1K7O7z+OF3Okb5229j
	lUlOFdzIDsPQOrApDFngdnGo/nTn3kLwFsYkxOEiL2AWjK38dJE1HJSt
X-Gm-Gg: ASbGncvbW5htyX/VBmpvJKLWXnBZnIIp9l5LmjHeVF1q8eRnN7vpPqMuVugHI+JBcd1
	IEvhjokvD+pZG/dOjyFDuq1ejKBIkKLSj4S+jzSzw6KvTch7lrG5jfY81aBxSu0USm5hODJNgLq
	ozTx5PbkAVEIsv3e5DlYEmOYSe8DDEs7cDKSgtabdfJMujufiiI/z1Eytz5S7gcLHQGJoCoIy8B
	pMOrrJ1FkC8GnB5LUrb6sOjv11F4k6N2AMT0xlCaAmuJXSdvjdoGrKwCvi+WIXLswcoGzJBmLFK
	iwLI0H/lztGEdJxv+kNLSugjc3QkviEq3NLocBxgvKSOOtQf3gOcsHJFQaVMsVs/mSwd6VTjYd+
	2A1emYHa/66cL1s2IDIvVINn7pI6mFewdiTGz5YvmJ0fMT2z0qqfI76mG7ImuUFA8ipuxlJCdV9
	y47cdOA06Csz+GDqERD9SR
X-Google-Smtp-Source: AGHT+IF5ghXu9jBruY6ziKGQyMSMM4oq3ugUChPGlRqBf0309+0SovNGzWf+rJoqR49uQlRPUDRaYw==
X-Received: by 2002:a17:902:c402:b0:290:b14c:4f36 with SMTP id d9443c01a7336-294cb52db11mr21604075ad.31.1761611947142;
        Mon, 27 Oct 2025 17:39:07 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm94353925ad.12.2025.10.27.17.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 17:39:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Tue, 28 Oct 2025 08:38:55 +0800
Message-ID: <20251028003858.267040-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_173908_274153_8D0F2376 
X-CRM114-Status: GOOD (  10.76  )
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

Change from v3:
- https://lore.kernel.org/all/20251024015524.291013-1-inochiama@gmail.com
1. patch 1: fix binding check error

Change from v2:
- https://lore.kernel.org/all/20251020095500.1330057-1-inochiama@gmail.com
1. patch 3: fix comment typo
2. patch 3: add check for PHY_INTERFACE_MODE_NA.

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

 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++-
 drivers/net/phy/phy-core.c                    | 43 +++++++++++++++++++
 include/linux/phy.h                           |  3 ++
 4 files changed, 85 insertions(+), 1 deletion(-)

--
2.51.1


