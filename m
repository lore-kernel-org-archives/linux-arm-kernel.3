Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0E9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WPlvrF7bTDr6Uv4dt2INKqCTAaWqXTlyvruekoPxeI=; b=zQuKnCH9shZY2Y0Nq+PvuiOO8Z
	heL2Ht2BjG0i6JXi37BhaYMt2XGbPNSB1HI84kMsm2ZWy1EV3isQY/uHWxIhj9Q/FhPg14/375Uo2
	s3WYn87VTHygp9IAivq7N51qNuF/+tnBsg1FRP5lIr79PcnRXv9c3Aw34U8Ypth3PS+MrHKRJAopv
	Yv6FqjyoUm17RDw4yEsTG9LxbmPgKUP3httDR5jCAH5VJKBSd+npZEFjFbGH1jQY75Ns+X6gnoBZH
	a+HyvDiCj7ylTS7HM4hCGdZ5a07QwYaHQDYSiIamnob0f2mmPlaImTd4zHp6lA1IApROlYSAWQT6q
	JaKJ236A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmspX-0000000GyNj-45HS;
	Tue, 25 Feb 2025 11:10:27 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsAR-0000000GpCY-3fBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740479279; x=1772015279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7WPlvrF7bTDr6Uv4dt2INKqCTAaWqXTlyvruekoPxeI=;
  b=F9GwsIEt9VPMI15OAmZ8W2vLhThpVAeIKSWIgKZHuevv00FZPompu0qU
   MMPutGsTR6zKjJvZTHaDysz/iClO8PIHnf1w5f8QlhdfcWzqjCpnAscGE
   srQt2tIEI84tl530yjlJbAjHDc86ElfqUgKzq1WnV0H23AtWpqLvLHm2l
   5l4PiPgjhIjV2UXNq7NKvTJgK3BR7nvVo7GbT5bMyWQcuXUceSuRJTyok
   PbRg211c8fSQbi9E4Qv4aFuQ0v0HzTQ1xsOOHSLyioRUBbrY88vlGjfDk
   YZz4ydzBvLvOCVmHIUTqMIGytekxNpsH4qeNrjcOq9EKSmtY1TiuG3ofz
   g==;
X-CSE-ConnectionGUID: /UBrKjp4R1GZK4S6Y90w9w==
X-CSE-MsgGUID: z0wGLHc1SY2iC7hblTXfkQ==
X-IronPort-AV: E=Sophos;i="6.13,314,1732575600"; 
   d="scan'208";a="42067837"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Feb 2025 11:27:58 +0100
X-CheckPoint: {67BD9B2E-3D-28232521-C0C2250B}
X-MAIL-CPID: 4232913E294A967EECF1F9D2E5748447_4
X-Control-Analysis: str=0001.0A00211E.67BD9B2E.0027,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C57B61686C1;
	Tue, 25 Feb 2025 11:27:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740479274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7WPlvrF7bTDr6Uv4dt2INKqCTAaWqXTlyvruekoPxeI=;
	b=Jm6bf+RGwm8llVKo1gknWYQP2i23wSfG1Pk5HFTeRlMw4zzEN7WKb8Sd20LeDWfcziafjc
	18XZvRlsnLVvl8xtWp0M3XTxCONAC3/nge78ja/5GX/GQzCd/xeAxYm6/YShi5BZ5TCiYl
	jkX6ZFkmrp7PJIwI7DCSBSN67dDeKRVQjxsV/ELJhbzeAcSszcuFtQZX569LWSG7656udf
	AiyxJNW/loaqf9yKXmgh92ED8eaBqoI91xLtIHuuO2nVbCc33ZJDa3mNTZC1vePYVEc/+Z
	ehH9Tp4AlPFrmq92QFHTJ0xDNevhYO+LQnCYHEUOwgqwz3Td4Setqol18ekUEg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 3/3] arm64: dts: mba8xx: Remove invalid propert
Date: Tue, 25 Feb 2025 11:27:23 +0100
Message-ID: <20250225102726.654070-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022800_208171_2049E605 
X-CRM114-Status: UNSURE (   9.94  )
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

disable-gpio is an (old) downstream kernel property, which slipped into
DT. Remove it.

Fixes: c01a26b8897a ("arm64: dts: mba8xx: Add PCIe support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/mba8xx.dtsi b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
index 117f657283191..c4b5663949ade 100644
--- a/arch/arm64/boot/dts/freescale/mba8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8xx.dtsi
@@ -328,7 +328,6 @@ &pcieb {
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
 	reset-gpios = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
-	disable-gpio = <&expander 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie_1v5>;
 	status = "okay";
 };
-- 
2.43.0


