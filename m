Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A179F53D86
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 18:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XcHnrBrC1ELZCGZ7fK61wgsO+Q7d4H4ioPbGY2ZDaEI=; b=GiJ1UFgDdB3xOT
	qDdh8S+bAABTQwudsjfYy6jqCK7zg5j6nB+kdXnGjIdi9eZEgWlRI0eEL9LKjIRpt6GLZNXzBNZqL
	dKKLCAyK+LrmdINnxn+SKIz/LpRORqrFxDJNPCM1efAcF2GIneqhOAq7e107n68N31hsEnwaiZ5nr
	GuV7fN63flLCjTTOlUesZqzLt0ptgrVBE4ujgNpcUHEYdmgGFddDr2Fcf7/QoeqwJz2hyUNFxamd7
	Y9OR4aP48Xy1sUW78/JJzZtAemtsQ/gOMxdnW6Mn29RrM61V01ZE9o3b3zpPyyY5LGuUgJ2CZAAFk
	0PnpjMMWkuPlPLeVf5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Cb7-00000004fup-32gg;
	Mon, 16 Mar 2026 18:23:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Cax-00000004fqD-32pP;
	Mon, 16 Mar 2026 18:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773685391;
	bh=4vzW5cO1monjXx7rKE1CqJpQtcAhGeYb0mKqTMLQsVs=;
	h=From:Subject:Date:To:Cc:From;
	b=hLsOclL9Kotj2+9tsAvSHPsDYbYMfwRAatpSkkdtTKJsRyTifgVPR4AtI/kYPmYc1
	 4w+0HUed8M7dUi3yNrc5dneOF94ML3pKlv3cYCHp06sNIKPCCMBcJTZIyhoA4q0Cor
	 wtSd9Yd46ogPsdmwA8vXt64Z1R8yHJit009j3t/kVrEjEVMCiJWEIohxqqraT4eZPB
	 2DpA5Ga+2wgHI6/TF00pounWMG0nxV8/EjG3W4XvmAeoqHeeaxUXJkadbiIc87bSot
	 vVK24WvXxtBHJamr7ibLbZnPLQUp18W3yLR7mRuFdlk587A3JhOKaEqWVkDAdq/T4d
	 +lVvfxjtRezww==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DAF417E12FE;
	Mon, 16 Mar 2026 19:23:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1052548002A; Mon, 16 Mar 2026 19:23:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/2] Add SPDIF support to RK3576
Date: Mon, 16 Mar 2026 19:22:59 +0100
Message-Id: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINKuGkC/x3MTQqAIBBA4avIrBP8QYWuEi0yxxoCE4UIxLsnL
 b/Few0qFsIKM2tQ8KFKdxqQE4P93NKBnMIwKKGs0NLycmnjLK85UOROSBeVRx+NhZHkgpHef7e
 svX9tXJT8XgAAAA==
X-Change-ID: 20260316-rk3576-spdif-7017f2bebf56
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=793;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4vzW5cO1monjXx7rKE1CqJpQtcAhGeYb0mKqTMLQsVs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4So4kdnYef2v0s5Tu+G5da5SevoXpWwgJD
 nIK2VzpVpa84okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuEqOAAoJENju1/PI
 O/qa8sAP/3hnTRRSnb8Rr7H6KFJxz5XrSNAmsdgmlqmrn3FXgQYEln3nnSLeA0LsX1gEcjey/PC
 5lCgLIudcwfMmH76FzVgPe8kvSX1zzMZTVx5O8+5oyStX3XTlztEkG2vul2iPqSvoI7h5xsK0iI
 s9z3El4l2VSGH7cFH47Vv3eY462DpYYMHLjom1kGFO1ablTsKpupIid+5nI3bPf8jQAS9hXhhic
 F7N1PpQj4/XRoyz773/k4VV1T9LqVZE4Q2d4npleXe5s2rnR4kE7I3xbAK2QOvbIPd+qXrkKMCW
 l0jU1yP32jp1DiZvSXjG8N42yVBhP5TSXzjdaAxuUCPhTNBvlT8gR5Mtce53bNW1zRNbu57zwIA
 S1qRvnsoujkbwGd0zeImOFYkRzschlvEJBlqzr6L3gc6udxb58zx/z6HBOqW6sIoIR0i9uVxWGd
 NSaJ7O6GnLnuGawZNYT5LZnbdkplsGTzNLZ+4fUcu+4ggSs4qibe3m+9D5bBt4YfZdrRbpNjra/
 z08MqWGvxQSkTXds0/9IaW/dxF+/ysV6lWSMvU6C0ADTtJNKV85DDwwKqXZY8PvCvN+aC6c5maw
 B0xftWteLe+smr7rGOj0tIWo5LORCqTDBRwhzJf4Sfa3I/wAjhkaX4qlPwtK2M+S8L4yQQqrxFZ
 w5snIHz8dcGYpfFCwmPc3zA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_112315_915196_8B051340 
X-CRM114-Status: UNSURE (   8.32  )
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

Add SPDIF support on RK3576 in preparation for Displayport audio
support. My expectation is that Mark picks up the DT binding via
his audio tree and Heiko picks up the DTS via the Rockchip tree.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (2):
      dt-bindings: ASoC: rockchip: Add compatible for RK3576 SPDIF
      arm64: dts: rockchip: Add SPDIF nodes to RK3576 device tree

 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 82 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)
---
base-commit: 74b04802e23d970099c522b711b0d94e9a29dd74
change-id: 20260316-rk3576-spdif-7017f2bebf56

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


