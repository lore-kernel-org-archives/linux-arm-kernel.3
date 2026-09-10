Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9177C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 22:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=phZqrumo434IM6M4R3cvUgGvziwdgVdo1+7d/hsBRIU=; b=HKEGzEYmIp2TycLflBv7BM4Y4W
	39zZ2Ksc+lGLcwVdFbqwBp8wrd3DTjRcvSsypz4k7sE7WpfC0/jNpPmmEO6mlFNr7EE/BVpY/hRuK
	YcDy30UnGGxyIqsFsV/vFOVgl1vSBKaplRojRf0Txxt3Ei/njhl396LO+cSleLdIlqKoabAL76Q5I
	KcKElD9//umoeOCQcgitRNo6/hCOZuDTvhAKteI2U5S9xPYBUo7+g1me4ALpj3SLsJ1zqhb2MmAip
	5lJlvf/VPg66ti46uUGkLx5PQcdSM7xckdXYUh7Hv+hKvHif1Sf2elq46iicnVbSIka60f5pkgu+j
	ZgfSN/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4n5R-0000000FTT4-0MBe;
	Thu, 10 Sep 2026 22:17:41 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4n5P-0000000FTSg-09aH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 22:17:40 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfcc3e14so815766d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 15:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789078657; x=1789683457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phZqrumo434IM6M4R3cvUgGvziwdgVdo1+7d/hsBRIU=;
        b=mpM7mR7t3unieAxq3Le+S70+vhdyf1FvM5nFiDNMOhH5+NVJLJNab/Oy2whLtGxe2X
         0CWWRLSqHmpvAjMnWnckU4IuRPpY3IEk1+/hIqSDawYi4/o0wD9HKMghs399K12ntmw6
         bjGlUt3A37/4+xJylEptn7lPuv9aG+RM89l9TCCg1XNBlnvBO8ZhKNG4Tpiu9DDHnqmg
         W2GPoKNxBry4pwTAxHQ2XuxVW3Z0H49YxJatFp3vcsPAA5Gszqnr4PNpQhCxF5ZGjYPB
         Z2h7QYJMQ2tpX8YwYsUm3M/snpNDDeOGO9lSB124/koTymfCHTrCCl695Vk9ws0Md9qo
         bBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789078657; x=1789683457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phZqrumo434IM6M4R3cvUgGvziwdgVdo1+7d/hsBRIU=;
        b=EQtsd9vi+/o2HX4Igx+u1ReiedwxB2pEAnxv31bP5Yz+AZGGcNAYb/X6/07fn75JlD
         rmdDpVLiy+OhR8Dj+07mtfaF+pyrvHApNwtWFrydmJLv3cVjL8qH+Mjvl0XZGgUDlVir
         piibmjmv2mDXl8sI3aZiU3vv+AtJs4obGqPu7N2xFjmDe0Q8kLT9BwbY/J2Ep2bjXGVY
         yDMuxVCtU0p4+zvwXtDgNZHdwF7skSOQ5U4gDvm1PXn7EHjLR01llZHgNKMBXpRhfvYc
         FJ2W+Nn2/GJpddPSEskQC/Ko/7hyQALmB7FuEi13Vo4W3jglmhv+xjdo/pP+ZGcZTovs
         OwlA==
X-Forwarded-Encrypted: i=1; AKwUvBx3yBiK96I1wRqM2xYOleTd4AJ+T6ev1llOeE3Pf2lSPzVvLNQ8fklW85jTDi6LGfLWlwWHU7LGwyMuIoMaCNI8@lists.infradead.org
X-Gm-Message-State: AFuF++m5ICZad/WiGpJJTcN9msbUKLDpOXQUM43Go10p1KqxM8zn+3Em
	ffqVaPITgLsgGgfnU4lEufLjIqDr2evJAmmu7nbdhBs1IwjMVrFIJsQ=
