Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B007D10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rwea67uy2jIokoFQFq/C5FAz7zmhPEtMvXbqK3IJZg0=; b=1nsNQn0sfwMbz6SyoYC2c5Z0tv
	SCme1PsPGgLTVQErNAj/oMd+QwDKUKtxb6O3l+A905GG1IEaDUw/cHddxJSI8aYYL69kBLjKDKvvW
	ARheOWTi0fimhK3O98cWOV0zBITvJRsOcbBb1NEbEln6/nWseKc9hZ+Egaq8HDtgOPwNEmxcVw8z3
	QVQcnIzebqfFNE+UJOOpvq+NiwiSjlce2HTHIb3HMwWHSkPi4sB97ik1Dhx+nD/oe7Dbtl4m31pqI
	ajH67nDvDpne+9tfCXFCbDjpbbkbInWUEnbBNqxzsuKbKpze+vzXRxXlSzNVBs/clsryckoAEmVE1
	YUOPYBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0p0-00000005Hfc-371t;
	Mon, 02 Dec 2024 07:26:18 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0kB-00000005GPa-1cYq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Rwea67uy2jIokoFQFq/C5FAz7zmhPEtMvXbqK3IJZg0=; b=U3mHkCleMFRSq3Le45APSeNpcX
	+/gGAmE0DNAKr+/CMhDgllW/+nHTzQ3HgYFcow1xf0pWZavBdsJaPS5aYSIIy3e3Wi0o9DvD9fTNf
	JpEWgE5lZ7D1Lvsf7W2bdnb0iZ79t2U7fPYSopTA1jX5pvKarlnULQC/1b/zt7/JTgc92HoFAHuxg
	QMfD1uCfXwKG2psuCKxZtZAYfXR+n2RG5o1rHb/4epYhCC+hky2xU9M2RaYFF3qgNSLWq5AcP4uWP
	lZRkFkY5nuhA9RpFaQ1/qxq/zsUMMHEt/lGtdHPXRWWlvHoblOJb6dBvhPOpWLGBtqKuTJSrvgv76
	g7sNCiGQ==;
Received: from [89.212.21.243] (port=53766 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tI0k5-007Bva-0N;
	Mon, 02 Dec 2024 08:21:13 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 04/15] arm64: dts: imx8mm-phycore-som: Assign regulator for dsi to lvds bridge
Date: Mon,  2 Dec 2024 08:20:41 +0100
Message-Id: <20241202072052.2195283-5-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202072052.2195283-1-andrej.picej@norik.com>
References: <20241202072052.2195283-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_232119_600599_7117E08A 
X-CRM114-Status: UNSURE (   6.00  )
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

From: Yashwanth Varakala <y.varakala@phytec.de>

Add a missing voltage regulator of 1.8v to the sn65dsi83
(dsi_lvds bridge) node. Due to the absence of this regulator, a fallback
dummy regulator is used and that triggers a warning message from the
kernel. Assigning the appropriate regulator avoids the warning.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v2:
 - no change
---
 arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 8de5a46512b0..7e859c65317a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -286,6 +286,7 @@ sn65dsi83: bridge@2d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_sn65dsi83>;
 		reg = <0x2d>;
+		vcc-supply = <&reg_vdd_1v8>;
 		status = "disabled";
 	};
 
-- 
2.34.1


