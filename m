Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F79CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=; b=p4F77h+RuKPNO0Dg2rRMXi9Oyg
	7qAAD7Xklcp81jdq25uNe7mi3lf67FNT/+k1G0V8AbNgZbFAKjysE7h5dpWOnj2rWUP+UQERE31Vo
	KebLweX6ZrdipgLbwBjKuttND4v+SW8TPJNtauzcKu2x2WuMf6AA3fqYLfMFkSbKlgxsVaZS1c5Qe
	4ytjDvQUiRii0jPy3Crg4bjOGn3Vm1+CQjhrt216TISUnhzTjHDhQj4zWMBu10YekL9sjKtjMwCsL
	eq8u+4tUobT7zQUgw4zY4IzRnOSizSmOGJ+wDnTvc6kyyPph8CbhtXZmgXjpbuD9Fd05ZAAv7rjUd
	ogXSE7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTa-0000000HBfF-3l8E;
	Fri, 07 Nov 2025 11:17:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKTZ-0000000HBeI-1I7b
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Nov 2025 11:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=; b=jLztZKCIYm/KD7dGvpVVDZilqr
	xQ+glnC0U2nYpyZq4WlpsbRjomRFrmbSb5/55NBcx1hGwajKn5in5qWB2sVe/Zdsteu6uT3cnVcKO
	l92bDNkM6DV7oslOvBkdpyiaWNr65KVqFsD+NSKZc44Ci8UIaysDfXeQNvrCsK4dCKAq7/5TdvRMX
	bSgRKs+UB6qTvi/PYSfspMMWTYuGKTQRShkNgdIX3HokAYDFG0jISjdyKS/l5dkEVpWFh0zhXB/OL
	/OP4eHFPwkme3pbKhWBh9vMqXSVzug9fiRyFu0LozTp8CCOASb1EC/sBNVSV4JUYl87aV36ZOZiob
	XzL4zpNw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJbp-00000006HDH-2uDX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:22:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-295247a814bso7885015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514268; x=1763119068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=m8eu0iP8hA9FFGUr4f2RBaqDL7iEfgsRgjWeeyVDtGH95khdp/lX/WxrkDt2uju0/G
         HftaOeRA37lPEJDmwjJFf0aLfLM8pwAzGmrZiD19fI+9PF8NGXDJ42lQ2nkhsRVuo3iU
         jFRlo6+DBoKHCo3x5XmhYuL1uwi/HHkUwp67nqlYUN9BOnOZfi0oiEcHiReGP5Vk+4Rz
         CazlLvR4ZNoOHEULBdUqdgnUsvZ1eVxEYLBTW3SccA+OGzYhURsRauK8ZBduz8303qIY
         C4X+jh3XpW4ZuShjhYDlZgTIgPh/a0kTUhGkqZY+69ZOxQZFBZkbPQaO/iR1bSNtcGpo
         Z+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514268; x=1763119068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xpMkuoemEQ8nHGHR+sKpMED/PEl2v5+7S85Qkm8JY+4=;
        b=kc51n8rWoEpYXNmxSXlt65R/PYPLlEJuBGV6oaTK9i3JBu0D55DkyF48zJYm/VWZmw
         vnNlTpxIO/VGKhkm/I4Zq16o74JLhh+IaPtx1UKyv0Uye0NKK6iB+n9DfhuXqt0MP817
         FffSNZC/Uv54/gvZFC/YG+y8kHlnQmA1YPefSmWV7HL8qSbvfVGlCLY4+ENMaa7hyqzn
         J1HE4fJk3odM7lsX+eJlAUAuRHqCARy7a+yTAkP3hvDOdpNGES/iKaoV7p4Au3pzmS9M
         zh6fl6467ThpKCrCRhIzhDkxZx0Mk5yHLjPWPA6shHzxGKGvjND1yqjsy47Od/GqfCnA
         iyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpD9viBG2HP/qGNHHyV68l6VK7RuVK/DncGu3JZruUsNBnNkIIDv2YAqcxFYKjklSx5Bz3wiWymIz+koq7GgWS@lists.infradead.org
X-Gm-Message-State: AOJu0YzKEV6nqA9KNmW/IR3G1pboHUaZpijeO3bb8/Kk2bLK+e38eds4
	IDMRjP+wLMddS+EXFzRfTuCpPNMPgNaBk7gPdFcMLglxWGAmakSMI2Mi
X-Gm-Gg: ASbGnct6TGVMeUV+Q6TQ1U+HAA237QvdNJnNvdZTy+GQ/yH+/D0LazDHuROTg6ImCpz
	guhErbxkWE1eD0Dx/fOMQYAqa7iUmUr57imbhKlLTmWh54ihYH/6omhIVjaBhmjbaE4WAY/MHsh
	d+nhG8hd05ErZI5GydSHZDcvWe3nIw5JJEVvMc/eGnScHlKLJrq9l2B7q6+GgxROz8f0JosoPUT
	wSn0e8T8cKsP3lLKtgN89ZlGmzep5lKJ4rQ9oxpdfGwWIaolocTwBD7OZy+3464ot8yPV/v+TTF
	dJmwx0gW6RXmLpF7dvMrtDcIaZ2LVOi+JbtXw5r6K6Pm8jzewO4CxOBQLInw46mzGutaLDUC092
	CrGh9+kUKf6fXGpoh2+MWmLAKqTEjFEy5MGGA4AIRHc3I1cnYM+WbBfQjYDwsMW4bVJ9ZiMichT
	k=
X-Google-Smtp-Source: AGHT+IH5sLTuwaNwygjS88Dd4DuKT5eyLF2e0aAe27R6LJvuFCPtCu+tqMNQVj8foqUaUxe+5POBzg==
X-Received: by 2002:a17:902:f544:b0:295:9e4e:4092 with SMTP id d9443c01a7336-297c0485f18mr38236515ad.56.1762514267918;
        Fri, 07 Nov 2025 03:17:47 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096825esm58574245ad.3.2025.11.07.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:17:47 -0800 (PST)
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
Subject: [PATCH v7 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri,  7 Nov 2025 19:17:15 +0800
Message-ID: <20251107111715.3196746-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107111715.3196746-1-inochiama@gmail.com>
References: <20251107111715.3196746-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_102221_826193_DFC77889 
X-CRM114-Status: GOOD (  16.66  )
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


