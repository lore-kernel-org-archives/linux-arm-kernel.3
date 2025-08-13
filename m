Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EFBCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vFpW03a4eVLiZwREydDRG6lmxbp6vzTQiDaBpr4zbLI=; b=lBLRvCh+Y0ACVvHOfvDI3Ss48s
	vDUORLPkvgc+lkZGd1jw9EHuFC8JqRlruBrwkfZQpa+P2xklpGzkqj1pRMrCdjsW0JxaTrspoiDX+
	D8ohoMZwMGDc9oDP6WoDX6NmkrhrXG6efNnG7NpXatJH4a7xlLCnkbouNJ2hhoEWu52CDP3i7C09B
	GYy88CxyB/4GpvxO0Qkvdr6yuDt6hv079lUYCQXgiuvqpZYlZT4or3m3GqegM9M/XpM4b+Vsul6md
	r4WocrrNTnTG0oKuEF2GzhB1Utb8u/w2rl0w3nFtXJaamq+G7MtcfcQXo6rC4SFvxIEb0qSYC9bkx
	N1DLHglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8Jm-0000000DJQy-1j2o;
	Wed, 13 Aug 2025 10:02:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8BA-0000000DHov-2t9n
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 09:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=vFpW03a4eVLiZwREydDRG6lmxbp6vzTQiDaBpr4zbLI=; b=nWipH8/4vB+V8DJiPw+kKT59rV
	arTFWLJTodorsqWuj6HgEMtvqqRcW/IUco3hasUfYrz7YIHH1xoSt+D3lUfkiH0k7hOAtZ6TTGDEV
	WP4ulEmQ0uon3MK0YgRTrhWEF2zhF80lpoFnOZxutjk8hLYQXkt//ZRAYWMQc8yf+DHgSRGVMAc4I
	q75Bg04P0cZLZ7r4u8PFKvFPklZY5bsMneh5a04NAA6wiygSEtrc2I3q+0fxsqNJp0OJ/jFYLVuoC
	dBEp88QgNd740ZR5S90TevHe0OElGlAytD4DBZwxfk1M/Ni+NBYMBL78UGSUl12gPXy0UGbkOLfTW
	eLZVS0Pw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um8B7-0000000G3JN-2Qxl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 09:53:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8153EA57A42;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 254C5C4CEF5;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078830;
	bh=eiXrLuhR4xCamhoxoYxrnKpTHf3dzkLdi7yUfznol88=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mVQc14DkJP1EaNM/NFLB+N4og7C2CwBzEN3QEZ22tuDnLg0NHojdZKfJjweWfSqsQ
	 izGRTx2CjUzF6xoaIyEWrLLly6/BGe1ms4mXF8wJLHQyFlnQpIffkTDU2uLlEkXUfb
	 /UswVtkiFrfoyuAu9f3xsq4MyzflHzP5n88JZu50ZRXSBa+2lEl03hBzqGxjY3lG7S
	 oR7I91D2xCWnRjXQuhtXZHqiWgQ4gVhStVKZNVqnOAJtHv6utT/rQ9CjFxVfYmg6xZ
	 8klurv5xze/wYBSr3OV2o0ueGPJsjSeqprI+HCitXTiZh6nQbaIX8u7smvfCVm8Z+a
	 CoJVynjcWm4oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A319CA0EE3;
	Wed, 13 Aug 2025 09:53:50 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH 0/5] Apple device tree sync from downstream kernel
Date: Wed, 13 Aug 2025 11:53:32 +0200
Message-Id: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJxgnGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Nj3cSCgpxU3ZQS3eLKvGRdM11Dc90Uw7Rkw2QLyzTz5EQloMaCotS
 0zAqwodGxtbUAsOexiGQAAAA=
X-Change-ID: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Hector Martin <marcan@marcan.st>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2447; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=eiXrLuhR4xCamhoxoYxrnKpTHf3dzkLdi7yUfznol88=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhow5CWsePjDbkaGoumtOfrJAVFj2+dDzsUq7k1yFmWomB
 rzTN23sKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJGtlgz/M1h7Y6/v4L+x4oP/
 RI4ntz55uvg3i6pPmO72bOd1h52eTgz/VJgv6D9JzLx50DnkkeJZ9vf8Vu/jO3dbafPaf9vWvuE
 GLwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_105353_998132_0BE73E4C 
X-CRM114-Status: GOOD (  11.95  )
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

This series pulls changes from the downstream device trees which are
supported in upstream kernel.
Most importantly it fixes the PCIe description for a specific iMac model
(iMac M1, 2 USB-C ports, 2021). This is worked around in the downstream
kernel by not disabling the port. In preparation for submitting M2
Pro/Max/Ultra devices trees I investigated the issue on the similarly
affected M2 Pro Mac mini and fixed it this way.
It completes the Wlan/BT device nodes for t600x based devices and adds
the missing 15-inch Macbook Air (M2, 2023).

Checkpatch emits following warnings:

WARNING: DT compatible string vendor "pci14e4" appears un-documented --
check ./Documentation/devicetree/bindings/vendor-prefixes.yaml

Which I chose to ignore. `vendor-prefixes.yaml` prefixes contains no
other mapping for PCI vendor code and the list of ignored prefixes
forbids extending it. Both options feel wrong though. "pci${vendor}" is
clearly a vendor prefix but duplicating the PCI vendor data base feels
wrong. `vendor-prefixes.yaml` currently does not contain and PCI vendor
aliases.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Hector Martin (2):
      arm64: dts: apple: t600x: Comple WiFi properties
      arm64: dts: apple: t600x: Add bluetooth device nodes

Janne Grunau (3):
      arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
      dt-bindings: arm: apple: Add t8112 j415 compatible
      arm64: dts: apple: Add devicetreee for t8112-j415

 Documentation/devicetree/bindings/arm/apple.yaml |  2 +
 arch/arm64/boot/dts/apple/Makefile               |  1 +
 arch/arm64/boot/dts/apple/t6000-j314s.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6000-j316s.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6001-j314c.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6001-j316c.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6001-j375c.dts        |  8 +++
 arch/arm64/boot/dts/apple/t6002-j375d.dts        |  8 +++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi   | 10 +++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi        | 10 +++
 arch/arm64/boot/dts/apple/t8103-j457.dts         | 12 +++-
 arch/arm64/boot/dts/apple/t8112-j415.dts         | 80 ++++++++++++++++++++++++
 12 files changed, 161 insertions(+), 2 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca

Best regards,
-- 
Janne Grunau <j@jannau.net>



