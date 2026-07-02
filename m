Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9043CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SQNpC2MoYnLQAl/v3dxVQexz4TEZdGqYDZch7PZVNZg=; b=KUYdJyuQo1GIW3
	4bS9c+tbX/XeUfj2OJfd3VFZ9B03sbkypU37WZPPcjosch6Yu4MSwK6w+NlphbbQ/+VHtGFnIVC7G
	KicSTZitY8tMusbPLaLR1fgTjk+FV18vcxhJTUo4MPRZe1SRM4DbQiZzGOBb8e1f1v6nH2uqZxUNv
	11bz2Ce9fEqMmwlXzp0n/nqRa3h1KoCEL4IiSxtmJgrMN7YWPkeSTUv92ulreC3kiEVortrUPr1rP
	gWNxiW9T0JSuFVLhQxyKpg/BMtFmLCyfs1m874P/eUqdgycfb38bkeMIlGw8G3ade8sqQEv8gAjqf
	FZViqZo1Y8kJUy0NyZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGBx-00000004PSN-3RCm;
	Thu, 02 Jul 2026 12:06:53 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGBv-00000004PQi-2VeW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:06:53 +0000
Received: by chaosmail.tech (Postfix) id 347FD1C888A;
	Thu, 02 Jul 2026 12:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782994005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SQNpC2MoYnLQAl/v3dxVQexz4TEZdGqYDZch7PZVNZg=;
	b=PvRN39e2OtdyoOiqOOVP2E/XParelVBDKN6Tf444vbUXewXfCOBlZnpohD/6T1W3NOmIe5
	dJjT9qJqYMm5oDZmrOLvAh9YMZkHL3re6DIqUkSHUu9VMy1g2An0m+js2RnSAjbydVV8xM
	T33OvLIxpDx1AYgRkKBZGHH3NJdd/ac=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/3] soc: apple: Add "PMGR misc" power controls driver
Date: Thu, 02 Jul 2026 14:06:25 +0200
Message-Id: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBSA4VfRubbaViivIhd2HBxltIPU8u6Gy
 6/+/ghCgUmgziIEOll49QkmzwCnzo+kuE8Gq22pK23VtoxBLSyoOjLo+sKhxQpSvwUa+PpeTft
 bDjcT7u8A7vsBoLwa2m0AAAA=
X-Change-ID: 20260702-pmgr-misc-ae1cbd5bc2c7
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Hector Martin <marcan@marcan.st>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782994005; l=1550;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=jUlZSi3Y3F/0QuIxjuAl+t+pHRC3h/ygSTf4tVgbRFg=;
 b=24ErvKIbhJOk782EuxDOBxCg4INtj7JZ+kfwYzPQK38zAqwbYHrJ+KabRgYh7yB2Mirj5Qif0
 Z2vR12trINkDRcS8Vcb7pzaWD7AtPvbEmZ9fFceWRCi171ACZ57jl1N
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_050652_109373_325C9EA0 
X-CRM114-Status: UNSURE (   9.41  )
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

Certain Apple SoCs have additional power state controls that are using
a separate "misc" mmio interface. Currently this includes the fabric
and memory controllers on pro/max/ultra SoCs.

This series adds a driver to put those in a low power state when the
machine enters sleep. The power savings are SoC-dependent and are
around 1W.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Hector Martin (1):
      soc: apple: Add driver for Apple PMGR misc controls

Sasha Finkelstein (2):
      dt-bindings: soc: apple: Add bindings for apple PMGR misc controls
      arm64: dts: apple: Add pmgr-misc nodes to t60xx

 Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |  45 +++++++++++++++++++++++++++
 MAINTAINERS                                                            |   1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi                              |   7 +++++
 arch/arm64/boot/dts/apple/t602x-die0.dtsi                              |   7 +++++
 drivers/soc/apple/Kconfig                                              |  10 ++++++
 drivers/soc/apple/Makefile                                             |   2 ++
 drivers/soc/apple/apple-pmgr-misc.c                                    | 177 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 249 insertions(+)
---
base-commit: 59574e5978abfc2ce1c194ea0200eb6fc718d8ce
change-id: 20260702-pmgr-misc-ae1cbd5bc2c7

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


