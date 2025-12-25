Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935F3E7AD67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 20:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vi3fYoG2hoLrn66dkisn+I2NGAkjhVg6/PhlbXDSW0Q=; b=v06nRRmTO/0+Ywfoh6i18qDY1I
	4th+JpoRmOSjgjXMvUt4nWwk6obmkHYfBINngcwOQbARJIDm5g+p/FBEHgtrCnJyuh+45vHNBYLm9
	HN31AdkEbMB/eoCsMMP1XN7Ni6dX80V+V4t6+qi/dY5YOr5ptmycoZX0bXRl2MvqPS78uC9j2hDmT
	EuByLlPWPuSXD/92qTdjaVTS8kXJ87iqL7VII3a4RGx7RhlUY+3ucV+0itPCXYuFMCW6LeUDLkP+P
	qku823OQzHl9Q6V9d1zQo6eAqitpewvKPF7oYXYY0u4tFR238axquq1D6CGr7du8Ge2wohAjFX+Cp
	O90+MMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0K-00000000flK-0adn;
	Thu, 25 Dec 2025 20:32:12 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0H-00000000fkV-0TLA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 20:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766694727; bh=L2ODFCEIWrcpVeNIcspviFyOkd8/UWF55hgBt4ycF28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2CqD6rvPdP67aQEqn7SQygNFoCQ1LPhgDoe3kyKnG0HNK0Xqhy6rg4e+NHm1yK+2
	 +xe2WY5ksHjEfYCpb1WHVECwsk/pRxnYG27GgYxZOsn/8IcXMy1cd8uPjYFb1BUB6s
	 daqqYTNHPCEAcFtGllcp+Ojt1aJjym7/wQAJsniAZiDr15e2INopdlXzp1TEDrUsn3
	 UedPVGtlUPHEhRjueu89q9RLFeCOT37pyQGRMtXZh4hfPY9/JeHPdnq12AUWkIOi6s
	 Z2TFlEItZMg/a8ZOluH6mM7BKCk4BUYUwPcqhcpQwQHdlyjOvGheQ29W3zyGyzVqwL
	 Mg7CsMzsT9Psg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9EC023E8CBC;
	Thu, 25 Dec 2025 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766694727; bh=L2ODFCEIWrcpVeNIcspviFyOkd8/UWF55hgBt4ycF28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2CqD6rvPdP67aQEqn7SQygNFoCQ1LPhgDoe3kyKnG0HNK0Xqhy6rg4e+NHm1yK+2
	 +xe2WY5ksHjEfYCpb1WHVECwsk/pRxnYG27GgYxZOsn/8IcXMy1cd8uPjYFb1BUB6s
	 daqqYTNHPCEAcFtGllcp+Ojt1aJjym7/wQAJsniAZiDr15e2INopdlXzp1TEDrUsn3
	 UedPVGtlUPHEhRjueu89q9RLFeCOT37pyQGRMtXZh4hfPY9/JeHPdnq12AUWkIOi6s
	 Z2TFlEItZMg/a8ZOluH6mM7BKCk4BUYUwPcqhcpQwQHdlyjOvGheQ29W3zyGyzVqwL
	 Mg7CsMzsT9Psg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 288393E8B7A;
	Thu, 25 Dec 2025 20:32:07 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND 2/2] ARM: dts: lpc32xx: add DMA properties to NAND flash controllers
Date: Thu, 25 Dec 2025 22:31:57 +0200
Message-ID: <20251225203157.1414349-3-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225203157.1414349-1-vz@mleia.com>
References: <20251225203157.1414349-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251225_203207_665090_E41E946D 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20251225_203207_665090_E41E946D': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_203207_665090_E41E946D 
X-CRM114-Status: GOOD (  10.41  )
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

Add descriptions of DMA request signals for SLC and MLC NAND flash
controllers, for reference see Table 69 from NXP LPC32x0 User Manual.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index a49b8e794126..9107476fd071 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -67,6 +67,8 @@ slc: nand-controller@20020000 {
 			reg = <0x20020000 0x1000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_SLC>;
+			dmas = <&dma 1 0>;
+			dma-names = "rx-tx";
 			status = "disabled";
 		};
 
@@ -75,6 +77,8 @@ mlc: nand-controller@200a8000 {
 			reg = <0x200a8000 0x11000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_MLC>;
+			dmas = <&dma 12 0>;
+			dma-names = "rx-tx";
 			status = "disabled";
 		};
 
-- 
2.43.0


