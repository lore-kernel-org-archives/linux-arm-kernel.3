Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D89CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MjDSRuDxF5M8i/Z4WTy3XyIxSZDnuD98a0Lv22W7n10=; b=Lb/LFNqO8UzWIT
	KDRAWrIsyoBP4Z3yTkNjr6qTqHR4N/3yObu1IYjdkdFe+mCrMOdEjOLtQzBRfdH80h+yekyGRJDCo
	kzPspwh9sDZyJpUm8EID7cv1ELTRJ02MI+Er1LoA5YrR76nzy2F/on17p83NtOy4+z56p5RVDcjLs
	we3BafssFSf+NQo7x6AQu1MszT6PK+Lvvii1H31Jk7a9vFnjXqPP+zVRvNkxA3oc38TQsmmqr2K/r
	NTj0UW4k8AShcKqkTrtkB8GqLwPVfazd+DUqzUG9OgjjPEYaJUsFqNmBPtLCnBEWRM1KoWPX+1ugg
	1fQ4WizS/fTKf48/eftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvgj-0000000BxEO-2RCs;
	Tue, 12 Aug 2025 20:33:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ultgh-0000000BhsG-07Q9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 18:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C562DA578C9;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D7F2C4CEF1;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755023129;
	bh=k8kF1P6bFlbBEzuzYgvwP5CIW+2qmHksP+KG9Qod3gY=;
	h=From:Subject:Date:To:Cc:From;
	b=Q3bqcmVtxiJ2Jh0zGcNiIt0UfDFVERoCU0runnhyf8hYaqfFyz3y4Tn4qPi4DSl9z
	 yUf6/AuKNMNkO8GBhCQQ/zxwOBnoeIfiViVf8MKDgy9fP+H98HsLKr12rgz1TwNP2n
	 wTzPPcAppZof8iscirsmhcWujjkwbBlnBW1Pvor/F5lhETAErzhSKY80tGbTmktdFJ
	 /8P/2sIitQyf8IJLL4x/ajbD/0LoKxM077jFmKiqpeLjHs38haDtuOFieTu6Gy/Pf5
	 YyDexnO6K5i5DDXF8m/joYBnFCw5KrOp+vVyw0hxxYE2UF+hM0tZlsjebu827LM2Fk
	 7UjQFn1XY+Aog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B73CCA0EDC;
	Tue, 12 Aug 2025 18:25:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/3] Apple Silicon SMC RTC driver
Date: Tue, 12 Aug 2025 18:25:14 +0000
Message-Id: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAqHm2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Mj3fLMAt3i3GTdopJk3VQLU7MkszQjEzMDYyWgjoKi1LTMCrBp0bG
 1tQAIJoOQXQAAAA==
X-Change-ID: 20250812-wip-smc-rtc-e856b6f24603
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Sven Peter <sven@kernel.org>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1886; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=k8kF1P6bFlbBEzuzYgvwP5CIW+2qmHksP+KG9Qod3gY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8bsdiH55MV3rVh+O/X9Tp18KtNRpYD9+sY/Nev/1+ucv
 r3ujdaDjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEAhsY/gee63BWXp5xaoNo
 Xvyps0Y7Izbf/umg7WMtE6pfWR+wLIXhv6cc2zRmsX8cyV9vfNiwjH2Sw2bp8+cctLj9sm96scn
 VMwMA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_112531_205929_37F68C88 
X-CRM114-Status: GOOD (  13.16  )
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

Hi,

Now that the core mfd device has been upstream I've prepared one of the
child drivers that is still missing: RTC support.
This driver is required to read and set the hardware clock and requires
a reference to an additional NVMEM cell to store the offset and thus
requires a device tree node.

The series applies cleanly to 6.17-rc1 but is based on a tree with three
additional commits to add the SMC nodes to the DTS which didn't make it
into 6.17. You can just ignore that and pretend this is based on
6.17-rc1 since I'll take the dts update through my tree anyway.

Next to this SMC child driver we're still working on an input/misc HID
driver for the powerbutton, a hwmon driver for the various sensors and a
power-supply driver to manage the batteries.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Hector Martin (1):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs

Sven Peter (2):
      dt-bindings: rtc: Add Apple SMC RTC
      arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node

 .../devicetree/bindings/mfd/apple,smc.yaml         |   9 ++
 .../devicetree/bindings/rtc/apple,smc-rtc.yaml     |  35 +++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   6 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
 drivers/mfd/macsmc.c                               |   1 +
 drivers/rtc/Kconfig                                |  11 ++
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-macsmc.c                           | 141 +++++++++++++++++++++
 10 files changed, 218 insertions(+)
---
base-commit: 772c260c9c7f916c9a2508839df4f03fc19f3773
change-id: 20250812-wip-smc-rtc-e856b6f24603

Best regards,
-- 
Sven Peter <sven@kernel.org>



