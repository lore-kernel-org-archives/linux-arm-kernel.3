Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF38C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 04:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gcKyz+Pj1YQ810JfBTl/e+ixHjM51/SdjsZxMjmnDM=; b=XPB9yGQuT9G389KtkhsKTz6pOE
	wDuI7mxjYFCSVQU3SZK6yNyjHwWnLSyps4OAtG9xq7BaW7q+6tNxhVMisfS1SrYf7/0jHZKcwQHlI
	ZWQrfRUepbLn2QbvmYGYBogALlRLVnxz9seegGGA5LP5TbNA3patDSblH5F+gfCtvkKJcvDzoRHCG
	N1yU66bTAggcmOj88T4SpbQw3a+g4H27KcjOmAK+ghGHUstfk23Tuz+H2mCE2AZeAwDeTDoNguOHQ
	DYyWldoJ6dwLMPYEw8qDff5SRDFDCGmPmdebYNNTMd2qM2RF3Rcx7jrXG2q4va3ftLFt3ngPLrNmn
	KhX0+fRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YH1-00000004UBj-0QbE;
	Tue, 15 Apr 2025 04:51:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4XzE-00000004RoC-0hoK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 04:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9gcKyz+Pj1YQ810JfBTl/e+ixHjM51/SdjsZxMjmnDM=; b=JgO/att9Gaa9mqJeevQnhTqduz
	H+qHdNb4xHm7pRvsG4nA59ei5x27lynOfbEZRdSkkfMvZSAVKcCu9pTA4wwQTj5qyZlRA48n3iDa/
	3whZAw759Tz8c76SN+G12c8b/n3bOmf7fZI0Dn23hew+Es5Ti1cgknkSg5tWCDf82h4TYH4u4AiMK
	HG7IlQzaXhvBpQz94IeoebcyD3k2RY+Nvl1RCqGarSS9KARooXIjjy5wHmC2JmKdNEMq8DQCcCG5c
	bEnSYt+YNHPehCudK7DYETCAeCxhC3JrKl8+VMT3GbWo9mW98a9cSm3llz1yskLhn7AsutK4IQ/6e
	CwAztA2A==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4Xz8-00000009olB-0PDC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 04:33:26 +0000
Received: from [89.212.21.243] (port=52324 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1u4Xz5-00Gb4I-16;
	Tue, 15 Apr 2025 06:33:18 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 07/15] arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card write-protect
Date: Tue, 15 Apr 2025 06:33:03 +0200
Message-Id: <20250415043311.3385835-8-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415043311.3385835-1-primoz.fiser@norik.com>
References: <20250415043311.3385835-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_053324_008930_1E46415D 
X-CRM114-Status: UNSURE (   6.03  )
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

Add disable-wp flag (write-protect) to usdhc2 node (SD-card) to get rid
of the following kernel boot warning:

  host does not support reading read-only switch, assuming write-enable

Micro SD cards can't be physically write-protected like full-sized
cards anyways.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit message

 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 902b523fc92c..3d5cd0561362 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -48,6 +48,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
 	bus-width = <4>;
 	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	no-mmc;
 	no-sdio;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-- 
2.34.1


