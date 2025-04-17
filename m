Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F18C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 20:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEW2PcmQ0Qj3s5D4hF9/zO/sJRy6n0uEnZGZQTyC6xM=; b=l42AvMOyni3X5I3tSq5mf0+iaJ
	PMQ0BWQdfJ2oBV4fya73mEZXGFc/D/uoAWgN8Z/r+LC/wWNvgXXr1yMwwQVOS7naspNOisNN9LoCW
	9LHuNgDapComOpH0byAVRuH3+jESQilhdPe1KxdlOGTSY+4TofWatN3ks6boHpsr5a4xFdfMno93i
	dINei0NdW7zRMGOP9kGVYbdrdKPLD3BC25wOKY2bXjKDwhXz1CDX3fBcfa9EjZ+HMQegHA66wUyPl
	WVnh4txf6sq47REf1q3Z133OIAKlMfnuOsQh9SHoKNuduCX0osbNA+FHxIrmjOZEWnwecN/hWD9Ik
	Djp71NuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Viv-0000000EGU7-0K8A;
	Thu, 17 Apr 2025 20:20:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5VdP-0000000EFoN-0esU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 20:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 933E745269;
	Thu, 17 Apr 2025 20:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AB33C4CEE4;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744920893;
	bh=xe/XbPTNMWOUvfQhMFdfG53lPMV0wLrC8A5QFWBNKS0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=r10NY05yOB77fi0aqvmhXgWKsMRQseIxDak08DTixY5Ug5ulIVjlmAT/dsMJEZohq
	 EQ7/8OocWaHDz5HeLQjZ706zjtxL39pX8mAtbHIKU0feviQvdD2OCZEE8NerjPf2dz
	 vqAfJ6hkJCJfrMhp2EQ26bvkJb0c41/4+okWPSTLiKGRvyU5Zcs8EVg99yS1ewlnVC
	 /ZwSCUHe5zHk1TwdagE753PvPMLsyi0xP+/NDYg2hTi33sArShgR9gUWtBKb8y6Arb
	 haInWhBRNH4AOvAjNpm1cdyvAY8SapYD2/pqkC5lJIwzW0ZznIRVHkHk15PJagf0MT
	 Zn8MuFz/LKgDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D486C369C9;
	Thu, 17 Apr 2025 20:14:53 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Generic SPMI NVMEM cell driver
Date: Thu, 17 Apr 2025 22:14:48 +0200
Message-Id: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADhhAWgC/23MQQ7CIBCF4as0sxYDg1DjynuYLipO20kEGjBE0
 3B3sWuX/0vet0GmxJTh0m2QqHDmGFrgoQO3jGEmwY/WgBKNPCkj8upZhOLJC5Jnq41WVvUG2mF
 NNPF7x25D64XzK6bPbhf1W/8yRQkpEKXt74RGu+k6+5GfRxc9DLXWL6oi6TqkAAAA
X-Change-ID: 20250415-spmi-nvmem-e08635316175
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744920892; l=1618;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=xe/XbPTNMWOUvfQhMFdfG53lPMV0wLrC8A5QFWBNKS0=;
 b=PkNjSV0OwrkOkY1LNHvy7Derfmr+FDdmzSUaInZjF/OLcjklbI9OTaW+BCAvz34VWtj4Ovewi
 RpF3HCcqh5pBfTFCg2faSAdPXskP15CraPq7sAW+xa/61BD5/tdzqB0
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_131455_236711_27F5B4F0 
X-CRM114-Status: GOOD (  10.33  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This patch series adds a driver for exposing a set of SPMI registers
as NVMEM cells. This is used on Apple ARM platforms to store the RTC
offset and to communicate platform power state between the OS and
boot firmware.

The NVMEM cell consumer drivers will be sent in a further series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- s/pmu/pmic/
- Sort dts in unit-order, instead of t600x-unit-order
- Link to v1: https://lore.kernel.org/r/20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com

---
Hector Martin (2):
      nvmem: Add spmi-nvmem driver
      arm64: dts: apple: Add PMU NVMEM

Sasha Finkelstein (1):
      dt-bindings: spmi: Add generic SPMI NVMEM

 .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 54 +++++++++++++++++++
 MAINTAINERS                                        |  2 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi               | 50 +++++++++++++++++
 drivers/nvmem/Kconfig                              | 13 +++++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/spmi-nvmem.c                         | 62 ++++++++++++++++++++++
 10 files changed, 285 insertions(+)
---
base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
change-id: 20250415-spmi-nvmem-e08635316175

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



