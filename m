Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6366DE74AD8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 21:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C80OiWUCxVd2LPmeLB5fAKeunovi5aF9+8HKK8RIUBM=; b=ZEBrKjv7K8mX6qNIkgn7MFXMaw
	ZFWTTQbrJmxVDdS85D9AvGelgkmvIUnqc1YtAmSOX1XTU1t+grc0V9TnQg4aU/p2Ybhdz44X41Nyn
	ikc+VQTl2k4bP4YwG1N55Z+k6QdiX6Eo/It+QkTHGoP68gQ0yk6Va57Oh0aBOODlHS/sbpQFCgDR5
	2QJ/xoiqFxcUvGlnb59a50+8NYbeBjEYqxZAZSbctN/G1WLp67dwsAo8SDVkU6HatLIET97Qq1OFK
	LZX1LydvGwvklGEN6Zw8atmnFxDCrl5RVRkyLXm3qxXWM0deIx+reDJ6ZbODHVINIc/yieGSHdJPk
	HVjIV5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaIQ-0000000AlrH-0s0Y;
	Tue, 03 Dec 2024 21:19:02 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIaFU-0000000AlR0-1tDq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 21:16:01 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2tjd5jWzz4wBd;
	Tue, 03 Dec 2024 21:15:49 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2tjV3S4Jz2x9D;
	Tue,  3 Dec 2024 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733260544;
	bh=czCvK2U+vJS4fE5syOg2GAFijCOBMLREdLTGdyULWSE=;
	h=From:To:Cc:Subject:Date:From;
	b=gVt6NKKZmVYhwa5qW5pMxeKgC6wcZUy4KNIOSfOZeB3/bMdmmLg0ELGvfSnALollB
	 ZbChtEy+KCYPhUYB76+hI1dNb/x86bY4F3yDdttd9AnIEWv4n2k64ETJ3yKZA2y6GG
	 y9/8LrwKJgXXhMOzw6bMbrZVMgB0oO/e9UARld/KFSdxRCMZTS0/XzTmOUeKy21ZjV
	 QVvBZw+k7X0XjCVaVu/emOmiO31hItiaeYTiXOQ7a3V2/QFnvzMRhJNz8xvd+h1YNk
	 EvhUMV7iaOIpj2ZIVL1y3RkDN9hBc/8Vezel7bknglA3rBbhiNeQ0HzA16PTzpPMeO
	 pa3sNVD6L1TUQ==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add pmu and syscon-reboot support to Exynos990
Date: Tue,  3 Dec 2024 22:13:42 +0100
Message-ID: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_131600_519871_EBA4BCC0 
X-CRM114-Status: GOOD (  12.40  )
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

Hi all,

This small series adds support for the pmu, as well as syscon-reboot support to
the Exynos990 SoC. It has been tested with the reboot command in an initramfs.

Typically, this would be added during the initial SoC bringup, however I was
unsure as to if the syscon would work correctly until I could test it
(especially when it comes to reboot), which I just got around to doing.

Kind regards,

Igor

Igor Belwon (2):
  dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
  arm64: dts: exynos990: Add pmu and syscon-reboot nodes

 .../bindings/soc/samsung/exynos-pmu.yaml           |  1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

-- 
2.45.2