X-Gm-Gg: AYBFou3+KvqCOROw8yzVwTTFT0GE6+MdoruGRaIj5muD0N9P3JYrWnfVwQz5YkMo2ix
	Wrbky9mNY1z6nM1IeOrgXk7I3LOLpurCzGbxsrZIOSDGS+YGEG/oSSFcNL2opA2V7Yzexb+K/gM
	xlGgq+H691r8hNT+J05choUKBY21UNB9N+c0ZdWLvUWMgEYmMSDl4LgobbwrpqlmXTOqHhKMlro
	wnZV2zhZ86o2p3P2vPd1XoV2cEzbHSre77kUPqtV8XfZaGGuu8jpLnQDHY6TmyAxP/JIEQxQXRB
	a33Nr6dPhRq1XQkx5dvAYdry5DelvP+YavU+TeefFdsXOGzMv1uM4YtZKWGCdK6ZXN/PFW/W0eu
	TJGjYgrmHVBBWRzKBhufATLAoL2fqRi2ju/IfM5ipbYu1WhE32d7nktLALZeaO1jMdl5LT9JGuw
	jhgzBvSMbLn8E0q9V9pL1Ka3jqZ5XP6GbeRijcSgsiMdGVgvBVGAp26M3cuPUwpMlJtIAHZioZN
	CVRQ8WjVSB1xzgZBA69YUp/ndtLY+rmkEnzUMyPc7yL+1hIm10aggkS1GnYrvx/O/fREtHHLPqI
	tSPLPuJak/TefadIakZUavf/OaeTg24kmA==
X-Received: by 2002:a05:620a:2604:b0:939:a9de:83ea with SMTP id af79cd13be357-939e8b1c875mr207985085a.10.1789078655448;
        Thu, 10 Sep 2026 15:17:35 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80d453esm87548985a.38.2026.09.10.15.17.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 15:17:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: linux-pci@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	pali@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] PCI: aardvark: Disable PHY on probe failures
Date: Thu, 10 Sep 2026 18:17:25 -0400
Message-ID: <20260910221725.91980-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_151739_086722_C11D39FA 
X-CRM114-Status: GOOD (  13.69  )
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

advk_pcie_setup_phy() initializes and powers on the PHY before the
emulated bridge and IRQ domains are created.  If any of those later
initialization steps or pci_host_probe() fails, probe returns without
powering off or exiting the PHY.

Replace the direct returns with staged cleanup labels.  Remove IRQ
domains in reverse order, release the emulated bridge allocation only
after successful initialization, and disable the PHY on every failure
after advk_pcie_setup_phy() succeeds.  A setup_phy() failure still
returns directly, so its partial internal cleanup is not repeated.

Fixes: 366697018c9a ("PCI: aardvark: Add PHY support")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/pci/controller/pci-aardvark.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index ecb81ac73019..2bbdb73cfb45 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -1864,28 +1864,25 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	ret = advk_sw_pci_bridge_init(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to register emulated root PCI bridge\n");
-		return ret;
+		goto err_disable_phy;
 	}
 
 	ret = advk_pcie_init_irq_domain(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to initialize irq\n");
-		return ret;
+		goto err_cleanup_bridge;
 	}
 
 	ret = advk_pcie_init_msi_irq_domain(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to initialize irq\n");
-		advk_pcie_remove_irq_domain(pcie);
-		return ret;
+		goto err_remove_irq_domain;
 	}
 
 	ret = advk_pcie_init_rp_irq_domain(pcie);
 	if (ret) {
 		dev_err(dev, "Failed to initialize irq\n");
-		advk_pcie_remove_msi_irq_domain(pcie);
-		advk_pcie_remove_irq_domain(pcie);
-		return ret;
+		goto err_remove_msi_irq_domain;
 	}
 
 	bridge->sysdata = pcie;
@@ -1893,14 +1890,22 @@ static int advk_pcie_probe(struct platform_device *pdev)
 	bridge->map_irq = advk_pcie_map_irq;
 
 	ret = pci_host_probe(bridge);
-	if (ret < 0) {
-		advk_pcie_remove_rp_irq_domain(pcie);
-		advk_pcie_remove_msi_irq_domain(pcie);
-		advk_pcie_remove_irq_domain(pcie);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_remove_rp_irq_domain;
 
 	return 0;
+
+err_remove_rp_irq_domain:
+	advk_pcie_remove_rp_irq_domain(pcie);
+err_remove_msi_irq_domain:
+	advk_pcie_remove_msi_irq_domain(pcie);
+err_remove_irq_domain:
+	advk_pcie_remove_irq_domain(pcie);
+err_cleanup_bridge:
+	pci_bridge_emul_cleanup(&pcie->bridge);
+err_disable_phy:
+	advk_pcie_disable_phy(pcie);
+	return ret;
 }
 
 static void advk_pcie_remove(struct platform_device *pdev)

-- 
2.50.1

