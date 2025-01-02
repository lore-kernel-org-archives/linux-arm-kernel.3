Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WG2B22fUHBx2YSsN829l13tsx/GglrayCauwrjLYF+M=; b=G01URI3q5i8haogSOOsUPq0Hep
	E9RzJLUjgtwVniCYYhyJzL0yuv1PgbRJ+SPLKouZyO8/2TrYWjJm1Ining/bgJtTQo3Tm/Q0cNiRc
	v1X/nULWz45lf/txGFRkw+KB9KLAsFXWVK67Lq6a2aQQ5huSxJ35cxhNYOJR+6HwrmfIIKmxZv2/n
	Bob4N9LbxQ3yO3+Tn3Kiwewsmp9J9V5J5o5H3s1mw5wyPOrBIkmFwW2vCbkeDiIhJqsTluTH2gpqd
	3PCFxzCfWiFjKXYr/bRqTDccvZkKLBmXM9FqQiS9U14L6ULHEHbGrjYULhSg5Zp3agGioM+Iiew9T
	N3AQV8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJDi-0000000AETb-0LJR;
	Thu, 02 Jan 2025 11:18:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJBN-0000000AE4c-2whD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:16:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5E7E5C55DB;
	Thu,  2 Jan 2025 11:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0C60C4CED0;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735816563;
	bh=BCKCRIacyWKgqo6gAegHeTB5UJABaGjYit2k0RzaGXo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ddPNGJMbDtFFvIaY6NZJ3R0J/5lMcrqSA61LFimqiZoeZvHLjEuNRz+b3xYIEcsn0
	 vagd3nvdPwSfrrtS3C7O9a9CDsISXUZrmF7Ntc2BtCCP7zPHIe9NXwCiLJRztYCqZi
	 9X5DyTLuvq/1M2uxn+mmY5kixeKu5SF6NRs5Q3YSIol4MtAPRwNAwsuN4QVhfEm9QX
	 GnZ3AOeJPsZK/qULq5M0knOIkcLZ5Qftg6dm35I3wLV/28lByXodTLl7NPc7R7M0JP
	 qN+r9B+Jh6rYQDwvGSmHzWhK61IUvlHTblHO5XF4oFPoCRmJuzqa/8VTecMYTtjl1o
	 /A/K3eeDjQrEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965F5E77188;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Subject: [PATCH v2 0/4] Google Pixel 6 (oriole): max77759 fuel gauge
 enablement and driver support
Date: Thu, 02 Jan 2025 12:15:02 +0100
Message-Id: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADZ1dmcC/4WNWwqDMBREtyL3uyl5ldR+dR9FJNEbvdAaSWqwi
 Htv6gb6M3AG5swGCSNhglu1QcRMicJUQJ4q6EY7DcioLwySSy1KMKfZkAQX7cuuxphL3fqBaS5
 RKmG1UwrKdI7oaT20j6bwSOkd4ud4yeLX/hFmwTirr7301jiPit+X7hmWbGk6O4Rm3/cvUWaGq
 bsAAAA=
X-Change-ID: 20241202-b4-gs101_max77759_fg-402e231a4b33
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735816515; l=1708;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=BCKCRIacyWKgqo6gAegHeTB5UJABaGjYit2k0RzaGXo=;
 b=nNwiaZEpXaE/xmq13KUaZhCVGXxQKaEr/PxDVQPiVg9kT2kvTD0OYSbdMx2Gh/O1M5enu4LZj
 vL6grHmE2QpAp6Z94gjM2/KM23we6cqO7iHL2goR6lHLpCb0jy0IE1L
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_031605_910213_1F50346E 
X-CRM114-Status: GOOD (  11.50  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Google Pixel 6 has a Maxim max77759 which provides a fuel gauge with
an interface with a lot in common with the Maxim max1720x.

Modify the Maxim max1720x driver to be compatible with the Maxim max77759 and
enable it for the gs101-oriole board.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
Changes in v2:
- Add fallback for voltage measurement (André Draszik)
- Add regmap for the max77759 (André Draszik)
- Add chip identification for the max77759 (André Draszik, Peter Griffin)
- Move RSense value to a devicetree property shunt-resistor-micro-ohms
  (Dimitri Fedrau, André Draszik)
- Use allOf:if to narrow binding per variant (Krzysztof Kozlowski)
- Remove binding example (Krzysztof Kozlowski)
- Change defconfig order to follow savedefconfig (Krzysztof Kozlowski)
- Fix style errors
- Link to v1: https://lore.kernel.org/r/20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be

---
Thomas Antoine (4):
      power: supply: add support for max77759 fuel gauge
      dt-bindings: power: supply: add max77759-fg flavor
      arm64: defconfig: enable Maxim max1720x driver
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 fuel gauge

 .../bindings/power/supply/maxim,max17201.yaml      |  56 ++++--
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  10 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/power/supply/max1720x_battery.c            | 189 ++++++++++++++++++---
 4 files changed, 218 insertions(+), 38 deletions(-)
---
base-commit: 12e0a4072e8edc49c99418a4303bd7b96916de95
change-id: 20241202-b4-gs101_max77759_fg-402e231a4b33

Best regards,
-- 
Thomas Antoine <t.antoine@uclouvain.be>



