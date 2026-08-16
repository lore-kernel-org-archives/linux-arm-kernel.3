Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5B7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jqHlndu2mP4JOXXcMYq7yqkvIBuKIHfSguke33kVois=; b=X7m41pHu0FjBIdyuSe6T/m+j+5
	voK5+RXEqmDV+AHGuPUHkVueo4oLa8SNthh5Aapo9Nn6gSb9iexV+SJYAT7SI8Y6tjWULsZHSd6M4
	86vuicWyramE5qQUIAnjoluztqWSeLPKQ1KFCX9y215daoGVys7j9x84nNmINiiYN759OsXLp51J5
	Ye43Alk+vgjiV1JXF/p6vp1vbqKG+tjZOZmrxJ8PBWLalfJAo6Fo1nFqOlps3321ZcBwyw+bO9dD8
	Oa3BCG5eNBHCBcUval1uqhTVW7GZIgLQn/s4j1+T3ebtGqsD6S/16h/ElZLM9Sf90MBIqGZoXNN/e
	0WlvzY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveTk-00000004v8F-1kNs;
	Sun, 16 Aug 2026 17:17:00 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveTi-00000004v7o-146M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 17:16:59 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1727172a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786900617; x=1787505417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqHlndu2mP4JOXXcMYq7yqkvIBuKIHfSguke33kVois=;
        b=Nk/nR3pUE6koZZLrzjK5Ee54xTIMSn/NKtbUGi4r/8UStlh1Wd7l5ylhUmVc4P9+cL
         aYmuBXjx7uD7QziaYCxFuZI/aB1Vzf1DYo01YtNI2m3mzxO8+iIn3OYtX4/8L/rqTk5N
         QibqEJno/oGmNIu2vh4rGkR95LJXCVTdQLST+PmSaW3UHfo+2We3wGRC/7dnzJ9feChx
         hvWcdXaHlAV6cktaVYU3JRRPiRwTkBS+sjrHmpuWK0YKzJcOhVW28ITQMQgpKXIEkel1
         aXIyWnVNVeLZkogGVhOcYNOAthe/znqHwdXTMnVsdYEjPdPSmpLRnaqwZOPn8JPKXAxD
         8mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786900617; x=1787505417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqHlndu2mP4JOXXcMYq7yqkvIBuKIHfSguke33kVois=;
        b=O64/WdTDSEC6NzDfN2sKtLZTZTkMNCwbyLsTsuEyrvvwIqZ+r65tbTH9FLjoSp1DKG
         aoINJjGUlOLCmmfOOU8pSshoEEyw3dcEBc1X1AAYZqk755xxQ3pFAR7BfixCYqBkPU+z
         /zh/qIOiin77yJr182KmnN7j3+Dk97bf7enyvnhmF8Vl3MeiBnMbIvY/6GiNgWb6C755
         bjIgmpORrgPbTqMS9/XBOcyREqWcjFiE7vl5WjpoDHSak9EpNahEbkQy3m3vvYSji6rR
         dWeTSyH7xBNnWgfMk6elvpZU5Xgas0KZNDqZt3lHUT4eKhsz1cInO9hrYb8zE43avvqG
         7kyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNneeJWOuzgCXorrgdSysYZMD1HAG5ntutLM+eyG6wOVSdaVkzrlI5B9mxtg0RirAx5ZiJWrKAdN4uOmHkRsKz@lists.infradead.org
X-Gm-Message-State: AOJu0YyHvXqWdoH9Xa0Jl4Zo4o5A7I5Mun4Hc3jbjkDQaIctSx4MNFml
	pKCZjiGXBjui43qqwItLBnjQ9JsFu83qNlyOXok7Mn0mEZCLkKVrCpfD
