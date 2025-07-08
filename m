Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982DFC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Wg8VsMa7/an42JO9RmaBrIwVEQL9rKjT/Jol2B6lYA=; b=Y6nFH768d0sfEtzImOEhQJvYpq
	3TRTls3RkTqBdxeyhER9awC6TdZFeS+02MpL8nJafSYmQbY5fnsIVfA8IPLZ6EZNp8VyK4BoPm6kz
	9jtGRNi4n4lCbFk0L3qyJDWrOwBwNWsm26Wo7XIv61ocC+HrHKJTYaXSLOnu9DAcQaKD0//LgE0Y+
	kWKZMMkax0PYMZeq+rQ/SK69joVGkUrRaPEITCkfU/VcPvmSblYo1jsMOtZrSKIRUtPO20F6SB6M5
	lMa7eMtFfisMojsIgh/syp86GGid2y3VxGwOiqpjKVi69gfwpOG90OJwjx93vzR0aSAlAyPifaQta
	E1DsktpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEA3-00000006McS-0jEn;
	Tue, 08 Jul 2025 19:39:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCCp-000000067mm-3rGE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 982724605C;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748F6C4CEED;
	Tue,  8 Jul 2025 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751996051;
	bh=zWAmwKnV6f1cwbtaUPgrJ1lIE+Rc2XJQ33KR+f1+GBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lk6AEc+pwSSa+6W1orB9UPtYr+5as8dQlcw92PkFHIS9ReJX4+jIoRaoNLr8bWezK
	 24hexua/XsO18wygcvBn01f2hMKsjWl57Es0lBicNtMBk5NjcAjusqioZQSqop7z6n
	 WAN7jspqfMTFam6mkvcxJVISPIo+e2NoRJoBbD2AISWrzl7IJq68Hr8rPmalWtkP2f
	 KkX31v8A5O5ky7TvJnvk+MlRLNLOyMzghVn6vqRYUamnSKYjLbCSDrchGyBz8Ejo5/
	 HhndG0C7xCxtKycWWmGUo172CXRemaj7NwZbgKAeaPYIpazxAWiK6ZmblPx0xXRQpY
	 XNPzgMNdNijJg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uZCCn-00Dqhw-Ch;
	Tue, 08 Jul 2025 18:34:09 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 04/13] PCI: xgene: Drop XGENE_PCIE_IP_VER_UNKN
Date: Tue,  8 Jul 2025 18:33:55 +0100
Message-Id: <20250708173404.1278635-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250708173404.1278635-1-maz@kernel.org>
References: <20250708173404.1278635-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103411_982625_7BD72878 
X-CRM114-Status: GOOD (  15.51  )
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

XGENE_PCIE_IP_VER_UNKN is only refered to when probing for the
original XGene PCIe implementation, and get immediately overridden
if the device has the "apm,xgene-pcie" compatible string.

Given that the only way to get there is by finding this very string in
the DT, it is obvious that we will always ovwrite the version with
XGENE_PCIE_IP_VER_1.

Drop the whole thing.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-xgene.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index a848f98203ae4..b95afa35201d0 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -54,7 +54,6 @@
 #define XGENE_V1_PCI_EXP_CAP		0x40
 
 /* PCIe IP version */
-#define XGENE_PCIE_IP_VER_UNKN		0
 #define XGENE_PCIE_IP_VER_1		1
 #define XGENE_PCIE_IP_VER_2		2
 
@@ -630,10 +629,7 @@ static int xgene_pcie_probe(struct platform_device *pdev)
 
 	port->node = of_node_get(dn);
 	port->dev = dev;
-
-	port->version = XGENE_PCIE_IP_VER_UNKN;
-	if (of_device_is_compatible(port->node, "apm,xgene-pcie"))
-		port->version = XGENE_PCIE_IP_VER_1;
+	port->version = XGENE_PCIE_IP_VER_1;
 
 	ret = xgene_pcie_map_reg(port, pdev);
 	if (ret)
-- 
2.39.2


