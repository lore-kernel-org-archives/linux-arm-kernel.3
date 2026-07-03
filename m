Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45703C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0YKAhBBa9PGx36rHtTdnpndz/n8JA20wp16kInv0jHQ=; b=EqOMprKtqfMYF/+cbLt4Y2qD/P
	9lUxoNBxgt87//GVXEzKazCTr+2CfAoUZWfqP9C7tRbMs2HUAHeEwgFzBqh+nLPN3Tp+g5gLiTxgf
	ndOXZ67oqkZyceLDkTZJvXCqDLx4gUKZxmFq7Hio2hh/r9QDwFU4gYbhHiJTJ0IxygLPIe4HEQLbp
	it+hfQtVscB1gBNcPkCL1aEcgJOx1jCZz33nthsY7rANSCWVbtNl4U/8T4wZ4AbHZaK13Q7JBOqtb
	Stla2NMOu7AO4c+SEm0M3AiyB3Fk8ZjMso7kt4EaBNSIcOWiz9Umomi+HZyCk9AaFD0QQB24BGM9n
	DEQGwM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffTl-00000007MRF-3WbD;
	Fri, 03 Jul 2026 15:06:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffTi-00000007MQb-3orf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 15:06:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-46ed4f66256so611178f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783091213; x=1783696013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YKAhBBa9PGx36rHtTdnpndz/n8JA20wp16kInv0jHQ=;
        b=LFdpZdhvMTHYsP+uA9HJBU1q0BvzshyN6fr5DXuCift4fDvNq95drgIyRqfy+Nt+eg
         f9Z14LJJSyoU1RX7z6NdqXUqFrCMFZApxZOnTOQBye0hlij/JeDYF2hluHz7+QGhJPgy
         bI7+3s9vlVtXRvjnHGOLqQtJw7PUMBY6oMNx3+rWhLTlLjhAysGVghtuvZ7pDuoMNovD
         XDAO1QMV4eQIuQCo/jFKtq9gyrWKyrmkp75cmqmm09fzxoT+wz6v0MILP8leYTfNFsDs
         4dfFP8ODVAeHU1nD9v7XDE/htnhimDpJ5qFO8QX6E7L3/ZYtKk9bKWSuz8h2BS7L1U5Y
         fTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091213; x=1783696013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YKAhBBa9PGx36rHtTdnpndz/n8JA20wp16kInv0jHQ=;
        b=oDvFE++tgHRbZxiguo8B9RNdoBOKI816J5l7yJsMbqWvzEyIDpUyzTeGO8pufcWpho
         NJdFtGwdtVxyq96NH/rzIPoeJf9vRTst0w/xUVv6tc4NCq5J3mVzW+Z5Cp7G03jnGm66
         RR6dIo2yzKyV+8QF9ZqU4ZcqAlFrvSmwK6dlyFV5tdUa3W8dFyAg3v5zg4dqJdvxf4q7
         Zv699NlEI3TFvh/tlzLHmgkti5dJDvygrFvnptWho3DrfrHcboGum6r8jsPCGzLfNJgA
         US604zxmW9az2DtAoBQDvFpnjijOR8Dbe9hpG9ZeK08lgD2RYj5yWWbxP5Tl7p5UmUxh
         1pMg==
X-Forwarded-Encrypted: i=1; AHgh+Rqy4syYxe8YXw2svACErgB9PPnuSuOEZggfVeBvcG84YwKblPrIYqdlZeQwFBX2CEFidVubhnM1mMlAYiqt9vzV@lists.infradead.org
X-Gm-Message-State: AOJu0YyOBPy3h/w562fRRAahK8f8BJJjph5W0Q4PEkgcOQ+P9W4FJXAz
	jdQAIBNekhIvzzZan/b+/0lJpT1laQ8WrkOZSCbvhNXktIxfOQntp/8e
X-Gm-Gg: AfdE7cm9dQd6+yy3FSEF/wfF3fUzvfTZw2SM7gT7YBwVSojno8Dw+LYS62+2xaFxHzO
	fOcrQVbEiDbVXiuf8iQEFGOTnwgAu/KxsmxrbwUyBjFKqRMgxFqWIsx1cVFCN9WG10yKcByAAc9
	whiXwhEMSs9kaapy8eVcaFAdzapRg/KCh213kRzFWp8dYwMmyZQnNywQUK/ogG+d1GDLMtwzT5h
	x1lr0Q8uzSg1cEE2kdmbzBqhcdmKtlhwzXrbpErE/enPAyvdjLru44hhnlyz//M9wu9WeV8DQDF
	83qONUhb72H47qERoBqrCr+NSWGgWNQgpLZcJWjmm09174/qxgeqv4HyvPF/anWJJU3yS1fL3OZ
	QC/NF5+2WyNu2ml1V8zA3oQflZqmd8TqCqSo5kdgYO9tjgD2gVRPW4Ge/xWQeJah6/H4IofOt6F
	aOuhHf6LY24fW0fP5Fw5HeN5Y5BXnB4t0cqcy9YIRyKpquuHTvLRnNw74u6LuvlpVLI7oBcV59w
	V1UBenLL3c/VonvMYNAQoHTRT4=
X-Received: by 2002:a5d:540f:0:b0:475:f0d1:eb70 with SMTP id ffacd0b85a97d-4775d519803mr11861130f8f.61.1783091213061;
        Fri, 03 Jul 2026 08:06:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm9487f8f.2.2026.07.03.08.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:06:52 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 1/1] arm64: dts: freescale: imx95-var-dart: enable NETC block control
Date: Fri,  3 Jul 2026 17:06:49 +0200
Message-ID: <20260703150649.234680-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_080654_953438_64CA9C7C 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the NETC and NETCMIX block control nodes on the DART-MX95 SoM.

These block control nodes are required to enable and use the NETC
Ethernet ports.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Also enable the NETCMIX block control node

 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index d43270a1d907..b4c55bd33858 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -178,6 +178,10 @@ &mu7 {
 	status = "okay";
 };
 
+&netc_blk_ctrl {
+	status = "okay";
+};
+
 &netc_emdio {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emdio>, <&pinctrl_phy0res>;
@@ -215,6 +219,10 @@ &netc_timer {
 	status = "okay";
 };
 
+&netcmix_blk_ctrl {
+	status = "okay";
+};
+
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
-- 
2.47.3


