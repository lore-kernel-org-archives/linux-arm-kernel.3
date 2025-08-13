Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB55C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6mKCjQUk2oLEuuNK0OlGkR20Na6TcRSrgMUtErOeas=; b=mE9fY4WeZ4MObNwsU3NRsNP5Jz
	N4B76obS31mZ8a0rmPhkGTcPQtfZHRmhRMNHIXQdEwA8kWparkhl6O00GeTFk+Hh46KVtrVcNNSdJ
	MLdsHxvfqChDqFbSFSfTcp+RfDQLIeHZNo9xZYQ7MTkb0WLRJL9yT8Ra7tlf1PF7H3FUojXVGgbPX
	f5n1kl9k1iGlZcoKPUW7AEXJGNcxvx4PrQKIKtNL6DUWpxTSzR/S4TONTBfELCqeH2gzNSiB4pWWN
	rsIVz7K/AdIL7Lpfe4i4rlNfj5+9iwsVJ7wp1cDGXVgPMskJdIIQUYLcvi6NOE6uz0tI29B83Rgg+
	EN3s2wEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8HG-0000000DIsI-0yrB;
	Wed, 13 Aug 2025 10:00:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8B5-0000000DHnu-2SHA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:53:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96DBA45B8B;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 320F9C4CEEB;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078830;
	bh=5whLMpPXnChjOuPWhWWpR+lMWG7khfLx4YWLL4J+Wzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tpw3X7p1c42oKJDTGdTcWbbw2q8YXPQFHW1s71kCnQmYc4rJgN+CsvJUZUw0hAi6M
	 MaUGipDI2Rjql83fIRQDL9oybV2vaffMHbGd+I6W6y2yn20Zy0ZXOE5Vuoq2uZowrI
	 CG8TrdSe+lPAy324oYVbEExJwDXk4lm3nefKm7HYaUH2zImUWapyFH/mVmaTMzic63
	 jVjM46I5gLyRvmq3nZrmw6H5OQeuyIcIc1fzFXAiNEIJxgtTUdXsc8QpqBy+SJhIpm
	 lCWZdSaPnQ/c5v7WtSKI5YuHyBevr8na/pSzwfBRD3uuDhXHt0saBfUWJFikMJeKuZ
	 zN9QsA7gotm3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FC6C87FCF;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Wed, 13 Aug 2025 11:53:33 +0200
Subject: [PATCH 1/5] arm64: dts: apple: t8103-j457: Fix PCIe ethernet
 iommu-map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-apple-dt-sync-6-17-v1-1-209f15d10aa0@jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=QgvjbU2+ige4nQSRScXv7jFxB1PnyJOY3TFJi0m6MY4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhow5CWv6+d6q8iq036ssZ9k4a2bJc/YEiR+rncWEAkSZp
 gWaKkp0lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmMj/n4wMv71Pm6wznqqQ9mvb
 XdEah0w9419y0ctvufp4tH5hWPGqgJFhZ8FUhjc1l4wWtbzyUHm0Pv7yUr2OiAte+2/dCN/zWOw
 PEwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_025351_671642_EFA29CD0 
X-CRM114-Status: GOOD (  12.54  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

PCIe `port01` of t8103-j457 (iMac, M1, 2 USB-C ports, 2021) is unused
and disabled. Linux' PCI subsystem assigns the ethernet nic from
`port02` to bus 02. This results into assigning `pcie0_dart_1` from the
disabled port as iommu. The `pcie0_dart_1` instance is disabled and
probably fused off (it is on the M2 Pro Mac mini which has a disabled
PCIe port as well).
Without iommu the ethernet nic is not expected work.
Adjusts the "bus-range" and the PCIe devices "reg" property to PCI
subsystem's bus number.

Fixes: 7c77ab91b33d ("arm64: dts: apple: Add missing M1 (t8103) devices")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-j457.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 152f95fd49a2118093396838fbd8b6bd1b518f81..7089ccf3ce55661f3f83810496daed40c8199189 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -21,6 +21,14 @@ aliases {
 	};
 };
 
+/*
+ * Adjust pcie0's iommu-map to account for the disabled port01.
+ */
+&pcie0 {
+	iommu-map = <0x100 &pcie0_dart_0 1 1>,
+			<0x200 &pcie0_dart_2 1 1>;
+};
+
 &bluetooth0 {
 	brcm,board-type = "apple,santorini";
 };
@@ -36,10 +44,10 @@ &wifi0 {
  */
 
 &port02 {
-	bus-range = <3 3>;
+	bus-range = <2 2>;
 	status = "okay";
 	ethernet0: ethernet@0,0 {
-		reg = <0x30000 0x0 0x0 0x0 0x0>;
+		reg = <0x20000 0x0 0x0 0x0 0x0>;
 		/* To be filled by the loader */
 		local-mac-address = [00 10 18 00 00 00];
 	};

-- 
2.50.1



