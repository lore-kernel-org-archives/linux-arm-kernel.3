Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5DAC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTVKYFoj1jaoNBJBsD0WujEyvI4IfuhmvFWnnCOeCTc=; b=zH0ebA7n9iwk3JpL2FTM2Hwg4S
	1a2YW1k0KsVgfIAogeU5zgCyKaA/JP5ODZvqUyfbGUL7ZAtfR0DbAEOWhp99SBPEWnl4NRtC47WqL
	OVQnfg8RXcwKrJtet53KeWIQGavzux2en4rjKXXMIB3urmRwLW2gqXnYxr6kA3KTi+Or7CoBjSe3u
	6/hsWXKhE/mflcnuMIC/HR7ajK3Ym4jzcgNaO3okh+TNoUVRoMm3pt+9o1YvrRtkzWJeEIG+WRDfE
	IrxUBsQxfoCy3pG0WEvglozGFqAZCDSoL5auwGyhqtAZy+mnjKtqi83nEtV7IOli/8DBAEp3y63vp
	UYmcdwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54bZ-0000000A3dc-3BQg;
	Wed, 16 Apr 2025 15:23:13 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53kH-00000009tOe-1XJ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:28:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DD5BC9757;
	Wed, 16 Apr 2025 16:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1744813688; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VTVKYFoj1jaoNBJBsD0WujEyvI4IfuhmvFWnnCOeCTc=;
	b=eBPNbebM8LiTuWnpVtxwPDJRYk42p+WSiauqDuj5Y+Eif0imNfb+yaCX/5KjrtAxvHr5AY
	zk+qQLX7726CBHMNzF4NvQkWjnWW1v1wO/w8VwZKlXhtSn8bYPq4RLt9jrWsFtFvg4ebNE
	JcB2Wcxy+mul3bMUfyaVQfFH11axnp5Q4A/YtXgHcZrmHIxkVnbzQpl7azmHjlUFOxOked
	zV7hOaNTMKmscW2RBgnDSiTUTXAvFp9d0UEo17yzYiaDgJ8FKP4mYSAqO2koJbQ+bbBjGI
	XUpWXWsHJfZnCIOhD9nhfMnRuSW2doQuBn60slbdhb1gsZ2RD8PLXKQ1ZSMWmw==
From: Frieder Schrempf <frieder@fris.de>
To: Peng Fan <peng.fan@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Carlos Song <carlos.song@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: [RFC PATCH 4/5] arm64: dts: imx93: Add node for OCOTP S400 NVMEM driver
Date: Wed, 16 Apr 2025 16:26:23 +0200
Message-ID: <20250416142715.1042363-5-frieder@fris.de>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_072809_555279_F42037B5 
X-CRM114-Status: UNSURE (   7.57  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This adds a node for the OCOTP NVMEM driver that uses the
ELE S400 API to access the fuse registers.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 122519648d1b..12463cf6c214 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -228,6 +228,11 @@ hsm0: secure-enclave {
 		mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
 	};
 
+	ocotp-s400 {
+		compatible = "fsl,imx93-ocotp-s400";
+		secure-enclave = <&hsm0>;
+	};
+
 	mqs1: mqs1 {
 		compatible = "fsl,imx93-mqs";
 		gpr = <&aonmix_ns_gpr>;
-- 
2.49.0


