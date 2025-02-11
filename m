Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB48C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bjtWxBs83BeuDmTbDt+EHDOyKdhyT00WLwVNCX8IS6s=; b=SsTlZYH+RH8ADf
	QONqEaiQeu1aoyDtuzL2cHbKVJ74tQAxqcG6ms67hLk+uZHzFY6ocElqzhZxPdiZAq8DtZrXROumH
	K4QJsgc3UAPNxkM2YoWo7s9kGAul4GU1LlyvcR/ViQAUE2kcAh/ShLTHCUoQ3XuScb7TmosghLbja
	hNAbZTnXvH9cfnC+3Pzjho0u6cYRulwqjy96CEZEHNvh5QugNqCWCchrT8ucc6IpIsWYnlEk2cczQ
	OGRXp2QkhI5xf6+zwMI++cCVSwApROd1HJ2SKbMKWfSAri/4d6WFpru9VlRknavAtK3xDbUAjvGmV
	yOFgADsCsF8fmCTptomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwYy-0000000599B-00Q7;
	Tue, 11 Feb 2025 20:08:56 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwL7-000000056zM-3pK4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 19:54:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739303673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bjtWxBs83BeuDmTbDt+EHDOyKdhyT00WLwVNCX8IS6s=;
	b=a5DtbJVvwtvk4xeAZlHBtFv9PNrT5Ibudy9tbKBSrDOeYgmOY/LhvzgXaqIKmHU1rVRGR1
	lNMhh4/6bI/At3zCJVrIrDttdqUXM8Sl9oQL+fAs5hgs/DJIkWZJ76RfQixqvNhHeJrzIN
	4wsV1Eomj/5177fqUXxiQLl63Q731+b5Jvc0k/ZlQ1SkYIWlOIfO73OCNIfX7CS8K20mzM
	+Vyha15mA1vpWiOVmPaRTS9XBhDmYUP0gqtfPGgu93Z6ghvXIx51Jxt0GbE/06f+4/rLE5
	x2NxelrrE4Ibh4JhDXqXi5kHM1FINGakkaulLE6b9SKPuBfKEu9jsjxdlmdQ0g==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 0/7] PCI: apple: support t6020
Date: Tue, 11 Feb 2025 14:54:25 -0500
Message-Id: <20250211-pcie-t6-v1-0-b60e6d2501bb@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGqq2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0ND3YLkzFTdEjNd4zQTC0uL5FTLJMMUJaDqgqLUtMwKsEnRsbW1AIz
 yLv1ZAAAA
X-Change-ID: 20250211-pcie-t6-3f4898ce9b1d
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
 linux-kernel@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Janne Grunau <j@jannau.net>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=alyssa@rosenzweig.io;
 h=from:subject:message-id; bh=vLPYepmCn4mhfGlDn5smbuR/5pRrA54KLcq81jDIMU0=;
 b=owEBbQKS/ZANAwAIAf7+UFoK9VgNAcsmYgBnq6r1hX/zYTOcr8IsxIdT6f8LIeprpn21i7hFi
 FMMsjhwAHmJAjMEAAEIAB0WIQRDXuCbsK8A0B2q9jj+/lBaCvVYDQUCZ6uq9QAKCRD+/lBaCvVY
 DQBfD/9Vrm3zDhNnwWZJlv0XHhz5dXaXNFpop4FmbBwlOS1GI18cZWC6vaX65sUOGm2pLgG4i6F
 Tf9Vo6DRIEdQYPMkzZMg6AvsXjLrPO2CypPLGd8TOkmk9VowXTedeU+ub2KgUJXmOY7LQEO6VtY
 T+JF8DkiGLjvlxHrjkhRm0R7seTPpMfIP5Z+lSeJ3bS+LhkxSfC24d+CcX+1A02MZNAudHhiqWm
 SkxTDbiHRvJm5mjkXfnoIg0Q+2c4re8xd5TC0pk6wnTN+5XvZbZC3DirRGxAcEAN02OUddXVpVC
 Ong9Db+NV9xXoaRUhEiinE+emBlAabt1lIAdJOXe5pCWvP+8LZmtaeCofozy5ztqIWU+C1YjDY/
 Hrt9EZFGQUpypV0USyXLl/LAepePjC9SVaBhCcI2iSVV66RW4VBNyn3TZkQOlEneA/PzmG0jIHt
 sSgxbr19Yz0IHLZURp12jlSXDHojbbWknY1uPrrmL/llw8YoQQacVI5s6mfCYEiXDfwXv6w4WwK
 bwP5XF7iiqm8ZToXwAAhfzHfro6D/Ep6r0f6RuyNxJ2SHKJYavuyaDY8yQs0k6lhiorhWIOR1wg
 ykDz6mRLBMLq2oXcp9Jpvb1/VJH4/+wznxYsYZahNfiSVGPu8Sh4MP5unjkI5x5Y3WY4m+CkqA6
 iwEjEi2dojl2iGA==
X-Developer-Key: i=alyssa@rosenzweig.io; a=openpgp;
 fpr=435EE09BB0AF00D01DAAF638FEFE505A0AF5580D
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_115438_442743_DA4BBBD9 
X-CRM114-Status: UNSURE (   7.35  )
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

This series adds T6020 support to the Apple PCIe controller. Mostly
Apple shuffled registers around (presumably to accommodate the larger
configurations on those machines). So there's a bit of churn here but
not too much in the way of functional changes.

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
---
Alyssa Rosenzweig (1):
      dt-bindings: pci: apple,pcie: Add t6020 support

Hector Martin (5):
      PCI: apple: Fix missing OF node reference in apple_pcie_setup_port
      PCI: apple: Move port PHY registers to their own reg items
      PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
      PCI: apple: Use gpiod_set_value_cansleep in probe flow
      PCI: apple: Add T602x PCIe support

Janne Grunau (1):
      PCI: apple: Set only available ports up

 .../devicetree/bindings/pci/apple,pcie.yaml        |   1 +
 drivers/pci/controller/pcie-apple.c                | 189 ++++++++++++++++-----
 2 files changed, 146 insertions(+), 44 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250211-pcie-t6-3f4898ce9b1d

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>


