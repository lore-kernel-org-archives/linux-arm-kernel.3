Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2B9C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 01:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qd0y+cEEGSMDbTU6v7Sk4WhfgrAmRd2NDHVF935DK4=; b=U4c/7GTuMAwnLh97Fc//b5LjX9
	vi4t4gY2KQO3NMlYzxl/xRSn4F/3hvVtUhUSBsaXq6s+3fZyOcjBgeexPOdmW2tdjk7hceLpkIbYP
	tzgz9wEukF3xvDEiT6Rjwcjpqi6bLJjVLq9QiUivkDiOsDZBrEVao0Kko9swyUULwExgWylCNBEGQ
	lLUK5Q4o9rQvwXJ45AmfhF7hZF4WP561eA/AmOvoA3APhNiAsZMskpartNZEe5s9LCD2nAMursgB7
	ef2tqQoTGHbhOrUVJbz1E08OFDiTWj57ZPXb2uzyxfuOz4jcXc/tlX0joj0Onl9WkWqDV7kjHC2hp
	Gi3d/ZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwED-0000000DrNt-3hPn;
	Sun, 09 Feb 2025 01:35:21 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgwAA-0000000DqkJ-28IC;
	Sun, 09 Feb 2025 01:31:11 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6dd01781b56so39609706d6.0;
        Sat, 08 Feb 2025 17:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739064669; x=1739669469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qd0y+cEEGSMDbTU6v7Sk4WhfgrAmRd2NDHVF935DK4=;
        b=EgTTviw+XqnSzfPuT2vsb7GQ50xQuIlGIUHsvJ/aFVyUK6eGq3/U3CGKntSIR3Spro
         gTqyndu/HbPrUCRrWb4uV2nzF0q0nl/jm1ztsXp7nL2MaJMQjUuvw6nPAh6S8J42fNMB
         AeGpOzuA9XOmPOxBkbg3aWRmwd2fEbkJ0OLNpMG3Lxf5fHBw456otB5Qr7IZhLqN6U7b
         gJKrQLoW1wQI4bASetKCgBteULDIiHL40GCmpM5bkArp1soD1/tkPGlR/RmHDRmLQn/Y
         ZjB0soALbeQvUQwg5mgVDW294eObRIUtDkL+1CAMjIaqffkMqD8Lt9rXu5beQG1F7eTc
         j1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064669; x=1739669469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qd0y+cEEGSMDbTU6v7Sk4WhfgrAmRd2NDHVF935DK4=;
        b=pCLuYA/92NJfC1YFKP8sgopW2g/PlRxUEWTwvFHJTm6tbH5LokiNTeQOBt+o9xzAVM
         Xy+CZ3C/SVFyN3Kn4HVz8jFbsbfviyPk+GB1EZAU7IeVRPnlI9eG3CWX6/zxN5a3DFiq
         2+XLpRVVG79yN2ElQutfBPqc8K/uQtd019FN0uzQ2nWwCD7IQSRbNpMVMUtlmzonX5eY
         dpWjsEi9MXKguB9Y7X6cLXSl1JhUx+M+KSYgTA7ouNUC1Sp08TeC4wuGkKKh/Qs9/TVN
         c5IEb8qQB9gyDTBEyt1vO6dn7XJ0HqgcMY+Q5gC4JbwF/qRw76eEWHlfl0AWgExiAZwY
         VHTg==
X-Forwarded-Encrypted: i=1; AJvYcCUbRVSCGcCDbqygnl7N1igy/K75Gpqk0OEa+qjf/qp25VaTo7eKyWp28vLY4hg88avGP4PiTlTiUvWqxlV9d+0V@lists.infradead.org, AJvYcCXRFKI7q85Gp9hqfXXavlxl7opNMpMVn2x9q5zVf9JIAntdVOCvTYy0hFBRfflBerm2tkTwbocuV7BB9w4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0IGdyNxtFxQmv3XqcBfxcUWqCf8zxRho0fcDeF1bSmqPZzJpz
	A9AKC7SO+tv/x/+aAy+JTuMckgC8kJZUbs/xspMMOlF2mW8YmAgd
X-Gm-Gg: ASbGncv/5ASDFapBY0AlyP9UNGA/X3algVhcRsiRCPR5COqUq6W1Z/fxN43VAHn4N25
	5nWQaAllZl8WMyzQ3IZE8PQK8cZ8fZsNrrMaVjp90wTWsAB58eo66W4yiQJUGF5/Rd6jRf+L27d
	kwsFgQd61BUQEiRvnuADkdHDSoTvXLR5k6hOZlgqmkYBwANDuPZ6a0GgDe1pvjnZI2lbf2eZpgm
	ZhE/cXfbE66qttyWlW9oEZLnQSFg14apwXGvFozKTknfLLaGJJKG80+BN0wHMan3wk=
X-Google-Smtp-Source: AGHT+IH5+7+WkkExgAKmn9GKbPwQMm+ZPXl5sXT9N8Ac3xNoPPbBjTifXy61nquwVLVZDKiyddYDZA==
X-Received: by 2002:a05:6214:1bcc:b0:6d4:27fd:a99d with SMTP id 6a1803df08f44-6e44564bad9mr147118886d6.19.1739064669217;
        Sat, 08 Feb 2025 17:31:09 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e43ba36d5csm31699576d6.26.2025.02.08.17.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:31:08 -0800 (PST)
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
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 2/3] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Sun,  9 Feb 2025 09:30:51 +0800
Message-ID: <20250209013054.816580-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209013054.816580-1-inochiama@gmail.com>
References: <20250209013054.816580-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_173110_548239_D9F36065 
X-CRM114-Status: GOOD (  11.74  )
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,17 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -538,11 +549,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.48.1


