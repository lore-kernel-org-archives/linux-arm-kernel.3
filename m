Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D66CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 01:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41C7JOVgrQjYgPjIau43ZnUjOEp2Qu+RhNpr65HbzYc=; b=QVUlS/QKP373GxPfIHhq/0A3bA
	AGNWePX8COgxkZDe4gi+bcWiX6J2zf5cWBRowmOKBB5M6ec2dlKi1/RKHSuSgaYP7MylUSynY6C5E
	bJztcBJ+uIKYdhWWzPZV3mG4nOp1AXLjlExOmistWTghxYvOEsPONHVSZGzsitT73i3CtDYEb0cdh
	mlsvSBEBPsLGQfkvtOfvqvrS1oz1yd7u3XdE2edELMHZNuTr0cSeZhbAzBaMF2FryJa8uf6zxpRbK
	eajkoJSvpN6GmtrLGpUshHZc1Z7AUMZFMEH6xLc5N0Nie5CbtoBcJV+k/O7GUrGerqtk4VsllMz7o
	K7jBndkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdtC-00000005E2g-01Xd;
	Fri, 31 Oct 2025 01:25:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdt1-00000005Dyo-1iie
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 01:25:04 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2951a817541so6770885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761873903; x=1762478703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41C7JOVgrQjYgPjIau43ZnUjOEp2Qu+RhNpr65HbzYc=;
        b=iRt2x9VYrv7ab/kXSgPrCAPA0ff73ZTJJFhC3ToTrerO7Qy/mEm+7+fntPJ+dcH0C/
         DQCU04U25GLEaqDkdc9f5w38Tx2yibLEovcVrPfNih/Julta/oKmsGh0Mn6YxbVLqX0C
         q6aaPvLHond4t/hnXV1ELjZaNIoWMl0yuB+VZWC6tgVxcPP7BSIPTwQldfsnKC95jPhN
         3K/00nKU/u7RPsd/w9Jysdx8nY8ai/aWtPT1wTfdVigBQ+i8uUscqSUeIiDfRFg4IO75
         OVFNerLntbFYJnDqxFCOYTDTQmer2JkUthE1uOyA+Bbf+OFY6EWXWjh0To3gDClQtXCN
         Kwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761873903; x=1762478703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41C7JOVgrQjYgPjIau43ZnUjOEp2Qu+RhNpr65HbzYc=;
        b=MMmVJcUhn0quzunKPSFITFSeFMuZfuNVbnyfugiRhBh/PFwfHCaSDFDGUa7Jn0gmis
         1kb5alccp1QOdX21tHfGK/XqwYtFyJszDKVwxoge9BFKhXfkscLfEP9BmkT7FJXpdF4v
         dTxN63xsq9EAp6kP5bTzoqt1NnFwr/NvmcNeexLzopp56yl4QtUo+y2K/Bb4RV96q50R
         1CUg8ZwGb0bC/8UySI+cjD09wIC580TihLEfwoMfSIizyrwI8Z/H/MenOrgj6YRlpk7I
         COEy1d2uMNDOg5QWX+Wg1A0tfod5jKnjZNn4owbtSy8asndaZxKDEsUpqxle5a2rdGE3
         g/sg==
X-Forwarded-Encrypted: i=1; AJvYcCWw4xOIeL+NDtDVLyMQAtCEaZZOZCO25LIf9Ea3cLaZ6YWPQZQv2Qxc9hKuzYPVodD3JdCFHjTuW2l+02hUVkUW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpz//h0nxzafJHH3Z+KXf0pHDIJrltI/U9SKkN/lhu1WWQ4XgQ
	ZpwN4fxkNYCoq6w9/IRGCaZXpU8D1FEF/cjjCrMWxdhCMEK76Rq6mI4D
X-Gm-Gg: ASbGnctOZhLy9ruAlz0Lta+cyHuCV0Knf4/jD/INJFtjSOy1/Os2txKMoLNmMOrfZa0
	v49luSplvSMgoKj32uGhKhdqjDxMNWuQCJltUSDoM41o/NxAQQnY+0KU+FefGXwsOQIg3H3N9xQ
	pjtzj8Yus9svrPCMhPvSEWM4FuvYBqnkfP37El/hbG2cVvnK+P40oLZNvVxSniXdRNqDEkCWHq3
	fDaLiwr+ezrJ4yILvWHV8S2BZ3ZW0U1zw90jtfFnQt1xpil3UHMBUmih/a0MQu6ezYcvvj3pUED
	N8Ma0Qcjh1GfJREBnOAliEQkytCAhAEuGp+WKY2YAIjbpTk4Cy9opMnOjyKZr8YpptI7pvhCxpP
	xqiZmgVI9LhgW6Crr9xMybzmyAQP732cNYSr7/iFr1WXL1a6YG2b0JFdWfJD8v/C+4DO6rCx5lz
	8=
X-Google-Smtp-Source: AGHT+IHwNetbUfw9P+CF7flRnUxbKMyy0u3v4NGRme8B70TIIYaaZvAcpehaNR0ztwmyhfdRon+uhQ==
X-Received: by 2002:a17:902:c94d:b0:295:164d:cebb with SMTP id d9443c01a7336-2951a539003mr21231175ad.47.1761873902502;
        Thu, 30 Oct 2025 18:25:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29526871836sm3248465ad.18.2025.10.30.18.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 18:25:02 -0700 (PDT)
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
Subject: [PATCH v5 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 31 Oct 2025 09:24:28 +0800
Message-ID: <20251031012428.488184-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031012428.488184-1-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_182503_495292_FC892FE8 
X-CRM114-Status: GOOD (  16.45  )
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


