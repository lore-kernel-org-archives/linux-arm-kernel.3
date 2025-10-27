Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E1DCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyBK5HLss/zF/tM/K4qW2J+Z3asnvx9H1hG28ozg6Qk=; b=Yedw5vi+HaDvp2Abtx3lsY/U3O
	ZhBXXPRLvQmWN5SpZKszi6eD3GlNq1bUewRbijBoWSXB+QY++hx97ZJi+dZ3lu7E+VvbG9ip5RIvO
	pT12SgnD7Tp6FV/h0fY6MDoaYkS9TkbZoTpCMrJziU/qHGejqWzpoZqdE7lgxyDAiYwIUQnNTO67M
	pOIJ1+rUz8GoVlbliA+tvBX/YTYXfKRhyNrUjE0Pd9QVaWdw6VROK7rbH8HIQEGZ9kMCEHbHC4nH/
	vgI00cLh/GR5XCgPR1ijCrMRr179Yl2U5ulJVPm8019n5ad0Xk5DIU7PpW75lz5PjExR6lfKPtbKI
	Fgh9Xmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOdz-0000000EATL-010g;
	Mon, 27 Oct 2025 14:56:23 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOdw-0000000EASF-0Vys
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 14:56:21 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a27ab05a2dso4013872b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761576979; x=1762181779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyBK5HLss/zF/tM/K4qW2J+Z3asnvx9H1hG28ozg6Qk=;
        b=FvXPULNr3CTQkTdb7Hsx/Tl4M5vpDUTWbXakmjOpAyEppEUgsUdyVOb5MhuVRJmC/G
         znuOLgaqg5/jplfruj2NW1BP3TU9MsopgdLPC21D0gb/Qqr9PrheW5Pt3+5IaYBxpoa1
         TnE7HMkOF/EWLW9e1kGtuAOOVSwHOF88uA6/7cDUmTByp0z8Rl6yKwzIA8EBdoQLHwcB
         Yuh+vhpeZLtDrF2TBRDI8FP7vh36wqDblvKWprLu1ei0L01wcX5wU8pc3nRVrYr3XZ6E
         bR/CpEQYZ+2CSFPLua4nuAUgkIf7A13nQ2j7khDscs8czWA2z5JAcEX2TCqpQPHXiRjV
         zSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761576979; x=1762181779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyBK5HLss/zF/tM/K4qW2J+Z3asnvx9H1hG28ozg6Qk=;
        b=KqhjsmiKpXK3gQxfSz8SOHFNbgFuqVFgSlfaGn6IKJwfHC1E+mgeEMzxh24vDlKGA6
         aZMLIDGhyatH+fbSbEIL8ebMsTkNCebTgqDhK1pGMd3YmFBEPs7tVt3F7ptHU4QEjuqQ
         PLN5Umdw3fq4fvvuZojvKz4O50RRagMYnEpX/x35xKK9z01lAoY6xBja7afiFD+VciTb
         Bs/JRp6YxBiRe394rJ5QL/O6E5wzAcKwhiDLkKPPJykL5v5MyvlM/oj6JOb9+xQGqy1k
         sEhIPHiKmxnuTa/WAet7ZgdWca/dUuAg6Af58e5kuIbOUrUe1djMyLNwh1QXnFf4K8Tc
         YN6A==
X-Forwarded-Encrypted: i=1; AJvYcCWBR+xxgsgA74LFs+cpPyNI13CZj+WR9zbyfTypfR//Wc2lj/RWQLF0FS/dhC0K0Qce0fbl5+rt0QIojQ6ispWb@lists.infradead.org
X-Gm-Message-State: AOJu0YxmPcyLLlU+PSZDPIdJjAdvIxceO6471cgf0xczF8Zh4exEJM9o
	9kHXDJ21lztnDO65ud1TO3AJIdr6k3z7w0nNsDZI4MSUuOmeGC0iLatH
X-Gm-Gg: ASbGnctj0sevskT+tGaN/g/JgZfxMjHxKn7ZZBcmB2I7MCw1VsY1xVrCNeS36Onw4II
	rWSD2hNvcRTvMTsy5eON9J+6kFNepIA1wDqgig0bPfc9+8rqEIsoeFq1ahPB98Ixnxk261zk6c+
	dHkbQuUi9W+ObjU3eUy51wqMNVre6OBNkRYfLMTAq6aR5HZV/rn0/lIMGGLxhzSi2uHriLr2uQC
	BJaIStj1dZA1PLNjOOWYbksXfDujsUUnZHpg3PZ2rv7LkPrSF0v9ASWLaBe/zywGGtx9duRPsYt
	bnAmGQqXW1EOzhU0w8jvZSpdUgKuj1LF0V5/npsHRFUME6EARh4yH9bppZClDWkv4L03R0leM0C
	mYOa2Egcx8PoVoa+ytVB3rAUm+h18oyVbwTM+rxRWbUviURZPSB6J+wMsKn6s+/uaUO7UNfvRjw
	==
X-Google-Smtp-Source: AGHT+IF+HmWWIbu4RONj+wms//aaht+5AP20I8+4ooWFn7x7evY1F6ZZlpjlb36aBgMXfZJZOoYYlQ==
X-Received: by 2002:a05:6a00:928a:b0:781:9a6:116a with SMTP id d2e1a72fcca58-7a441bdb5ecmr276136b3a.9.1761576979105;
        Mon, 27 Oct 2025 07:56:19 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012b19sm8373372b3a.12.2025.10.27.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:56:18 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Hans Zhang <18255117159@163.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-pci@vger.kernel.org (open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for resource cleanup
Date: Mon, 27 Oct 2025 20:25:29 +0530
Message-ID: <20251027145602.199154-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027145602.199154-1-linux.amoon@gmail.com>
References: <20251027145602.199154-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_075620_162992_EFB9948A 
X-CRM114-Status: GOOD (  15.21  )
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

Introduce a .remove() callback to the Rockchip DesignWare PCIe
controller driver to ensure proper resource deinitialization during
device removal. This includes disabling clocks and deinitializing the
PCIe PHY.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 87dd2dd188b4..b878ae8e2b3e 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void rockchip_pcie_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
+
+	/* Perform other cleanups as necessary */
+	clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
+	rockchip_pcie_phy_deinit(rockchip);
+}
+
 static const struct rockchip_pcie_of_data rockchip_pcie_rc_of_data_rk3568 = {
 	.mode = DW_PCIE_RC_TYPE,
 };
@@ -754,5 +764,6 @@ static struct platform_driver rockchip_pcie_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = rockchip_pcie_probe,
+	.remove = rockchip_pcie_remove,
 };
 builtin_platform_driver(rockchip_pcie_driver);
-- 
2.50.1


