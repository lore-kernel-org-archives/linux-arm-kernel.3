Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1F2C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z3aAv8IagfPXTqvWHznNbHWmTyNuVAlNgwMD8bOopE=; b=zoDKyzi8kypgFRqIS+iVTUaWhP
	fqFqoyETlfkcjjnbr3OnqKYVuBkIM7VGTpvhGupumiuqnC9qWROidEWKK/3K3wqd9LzVDtxFRia6v
	sFq2WKlg5Y9wWRHLsP6bCmyWucrPAZJaLWj3Zdf6hznxvITj675s+THl9iOtrRHh+frfxWxK/pmQX
	od44YnxVvMjU11hwtNJpI7LbbWBwe02dvo/7SoocwrfkiysHCpyJoBJrfPyyhkKVyKGLyP29+fX1v
	I6GOyYvKh+ezvEljgqkxwcdEqlXOIHP2VeOEr9dxz8L0z0HDcJNU5k3fmPENDE5zG9Q0ZNykRReMZ
	T33JodgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwYy-0000000599F-2U1V;
	Tue, 11 Feb 2025 20:08:56 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwL8-000000056zU-2t7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:54:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739303676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9z3aAv8IagfPXTqvWHznNbHWmTyNuVAlNgwMD8bOopE=;
	b=c+gXPHYRXLFvGM7DA1cUyWXIsY1fL2QlNrQv+qo+cy+YuIKJRaYQmfX5TXPD9S25GhPzgI
	rGD9XAFOgED3gMWGl7QVBFwXlPx9kRiFE4vrbdSi2mUluO4paEZf0ZU8D/K9hVJYxoREFR
	THXO9Tw8To2Slxj7abSFgSI5GqN55ZFInxWkenTCtYKHqhMcDppzvIIjHKlHjv3Xw2etCw
	hbWRSAl+Nkbpf3hPkCahb9CVLVEwNzl18JuWnuqa5x31DN3O56wg+7i6k+8l4yERRZfjTc
	T6CmwO46lScEVf4lNT+y4gV+u75X3UdoT6hbt8Mfrnv5Sc7JkBB+MMssNcma7g==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Date: Tue, 11 Feb 2025 14:54:26 -0500
Subject: [PATCH 1/7] dt-bindings: pci: apple,pcie: Add t6020 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-pcie-t6-v1-1-b60e6d2501bb@rosenzweig.io>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=pFpf8dL5ADZfvFnoqSP2NvXLSTIOTz1Wa6whLoN7LuU=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq6r1TeeVHZs1Xd12TSUBL6/EGOnx4tDyU6cMg
 OlYJ/9tK9yJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uq9QAKCRD+/lBaCvVY
 DdKxD/9rD0CnxsgdepfE6OswMxwTF4VjruMeWCA6bEaPLzpHPU+237FDLpVVWeJGnkDpLOY/r5I
 kS1dAHlEFPfwD7jwwqmW6Kwx/5COt5GE0RcDDxjdGY7GX9Tw16alajpKqqSLGgRUlpYc1sMl+Kj
 E84JOrk3z4uutDS5oqCZw458sRgEUmjcKfh1dkA4/MuLkMlj+ADav6JCr2lgcHrZIb/CBixPbFs
 dAbGIJJ6ePr9fpTrXVZj4LUxMljCTi009B2EW3vnfSRe5cdlpjGsR5uc7fJw9K3ByFldsaHgbLI
 1lMcYf1FDm/c1dJAunf02CSgi1ZWUIvMFyAoyUGQXGpNyTUyeLdKfYTh+SdUBiLuIZzl0OcbXau
 kgEMnXqTpmJU0xuKtLhLrdybTkFid/9frs0dZJUsXuxi0R2R6n3jEiNODLsc3+tQsfJoTpMg1RB
 xAFSs0lGmPRWyDNSLRbMUDf4Pe3K43WEs39uj96bf/7O0WKOh49SoHirE+XrjJXijK/g1HGUwbh
 watKZzg7cNHN957cBKH+nAzA1Gvmd6e0H9zSm2GRmLd+J7nXktn6xKTzqwTnDQSYJm69Mbw8k3n
 DILYGrbsxTSfbe2VpH8DgRq1f46+Ca6I1lTdFrDRlSpvKXCd1l2dR05A9CJXxajvwUzTbFZRiuB
 Z/CfA9cCixoB9iQ==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115438_872497_BF97EB50 
X-CRM114-Status: UNSURE (   6.82  )
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

This shuffles some registers versus t6000, so requires a new compatible.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
 Documentation/devicetree/bindings/pci/apple,pcie.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index c8775f9cb071339dfa6f17f9f4a99f031c98b70a..4885788ff623eebe6a79bccc0f8a9a231a01c5ca 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -35,6 +35,7 @@ properties:
           - apple,t8103-pcie
           - apple,t8112-pcie
           - apple,t6000-pcie
+          - apple,t6020-pcie
       - const: apple,pcie
 
   reg:

-- 
2.48.1


