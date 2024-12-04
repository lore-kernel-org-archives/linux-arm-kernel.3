Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E70E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+nWpBtPZhDKntcZxCUK7yH7Edf8LM87G3Th86ukbSQ=; b=IaePuPtL5KL8xBiNAaXn7HxgtT
	p/BdHo4upLxvhbe8hH8u0ky27YAXWNJa4N/hkVhFoWaFYYtbb7ZpCK926NFW5zAt8lQ5Yz0/l52hq
	6OBQqi8LvJ9kNoaVD0SW+I3Ku9PVFa99FA4JHT7Ua6HZtBilN8eFT+3qWFKFDhD0JRDZeLj4jtQva
	SIGLV/Qv9Z+KdatZLQCzLLYLTpXFuyxqd4W8lSOMZ3NewqLicBgMU3DnIlCjW0Cm9OtxH1v8Y8Ofk
	W5hPyTXnRaxXQELaG0qaIxlR6ujpMM6FBVhUEnNVtjcG82B6h4rrjM9xFDtP2POk4383cyT9l8KrB
	8Av30oVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqws-0000000CwD2-3UeV;
	Wed, 04 Dec 2024 15:05:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqsy-0000000CvPr-1FT3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:01:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 825465C628F;
	Wed,  4 Dec 2024 15:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCA5C4CEDF;
	Wed,  4 Dec 2024 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733324511;
	bh=bGrthp6P6OjGXSuGAAT9PJ7U09h7+JZZ06Vtmr7nZv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O0ONyUa0NIju4sT0cu7zhe0Q1Zo9jkyng1DWVpBdqZLqgUuK2IMVW8/iM+9uQ/yim
	 Sy3wMVyXF0OM4fZiIKEUoFR5QVtfcKVtHcaiz4kgxNfw4AEda2sYch16JtEbhQPZgC
	 uN1yH/2mjrL35RlGeL+7w+wvzb8BPLPXcoH29bLM+Rp6diKOhE41ehjSvRmk7knvBR
	 bnp8KN+AanPUfepm0Az5oJkmXhTYb8sJ3hmg4qDHj+fyDQZkd0tmyu2cboIkO0uWtm
	 71krdOeC8i0jo2P6uVCvZIGQbpg7oUdr3Z4Yi9BHBdqI9wUXVRL9peU4pBNed/w3dh
	 6bkRRob4dP6fQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIqsv-000TvG-1E;
	Wed, 04 Dec 2024 15:01:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/2] PCI: host-generic: Allow {en,dis}able_device() to be provided via pci_ecam_ops
Date: Wed,  4 Dec 2024 15:01:44 +0000
Message-Id: <20241204150145.800408-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241204150145.800408-1-maz@kernel.org>
References: <20241204150145.800408-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, alyssa@rosenzweig.io, Frank.Li@nxp.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_070152_377982_D15D4BA7 
X-CRM114-Status: GOOD (  12.73  )
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

In order to let host controller drivers using the host-generic
infrastructure use the {en,dis}able_device() callbacks that can
be used to configure sideband RID mapping hardware, provide these
two callbacks as part of the pci_ecap_ops structure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-host-common.c | 2 ++
 include/linux/pci-ecam.h                 | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index cf5f59a745b37..f441bfd6f96a8 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -75,6 +75,8 @@ int pci_host_common_probe(struct platform_device *pdev)
 
 	bridge->sysdata = cfg;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
+	bridge->enable_device = ops->enable_device;
+	bridge->disable_device = ops->disable_device;
 	bridge->msi_domain = true;
 
 	return pci_host_probe(bridge);
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index 3a4860bd27586..3a10f8cfc3ad5 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -45,6 +45,10 @@ struct pci_ecam_ops {
 	unsigned int			bus_shift;
 	struct pci_ops			pci_ops;
 	int				(*init)(struct pci_config_window *);
+	int				(*enable_device)(struct pci_host_bridge *,
+							 struct pci_dev *);
+	void				(*disable_device)(struct pci_host_bridge *,
+							  struct pci_dev *);
 };
 
 /*
-- 
2.39.2


