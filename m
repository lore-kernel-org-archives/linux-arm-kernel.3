Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A783C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pDLQdHX5gTGLk/qcwUj+BnQvTh2X825nYYdv1sm68gE=; b=1yXg9ODnY6157j
	JbQcZTqdjUEaJnLmMXZ9DOu10Xb/6heTbQOPM+bVM1oHEljGdVf4z9tUpL/2GEdgSK+GeWILcvmkM
	L1BTXeqmNMLnMFL8KD6uKwBtMquzvRlUn650As2kBBvJnpRy2m7NSg1jA+ilZuDthIhwu8k8eE3C+
	AplnyemCfiKmJSDPbYF4hSjjFJtCwCvbccEG7Ne0Ji7uUV50sIjg6slCtJoGsee8IwXwUYt5YCK+1
	LT58OSkRSqyRxlth9KgxHvf3REDN9zZclIaKO2celKwZbhk4RGUC7gyh6Du/BUMC2Z/DW5B9eSAC0
	qdDJxHLmmUOJQ40ZSh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI1v-00000009737-25ln;
	Sun, 05 Jul 2026 08:16:47 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI1s-000000096zr-002w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:16:46 +0000
Received: by chaosmail.tech (Postfix) id 9EDFC1CC21F;
	Sun, 05 Jul 2026 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783239398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pDLQdHX5gTGLk/qcwUj+BnQvTh2X825nYYdv1sm68gE=;
	b=KQIf+CAZQgI6mEIjvqCmqeZF5EZhfYn7NN+F/meU5c8aKwoehil0dFMYAhcFy4NOb+IKh9
	6Sgt4AfMXK33gzOU+QiHhrZwrd5OS6CgyDJUnkVwxe2g0JZhJIHRV4nqfIXZl63fglHPWA
	+MTI9agFqYOGw88gsbDzPkHTQKwH+DE=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/3] soc: apple: Add "PMGR misc" power controls driver
Date: Sun, 05 Jul 2026 10:16:29 +0200
Message-Id: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OzQ6CMBAGX4X0bE1bKERPvofx0C4LrJGftNhoC
 O9uixcSPX7JzOwuzKMj9OycLcxhIE/jEEd+yBh0ZmiRUx03U0KVohKKT33reE8euEEJttYWFFQ
 s8pPDhl5b63r7bv+0d4Q5BRLRkZ9H996OBZm4f90gueBFIyptcnPSIC/xk9H3hh7HGaFjKR7UX
 s/3ukq6VaU1UoA2xY++rusHe0iBjPgAAAA=
X-Change-ID: 20260702-pmgr-misc-ae1cbd5bc2c7
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239397; l=1926;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=e9CoEDwG1cbuQpb5x6xSuH1axeei/ZWdFetHF10wjzw=;
 b=jKItj/3tDyZFn57sHoVKW4ElnRhTcuHnatqYe3oFAnkxL9uFJo8h5ghENN7SPn+8kJ4Fzhxge
 dEssGlepPjQBonZ1R45SUGLF0O4PxztxG8ey+LAXNxAX2XlUb3CEqMI
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011644_497089_A650EFA3 
X-CRM114-Status: GOOD (  10.59  )
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

Certain Apple SoCs have additional power state controls that are using
a separate "misc" mmio interface. Currently this includes the fabric
and memory controllers on pro/max/ultra SoCs.

This series adds a driver to put those in a low power state when the
machine enters sleep. The power savings are SoC-dependent and are
around 1W.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v3:
- Remove ability to probe only one control, it is not used anyway
- Allow building as module
- Style fixes
- Link to v2: https://patch.msgid.link/20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech

Changes in v2:
- Error handling fixes
- Reword binding description
- Link to v1: https://patch.msgid.link/20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech

---
Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Sasha Finkelstein (2):
      dt-bindings: soc: apple: Add Apple PMGR misc controls
      arm64: dts: apple: Add pmgr-misc nodes to t60xx

 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |  45 +++++++++++++++++++++++++++
 MAINTAINERS                                                            |   1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi                              |   7 +++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi                              |   7 +++++
 drivers/soc/apple/Kconfig                                              |  10 ++++++
 drivers/soc/apple/Makefile                                             |   2 ++
 drivers/soc/apple/apple-pmgr-misc.c                                    | 181 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 253 insertions(+)
---
base-commit: e5d9690657844a2645a518cdf838206f6daf513e
change-id: 20260702-pmgr-misc-ae1cbd5bc2c7

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


