Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42725CDB462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=; b=z+tnNhIO09iF0F2pG8wq7/+6Ld
	RxWXLHm5Lfg9bESbnORbH4Xwo6tbGFnLPjgJZ2UJ4LpD4sXF6kdhz4PH3IuiX6DB5Qp4hYkg4zRsv
	5adbzY6M7P6iLaOrtyH0HPI4v3I88SYcTHZWa36jpeaDsOAJyMEE6OmqO2hoDv+4T3kPTUskuPAb+
	bW/Iq8SUUlDJlqAzJQ3qtn6y78BpZcgmhJL5lsppCm15CGm8g86q1VtVvyBiv5Az8Hg6vU5mv6NZM
	emK/t7tJMAV5TrQRU7GsWgnxRrxthfzmVSbU+ZQjUAYuF5sdk/4YrWxaldgilqLqK5NyWXVn4e3sY
	fgv1NLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpv-0000000BLGq-0mV6;
	Fri, 14 Nov 2025 00:38:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpr-0000000BLEj-3elM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:38:44 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-343ee44d89aso1904574a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763080723; x=1763685523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=YL6Oj96gsg3jr86LHJFCjWUdsFvqyrPCaovJ9Wr56nkLGahLUr8I5yjEqcjRV5jE+Q
         8bCkOOOq1bq1xz9xOO88oDvZqMzc2/MD1mP/Q+UFTdYZENWmcuVYmYxWzDrVYMDVho7m
         sRMpkfUrvUeuBMNRu3YoaJwCZIVISRTRRrtF3l8bRrUC9BdOODiieCQSxJf85QyK5N0Y
         h8dfJVNV6qQ/h8KZ/YJgbQhfiPLkAcnMIl2PWKgAqQRo7rUDV3ogfOgSjDHTRczEln9O
         jxK+RSlqDqLgQb+nL8ApLPYaOQOezv7op9a6ml00M+8CR4pDtNDLqWzkRx8xw6be2fvb
         elIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763080723; x=1763685523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=W4TS9FJ1CegTol8DEtW7un3q1jobLl0Scct/wkxgrBZ/cVpbxR99r15RhJr5tNXwmt
         bXZ8JX84rFE65rSzI0koNlM39HztFB3po13dLbLaXc2xR7S9/LsFwdcbRdm1RNG3cXaY
         uOoJcY6e5uG/xJcTzj4u4rgkeb0fLPod4yQXJgbboNZ0S1yvL8Hi6QmBFX4XQc1TSOww
         rYShe6t4N+WBHkErrsQwX3dJYOiCSefTSbQ8uOIaq9bKbI4XLbo/rWWyMxo1W+gGFIJv
         rLNGw/CJXiUPYzfq5XX7xyx/KnQUI1fqTv2EcfUwYt8zP6RB8FvZ04Zkq4sjMxNcZLYu
         rw2g==
X-Forwarded-Encrypted: i=1; AJvYcCU4+Sg9s3ayw62xzZ0iaCVwW7waChs6zHmhxikhETxomyKjJ8mPNBX44tNI91m1TpxtKP9EzJ9l/GdJOMgabmXg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4xO0TN9NAiMt6i2jFArNJndKS6yTMNgxlXpWwvLozIx5Mv9e7
	phMWL9COPn3fo7fSDbIxc9nQPObh84CyXEAMWvedvf/NWgPmJzgfvSuv
X-Gm-Gg: ASbGncvoL8Ru4y4D7eygsKjgb9eV8xmW1uJMZvD/Ymgs26Rh7Fgzyx7MtCW22jT9H2C
	PVV7Jn6XBknPGzb75rpUzX12+L+BKjqTuID7NlloD/nSLyJXVrPkZ7uLAHzCxVZbxBUYk2H05Ud
	XI7WBAM/EjLFTECASnht1kq3UfZAoQaaczCWOlHqfKVClZOyXVQUX8s4dQJdaN5di+2P5afNGqk
	TFdbtdfTiSSN7wX9QB6JrXHFmSy2lPnz+co2amOtPpv1SHzZKxOQen8DfELYOepYtCk43uzt2Ce
	cwqVoScaOyF0y6Y1pYwUSoNg7d9BtI82z7ypkO78A/8k/swPTm/CWc0jz4ckdEMg2Olgf6jSONx
	hE9r4oZEFFNDlWof9APBp9KugR9b0y8GcR38dkf0XvdZDAGwLfsrA05EP6Klq0fqIh0u0aLqNah
	o=
X-Google-Smtp-Source: AGHT+IHI/lUdW0Aaq91gtsiZA71Q/CcEnh/FJg4f8D3Tkw7Zsxdk4iz040Cwd2DXuBeB7xK+wipiHw==
X-Received: by 2002:a05:693c:8019:b0:2a4:61d1:f433 with SMTP id 5a478bee46e88-2a4abaa29cbmr464993eec.16.1763080722822;
        Thu, 13 Nov 2025 16:38:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49da0662dsm4527148eec.2.2025.11.13.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:38:42 -0800 (PST)
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
Subject: [PATCH v8 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 14 Nov 2025 08:38:05 +0800
Message-ID: <20251114003805.494387-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
References: <20251114003805.494387-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_163843_912794_605EA9E9 
X-CRM114-Status: GOOD (  16.63  )
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


