Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E49CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=; b=tCE8iW2LUo82wK2fQZc+/VwQk7
	0S7GeWi01fzPOfU1hf2X/fReF5f05IP6QvJhEhWC8K+FyC5LPMEYIUwg5odMa3PQLsTQ0p15vFcdA
	CIcKNTraQ6K3p0l1DQApRB5fXS+I44LuwRDC2heHE0EOsyOKydh29Dsiz7itgYutcKuKn670uPADa
	mbPxF/TOCgMn1dztEQwfLvTquSUrY9q1q8cPNsAozgopRlo7P5q2aWXJ0KuqsZGj0SQVKcVYBmK91
	o75L001yd/tXBtw44/2Pg02B2tGwgQLxXXYBN+21E5LoudeYMnpJTgMCr4/lFHd6sLqdDgs/BBoWI
	sRuFiXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC722-00000007zGI-0kC7;
	Fri, 24 Oct 2025 01:55:54 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC71v-00000007zCE-3eVE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 01:55:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-27eceb38eb1so17039015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 18:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761270947; x=1761875747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
        b=fp06YtDiCWgs0e3E9GYbssQyMhgAu2T1ovGGilvSAyks1cPpNoj63OTRnmHJpyPgoC
         KCvQ82dL8sjksCAES9mLnllnI8Nq3c8MjHO2r1+H9Ze4p8GmRIF+bUmLZTEknbdagdVJ
         japsG6SguY91tSdGCTPSeCcF+Jx5hjCela3yc3dGkgyOiB/Hl2bmP6J9gnZP6SXf4Y0C
         Pq5rXEQCyRnD2riyyvkgS+1rVrmfRN5xXQrw4UCmQnAFS2/MME2Gm7HjYMzoFwCkzqbM
         +LAXhSPBQoN100GpLCiHoNi2EFUA0FVDyitKNftR5ExRjHbpYi/JiU2pZVmibMcE4QT8
         QNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761270947; x=1761875747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6e+TNG8HQKWjELTx3r9i/rdMStiwaJjw+wxw++IoG08=;
        b=jwjDUJIs5cW+xGeERetZu+X3KlI5bZuuR54pYlVBmXIRGrcMJlDQZibOE9AVgWXaIY
         f8z+CkJj94FKXHhFl19jE5flj41Ai0XovxF9+U2WNTTMNFVY6BcyOxwrJeIhDr4pmmtC
         EdTUgRzlQ6t6aXFQr3WSli4C40+o+ECkNs73wSHpMe6wzwkUtuEV1cKC8k0bip25Whkf
         lAQs5vtpLDlLhJEvqX7N0nlr1u/0Zz+KZF4JU6yqec3s4uLjCYxniROd8pJ3h9nJhmjH
         GIGqIRzRSEKBt2zp55gFwU4E5XMbW9kf8Iz5+7d0fnd0g5WwSWXUCpuNCBnhSFRrMr+z
         Lgdw==
X-Forwarded-Encrypted: i=1; AJvYcCVC/YEXd/CPoOb1o1syx58z4rMNjxogc7cjeUYMr2cN0xGHQFu57VTLi5OncOksg51XyoV5EJK1YSSs0AhYs0Ek@lists.infradead.org
X-Gm-Message-State: AOJu0YwmLL2MNAkO/Erfz37QtuwVKvUWfOHub07JBXoSq0OY5Gw/v2KK
	oj4072zDvpkS0y45SvM3YJW4blU98HN6g71wlMaaqjeKLtlfLNQsNnNF
X-Gm-Gg: ASbGncsH+D0chtohLkRR1GRatKJofg1psOdlnAMxsdmQAlLsaVadtlpIMDmmYzB44uB
	1IItj38uqW5R1WN2hl9bCXTEM1ZK8zpEr3TEqF/+7+Xz1JTu822GFm5lsnNP5teFjcjHEZVRqeA
	ZHvpIRo8nVGdl7jGZNLZG5TrEwSUWbc8Ijo1NbpZdTDCzIIoCUL2ugk0iRG520OiwaSIRKt4axC
	REhqQdJEwYOsgc+uo0r+26XgZ96CrrSsHBrKqm+RcnvonepaOBOdjOErZ3dh6+byWVVDA5qWHGc
	yegip7eGEH+pXa5Wfg3QYedOGI1jvBIcjihHSiT2oYoTPgJTNqXtWEQG0EQbyWwpXxd05/OYc+L
	lD8jRv4HmRvXhigUwNVR33btDefGF2lGirzbVenAYTo1PPpXKivan5jrWT6Bxoz2sBKhTzXBFX5
	hmOQuD6GdHww==
X-Google-Smtp-Source: AGHT+IHpW5wlGIbn04l1ii92JJTddNPs25LrGmd/cpssrIhv3LxjZMplAv5M1j+a+0YAZnT5qvs+JQ==
X-Received: by 2002:a17:902:db11:b0:240:48f4:40f7 with SMTP id d9443c01a7336-290cba4efc9mr405211955ad.39.1761270947035;
        Thu, 23 Oct 2025 18:55:47 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda793esm38533865ad.5.2025.10.23.18.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:55:46 -0700 (PDT)
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
Subject: [PATCH v3 3/3] net: stmmac: dwmac-sophgo: Add phy interface filter
Date: Fri, 24 Oct 2025 09:55:24 +0800
Message-ID: <20251024015524.291013-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185547_911921_0244E1E1 
X-CRM114-Status: GOOD (  16.78  )
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
index 3b7947a7a7ba..7f0ca4249a13 100644
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
 
+static struct sophgo_dwmac_data sg2042_dwmac_data = {
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
2.51.1