X-Gm-Gg: AR+sD11ZXG94ngzz/r5mmQFIjCZ+KBX98rvAylxyTSI4bGy/sa1FCgS3cRlRXzzAI7A
	NyjsgIAHgE03Vu0g2lO7NyNUPy3uU2GEVDbBXy4+feSTtFw8EeCzOik5EQ5rOokBaNzAKhktIpj
	P+oaJpT+soxKN/x7Pj9ft3W6K18p/M1L0RMMkENJwWw9S9PE2k0PkaWHKy1X6yeOzu21R6L6N9W
	QJHQCk/NMHCaG0GFTrKRZwAzZ+nxUAa6dNFVTCv5C66OqCXpqXwq2X6n/yEC3WdvwaVk+xWFGxQ
	hz5wexNawiwWBeeL7S3F97cq4Fo4tm4/vGcr0MOmfuLWXf3VPHqicBnUu89S9Mxsi4Oq2ykml5v
	TvHxeunGkcXApjXxafC2nG4i5eQqeEiyVsT2OR8cBfcGsc3EOFH3IskzC1LjyqWeaheILKmpMYk
	UDRpgqaH68+e8NhXACB7xo0a9wR9xj/E9mwaAqFgROozf0zDoph8Fm7DXgsWq/JozUS7KEqiI0F
	JBQ2juEgBdYlJtBf0Sn6z2K5/E=
X-Received: by 2002:a17:90b:528a:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3933b7c3696mr20611825a91.3.1786900616817;
        Sun, 16 Aug 2026 10:16:56 -0700 (PDT)
Received: from localhost.localdomain ([240a:4280:4800:1470:95d0:2f3e:656d:65de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339d00eafsm4607627a91.1.2026.08.16.10.16.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 16 Aug 2026 10:16:54 -0700 (PDT)
From: Liu Zhenlong <dragonliu2018@gmail.com>
To: linux-pci@vger.kernel.org
Cc: jacky_chou@aspeedtech.com,
	mani@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Liu Zhenlong <dragonliu2018@gmail.com>
Subject: [PATCH] PCI: aspeed: fix clk and phy leak in aspeed_pcie_port_init error paths
Date: Mon, 17 Aug 2026 01:16:33 +0800
Message-ID: <20260816171633.15025-1-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_101658_298143_D1FB593C 
X-CRM114-Status: GOOD (  11.98  )
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

aspeed_pcie_port_init() calls clk_prepare_enable() to enable the port
clock, but if phy_init() or phy_set_mode_ext() fails afterwards, the
function returns without calling clk_disable_unprepare(), leaking the
clock reference on every probe failure.  Additionally, when
phy_set_mode_ext() fails, phy_init() has already succeeded, so
phy_exit() is also missing, leaking the phy reference.

Add the matching clk_disable_unprepare() to both error paths, and
phy_exit() to the phy_set_mode_ext() failure path, mirroring the
cleanup pattern in pci-aardvark.

Compile-tested with gcc on arm64 defconfig using COMPILE_TEST; no
hardware available for runtime testing.

Fixes: 9aa0cb68fcc1 ("PCI: aspeed: Add ASPEED PCIe RC driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
 drivers/pci/controller/pcie-aspeed.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controller/pcie-aspeed.c
index 9aa9e14c6148..1fd663ea3bf8 100644
--- a/drivers/pci/controller/pcie-aspeed.c
+++ b/drivers/pci/controller/pcie-aspeed.c
@@ -761,16 +761,21 @@ static int aspeed_pcie_port_init(struct aspeed_pcie_port *port)
 				     port->slot);
 
 	ret = phy_init(port->phy);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(port->clk);
 		return dev_err_probe(dev, ret,
 				     "failed to init phy pcie for slot (%d)\n",
 				     port->slot);
+	}
 
 	ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
-	if (ret)
+	if (ret) {
+		phy_exit(port->phy);
+		clk_disable_unprepare(port->clk);
 		return dev_err_probe(dev, ret,
 				     "failed to set phy mode for slot (%d)\n",
 				     port->slot);
+	}
 
 	reset_control_deassert(port->perst);
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
-- 
2.55.0


