Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990DFCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 08:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EE4DbP6VyEopa6RRKZ0TwuzbhB7U4XSLZlbDbYNwWIU=; b=gN6LB3ZIS45lTQcE/+1Fx/lABv
	9XELaiDhKnDuPC2fjG87nygWq2w6QI2CdhgThL03Yk3wQceU6SdToiaakGt2gZy8jxiYkqXinlk6W
	3KOLEOoqwLPkHsgxQ0hPSXRahWPiM73iVBPx63QWcpn05QHCLN4mc/NhXubgePOLy3Vx/fILRnVqS
	JmzydBWC7HGLb/buw95gfoO5Q77WJvObuMA4PCCOWUKRM7FNo2LO+T7MXR5yEUkrbYFYj6RFbFC1Q
	Kj/8zZpL1x7bS94SUUSGdUjj8aXFuvnJD9Dv85y3KkSf87zHMGKWKA8Rp+b24i1MEAdsw4n2EBtvh
	W9wTQ89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g8E-000000077nG-1U7E;
	Fri, 17 Oct 2025 08:48:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9g8C-000000077kv-20Tg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 08:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CE114B051;
	Fri, 17 Oct 2025 08:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC0BC116C6;
	Fri, 17 Oct 2025 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760690892;
	bh=aQM8S1gRQ5jL8Y273uYJ9Sl4vppeQ81J+AkspAyr2H8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OsutJEW55HQyO+td7OWiczhMBPckM32yQP4VtNVV2xrDdYjzrloB/Un+AZ5bIsqbu
	 01EyN6iYYyuZb50D3HWUCKDjMJwyk28rwfWLjiZLVYCQW8VW6fEgJrLgybyMdpxegH
	 gDVf0LT5hdZzInU/YseP+w1c5cUXrv8QIEqYojzsnjoY2aqiiRKQYwwxkhrqOatb0Z
	 6UwgnjF4+n0zTwZpB2HwpeosTG60RWUVpOSpwqXOHRIUwPVUr7aJVGE4t7U6kj54QM
	 PwFfnQ4dNFvYF2EukQWYGoFSuLvD1qV4WT4gFXdbvLfvKMopVPQmDScDq3ysb5b2c2
	 hPRFL57qy+Crw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ray Jui <rjui@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 3/5] of/irq: Export of_msi_xlate() for module usage
Date: Fri, 17 Oct 2025 10:47:50 +0200
Message-ID: <20251017084752.1590264-4-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017084752.1590264-1-lpieralisi@kernel.org>
References: <20251017084752.1590264-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_014812_538754_491521CC 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

of_msi_xlate() is required by drivers that can be configured
as modular, export the symbol.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Rob Herring <robh@kernel.org>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 9f6cd5abba76..889d0dfbcb3f 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -732,6 +732,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
 	}
 	return id_out;
 }
+EXPORT_SYMBOL_GPL(of_msi_xlate);
 
 /**
  * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
-- 
2.50.1


