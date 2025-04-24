Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE94C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rcwqw7rvpMYh9IpE8HSGeLIOn0eztB1Pd8t0+4Nts04=; b=XA+fZuS4XZolTJ1zZiGyLFbr5m
	hOg7+KlSQDVa2D3jzfki4UZyfVoaQN8m4tbFItQItARfYpIJ87fOVvySdMASfyQoWNm5Tz5Szx69G
	j6rEO7hiUBD67ZhycSxs/0TV4PX6Sb0sa1L8xK6dNRzZQnsO6ohp2h3jFk1D94iBqe17mT3P59qZx
	vuhGo96RX0CTmLw0XGBkTkcGxYCRPPApzZ5rYXhp/0RZUnK8suBdJXvFL0bhbpwkpojIz1H8eOhfq
	ZF3Cc8F/ZsLlqt+1QCmt7s1GHxd+yQcpIsUs6Y6f7yxf9k32X2wbsawGQw0gG81bIivTkbiSYujeB
	DC7gcVdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rNa-0000000DFlO-0Rh2;
	Thu, 24 Apr 2025 07:52:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7rLc-0000000DFYF-21Qf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 07:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Rcwqw7rvpMYh9IpE8HSGeLIOn0eztB1Pd8t0+4Nts04=; b=Qa3dT4gW8NQSgTCCH8ny/PR3nw
	SFvbKyWxb3fX/S1EnhuHGDNe9+MVskr6d6ZBGLLMv+mVrvpA9T7zExjbIJK8AqLvqk2VdTm2zCkv9
	XdSMYCYgZxF1JTxsNP7eiPYsoe4CUN19RPHcHAbzMN83OqkGmBKaAQd01WCItkeMSOaO5xeFXLvWw
	P8mwfHxQkWJX6IltORlh0fipJ+/phDofS6cNgcbsXdj/lsXq9d06tu8I+3384exNmlDoqvHbeUtBO
	aHDf4kFWBdrXyEJQ3Md7assSVJSXbocFjEV4eGJUvsexdhoKXyNmsuXlmQxJVTBynopF4sRFZxlJG
	Je9wy3mA==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7rLZ-0000000BaDu-1EK1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745481013; x=1777017013;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rcwqw7rvpMYh9IpE8HSGeLIOn0eztB1Pd8t0+4Nts04=;
  b=mXrC3DQMS7PXBnUkLhe/ixFWOQvHXmacphzhOGzU0P8N+Z5JonpM9TEp
   W1jTJx9jPYBmCwCl6h93Lm4idHEa9SXuLBv0dl+BXyqReNXjvwvva0HP9
   HSI1Cpov1wjFD888anJmRHr9/tkplEYlaBEuEsJCDJmLdLpgviJsDZYsN
   KCUAmdluOkQEBN5p3rstJVii+6mXsR5YfX9a29i8aCayvjzMLsVxtBSaA
   3eB8ARVxaKSjVHRCoTAehgHVtXKKyQ74xsYFEbuXgqy2/1LlY9AXRJxGo
   WqWIDRThs1xt3DRr5tEKGJfXPj5n+fngzqVD1B2vQASltQnL+8TpWDINT
   g==;
X-CSE-ConnectionGUID: 45SGrGlIT+WzhyFrR6hCtQ==
X-CSE-MsgGUID: rPw/yKINRCGYTpmwzm1fxA==
X-IronPort-AV: E=Sophos;i="6.15,235,1739833200"; 
   d="scan'208";a="43691469"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Apr 2025 09:50:08 +0200
X-CheckPoint: {6809ED30-13-2417938-F0170C2B}
X-MAIL-CPID: 3625BD89FC92ED8F66117B423DE68433_2
X-Control-Analysis: str=0001.0A006376.6809ED3B.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3ABEC164B42;
	Thu, 24 Apr 2025 09:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745481003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rcwqw7rvpMYh9IpE8HSGeLIOn0eztB1Pd8t0+4Nts04=;
	b=JBCvKpJvgHcY+NT4xxynklYDT+QD5vXN/29a3PCXzb5KRcisaspKVwJmxuK6gNe3iTj1o6
	UCmPVbzhC7dEZcMcnclWLhwlzUusylddyHsfZetmBjlfcT4QC991QLXV0T3F2ZACkUr36i
	t2+2JutJ0RE9uPsY5XhM7lb0iG57D3KZ0snDS7yoSPe+VqFfP28D22/ISny0kPh2p3USc+
	QsEbUY6MV8HHQhDOFSpFxV71KKA37MrfEa22jUHgX38DNc4OcCPy2pGksnxYN1aYXSjIP8
	tKDG79ithp7mOklPelRrJHmTYBGzs60eRIMbVS5T6nDprUdyrP3SRr0Q/tMf7w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/2] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add LVDS device tree overlay
Date: Thu, 24 Apr 2025 09:49:58 +0200
Message-ID: <20250424075000.1263138-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_085013_687769_DFD6B9D1 
X-CRM114-Status: UNSURE (   8.00  )
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

From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>

This adds an overlay for the supported LVDS display tianma tm070jvhg33.
The LVDS interface is the same as for MBa8MPxL so the already existing
overlay can be reused on this platform.

Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2: None

 arch/arm64/boot/dts/freescale/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index eb77eda881e0c..6f87f28f4583e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -247,8 +247,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtbo
+imx8mp-tqma8mpql-mba8mp-ras314-lvds-dtbs += imx8mp-tqma8mpql-mba8mp-ras314.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314-lvds.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-hummingboard-pulse.dtb
-- 
2.43.0


