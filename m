Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C69C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kb8yOWD2SiIrBRXQUwBCkGRdlFJUWL5tP/E1dNrLTJA=; b=BMbLyCGJLwXq/R1vQX/2YfDbN/
	jDCp/cc8CfuXNOYl+oAhDVjIkVJdqk42L7TV9y3xEuCr7kSrO8sfWG0Eg1sR6e7iPZe1Mh0jsUgWc
	785c+pMYAwsyL3f1wm35e8s5OMABaMBQHqSRIVKZ9oLZh59LscpGKcg2jWhdlU0UFtVsZpza99Idb
	IqmsQblrBOkXHaJgnHf18fV9ah9kW3Nu8hwWlwllJT9u7B4ntNT0NlhuK8iVr6Ea+9upfO7kGba69
	7Cf3eKGqX191+u+mgqq69HgZBAdN/pK6Vxw7RryU5bglBWkdyzzgFR4BhbNq6CD9+jaS/6nWGWJqU
	Um9VBUHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLq2-0000000CpEn-2H1Q;
	Tue, 20 May 2025 12:12:54 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLlq-0000000CoPW-3t6f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747742914; x=1779278914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kb8yOWD2SiIrBRXQUwBCkGRdlFJUWL5tP/E1dNrLTJA=;
  b=i5WBw+2s1VB3WDBaM3a4U8c+bxSZGPoqp/9iLDFEPcKEnOdBsgk3udJ7
   +MhuFRosa1MgWsDQNbB0yns9hYcIQyoAOYtKv515UxjqgM9AlvjL6wEvw
   m2c8L8+hR1cgcKF4I2yYgqxOFeWMr/2AfTxj6h//3g/LZ5VgKOSDccR/a
   qA/mENhwASAn11SngLLKeLdpNCCNAzDelKt94DdiTEI3PrlW3dsBBR2q/
   r2btv8+S/DsO8duNNDc6uv2JzhjQsM69oaYiX+RhI/wkfQGhnQ2sqaTU1
   QEe58W8lw7a4kLhMJuO4FDaQThL9ONJq6wyoDnDlMIbSEzdRGSeaIA8cB
   g==;
X-CSE-ConnectionGUID: U7BqYBSxTNaZOtyCw+nueg==
X-CSE-MsgGUID: rF3hdTvdS8+rZlHUcoWiyA==
X-IronPort-AV: E=Sophos;i="6.15,302,1739833200"; 
   d="scan'208";a="44182565"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 May 2025 14:08:33 +0200
X-CheckPoint: {682C70C1-5-BF62DDF1-CB8BF55F}
X-MAIL-CPID: B419E8CFE1EF68CF796833D42FEF4458_1
X-Control-Analysis: str=0001.0A00639F.682C70C8.002F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C489163BBB;
	Tue, 20 May 2025 14:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747742908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kb8yOWD2SiIrBRXQUwBCkGRdlFJUWL5tP/E1dNrLTJA=;
	b=PkyWP9o2yye8o5cWieV9x3S5hzYTFj4HFX6nCyqYJSmwrbwCzgDP0GpBFoz4JtrIkvSUbt
	YE8MguMpFcZcWacZ1ReYxuhFyIl3CZXVUBlUGTs5bXZZjdyp8363Aq++AA3VwDIi6MAj9n
	eT4RAUanWq7W2MTzjF9R+OF+KUYOhL0O9/DLj2DbIqYctS8kG2H6v6B5fkiLEllhBR8s1S
	T/3uufqmJd+irx+aKM7wUUZkW6ra8/SK8mhPQdTvIGBa9crhfQQr/3+ukvvRmzB4ooZ0X4
	EgWFIDm5Xjq6L7bjW2BZuMcCfaAxlt23LuaPXRYnTm0d4spafhU2nr4hViNfgQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: tqma8mpql: Add EASRC support
Date: Tue, 20 May 2025 14:08:19 +0200
Message-ID: <20250520120820.890252-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
References: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_050835_259532_96C94493 
X-CRM114-Status: UNSURE (   9.45  )
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

Enable EASRC support in tlv320aic32x4 sound card.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Note that the firmware file /lib/firmware/imx/easrc/easrc-imx8mn.bin
is needed.

Changes in v2:
* New in v2

 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 1 +
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi         | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 23c612e80dd38..33cd92e63c5d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -235,6 +235,7 @@ linux,cma {
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
 		model = "tqm-tlv320aic32";
+		audio-asrc = <&easrc>;
 		audio-cpu = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 6067ca3be814e..fd70b686e7efc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -30,6 +30,10 @@ &A53_0 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&easrc {
+	status = "okay";
+};
+
 &flexspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi0>;
-- 
2.43.0


