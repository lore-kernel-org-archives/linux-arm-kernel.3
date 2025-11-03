Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D54CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 03:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=; b=zFxMhh8GIMAaqiVft3bVi+C2RK
	ViClHFGClHihZr5uAVxJQj8MmfiESmYGyPsY0mDY2Hp2Iguka1yp61SXZcRo9ZGjsLelO0+568SCA
	JfaGSOqSdeWQ461O0IVGeYrBS1cdxtt6kQQyZS9DJs3hGRTCTi4KciVnVFIzw7uspiUK+7sxlwXlQ
	oryEwhNg5bt0eSjgtkdHaY7Ja3aVSwdbWD00wyCy2u/3UhX0We+5jujDEchHsrGKDmFNZTVVcgZzc
	vvZ1PE+jrHH/HElHh9g8LPY5RSiD88TFdGPLFp55ysw4ns+Ur8Yhgc5gfNvJCU7z/Rxg4jX6zTfTK
	TgT7bjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFktI-000000096Dx-25nd;
	Mon, 03 Nov 2025 03:05:56 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFktF-000000096CN-1qpv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 03:05:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7833765433cso5163919b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 19:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762139153; x=1762743953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=Vfl1hapsItL3qPFqKkBZUunDWJeBOZgWGHMrL/sR/jX5RiMfbCQ6BeQKcWaHDeczaz
         3fkOt9ax/rYYL/9xBIUPUxdouhpm1sGbg3usah16kcZatq7OClEIAUh7Sg1lVMapGxkN
         8doM9uraRF2H+z6zshuy8zia5PATnTjVljjl3S3Zf0eXh6vtp8HNkcMq472Xsv9OgzYi
         E0/TR9R4FHdmnI03CpznUQ8VQb3gzp1EanQZcnzOujpwWPMgft14CoZGJOqAwtSAQ9Qu
         +wNVTFclkpysOb1MhG8JzCBbGQiruSM/8RAscYZAwFsoZctTCL6DhPvFise+N6uUP14m
         S1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762139153; x=1762743953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=m8FE4BySfw1Yqj9PAdl5bTeXWdaQ9M3Tdan5nn+4QPLGcwWU4JKN1bx5Yt6NtBoyY3
         r+GikFizYHJYXzac5yNWNN2u7evwVtxnFQRTSj9qCHlmkaOO4amHAq9Em0CenFORmc3n
         dBgjeL38Z+VtvcXXGHek1umjbM6Xm+XYRmY1kJtV5dwjVcge/7uBdID3Kkvhmb5BpOu6
         AFEamvOp+yc0zthADR/xzRM4czKZpN+R915xHV5T5ov+h8PqSuHxxACSixFO/MWYco5+
         zxtFJWDgtByUhuCoKavLYNg8TWeUSAFX09KzaZyggCPD9UNxrP6EWsGjf8/5nE2AEUQo
         jfYg==
X-Forwarded-Encrypted: i=1; AJvYcCWhM2ZSWdzYk/I6n0nNMODKbEutd/qd5oLz+M/FrAlKlDR9BI+TNCLbCRiiO5ZqfLJmkU5fge9NK9iePwzkw9LT@lists.infradead.org
X-Gm-Message-State: AOJu0YyT0OuYGiNH8oZfKJf6AQdgxHS0ydDJYbx9kwMlTPa8A9S7/QkJ
	ZdISIlW8RoVPwMHwjwvstyNCb2/fNhsy9s3Hevs/M7duFjKKEEUOhoFc
X-Gm-Gg: ASbGncuh05WmmEv83caHMzHK143s71wQvQ9oAoFXqm5AlF/KIfk2sBxxPWWBzHOr/u+
	igB8Xvw2HPU6gK6Dp7yjKQvFOLKGGvIEC/APfWo15VIKqpT1RqRAi/xmORsbftN9Ibwr5Zw8qK6
	RuXPMp6vD0l7aBepiue7WLgu/f3NfNVqKFhGOI9gEYYunxiYjNGLGyXIA+BPGWbvYGxltGjy+ah
	xZ+jaZrBkhOR3kSiUyP+WFLqQ2l6XeXLlPOumALBcQkSFkVhsnjDZYQ0hNG0d1DsGnobpDSq1n8
	Nk6gC98E/SLeQqqmchimz5Ix4jHnu3rb2+YXBDqnvGOGysfJSIrs7bbCBYBqJn9K1uC+d5cAEM1
	5OrHHZ86KiRo4e1i11g5igQGdP3lbaOf4t+NBYuTnWUkVpU9IHU5ZIkdaEz5EjHEZqyN9Paiuu9
	g=
X-Google-Smtp-Source: AGHT+IHPm4B46oBMKEiDtF1pRQ9fXhJATCw1b8SJYuGAuFOpbmfcoaiK6106eJ2qyIrf/kfq6Jj0wQ==
X-Received: by 2002:a05:6a00:2196:b0:7ab:4fce:fa34 with SMTP id d2e1a72fcca58-7ab4fcf3eccmr1842539b3a.1.1762139152609;
        Sun, 02 Nov 2025 19:05:52 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897c632sm9343229b3a.10.2025.11.02.19.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 19:05:52 -0800 (PST)
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
	Longbin Li <looong.bin@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v6 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Mon,  3 Nov 2025 11:05:26 +0800
Message-ID: <20251103030526.1092365-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103030526.1092365-1-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_190553_500911_F0D4E749 
X-CRM114-Status: GOOD (  16.74  )
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

As the SG2042 has an internal rx delay, the delay should be removed
when initializing the mac, otherwise the phy will be misconfigurated.

Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3b7947a7a7ba..fcdda2401968 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -7,11 +7,16 @@
 
 #include <linux/clk.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 
 #include "stmmac_platform.h"
 
+struct sophgo_dwmac_data {
+	bool has_internal_rx_delay;
+};
+
 static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 				    struct plat_stmmacenet_data *plat_dat,
 				    struct stmmac_resources *stmmac_res)
@@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
 static int sophgo_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
+	const struct sophgo_dwmac_data *data;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -50,11 +56,23 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	data = device_get_match_data(&pdev->dev);
+	if (data && data->has_internal_rx_delay) {
+		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
+									  false, true);
+		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_NA)
+			return -EINVAL;
+	}
+
 	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
 }
 
+static const struct sophgo_dwmac_data sg2042_dwmac_data = {
+	.has_internal_rx_delay = true,
+};
+
 static const struct of_device_id sophgo_dwmac_match[] = {
-	{ .compatible = "sophgo,sg2042-dwmac" },
+	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.51.2


