Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E05C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94QHz8s3x5xn+pO8rBCK3/IvZxkKB7/6zt01u+1XuTM=; b=XIkSzdvub/bXE8GeFhALypHyHE
	Hhhi0b3FgFWG3haVIvca5+7rQXcep4mctydwGGxAaqSSu/k+CueFwAcFl9PhU+q706qiZMXbxQMiC
	3yBZoyZdLGlU27hCgoDLe/ItvwFiK4bTac8elZsvwnOODszNSJkJxtJs1BTdNNtuqEJqC9+4PoTmz
	eNEXNidB8SjCD8rnICGsC++g5NeTaE9RDKoHFPlpeQtMj8rLiqORePRoWBmo2VlXlMifz8j8v9Hvw
	BV6VkoA1+yvzv0L9eThRH7PZFSNP8ExplBIPXC+7sFIgzZUUYSm/eFh7TkVitBMcprvaDymqZbLgm
	49Uj9eiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwYz-0000000599p-0WmX;
	Tue, 11 Feb 2025 20:08:57 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwLB-0000000570e-2I8Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:54:42 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739303679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94QHz8s3x5xn+pO8rBCK3/IvZxkKB7/6zt01u+1XuTM=;
	b=pDEX3FADIaxZqP3isL/WiMyLef1K4xb9sxTX7LRopb4HsNgAR6VYntUTm4OhNJ6V1ZqCNO
	uRYkF0RR5WbaKAGWRZf0N4RBMib6cjbYWFRN2szniy9IE5gOEFvi3QKUUUPaLwqCnTVkLk
	uwE1XS1V2ldcaUQox8EDq9meAxiOAzzyf6OBL+ztG0B9Kfq64Rxg14wzyleimmABWnutSC
	vk+UcuDyDm0AwrQn5e3ID5G9o4UYqfJ4B02UukNqbXvB6+81OHaVZwtsW89fbEqBeaQebz
	+d+TQmBvQ4Sbnpv/GABq7Qe3WUu1BwkOfS8rhvJeqcuFgO5bLcdwsGCmonkLKA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 14:54:27 -0500
Subject: [PATCH 2/7] PCI: apple: Fix missing OF node reference in
 apple_pcie_setup_port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-pcie-t6-v1-2-b60e6d2501bb@rosenzweig.io>
References: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
In-Reply-To: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Marc Zyngier <maz@kernel.org>, Stan Skowronek <stan@corellium.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=br8u3Lwb/VWy9zwnA4KwWQFXuGukXNpIxSbrSFqjuw4=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq6r1lSpZWagAS4cG/cY2wbT3jejBBZIBmSm+c
 HyLBDRftpiJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uq9QAKCRD+/lBaCvVY
 DTX/EACUiHlwws8oozaS9C1v7YbZPWIKXIdhfYeASI4iF7fyekhYgal15Vnzf/jqgkN2Ma7vARE
 LOc23fkA9UBb0ydPBMRvOH3PyMzd1LZkrVTgBKkPqp0PN6o8XOB3MBdR2h2OB97ijw0rhJ0gds4
 yvE2X2F428EGB7LFX3/RAO9RhmZm54WpYy1ZMlh5UpLWKPi7NV1mErTYOs7ED2dFcaGOlg/ZekL
 1iFMNMmDCOX1vO0d1lFOl3/DGkoGmbCJlcATohXlsMfTApneIyUj92wmNUVgXjL/PEuLxFRTLcp
 a2Qr0qUK8disAbWvUQ+EFhvkc4qheHUaU5qukpSfTZdg81aznoVxSO4p44h5ihIDBr4KZlJLGaw
 0kAElwx+RZyQ/SSLjdgX+CAPxkC8Ir7MULoIX/t8LdWvXqk3NJJDxV4pFbnr8Z0KgD+URZXM5TL
 IulEHFmdkqEP3ZtmqqJg45zrTdWy2gZkGKhj4L9goQyTTaQt7w9fKaWX+rQqxqFkwvv86Ad6+NY
 eyO8G5FagnpQJhjyqGBPKP53Gb63LmTNX/coWpXY4H3AsyeIFJD7DERYM42A0EIsplFeZa0hE5O
 SkmOz4ly5bDySc1nGE5VoKjQm/sJO7S2u4WOXmbRktKy5xJedSE7dGzkJGdlZzQac/4heXHon3X
 Nb1lCU+DOd7WJow==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115441_727018_6BC3D036 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Hector Martin <marcan@marcan.st>

In the success path we hang onto a reference to the node, so make sure
to grab one. The caller iterator puts our borrowed reference when we
return.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 drivers/pci/controller/pcie-apple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index a7e51bc1c2fe8ec31902816e9be6749b756ec77d..8ea3e258fe2768a33ec56f0a8a86d168ed615973 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -584,6 +584,9 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	list_add_tail(&port->entry, &pcie->ports);
 	init_completion(&pcie->event);
 
+	/* In the success path, we keep a reference to np around */
+	of_node_get(np);
+
 	ret = apple_pcie_port_register_irqs(port);
 	WARN_ON(ret);
 

-- 
2.48.1


