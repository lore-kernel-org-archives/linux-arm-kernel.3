Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C954ED35697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uKUvT1UkLVoSBo2GeUIFsYzGNbYkZ2w4SGalbBin6yo=; b=w9YI57sbObqPnQrHQIpMe4bxM9
	IFYgpESU5cL94usOwechwOdy0jvAR6M9VHNRRXm6T1XZahtHKlkRB8TxZOp9yk2fWoTfmUvzx7izx
	ks+QEXDdGoVCESnV8XOCvZ+4Kd6VkjmLe8gN3d9AQupzwYDe33/foSH5e931b+2I2iJfWbhiunmMz
	JTof5S9jwkicEaqYdsoXLWUhrUmAqfWW5k41vAd96CsZIPI02Fu1i2i6xxyexAVyX3mKjIcCj7m/p
	icH/uzIhGcLppeqsPPDTcNpzuh+6YUVNYVJ/S3U3GA960zuy95+i1z2r5G3ZUwLdUBBemSyEC6OOW
	kHo10Ivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1eH-0000000FjJM-2G1W;
	Wed, 28 Jan 2026 09:15:41 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl1eE-0000000FjIP-3sOm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:15:40 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-12336c0a8b6so2190957c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769591738; x=1770196538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uKUvT1UkLVoSBo2GeUIFsYzGNbYkZ2w4SGalbBin6yo=;
        b=eRAqYX9McQAzMbcBWf9+/0WR5DSIcrBi0DpkyVphYEkwbHP46RGPYFxlv0qooKZEFi
         5Pa/bkQ/XV42cGQUaxrt/hilQhnccap4E3Xf98mDB7Y7Sth3af5QBBxNbjLLY2k6hwnl
         uhSwRf9jBNfOybviQyt2meFqEgI9P+V0CBnExU5THZUJyxKM2aSKZpH/1nzW+1rJ9KHA
         aj/eHNDMmFa7IOr0tlLBUyL3F1p26/x/5yXWW2F3duL7W3omeN0wL5jYPwP1f/3t5MUC
         cQ6L+yf2EE8knC5OiKbGWrTNJuShaHtG4qN76iouIyjBnxbCaPnPEHmdupxxdYuaeU/7
         pbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769591738; x=1770196538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKUvT1UkLVoSBo2GeUIFsYzGNbYkZ2w4SGalbBin6yo=;
        b=fyMCJaI3ygu1MFDEPtmXOiaoayLeQcuwLldgZPRqXiWjcR82MLFS3JlCTt7T1UGP5u
         r8AO0dJB910cWmCTkSj6VnY8mm8ENd3coI0z5o9ykgR4gNbngSckLT+oUW1Luo0EXmpp
         r1IKdZkn+hkOpzBTlftQwmFWtCsJ5j9ynfOGsPeiZmhHy1nmiUdJ66aVRKe2zN+7oAgL
         xJ03/GTfaur1X67lfnyGoK2UyXJsAFL3pwKAesGgzoIAYqfB0Rj8GTCqzQnfQG71KufU
         bWE8PkDwbN4QpqRxJlwrDoofe06rr0af0CEMjSJaVTi5KJxkxatxdzNXZhnGLBRJWrC0
         YRog==
X-Forwarded-Encrypted: i=1; AJvYcCVfD+pcdgl3a3/f/rkwfu/MpB0RQANdUfCzKEt5CaW0XzlwOSI2Yd2OFRy43C4B/J7aUR1f6ablJ9gsu3OapsXQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk/O5LEvO1c3HheOzcnK8ru0l/evGg0DHzf8AEqxTCD1/mXle5
	qNl261OoVMhHfNyOqtmm0vSqWWaR60M+LCldpVQXaIV1vFxLrAFjtP+TJldzXw==
X-Gm-Gg: AZuq6aKw32qLEFpodcH/fBimgq5pjKSJOgLbWFRLZqNd+dRQyDgPAUYaS+tpJ1hJyge
	O/FapEKqH9jPUUf2qpzW5AJ4HmV0hSTwvmIhn10FubBAnovfXDVH1U4zgkVCkj4nqYtQkQBb3jS
	IHXUSXQVzDVGfVHi5tpqZi6n2NXKCiLtRVc71lKB+yvGXgIQjt3uaKfYSxKcmLpeV2ItMO8aALh
	sUhh0/xeGTm2sx9sOg4bcs/sFBQZOgEAjjP+wkzn7MC6vC94BxrTyCcnN3BG7/nOM95rSRD0OIi
	MFgB6bjQsdkj7pZjIKpGUiUf0JY4ESSlOBdVmKd2/DHYyy/bA7LhjBkE8j33hsfNfNN0dty71sr
	9J1YZQAh9mqjKSF7+nbtxxZ7x1H2LCPvZBe2EhLVUZJ1Md3b4kFpr4wGSY6ws2Tg0UgkrkE9kBR
	nM4dI7gnofDg==
X-Received: by 2002:a05:7300:6d08:b0:2b7:2664:aeae with SMTP id 5a478bee46e88-2b78da0b4a8mr2419091eec.37.1769585393102;
        Tue, 27 Jan 2026 23:29:53 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b658sm1374769c88.3.2026.01.27.23.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:52 -0800 (PST)
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
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
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
Subject: [PATCH net-next v3 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed, 28 Jan 2026 15:29:26 +0800
Message-ID: <20260128072931.875041-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_011538_984156_3F87B6DA 
X-CRM114-Status: GOOD (  12.52  )
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

Change from v2:
- https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
patch 1:
1. remove not needed compatible for select
2. drop empty line in "spacemit,apmu" properties
3. add spacemit,apmu properties to required.
patch 3:
1. remove misused phy_fix_phy_mode_for_mac_delays.
2. use local tx clock instead of the clk_tx_i in the dwmac.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


