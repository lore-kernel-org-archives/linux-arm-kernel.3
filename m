Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAC5D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 04:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=; b=VpTHZccUVKp/JS42SBbTuW0/Kl
	w+kYGLkmISaqjAGXSp4LkPdlAYNlPbK2brTkKoLwtKRj5LN2n9ftj1J7mxjKcC0QI/KdUvkQ/nD0y
	b2/mpi2BphPnot+0QgNyFh4CZumo4YdXmJtfw4ysViEAL9mLXXd4DhKINI9UK+GLuq+QULvRNh2FP
	z3i/NsstgzldO23FLGm/tCqT4DPrs6bPsl92bn/s2gbI7tLSB/GBD71QGAn7/jfUE6uzbridEEKcb
	94JYdHwBGBhX/fifwxhnsuWoLaq1YZrE8ZR6WbPu+QJ5lxi2f/JF2Nua4g/0rXFC737F8GyhoJ35i
	WJEOfkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Tj-00000003C10-2SPl;
	Tue, 20 Jan 2026 04:36:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Tf-00000003Bzo-3bgp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 Jan 2026 04:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=; b=m0fc+z3aZzIq2ypBT7CV6P02n3
	8NjP9JbYrXMvBMh1QR6v+tbne9JrVJiKEupDRZkKTP+zGvUOQN6zjWVJS6eyEmTS287n7gImd3LiX
	mFwXGEG1ES0evgHf9G0Bvd6W6Beksab6puOWYYM5/AWJJZLkjt+juZls0Le4amExcSEHsb0oRfoXo
	HXRPe9SIwGw7Lg+KpGmPjclJvJAC+OfOr8gnjs0Eh3wnYV2AXwjiX/TlaDUeIGILph5xKkBAlsGaz
	DO4tEUBlb/3My6BIssKZYorvyEvaRway7uN2zDm7Hws7qiSgZfZs+H/+iKSXkP9H6or+3Hp3xdhbm
	3qGmRmAg==;
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Tc-0000000DKWL-46Xn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 04:36:26 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b1981ca515so5361436eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 20:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883782; x=1769488582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
        b=hpsIxQ8o8nCeOQWhvsUFYSo6BoMNoKjbCfMC7bqDP0waqbxMwaA/V8bqH7IZJCMySR
         3cQ+Gl5pWAJbhz87ADJUdLRmImCW/o/Vka/ZIc1oNrUCKRn9bmLIMQX+YNsUJ/4QQ8G/
         wLM6sHRZBwoovpNpStZQrV71wFDzwKYlbXSFeVoxq39vuAFH/maXWMwDWPEUoe+Aev3W
         OySIrsCGCkMspZIJIY96gMRmsjnpbQV5Vqc1Xzvgg8bb0kYa6g5+8f5g8S9g6gBdA03i
         8pxnH7YKXVuLA1ieQtFe8dvcSUG4biaQm0DeYN+fdnIMHba/GdviJ1EA85c0MSCwHDtr
         /5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883782; x=1769488582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
        b=cYBQ7wEzOi5gCK46ONPDJVWLlisdlRBqaBZseQMpCxBj/DOemzUpNvtMNsvY7tZCvB
         7rpqafv9diYGLr0C+zvK/nmeEbEWuX7NjB+qcG8ma82uF2IP0jhdcH02Bxw6k929DRDM
         NO4Y9c9S5sBFMZ0sZZxiLy2dhHOsZ5Qr05dmDThWrEBAJX4twxchqOP0TQg9Lc8qAWar
         z43m3R+jqORZReK/eaxBJkGQ9Z+j6ARzNiIcvicJiJykSQnvuhAeZPAhGeph/KJku/SK
         +TIaAAC+S/UP3z49TfCLItEMtYbK+MdFzBEWA3+ufFt2GarXGVHVDf12rl0FOlrqZ0Ri
         5nwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb+9XjuqVe6sxmUvfrIR44UiBEyreOcUAhe7+Gfpv/Bn5LNYHwMdXxsUbQFShPdyQRJqaNCsgyV/DOclMBj+CR@lists.infradead.org
X-Gm-Message-State: AOJu0YzL4M0qL1FuzRbgW1ayXPcUsMI9zT4fs/lZDEa+WQxvw6HGpj6D
	z6JrqrmzPi6Ex9/iuKnMNxfb3u4uxzEYH0RpZB4QyolAKWf+6K6Oa2yh
X-Gm-Gg: AZuq6aI0Auh7fXDv2jexbGv+7hWZDb5moouwZe0fmGuSuKpqwnbO6rfVLm6K8VJ75DT
	ps0p1bmWLwXEMuKvC4UQ4z2UVPJAjlwnXOphj9GyvsTe8qdzmJXnevgT6dP0SplM2Y9hjM6iSUd
	GoNE5YQNYSibjzMLm3rb7hjpjs2Xpb7jhvVhy8RytVsUh5I8IoNcxflFUa1pVuHlpNAeWMLrRWa
	qT+UGXIKRJxAg9axA1ZhHQs8ETeNgwuJobnP8iLuX+s2Xt4NvQ+yFwiGiDBMHzn8rqAB30YXkg6
	KpinTc+XElsCih69cKBLq9UEixWrgDb6jb0u5AEsudt4ZbvGpqbBMds7HUOxSVcvXq1clUJOMda
	mYu9Ev+GcPrPT+BPPiXNr6Pa4vTLEN7NDXYQgV6MmO37gd71mwMD/g3Vh9/ROulDniHmMJ9LI2n
	IYvDtVBbe3IQ==
X-Received: by 2002:a05:7300:a188:b0:2b6:af85:dd29 with SMTP id 5a478bee46e88-2b6fd3a7b8fmr363879eec.0.1768883781926;
        Mon, 19 Jan 2026 20:36:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fba43c3dsm1271369eec.0.2026.01.19.20.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:21 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 0/3] riscv: spacemit: Add ethernet support for K3
Date: Tue, 20 Jan 2026 12:36:05 +0800
Message-ID: <20260120043609.910302-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_043625_140679_20E2BC97 
X-CRM114-Status: GOOD (  11.38  )
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

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


